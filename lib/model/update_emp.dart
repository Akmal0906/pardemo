class EmpUpdate{
  late String message;
  late String status;
  EmpUpdate.fromJson(Map<String,dynamic>json):
      message=json['message'],
  status=json['status'];

  Map<String,dynamic> toJson()=>{
    'message':message,
    'status':status
  };
}