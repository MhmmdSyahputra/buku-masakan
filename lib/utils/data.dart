import 'package:flutter/material.dart';
import 'package:foodies/utils/myColorApp.dart';

List listIsiKulkas = [
  {'name': 'Ikan'},
  {'name': 'Ayam'},
  {'name': 'Bayam'},
  {'name': 'Jagung'},
  {'name': 'Bawang Bombay'},
  {'name': 'Sawi'},
  {'name': 'Telur'},
];

List listResep = [
  {
    'id': 'enrvu3un3v',
    'user': ['bintang sinaga', '@bangnaga52'],
    'judul': 'Spaghetti Aglio e Olio',
    'cerita': [
      'lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit',
      'jawa'
    ],
    'porsi': '5',
    'lamaWaktu': '1 jam 30 mnenit',
    'status': 'draft',
    'cover': 'assets/images/imgResep/Spaghetti.png',
    'bahan': [
      '200 gram spaghetti',
      '4 siung bawang putih, cincang halus',
      '1 sendok teh cabai kering, hancurkan',
      '4 sendok makan minyak zaitun',
      'Garam secukupnya',
      'Parmesan parut untuk taburan',
      'Peterseli cincang untuk taburan'
    ],
    'step': [
      'Rebus spaghetti dalam air mendidih yang telah diberi garam hingga al dente. Tiriskan dan sisihkan.',
      'Panaskan minyak zaitun dalam wajan dengan api sedang. Tumis bawang putih cincang dan cabai kering hingga harum dan berubah warna kecokelatan.',
      'Masukkan spaghetti yang telah direbus ke dalam wajan. Aduk rata hingga spaghetti terbalut dengan minyak dan bumbu.',
      'Tambahkan sedikit garam secukupnya, sesuai selera. Aduk kembali hingga merata.',
      'Angkat spaghetti dan sajikan di atas piring saji. Taburi dengan parmesan parut dan peterseli cincang.',
      'Spaghetti Aglio e Olio siap disajikan.'
    ]
  },
  {
    'id': '3i493h84n',
    'user': ['John Doe', '@johndoe'],
    'judul': 'Mie Goreng Spesial',
    'cerita': [
      'lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit',
      'jawa'
    ],
    'porsi': '5',
    'lamaWaktu': '1 jam 30 mnenit',
    'status': 'publish',
    'cover': 'assets/images/imgResep/MieGorengSpesial.png',
    'bahan': [
      '2 bungkus mie instan',
      '100 gram daging ayam, potong dadu',
      '1 butir telur',
      '1 batang daun bawang, iris tipis',
      '2 siung bawang putih, cincang halus',
      '1 sendok makan saus tiram',
      '1 sendok makan kecap manis',
      'Garam secukupnya',
      'Merica secukupnya',
      'Minyak goreng secukupnya'
    ],
    'step': [
      'Rebus mie instan hingga matang. Tiriskan dan sisihkan.',
      'Panaskan minyak goreng dalam wajan. Tumis bawang putih cincang hingga harum.',
      'Tambahkan daging ayam dan telur. Aduk rata dan masak hingga daging ayam matang dan telur setengah matang.',
      'Masukkan mie instan yang telah direbus ke dalam wajan. Aduk rata dengan bahan lainnya.',
      'Tambahkan saus tiram, kecap manis, garam, dan merica. Aduk hingga semua bahan tercampur dengan baik.',
      'Tambahkan daun bawang iris dan aduk sebentar hingga tercampur rata.',
      'Angkat mie goreng dan sajikan di atas piring. Tambahkan irisan mentimun atau acar sebagai pelengkap.',
      'Mie Goreng Spesial siap disajikan.'
    ]
  },
  {
    'id': '3rv3rv339sd',
    'user': ['Jane Smith', '@janesmith'],
    'judul': 'Pancake Pisang',
    'cerita': [
      'lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit',
      'jawa'
    ],
    'porsi': '5',
    'lamaWaktu': '1 jam 30 mnenit',
    'status': 'publish',
    'cover': 'assets/images/imgResep/PancakePisang.png',
    'bahan': [
      '1 buah pisang matang, dihaluskan',
      '1 cangkir tepung terigu',
      '2 sendok makan gula pasir',
      '1 sendok teh baking powder',
      '1/4 sendok teh garam',
      '1 butir telur',
      '1 cangkir susu',
      '2 sendok makan margarin, lelehkan'
    ],
    'step': [
      'Campurkan tepung terigu, gula pasir, baking powder, dan garam dalam sebuah wadah.',
      'Tambahkan pisang yang telah dihaluskan ke dalam campuran kering, aduk rata.',
      'Pecahkan telur ke dalam adonan, lalu tambahkan susu dan margarin cair. Aduk hingga semua bahan tercampur dengan baik dan tidak bergerindil.',
      'Panaskan wajan anti lengket dengan api sedang. Tuang adonan pancake dengan menggunakan sendok sayur atau scoop.',
      'Biarkan pancake hingga muncul gelembung di permukaan dan bagian bawahnya berwarna kecokelatan. Balik pancake dan masak hingga kedua sisinya matang.',
      'Angkat pancake pisang dan sajikan dengan topping sesuai selera, seperti madu, potongan buah, atau sirup maple.',
      'Pancake pisang siap dinikmati.'
    ]
  },
  {
    'id': '003j9c34v',
    'user': ['Rina Fitriani', '@rinafitriani'],
    'judul': 'Tumis Kangkung',
    'cerita': [
      'lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit',
      'jawa'
    ],
    'porsi': '5',
    'lamaWaktu': '1 jam 30 mnenit',
    'status': 'publish',
    'cover': 'assets/images/imgResep/TumisKangkung.png',
    'bahan': [
      '1 ikat kangkung, petik daunnya',
      '3 siung bawang putih, cincang halus',
      '2 siung bawang merah, iris tipis',
      '2 buah cabai merah, iris serong',
      '1 sendok teh terasi, sangrai',
      'Garam secukupnya',
      'Minyak goreng secukupnya'
    ],
    'step': [
      'Panaskan minyak goreng dalam wajan. Tumis bawang putih, bawang merah, dan cabai merah hingga harum.',
      'Tambahkan terasi yang telah disangrai. Aduk rata dengan bumbu tumis.',
      'Masukkan kangkung ke dalam wajan. Aduk rata dengan bumbu.',
      'Tambahkan garam secukupnya sesuai selera. Aduk kembali hingga kangkung layu dan bumbu meresap.',
      'Angkat tumis kangkung dan sajikan di atas piring. Tumis kangkung siap disantap.'
    ]
  },
  {
    'id': '30jvj340jv3',
    'user': ['Ahmad Ibrahim', '@ahmadi'],
    'judul': 'Chicken Teriyaki',
    'cerita': [
      'lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit lorem ipsum dolor amet sit',
      'jawa'
    ],
    'porsi': '5',
    'lamaWaktu': '1 jam 30 mnenit',
    'status': 'publish',
    'cover': 'assets/images/imgResep/ChickenTeriyaki.png',
    'bahan': [
      '500 gram daging ayam fillet, potong kotak',
      '3 sendok makan saus teriyaki',
      '2 sendok makan kecap manis',
      '1 sendok makan minyak wijen',
      '1 sendok makan gula pasir',
      '2 siung bawang putih, cincang halus',
      'Lada hitam bubuk secukupnya',
      'Minyak goreng secukupnya'
    ],
    'step': [
      'Campur saus teriyaki, kecap manis, minyak wijen, gula pasir, bawang putih cincang, dan lada hitam bubuk dalam sebuah wadah. Aduk rata.',
      'Tambahkan potongan daging ayam ke dalam adonan saus teriyaki. Pastikan daging terbalut dengan baik.',
      'Diamkan daging ayam dalam adonan selama minimal 30 menit agar bumbu meresap.',
      'Panaskan minyak goreng dalam wajan. Masukkan daging ayam dan tumis hingga matang dan berwarna kecokelatan.',
      'Angkat chicken teriyaki dan sajikan di atas piring. Nikmati dengan nasi putih hangat atau sebagai lauk pendamping.',
      'Chicken Teriyaki siap dinikmati.'
    ]
  }
];

