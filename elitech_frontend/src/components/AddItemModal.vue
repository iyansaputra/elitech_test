<script setup>
import { ref } from "vue";
import api from "../plugins/axios";

const emit = defineEmits(["close", "saved"]);

const nama = ref("");
const stok = ref(0);
const harga = ref(0);

const loading = ref(false);
const errorMessage = ref("");

const saveItem = async () => {
  loading.value = true;
  errorMessage.value = "";
  try {
    await api.post("/items", {
      nama: nama.value,
      stok: stok.value,
      harga: harga.value,
    });
    emit("saved");
  } catch (error) {
    errorMessage.value =
      error.response?.data?.message || "Gagal menyimpan data.";
  } finally {
    loading.value = false;
  }
};
</script>

<template>
  <div class="modal">
    <div class="modal-box">
      <h3 class="font-bold text-lg mb-6 text-gray-900">Tambah Item Baru</h3>

      <div class="space-y-4">
        <div v-if="errorMessage" class="rounded-lg bg-red-100 p-3 text-sm text-red-600">
          {{ errorMessage }}
        </div>

        <div>
          <label class="label">Nama Item</label>
          <input v-model="nama" placeholder="Contoh: Nama Item" class="input" />
        </div>
        <div>
          <label class="label">Stok</label>
          <input v-model.number="stok" type="number" class="input" />
        </div>
        <div>
          <label class="label">Harga</label>
          <input v-model.number="harga" type="number" class="input" />
        </div>
      </div>

      <div class="mt-8 flex justify-end gap-3">
        <button class="btn-secondary" @click="$emit('close')">Batal</button>
        <button class="btn-primary" @click="saveItem" :disabled="loading">
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