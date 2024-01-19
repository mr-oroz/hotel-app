class GetHotelListModel {
  List<Rooms>? rooms;

  GetHotelListModel({this.rooms});

  GetHotelListModel.fromJson(Map<String, dynamic> json) {
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rooms != null) {
      data['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? id;
  String? name;
  int? price;
  String? pricePer;
  List<String>? peculiarities;
  List<String>? imageUrls;

  Rooms(
      {this.id,
      this.name,
      this.price,
      this.pricePer,
      this.peculiarities,
      this.imageUrls});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    pricePer = json['price_per'];
    peculiarities = json['peculiarities'].cast<String>();
    imageUrls = json['image_urls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['price_per'] = pricePer;
    data['peculiarities'] = peculiarities;
    data['image_urls'] = imageUrls;
    return data;
  }
}
