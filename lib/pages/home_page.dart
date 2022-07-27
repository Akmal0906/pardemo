import 'package:flutter/material.dart';
import 'package:pardemo/model/create_emp.dart';
import 'package:pardemo/model/emp_model.dart';
import 'package:pardemo/model/emp_new.dart';
import 'package:pardemo/pages/detail_page.dart';
import 'package:pardemo/services/http_service.dart';

import '../model/emplist_model.dart';
import '../model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
static const String id='home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> item=[];
  void _apiList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) =>{
      print(response),
      showresponse(response!),
    });
  }
  // void _apiUpdatePost(User user){
  //   Network.PUT(Network.API_UPDATE+user.id.toString(), Network.paramsUpdate(user)).then((value) => print(value),);
  // }
  void _apiCreatePost(User user){
    Network.POST(Network.API_CREATE, Network.paramsCreate(user)).then((value) => print(value),);
   }
  // void _apiDeletePost(User user){
  //   Network.DEL(Network.API_DELETE+user.id.toString(), Network.paramsEmpty()).then((value) => print(value),);
  // }

  void _empone(int id){
    Network.GET(Network.API_LIST_id+id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      showresponse(response!),
    });
  }
  void showresponse(String response){
   EmpList empList=Network.parseEmpList(response);
    //EmpCreate empCreate=Network.parseEmpCreate(response);
   setState((){
     item=empList.data;
   });
   // print(empList.data.length);
  //  EmpOne empOne=Network.parseEmpone(response);
   // print(empOne.data.employee_name);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var user=User(age: 22, id: 1, salary: 'Cara', name: 'Richard',);
    _apiList();
    //_apiCreatePost(user);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (ctx, i) {
            return _itemWidget(item[i]);
          }),
    );
  }

    Widget _itemWidget(Employee emp){
    return GestureDetector(
      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailPage(response: '${emp.employee_name} ${emp.employee_salary}\$',)));
      },
      child:  Container(
        padding:const EdgeInsets.all(20),
        margin:const EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${emp.employee_name}  (${emp.employee_age})"),
              const SizedBox(height: 10,),
            Text("${emp.employee_salary} \$"),
          ],
        ),
      ),
    );
  }
}
