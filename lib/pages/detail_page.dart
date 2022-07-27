import 'package:flutter/material.dart';
class DetailPage extends StatelessWidget {
  final String? response;

  const DetailPage({Key? key,required this.response}) : super(key: key);
static const String id='detail_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(response!),
      ),
    );
  }
}
