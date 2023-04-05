import 'dart:io';

import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Core/Constants/app_links.dart';
import 'package:wisdom_of_the_day/Model/Models/wisdom_model.dart';
import 'package:wisdom_of_the_day/Model/Repositories/wisdom_repository.dart';

class WisdomApi extends GetConnect implements WisdomRepository {
  @override
  Future<WisdomModel>? getWisdom() async {
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY0MmI0Nzk4MTJlMmYwZjFmNjk1YTY2YyIsIm5hbWUiOiJBaG1lZCIsImJpcnRoRGF5IjoiMjAwMC0wOS0wMVQyMTowMDowMC4wMDBaIiwiZ2VuZGVyIjoibWFsZSIsImVtYWlsIjoiYWhtZWRAZ21haWwuY29tIiwicGFzc3dvcmQiOiIkMmIkMTAkS3hOaGR5c0ZSbGpRemVkS2tYdWFQTzhJRkNqeWlOUjVSRGVXcGNUb21CLmhuV2hWaDJKSDIiLCJjcmVhdGVkQXQiOiIyMDIzLTA0LTAzVDIxOjM5OjM2Ljg3M1oiLCJ1cGRhdGVkQXQiOiIyMDIzLTA0LTAzVDIxOjM5OjM2Ljg3M1oifSwiaWF0IjoxNjgwNjQ1NDIwfQ.WtX0AU0xGRpS5tpizwtJemqalfH5MTzJL_nnrRufGYE';
    try {
      final Response response = await get(AppLinks.wisdom,
          contentType: 'application/json',
          headers: {'Access-Token': 'Bearer $token'});
      if (!response.status.isOk) throw SocketException(response.statusText!);
      final Map<String, dynamic> body = response.body;
      final WisdomModel model = WisdomModel.fromJson(body['data']);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
