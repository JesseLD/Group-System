// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateModel {

  String productionVersion;
  String developmentVersion;
  String updateUrl;

  UpdateModel({
    required this.productionVersion,
    required this.developmentVersion,
    required this.updateUrl,
  });

  factory UpdateModel.empty() {
    return UpdateModel(
      productionVersion: "",
      developmentVersion: "",
      updateUrl: "",
    );
  }


  UpdateModel copyWith({
    String? productionVersion,
    String? developmentVersion,
    String? updateUrl,
  }) {
    return UpdateModel(
      productionVersion: productionVersion ?? this.productionVersion,
      developmentVersion: developmentVersion ?? this.developmentVersion,
      updateUrl: updateUrl ?? this.updateUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productionVersion': productionVersion,
      'developmentVersion': developmentVersion,
      'updateUrl': updateUrl,
    };
  }

  factory UpdateModel.fromMap(Map<String, dynamic> map) {
    return UpdateModel(
      productionVersion: map['productionVersion'] as String,
      developmentVersion: map['developmentVersion'] as String,
      updateUrl: map['updateUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateModel.fromJson(String source) => UpdateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UpdateModel(productionVersion: $productionVersion, developmentVersion: $developmentVersion, updateUrl: $updateUrl)';

  @override
  bool operator ==(covariant UpdateModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.productionVersion == productionVersion &&
      other.developmentVersion == developmentVersion &&
      other.updateUrl == updateUrl;
  }

  @override
  int get hashCode => productionVersion.hashCode ^ developmentVersion.hashCode ^ updateUrl.hashCode;
}
