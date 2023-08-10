import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Ads {
  String marca;
  String tipo;
  String tamanho;
  String aro;
  String descricao;

  Ads({
    required this.marca,
    required this.tipo,
    required this.tamanho,
    required this.aro,
    required this.descricao,
  });

  factory Ads.fromJson(Map<String, dynamic> json) {
    return Ads(
      marca: json['marca'] ?? json['marca'],
      tipo: json['tipo'] ?? json['tipo'],
      tamanho: json['tamanho'] ?? json['tamanho'],
      aro: json['aro'] ?? json['aro'],
      descricao: json['descricao'] ?? json['descricao'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> sell = <String, dynamic>{};
    sell["marca"] = marca;
    sell["tipo"] = tipo;
    sell["tamanho"] = tamanho;
    sell["aro"] = aro;
    sell["descrocao"] = descricao;
    return sell;
  }
}
