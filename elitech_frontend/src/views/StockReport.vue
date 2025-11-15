<script setup>
import { ref, onMounted } from "vue";
import api from "../plugins/axios";

const report = ref([]);
const loading = ref(true);

// Fetch report
const fetchReport = async () => {
  loading.value = true;
  const res = await api.get("/report/stock");
  report.value = res.data;
  loading.value = false;
};

// Export CSV
const exportCsv = () => {
  const token = localStorage.getItem("token");
  window.open(`http://127.0.0.1:8000/api/report/stock/export?token=${token}`, "_blank");
};


onMounted(() => {
  fetchReport();
});
</script>

<template>
  <div class="p-8">
    <div class="mb-8 flex items-center justify-between">
      <h2 class="text-3xl font-bold text-gray-800">Laporan Stok</h2>
      <button
        @click="exportCsv"
        class="flex items-center space-x-2 rounded-lg bg-green-600 px-4 py-2.5 text-sm font-semibold text-white shadow-lg transition-colors hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2"
      >
        <svg
          class="h-5 w-5"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 20 20"
          fill="currentColor"
        >
          <path
            fill-rule="evenodd"
            d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM6.293 9.293a1 1 0 011.414 0L9 10.586V3a1 1 0 112 0v7.586l1.293-1.293a1 1 0 111.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z"
            clip-rule="evenodd"
          />
        </svg>
        <span>Export CSV</span>
      </button>
    </div>

    <div v-if="loading" class="text-center text-gray-600">
      Loading data laporan...
    </div>

    <div
      v-else
      class="overflow-hidden rounded-lg border border-gray-200 bg-white shadow-lg"
    >
      <table class="w-full">
        <thead class="bg-gray-50">
          <tr>
            <th class="th-cell">Kode</th>
            <th class="th-cell">Nama</th>
            <th class="th-cell">Stok Masuk</th>
            <th class="th-cell">Stok Keluar</th>
            <th class="th-cell">Stok Akhir</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
          <tr v-for="r in report" :key="r.kode" class="hover:bg-gray-50">
            <td class="td-cell">{{ r.kode }}</td>
            <td class="td-cell">{{ r.nama }}</td>
            <td class="td-cell font-bold text-green-700">
              {{ r.stok_masuk }}
            </td>
            <td class="td-cell font-bold text-red-700">
              {{ r.stok_keluar }}
            </td>
            <td class="td-cell font-semibold text-gray-900">
              {{ r.stok_akhir }}
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<style scoped>
.th-cell {
  @apply p-4 text-left text-sm font-semibold uppercase tracking-wider text-gray-600;
}
.td-cell {
  @apply whitespace-nowrap p-4 text-gray-700;
}
</style>