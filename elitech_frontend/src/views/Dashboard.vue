<script setup>
import { ref, onMounted } from "vue";
import api from "../plugins/axios";

const loading = ref(true);
const summary = ref({});

onMounted(async () => {
  const res = await api.get("/dashboard/summary");
  summary.value = res.data;
  loading.value = false;
});
</script>

<template>
  <div class="p-8">
    <h2 class="text-3xl font-bold mb-8 text-gray-800">Dashboard</h2>

    <div v-if="loading" class="text-center text-gray-600 text-lg">
      Loading...
    </div>

    <div
      v-else
      class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6"
    >
      <div class="stat-card">
        <div class="stat-icon bg-blue-100 text-blue-600">
          <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"
            ></path>
          </svg>
        </div>
        <span class="stat-title">Total Items</span>
        <span class="stat-value">{{ summary.total_items }}</span>
      </div>

      <div class="stat-card">
        <div class="stat-icon bg-indigo-100 text-indigo-600">
          <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M8 7h12m0 0l-4-4m4 4l-4 4m-4 4H4a2 2 0 01-2-2V7a2 2 0 012-2h4"
            ></path>
          </svg>
        </div>
        <span class="stat-title">Transaksi</span>
        <span class="stat-value">{{ summary.total_transactions }}</span>
      </div>

      <div class="stat-card">
        <div class="stat-icon bg-green-100 text-green-600">
          <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"
            ></path>
          </svg>
        </div>
        <span class="stat-title">Stok Masuk</span>
        <span class="stat-value">{{ summary.total_stok_masuk }}</span>
      </div>

      <div class="stat-card">
        <div class="stat-icon bg-red-100 text-red-600">
          <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"
            ></path>
          </svg>
        </div>
        <span class="stat-title">Stok Keluar</span>
        <span class="stat-value">{{ summary.total_stok_keluar }}</span>
      </div>
    </div>
  </div>
</template>

<style scoped>
.stat-card {
  @apply flex flex-col rounded-xl bg-white p-16 shadow-lg transition-all duration-300 hover:shadow-xl;
}

.stat-icon {
  @apply mb-6 flex h-16 w-16 items-center justify-center rounded-full;
}

.stat-icon svg {
  @apply h-8 w-8;
}

.stat-title {
  @apply mb-2 text-sm font-medium text-gray-500;
}

.stat-value {
  @apply text-5xl font-bold text-gray-900;
}
</style>