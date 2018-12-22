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
              @click="dialog = !dialog;select_add()"
            >สร้างความสัมพันธ์
              <v-icon>add</v-icon>
            </v-btn>

            <v-data-table
              :headers="headers"
              :items="data_relation"
              :search="search"
              :pagination.sync="pagination"
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
                <td class="text-xs-center">{{data_relation[props.index].id}}</td>
                <td class="text-xs-center">{{data_relation[props.index].relate_type}}</td>
                <td class="text-xs-center">{{data_relation[props.index].lo_id}}</td>
                <td class="text-xs-center">{{data_relation[props.index].relate_id}}</td>
                <td class="text-xs-center">
                  <v-btn slot="activator" color="info" dark class="mb-2">
                    <v-icon>search</v-icon>
                  </v-btn>

                  <v-btn
                    slot="activator"
                    color="warning"
                    dark
                    class="mb-2"
                    @click="dialogEdit=true;edit_select(data_relation[props.index].id);select_add();"
                  >
                    <v-icon>edit</v-icon>
                  </v-btn>
                  <v-btn
                    slot="activator"
                    color="red"
                    dark
                    class="mb-2"
                    @click="del_relation(data_relation[props.index].id);"
                  >
                    <v-icon>delete</v-icon>
                  </v-btn>
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
        <v-card-title class="grey lighten-4 py-4 title">เพิ่มความสัมพันธ์</v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <v-flex xs12>
              <v-text-field
                type="text"
                prepend-icon="book"
                placeholder="ความสัมพันธ์"
                v-model="relate_type"
              ></v-text-field>
            </v-flex>
            <v-flex xs6>
              <v-select :items="items" label="LO_ID" v-model="lo_id"></v-select>
            </v-flex>

            <v-flex xs6>
              <v-select :items="items" label="Relate_ID" v-model="relate_id"></v-select>
            </v-flex>
          </v-layout>
        </v-container>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn flat color="primary" @click="dialog = false">Cancel</v-btn>
          <v-btn flat @click="dialog = false;add_relation()">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <v-dialog v-model="dialogEdit" width="800px">
      <v-card>
        <v-card-title class="grey lighten-4 py-4 title">แก้ไขความสัมพันธ์</v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <v-flex xs12>
              <v-text-field
                type="text"
                prepend-icon="book"
                placeholder="ความสัมพันธ์"
                v-model="edit_relate_type"
              ></v-text-field>
            </v-flex>
            <v-flex xs6>
              <v-select :items="items" label="LO_ID"></v-select>
            </v-flex>

            <v-flex xs6>
              <v-select :items="items" label="Relate_ID" v-model="edit_relata_id"></v-select>
            </v-flex>
          </v-layout>
        </v-container>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn flat color="primary" @click="dialogEdit = false">Cancel</v-btn>
          <v-btn flat @click="dialogEdit = false;edit_relation(edit_id)">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-app>
</template>

<script>
const axios = require("axios");
export default {
  data: () => ({
    dialog: false,
    dialogEdit: false,
    search: "",
    pagination: {},
    selected: [],
    items: [],
    data_edit: null,
    edit_id: null,
    edit_lo_id: null,
    edit_relata_id: null,
    edit_relate_type: null,
    data_los: null,
    data_relation: null,
    relate_type: null,
    relate_id: null,
    lo_id: null,
    headers: [
      { text: "#", value: "key" },
      { text: "ความสัมพันธ์", value: "relation" },
      { text: "LOS 1", value: "lo_id" },
      { text: "LOS 2", value: "relate_id" },
      { text: "ตัวเลือก", value: "option" }
    ],
    desserts: []
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
    add_relation: async function() {
      await axios
        .post("http://localhost:3333/add_relation", {
          lo_id: this.lo_id,
          relate_id: this.relate_id,
          relate_type: this.relate_type
        })
        .then(response => (this.info = response));
      window.location.reload();
    },
    edit_select: async function(id) {
      await axios
        .post("http://localhost:3333/select_relation_edit", {
          id: id
        })
        .then(response => (this.data_edit = response.data));
        this.edit_id = this.data_edit[0].id;
      this.edit_lo_id = this.data_edit[0].lo_id;
      this.edit_relata_id = this.data_edit[0].relata_id;
      this.edit_relate_type = this.data_edit[0].relate_type;
    },
    select_add: async function() {
      for (const iterator of this.data_los) {
        this.items.push(iterator.lo_id);
      }
    },
     select_detail: async function(id) {
    
    },
    del_relation: async function(id) {
      var c = confirm("ยืนยันการลบ");
      if (c == true) {
        await axios
          .post("http://localhost:3333/del_relation", {
            id: id
          })
          .then(response => (this.info = response));
        window.location.reload();
      }
    },
    edit_relation: async function(id) {
     await axios
          .post("http://localhost:3333/edit_relation", {
            id: id,
            lo_id: this.edit_lo_id ,
            relate_id:this.edit_relata_id,
            relate_type:this.edit_relate_type,
          })
          .then(response => (this.info = response));
        window.location.reload();
    },
    detail: async function(index) {
      await axios
        .post("http://localhost:3333/select_relation_edit", {
          lo: this.lo,
          knowledge: this.knowledge,
          skill: this.skill,
          attitude: this.attitude
        })
        .then(response => (this.info = response));
      window.location.reload();
    }
  },
  mounted() {
    axios
      .get("http://localhost:3333/select_los")
      .then(response => (this.data_los = response.data));

    axios
      .get("http://localhost:3333/select_relation")
      .then(response => (this.data_relation = response.data));
  }
};
</script>