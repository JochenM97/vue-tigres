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
  <div class="container">
    <h3 class="month-title">{{ month }}</h3>
    <div class="matches-table">
      <CalendarGame v-for="item in items" :key="item.id" :game="item" :month="month" />
    </div>
  </div>
</template>

<style scoped>
.container {
}
h3 {
  color: #fff;
  font-weight: 300;
  font-size: 1.5rem;
  position: relative;
  width: 100%;
  display: block;
  font-family: 'BebasNeueRegular';
  margin-bottom: 5px;
}
.matches-table {
  display: flex;
  flex-flow: wrap;
}
@media only screen and (min-width: 768px) {
  h3 {
    font-size: 2rem;
  }
}
</style>
