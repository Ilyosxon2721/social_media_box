import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_page/controller.dart';
import '../../res/assets_res.dart';
import '../../routes/routes.dart';
import '../../services/auth/google_auth_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Get.put(GoogleAuthService());
    final controller = Get.put(HomePageController(context: context));
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Obx(() {
                    return Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.white),
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(12),
                          child: auth.isSignIn.value
                              ? Image.network(
                                  FirebaseAuth.instance.currentUser?.photoURL ??
                                      'https://sun9-26.userapi.com/s/v1/ig2/pMZJDRHaaKxsJtGQ82lXz3zH91pskbvPUNNes7OE1paaw-tNC4dDKPfjKjYtGXgbuUNYYVYzGrg2zhSbkJo5s3A2.jpg?size=200x200&quality=96&crop=0,103,1723,1723&ava=1',
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  AssetsRes.APPS,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    return Expanded(
                      flex: 3,
                      child: auth.isSignIn.value
                          ? ListTile(
                              title: Text(
                                FirebaseAuth
                                        .instance.currentUser?.displayName ??
                                    'User Name'.tr,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                FirebaseAuth.instance.currentUser?.email ?? '',
                              ),
                            )
                          : ListTile(
                              title: Text(
                                'User Name'.tr,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.account_circle_sharp),
                      ),
                      title: Text(
                        'Profile'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_sharp),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.lock),
                      ),
                      title: Text(
                        'Security'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_sharp),
                      onTap: () {
                        Get.toNamed(Routes.getSecurityScreen());
                      },
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.color_lens),
                      ),
                      title: Text(
                        'Themes'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_sharp),
                      onTap: () => Get.toNamed(Routes.getThemesScreen()),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.translate),
                      ),
                      title: Text(
                        'Languages'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_sharp),
                      onTap: () {
                        Get.toNamed(Routes.getLanguagesScreen());
                      },
                    ),
                    // ListTile(
                    //   leading: const CircleAvatar(
                    //     child: Icon(Icons.notifications_active_sharp),
                    //   ),
                    //   title: Text(
                    //     'Notifications'.tr,
                    //     style: const TextStyle(
                    //         fontWeight: FontWeight.w500, fontSize: 18),
                    //   ),
                    //   trailing: const Icon(Icons.arrow_forward_ios_sharp),
                    //   onTap: () {},
                    // ),
                    // ListTile(
                    //   leading: const CircleAvatar(
                    //     child: Icon(Icons.photo_library_rounded),
                    //   ),
                    //   title: Text(
                    //     'Screenshots'.tr,
                    //     style: const TextStyle(
                    //         fontWeight: FontWeight.w500, fontSize: 18),
                    //   ),
                    //   trailing: const Icon(Icons.arrow_forward_ios_sharp),
                    //   onTap: () {},
                    // ),
                    // ListTile(
                    //   leading: const CircleAvatar(
                    //     child: Icon(Icons.favorite),
                    //   ),
                    //   title: Text(
                    //     'Favorites'.tr,
                    //     style: const TextStyle(
                    //         fontWeight: FontWeight.w500, fontSize: 18),
                    //   ),
                    //   trailing: const Icon(Icons.arrow_forward_ios_sharp),
                    //   onTap: () {},
                    // ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.info_outline),
                      ),
                      title: Text(
                        'Info'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_sharp),
                      onTap: () {
                        Get.toNamed(Routes.getInfoScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 8, bottom: 8),
                child: Obx(
                  () {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 20),
                        maximumSize: Size(
                            MediaQuery.of(context).size.width - 50,
                            MediaQuery.of(context).size.height * 0.40),
                        backgroundColor:
                            auth.isSignIn.value ? Colors.red : Colors.green,
                      ),
                      onPressed: () {
                        if (controller.connectionStatus.value.name != 'none') {
                          auth.isSignIn.value
                              ? auth.signOut()
                              : auth.signInWithGoogle();

                          // Navigator.pushNamed(context, e['route']);
                        } else {
                          Get.snackbar(
                            'Error'.tr,
                            'No internet connection!'
                                    'Please enable internet connection'
                                .tr,
                            duration: const Duration(seconds: 7),
                          );
                        }
                      },
                      child: Obx(
                        () {
                          return Text(
                            auth.isSignIn.value
                                ? 'Login out'.tr
                                : 'Login in'.tr,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            textScaleFactor: 1.2,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
