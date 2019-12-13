import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final String title;
  final Widget icon;

  ServiceCard(this.title,
      {this.onPressed, this.color = Colors.amber, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        elevation: 7,
        fillColor: Colors.white,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: SizedBox.expand(
                child: Material(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: icon,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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
