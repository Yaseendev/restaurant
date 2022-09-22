import 'package:flutter/material.dart';

class BrachTile extends StatelessWidget {
  const BrachTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 24, top: 2),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(
            width: 2,
            color: Color(0xFFDDDDDD),
          ))),
          child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                      // Chip(
                      //   label: Text('Nearst'),
                      //   labelPadding: EdgeInsets.zero,
                      //   padding: EdgeInsets.symmetric(horizontal: 6),
                      //   backgroundColor: const Color(0xFF00A2D7),
                      //   labelStyle: TextStyle(
                      //     fontSize: 10,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        'Hello',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 5),
                      TextButton(
                        style: TextButton.styleFrom(
                          alignment: Alignment.center,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Directions',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 0,
          width: 50,
          child: Icon(Icons.circle, color: Color(0xFF222222), size: 16),
        ),
      ],
    );
  }
}
