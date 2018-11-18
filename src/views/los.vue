<template>
  <div class="about">
    <mainNav></mainNav>
     <side-bar></side-bar>
    <LosContent></LosContent>
  </div>
</template>

<script>
// @ is an alias to /src
import MainNav from "@/components/MainNav.vue";
import SideBar from "@/components/SideBar.vue";
import LosContent from "@/components/loscontent.vue";

export default {
  name: "home",
  components: {
    MainNav,
    SideBar,
    LosContent
  }
};
</script>