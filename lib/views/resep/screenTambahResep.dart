import 'package:flutter/material.dart';
import 'package:foodies/utils/myColorApp.dart';

class ScreenTambahResep extends StatefulWidget {
  const ScreenTambahResep({super.key});

  @override
  State<ScreenTambahResep> createState() => _ScreenTambahResepState();
}

class _ScreenTambahResepState extends State<ScreenTambahResep> {
  int _inputBahan = 2;
  int _inputStep = 1;
  // membuat fungsi setstate
  void _addInputBahan() {
    setState(() {
      _inputBahan++;
    });
  }

  void _addInputStep() {
    setState(() {
      _inputStep++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.themeColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {}, child: Text('Simpan')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {}, child: Text('Terbitkan')),
          ),
          PopupMenuButton<MenuItem>(
              onSelected: (value) {
                if (value == MenuItem.Profil) {
                } else if (value == MenuItem.Pengaturan) {
                } else if (value == MenuItem.Logout) {}
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: MenuItem.Pengaturan, child: Text('Pengaturan')),
                    PopupMenuItem(
                        value: MenuItem.Pengaturan, child: Text('Pengaturan')),
                    PopupMenuItem(
                        value: MenuItem.Logout, child: Text('Logout')),
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  // controller: _inputEmailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Ganti dengan radius yang diinginkan
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: 'Judul: Sup Ayam',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                  // controller: _inputEmailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Ganti dengan radius yang diinginkan
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    hintText:
                        'Cerita di balik masakan ini. Apa atau siapa yang menginspirasimu? Apa yang membuatnya istimewa? Bagaimana caramu menikmatinya?',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  // controller: _inputEmailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Ganti dengan radius yang diinginkan
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: 'Masukkan daerah asal resep',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        'Porsi',
                        style: TextStyle(
                            color: ColorConstants.textWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        // controller: _inputEmailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Ganti dengan radius yang diinginkan
                          ),
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: '2 orang',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        'Lama memasak',
                        style: TextStyle(
                            color: ColorConstants.textWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        // controller: _inputEmailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Ganti dengan radius yang diinginkan
                          ),
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: '1 jam 30 menit',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Bahan',
                  style: TextStyle(
                      color: ColorConstants.textWhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
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
                            title: TextField(
                              // controller: _inputEmailController,
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
                      onTap: _addInputBahan,
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
              Column(
                children: List.generate(
                    _inputStep,
                    (index) => Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            child: ListTile(
                              leading: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    child: Text('${index + 1}'),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Icon(
                                    Icons.list,
                                    color: ColorConstants.textWhite,
                                  )
                                ],
                              ),
                              title: TextField(
                                // controller: _inputEmailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        15), // Ganti dengan radius yang diinginkan
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey,
                                  hintText: 'Step ${index + 1}',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                ),
                              ),
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
                      onTap: _addInputStep,
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
                              'Langkah',
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
            ],
          ),
        ),
      ),
    );
  }
}

enum MenuItem {
  Profil,
  Pengaturan,
  Logout,
}
