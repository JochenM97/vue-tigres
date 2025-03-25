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
    <div class="month-title">
      <h3>{{ month }}</h3>
      <div class="line"></div>
    </div>
    <div class="matches-table">
      <CalendarGame v-for="item in items" :key="item.id" :game="item" :month="month" />
    </div>
  </div>
</template>

<style scoped>
.container {
}
.month-title {
  display: flex;
  align-items: center;
  margin-bottom: 5px;
  max-width: 100%;
}
.month-title h3 {
  color: rgb(167, 166, 161);
  font-weight: 300;
  font-size: 1.5rem;
  position: relative;
  display: inline-block;
  font-family: 'BebasNeueRegular';
  padding-right: 25px;
}
.month-title .line {
  background-color: #444441;
  height: 1px;
  flex-grow: 1;
}
.matches-table {
  display: flex;
  flex-flow: wrap;
}
@media only screen and (min-width: 768px) {
  .month-title {
    display: flex;
    align-items: center;
    margin-bottom: 5px;
    max-width: calc(100% - 25px);
  }
  .month-title h3 {
    font-size: 2rem;
  }
}
</style>
