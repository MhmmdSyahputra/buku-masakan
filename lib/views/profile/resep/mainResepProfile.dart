import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/utils/myColorApp.dart';

class ResepMainProfile extends StatefulWidget {
  const ResepMainProfile({super.key});

  @override
  State<ResepMainProfile> createState() => _ResepMainProfileState();
}

class _ResepMainProfileState extends State<ResepMainProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
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
              Icons.food_bank,
              size: 200,
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  'Buat catatan Masak',
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
                  'Simpan catatan maskanmu dengan mudah dan aman di Cookpad.',
                  style: TextStyle(
                    color: ColorConstants.textWhite,
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Tulis Resep',
                  style:
                      TextStyle(fontSize: 18, color: ColorConstants.textBlack),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    primary: Color(0XFFF0F0F0)),
              )),
        ],
      ),
    );
  }
}
