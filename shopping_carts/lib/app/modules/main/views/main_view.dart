import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Get.toNamed('/settings');
          }, icon: const Icon(Icons.settings))
        ],
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
            itemCount: controller.categoriesList.length,
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
                    Positioned(child: Container(
                      height: 129,
                      padding: const  EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 260,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius:BorderRadius.circular(10.0),
                                  child: SvgPicture.network('https://lf-cdn-tos.bytescm.com/obj/static/xitu_extension/static/gold.981a5510.svg',width: 60,),

                                ),
                               const SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${controller.categoriesList[index].name}"),
                                  const SizedBox(width: 180,child:  Text("more descriptions more and more",maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                   ),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_right))
                        ],
                      ),
                    )),
                    Positioned(
                        right: 0,
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
                              .categoriesList[index].name}'),),
                        )),
                  ],
                ),
              );
            }),)
      ),
    );
  }
}