List listTips = [
  {
    'id': '',
    'user': ['bintang sinaga', '@bangnaga52'],
    'judul': 'Tips Memasak Steak yang Lezat',
    'step': [
      'lorem ipsum dolor amat lorem ipsum dolor amat',
      'lorem ipsum dolor amatlorem ipsum dolor amat,lorem ipsum dolor amatlorem ipsum dolor amat'
    ]
  },
  {
    'id': '',
    'user': ['angela wijaya', '@angelawijaya'],
    'judul': 'Tips Merawat Tanaman Hias di Dalam Ruangan',
    'step': [
      'lorem ipsum dolor amat lorem ipsum dolor amat',
      'lorem ipsum dolor amatlorem ipsum dolor amat,lorem ipsum dolor amatlorem ipsum dolor amat'
    ]
  },
  {
    'id': '',
    'user': ['hendra wibowo', '@hendrawibowo'],
    'judul': 'Tips Mengatur Keuangan Pribadi',
    'step': [
      'lorem ipsum dolor amat lorem ipsum dolor amat',
      'lorem ipsum dolor amatlorem ipsum dolor amat,lorem ipsum dolor amatlorem ipsum dolor amat'
    ]
  },
  {
    'id': '',
    'user': ['melissa tan', '@melissatan'],
    'judul': 'Tips Membangun Kebiasaan Membaca',
    'step': [
      'lorem ipsum dolor amat lorem ipsum dolor amat',
      'lorem ipsum dolor amatlorem ipsum dolor amat,lorem ipsum dolor amatlorem ipsum dolor amat'
    ]
  },
  {
    'id': '',
    'user': ['david wijaya', '@davidwijaya'],
    'judul': 'Tips Efektif dalam Presentasi',
    'step': [
      'lorem ipsum dolor amat lorem ipsum dolor amat',
      'lorem ipsum dolor amatlorem ipsum dolor amat,lorem ipsum dolor amatlorem ipsum dolor amat'
    ]
  },
  {
    'id': '',
    'user': ['lisa santoso', '@lisasantoso'],
    'judul': 'Tips Membangun Hubungan yang Sehat',
    'step': [
      'lorem ipsum dolor amat lorem ipsum dolor amat',
      'lorem ipsum dolor amatlorem ipsum dolor amat,lorem ipsum dolor amatlorem ipsum dolor amat'
    ]
  },
];

