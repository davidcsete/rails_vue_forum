<script lang="ts">
import { useRoute } from "vue-router";
import TheCategory from "@/components/TheCategory.vue";

// app.mount(Category)
export default {
  name: "CategoryView",
  components: {
    TheCategory
  },
  setup() {
    const route = useRoute();  
    const id = parseInt(route.params.id);

    // expose to template and other options API hooks
    return {
      id
    }
  },
  props: {
    id: { type: Number, required: true },
  },
};
</script>

<template>
  <div>
    <TheCategory v-bind="{id: id}" /> 
  </div>
  <div>
    {{id}}
  </div>
</template>

<style>
@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>