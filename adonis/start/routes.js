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




