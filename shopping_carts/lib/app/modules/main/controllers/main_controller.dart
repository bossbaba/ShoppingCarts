import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shopping_carts/app/modules/main/providers/categories_provider.dart';
import 'package:shopping_carts/app/utils/tools.dart';

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

  final count = 0.obs;
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

  void onLoading()  {
   // await getAllCategories(isLoading: true);
   handlerDebounce(getAllCategories(isLoading: true));
  }

  void onRefresh() async {
    await getAllCategories(isRefresh: true);
  }

  getAllCategories(
      {bool isRefresh = false, bool isLoading = false}) async {
    List<Categories>?list = await provider.getAllCategories(1, 10);
    if(list != null && list.isNotEmpty){
      if(isRefresh) {
        refreshController.refreshCompleted();
        categoriesList.value = list;
      }

      if(isLoading) {
        refreshController.loadComplete();
        categoriesList.addAll(list);
      }
    }
  }
}
