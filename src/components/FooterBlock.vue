<script setup></script>

<template>
  <footer class="container">
    <div class="background-container">
      <div class="partners">
        <h6 class="partners-title">Official partners</h6>
        <div class="partners-logos">
          <a href="https://www.instagram.com/jens_deroo/?hl=nl" target="_blank">
            <img
              alt="Jens Deroo logo"
              src="./../assets/img/jensderoologo.svg"
              class="logo jens-deroo"
            />
          </a>
          <a href="https://vindescousins.com/" target="_blank">
            <img
              alt="Vin des Cousins logo"
              src="./../assets/img/vindescousins.svg"
              class="logo vin-des-cousins"
            />
          </a>
          <a href="https://www.vandessel.be/" target="_blank">
            <img
              alt="Van Dessel logo"
              src="./../assets/img/vandessellogo.png"
              class="logo van-dessel"
            />
          </a>
        </div>
      </div>
      <div class="border"></div>
      <div class="credits">
        <div>© 2025 - FC Los Tigres</div>
        <div>
          Development: <a href="https://jochenmeyvisch.com/" target="_blank">Jochen Meyvisch</a>
        </div>
      </div>
    </div>
  </footer>
</template>

<style scoped>
.container {
  margin-top: 100px;
  position: relative;
}
.partners {
}
.partners h6 {
  color: rgb(167, 166, 161);
  font-size: 1rem;
  display: block;
  text-align: center;
  font-family: 'BebasNeueRegular';
  margin-bottom: 20px;
}
.partners .partners-logos {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
}
.partners .partners-logos .logo {
  margin: 15px 0;
}
.partners .partners-logos .logo a {
  text-decoration: none;
}
.partners .partners-logos .logo a:hover,
.partners .partners-logos .logo a:focus,
.partners .partners-logos .logo a:active {
  background-color: blue;
  outline: none;
}
.partners .partners-logos .vin-des-cousins {
  /* 301x59 */
  width: 186px;
  height: 35px;
}
.partners .partners-logos .jens-deroo {
  /* 781x435 */
  width: 78px;
  height: 42px;
}
.partners .partners-logos .van-dessel {
  /* 854x601 */
  width: 85px;
  height: 60px;
}

.background-container {
  background-color: rgb(38, 38, 36);
  padding: 24px;
  margin-top: 20px;
}
.border {
  border-top: 1px solid #444441;
  margin: 24px 0;
}
.credits {
  text-align: center;
}
.credits a {
  text-decoration: underline;
  color: #fff;
}

@media only screen and (min-width: 768px) {
  .partners .partners-logos {
    flex-direction: row;
  }
  .partners .partners-logos .logo {
    margin: 0 20px;
  }
  .partners .partners-logos .vin-des-cousins {
    /* 301x59 */
    width: 241px;
    height: 47px;
  }
  .partners .partners-logos .jens-deroo {
    /* 781x435 */
    width: 98px;
    height: 54px;
  }
  .partners .partners-logos .van-dessel {
    /* 854x601 */
    width: 107px;
    height: 75px;
  }
}
</style>
