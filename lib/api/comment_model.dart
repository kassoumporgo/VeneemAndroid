
class CommentModel {

  String name;
  String phone;
  String mail;
  Map? actes_concernes;
  String comment;
  int? id;

  CommentModel({
    required this.name,
    required this.phone,
    required this.mail,
    this.actes_concernes,
    required this.comment,
    this.id,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    id : json['id'],
    name : json['name'],
    phone : json['phone'],
    mail : json['mail'],
    actes_concernes : json['actes_concernes'],
    comment : json['comment'],
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'phone' : phone,
    'mail' : mail,
    'actes_concernes' : actes_concernes,
    'comment' : comment,
  };


}