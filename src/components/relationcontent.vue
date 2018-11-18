<template>
  <v-app id="inspire">

    <v-content>
      <v-container fluid fill-height>
        <v-layout>
              <v-flex md12 >        
              <v-btn  slot="activator" color="primary" dark class="mb-2 "    @click="dialog = !dialog">สร้างความสัมพันธ์   <v-icon>add</v-icon></v-btn>
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
                  <td class="text-xs-center">{{ props.item.relation }}</td>                  
                  <td class="text-xs-center">
                  <v-btn  slot="activator" color="info" dark class="mb-2 "   ><v-icon>search</v-icon></v-btn>
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
         เพิ่มหมวดหมู่
        </v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
          <!--   <v-flex xs12 align-center justify-space-between>
              <v-layout align-center>
                <v-avatar size="40px" class="mr-3">
                  <img
                    src="//ssl.gstatic.com/s2/oz/images/sge/grey_silhouette.png"
                    alt=""
                  >
                </v-avatar>
                <v-text-field
                  placeholder="Name"
                ></v-text-field>
              </v-layout>
            </v-flex> -->
         
            <v-flex xs12>
              <v-text-field
                type="tel"
                prepend-icon="book"
                placeholder="ความสัมพันธ์"
                mask="phone"
              ></v-text-field>
            </v-flex>         
               <v-flex xs6>
              <v-text-field
                prepend-icon="book"
                placeholder="LOS"
              ></v-text-field>
            </v-flex>
         
            <v-flex xs6>
              <v-text-field
                prepend-icon="book"
                placeholder="LOS"
              ></v-text-field>
            </v-flex>
          </v-layout>
        </v-container>
        <v-card-actions>
          <v-btn flat color="primary">More</v-btn>
          <v-spacer></v-spacer>
          <v-btn flat color="primary" @click="dialog = false">Cancel</v-btn>
          <v-btn flat @click="dialog = false">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-app>
</template>

<script>
export default {
  data: () => ({
    dialog: false,
    search: "",
    pagination: {},
    selected: [],
    headers: [
      { text: "#", value: "key" },
      { text: "ความสัมพันธ์", value: "relation" },     
      { text: "ตัวเลือก", value: "option" }
    ],
    desserts: [
      {
        key: "1",
        relation: "test"
      },
      {
        key: "2",
        relation: "test"
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
  }
};
</script>