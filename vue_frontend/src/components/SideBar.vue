<script setup lang="ts">
    import { RouterLink } from "vue-router";
    import TrendingCategory from "@/components/TrendingCategory.vue";
    import {RouterView} from "vue-router";
    import {ref} from "vue";
    const showTrendingCategory = ref(false);
    const sideBarOpen = ref(false);
</script>
<template>
      <div class="sidebar" :class="{ 'sidebar-open': sideBarOpen}">
          <nav>
              <button class="menu-toggle" id="openButton" @click="sideBarOpen = !sideBarOpen">
				        <span class="material-icons">keyboard_double_arrow_right</span>
              </button>

              <RouterLink to="/">
                <span class="material-icons">home</span>
                <span>Home</span>
              </RouterLink>
              <RouterLink to="/about">
                <span class="material-icons">
                  description
                </span>
                <span>About</span>
              </RouterLink>
              <button class="show-trending" @click="showTrendingCategory = !showTrendingCategory">
                <span class="material-icons">
                  timeline
                </span>
                Trending Categories
              </button>
              <Transition name="slidedown">
                <div v-if="showTrendingCategory">
                  <TrendingCategory />
                </div>
              </Transition>
              <RouterLink to="/login">
                <span class="material-icons">
                  input
                </span>
                Login
              </RouterLink>
          </nav>
      </div>
      <RouterView />
</template>

<style lang="scss">
.menu-toggle > span{
  float:right;
}
.menu-toggle {
  transition: 0.5s ease-in-out;
  background-color: transparent;
  border: none;
  color: white;
  font-size: 16px;
  text-align: left;
  float: right;
  width: auto;
  padding: 0;
  margin-right: 10px;
    .material-icons {
      font-size: 2rem;
      color: var(--light);
      transition: 0.2s ease-out;
    }
}
.sidebar {
  background-color: #363636;
  height: 100%;
  position: fixed;
  top: 0;
  float:left;
  width:300px;
  left:-230px;
  z-index:1;
  transition: 0.5s;
}
.material-icons {
  font-size: 33px;
}
.sidebar a .material-icons {
    float: right;
    margin-right: -24px;
}
.sidebar-open {
  left:0;
    .menu-toggle > span {
      transform: rotate(-180deg);
    }
    a .material-icons, .material-icons {
      float:right;
      margin-right:10px;
    }
}
$widthopen : calc(100% - 350px);
.sidebar-open ~ main {
  left:300px;
  width:$widthopen;
}
.sidebar-open a, .sidebar-open .show-trending {
  display: flex;
  align-items: center;
}



nav {
  width: 100%;
  font-size: 12px;
  text-align: left;
  margin-top: 2rem;
}
.icon {
  cursor:pointer;
  float: right;
}

.icon ~ #openButton {
  float:left;
}

nav a.router-link-exact-active {
  color: var(--color-text);
}

nav a.router-link-exact-active:hover {
  background-color: transparent;
}

nav a, nav a:visited {
    width:240px;
    display: inline-block;
    padding: 0 1rem;
    border-left: 1px solid var(--color-border);
    color:white;
    padding: 5px 15px;
    text-decoration:none;
    font-size: 16px;
    font-weight:500;
}

nav .menu-toggle {
  background-color:transparent;
  border:none;
  color:white;
  width:290px;
  padding: 5px 15px;
  font-size: 16px;
  text-align:left;
}

nav button {
  background-color:transparent;
  border:none;
  color:white;
  width:270px;
  padding: 5px 15px;
  font-size: 16px;
  text-align:left;
}

nav button:hover {
  cursor:pointer;
}

nav a:first-of-type {
  border: 0;
}
.slidedown-enter-active,
.slidedown-leave-active {
  transition: max-height 1s ease-in-out;
}

.slidedown-enter-to,
.slidedown-leave-from {
  overflow: hidden;
  max-height: 200px;
}

.slidedown-enter-from,
.slidedown-leave-to {
  overflow: hidden;
  max-height: 0;
}
</style>
