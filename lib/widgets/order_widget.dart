import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../views/details/detail_screen.dart';

class OrderWidget extends StatelessWidget {
  OrderWidget({Key? key, required this.singleDataMap}) : super(key: key);

  final Map<String, dynamic> singleDataMap;

  List months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  String get orderDate {
    DateTime date = DateTime.parse(singleDataMap['order']['created_at']);
    return '${date.day} ${months[date.month - 1]} ${date.year.toString().substring(2)}, ${date.hour}:${date.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailScreen(singleDataMap: singleDataMap))),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 150,
        margin: const EdgeInsets.only(bottom: 0.5),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 20, top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${singleDataMap['order']['order_no']}',
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                Assets.assetsSopify,
                                height: 28,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Ordered: $orderDate | ${singleDataMap['order']['line_items'][0]['qty']} Times',
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Total Amount: ${singleDataMap['order']['total']} ${singleDataMap['order']['line_items'][0]['currency']}',
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      Assets.assetsArrowblue,
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFf9f9f9),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fulfilments (${singleDataMap['additional']['fulfilment_ids_count']})',
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      Image.asset(
                        Assets.assetsArrowdown,
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
