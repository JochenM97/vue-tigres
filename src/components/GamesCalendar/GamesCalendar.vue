<script setup>
import { ref, onMounted } from 'vue'

import CalendarMonth from './components/CalendarMonth.vue'

const gamesItems = ref({})
const errorMessage = ref(null)

const apiKey = import.meta.env.VITE_CALENDAR_API_KEY
const calendarId = import.meta.env.VITE_CALENDAR_ID

defineProps({
  title: {
    type: String,
    required: true,
  },
})

const gapiLoaded = () => {
  window.gapi.load('client', initializeGapiClient)
}

const initializeGapiClient = async () => {
  window.gapi.client.setApiKey(apiKey)
  window.gapi.client
    .load('https://content.googleapis.com/discovery/v1/apis/calendar/v3/rest')
    .then(fetchEvents)
}

const months = [
  'Januari',
  'Februari',
  'Maart',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Augustus',
  'September',
  'November',
  'December',
]

const gamesMapping = (items) => {
  return items.reduce((mappedItems, item) => {
    if (item.start && item.start.dateTime) {
      const startDate = new Date(item.start.dateTime)
      const itemMonthIndex = startDate.getMonth()
      const itemMonth = months[itemMonthIndex]

      if (mappedItems[itemMonth]) {
        return {
          ...mappedItems,
          [itemMonth]: [...mappedItems[itemMonth], item],
        }
      }
      return {
        ...mappedItems,
        [itemMonth]: [item],
      }
    }

    return mappedItems
  }, {})
}

const fetchEvents = async () => {
  var request = await window.gapi.client.calendar.events.list({
    calendarId: calendarId,
    timeMin: new Date().toISOString(), // Start from current time
    showDeleted: false,
    singleEvents: true,
    orderBy: 'startTime',
  })

  if (request && request.result) {
    if (request.result.items && request.result.items.length) {
      gamesItems.value = gamesMapping(request.result.items)
    }
  } else {
    errorMessage.value = 'Failed to load matches'
  }
}

onMounted(() => {
  let gapiScript = document.createElement('script')
  gapiScript.defer = true
  gapiScript.async = true
  gapiScript.onreadystatechange = gapiScript.onload = function () {
    const interval = setInterval(function () {
      if (!gapiScript.readyState || /loaded|complete/.test(gapiScript.readyState)) {
        clearInterval(interval)
        if (window.gapi) {
          gapiLoaded()
        } else {
          console.log('Failed to load gapi')
        }
      }
    }, 100)
  }
  gapiScript.src = 'https://apis.google.com/js/api.js'
  document.head.appendChild(gapiScript)
})
</script>

<template>
  <div class="container">
    <h2>{{ title }}</h2>
    <div v-for="(value, key) in gamesItems" :key="key" class="calendar-month">
      <CalendarMonth :month="key" :items="value" />
    </div>
  </div>
</template>

<style scoped>
.container {
}
h2 {
  color: #fff;
  font-weight: 300;
  font-size: 2rem;
  position: relative;
  width: 100%;
  display: block;
  font-family: 'BebasNeueRegular';
}
.calendar-month {
  margin-bottom: 20px;
}
@media only screen and (min-width: 768px) {
  h2 {
    font-size: 5rem;
  }
}
</style>
