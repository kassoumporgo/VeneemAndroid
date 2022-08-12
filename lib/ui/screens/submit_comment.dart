import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/api/services.dart';
import 'package:veneem/ui/screens/loading_screen.dart';
import '../../api/comment_model.dart';
import '/functions/toasts.dart';
import '/ui/components/custom_app_bar.dart';
import '/ui/components/custom_text_field.dart';
import '/ui/components/button.dart';


class SubmitComment extends StatefulWidget {

  final Map? act;

  const SubmitComment({
    Key? key,
    this.act,
  }) : super(key: key);

  @override
  _SubmitCommentState createState() => _SubmitCommentState();
}

class _SubmitCommentState extends State<SubmitComment> {


  TextEditingController commentController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FocusNode phoneNode = FocusNode();
  FocusNode nameNode = FocusNode();
  FocusNode commentNode = FocusNode();
  FocusNode emailNode = FocusNode();

  bool anonymous = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(text: 'Soumettre une préoccupation'),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              decoration: BoxDecoration(
                border: Border.all(width: .5,color: Colors.grey)
              ),
              child: SwitchListTile(
                  dense: true,
                  title: Text(
                    anonymous ? 'anonyme'.toUpperCase() : 'non anonyme'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    anonymous ? 'Sans vous identifier' : 'Avec vos informations',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  value: anonymous,
                  onChanged: (bool value) {
                    setState(() => anonymous = value);
                  }
              ),
            ),

            30.height,

            CustomTextField(
              paddingBottom: 15.0,
              title: 'nom & prénom(s)',
              controller: nameController,
              focus: nameNode,
              nextFocus: phoneNode,
              textCapitalization: TextCapitalization.characters,
              errorThisFieldRequired: '',
              textFieldType: TextFieldType.NAME,
              hint: 'Votre nom',
            ).visible(!anonymous),

            CustomTextField(
              paddingBottom: 15.0,
              title: 'numéro de téléphone',
              controller: phoneController,
              focus: phoneNode,
              nextFocus: emailNode,
              errorThisFieldRequired: '',
              textFieldType: TextFieldType.PHONE,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              hint: 'Votre numéro de téléphone',
            ).visible(!anonymous),

            CustomTextField(
              paddingBottom: 15.0,
              title: 'adresse mail',
              controller: emailController,
              focus: emailNode,
              nextFocus: commentNode,
              errorThisFieldRequired: '',
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              hint: 'Votre mail ici',
            ).visible(!anonymous),

            CustomTextField(
              paddingBottom: 30.0,
              title: 'message',
              controller: commentController,
              focus: commentNode,
              minLines: 4,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              errorThisFieldRequired: '',
              textFieldType: TextFieldType.OTHER,
              hint: 'Votre message ici',
            ),


            SizedBox(
              width: MediaQuery.of(context).size.width*.9,
              child: FilledButton(
                text: "envoyer",
                onPressed: () async {

                  var phone = phoneController.text;
                  var name = nameController.text;
                  var comment = commentController.text;
                  var mail = emailController.text;
                  var act = widget.act;

                  bool hasInternetConnection = await InternetConnectionChecker().hasConnection;

                  if(!hasInternetConnection) {
                    noConnexionToast();
                  } else if(anonymous) {

                    if(comment.isEmpty) {
                      warningToast('Veuillez entrer votre préoccupation.');
                    } else {

                      CommentModel model = CommentModel(
                        nom_et_prenoms: 'anonyme',
                        telephone: 'telephone',
                        email: 'email',
                        titre: 'titre',
                        lieu: 'lieu',
                        commentaire: comment,
                        actes_concernes: act == null ? [00] : [act['id']],
                        types_preoccupations: [1,2],
                      );

                      Get.to(()=> LoadingScreen(
                        init: ApiServices.submitConcern(model),
                        text: "Envoi en cours ..."
                      ));

                    }

                  } else {

                    if (phone.isNotEmpty && name.isNotEmpty && comment.isNotEmpty) {

                      // CommentModel model = CommentModel(
                      //   nom_et_prenoms: name,
                      //   telephone: phone,
                      //   email: mail.isEmpty ? '' : mail,
                      //   titre: 'titre',
                      //   lieu: 'lieu',
                      //   commentaire: comment,
                      //   actes_concernes: act == null ? [00] : [act['id']],
                      //   types_preoccupations: [1,2],
                      // );

                      CommentModel model = CommentModel(
                        nom_et_prenoms: name,
                        telephone: 'telephone',
                        email: mail.isEmpty ? '' : mail,
                        titre: 'titre',
                        lieu: 'lieu',
                        commentaire: comment,
                        actes_concernes: act == null ? [00] : [act['id']],
                        types_preoccupations: [1,2],
                      );

                      Get.to(()=> LoadingScreen(
                          init: ApiServices.submitConcern(model),
                          text: "Envoi en cours ..."
                      ));

                    } else {
                      if(phone.isEmpty)  warningToast('Veuillez entrer votre numéro de téléphone');
                      if(name.isEmpty)  warningToast('Veuillez entrer votre nom & prénom(s)');
                      if(comment.isEmpty)  warningToast('Veuillez entrer votre préoccupation.');
                    }

                  }

                },
              ),
            ).center()

          ],
        ),
      ).center().paddingAll(16),

    );
  }

}

