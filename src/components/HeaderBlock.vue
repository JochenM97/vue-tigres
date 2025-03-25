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
    <img alt="Los Tigres logo" src="./../assets/img/fclostigreslogo.png" class="logo" />
    <h1>{{ title }}</h1>
  </header>
</template>

<style scoped>
header {
  padding: 10px 0;
  margin-top: 2rem;
  margin-bottom: 50px;
  text-align: center;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  background-color: #262624;
  border: 2px solid #fff;
  border-color: rgba(255, 255, 255, 0.05);
}
h1 {
  color: #fff;
  font-weight: 500;
  font-size: 2.5rem;
  position: relative;
  text-align: center;
  font-family: 'BebasNeueRegular';
}
.logo {
  width: 50px;
  height: 50px;
  margin-right: 20px;
}

@media only screen and (min-width: 600px) {
  .logo {
    width: 80px;
    height: 80px;
    margin-right: 30px;
  }
  h1 {
    font-size: 3rem;
  }
}
@media only screen and (min-width: 768px) {
  header {
    padding: 20px 0;
    margin-bottom: 100px;
  }
  .logo {
    width: 125px;
    height: 125px;
    margin-right: 40px;
  }
  h1 {
    font-size: 5rem;
  }
}
@media only screen and (min-width: 992px) {
  .logo {
    width: 150px;
    height: 150px;
  }
  h1 {
    font-size: 8rem;
  }
}
</style>
