<script setup>
defineProps({
  items: Array
});
</script>

<template>
  <table class="w-full bg-white shadow rounded">
    <thead>
      <tr class="bg-gray-200 text-left">
        <th class="p-2">Kode</th>
        <th class="p-2">Nama</th>
        <th class="p-2">Stok</th>
        <th class="p-2">Harga</th>
        <th class="p-2 w-32">Aksi</th>
      </tr>
    </thead>

    <tbody>
      <tr v-for="i in items" :key="i.id" class="border-t">
        <td class="p-2">{{ i.kode }}</td>
        <td class="p-2">{{ i.nama }}</td>
        <td class="p-2">{{ i.stok }}</td>
        <td class="p-2">Rp {{ i.harga }}</td>
        <td class="p-2 flex gap-2">
          <button class="text-blue-600">Edit</button>
          <button class="text-red-600">Hapus</button>
        </td>
      </tr>
    </tbody>
  </table>
</template>
