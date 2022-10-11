import 'package:flutter/material.dart';

import '../../library/json.dart';
import '../../widgets/order_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // JSON List Map Data
  List<Map<String, dynamic>> get myList => mapJson['data'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (_, i) {
            Map<String, dynamic> singleDataMap = myList[i];
            return OrderWidget(singleDataMap: singleDataMap);
          },
        ),
      ),
    );
  }
}
