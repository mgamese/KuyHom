<template>
  <v-app id="inspire">
    <v-content>
      <v-container fluid fill-height>
        <v-layout>
          <v-flex md12>
            <v-btn
              slot="activator"
              color="primary"
              dark
              class="mb-2"
              @click="dialog = !dialog"
            >เพิ่ม LOS
              <v-icon>add</v-icon>
            </v-btn>

            <!--  
            <v-data-table         :headers="headers"           :items="data_los"           :search="search"        :pagination.sync="pagination"
              hide-actions
              class="elevation-1"
            >
              <template slot="headerCell" slot-scope="props">
                <v-tooltip bottom>
                  <span slot="activator">{{ props.header.text }}</span>
                  <span>{{ props.header.text }}</span>
                </v-tooltip>
              </template>
              <template slot="items" slot-scope="props">
                <td class="text-xs-center">{{data_los[props.index].lo_id}}</td>
                <td class="text-xs-center">{{data_los[props.index].lo}}</td>
                <td class="text-xs-center">{{data_los[props.index].knowledge}}</td>
                <td class="text-xs-center">{{data_los[props.index].skill}}</td>
                <td class="text-xs-center">{{data_los[props.index].attitude}}</td>
                <td class="text-xs-center">
                  <v-btn
                    slot="activator"
                    color="warning"
                    dark
                    class="mb-2"
                    @click="dialog = !dialog"
                  >
                    <v-icon>edit</v-icon>
                  </v-btn>
                  <v-btn slot="activator" color="red" dark class="mb-2">
                    <v-icon>delete</v-icon>
                  </v-btn>
                </td>
              </template>
            </v-data-table>
            <div class="text-xs-center pt-2">
              <v-pagination v-model="pagination.page" :length="pages"></v-pagination>
            </div>-->
            <v-data-table :headers="headers" :items="data_los" class="elevation-1">
              <template slot="items" slot-scope="props">
                <td class="text-xs-center">{{data_los[props.index].lo_id}}</td>
                <td class="text-xs-center">{{data_los[props.index].lo}}</td>
                <td class="text-xs-center">{{data_los[props.index].knowledge}}</td>
                <td class="text-xs-center">{{data_los[props.index].skill}}</td>
                <td class="text-xs-center">{{data_los[props.index].attitude}}</td>
                <td class="justify-center layout px-0">
                  <v-icon small class="mr-2" @click="editItem(props.index)">edit</v-icon>
                  <v-icon small @click="deleteItem(props.index)">delete</v-icon>
                </td>
              </template>
              <template slot="no-data">
                <td class="text-xs-center" colspan="7">No data Avalible</td>
              </template>
            </v-data-table>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>

    <v-dialog v-model="dialog" width="800px">
      <v-card>
        <v-card-title class="grey lighten-4 py-4 title">เพิ่ม Learning Outcome</v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <v-flex xs12>
              <v-text-field prepend-icon="book" placeholder="ชื่อของ LOS" v-model="lo"></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field
                prepend-icon="book"
                placeholder="ความรู้ที่จะได้รับ"
                v-model="knowledge"
              ></v-text-field>
            </v-flex>

            <v-flex xs12>
              <v-text-field prepend-icon="book" placeholder="ทักษะที่จะต้องได้รับ" v-model="skill"></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field prepend-icon="book" placeholder="ที่ต้องการฝึกฝน" v-model="attitude"></v-text-field>
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

    <v-dialog v-model="edit" width="800px">
      <v-card>
        <v-card-title class="grey lighten-4 py-4 title">แก้ไข Learning Outcome</v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <v-flex xs12>
              <v-text-field prepend-icon="book" placeholder="ชื่อของ LOS" v-model="lo"></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field
                prepend-icon="book"
                placeholder="ความรู้ที่จะได้รับ"
                v-model="knowledge"
              ></v-text-field>
            </v-flex>

            <v-flex xs12>
              <v-text-field prepend-icon="book" placeholder="ทักษะที่จะต้องได้รับ" v-model="skill"></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field prepend-icon="book" placeholder="ที่ต้องการฝึกฝน" v-model="attitude"></v-text-field>
            </v-flex>
          </v-layout>
        </v-container>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn flat color="primary" @click="edit = false">Cancel</v-btn>
          <v-btn flat @click="edit = false;">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-app>
</template>

<script>
const axios = require("axios");
export default {
  data: () => ({
    data_los: null,
    info: null,
    lo: null,
    knowledge: null,
    skill: null,
    attitude: null,
    dialog: false,
    edit: false,
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
      {
        key: "1",
        los: "los1"
      }
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
    select_los: async function() {
      axios
        .get("http://localhost:3333/select_los")
        .then(response => (this.data_los = response));
    },
    editItem(item) {
      this.editedIndex = this.data_los.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.edit = true;
    },

    deleteItem(item) {
      const index = this.desserts.indexOf(item);
      confirm("Are you sure you want to delete this item?") &&
        this.desserts.splice(index, 1);
    },

    close() {
      this.edit = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },

    save() {
      if (this.editedIndex > -1) {
        Object.assign(this.desserts[this.editedIndex], this.editedItem);
      } else {
        this.desserts.push(this.editedItem);
      }
      this.close();
    }
  },
  mounted() {
    axios
      .get("http://localhost:3333/select_los")
      .then(response => (this.data_los = response.data));
  }
};
</script>