import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_app/utils/constants.dart';

class PickupOptionsListView extends StatefulWidget {
  final Function(PickupOption? value) onSelect;
  const PickupOptionsListView({super.key, required this.onSelect});

  @override
  State<PickupOptionsListView> createState() => _PickupOptionsListViewState();
}

class _PickupOptionsListViewState extends State<PickupOptionsListView> {
  PickupOption groupVal = PickupOption.delivery;
  String carNum = '';

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              RadioListTile<PickupOption>(
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 5,
                  leading: Icon(
                    Icons.directions_car_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Car Takeaway',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  trailing: groupVal == PickupOption.takeaway
                      ? carNum.isEmpty
                          ? IconButton(
                              icon: Icon(Icons.info),
                              color: Colors.red,
                              onPressed: () {
                                showCarNumDialog(context);
                              },
                            )
                          : GestureDetector(
                              onTap: () => showCarNumDialog(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Car Number'),
                                  Text(carNum),
                                ],
                              ),
                            )
                      : SizedBox(),
                ),
                value: PickupOption.takeaway,
                groupValue: groupVal,
                onChanged: (val) {
                  if (carNum.isEmpty) {
                    showCarNumDialog(context).then((value) {
                      if (value != null) {
                        setState(() {
                          groupVal = val!;
                        });
                        widget.onSelect(val);
                      }
                    });
                  } else {
                    setState(() {
                      groupVal = val!;
                    });
                    widget.onSelect(val);
                  }
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.all(18),
              //   child: TextField(),
              // ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: RadioListTile<PickupOption>(
            title: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 5,
                leading: Icon(
                  FontAwesomeIcons.truckRampBox,
                  color: Colors.black,
                ),
                title: Text(
                  'Delivery',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )),
            value: PickupOption.delivery,
            groupValue: groupVal,
            onChanged: (val) {
              setState(() {
                groupVal = val!;
              });
              widget.onSelect(val);
            },
          ),
        ),
      ],
    );
  }

  Future<String?> showCarNumDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 2,
        title: Text('Enter Your Car Number'),
        content: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          autofocus: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: carNum,
          onChanged: (value) => carNum = value,
          validator: (value) {
            return value!.isEmpty ? 'This field is required' : null;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(carNum),
            child: Text('Ok'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
