<template>
     <v-navigation-drawer
      :clipped="$vuetify.breakpoint.lgAndUp"
      v-model="drawer"
      fixed
      app
    >
      <v-list dense>
         <template>
          <v-layout>
            <v-flex xs6>
              <v-subheader>
               เมนู
              </v-subheader>
            </v-flex>            
          </v-layout>
         <v-list-tile :to="{name: 'subject'}" exact flat>
            <v-list-tile-action>
              <v-icon>contacts</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>
              รายวิชา
              </v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
            <v-list-tile :to="{name: 'los'}" exact flat>
            <v-list-tile-action>
              <v-icon>contacts</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>
              Learning Outcome
              </v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
             <v-list-tile :to="{name: 'category'}" exact flat>
            <v-list-tile-action>
              <v-icon>contacts</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>
              หมวดหมู่ Los
              </v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
             <v-list-tile :to="{name: 'relation'}" exact flat>
            <v-list-tile-action>
              <v-icon>contacts</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>
              ความสัมพันธ์ Los
              </v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </template>
      </v-list>
    </v-navigation-drawer>
</template>

<script>
export default {
  name: "SideBar",
  components: {},
  data: () => ({
    drawer: null,
    
  })
};
</script>

<style>
</style>
