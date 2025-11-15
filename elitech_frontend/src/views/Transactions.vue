<script setup>
import { ref, onMounted } from "vue";
import api from "../plugins/axios";

import AddTransactionModal from "../components/AddTransactionModal.vue";

const transactions = ref([]);
const loading = ref(true);

const showAddModal = ref(false);

// Fetch transactions
const fetchTransactions = async () => {
  loading.value = true;
  const res = await api.get("/transactions");
  transactions.value = res.data.data ?? res.data; // support pagination / non-paginated
  loading.value = false;
};

onMounted(() => {
  fetchTransactions();
});
</script>

<template>
  <div class="p-8">
    <div class="mb-8 flex items-center justify-between">
      <h2 class="text-3xl font-bold text-gray-800">Transaksi</h2>
      <button
        @click="showAddModal = true"
        class="flex items-center space-x-2 rounded-lg bg-blue-600 px-4 py-2.5 text-sm font-semibold text-white shadow-lg transition-colors hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
      >
        <svg
          class="h-5 w-5"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 20 20"
          fill="currentColor"
        >
          <path
            fill-rule="evenodd"
            d="M10 3a1 1 0 011 1v4h4a1 1 0 110 2h-4v4a1 1 0 11-2 0v-4H5a1 1 0 110-2h4V4a1 1 0 011-1z"
            clip-rule="evenodd"
          />
        </svg>
        <span>Tambah Transaksi</span>
      </button>
    </div>

    <div v-if="loading" class="text-center text-gray-600">
      Loading data transaksi...
    </div>

    <div
      v-else
      class="overflow-hidden rounded-lg border border-gray-200 bg-white shadow-lg"
    >
      <table class="w-full">
        <thead class="bg-gray-50">
          <tr>
            <th class="th-cell">Kode</th>
            <th class="th-cell">Item</th>
            <th class="th-cell">Tipe</th>
            <th class="th-cell">Jumlah (Qty)</th>
            <th class="th-cell">Tanggal</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
          <tr v-for="trx in transactions" :key="trx.id" class="hover:bg-gray-50">
            <td class="td-cell">{{ trx.kode_transaksi }}</td>
            <td class="td-cell">{{ trx.item?.nama }}</td>
            <td class="td-cell">
              <span
                :class="
                  trx.type === 'in'
                    ? 'badge bg-green-100 text-green-800'
                    : 'badge bg-red-100 text-red-800'
                "
              >
                {{ trx.type === 'in' ? 'MASUK' : 'KELUAR' }}
              </span>
            </td>
            <td class="td-cell">{{ trx.qty }}</td>
            <td class="td-cell">{{ trx.tanggal }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <AddTransactionModal
      v-if="showAddModal"
      @close="showAddModal = false"
      @saved="
        fetchTransactions();
        showAddModal = false;
      "
    />
  </div>
</template>

<style scoped>
.th-cell {
  @apply p-4 text-left text-sm font-semibold uppercase tracking-wider text-gray-600;
}
.td-cell {
  @apply whitespace-nowrap p-4 text-gray-700;
}
.badge {
  @apply rounded-full px-3 py-1 text-xs font-medium;
}
</style>
