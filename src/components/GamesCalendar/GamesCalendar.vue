<script setup>
import { ref, onMounted } from 'vue'

import CalendarMonth from './components/CalendarMonth.vue'

const gamesItems = ref({})
const errorMessage = ref(null)

// No longer needed in frontend
// const apiKey = import.meta.env.VITE_CALENDAR_API_KEY
// const calendarId = import.meta.env.VITE_CALENDAR_ID

defineProps({
  title: {
    type: String,
    required: true,
  },
})

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
  try {
     // Fetch from local Flask backend
    const timeMin = new Date().toISOString()
    const response = await fetch(`http://localhost:5000/api/calendar/events?timeMin=${timeMin}`)
    
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`)
    }
    
    const result = await response.json()

    if (result && result.items && result.items.length) {
      gamesItems.value = gamesMapping(result.items)
    }
  } catch (error) {
    console.error('Error fetching events:', error)
    errorMessage.value = 'Failed to load matches'
  }
}

onMounted(() => {
  fetchEvents()
})
</script>

<template>
  <div class="container">
    <h2>{{ title }}</h2>
    <div v-if="errorMessage" class="error">{{ errorMessage }}</div>
    <div v-else v-for="(value, key) in gamesItems" :key="key" class="calendar-month">
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
.error {
    color: red;
    font-size: 1.2rem;
}
@media only screen and (min-width: 768px) {
  h2 {
    font-size: 5rem;
  }
}
</style>
