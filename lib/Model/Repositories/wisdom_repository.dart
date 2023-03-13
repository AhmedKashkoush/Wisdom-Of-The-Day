abstract class WisdomRepository {
  Future? getWisdom();
}

class WisdomRepositoryImp implements WisdomRepository {
  final WisdomRepository repository;
  const WisdomRepositoryImp(this.repository);
  @override
  Future? getWisdom() async {
    // Get.defaultDialog(title: '_error');
    return await repository.getWisdom();
  }
}
