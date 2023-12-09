import 'package:flutter/material.dart';

class PastToursPage extends StatelessWidget {
  const PastToursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Tour'),
      ),
      body: const Center(
        child: Text('Past Tours Content Goes Here'),
      ),
    );
  }
}
