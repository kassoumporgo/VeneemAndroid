
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/texts.dart';
import '/ui/components/custom_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(text: 'Nous contacter'),

      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [

              AboutButton(
                title: "Email",
                subtitle: "youthopendata@gmail.com",
                icon: AppIcon.mail,
                onTap: () async {
                  launch("mailto:youthopendata@gmail.com");
                },
              ),

              AboutButton(
                title: "Téléphone",
                subtitle: "+22672023683",
                icon: AppIcon.phone,
                onTap: () async {
                  launch("tel:+22672023683");
                },
              ),

              AboutButton(
                title: "Facebook",
                subtitle: "@YouthOpenData",
                icon: AppIcon.facebook,
                onTap: () {
                  launch("https://www.facebook.com/YouthOpenData");
                },
              ),

              AboutButton(
                title: "Twitter",
                subtitle: "@YouthOpenData",
                icon: AppIcon.twitter,
                onTap: () async {
                  launch("https://www.twitter.com/YouthOpenData");
                },
              ),

              AboutButton(
                title: "Site Web",
                subtitle: "https://www.youthopendata.org",
                icon: AppIcon.webSite,
                onTap: () async {
                  launch("https://www.youthopendata.org");
                },
              ),

            ],
          ),
        ).center().paddingAll(10.0),

        // child: ContactUs(
        //   cardColor: Colors.white,
        //   textColor: AppColor.main,
        //   logo: const AssetImage('assets/images/icon-512.png'),
        //   email: 'youthopendata@gmail.com',
        //   companyName: appName,
        //   companyColor: AppColor.main,
        //   dividerThickness: 2,
        //   phoneNumber: '+22672023683',
        //   website: 'https://www.youthopendata.org',
        //   githubUserName: 'https://github.com/kassoumporgo/Yeeli-Android',
        //   tagLine: 'Transparence & Participation citoyenne',
        //   taglineColor: Colors.teal.shade100,
        //   twitterHandle: 'YouthOpenData',
        //   facebookHandle: 'YouthOpenData'
        // ).center().paddingAll(16.0),

      ),

    );
  }
}



class AboutButton extends StatelessWidget {

  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final IconData icon;

  const AboutButton({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Icon(icon, ),
              15.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        // color: AppColor.white
                    ),
                  ),
                  5.height,
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                        // color: AppColor.white
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
