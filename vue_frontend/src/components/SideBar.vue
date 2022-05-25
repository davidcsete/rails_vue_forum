<script setup lang="ts">
    import { RouterLink } from "vue-router";
    import TrendingCategory from "@/components/TrendingCategory.vue";
    import {RouterView} from "vue-router";
    import {ref} from "vue";
    const show = ref(false);
</script>
<template>
    <div class="sidebar-open">
        <nav>
            <RouterLink to="/">
                Home
            </RouterLink>
            <RouterLink to="/about">About</RouterLink>
            <button @click="show = !show" to="/category/1">category</button>
            <Transition>
              <div v-if="show">
                <TrendingCategory />
              </div>
            </Transition>
            <RouterLink to="/login">Login</RouterLink>
        </nav>
    </div>
    <RouterView />
</template>

<style>
.sidebar-open {
    float:left;
    width: 300px;
    
}
nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;
}

nav a.router-link-exact-active {
  color: var(--color-text);
}

nav a.router-link-exact-active:hover {
  background-color: transparent;
}

nav a {
    width:100%;
    display: inline-block;
    padding: 0 1rem;
    border-left: 1px solid var(--color-border);
}

nav a:first-of-type {
  border: 0;
}
</style>
