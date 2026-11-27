<script setup>
import { ref, onMounted } from 'vue'

import CalendarMonth from './components/CalendarMonth.vue'

const gamesItems = ref([])
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
  'Oktober',
  'November',
  'December',
]

// Groups matches per calendar month, keyed by year + month so that the same
// month in different years never ends up in the same section.
const gamesMapping = (items) => {
  const currentYear = new Date().getFullYear()
  const groups = new Map()

  items.forEach((item) => {
    if (!item.start || !item.start.dateTime) {
      return
    }

    const startDate = new Date(item.start.dateTime)

    if (Number.isNaN(startDate.getTime())) {
      return
    }

    const year = startDate.getFullYear()
    const monthIndex = startDate.getMonth()
    const key = `${year}-${String(monthIndex).padStart(2, '0')}`

    if (!groups.has(key)) {
      groups.set(key, {
        key,
        year,
        monthIndex,
        // Only show the year when it is not the current one, so a running
        // season reads "December", "Januari 2027", "Februari 2027", ...
        label: year === currentYear ? months[monthIndex] : `${months[monthIndex]} ${year}`,
        items: [],
      })
    }

    groups.get(key).items.push(item)
  })

  return [...groups.values()]
    .sort((a, b) => a.year - b.year || a.monthIndex - b.monthIndex)
    .map((group) => ({
      ...group,
      items: [...group.items].sort(
        (a, b) => new Date(a.start.dateTime) - new Date(b.start.dateTime),
      ),
    }))
}

const fetchEvents = async () => {
  try {
    // Fetch from local Flask backend. The URL carries no parameters on purpose:
    // the backend decides the time window, and a stable URL is what lets the
    // browser reuse its own cached copy across reloads.
    const response = await fetch('http://localhost:5000/api/calendar/events')
    
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
    <div v-else v-for="group in gamesItems" :key="group.key" class="calendar-month">
      <CalendarMonth :month="group.label" :items="group.items" />
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
