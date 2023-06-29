import 'package:flutter/material.dart';

class ResepModel {
  final String id;
  final List user;
  final String judul;
  final List cerita;
  final String porsi;
  final String lamaWaktu;
  final String status;
  final String cover;
  final List bahan;
  final List step;

  ResepModel({
    required this.id,
    required this.user,
    required this.judul,
    required this.cerita,
    required this.porsi,
    required this.lamaWaktu,
    required this.status,
    required this.cover,
    required this.bahan,
    required this.step,
  });
}
