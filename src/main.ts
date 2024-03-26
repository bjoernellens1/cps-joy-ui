import { createApp } from "vue";

// Pinia Store
import { createPinia } from "pinia";

// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import '@mdi/font/css/materialdesignicons.css'


import App from "./App.vue";

const pinia = createPinia();
const vuetify = createVuetify({
    theme: {
        defaultTheme: 'dark',
    },
    components,
    directives,
});

const app = createApp(App);

app.use(pinia);
app.use(vuetify);
app.mount("#app");