List listSetting = [
  {
    'icon': Icon(
      Icons.receipt,
      color: ColorConstants.textWhite,
    ),
    'name': 'Undang Teman'
  },
  {
    'icon': Icon(
      Icons.notification_important,
      color: ColorConstants.textWhite,
    ),
    'name': 'Preferensi Notifikasi'
  },
  {
    'icon': Icon(
      Icons.privacy_tip,
      color: ColorConstants.textWhite,
    ),
    'name': 'Kebijakan Privasi'
  },
  {
    'icon': Icon(
      Icons.rule,
      color: ColorConstants.textWhite,
    ),
    'name': 'Ketentuan Pemakaian'
  },
  {
    'icon': Icon(
      Icons.man_outlined,
      color: ColorConstants.textWhite,
    ),
    'name': 'Panduan Komunitas Foodies'
  },
  {
    'icon': Icon(
      Icons.block,
      color: ColorConstants.textWhite,
    ),
    'name': 'Pengguna yang diblokir'
  },
  {
    'icon': Icon(
      Icons.question_answer,
      color: ColorConstants.textWhite,
    ),
    'name': 'Pertanyaan yang sering ditanyakan'
  },
  {
    'icon': Icon(
      Icons.call,
      color: ColorConstants.textWhite,
    ),
    'name': 'Hubungi Kami'
  },
  {
    'icon': Icon(
      Icons.numbers,
      color: ColorConstants.textWhite,
    ),
    'name': 'Cek Versi Aplikasi Foodies'
  },
  {
    'icon': Icon(
      Icons.mode,
      color: ColorConstants.textWhite,
    ),
    'name': 'Mode'
  },
];

List listRandomImage = [
  {'image': 'assets/images/randomImg/randomImg1.png'},
  {'image': 'assets/images/randomImg/randomImg2.png'},
  {'image': 'assets/images/randomImg/randomImg3.png'},
  {'image': 'assets/images/randomImg/randomImg4.png'},
  {'image': 'assets/images/randomImg/randomImg5.png'},
  {'image': 'assets/images/randomImg/randomImg6.png'},
  {'image': 'assets/images/randomImg/randomImg7.png'},
  {'image': 'assets/images/randomImg/randomImg8.png'},
];
