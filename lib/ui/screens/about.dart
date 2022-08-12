import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/utils/colors.dart';
import 'package:veneem/functions/toasts.dart';
import 'package:veneem/ui/screens/submit_comment.dart';
import 'package:veneem/ui/components/button.dart';
import '../../utils/texts.dart';
import '/ui/components/custom_app_bar.dart';
import 'contact_us.dart';

class AboutScreen extends StatelessWidget {

  final String version;

  const AboutScreen({
    Key? key,
    required this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(text: 'A Propos'),

      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [

                  Container(
                    height: 120,
                    width: 120,
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   border: Border.all(width: 2.0, color: mainColor)
                    // ),
                    child: Image.asset('assets/images/icon-512.png'),
                  ),

                  20.width,

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          appName,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        7.height,
                        Text(
                          version,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

              20.height,


             const Text("La présente application a pour objectif de mettre à la disposition des citoyens, des agents publics de santé, de la société civile et des médias, les informations essentielles relatives aux principaux actes et services de santé afin de favoriser la connaissance des droits, la transparence et la bonne gouvernance. Plus précisément, elle a pour but de :\n\n"

                  "• Permettre l'accès à l'information au grand public concernant les prestations de services de santé délivrées par les personnels de santé au Burkina Faso ;\n\n"

                  "• Faciliter l'accès aux services de base fournis par les services de santé;\n\n"
                  "• Renforcer la lutte contre la corruption et prévenir la pratique du racket;\n\n"
                  "• Contribuer à renforcer la transparence, l'accès ˆ l'information et instaurer une relation de confiance entre les agents de santé, public et les citoyens;\n\n"
                  "• Renforcer la connaissance des droits des usagers des services publics locaux quant à ces actes;\n\n"
                  "• Renforcer la connaissance des pouvoirs public locaux quant aux actes dont ils ont la charge;\n\n"
                  "• Prévenir la pratique du racket et les dessous-de-table;\n\n"
                  "• Faire connaitre les voies de recours prévues par la loi en cas de préjudice;\n\n"
                  "• Susciter l'harmonisation des procédures de délivrance pour tous les actes identiques.\n\n"


                  "La collecte des données a été faite avec l'appui du Projet d'Appui au Gouvernement Ouvert Francophone (PAGOF). Des guides papier d'information sur les actes et services en plusieurs formats ont été élaborés et livrés aux acteurs concernés pour large diffusion. BEOG NEERE, en tant que point focal du PGO pour les Organisation de la Société Civile a suggéré une version Application Mobile des différents guides. Ainsi, Youth Open Data en partenariat avec BEOG NEERE a procédé à l'extraction des données des guides et à leurs transformations en format OPEN DATA pour alimenter la présente application en développement.",

                style: TextStyle(
                  fontSize: 17,
                ),
              ),

              20.height,

              SizedBox(
                width: MediaQuery.of(context).size.width*.9,
                child: FilledButton(
                  text: "nous contacter",

                  onPressed: ()=> Get.to(() => const ContactUsScreen()),

                  // onPressed: () async {
                  //   bool hasInternetConnection = await InternetConnectionChecker().hasConnection;
                  //
                  //   if(!hasInternetConnection) {
                  //     noConnexionToast();
                  //   }
                  //
                  // },

                ),
              ).center()

            ],
          ),
        ),
      ),

    );
  }
}
