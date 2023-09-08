import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Ads {
  String? marca;
  String? tipo;
  String? tamanho;
  int? aro;
  String? suspensaoDianteira;
  String? suspensaoTraseira;
  String? freio;
  String? tipoFreio;
  String? descricaoController;
  double? price;

  Ads({
    required this.marca,
    required this.tipo,
    required this.tamanho,
    required this.aro,
    required this.suspensaoDianteira,
    required this.suspensaoTraseira,
    required this.freio,
    required this.tipoFreio,
    required this.price,
    required this.descricaoController,
  });

  factory Ads.fromJson(Map<String, dynamic> json) {
    return Ads(
      marca: json['marca'] ?? json['marca'],
      tipo: json['tipo'] ?? json['tipo'],
      tamanho: json['tamanho'] ?? json['tamanho'],
      aro: json['aro'] ?? json['aro'],
      suspensaoDianteira: json['suspensaoDianteira'] ?? json['suspensaoDianteira'],
      suspensaoTraseira: json['suspensaoTraseira'] ?? json['suspensaoTraseira'],
      freio: json['freio'] ?? json['freio'],
      tipoFreio: json['tipoFreio'] ?? json['tipoFreio'],
      price: json['price'] ?? json['price'],
      descricaoController: json['descricaoController'] ?? json ['descricaoController']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> ads = <String, dynamic>{};
    ads["marca"] = marca;
    ads["tipo"] = tipo;
    ads["tamanho"] = tamanho;
    ads["aro"] = aro;
    ads["suspensaoDianteira"] = suspensaoDianteira;
    ads["suspensaoTraseira"] = suspensaoTraseira;
    ads["freio"] = freio;
    ads["tipoFreio"] = tipoFreio;
    ads["price"] = price;
    ads["descricaoController"] = price;

    return ads;
  }
}
