import 'dart:convert';
import 'package:http/http.dart' as http;
import '/constants/texts.dart';
import '/models/comment_model.dart';


Future<CommentModel> postComment({
  required String name,
  required String phone,
  required String mail,
  required String comment,
  Map? act,
}) async {
  final postUrl = Uri.parse(postCommentUrl);
  final response = await http.post(
    postUrl,
    headers: {
      'Content-type' : 'application/json',
      'charset' : 'UTF-8',
    },
    body: jsonEncode({
      'name' : name,
      'phone' : phone,
      'mail' : mail,
      'comment' : comment,
      'actes_concernes' : act,
    }),
  );

  if(response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Erreur lors de l'envoi du commentaire");
  }

}