import 'package:NilaiAkm/models/nilai.dart';
import 'package:NilaiAkm/providers/nilai_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditNilai extends StatefulWidget {
  final Nilai nilai;

  EditNilai([this.nilai]);

  @override
  _EditNilaiState createState() => _EditNilaiState();
}

class _EditNilaiState extends State<EditNilai> {
  final nisController = TextEditingController();
  final namaController = TextEditingController();
  final kelasController = TextEditingController();
  final nilaiakmController = TextEditingController();

  @override
  void dispose() {
    nisController.dispose();
    namaController.dispose();
    kelasController.dispose();
    nilaiakmController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.nilai == null) {
      nisController.text = "";
      namaController.text = "";
      kelasController.text = "";
      nilaiakmController.text = "";

      new Future.delayed(Duration.zero, () {
        final nilaiProvider =
            Provider.of<NilaiProvider>(context, listen: false);
        nilaiProvider.loadValues(Nilai());
      });
    } else {
      nisController.text = widget.nilai.nis;
      namaController.text = widget.nilai.nama;
      kelasController.text = widget.nilai.kelas;
      nilaiakmController.text = widget.nilai.nilaiakm;

      new Future.delayed(Duration.zero, () {
        final nilaiProvider =
            Provider.of<NilaiProvider>(context, listen: false);
        nilaiProvider.loadValues(widget.nilai);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nilaiProvider = Provider.of<NilaiProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Data Nilai AKM')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: <Widget>[
          TextField(
            controller: nisController,
            decoration: InputDecoration(hintText: 'NIS'),
            onChanged: (value) {
              nilaiProvider.changeNis(value);
            },
          ),
          TextField(
            controller: namaController,
            decoration: InputDecoration(hintText: 'Nama Siswa'),
            onChanged: (value) {
              nilaiProvider.changeNama(value);
            },
          ),
          TextField(
            controller: kelasController,
            decoration: InputDecoration(hintText: 'Kelas'),
            onChanged: (value) {
              nilaiProvider.changeKelas(value);
            },
          ),
          TextField(
            controller: nilaiakmController,
            decoration: InputDecoration(hintText: 'Nilai AKM'),
            onChanged: (value) {
              nilaiProvider.changeNilaiakm(value);
            },
          ),
          SizedBox(height: 20),
          RaisedButton(
              child: Text('Save'),
              onPressed: () {
                nilaiProvider.saveNilai();
                Navigator.pop(context);
              }),
          (widget.nilai != null)
              ? RaisedButton(
                  child: Text('Delete'),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    nilaiProvider.removeNilai(widget.nilai.nis);
                    Navigator.pop(context);
                  })
              : Container(),
        ]),
      ),
    );
  }
}
