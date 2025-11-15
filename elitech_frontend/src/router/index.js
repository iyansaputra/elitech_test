import { createRouter, createWebHistory } from "vue-router";

import Login from "../views/Login.vue";
import Register from "../views/Register.vue";

import Dashboard from "../views/Dashboard.vue";
import Items from "../views/Items.vue";
import Transactions from "../views/Transactions.vue";
import StockReport from "../views/StockReport.vue";

import MainLayout from "../layouts/MainLayout.vue";

const routes = [
  { path: "/", redirect: "/login" },

  { path: "/login", name: "login", component: Login },
  { path: "/register", name: "register", component: Register },

  {
    path: "/app",
    component: MainLayout,
    meta: { requiresAuth: true },
    children: [
      { path: "dashboard", name: "dashboard", component: Dashboard },
      { path: "items", name: "items", component: Items },
      { path: "transactions", name: "transactions", component: Transactions },
      { path: "report", name: "report", component: StockReport },
    ],
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// ======================================
// PROTECT ROUTES + AUTO-REDIRECT LOGIN
// ======================================
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem("token");

  // Jika SUDAH LOGIN, cegah akses login/register → redirect ke dashboard
  if ((to.path === "/login" || to.path === "/register") && token) {
    return next("/app/dashboard");
  }

  // Jika masuk halaman protected tapi TIDAK ada token → redirect ke login
  if (to.meta.requiresAuth && !token) {
    return next("/login");
  }

  next();
});

export default router;
