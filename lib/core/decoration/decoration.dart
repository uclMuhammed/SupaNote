import 'package:flutter/material.dart';

BoxDecoration noteCardDecoration() {
  return const BoxDecoration(
    color: Colors.deepPurple,
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
}

BoxDecoration myBoxDecoration(Color color, double topleft, double topright,
    double bottomleft, double bottomright, Offset offset, Color shadowColor) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(topleft),
      topRight: Radius.circular(topright),
      bottomLeft: Radius.circular(bottomleft),
      bottomRight: Radius.circular(bottomright),
    ),
    boxShadow: [
      BoxShadow(
        color: shadowColor,
        offset: offset,
        blurRadius: 3,
        spreadRadius: 1,
      ),
    ],
  );
}

TextStyle myTitleTextStyle() {
  return const TextStyle(
    color: Colors.deepPurpleAccent,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}

TextStyle myFormTextStyle() {
  return const TextStyle(
    color: Colors.deepPurpleAccent,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

OutlineInputBorder textFormFieldBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(200),
    ),
    borderSide: BorderSide(color: Colors.deepPurple),
    gapPadding: 2,
  );
}

InputDecoration textFormFieldDecoration(String hint, String label) {
  return InputDecoration(
    hintText: hint,
    labelText: label,
    fillColor: Colors.white10,
    enabledBorder: textFormFieldBorderStyle(),
    disabledBorder: textFormFieldBorderStyle(),
    border: textFormFieldBorderStyle(),
    focusedBorder: textFormFieldBorderStyle(),
  );
}
