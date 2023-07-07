import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/addMenu/resep/screenTambahResep.dart';

class PageEmtpyCustom extends StatefulWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final String txtButton;
  const PageEmtpyCustom(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.txtButton});

  @override
  State<PageEmtpyCustom> createState() => _PageEmtpyCustomState();
}

class _PageEmtpyCustomState extends State<PageEmtpyCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: widget.icon),
        Container(
          child: Column(
            children: [
              Text(
                '${widget.title}',
                style: TextStyle(
                    color: ColorConstants.textWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                '${widget.subtitle}',
                style: TextStyle(
                  color: ColorConstants.textWhite,
                ),
              ),
            ],
          ),
        ),
        widget.txtButton.isNotEmpty
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenTambahResep()));
                  },
                  child: Text(
                    '${widget.txtButton}',
                    style: TextStyle(
                        fontSize: 18, color: ColorConstants.textBlack),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: Color(0XFFF0F0F0)),
                ))
            : Text('')
      ],
    );
  }
}
