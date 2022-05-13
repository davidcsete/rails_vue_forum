import App from './App.vue';
import { createApp } from "vue";
import store from "./store";
import router from "./router";
import { createPinia } from "pinia";


/**
 * Load JWT from Local Storage on Refresh.
 */
const localAuthToken = localStorage.auth_token;
const cookieExists = localAuthToken !== "undefined" && localAuthToken !== null;
if (cookieExists) {
  const auth_token = localStorage.getItem("auth_token");
  const authTokenExists = auth_token !== "undefined" && auth_token !== null;
  if (authTokenExists) {
    store.dispatch("loginUserWithToken", { auth_token });
  }
}
createApp(App).use(store).use(createPinia()).use(router).mount("#app");
