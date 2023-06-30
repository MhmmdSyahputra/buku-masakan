import 'package:flutter/material.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/providers/resepProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/widgets/cardListProduct.dart';
import 'package:foodies/widgets/pageEmpty.dart';
import 'package:provider/provider.dart';

class FoodSnapProfile extends StatefulWidget {
  const FoodSnapProfile({super.key});

  @override
  State<FoodSnapProfile> createState() => _FoodSnapProfileState();
}

class _FoodSnapProfileState extends State<FoodSnapProfile> {
  @override
  Widget build(BuildContext context) {
    final provResep = Provider.of<ResepProvider>(context);
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    final checkMyDraf = provResep.resepList
        .where((res) =>
            res.status == 'draft' &&
            res.user[0] == user.username &&
            res.user[1] == user.email)
        .map((res) {})
        .toList()
        .length;
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
        checkMyDraf > 0
            ? Column(
                children: provResep.resepList
                    .where((res) =>
                        res.status == 'draft' &&
                        res.user[0] == user.username &&
                        res.user[1] == user.email)
                    .map((res) {
                  return CardListProduct(action: 'update', data: res);
                }).toList(),
              )
            : PageEmtpyCustom(
                icon: Icon(
                  Icons.food_bank,
                  size: 200,
                ),
                title: 'Yuk kirim Foodsnap',
                subtitle:
                    'Mengirim Cooksnap membantu mencatat perjalanan memasakmu dan membagikan pengalamanmu ke komunitas.Yuk jelajahi setiap resep untuk menemukan inspirasi!',
                txtButton: 'Temukan Inspirasi Resep'),
      ],
    );
  }
}
