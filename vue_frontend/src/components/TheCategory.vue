<script setup lang="ts">
defineProps<{
  id:number;
}>();
</script>
<template>
  <div>
    <h1>{{ id }}</h1>
  </div>
</template>