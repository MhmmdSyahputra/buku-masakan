import 'package:flutter/material.dart';
import 'package:foodies/utils/myColorApp.dart';

class ScreenDetailResep extends StatefulWidget {
  final data;
  const ScreenDetailResep({super.key, this.data});

  @override
  State<ScreenDetailResep> createState() => _ScreenDetailResepState();
}

class _ScreenDetailResepState extends State<ScreenDetailResep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Container(
                width: 100,
                // height: 200,
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  widget.data.cover,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                '${widget.data.judul}',
                style: TextStyle(
                    color: ColorConstants.textWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: ListTile(
                title: Text(
                  '${widget.data.user[0]}',
                  style: TextStyle(color: ColorConstants.textWhite),
                ),
                subtitle: Text(
                  '${widget.data.user[1]}',
                  style: TextStyle(color: ColorConstants.textWhite),
                ),
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: ColorConstants.textWhite,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                'Bahah-bahan',
                style: TextStyle(
                    color: ColorConstants.textWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  widget.data.bahan.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${index + 1}. ${widget.data.bahan[index]}',
                      style: TextStyle(color: ColorConstants.textWhite),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                'Langkah-langkah',
                style: TextStyle(
                    color: ColorConstants.textWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  widget.data.step.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${index + 1}. ${widget.data.step[index]}',
                      style: TextStyle(color: ColorConstants.textWhite),
                    ),
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
