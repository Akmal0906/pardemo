import 'package:pardemo/model/emp_new.dart';

class EmpCreate{
  late String status;
  late EmployeeNew data;
  late String message;

  EmpCreate.fromJson(Map<String,dynamic> json):
      status=json['status'],
  message=json['message'],
  data=EmployeeNew.fromJson(json['data']);

  Map<String,dynamic> toJson()=>{
    'status':status,
    'message':message,
    'data':data.toJson(),
  };
}