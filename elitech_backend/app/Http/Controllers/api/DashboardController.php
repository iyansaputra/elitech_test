<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use App\Models\Transaction;

class DashboardController extends Controller
{
public function summary()
{
    return response()->json([
        'total_items'         => Item::count(),
        'total_transactions'  => Transaction::count(),
        'total_stok_masuk'    => Item::sum('stok'),
        'total_stok_keluar'   => 0,
    ]);
}

}
