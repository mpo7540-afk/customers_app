import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> customers = [];

  void addCustomer(String name) {
    setState(() {
      customers.add({
        "name": name,
        "total": 0,
        "paid": 0,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customers / الزبائن")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              TextEditingController c = TextEditingController();
              return AlertDialog(
                title: const Text("Add Customer"),
                content: TextField(controller: c),
                actions: [
                  TextButton(
                    onPressed: () {
                      addCustomer(c.text);
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              title: Text(customers[i]["name"]),
              subtitle: Text("Remaining: 0"),
            ),
          );
        },
      ),
    );
  }
}
