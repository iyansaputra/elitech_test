<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\ItemController;
use App\Http\Controllers\Api\TransactionController;
use App\Http\Controllers\Api\DashboardController;

// === AUTH ===
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login',    [AuthController::class, 'login']);

// === PROTECTED ROUTES ===
Route::middleware('auth:sanctum')->group(function () {

    // user profile
    Route::get('/user', [AuthController::class, 'user']);
    Route::post('/logout', [AuthController::class, 'logout']);

    // items CRUD
    Route::apiResource('items', ItemController::class);

    // transaksi CRUD
    Route::get('/transactions', [TransactionController::class, 'index']);
    Route::post('/transactions', [TransactionController::class, 'store']);
    Route::get('/report/stock', [TransactionController::class, 'stockReport']);
    
    // frontend
    Route::get('/dashboard/summary', [DashboardController::class, 'summary']);

});

    // export CSV
    Route::get('/report/stock/export', [TransactionController::class, 'exportCsv']);