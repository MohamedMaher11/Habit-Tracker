import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          Text("Theme"),
          SizedBox(
            width: 10,
          ),
          CupertinoSwitch(
            value: Provider.of<Themeprovider>(context).isdarkmode,
            onChanged: (value) {
              Provider.of<Themeprovider>(context, listen: false).toggletheme();
            },
          ),
        ],
      ),
    );
  }
}
