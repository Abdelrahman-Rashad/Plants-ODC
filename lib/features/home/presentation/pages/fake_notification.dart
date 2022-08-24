import 'package:flutter/material.dart';

class FakeNotification extends StatelessWidget {
  const FakeNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("FakeNotification"),
      ),
    );
  }
}