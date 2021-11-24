import 'package:NilaiAkm/models/nilai.dart';
import 'package:NilaiAkm/services/firestore_service.dart';
import 'package:flutter/material.dart';

class NilaiProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _nis;
  String _nama;
  String _kelas;
  String _nilaiakm;

  //Getters
  String get nis => _nis;
  String get nama => _nama;
  String get kelas => _kelas;
  String get nilaiakm => _nilaiakm;

  //Setters
  changeNis(String value) {
    _nis = value;
    notifyListeners();
  }
  changeNama(String value) {
    _nama = value;
    notifyListeners();
  }
  changeKelas(String value) {
    _kelas = value;
    notifyListeners();
  }
  changeNilaiakm(String value) {
    _nilaiakm = value;
    notifyListeners();
  }

  loadValues(Nilai nilai){
    _nis = nilai.nis;
    _nama = nilai.nama;
    _kelas = nilai.kelas;
    _nilaiakm = nilai.nilaiakm;
  }

  saveNilai(){
    var newNilai = Nilai(nis:nis ,nama:nama, kelas:kelas, nilaiakm: nilaiakm);
    firestoreService.saveNilai(newNilai);
  }

  removeNilai(String nis){
    firestoreService.removeProduct(nis);
  }
}