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
Route.get("/", async ({ request, view }) => {
  const test = {
    test: "test",
    message: " สวัสดีครับ"
  }
  /*   let blogs = await Blog.all();
    blogs = blogs.toJSON(); */
  return view.render('welcome');
});


Route.post("/posts", async ({ request, view }) => {

  let GETDATA = request.post();
  const test = {
    test: "1111",
    message: " 11111"
  }
  return GETDATA;
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
  if(userId){
     data = {
      status: "success"
    };
  }else{
    data = {
      status: "false"
    };
  }
  return data;


});


