<script setup>
import { ref, onMounted } from "vue";
import api from "../plugins/axios";

const emit = defineEmits(["close", "saved"]);

const items = ref([]);
const item_id = ref("");
const type = ref("in");
const qty = ref(1);
const keterangan = ref("");

// State untuk UI
const loading = ref(false);
const errorMessage = ref("");

// Ambil data item untuk dropdown
onMounted(async () => {
  const res = await api.get("/items");
  items.value = res.data.data ?? res.data;
});

const saveTransaction = async () => {
  loading.value = true;
  errorMessage.value = "";
  try {
    await api.post("/transactions", {
      item_id: item_id.value,
      type: type.value,
      qty: qty.value,
      keterangan: keterangan.value,
    });
    emit("saved");
  } catch (err) {
    errorMessage.value =
      err.response?.data?.message || "Gagal menyimpan transaksi";
  } finally {
    loading.value = false;
  }
};
</script>

<template>
  <div class="modal">
    <div class="modal-box">
      <h3 class="font-bold text-lg mb-6 text-gray-900">Tambah Transaksi</h3>

      <div
        v-if="errorMessage"
        class="rounded-lg bg-red-100 p-3 text-sm text-red-600 mb-4"
      >
        {{ errorMessage }}
      </div>

      <div class="space-y-4">
        <div>
          <label class="label">Pilih Item</label>
          <select v-model="item_id" class="input">
            <option value="">-- Pilih Item --</option>
            <option v-for="i in items" :key="i.id" :value="i.id">
              {{ i.nama }} (stok: {{ i.stok }})
            </option>
          </select>
        </div>

        <div>
          <label class="label">Tipe Transaksi</label>
          <select v-model="type" class="input">
            <option value="in">Masuk</option>
            <option value="out">Keluar</option>
          </select>
        </div>

        <div>
          <label class="label">Jumlah (Qty)</label>
          <input
            type="number"
            v-model="qty"
            class="input"
            placeholder="Jumlah"
          />
        </div>

        <div>
          <label class="label">Keterangan (Opsional)</label>
          <input
            v-model="keterangan"
            class="input"
            placeholder="Contoh: Stok opname"
          />
        </div>
      </div>

      <div class="mt-8 flex justify-end gap-3">
        <button class="btn-secondary" @click="$emit('close')">Batal</button>
        <button
          class="btn-primary"
          @click="saveTransaction"
          :disabled="loading"
        >
          {{ loading ? "Menyimpan..." : "Simpan" }}
        </button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.modal {
  @apply fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50;
}
.modal-box {
  @apply w-full max-w-lg rounded-lg bg-white p-6 shadow-xl;
}
.label {
  @apply mb-1 block text-sm font-medium text-gray-700;
}
.input {
  @apply block w-full rounded-lg border-gray-300 bg-white px-3 py-2.5 text-gray-900 placeholder-gray-500 shadow-sm focus:border-blue-500 focus:ring-blue-500;
}
.btn-secondary {
  @apply rounded-lg bg-gray-200 px-4 py-2 text-sm font-semibold text-gray-800 shadow-sm transition-colors hover:bg-gray-300;
}
.btn-primary {
  @apply rounded-lg bg-blue-600 px-4 py-2 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-blue-700 disabled:bg-blue-300;
}
</style>