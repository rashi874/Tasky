import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Material(
            elevation: 1.5,
            shadowColor: const Color.fromARGB(121, 137, 137, 137),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                hintText: "Search by Events and tasks ",
              ),
            ),
          ),
        ),
        body: Container());
  }
}
