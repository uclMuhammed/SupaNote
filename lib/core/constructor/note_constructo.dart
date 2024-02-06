import 'package:flutter/cupertino.dart';

class Note extends ChangeNotifier {
  bool? checkbox;
  bool? favorite;
  String? noteid;
  String? title;
  String? time;
  String? content;
  String? password;

  Note(
      {this.checkbox = false,
      this.time,
      this.content,
      this.title,
      this.password,
      this.noteid,
      this.favorite});

  Map<String, dynamic> toJson() => {
        "id": noteid,
        "note_tile": title,
        "password": password,
        "creation_date": time,
        "note_content": content,
        "ischecking": checkbox,
        "favorite": favorite,
      };
}
