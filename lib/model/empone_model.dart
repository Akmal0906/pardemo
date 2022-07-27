import 'emp_model.dart';

class EmpOne{
  late String status;
  late String message;
  late Employee data;
   EmpOne.fromJson(Map<String,dynamic>json):
      status=json['status'],
  message=json['message'],
  data=Employee.fromJson(json['data']);

   Map<String,dynamic> toJson()=>{
     'status':status,
     'message':message,
     'data':data.toJson(),
   };
}