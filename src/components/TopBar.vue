<template>
  <v-app-bar id="components-top-bar" class="elevation-1">
    <v-img class="cps-image" :left="true" :src="pic" />
    <v-divider vertical class="image-divider" />
    <v-spacer />
    <v-btn @click="store.toggleRosBar()">
      <v-icon :color="changeRosColor()" large>
        mdi-checkbox-blank-circle
      </v-icon>
      \ ROS2
    </v-btn>
  </v-app-bar>
</template>

<script setup>
import { useBWStore } from "@/store/BaseWebsiteStore";
import pic from "../assets/CPS_Logo_White.png";

const store = useBWStore();

const changeRosColor = () => {
  const conState = store.getRosConState;
  if (conState === "not connected") {
    return "red";
  }
  if (conState === "connected") {
    return "green";
  }
  return "grey";
};
</script>

<style scoped>
.cps-image {
  left: 8px;
  max-width: 48px;
  max-height: 48px;
}
.image-divider {
  position: absolute;
  left: 64px;
}
</style>
