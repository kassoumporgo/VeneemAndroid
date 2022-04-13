import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import '/ui/screens/about.dart';
import '/ui/screens/comments_list.dart';
import '/ui/screens/contact_us.dart';
import '/ui/screens/submit_comment.dart';
import '/constants/colors.dart';
import '/constants/icons.dart';
import '/constants/texts.dart';


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

                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.red),
                  //     shape: BoxShape.circle,
                  //   ),
                  // ),
                  //
                  // 10.height,

                  const Text(
                    appName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  10.height,
                  Text(
                    // 'Version ${_packageInfo.version}',
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
                  icon: submitCommentIcon,
                  text: 'Soumettre une préoccupation',
                ),

                DrawerItem(
                  onTap: ()=> Get.to(()=> const CommentsList()),
                  icon: viewCommentsIcon,
                  text: 'Voir les différentes préoccupations',
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
                  icon: shareAppIcon,
                  text: "Partager",
                ),

                DrawerItem(
                  onTap: () async {
                    // if (await canLaunch(playStoreLink)) {
                    //   await launch(url);
                    // } else {
                    //   throw 'Error to launch $playStoreLink';
                    // }
                  },
                  icon: playStoreIcon,
                  text: "Noter l'application",
                ),

                DrawerItem(
                  // onTap: () {},
                  onTap: ()=> Get.to(()=> const ContactUsScreen()),
                  icon: contactUsIcon,
                  text: 'Nous contacter',
                ),

                DrawerItem(
                  onTap: ()=> Get.to(()=> AboutScreen(version: _packageInfo.version)),
                  icon: aboutUsIcon,
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

