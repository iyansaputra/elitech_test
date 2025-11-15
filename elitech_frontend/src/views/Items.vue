<script setup>
import { ref, onMounted } from "vue";
import api from "../plugins/axios";
import AddItemModal from "../components/AddItemModal.vue";
import EditItemModal from "../components/EditItemModal.vue";

const items = ref([]);
const loading = ref(true);

const showAddModal = ref(false);
const showEditModal = ref(false);
const selectedItem = ref(null);

// FETCH ITEMS
const fetchItems = async () => {
  loading.value = true;
  const res = await api.get("/items");
  items.value = res.data.data ?? res.data; 
  loading.value = false;
};

// OPEN EDIT MODAL
const openEditModal = (item) => {
  selectedItem.value = { ...item }; // clone data
  showEditModal.value = true;
};

// DELETE ITEM
const deleteItem = async (id) => {
  if (!confirm("Yakin mau hapus item ini?")) return;

  await api.delete(`/items/${id}`);
  fetchItems();
};

onMounted(() => {
  fetchItems();
});
</script>

<template>
  <div class="p-8">

    <!-- Header -->
    <div class="mb-8 flex items-center justify-between">
      <h2 class="text-3xl font-bold text-gray-800">Master Barang</h2>

      <button
        @click="showAddModal = true"
        class="flex items-center space-x-2 rounded-lg bg-blue-600 px-4 py-2.5 text-sm font-semibold text-white shadow-lg transition hover:bg-blue-700"
      >
        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd"
            d="M10 3a1 1 0 011 1v4h4a1 1 0 110 2h-4v4a1 1 0 11-2 0v-4H5a1 1 0 110-2h4V4a1 1 0 011-1z"
            clip-rule="evenodd" />
        </svg>
        <span>Tambah Item</span>
      </button>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="text-center text-gray-600 text-lg">
      Loading data barang...
    </div>

    <!-- Table -->
    <div
      v-else
      class="overflow-hidden rounded-xl border border-gray-200 bg-white shadow-lg"
    >
      <table class="w-full">
        <thead class="bg-gray-50">
          <tr>
            <th class="p-4 text-left text-sm font-semibold uppercase text-gray-600">
              Kode Barang
            </th>
            <th class="p-4 text-left text-sm font-semibold uppercase text-gray-600">
              Nama Barang
            </th>
            <th class="p-4 text-left text-sm font-semibold uppercase text-gray-600">
              Stok
            </th>
            <th class="p-4 text-left text-sm font-semibold uppercase text-gray-600">
              Harga
            </th>
            <th class="p-4 text-center text-sm font-semibold uppercase text-gray-600">
              Aksi
            </th>
          </tr>
        </thead>

        <tbody class="divide-y divide-gray-200">
          <tr
            v-for="item in items"
            :key="item.id"
            class="hover:bg-gray-50 transition"
          >
            <td class="p-4 text-gray-700">{{ item.kode }}</td>
            <td class="p-4 text-gray-700">{{ item.nama }}</td>
            <td class="p-4 text-gray-700">{{ item.stok }}</td>
            <td class="p-4 text-gray-700">
              Rp {{ Number(item.harga).toLocaleString() }}
            </td>

            <td class="p-4 text-center">
              <button
                @click="openEditModal(item)"
                class="mr-2 rounded-md bg-yellow-500 px-3 py-1.5 text-white shadow hover:bg-yellow-600"
              >
                Edit
              </button>

              <button
                @click="deleteItem(item.id)"
                class="rounded-md bg-red-600 px-3 py-1.5 text-white shadow hover:bg-red-700"
              >
                Hapus
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Modals -->
    <AddItemModal
      v-if="showAddModal"
      @close="showAddModal = false"
      @saved="fetchItems(); showAddModal = false"
    />

    <EditItemModal
      v-if="showEditModal"
      :item="selectedItem"
      @close="showEditModal = false"
      @updated="fetchItems(); showEditModal = false"
    />
  </div>
</template>
