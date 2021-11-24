class Nilai{
  final String nis;
  final String nama;
  final String kelas;
  final String nilaiakm;

  Nilai({this.nis, this.nama, this.kelas, this.nilaiakm});

  Map<String,dynamic> toMap(){
    return {
      'nis' : nis,
      'nama' : nama,
      'kelas' : kelas,
      'nilaiakm' : nilaiakm
    };
  }

  Nilai.fromFirestore(Map<String, dynamic> firestore)
      : nis = firestore['nis'],
        nama = firestore['nama'],
        kelas = firestore['kelas'],
        nilaiakm = firestore['nilaiakm'];
}