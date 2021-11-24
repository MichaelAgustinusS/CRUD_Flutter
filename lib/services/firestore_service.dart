import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:NilaiAkm/models/nilai.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  Future<void> saveNilai(Nilai nilai){
    return _db.collection('NilaiAkm').document(nilai.nis).setData(nilai.toMap());
  }

  Stream<List<Nilai>> getNilai(){
   return _db.collection('NilaiAkm').snapshots().map((snapshot) => snapshot.documents.map((document)=> Nilai.fromFirestore(document.data)).toList());
  }

  Future<void> removeProduct(String nis){
    return _db.collection('NilaiAkm').document(nis).delete();
  }
}