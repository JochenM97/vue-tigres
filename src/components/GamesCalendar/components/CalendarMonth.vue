<script setup>
import CalendarGame from './components/CalendarGame.vue'

defineProps({
  month: {
    type: String,
    required: true,
  },
  items: {
    type: Array,
    required: true,
  },
})
</script>

<template>
  <div class="matches-table">
    <div class="month-container">
      <h3 class="month-title">{{ month }}</h3>
      <div v-for="item in items" :key="item.id" class="month-table">
        <CalendarGame :game="item" :month="month" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.container {
  /* background-color: rgb(38, 38, 36); */
  padding: 16px 8px;
}
.matches-table {
  display: grid;
}
</style>
