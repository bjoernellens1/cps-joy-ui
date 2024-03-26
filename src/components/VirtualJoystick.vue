<template>
    <div ref="joystick"></div>
  </template>
  
  <script>
  import nipplejs from 'nipplejs';
  
  export default {
    name: 'VirtualJoystick',
    mounted() {
      this.initJoystick();
    },
    methods: {
      initJoystick() {
        this.joystick = nipplejs.create({
          zone: this.$refs.joystick,
          mode: 'semi',
          catchDistance: 150,
          color: 'white'
        });
  
        // Example event handling
        this.joystick.on('move', (evt, data) => {
          // Handle joystick movement
          console.log('Joystick movement:', data);
        });
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add your styles here */
  </style>
  