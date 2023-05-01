import 'package:crudwithprovider/home.screen.dart';
import 'package:crudwithprovider/model/smartphone.model.dart';
import 'package:crudwithprovider/viewmodel/smartphone.viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddSmartphoneScreen extends StatefulWidget {
  const AddSmartphoneScreen({super.key});

  @override
  State<AddSmartphoneScreen> createState() => _AddSmartphoneScreenState();
}

class _AddSmartphoneScreenState extends State<AddSmartphoneScreen> {
  final merkController = TextEditingController();
  final namaSmartphoneController = TextEditingController();
  final hargaController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    merkController;
    namaSmartphoneController;
    hargaController;
  }

  @override
  Widget build(BuildContext context) {
    final addSmartphoneModel =
        Provider.of<SmartphoneViewModel>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 15, left: 15, top: 8, bottom: 15),
              child: TextFormField(
                controller: merkController,
                decoration: InputDecoration(
                    hintText: "Merk Smartphone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 15, left: 15, top: 8, bottom: 15),
              child: TextFormField(
                controller: namaSmartphoneController,
                decoration: InputDecoration(
                    hintText: "Nama Smartphone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 15, left: 15, top: 8, bottom: 15),
              child: TextFormField(
                controller: hargaController,
                decoration: InputDecoration(
                    hintText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var data = SmartphoneData(
                      merk: merkController.text,
                      harga: int.parse(hargaController.text.toString()),
                      namaSmartphone: namaSmartphoneController.text);
                  addSmartphoneModel.addSmartphone(data);
                  // Get.to(const Home());
                    print("Data Smartphone -----> ${data.merk}");
                    print("Data Smartphone -----> ${data.harga}");
                    print("Data Smartphone -----> ${data.namaSmartphone}");

                    print(data);
                },
                child: const Text("Tambah Smartphone"))
          ]),
        ),
      ),
    );
  }
}
