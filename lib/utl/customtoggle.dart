import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  CustomSwitch({
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isDarkMode);
      },
      child: Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          color: widget.isDarkMode ? Colors.grey[800] : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: Stack(
          children: <Widget>[
            AnimatedAlign(
              duration: Duration(milliseconds: 300),
              alignment: widget.isDarkMode
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 38,
                height: 38,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: widget.isDarkMode ? Colors.blueAccent : Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: widget.isDarkMode
                      ? Icon(Icons.nightlight_round,
                          color: Colors.white, size: 20)
                      : Icon(Icons.wb_sunny, color: Colors.black, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
