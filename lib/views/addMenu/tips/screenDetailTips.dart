import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/utils/globalFunction.dart';
import 'package:foodies/utils/myColorApp.dart';

class ScreenDetailTips extends StatefulWidget {
  final data;
  const ScreenDetailTips({super.key, this.data});

  @override
  State<ScreenDetailTips> createState() => _ScreenDetailTipsState();
}

class _ScreenDetailTipsState extends State<ScreenDetailTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.themeColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.data.judul,
                  style: TextStyle(
                      color: ColorConstants.textWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: List.generate(widget.data.step.length, (index) {
                    return Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Image.asset(randomImage()),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                '${widget.data.step[index]}',
                                style:
                                    TextStyle(color: ColorConstants.textWhite),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }),
                ),
              ),
              Divider(
                color: ColorConstants.textWhite,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 100,
                            color: ColorConstants.textWhite,
                          ),
                          Container(
                            child: Text(
                              'Diterbitkan Oleh',
                              style: TextStyle(color: ColorConstants.textWhite),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${widget.data.user[0]}',
                              style: TextStyle(
                                  color: ColorConstants.textWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
