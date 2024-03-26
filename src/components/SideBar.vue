<template>
  <v-navigation-drawer permanent width="64">
    <v-container fluid>
      <v-btn class="sidebar-button" @click="store.setPlay()">
        <v-icon v-if="!store.getPlay">mdi-play</v-icon>
        <v-icon v-else>mdi-pause</v-icon>
      </v-btn>
    </v-container>
  </v-navigation-drawer>
</template>

<script setup>
import { useBWStore } from "@/store/BaseWebsiteStore";

const store = useBWStore();
</script>

<style scoped>
.sidebar-button {
  height: 48px;
  width: 48px;
  left: -16px;
  box-shadow: none;
  border-radius: 0;
}
</style>
