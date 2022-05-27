<script setup lang="ts">
import { ref, watchEffect } from 'vue';

const API_URL = `http://localhost:3000/api/home`
const categories = ref(null)

watchEffect(async () => {
  // this effect will run immediately and then
  // re-run whenever currentBranch.value changes
  const url = `${API_URL}`
  categories.value = await (await fetch(url)).json()
})


function formatDate(v) {
  return v.replace(/T|Z/g, ' ')
}
</script>
<template>
  <div>
    <RouterLink
      v-for="{ id, name, posts } in categories"
      :key="id"
      :to="{ name: 'category', params: { id:id  } }" >
      {{name}}
    </RouterLink>
  </div>
</template>
