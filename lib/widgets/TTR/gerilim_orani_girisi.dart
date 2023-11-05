import 'package:flutter/material.dart';

class GerilimOraniGirisi extends StatelessWidget {
  final String kademeNo;
  final double paddingDegeri;
  const GerilimOraniGirisi({
    super.key, required this.kademeNo, this.paddingDegeri=10
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Center(child: Text(kademeNo))),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(paddingDegeri),
            child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'hata!';
                  }
                  return null;
                },
                decoration:
                const InputDecoration(border: OutlineInputBorder())),
          ),
        ),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.all(paddingDegeri),
            child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'hata!';
                  }
                  return null;
                },
                decoration:
                const InputDecoration(border: OutlineInputBorder())),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(paddingDegeri),
            child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'hata!';
                  }
                  return null;
                },
                decoration:
                const InputDecoration(border: OutlineInputBorder())),
          ),
        ),
      ],
    );
  }
}