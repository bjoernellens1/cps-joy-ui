<template>
  <v-navigation-drawer v-model="store.rosBarOpened" temporary location="right">
    <v-container fluid>
      <v-row justify="space-between">
        <v-col cols="6" md="12">
          <v-text-field
            v-model="formState.ipaddress"
            label="IP Address"
            :disabled="connectionState"
          />
          <v-text-field
            v-model="formState.port"
            label="Port"
            :disabled="connectionState"
          />
          <v-switch
            @change="updateConnectionState"
            true-value="connected"
            false-value="not connected"
            :label="`${formState.connect}`"
          />
        </v-col>
      </v-row>
    </v-container>
  </v-navigation-drawer>
</template>

<script setup>
import * as ROS from "roslib";
import { useBWStore } from "@/store/BaseWebsiteStore";


import { reactive, ref, watch } from "vue";

const store = useBWStore();

const formState = reactive({
  ipaddress: "localhost",
  port: "9090",
  connect: "not connected",
  // connectionState: computed(() => formState.connect !== 'not connected'),
});

const connectionState = ref(false);
const stateCounter = ref([0, 0, 0]);

// Open Connection to ROSBridge and subscribe the topics.
const ros = new ROS.Ros();
const ros_eval = new ROS.Ros();

ros.on("connection", () => {
  stateCounter.value[0] += 1;
});
ros_eval.on("connection", () => {});

ros.on("error", (error) => {
  stateCounter.value[1] += 1;
  console.log(error);
});
ros_eval.on("error", () => {});

ros.on("close", () => {
  stateCounter.value[2] += 1;
});
ros_eval.on("close", () => {});

function updateConnectionState() {
  connectionState.value = !connectionState.value;
  if (formState.connect === "not connected") {
    formState.connect = "connected";
    const rosUrl = `ws://${formState.ipaddress}:${formState.port}`;
    ros.connect(rosUrl);
    ros_eval.connect(rosUrl);
  } else {
    formState.connect = "not connected";
    ros.close();
    ros_eval.close();
  }
}

const lastStateCounter = [0, 0, 0];

// ROS2 State Observer
watch(stateCounter.value, (newValue) => {
  let currentState = 0;
  for (let i = 0; i < lastStateCounter.length; i += 1) {
    if (newValue[i] - lastStateCounter[i] === 1) {
      currentState = i;
    }
    lastStateCounter[i] = newValue[i];
  }
  if (currentState === 0) {
    store.setRosConState("connected");
  } else if (currentState === 1) {
    store.setRosConState("error");
  } else if (currentState === 2) {
    store.setRosConState("not connected");
  }
});


</script>

<style scoped></style>
