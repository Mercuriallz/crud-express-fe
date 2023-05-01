import 'package:crudwithprovider/add.smartphone.dart';
import 'package:crudwithprovider/viewmodel/smartphone.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<SmartphoneViewModel>(context, listen: false).getSmartphone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Consumer<SmartphoneViewModel>(builder: (context, smartphoneVM, _) {
      if (smartphoneVM.smartphoneData.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          children: [
            ListView.builder(
                itemCount: smartphoneVM.smartphoneData.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title:
                          Text(smartphoneVM.smartphoneData[index].merk.toString()),
                      leading:
                          Text(smartphoneVM.smartphoneData[index].harga.toString()),
                      subtitle: Text(smartphoneVM
                          .smartphoneData[index].namaSmartphone
                          .toString()),
                    ),
                  );
                }),
            FloatingActionButton(onPressed: () {
              Get.to(const AddSmartphoneScreen());
            }, child: const Icon(Icons.add),)
          ],
        );
      }
    }));
  }
}
