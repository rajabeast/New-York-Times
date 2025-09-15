part of 'model.dart';

class TopStoriesModel extends Equatable {
  final String? section;
  final String? subsection;
  final String? title;
  final String? abstract;
  final String? url;
  final String? uri;
  final String? byline;
  final String? itemType;
  final DateTime? updatedDate;
  final DateTime? createdDate;
  final DateTime? publishedDate;
  final String? materialTypeFacet;
  final String? kicker;
  final List<String>? desFacet;
  final List<String>? orgFacet;
  final List<String>? perFacet;
  final List<String>? geoFacet;
  final List<MultimediaModel>? multimedia;
  final String? shortUrl;

  const TopStoriesModel({
    this.section,
    this.subsection,
    this.title,
    this.abstract,
    this.url,
    this.uri,
    this.byline,
    this.itemType,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.materialTypeFacet,
    this.kicker,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.multimedia,
    this.shortUrl,
  });

  factory TopStoriesModel.fromJson(Map<String, dynamic> json) {
    return TopStoriesModel(
      section: json['section'] as String?,
      subsection: json['subsection'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      url: json['url'] as String?,
      uri: json['uri'] as String?,
      byline: json['byline'] as String?,
      itemType: json['item_type'] as String?,
      updatedDate: json['updated_date'] != null
          ? DateTime.tryParse(json['updated_date'])
          : null,
      createdDate: json['created_date'] != null
          ? DateTime.tryParse(json['created_date'])
          : null,
      publishedDate: json['published_date'] != null
          ? DateTime.tryParse(json['published_date'])
          : null,
      materialTypeFacet: json['material_type_facet'] as String?,
      kicker: json['kicker'] as String?,
      desFacet: json['des_facet'] != null
          ? List<String>.from(json['des_facet'])
          : null,
      orgFacet: json['org_facet'] != null
          ? List<String>.from(json['org_facet'])
          : null,
      perFacet: json['per_facet'] != null
          ? List<String>.from(json['per_facet'])
          : null,
      geoFacet: json['geo_facet'] != null
          ? List<String>.from(json['geo_facet'])
          : null,
      multimedia: json['multimedia'] != null
          ? (json['multimedia'] as List)
                .map((item) => MultimediaModel.fromJson(item))
                .toList()
          : null,
      shortUrl: json['short_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'section': section,
      'subsection': subsection,
      'title': title,
      'abstract': abstract,
      'url': url,
      'uri': uri,
      'byline': byline,
      'item_type': itemType,
      'updated_date': updatedDate?.toIso8601String(),
      'created_date': createdDate?.toIso8601String(),
      'published_date': publishedDate?.toIso8601String(),
      'material_type_facet': materialTypeFacet,
      'kicker': kicker,
      'des_facet': desFacet,
      'org_facet': orgFacet,
      'per_facet': perFacet,
      'geo_facet': geoFacet,
      'multimedia': multimedia?.map((item) => item.toJson()).toList(),
      'short_url': shortUrl,
    };
  }

  String get thumbnailUrl {
    if (multimedia != null && multimedia!.isNotEmpty) {
      final thumbnail = multimedia!.firstWhere(
        (media) =>
            media.format == 'thumbLarge' ||
            media.format == 'mediumThreeByTwo210',
        orElse: () => multimedia!.first,
      );
      return thumbnail.url ?? '';
    }
    return '';
  }

  String get largeImageUrl {
    if (multimedia != null && multimedia!.isNotEmpty) {
      final largeImage = multimedia!.firstWhere(
        (media) => media.format == 'superJumbo' || media.format == 'jumbo',
        orElse: () => multimedia!.first,
      );
      return largeImage.url ?? '';
    }
    return '';
  }

  @override
  List<Object?> get props => [
    section,
    subsection,
    title,
    abstract,
    url,
    uri,
    byline,
    itemType,
    updatedDate,
    createdDate,
    publishedDate,
    materialTypeFacet,
    kicker,
    desFacet,
    orgFacet,
    perFacet,
    geoFacet,
    multimedia,
    shortUrl,
  ];
}
