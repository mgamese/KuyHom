<template>
  <div class="about">
    <mainNav></mainNav>
     <side-bar></side-bar>
    <RelationContent></RelationContent>
  </div>
</template>
<script>
// @ is an alias to /src
import MainNav from "@/components/MainNav.vue";
import SideBar from "@/components/SideBar.vue";
import RelationContent from "@/components/relationcontent.vue";

export default {
  name: "home",
  components: {
    MainNav,
    SideBar,
    RelationContent
  }
};
</script>