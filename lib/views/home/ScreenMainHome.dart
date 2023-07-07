import 'package:flutter/material.dart';
import 'package:foodies/model/resepModel.dart';
import 'package:foodies/providers/resepProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/home/InspirasiPage.dart';
import 'package:foodies/views/home/MengikutiPage.dart';
import 'package:foodies/widgets/cardListProduct.dart';
import 'package:provider/provider.dart';

class ScreenMainHome extends StatefulWidget {
  @override
  State<ScreenMainHome> createState() => _ScreenMainHomeState();
}

class _ScreenMainHomeState extends State<ScreenMainHome> {
  int _selectedIndex = 0;
  bool _search = false;
  List<ResepModel> searchResults = [];

  final TextEditingController _inputSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provResep = Provider.of<ResepProvider>(context);

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
                      onEditingComplete: () => setState(() {
                        _search = true;
                        searchResults = provResep.resepList
                            .where((entry) => entry.judul
                                .toLowerCase()
                                .contains(
                                    _inputSearchController.text.toLowerCase()))
                            .toList();
                      }),
                      controller: _inputSearchController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      child: Icon(Icons.chat_bubble),
                    ),
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
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Mengikuti',
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorConstants.textWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Inspirasi',
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorConstants.textWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: _search
                  ? searchResults.length > 0
                      ? Column(
                          children: searchResults
                              .map((res) =>
                                  CardListProduct(action: 'view', data: res))
                              .toList(),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Data Tidak Ada',
                            style: TextStyle(
                                color: ColorConstants.textWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                  : _selectedIndex == 0
                      ? PageMengikuti()
                      : PageInspirasi(),
            ),
          ],
        ),
      ),
    );
  }
}
