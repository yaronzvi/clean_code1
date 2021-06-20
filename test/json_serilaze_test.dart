import 'package:first_proj/data/model/restaurant/restaurant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Serialisation", () {
    test('Restaurant is serialised to json', () async {
      final actual = Restaurant(
        id: "3000",
        name: "Paul",
        address: "hamari 45",
        description: "aaa",
        city: "givattaim",
        remarks: "none",
      ).toJson();

      final matcher = {
        "id": "3000",
        "name": "Paul",
        "address": "hamari 45",
        "description": "aaa",
        "city": "givattaim",
        "remarks": "none",
      };

      expect(actual, matcher);
    });

    test('Restaurant is serialised from json', () async {
      final Map<String, dynamic> json = {
        "id": "3000",
        "name": "Paul",
        "address": "hamari 45",
        "description": "aaa",
        "city": "givattaim",
        "remarks": "none"
      };

      final actual = Restaurant.fromJson(json);
      print(json);

      final matcher = Restaurant(
        id: "3000",
        name: "Paul",
        address: "hamari 45",
        description: "aaa",
        city: "givattaim",
        remarks: "none",
      );

      expect(actual, matcher);
    });
  });
}
