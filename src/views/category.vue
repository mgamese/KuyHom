<template>
  <div class="about">
    <mainNav></mainNav>
     <side-bar></side-bar>
    <CategoryContent></CategoryContent>
  </div>
</template>
<script>
// @ is an alias to /src
import MainNav from "@/components/MainNav.vue";
import SideBar from "@/components/SideBar.vue";
import CategoryContent from "@/components/categorycontent.vue";

export default {
  name: "home",
  components: {
    MainNav,
    SideBar,
    CategoryContent
  }
};
</script>