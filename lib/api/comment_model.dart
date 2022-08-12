
class CommentModel {

  String nom_et_prenoms;
  String telephone;
  String email;
  String lieu;
  String titre;
  String commentaire;
  List actes_concernes;
  List types_preoccupations;

  CommentModel({
    required this.nom_et_prenoms,
    required this.telephone,
    required this.email,
    required this.lieu,
    required this.titre,
    required this.commentaire,
    required this.actes_concernes,
    required this.types_preoccupations,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    nom_et_prenoms : json['nom_et_prenoms'],
    telephone : json['telephone'],
    email : json['email'],
    lieu : json['lieu'],
    titre : json['titre'],
    commentaire : json['commentaire'],
    actes_concernes : json['actes_concernes'],
    types_preoccupations : json['types_preoccupations'],
  );

  Map<String, dynamic> toJson() => {
    'telephone' : telephone,
    'nom_et_prenoms' : nom_et_prenoms,
    'email' : email,
    'lieu' : lieu,
    'titre' : titre,
    'commentaire' : commentaire,
    'actes_concernes' : actes_concernes,
    'types_preoccupations' : types_preoccupations,
  };


}