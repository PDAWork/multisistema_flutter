import 'package:flutter/material.dart';
import 'package:multisitema_flutter/features/master/home/presentation/widget/drawer_app.dart';

class HomeMaster extends StatelessWidget {
  const HomeMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        title: const Text('Мастер'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('sda'),
          ),
        );
      }),
    );
  }
}
