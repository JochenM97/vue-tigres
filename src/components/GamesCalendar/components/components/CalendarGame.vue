<script setup>
defineProps({
  game: {
    type: Object,
    required: true,
  },
  month: {
    type: String,
    required: true,
  },
})
</script>

<template>
  <div class="container">
    <div>Team: {{ game.description }}</div>
    <div>Competition: {{ game.summary }}</div>
    <div>Date: {{ new Date(game.start.dateTime).getDate() }} {{ month }}</div>
  </div>
</template>

<style scoped>
.container {
  background-color: rgb(38, 38, 36);
  padding: 16px 8px;
}
</style>
