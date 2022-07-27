class EmpDelete{
  late String message;
  late String status;
  late String data;
  EmpDelete.fromJson(Map<String,dynamic>json):
      message=json['message'],
  status=json['status'],
  data=json['data'];
}