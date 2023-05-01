class SmartphoneModel {
  int? status;
  List<SmartphoneData>? data;
  String? message;

  SmartphoneModel({this.status, this.data, this.message});

  SmartphoneModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SmartphoneData>[];
      json['data'].forEach((v) {
        data!.add(new SmartphoneData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}




class SmartphoneData {
  int? id;
  String? merk;
  String? namaSmartphone;
  int? harga;

  SmartphoneData({this.id, this.merk, this.namaSmartphone, this.harga});

  SmartphoneData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merk = json['merk'];
    namaSmartphone = json['nama_smartphone'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['merk'] = merk;
    data['nama_smartphone'] = namaSmartphone;
    data['harga'] = harga;
    return data;
  }
}