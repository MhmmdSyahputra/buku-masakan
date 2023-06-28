import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/utils/data.dart';
import 'package:foodies/utils/globalFunction.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/widgets/bannerResep.dart';
import 'package:foodies/widgets/cardTips.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  String? _valueIsiKulkas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('Icon'),
                  ),
                  Expanded(
                    child: TextField(
                      // controller: _inputEmailUserController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorConstants.textWhite,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Ganti dengan radius yang diinginkan
                        ),
                        filled: true,
                        fillColor: Color(0xFF9DB2BF),
                        hintText: 'Ketik Bahan Bahan',
                        hintStyle: TextStyle(
                          color: ColorConstants.textWhite,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.chat),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: ColorConstants.themeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Mengikuti',
                            style: TextStyle(
                                fontSize: 18, color: ColorConstants.textWhite),
                          ))),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: ColorConstants.primaryColor))),
                    child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Insparasi',
                            style: TextStyle(
                                fontSize: 18, color: ColorConstants.textWhite),
                          ),
                        )),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo Reza',
                          style: TextStyle(
                              fontSize: 14, color: ColorConstants.textWhite),
                        ),
                        Text(
                          'Apa isi Kulkasmu?',
                          style: TextStyle(
                              fontSize: 14, color: ColorConstants.textWhite),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: listIsiKulkas.map((res) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: ChoiceChip(
                            backgroundColor: Color(0xFF9DB2BF),
                            selectedColor: _valueIsiKulkas == res['name']
                                ? ColorConstants.primaryColor
                                : Color(0xFF9DB2BF),
                            label: Text(
                              res['name'],
                              style: TextStyle(color: Colors.white),
                            ),
                            selected: _valueIsiKulkas == res['name'],
                            onSelected: (bool selected) {
                              setState(() {
                                _valueIsiKulkas = selected ? res['name'] : null;
                              });
                            },
                          ),
                        );
                      }).toList()),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: ColorConstants.primaryColor))),
                    child: Text(
                      'Semua',
                      style: TextStyle(
                          fontSize: 14, color: ColorConstants.textWhite),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: listResep.map((res) {
                          return BannerResep(data: res);
                        }).toList(),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          // controller: _inputEmailUserController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: ColorConstants.textWhite,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Ganti dengan radius yang diinginkan
                            ),
                            filled: true,
                            fillColor: Color(0xFF9DB2BF),
                            hintText: 'Temukan Ide Lainnya',
                            hintStyle: TextStyle(
                              color: ColorConstants.textWhite,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ingin Makan Apa?',
                          style: TextStyle(
                              fontSize: 14, color: ColorConstants.textWhite),
                        ),
                        Text(
                          'Belum yakin? Yuk lihat ide dari kami',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      children: listResep.take(4).map((res) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(res['cover']),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        '${res['judul']}',
                                        style: TextStyle(
                                            color: ColorConstants.textWhite,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.refresh_sharp,
                                  color: ColorConstants.textBlack,
                                ),
                                Text(
                                  'Pilihin Dong',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorConstants.textBlack),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                primary: Color(0XFFF0F0F0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Tips untuk dapur mu',
                      style: TextStyle(
                          fontSize: 14, color: ColorConstants.textWhite),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: listTips.map((res) {
                          return CardTips(data: res);
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
