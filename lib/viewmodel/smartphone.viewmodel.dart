import 'package:crudwithprovider/model/smartphone.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SmartphoneViewModel extends ChangeNotifier {
  List<SmartphoneData> smartphoneData = [];

  void getSmartphone() async {
    smartphoneData = [];

    var response = await Dio().get("http://192.168.15.6:3010/v1/get-smartphone",
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    if (response.statusCode == 200) {
      smartphoneData.addAll(SmartphoneModel.fromJson(response.data).data!);
      if (kDebugMode) {
        print(response.data);
      }
    }
    notifyListeners();
  }

  void addSmartphone(SmartphoneData formData) async {
    Map<String, dynamic> data = {
      "merk": formData.merk,
      "nama_smartphone": formData.namaSmartphone,
      "harga": formData.harga
    };
    print(data);
    try {
      var response =
          await Dio().post("http://192.168.15.6:3010/v1/add-smartphone",
              data: data,
              // data: FormData.fromMap({
              //   "merk": formData.merk,
              //   "nama_smartphone": formData.namaSmartphone,
              //   "harga": formData.harga
              // }),
              options: Options(
                headers: {"Content-Type": "application/x-www-form-urlencoded"},
                  followRedirects: false,
                  validateStatus: (status) {
                    return status! < 500;
                  }));
      if (response.statusCode == 201 || response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
