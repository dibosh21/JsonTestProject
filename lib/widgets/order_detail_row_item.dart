import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  const RowItem({Key? key, required this.text1, required this.text2, this.text3, this.text4}) : super(key: key);

  final String text1;
  final String text2;
  final String? text3;
  final String? text4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text1,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
              Text(
                text3 ?? '',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text2,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade900),
              ),
              Text(
                text4 ?? '',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade900),
              ),
            ],
          )
        ],
      ),
    );
  }
}
