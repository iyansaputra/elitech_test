<template>
  <div class="flex">
    <!-- Sidebar -->
    <Sidebar />

    <!-- Halaman -->
    <div class="flex h-screen w-full bg-gray-100">
      <router-view />
    </div>
  </div>
</template>

<script setup>
import Sidebar from "../components/Sidebar.vue";
</script>
