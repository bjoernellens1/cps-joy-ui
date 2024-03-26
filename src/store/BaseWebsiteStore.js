import {defineStore} from "pinia";

export const useBWStore = defineStore("Base Website Store", {
  state: () => {
    return {
      play: false,
      rosBarOpened: true,
      rosConState: "not connected",
    };
  },
  getters: {
    getPlay: (state) => state.play,
    getRosBarOpened: (state) => state.rosBarOpened,
    getRosConState: (state) => state.rosConState,
  },
  actions: {
    setPlay() {
      this.play = !this.play;
    },
    toggleRosBar() {
      this.rosBarOpened = !this.rosBarOpened;
    },
    setRosConState(value) {
      this.rosConState = value;
    },
  },
});
