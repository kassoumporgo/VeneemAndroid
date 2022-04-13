import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/ui/widgets/custom_app_bar.dart';

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

              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.grey, width: 2)
                ),
                child: Row(
                  children: [
                    const Icon(Icons.face_retouching_natural),
                    const Text(
                      "FaceBook",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ).center(),
      ),

    );
  }
}