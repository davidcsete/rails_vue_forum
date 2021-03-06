import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import CategoryView from "../views/CategoryView.vue";
import PostView from "../views/PostView.vue";
import CommentView from "../views/CommentView.vue";
import LoginView from "../views/Login.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/AboutView.vue"),
    },
    {
      path: "/login",
      name: "login",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => LoginView,
    },
    {
      path: "/category/:id",
      name: "category",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => CategoryView,
      props: true,
      // props: router => ({ query: router.query.q })
    },
    {
      path: "/post/:id",
      name: "post",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => PostView,
      props: true,
      // props: router => ({ query: router.query.q })
    },
    {
      path: "/comment/:id",
      name: "comment",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => CommentView,
      props: true,
      // props: router => ({ query: router.query.q })
    },
  ],
});

export default router;
