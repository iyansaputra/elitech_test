<script setup>
import { ref } from "vue";
import api from "../plugins/axios";
import { useRouter } from "vue-router";

const router = useRouter();

const name = ref("");
const email = ref("");
const password = ref("");
const error = ref("");

const register = async () => {
  try {
    await api.post("/register", {
      name: name.value,
      email: email.value,
      password: password.value,
    });

    router.push("/login");
  } catch (e) {
    error.value = "Registrasi gagal. Email mungkin sudah digunakan.";
  }
};
</script>

<template>
  <div
    class="flex min-h-screen flex-col items-center justify-center bg-gray-50 py-12 px-4"
  >
    <div class="mb-6 text-center">
      <span class="text-4xl font-extrabold text-gray-900">Elitech</span>
      <span class="block text-sm font-medium text-blue-600"
        >TECHNOVISION</span
      >
    </div>

    <div
      class="w-full max-w-md space-y-6 rounded-2xl border border-gray-200 bg-white p-10 shadow-lg"
    >
      <h2
        class="text-center text-2xl font-bold tracking-tight text-gray-800"
      >
        Buat Akun Baru
      </h2>

      <form class="space-y-6" @submit.prevent="register">
        <div
          v-if="error"
          class="rounded-lg bg-red-100 p-3 text-sm text-red-600"
        >
          {{ error }}
        </div>

        <div class="space-y-4 rounded-md shadow-sm">
          <div>
            <label for="name" class="sr-only">Nama</label>
            <input
              id="name"
              type="text"
              v-model="name"
              required
              class="relative block w-full rounded-lg border-gray-300 bg-white px-3 py-2.5 text-gray-900 placeholder-gray-500 shadow-sm focus:border-blue-500 focus:ring-blue-500"
              placeholder="Nama Lengkap"
            />
          </div>

          <div>
            <label for="email" class="sr-only">Email</label>
            <input
              id="email"
              type="email"
              v-model="email"
              required
              class="relative block w-full rounded-lg border-gray-300 bg-white px-3 py-2.5 text-gray-900 placeholder-gray-500 shadow-sm focus:border-blue-500 focus:ring-blue-500"
              placeholder="Email"
            />
          </div>

          <div>
            <label for="password" class="sr-only">Password</label>
            <input
              id="password"
              type="password"
              v-model="password"
              required
              class="relative block w-full rounded-lg border-gray-300 bg-white px-3 py-2.5 text-gray-900 placeholder-gray-500 shadow-sm focus:border-blue-500 focus:ring-blue-500"
              placeholder="Password"
            />
          </div>
        </div>

        <button
          type="submit"
          class="flex w-full justify-center rounded-lg bg-blue-600 px-3 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-blue-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600 disabled:bg-blue-300"
        >
          Daftar
        </button>

        <p class="mt-4 text-center text-sm text-gray-600">
          Sudah punya akun?
          <router-link to="/login" class="text-blue-600 hover:underline">
            Login
          </router-link>
        </p>
      </form>
    </div>
  </div>
</template>

<style scoped>
</style>

<style>
.input {
  @apply w-full border p-2 rounded;
}
.btn {
  @apply bg-green-600 hover:bg-green-700 text-white p-2 rounded;
}
</style>
