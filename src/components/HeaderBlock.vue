<script setup>
defineProps({
  title: {
    type: String,
    required: true,
  },
})
</script>

<template>
  <header class="container">
    <h1>{{ title }}</h1>
  </header>
</template>

<style scoped>
header {
  padding: 50px 0 100px 0;
  text-align: center;
}
h1 {
  color: #fff;
  font-weight: 500;
  font-size: 3rem;
  position: relative;
  text-align: center;
  width: 100%;
  display: block;
  font-family: 'BebasNeueRegular';
}
@media only screen and (min-width: 768px) {
  h1 {
    font-size: 5rem;
  }
}
</style>
