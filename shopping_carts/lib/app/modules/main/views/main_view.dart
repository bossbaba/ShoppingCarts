import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainView'),
        centerTitle: true,
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onLoading: controller.onLoading,
        onRefresh: controller.onRefresh,
        child:  Obx(() => ListView.builder(
          shrinkWrap: true,
             physics:const BouncingScrollPhysics() ,
            itemCount: controller.categoriesList.value.length,
            itemBuilder: (context,int index) {
              return Container(
                height: 129,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32.0)
                ),
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 30,
                          decoration: const BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius
                                  .circular(32.0), bottomRight: Radius.circular(
                                  32.0))
                          ),
                          child: Center(child: Text('${controller
                              .categoriesList[index]?.name}'),),
                        ))
                  ],
                ),
              );
            }),)
      ),
    );
  }
}
