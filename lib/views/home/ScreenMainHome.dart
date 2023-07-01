import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/home/InspirasiPage.dart';
import 'package:foodies/views/home/MengikutiPage.dart';

class ScreenMainHome extends StatefulWidget {
  const ScreenMainHome({super.key});

  @override
  State<ScreenMainHome> createState() => _ScreenMainHomeState();
}

class _ScreenMainHomeState extends State<ScreenMainHome> {
  int _selectedIndex = 0;

  final TextEditingController _inputSeacrhController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Image.asset('assets/images/imgApp/logo.png',
                        fit: BoxFit.fill),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _inputSeacrhController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorConstants.textWhite,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Ganti dengan radius yang diinginkan
                        ),
                        hintText: 'Ketik Bahan Bahan',
                        filled: true,
                        fillColor: Color(0xFF9DB2BF),
                        hintStyle: TextStyle(
                          color: ColorConstants.textWhite,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                        onTap: () => print(_inputSeacrhController.text),
                        child: Icon(Icons.chat)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () => setState(() {
                      _selectedIndex = 0;
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: _selectedIndex == 0 ? 3 : 0,
                        color: _selectedIndex == 0
                            ? ColorConstants.primaryColor
                            : Colors.transparent,
                      ))),
                      child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Mengikuti',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColorConstants.textWhite),
                            ),
                          )),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () => setState(() {
                      _selectedIndex = 1;
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: _selectedIndex == 1 ? 3 : 0,
                        color: _selectedIndex == 1
                            ? ColorConstants.primaryColor
                            : Colors.transparent,
                      ))),
                      child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Insparasi',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColorConstants.textWhite),
                            ),
                          )),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              child: _selectedIndex == 0 ? PageMengikuti() : PageInspirasi(),
            )
          ],
        ),
      ),
    );
  }
}
