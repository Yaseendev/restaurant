class Pivot {
  int? branchId;
  int? categoryId;

  Pivot({this.branchId, this.categoryId});

  Pivot.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['category_id'] = this.categoryId;
    return data;
  }
}