import 'package:flutter/material.dart';

class TTR extends StatefulWidget {
  const TTR({Key? key}) : super(key: key);

  @override
  State<TTR> createState() => _TTRState();
}

class _TTRState extends State<TTR> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("TTR"),),
    );
  }
}
