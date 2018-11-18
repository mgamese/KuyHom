<template>
  <v-app id="inspire">

    <v-content>
     
      <v-container fluid fill-height>
        <v-layout>
              <v-flex md12 >                         
              <v-btn  slot="activator" color="primary" dark class="mb-2 "    @click="dialog = !dialog">เพิ่ม LOS   <v-icon>add</v-icon></v-btn>               
              <v-data-table
                :headers="headers"
                :items="desserts"
                :search="search"
                :pagination.sync="pagination"
                hide-actions
                class="elevation-1"
              >
                <template slot="headerCell" slot-scope="props">
                  <v-tooltip bottom>
                    <span slot="activator">
                      {{ props.header.text }}
                    </span>
                    <span>
                      {{ props.header.text }}
                    </span>
                  </v-tooltip>
                </template>
                <template slot="items" slot-scope="props">                
                  <td class="text-xs-center">{{ props.item.key }}</td>
                  <td class="text-xs-center">{{ props.item.los }}</td>
                     <td class="text-xs-center">{{ props.item.los }}</td>
                        <td class="text-xs-center">{{ props.item.los }}</td>
                        <td class="text-xs-center">{{ props.item.los }}</td>
                  <td class="text-xs-center">
                     <v-btn  slot="activator" color="warning" dark class="mb-2 "    @click="dialog = !dialog"><v-icon>edit</v-icon></v-btn>
                    <v-btn  slot="activator" color="red" dark class="mb-2 "   ><v-icon>delete</v-icon></v-btn>
                  </td>               
                </template>
              </v-data-table>
              <div class="text-xs-center pt-2">
                <v-pagination v-model="pagination.page" :length="pages"></v-pagination>
              </div>
           
            </v-flex>
              
        </v-layout>   
             
      </v-container>
      
    </v-content>

    <v-dialog v-model="dialog" width="800px">
      <v-card>
        <v-card-title
          class="grey lighten-4 py-4 title"
        >
         เพิ่ม Learning Outcome
        </v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>        
             <v-flex xs12>
              <v-text-field
                prepend-icon="book"
                placeholder="ชื่อของ LOS"
                v-model="lo"
              ></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field
                prepend-icon="book"
                placeholder="ความรู้ที่จะได้รับ" v-model="knowledge"
              ></v-text-field>
            </v-flex>
         
            <v-flex xs12>
              <v-text-field
                prepend-icon="book"
                placeholder="ทักษะที่จะต้องได้รับ" v-model="skill"
              ></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field
                
                prepend-icon="book"
                placeholder="ที่ต้องการฝึกฝน" v-model="attitude"
           
              ></v-text-field>
            </v-flex>         
          </v-layout>
        </v-container>
        <v-card-actions>
      
          <v-spacer></v-spacer>
          <v-btn flat color="primary" @click="dialog = false">Cancel</v-btn>
          <v-btn flat @click="dialog = false;add_los();">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-app>
</template>

<script>
const axios = require("axios");
export default {
  data: () => ({
    info: null,
    lo: null,
    knowledge: null,
    skill: null,
    attitude: null,
    dialog: false,
    search: "",
    pagination: {},
    selected: [],
    headers: [
      { text: "#", value: "key" },
      { text: "LOS", value: "los" },
      { text: "ความรู้ที่ได้รับ", value: "option" },
      { text: "ทักษะ", value: "option" },
      { text: "ที่ต้องฝึกฝน", value: "option" },
      { text: "ตัวเลือก", value: "option" }
    ],
    desserts: [
      /*   {
        key: "1",
        los: "los1"
      } */
    ]
  }),
  computed: {
    pages() {
      if (
        this.pagination.rowsPerPage == null ||
        this.pagination.totalItems == null
      )
        return 0;

      return Math.ceil(
        this.pagination.totalItems / this.pagination.rowsPerPage
      );
    }
  },
  methods: {
    /*  deletePost: async function(id) {
      let data = await axios
        .delete(`http://10.94.98.239:3333/api/posts/${id}`)
        .then(r => {
          return r.data;
          
        });

      await this.LoadPostsArray();
    } */
    /*     createNewPost: async function() {
      let data = await axios
        .post("http://10.94.98.239:3333/api/posts", this.createPostForm)
        .then(r => {
          return r.data;
        });

      await this.LoadPostsArray();
      this.createPostForm = {};
    }, */
    /*     LoadPostsArray: async function() {
    await postStore.dispatch('loadPosts')
    } */

    add_los: async function() {
      let data = await axios
        .post("http://localhost:3333/add_los", {
          lo: this.lo,
          knowledge: this.knowledge,
          skill: this.skill,
          attitude: this.attitude
        })
        .then(response => (this.info = response));
      window.location.reload();
    },

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