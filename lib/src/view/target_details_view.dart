import 'package:flutter/material.dart';

class AddTargetView extends StatelessWidget {
  const AddTargetView({super.key});

  static const routeName = '/target_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
