import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Core/Constants/app_links.dart';
import 'package:wisdom_of_the_day/Model/Models/wisdom_model.dart';
import 'package:wisdom_of_the_day/Model/Repositories/wisdom_repository.dart';

class WisdomApi extends GetConnect implements WisdomRepository {
  @override
  Future<WisdomModel>? getWisdom() async {
    try {
      final Response response =
          await get(AppLinks.wisdom, contentType: 'application/json');
      if (!response.status.isOk) throw Exception(response.statusText);
      final Map<String, dynamic> body = response.body;
      final WisdomModel model = WisdomModel.fromJson(body['data']);
      return model;
    } on Exception {
      rethrow;
    }
  }
}
