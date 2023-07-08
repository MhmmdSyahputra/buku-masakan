import 'package:flutter/material.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/providers/resepProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ScreenTambahResep2 extends StatefulWidget {
  final data;
  const ScreenTambahResep2({super.key, this.data});

  @override
  State<ScreenTambahResep2> createState() => _ScreenTambahResep2State();
}

class _ScreenTambahResep2State extends State<ScreenTambahResep2> {
  ImageProvider? gambar;
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        gambar = MemoryImage(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provResep = Provider.of<ResepProvider>(context);
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gambar == null
                ? InkWell(
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.grey,
                      child: Center(
                        child: Icon(Icons.image, color: Colors.black54),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        getFromGallery();
                      });
                    },
                  )
                : InkWell(
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: gambar!,
                        fit: BoxFit.cover,
                      )),
                    ),
                    onTap: () {
                      setState(() {
                        getFromGallery();
                      });
                    },
                  ),
          ],
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
