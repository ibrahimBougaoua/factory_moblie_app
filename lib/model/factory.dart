class FactoryModel {

  final int factory_id;
  final String name;
  final String desc;
  final String logo;
  final String phone;
  final String created_at;
  final String updated_at;

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
        factory_id : json['factory_id'],
        name : json['name'].toString(),
        desc : json['desc'].toString(),
        logo : json['logo'].toString(),
        phone : json['phone'].toString(),
        created_at : json['created_at'].toString(),
        updated_at : json['updated_at'].toString()
    );
  }

}