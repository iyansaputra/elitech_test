<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use App\Models\Transaction;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    // ======================================================
    // Generate Kode Transaksi
    // ======================================================
    private function generateKodeTransaksi()
    {
        $year = date('Y');
        $month = date('m');

        $last = Transaction::where('kode_transaksi', 'like', "TRX/$year/$month/%")
                ->orderBy('id', 'desc')
                ->first();

        if (!$last) {
            $number = 1;
        } else {
            $lastNumber = (int) substr($last->kode_transaksi, -4);
            $number = $lastNumber + 1;
        }

        $num = str_pad($number, 4, '0', STR_PAD_LEFT);

        return "TRX/$year/$month/$num";
    }

    // ======================================================
    // Create Transaction (Masuk / Keluar)
    // ======================================================
    public function store(Request $request)
    {
        $request->validate([
            'type' => 'required|in:in,out',
            'item_id' => 'required|exists:items,id',
            'qty' => 'required|integer|min:1',
            'keterangan' => 'nullable'
        ]);

        $item = Item::findOrFail($request->item_id);

        // Stok logic
        if ($request->type == 'in') {
            $item->stok += $request->qty;
        } else {
            if ($item->stok < $request->qty) {
                return response()->json(['message' => 'Stok tidak mencukupi'], 400);
            }
            $item->stok -= $request->qty;
        }

        $item->save();

        // Simpan transaksi
        $trx = Transaction::create([
            'kode_transaksi' => $this->generateKodeTransaksi(),
            'type' => $request->type,
            'item_id' => $request->item_id,
            'qty' => $request->qty,
            'keterangan' => $request->keterangan,
            'tanggal' => date('Y-m-d'),
        ]);

        return response()->json($trx, 201);
    }

    // List semua transaksi
    public function index()
    {
        return Transaction::with('item')->orderBy('id', 'desc')->paginate(10);
    }

    public function stockReport(Request $request)
    {
        $from = $request->form ?? '2000-01-01';
        $to = $request->to ?? now();

        $items = Item::all()->map(function ($item) use ($from, $to) {

        $stokMasuk = Transaction::where('item_id', $item->id)
                        ->where('type', 'in')
                        ->whereBetween('tanggal', [$from, $to])
                        ->sum('qty');

        $stokKeluar = Transaction::where('item_id', $item->id)
                        ->where('type', 'out')
                        ->whereBetween('tanggal', [$from, $to])
                        ->sum('qty');

        return [
            'kode'        => $item->kode,
            'nama'        => $item->nama,
            'stok_masuk'  => (int) $stokMasuk,
            'stok_keluar' => (int) $stokKeluar,
            'stok_akhir'  => (int) $item->stok,
        ];
    });

    return response()->json($items);
    }

    public function exportCsv()
    {
    $filename = "laporan_stok_" . date('YmdHis') . ".csv";

    $items = Item::all();

    $content = "Kode,Nama,Stok Masuk,Stok Keluar,Stok Akhir\n";

    foreach ($items as $item) {
        $stokMasuk = Transaction::where('item_id', $item->id)->where('type', 'in')->sum('qty');
        $stokKeluar = Transaction::where('item_id', $item->id)->where('type', 'out')->sum('qty');

        $content .= "{$item->kode},{$item->nama},{$stokMasuk},{$stokKeluar},{$item->stok}\n";
    }

    return response($content)
            ->header('Content-Type', 'text/csv')
            ->header('Content-Disposition', "attachment; filename={$filename}");
}

public function dashboardSummary()
{
    $totalItems = Item::count();
    $totalTransactions = Transaction::count();

    $stokMasuk = Transaction::where('type', 'in')->sum('qty');
    $stokKeluar = Transaction::where('type', 'out')->sum('qty');

    return response()->json([
        'total_items'        => $totalItems,
        'total_transactions' => $totalTransactions,
        'total_stok_masuk'   => $stokMasuk,
        'total_stok_keluar'  => $stokKeluar
    ]);
}



}
