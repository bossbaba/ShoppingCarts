import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shopping_carts/app/modules/main/providers/categories_provider.dart';

import '../categories_model.dart';

class MainController extends GetxController {
  //TODO: Implement MainController

  final RefreshController refreshController = RefreshController(
    initialRefresh: true
  );

  final provider = Get.put(CategoriesProvider());

  final RxList<Categories> categoriesList = [
    Categories(name:"name",id:"hot")
  ].obs;

  final count = 1.obs;

  final RxBool loaded = true.obs;
  @override
  void onInit() {
    categoriesList.value = [];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void onLoading() async  {
    if(loaded.value) {
      loaded.value = false;
      await getAllCategories(isLoading: true);
    }

  }

  void onRefresh() async {
    await getAllCategories(isRefresh: true);
  }

  getAllCategories(
      {bool isRefresh = false, bool isLoading = false}) async {
    List<Categories>?list = await provider.getAllCategories(count.value , 10);
    if(list != null){
      if(isRefresh) {
        refreshController.refreshCompleted();
        categoriesList.value = list;
        if(count.value > 1) {
          count.value = 1;
        }
        count.value ++;
      }

      if(isLoading) {
        loaded.value = true;
        if(list.isNotEmpty) {
          refreshController.loadComplete();
          categoriesList.addAll(list);
          count.value += 1;
        } else {
          refreshController.loadComplete();
        }
      }
    }
  }
}
