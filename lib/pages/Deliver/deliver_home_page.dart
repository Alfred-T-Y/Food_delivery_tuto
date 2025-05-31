import 'package:flutter/material.dart';
import 'package:food_deliver/components/my_drawer.dart';

class DeliverHomePage extends StatefulWidget {
  const DeliverHomePage({super.key});

  @override
  State<DeliverHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<DeliverHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Let's cook some meal!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 20,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      drawer: MyDrawer(),

    );
  }
}