import 'package:NilaiAkm/models/nilai.dart';
import 'package:NilaiAkm/screens/edit_nilai.dart';
import 'package:NilaiAkm/shared/nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_nilai.dart';

class NilaiAkm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nilai = Provider.of<List<Nilai>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Nilai AKM"),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.add,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditNilai()));
                })
          ],
        ),
        drawer: NavBar(),
        body: (nilai != null)
            ? ListView.builder(
                itemCount: nilai.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(nilai[index].nis),
                    title: Text(nilai[index].nama),
                    subtitle: Text(nilai[index].kelas),
                    trailing: Text(nilai[index].nilaiakm),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => EditNilai(nilai[index])));
                    },
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
