<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $fillable = [
        'kode_transaksi',
        'type',
        'item_id',
        'qty',
        'keterangan',
        'tanggal'
    ];

    public function item()
    {
        return $this->belongsTo(Item::class);
    }
}
