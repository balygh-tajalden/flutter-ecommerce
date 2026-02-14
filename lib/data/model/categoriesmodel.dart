class Categoriesmodel {
  int? categorieId;
  String? categorieName;
  String? categorieImage;
  String? categorieDatetime;

  Categoriesmodel(
      {this.categorieId,
      this.categorieName,
      this.categorieImage,
      this.categorieDatetime});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    categorieId = json['categorie_id'];
    categorieName = json['categorie_name'];
    categorieImage = json['categorie_image'];
    categorieDatetime = json['categorie_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categorie_id'] = categorieId;
    data['categorie_name'] = categorieName;
    data['categorie_image'] = categorieImage;
    data['categorie_datetime'] = categorieDatetime;
    return data;
  }
}