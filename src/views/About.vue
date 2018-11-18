<template>
  <div class="about">
    <mainNav></mainNav>
     <side-bar></side-bar>
    <AboutContent></AboutContent>
  </div>
</template>
<script>
// @ is an alias to /src
import MainNav from "@/components/MainNav.vue";
import SideBar from "@/components/SideBar.vue";
import AboutContent from "@/components/AboutContent";

export default {
  name: "home",
  components: {
    MainNav,
    SideBar,
    AboutContent
  }
};
</script>