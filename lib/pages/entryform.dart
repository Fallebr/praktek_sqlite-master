import 'package:flutter/material.dart';
import 'package:praktek_sqlite/models/item.dart';

class EntryForm extends StatefulWidget {
  final Item item;
  EntryForm(this.item);
  @override
  EntryFormState createState() => EntryFormState(this.item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Item item;
  EntryFormState(this.item);
  TextEditingController pengeluaranController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController pemasukanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (item != null) {
      codeController.text = item.code;
      pemasukanController.text = item.pemasukan.toString();
      pengeluaranController.text = item.pengeluaran.toString();
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF18265),
          title: item == null
              ? Text('Data Pemasukan', style: TextStyle(color: Colors.white))
              : Text('Ubah Data', style: TextStyle(color: Colors.white)),
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              //kode
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: codeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kode Hari',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // pemasukan
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: pemasukanController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Pemasukan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // PENGELUARAN
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: pengeluaranController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Pengeluaran',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Color(0xffF18265),
                        textColor: Colors.white,
                        child: Text(
                          'Simpan',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (item == null) {
                            // tambah data
                            int pendapatan =
                                int.parse(pemasukanController.text) -
                                    int.parse(pengeluaranController.text);
                            item = Item(
                                codeController.text,
                                int.parse(pemasukanController.text),
                                int.parse(pengeluaranController.text),
                                pendapatan);
                          } else {
                            int pendapatan =
                                int.parse(pemasukanController.text) -
                                    int.parse(pengeluaranController.text);
                            // ubah data
                            item.code = codeController.text;
                            item.pemasukan =
                                int.parse(pemasukanController.text);
                            item.pengeluaran =
                                int.parse(pengeluaranController.text);
                            item.pendapatan = pendapatan;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, item);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Color(0xffF18265),
                        textColor: Colors.white,
                        child: Text(
                          'Batal',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
