<script setup lang="ts">
import { reactive, ref } from 'vue';
import NoteBox from './components/NoteBox.vue';
export type Note = {
  content: string;
  done: boolean;
};
let content = '';
const notes: Note[] = reactive([]);

function addNote() {
  notes.push({ content: content, done: false });
  content = '';
}
function deleteItem(index: number) {
  notes.splice(index, 1);
}
</script>

<template>

  <main>
    <header>
      <h1 class="title">Take Notes!</h1>
      <form @submit.prevent="addNote()">
        <input type="text" v-model="content">
        <button class="submit" type="submit"><img src="/icons/add.svg" alt=""> </button>
      </form>
    </header>
    <p class="empty" v-if="!notes.length">There are no notes</p>
    <section class="notes" v-else>
      <NoteBox v-for="(note, index) of notes" :note @deleted="deleteItem(index)" />
    </section>
  </main>
</template>

<style scoped>
.title {
  text-align: center;
}

button,
.empty {
  align-self: center;
}

main>header {
  margin-bottom: var(--gap-2);
}

header {
  display: flex;
  flex-direction: column;

  form {
    display: flex;
    gap: var(--gap-1);
    justify-content: center;
  }
}

.submit {
  padding: 2px 2px 0px 2px;
}

.notes {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
