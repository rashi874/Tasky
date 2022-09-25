import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextformfieldCustom extends StatelessWidget {
  final String titles;
  dynamic controllers;

  TextformfieldCustom({
    Key? key,
    required this.titles,
    required this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(186, 207, 207, 209).withOpacity(.2),
      // elevation: 1.5,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: TextFormField(
        controller: controllers,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          border: InputBorder.none,
          hintText: titles,
        ),
      ),
    );
  }
}
