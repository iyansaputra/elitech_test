<script setup>
import { useRouter } from "vue-router";
import api from "../plugins/axios";

const router = useRouter();

const logout = async () => {
  try {
    await api.post("/logout"); // backend Sanctum logout
  } catch (_) {}

  localStorage.removeItem("token");
  router.push("/login");
};
</script>

<template>
  <nav class="w-full bg-white shadow px-6 py-3 flex justify-between items-center">
    <h1 class="text-xl font-bold">Elitech App</h1>

    <div class="flex items-center gap-4">
      <router-link to="/app/dashboard">Dashboard</router-link>
<router-link to="/app/items">Items</router-link>
<router-link to="/app/transactions">Transaksi</router-link>
<router-link to="/app/report">Report</router-link>




      <!-- Tombol Logout -->
      <button
        @click="logout"
        class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded"
      >
        Logout
      </button>
    </div>
  </nav>
</template>

<style scoped>
nav a {
  @apply text-gray-700 font-medium;
}
</style>
