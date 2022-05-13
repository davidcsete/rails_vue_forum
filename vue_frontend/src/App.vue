
<script>
// import SessionManager from "./components/SessionManager.vue";
import SideBar from "@/components/SideBar.vue";
import {RouterView} from "vue-router";
export default {
  name: "App",
  components: {
    SideBar,
    RouterView
  },
};
</script>
<template>
  <!-- <SessionManager /> -->
  <div class="app">
    <SideBar />
    <RouterView />
  </div>
  
</template>


<style lang="scss">
/* @import "@/assets/base.css"; */
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  margin: 0 auto;
  padding: 2rem;
  font-weight: normal;
}
</style>
