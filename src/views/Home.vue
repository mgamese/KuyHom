<template >
  <div class="home">
  <MainNav></MainNav>
   <side-bar></side-bar>
     <HelloWorld msg="Welcome to Your Vue.js App"/>

  </div>
</template>

<script>
// @ is an alias to /src
import MainNav from "@/components/MainNav.vue";
import SideBar from "@/components/SideBar.vue";
import HelloWorld from "@/components/HelloWorld.vue";

export default {
  name: "home",
  components: {
    MainNav,
    SideBar,
    HelloWorld
  }
};
</script>
