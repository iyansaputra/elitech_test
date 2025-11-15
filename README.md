# 📦 Elitech Inventory Management App

**Technical Test – Fullstack Developer (Elitech)**
Aplikasi manajemen stok barang dengan fitur CRUD, transaksi stok masuk/keluar, laporan stok, autentikasi, serta dashboard summary.

Backend dibangun menggunakan **Laravel 12 + Sanctum**, dan frontend menggunakan **Vue.js 3 + Vite + TailwindCSS**.

---

## 🚀 Fitur Utama

### 🔐 **1. Authentication**

* Register
* Login
* Logout
* Protected API menggunakan **Laravel Sanctum**
* Token-based authentication

---

### 📦 **2. Manajemen Barang (CRUD Item)**

* Generate kode item otomatis (`ITM/YYYY/XXXX`)
* Tambah item
* Edit item
* Hapus item
* Validasi form
* Tabel barang modern dan responsif
* Modal tambah dan edit item

---

### 🔄 **3. Transaksi (Stok Masuk & Keluar)**

* Transaksi masuk (IN)
* Transaksi keluar (OUT)
* Validasi stok agar tidak minus
* Update stok otomatis
* Generate kode transaksi (`TRX/YYYY/MM/XXXX`)
* Tabel transaksi lengkap + relasi item

---

### 📊 **4. Dashboard Summary**

* Total Items
* Total Transaksi
* Total Stok Masuk
* Total Stok Keluar
  Ditampilkan dalam bentuk **stats card modern** menggunakan TailwindCSS.

---

### 📑 **5. Laporan Stok**

* Ringkasan stok akhir semua item
* Menampilkan:

  * Stok masuk
  * Stok keluar
  * Stok akhir
* Export CSV:

```
GET /api/report/stock/export
```

---

## 🛠️ Tech Stack

### **Backend**

* Laravel 12.x
* Laravel Sanctum
* MySQL
* Eloquent ORM
* Validation + Middleware
* RESTful API

### **Frontend**

* Vue.js 3 Composition API
* Vue Router
* Axios
* TailwindCSS 4
* Vite

---

## 📥 Instalasi & Setup

---

## ⚙️ **Backend (Laravel)**

### 1️⃣ Clone repository

```sh
git clone https://github.com/iyansaputra/elitech_test.git
cd elitech_backend
```

### 2️⃣ Install dependencies

```sh
composer install
```

### 3️⃣ Copy environment

```sh
cp .env.example .env
```

Atur database:

```
DB_DATABASE=elitech
DB_USERNAME=root
DB_PASSWORD=
```

### 4️⃣ Generate app key

```sh
php artisan key:generate
```

### 5️⃣ Migrasi database

```sh
php artisan migrate
```

### 6️⃣ Jalankan backend

```sh
php artisan serve
```

Backend berjalan di:

```
http://127.0.0.1:8000
```

---

## 🌐 **Frontend (Vue.js)**

### 1️⃣ Masuk ke folder frontend

```sh
cd elitech_frontend
```

### 2️⃣ Install dependencies

```sh
npm install
```

### 3️⃣ Jalankan server

```sh
npm run dev
```

Frontend berjalan di:

```
http://127.0.0.1:5173
```

---

## 📘 API Documentation (Ringkas)

### 🔐 Authentication

| METHOD | URL           | DESCRIPTION   |
| ------ | ------------- | ------------- |
| POST   | /api/register | Register      |
| POST   | /api/login    | Login (token) |
| POST   | /api/logout   | Logout        |

---

### 📦 Items

| METHOD | URL             | DESCRIPTION |
| ------ | --------------- | ----------- |
| GET    | /api/items      | List items  |
| POST   | /api/items      | Create item |
| GET    | /api/items/{id} | Detail item |
| PUT    | /api/items/{id} | Update item |
| DELETE | /api/items/{id} | Delete item |

---

### 🔄 Transactions

| METHOD | URL               | DESCRIPTION      |
| ------ | ----------------- | ---------------- |
| GET    | /api/transactions | List transaksi   |
| POST   | /api/transactions | Create transaksi |

---

### 📑 Stock Report

| METHOD | URL                      | DESCRIPTION |
| ------ | ------------------------ | ----------- |
| GET    | /api/report/stock        | Report stok |
| GET    | /api/report/stock/export | Export CSV  |

---

## 🧱 Struktur Project

### Backend

```
app/
 ├─ Http/
 │   ├─ Controllers/
 │   │   ├─ AuthController.php
 │   │   ├─ Api/
 │   │   │   ├─ ItemController.php
 │   │   │   ├─ TransactionController.php
 │   │   │   └─ DashboardController.php
 │   ├─ Middleware/
 │   └─ Kernel.php
 ├─ Models/
 │   ├─ Item.php
 │   └─ Transaction.php
database/
 ├─ migrations/
```

### Frontend

```
src/
 ├─ router/
 │   └─ index.js
 ├─ views/
 │   ├─ Login.vue
 │   ├─ Dashboard.vue
 │   ├─ Items.vue
 │   ├─ Transactions.vue
 │   └─ StockReport.vue
 ├─ components/
 │   ├─ AddItemModal.vue
 │   ├─ EditItemModal.vue
 │   └─ AddTransactionModal.vue
 ├─ layouts/
 │   └─ MainLayout.vue
 └─ plugins/
     └─ axios.js
```

---

## 👤 Author

**Yan Saputra**
Fullstack Developer Candidate

---
