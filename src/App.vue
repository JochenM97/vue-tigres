<script setup>
import HeaderBlock from './components/HeaderBlock.vue'
import GamesCalendar from './components/GamesCalendar/GamesCalendar.vue'
import FooterBlock from './components/FooterBlock.vue'
</script>

<template>
  <HeaderBlock title="FC Los Tigres" />
  <main>
    <GamesCalendar title="Matchen" />
  </main>
  <FooterBlock />
</template>

<style scoped></style>
