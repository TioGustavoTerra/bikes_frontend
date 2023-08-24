import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Ads {
  String marca;
  String tipo;
  String tamanho;
  String aro;
  String suspensao;
  String suspensaoT;
  String freio;
  String tipofreio;

  Ads({
    required this.marca,
    required this.tipo,
    required this.tamanho,
    required this.aro,
    required this.suspensao,
    required this.suspensaoT,
    required this.freio,
    required this.tipofreio,
  });

  factory Ads.fromJson(Map<String, dynamic> json) {
    return Ads(
      marca: json['marca'] ?? json['marca'],
      tipo: json['tipo'] ?? json['tipo'],
      tamanho: json['tamanho'] ?? json['tamanho'],
      aro: json['aro'] ?? json['aro'],
      suspensao: json['suspensao'] ?? json['suspensao'],
      suspensaoT: json['suspensaoT'] ?? json['suspensaoT'],
      freio: json['freio'] ?? json['freio'],
      tipofreio: json['tipofreio'] ?? json['tipofreio'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> sell = <String, dynamic>{};
    sell["marca"] = marca;
    sell["tipo"] = tipo;
    sell["tamanho"] = tamanho;
    sell["aro"] = aro;
    sell["suspensao"] = suspensao;
    sell["suspensaoT"] = suspensaoT;
    sell["freio"] = freio;
    sell["tipofreio"] = tipofreio;
    return sell;
  }
}
