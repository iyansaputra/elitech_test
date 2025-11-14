<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    public function index(Request $request)
    {
        $query = item ::query();

        if ($request->search){
            $query->where('nama', 'like', "%{$request->search}%")
                ->orWhere('kode', 'like', "%{$request->search}%");
        }

        return $query->paginate(10);

    }

    // ======================================================
    //   GENERATE KODE ITEM OTOMATIS
    // ======================================================
    private function generateKodeItem()
    {
        $year = date('Y');

        $last = Item::where('kode', 'like', "ITM/$year/%")
                    ->orderBy('id', 'desc')
                    ->first();

        if (!$last) {
            $number = 1;
        } else {
            $lastNumber = (int) substr($last->kode, -4);
            $number = $lastNumber + 1;
        }

        $numberFormatted = str_pad($number, 4, '0', STR_PAD_LEFT);

        return "ITM/$year/$numberFormatted";
    }

    // ======================================================
    //   STORE (create item)
    // ======================================================
    public function store(Request $request)
    {
        $request->validate([
            'nama'   => 'required',
            'stok'   => 'required|integer|min:0',
            'harga'  => 'required|numeric|min:0',
        ]);

        $kode = $this->generateKodeItem();

        $item = Item::create([
            'kode'  => $kode,
            'nama'  => $request->nama,
            'stok'  => $request->stok,
            'harga' => $request->harga,
        ]);

        return response()->json($item, 201);
    }

    // ======================================================
    //   SHOW
    // ======================================================
    public function show(Item $item)
    {
        return $item;
    }

    // ======================================================
    //   UPDATE
    // ======================================================
    public function update(Request $request, Item $item)
    {
        $request->validate([
            'nama'  => 'required',
            'stok'  => 'required|integer|min:0',
            'harga' => 'required|numeric|min:0',
        ]);

        $item->update([
            'nama'  => $request->nama,
            'stok'  => $request->stok,
            'harga' => $request->harga,
        ]);

        return response()->json($item);
    }

    // ======================================================
    //   DELETE
    // ======================================================
    public function destroy(Item $item)
    {
        $item->delete();
        return response()->json(['message' => 'Item deleted']);
    }
}
