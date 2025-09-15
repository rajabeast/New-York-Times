part of 'model.dart';

class MultimediaModel extends Equatable {
  final String? url;
  final String? format;
  final int? height;
  final int? width;
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;

  const MultimediaModel({
    this.url,
    this.format,
    this.height,
    this.width,
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
  });

  factory MultimediaModel.fromJson(Map<String, dynamic> json) {
    return MultimediaModel(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
      type: json['type'] as String?,
      subtype: json['subtype'] as String?,
      caption: json['caption'] as String?,
      copyright: json['copyright'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'format': format,
      'height': height,
      'width': width,
      'type': type,
      'subtype': subtype,
      'caption': caption,
      'copyright': copyright,
    };
  }

  @override
  List<Object?> get props => [
    url,
    format,
    height,
    width,
    type,
    subtype,
    caption,
    copyright,
  ];
}
