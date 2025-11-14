<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();

            $table->string('kode_transaksi')->unique();   
            $table->enum('type', ['in', 'out']);        

            $table->foreignId('item_id')
                  ->constrained('items')
                  ->onDelete('cascade');

            $table->integer('qty');                       
            $table->string('keterangan')->nullable();
            $table->date('tanggal')->default(now());

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
