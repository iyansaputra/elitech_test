<script setup>
import { useRouter } from "vue-router";
import api from "../plugins/axios";

const router = useRouter();

const logout = async () => {
  try {
    await api.post("/logout");
  } catch (_) {}

  localStorage.removeItem("token");
  router.push("/login");
};
</script>

<template>
  <aside
    class="flex w-64 flex-col overflow-y-auto bg-gray-900 text-white"
  >
    <div class="flex h-20 items-center justify-center border-b border-gray-700">
      <div class="text-center">
        <span class="text-3xl font-extrabold text-white">Elitech</span>
        <span class="block text-xs font-medium text-blue-400"
          >TECHNOVISION</span
        >
      </div>
    </div>

    <nav class="flex-1 space-y-2 p-4">
      <router-link
        to="/app/dashboard"
        class="nav-link-item"
        active-class="active"
      >
        <svg
          class="h-6 w-6"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6-4h.01M12 12h.01M12 16h.01M21 12c0 4.418-4.03 8-9 8s-9-3.582-9-8c0-4.418 4.03-8 9-8s9 3.582 9 8z"
          ></path>
        </svg>
        <span class="font-medium">Dashboard</span>
      </router-link>

      <router-link to="/app/items" class="nav-link-item" active-class="active">
        <svg
          class="h-6 w-6"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"
          ></path>
        </svg>
        <span class="font-medium">Master Barang</span>
      </router-link>

      <router-link
        to="/app/transactions"
        class="nav-link-item"
        active-class="active"
      >
        <svg
          class="h-6 w-6"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M8 7h12m0 0l-4-4m4 4l-4 4m-4 4H4a2 2 0 01-2-2V7a2 2 0 012-2h4"
          ></path>
        </svg>
        <span class="font-medium">Transaksi</span>
      </router-link>

      <router-link to="/app/report" class="nav-link-item" active-class="active">
        <svg
          class="h-6 w-6"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M9 17v-2m3 2v-4m3 4v-6m2 10H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
          ></path>
        </svg>
        <span class="font-medium">Laporan Stok</span>
      </router-link>
    </nav>

    <div class="p-4">
      <button
        @click="logout"
        class="flex w-full items-center space-x-3 rounded-lg px-3 py-2 text-left text-gray-300 transition-colors hover:bg-red-600 hover:text-white"
      >
        <svg
          class="h-6 w-6"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"
          ></path>
        </svg>
        <span class="font-medium">Logout</span>
      </button>
    </div>
  </aside>
</template>

<style scoped>
/* Kita buat jadi 'scoped' agar tidak bocor.
Kita gunakan @apply di sini agar <template> lebih bersih.
*/

.nav-link-item {
  @apply flex items-center space-x-3 rounded-lg px-3 py-2 text-gray-300 transition-colors hover:bg-gray-700 hover:text-white;
}

.active {
  @apply bg-blue-600 text-white;
}
</style>
