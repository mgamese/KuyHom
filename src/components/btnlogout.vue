<template>
<v-btn @click="logoutevent()" exact flat>
 <slot>
    Log Out
 </slot>
</v-btn>
</template>

<script>
export default {
  name: "btnlogout",
  data: () => ({}),
  methods: {
    logoutevent: function() {
      window.alert("Log out Successfuly");
    }
  }
};
</script>

<style>
</style>
