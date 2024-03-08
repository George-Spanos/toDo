<script setup lang="ts">
import type { Note } from '@/App.vue';
import { ref } from 'vue';

const props = defineProps<{
  note: Note;
}>();
defineEmits(['deleted']);
const done = ref(props.note.done);
</script>
<template>
  <section class="note">
    <s v-if="done">
      <p>{{ note.content }}</p>
    </s>
    <p v-else>{{ note.content }}</p>
    <section class="icons">
      <img src="/icons/check.svg" @click="done = !done">
      <img src="/icons/trash.svg" @click="$emit('deleted')">
    </section>
  </section>
</template>
<style scoped>
.note {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 400px;
  padding: var(--gap-2) var(--gap-1);
  border: 1px solid var(--primary-light);
  border-radius: var(--radius);
  background-color: var(--primary);
  color: var(--background);
}

.icons {
  display: flex;
  gap: var(--gap-1);
  cursor: pointer;
}

.done {
  background-color: var(--primary--dark);
}
</style>