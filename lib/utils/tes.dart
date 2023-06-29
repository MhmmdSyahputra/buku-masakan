import 'package:flutter/material.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/providers/resepProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:provider/provider.dart';

class ScreenTambahResep extends StatefulWidget {
  const ScreenTambahResep({super.key});

  @override
  State<ScreenTambahResep> createState() => _ScreenTambahResepState();
}

class _ScreenTambahResepState extends State<ScreenTambahResep> {
  int _inputBahan = 2;
  int _inputStep = 1;
  _addInput(String tipe) {
    setState(() {
      if (tipe == 'bahan') {
        _inputBahan++;
      } else {
        _inputStep++;
      }
    });
  }

  final TextEditingController _inputBahanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provResep = Provider.of<ResepProvider>(context);
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.themeColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {}, child: Text('Simpan')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: List.generate(
                    _inputBahan,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ListTile(
                            leading: Icon(
                              Icons.list,
                              color: ColorConstants.textWhite,
                            ),
                            title: TextFormField(
                              controller: _inputBahanController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Ganti dengan radius yang diinginkan
                                ),
                                filled: true,
                                fillColor: Colors.grey,
                                hintText: 'Bahan ${index + 1}',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                              ),
                            ),
                            trailing: Icon(
                              Icons.more_horiz,
                              color: ColorConstants.textWhite,
                            ),
                          ),
                        )),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: _addInput('bahan'),
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: ColorConstants.textWhite,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Bahan',
                              style: TextStyle(
                                  color: ColorConstants.textWhite,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Langkah',
                  style: TextStyle(
                      color: ColorConstants.textWhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
