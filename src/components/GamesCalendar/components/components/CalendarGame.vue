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

const returnCompetion = (summary, returnClass = false) => {
  if (summary && summary.length) {
    if (summary.toLowerCase().includes('kessel')) {
      return returnClass ? 'kessel' : 'Kessel'
    } else if (summary.toLowerCase().includes('ranst')) {
      return returnClass ? 'ranst' : 'Ranst'
    } else if (summary.toLowerCase().includes('berlaar')) {
      return returnClass ? 'berlaar' : 'Berlaar'
    }
  }

  return 'Zaalvoetbal'
}
</script>

<template>
  <div class="wrapper">
    <div class="container">
      <div class="match-info">
        <div class="competition-container" :class="returnCompetion(game.summary, true)">
          <div class="background-border"></div>
          <div class="competition">
            {{ returnCompetion(game.summary) }}
          </div>
        </div>
        <div class="team-info">
          <span class="team home-team">Los Tigres</span>
          <span class="versus">VS</span>
          <span class="team away-team">{{ game.description }}</span>
        </div>
        <div class="date">
          <span class="date-day">
            {{
              new Date(game.start.dateTime).toLocaleDateString('nl-BE', {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric',
              })
            }}
          </span>
          <div>
            <span>
              <span class="date-hours-border"></span
              ><span class="date-hours"
                >{{ new Date(game.start.dateTime).getHours() }}u{{
                  new Date(game.start.dateTime).getMinutes() || ''
                }}</span
              ></span
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.wrapper {
  width: 100%;
  padding-right: 0;
  box-sizing: border-box;
}
.container {
  background-color: rgb(38, 38, 36);
  text-align: center;
  margin-bottom: 20px;
  padding: 24px 8px;
}
.competition-container {
  position: relative;
}
.background-border {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 80%;
  height: 2px;
}
.competition {
  position: relative;
  font-family: 'BebasNeueRegular';
  font-size: 1em;
  display: inline-block;
  padding: 2px 20px;
  line-height: 22px;
}
.competition-container.kessel .competition {
  color: #fe3300;
  background-color: white;
}
.competition-container.kessel .background-border {
  background-color: white;
}
.competition-container.ranst .competition,
.competition-container.berlaar .competition {
  color: white;
  background-color: #fe3300;
}
.competition-container.ranst .background-border,
.competition-container.berlaar .background-border {
  background-color: #fe3300;
}

.team-info {
  padding: 32px 4px;
  position: relative;
}
.team {
  display: block;
  text-align: center;
  font-size: 1.2em;
  font-family: 'MontserratBold';
}
.home-team {
  justify-content: center;
}
.away-team {
  justify-content: center;
}
.versus {
  display: block;
  font-size: 1.2em;
  height: 24px;
  line-height: 24px;
  font-family: 'BebasNeueRegular';
  opacity: 0.2;
}
.date {
  font-size: 1em;
  font-family: 'BebasNeueRegular';
}
.date-hours-border {
  text-decoration: overline;
}
.date-hours {
  display: inline-block;
  background-color: rgba(255, 255, 255, 0.1);
  padding: 0 8px;
  box-sizing: content-box;
  width: 30px;
}

@media only screen and (min-width: 600px) {
  .wrapper {
    width: 50%;
    padding-right: 25px;
  }
}
@media only screen and (min-width: 768px) {
  .wrapper {
    width: 33%;
    padding-right: 25px;
  }
}
@media only screen and (min-width: 992px) {
  .wrapper {
    width: 25%;
    padding-right: 25px;
  }
}
@media only screen and (min-width: 1200px) {
  .wrapper {
    width: 20%;
    padding-right: 25px;
  }
}
</style>
