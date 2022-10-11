import 'package:flutter/material.dart';

import '../../widgets/order_detail_row_item.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.singleDataMap}) : super(key: key);

  final Map<String, dynamic> singleDataMap;

  List months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  String get orderDate {
    DateTime date = DateTime.parse(singleDataMap['order']['created_at']);
    return '${date.day} ${months[date.month - 1]} ${date.year.toString().substring(2)}, ${date.hour}:${date.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFdbebff),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(bottom: 0.5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView(
              children: [
                RowItem(
                    text1: 'Total Amount',
                    text2: '${singleDataMap['order']['total']} ${singleDataMap['order']['line_items'][0]['currency']}',
                    text3: 'Item QTY',
                    text4: '${singleDataMap['order']['line_items'][0]['qty']}X'),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  color: const Color(0xFFf0f0f0),
                  child: Text(
                    'Order Summery',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),
                ),
                RowItem(text1: 'Order No', text2: '${singleDataMap['order']['order_no']}'),
                Divider(color: Colors.grey.shade400, height: 0),
                RowItem(text1: 'Ordered', text2: orderDate),
                Divider(color: Colors.grey.shade400, height: 0),
                RowItem(text1: 'Payment Status', text2: '${singleDataMap['order']['payment_status']}'),
                Divider(color: Colors.grey.shade400, height: 0),
                RowItem(text1: 'Store Name', text2: '${singleDataMap['order']['additional']['store']['shop_name']}'),
                Divider(color: Colors.grey.shade400, height: 0),
                const RowItem(text1: 'Shipping Type', text2: '-'),
                Divider(color: Colors.grey.shade400, height: 0),
                RowItem(text1: 'Remarks', text2: '${singleDataMap['fulfilment_order']['remarks'] ?? '-'}'),
                Divider(color: Colors.grey.shade400, height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
