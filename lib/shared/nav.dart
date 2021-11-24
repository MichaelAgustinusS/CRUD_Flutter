import 'package:NilaiAkm/screens/nilai_akm.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Pengumuman'),
                onTap: (){},
              ),
              ListTile(
                title: Text('Indikator'),
                onTap: (){},
              ),
              ListTile(
                title: Text('Poin Siswa'),
                onTap: (){},
              ),
              ListTile(
                title: Text('Nilai Karakter'),
                onTap: (){},
              ),
              ListTile(
                title: Text('Soal AKM'),
                onTap: (){},
              ),
              ListTile(
                title: Text('Nilai AKM'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NilaiAkm()));
                },
              ),
              ListTile(
                title: Text('Data Siswa'),
                onTap: (){},
              ),
              ListTile(
                title: Text('Guru BK'),
                onTap: (){},
              ),
              ListTile(
                title: Text('Wali Kelas'),
                onTap: (){},
              ),
            ]
        )
    );
  }
}
