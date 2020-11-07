class FactoryModel {

  String factory_id;
  String name;
  String desc;
  String logo;
  String phone;
  String created_at;
  String updated_at;

  FactoryModel({
    this.factory_id,
    this.name,
    this.desc,
    this.logo,
    this.phone,
    this.created_at,
    this.updated_at
  });

  factory FactoryModel.formJson(Map<String,dynamic> json) {
    return FactoryModel(
        factory_id:json['factory_id'],
        name : json['name'],
        desc : json['desc'],
        logo : json['logo'],
        phone : json['phone'],
        created_at : json['created_at'],
        updated_at : json['updated_at']
    );
  }

}