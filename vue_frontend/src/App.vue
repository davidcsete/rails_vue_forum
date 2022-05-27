<script lang="ts">
// import SessionManager from "./components/SessionManager.vue";
import SideBar from "@/components/SideBar.vue";
export default {
  name: "App",
  components: {
    SideBar
  },
};
</script>
<template>
  <!-- <SessionManager /> -->
  <div class="app">
    <SideBar />
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
  font-weight: normal;
}
</style>
