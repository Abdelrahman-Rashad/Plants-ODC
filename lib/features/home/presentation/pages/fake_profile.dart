import 'package:flutter/material.dart';

class FakeProfile extends StatelessWidget {
  const FakeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("FakeProfile"),
      ),
    );
  }
}