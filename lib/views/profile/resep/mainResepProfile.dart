import 'package:flutter/material.dart';
import 'package:foodies/model/resepModel.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/providers/resepProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/widgets/cardListProduct.dart';
import 'package:foodies/widgets/pageEmpty.dart';
import 'package:provider/provider.dart';

class ResepMainProfile extends StatefulWidget {
  const ResepMainProfile({super.key});

  @override
  State<ResepMainProfile> createState() => _ResepMainProfileState();
}

class _ResepMainProfileState extends State<ResepMainProfile> {
  bool _search = false;
  List<ResepModel> searchResults = [];
  final TextEditingController _inputSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provResep = Provider.of<ResepProvider>(context);
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    final checkMyResep = provResep.resepList
        .where((res) =>
            res.status == 'publish' &&
            res.user[0] == user.username &&
            res.user[1] == user.email)
        .map((res) {})
        .toList()
        .length;

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
                    style: TextStyle(color: ColorConstants.textWhite),
                    onEditingComplete: () => setState(() {
                      _search = true;
                      searchResults = provResep.resepList
                          .where((entry) => entry.judul.toLowerCase().contains(
                              _inputSearchController.text.toLowerCase()))
                          .toList();
                    }),
                    controller: _inputSearchController,
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
          _search //jika mode search
              ? searchResults.length > 0
                  ? Column(
                      children: searchResults
                          .where((res) =>
                              res.status == 'publish' &&
                              res.user[0] == user.username &&
                              res.user[1] == user.email)
                          .map((res) =>
                              CardListProduct(action: 'view', data: res))
                          .toList(),
                    )
                  : const Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Data Tidak Ada',
                        style: TextStyle(
                            color: ColorConstants.textWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
              : checkMyResep > 0
                  ? Column(
                      children: provResep.resepList
                          .where((res) =>
                              res.status == 'publish' &&
                              res.user[0] == user.username &&
                              res.user[1] == user.email)
                          .map((res) {
                        return CardListProduct(action: 'view', data: res);
                      }).toList(),
                    )
                  : PageEmtpyCustom(
                      icon: Icon(
                        Icons.food_bank,
                        size: 200,
                      ),
                      title: 'Buat catatan Masak',
                      subtitle:
                          'Simpan catatan maskanmu dengan mudah dan aman di Cookpad.',
                      txtButton: 'Temukan Inspirasi Resep'),
        ],
      ),
    );
  }
}
