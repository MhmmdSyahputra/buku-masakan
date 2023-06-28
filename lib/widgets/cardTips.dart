import 'package:flutter/material.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/utils/globalFunction.dart';

class CardTips extends StatefulWidget {
  final data;
  const CardTips({super.key, this.data});

  @override
  State<CardTips> createState() => _CardTipsState();
}

class _CardTipsState extends State<CardTips> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      width: MediaQuery.of(context).size.width / 1.2,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Card(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.person,
                        size: 10,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.data['user'][0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${widget.data['judul']}',
                    style: TextStyle(
                        color: ColorConstants.textWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '18 Jam yg lalu',
                    style: TextStyle(
                      color: ColorConstants.textWhite,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${cutText(widget.data['contentTips'])}',
                    style: TextStyle(
                      color: ColorConstants.textWhite,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.thumb_up,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            color: ColorConstants.textWhite, fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.thumb_down,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            color: ColorConstants.textWhite, fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
