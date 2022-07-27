import 'dart:convert';

import 'package:http/http.dart';
import 'package:pardemo/model/create_emp.dart';
import 'package:pardemo/model/emplist_model.dart';
import 'package:pardemo/model/empone_model.dart';


import '../model/user_model.dart';

class Network{
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /*Http API */
  static String API_LIST = "/api/v1/employees";
  static String API_LIST_id = "/api/v1/employee/";//{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}
  /*Http request*/
static Future<String?>GET(String api,Map<String,String> params)async{
  var uri=Uri.https(BASE, api,params);
  var response= await get(uri,headers: headers);
  if(response.statusCode==200){
    return response.body;
  }
  return null;
}

  static Future<String?>POST(String api,Map<String,String> params)async{
    var uri=Uri.https(BASE, api);
    var response= await post(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200||response.statusCode==201){
      return response.body;
    }
    return null;
  }

  static Future<String?>PUT(String api,Map<String,String> params)async{
    var uri=Uri.https(BASE, api);
    var response= await put(uri,headers: headers,body:jsonEncode(params));
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }

  static Future<String?>DEL(String api,Map<String,String> params)async{
    var uri=Uri.https(BASE, api,params);
    var response= await delete(uri,headers: headers);
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }

/*Http params*/
static Map<String,String> paramsEmpty(){
  Map<String,String> map={};
  return map;
}

  static Map<String,String> paramsUpdate(User user){
    Map<String,String> params={};
    params.addAll({
      'name':user.name,
      'id':user.id.toString(),
      'salary':user.salary,
      'age':user.age.toString(),
    });
    return params;
  }
  static Map<String,String>paramsCreate(User user){
    Map<String,String> params={};
    params.addAll({
      'name':user.name,
      'id':user.id.toString(),
      'salary':user.salary,
      'age':user.age.toString(),
    });
    return params;
  }

/*Http parse*/
static EmpList parseEmpList(String response){
  dynamic json=jsonDecode(response);
  var data=EmpList.fromJson(json);
  return data;
}

static EmpOne parseEmpone(String response){
  dynamic json=jsonDecode(response);
  var data=EmpOne.fromJson(json);
  return data;
}

  static EmpCreate parseEmpCreate(String response){
    dynamic json=jsonDecode(response);
    var data=EmpCreate.fromJson(json);
    return data;
  }
}