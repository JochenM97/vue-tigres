<script setup>
import HeaderBlock from './components/HeaderBlock.vue'
import GamesCalendar from './components/GamesCalendar/GamesCalendar.vue'
</script>

<template>
  <HeaderBlock title="FC Los Tigres" />
  <main>
    <GamesCalendar title="Matchen" />
  </main>
</template>

<style scoped>
body {
  background-color: #161616;
}

header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}
</style>
