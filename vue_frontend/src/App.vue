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
$width : calc(100% - 120px);
main {
  position: absolute;
  top: 0;
  left: 70px;
  padding: 40px 25px;
  transition: 0.5s ease-in-out;
  width: $width;
}
.app {
  display: flex;
  height: 100%;
}
</style>
