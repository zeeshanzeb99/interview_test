class MovieDetails {
  bool? adult;
  String? backdropPath;
  Collection? belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetails({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieDetails.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? Collection.fromJson(json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    genres = (json['genres'] as List<dynamic>?)
        ?.map((genre) => Genre.fromJson(genre))
        .toList();
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    productionCompanies = (json['production_companies'] as List<dynamic>?)
        ?.map((company) => ProductionCompany.fromJson(company))
        .toList();
    productionCountries = (json['production_countries'] as List<dynamic>?)
        ?.map((country) => ProductionCountry.fromJson(country))
        .toList();
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    spokenLanguages = (json['spoken_languages'] as List<dynamic>?)
        ?.map((language) => SpokenLanguage.fromJson(language))
        .toList();
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      data['belongs_to_collection'] = belongsToCollection!.toJson();
    }
    data['budget'] = budget;
    data['genres'] = genres?.map((genre) => genre.toJson()).toList();
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['origin_country'] = originCountry;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['production_companies'] =
        productionCompanies?.map((company) => company.toJson()).toList();
    data['production_countries'] =
        productionCountries?.map((country) => country.toJson()).toList();
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['spoken_languages'] =
        spokenLanguages?.map((language) => language.toJson()).toList();
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class Collection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  Collection({this.id, this.name, this.posterPath, this.backdropPath});

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
  };
}

class Genre {
  int? id;
  String? name;

  Genre({this.id, this.name});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class ProductionCompany {
  int? id;
  String? name;
  String? logoPath;
  String? originCountry;

  ProductionCompany({this.id, this.name, this.logoPath, this.originCountry});

  ProductionCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logoPath = json['logo_path'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'logo_path': logoPath,
    'origin_country': originCountry,
  };
}

class ProductionCountry {
  String? iso_3166_1;
  String? name;

  ProductionCountry({this.iso_3166_1, this.name,});

  ProductionCountry.fromJson(Map<String, dynamic> json) {
    iso_3166_1 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'iso_3166_1': iso_3166_1,
    'name': name,
  };
}

class SpokenLanguage {
  String? iso_639_1;
  String? englishName;
  String? name;

  SpokenLanguage({this.iso_639_1, this.name, this.englishName});

  SpokenLanguage.fromJson(Map<String, dynamic> json) {
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
    englishName = json['english_name'];
  }

  Map<String, dynamic> toJson() => {
    'iso_639_1': iso_639_1,
    'name': name,
    'english_name': englishName,
  };
}




// Additional helper classes ProductionCompany, ProductionCountry, and SpokenLanguage
// (similar pattern for fromJson and toJson methods as above)
