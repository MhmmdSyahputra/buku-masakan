import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/utils/myColorApp.dart';

class TersimpanProfile extends StatefulWidget {
  const TersimpanProfile({super.key});

  @override
  State<TersimpanProfile> createState() => _TersimpanProfileState();
}

class _TersimpanProfileState extends State<TersimpanProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
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
                    fillColor: ColorConstants.textBlack,
                    hintText: 'Cari 0 Resep',
                    hintStyle: TextStyle(
                      color: ColorConstants.textWhite,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Icon(
            Icons.book,
            size: 200,
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(
                'Belum ada resep yang tersimpan',
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
                'kamu belum menyimpan resep apa pun. cari dan simpan resep untuk melihatnya disini!',
                style: TextStyle(
                  color: ColorConstants.textWhite,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
