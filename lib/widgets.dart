import 'package:flutter/material.dart';

Container listitem(
  context,
  String title,
  String? listdata,
) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 1, horizontal: 7),
    width: MediaQuery.of(context).size.width * 9,
    height: 65,
    child: ListTile(
      title: Text(title),
      subtitle: Text(listdata!),
    ),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        color: Colors.white60,
        borderRadius: BorderRadius.circular(12)),
  );
}

OutlineInputBorder outbid() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.white,
        style: BorderStyle.none,
      ));
}
