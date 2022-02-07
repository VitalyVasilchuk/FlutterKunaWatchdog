import 'dart:convert';

class Subscription {
  String title;
  String description;
  String price;
  String image;

  Subscription({required this.title, required this.description, required this.price, required this.image});

  factory Subscription.fromJson(Map<String, dynamic> mapJson) => Subscription(
        title: mapJson['title'],
        description: mapJson['description'],
        price: mapJson['price'],
        image: mapJson['image'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'price': price,
        'image': image,
      };

  static List<Subscription> subscriptionsFromJson(String stringJson) =>
      jsonDecode(stringJson).map<Subscription>((m) => Subscription.fromJson(m)).toList();
}
