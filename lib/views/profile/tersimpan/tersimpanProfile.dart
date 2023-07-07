import 'package:flutter/material.dart';
import 'package:foodies/model/resepModel.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/providers/resepProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/widgets/cardListProduct.dart';
import 'package:foodies/widgets/pageEmpty.dart';
import 'package:provider/provider.dart';

class TersimpanProfile extends StatefulWidget {
  const TersimpanProfile({super.key});

  @override
  State<TersimpanProfile> createState() => _TersimpanProfileState();
}

class _TersimpanProfileState extends State<TersimpanProfile> {
  bool _search = false;
  List<ResepModel> searchResults = [];
  final TextEditingController _inputSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provResep = Provider.of<ResepProvider>(context);
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    // simpan list iditem yg disimpan di akun user yg login
    List mySaveId = provIdUser.userLoginList
        .where((res) => res.id == user.id)
        .expand((res) => res.mySave)
        .toList();

    // cek apakah data ada atau tidak
    final checkMyDraf = provResep.resepList
        .where((res) => mySaveId.contains(res.id))
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
                        .where((res) => mySaveId.contains(res.id))
                        .map(
                            (res) => CardListProduct(action: 'view', data: res))
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
            :
            // jika data ada maka tampilkan
            checkMyDraf > 0
                ? Column(
                    children: provResep.resepList
                        .where((res) => mySaveId.contains(res.id))
                        .map((res) {
                      return CardListProduct(action: 'view', data: res);
                    }).toList(),
                  )
                //jika tidak ada maka tampilkan page empty
                : PageEmtpyCustom(
                    icon: Icon(
                      Icons.book_rounded,
                      size: 200,
                    ),
                    title: 'Belum ada resep yang tersimpan',
                    subtitle:
                        'Kamu belum menyimpan resep apa pun. cari dan simpan resep untuk melihatnya disini!',
                    txtButton: ''),
      ],
    );
  }
}
