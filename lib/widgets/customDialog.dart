import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String subtile;
  final Color color;
  final Icon icon;
  const CustomDialog(
      {super.key,
      required this.title,
      required this.subtile,
      required this.color,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
                width: 250,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                  child: Column(
                    children: [
                      Text(
                        '${title}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${subtile}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 35,
                          ),
                        ),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -30,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: color,
                    radius: 26,
                    child: icon,
                    // Icon(
                    //   Icons.check,
                    //   size: 30,
                    //   color: Colors.white,
                    // ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
