<template>
 <v-toolbar
      :clipped-left="$vuetify.breakpoint.lgAndUp"
      color="purple darken-3"
      dark
      app
      fixed
    >
      <v-toolbar-title style="width: 300px" class="ml-0 pl-3">
        <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
        <span class="hidden-sm-and-down">Learning Outcome</span>
      </v-toolbar-title>
   <!--    <v-text-field
        flat
        solo-inverted
        hide-details
        prepend-inner-icon="search"
        label="Search"
        class="hidden-sm-and-down"
      ></v-text-field> -->
      <v-spacer></v-spacer>
      <v-btn icon large>
        <v-avatar size="32px" tile color="white">
          <img
            src="https://upload.wikimedia.org/wikipedia/th/thumb/e/e6/UPLogo.png/1200px-UPLogo.png"
            alt="Vuetify"
          >
        </v-avatar>
      </v-btn>
    </v-toolbar>
</template>

<script>
import btnlogout from "@/components/btnlogout.vue";
export default {
  name: "MainNav",
  components: {
    btnlogout
  },
  data: () => ({})
};
</script>