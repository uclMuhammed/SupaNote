import 'package:flutter/cupertino.dart';

class Note extends ChangeNotifier {
  bool? checkbox;
  bool? favorite;
  int? id;
  String? noteid;
  String? title;
  String? time;
  String? contents;
  String? password;

  Note(
      {this.checkbox = false,
      this.time,
      this.contents,
      this.title,
      this.id,
      this.password,
      this.noteid,
      this.favorite});

  Map<String, dynamic> toJson() => {
        "noteid": noteid,
        "note_tile": title,
        "password": password,
        "creation_date": time,
        "note_content": contents,
        "ischecking": checkbox,
        "favorite": favorite,
        "id": id
      };
}
