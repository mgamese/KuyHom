<template>
  <div class="test">
    <v-btn flat color="primary" @click="getmessage()">GET Alert</v-btn>
      <v-btn flat color="primary" @click="createNewPost()">createNewPost</v-btn>
 {{info }}
  </div>
</template>

<script>
const axios = require("axios");
export default {
  data() {
    return {
      info: null
    };
  },
  watch: {},
  computed: {},
  methods: {


    getmessage: async function() {
      axios
        .get("http://localhost:3333/")
        .then(response => (this.info = response));
    },
    test: async function() {
      this.info = {
        test: "NO"
      };
    },
    createNewPost: async function() {
      let data = await axios
        .post("http://localhost:3333/posts", {
          firstName: "Fred",
          lastName: "Flintstone"
        })
        .then(response => (this.info = response));
    }
  }
};
</script>