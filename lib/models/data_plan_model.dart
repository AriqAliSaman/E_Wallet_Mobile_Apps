class DataPlanModel {
  final int? id;
  final String? name;
  final int? price;
  final int? operatorCartId;
  final String? createdAt;
  final String? updatedAt;

  DataPlanModel({
    this.id,
    this.name,
    this.price,
    this.operatorCartId,
    this.createdAt,
    this.updatedAt,
  });

  factory DataPlanModel.fromJson(Map<String, dynamic> json) => DataPlanModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        operatorCartId: json['operator_card_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
}
