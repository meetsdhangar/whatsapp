import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/screens/groupcreateScreen.dart';


class NewGroup extends StatelessWidget {
  final List memberlist;
  const NewGroup({super.key, required this.memberlist});

  @override
  Widget build(BuildContext context) {
    //  final logincontroller = Get.find<Logincontroller>();
    final homecontroller = Get.find<HomeController>();

    return Obx(
      () => homecontroller.obxcheck.value
          ? Scaffold()
          : Scaffold(
              appBar: AppBar(
                toolbarHeight: 55,
                titleSpacing: 0,
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Color(0xff075E54),
                leading: InkWell(
                    onTap: () {
                      Get.back();
                      homecontroller.selectedMembers.clear();
                    },
                    child: Icon(Icons.arrow_back)),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New group",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Add members",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xff075E54),
                onPressed: () {
                  Get.to(() => GroupCreateScreen());
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.heightBox,
                      homecontroller.selectedMembers.length > 0
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    homecontroller.selectedMembers.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: InkWell(
                                      onTap: () {
                                        homecontroller.addRemoveMember(
                                            homecontroller
                                                .selectedMembers[index]);
                                      },
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            homecontroller
                                                                .selectedMembers[
                                                                    index]
                                                                .profile),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 2,
                                                right: 0,
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18)),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            homecontroller
                                                .selectedMembers[index].name,
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(),
                      10.heightBox,
                      Text(
                        "Contacts on WhatsApp",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 15),
                      ),
                      10.heightBox,
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: memberlist.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              homecontroller
                                  .manageSelectedMembers(memberlist[index]);
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: Obx(
                                () => Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                memberlist[index].profile),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                    if (homecontroller.selectedMembers.any(
                                        (element) =>
                                            element.id == memberlist[index].id))
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                            child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                      )
                                  ],
                                ),
                              ),
                              title: Text(
                                memberlist[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              subtitle: Text(
                                memberlist[index].about,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
