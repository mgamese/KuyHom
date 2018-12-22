'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')
const Database = use("Database");

Route.get("/select_los", async ({ request, view }) => {
  const los = await Database.from('los');
  return los;
});
Route.post("/select_edit", async ({ request, view }) => {
  let GETDATA = request.post();
  const los = await Database.from('los').where({
    lo_id:GETDATA.lo_id
  });
  return los;
});
Route.post("/edit_lo", async ({ request, view }) => {
  let GETDATA = request.post();
  await Database.table('los').where('lo_id',GETDATA.lo_id).update({
    lo:GETDATA.edit_lo,
    knowledge:GETDATA.edit_knowledge,
    skill:GETDATA.edit_skill,
    attitude:GETDATA.edit_attitude,
  })
 
});

Route.post("/add_los", async ({ request, view }) => {
  let GETDATA = request.post();
  const userId = await Database
    .table('los')
    .insert({
      lo: GETDATA.lo,
      knowledge: GETDATA.knowledge,
      skill: GETDATA.skill,
      attitude: GETDATA.attitude
    });
  let data;
  if (userId) {
    data = {
      status: "success"
    };
  } else {
    data = {
      status: "false"
    };
  }
  return data;


});

Route.post("/add_relation", async ({ request, view }) => {
  let GETDATA = request.post();
  const relate = await Database
    .table('los_los')
    .insert({
      lo_id: GETDATA.lo_id,
      relate_id: GETDATA.relate_id,
      relate_type: GETDATA.relate_type,
    });

  let data;
  if (relate) {
    data = {
      status: "success"
    };
  } else {
    data = {
      status: "false"
    };
  }
  return data;

});

Route.get("/select_relation", async ({ request, view }) => {
  let relattion = await Database.from('los_los');
  return relattion;
});

Route.post("/select_relation_edit", async ({ request, view }) => {
  let GETDATA = request.post();
  const los_relation= await Database.from('los_los').where({
    id:GETDATA.id
  });
  return los_relation;
});

Route.post("/edit_relation", async ({ request, view }) => {
  let GETDATA = request.post();
  const edit= await Database.table('los_los').where({
    id:GETDATA.id
  }).update({
    lo_id:GETDATA.lo_id,
    relate_id:GETDATA.relate_id,
    relate_type:GETDATA.relate_type,
  });
  if(edit){
    return "success";
  }else{
    return "error";
  }
 
});

Route.post("/del_los", async ({ request, view }) => {
  let GETDATA = request.post();
  const lo = await Database
    .table('los').where({
      lo_id :GETDATA.lo_id
    })
    .delete();
  let data;
  if (lo) {
    data = {
      status: "success"
    };
  } else {
    data = {
      status: "false"
    };
  }
  return data;


});




Route.post("/del_relation", async ({ request, view }) => {
  let GETDATA = request.post();
 let del_relation = await Database.table('los_los').where('id',GETDATA.id).delete();

  let data;
  if (del_relation) {
    data = {
      status: "success"
    };
  } else {
    data = {
      status: "false"
    };
  }
  return data;


});