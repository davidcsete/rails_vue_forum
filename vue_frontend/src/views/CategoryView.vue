<script lang="ts">
import { useRoute } from "vue-router";
import TheCategoryTitle from "@/components/TheCategoryTitle.vue";
import ThePost from "@/components/ThePost.vue";

// app.mount(Category)
export default {
  name: "CategoryView",
  components: {
    TheCategoryTitle,
    ThePost
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
    name: { type: String, required: true },
  },
};
</script>

<template>
  <main>
    <div class="content">
      <TheCategoryTitle v-bind="{name: name}" /> 
      <ThePost v-bind="{categoryId:id}" />
    </div>
  </main>
</template>

<style lang="scss">

@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>