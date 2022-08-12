
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:veneem/ui/screens/loading_screen.dart';
import '../../api/services.dart';
import '/ui/screens/about.dart';
import '/ui/screens/comments_list.dart';
import '/ui/screens/contact_us.dart';
import '/ui/screens/submit_comment.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/texts.dart';



class DrawerContent extends StatefulWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {


  PackageInfo _packageInfo = PackageInfo(
    appName: ' ',
    packageName: ' ',
    version: ' ',
    buildNumber: ' ',
    buildSignature: ' ',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          DrawerHeader(
            decoration: const BoxDecoration(
              color: mainColor,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    appName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  10.height,
                  Text(
                    'Version ${_packageInfo.version}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      // color: Colors.grey,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),

                ],
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [

                DrawerItem(
                  onTap: ()=> Get.to(()=> const SubmitComment()),
                  // onTap: () async {
                  //   ApiServices.getActs();
                  // },
                  icon: AppIcon.submitComment,
                  text: 'Soumettre préoccupation',
                ),

                DrawerItem(
                  onTap: ()=> Get.to(()=> LoadingScreen(
                      init: ApiServices.getConcerns(), text: "Récupération des données en cours."
                  )),
                  icon: AppIcon.viewComments,
                  text: 'Différentes préoccupations',
                ),

                DrawerItem(
                  onTap: () async {
                    final box = context.findRenderObject() as RenderBox?;
                    await Share.share(
                      shareContent,
                      subject: shareSubject,
                      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size
                    );
                  },
                  icon: AppIcon.shareApp,
                  text: "Partager",
                ),

                DrawerItem(
                  onTap: () async {
                    launch(playStoreLink);
                  },
                  icon: AppIcon.playStore,
                  text: "Noter l'application",
                ),

                DrawerItem(
                  onTap: ()=> Get.to(()=> const ContactUsScreen()),
                  icon: AppIcon.contactUs,
                  text: 'Nous contacter',
                ),

                DrawerItem(
                  onTap: ()=> Get.to(()=> AboutScreen(version: _packageInfo.version)),
                  icon: AppIcon.aboutUs,
                  text: 'A Propos',
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

}


class DrawerItem extends StatelessWidget {

  final VoidCallback onTap;
  final IconData icon;
  final String text;

  const DrawerItem({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Icon(icon, size: 25),
          10.width,
          Text(
            text,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ).expand(),
        ],
      ),
    ).onTap(onTap);
  }
}

