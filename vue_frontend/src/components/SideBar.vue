<script setup lang="ts">
    import { RouterLink } from "vue-router";
    import HomeView from '@/views/HomeView.vue';
</script>
<template>
    <div class="sidebar-open">
        <nav>
            <RouterLink to="/">
                Home
            </RouterLink>
            <RouterLink to="/about">About</RouterLink>
        </nav>
    </div>
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
