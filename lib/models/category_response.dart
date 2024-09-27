class Movie {
  Movie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.name,
    required this.originalName,
    required this.firstAirDate,
    required this.originCountry,
    required this.status_message,
  });

  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<num> genreIds;
  final num? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final num? voteAverage;
  final num? voteCount;
  final String? name;
  final String? originalName;
  final DateTime? firstAirDate;
  final List<String> originCountry;
  final String? status_message;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json["backdrop_path"],
      id: json["id"],
      title: json["title"] ?? 'title',
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      mediaType: json["media_type"],
      adult: json["adult"],
      originalLanguage: json["original_language"],
      genreIds: json["genre_ids"] == null
          ? []
          : List<num>.from(json["genre_ids"].map((x) => x)),
      popularity: json["popularity"],
      releaseDate: json["release_date"] == null
          ? null
          : DateTime.tryParse(json["release_date"]),
      video: json["video"],
      status_message: json["status_message"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      name: json["name"],
      originalName: json["original_name"],
      firstAirDate: json["first_air_date"] == null
          ? null
          : DateTime.tryParse(json["first_air_date"]),
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "id": id,
    "title": title,
    "original_title": originalTitle,
    "overview": overview,
    "poster_path": posterPath,
    "media_type": mediaType,
    "adult": adult,
    "original_language": originalLanguage,
    "genre_ids": genreIds.map((x) => x).toList(),
    "popularity": popularity,
    "release_date": releaseDate == null
        ? null
        : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "name": name,
    "original_name": originalName,
    "first_air_date": firstAirDate == null
        ? null
        : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "origin_country": originCountry.map((x) => x).toList(),
  };

  @override
  String toString() {
    return "$backdropPath, $id, $title, $originalTitle, $overview, $posterPath, $mediaType, $adult, $originalLanguage, $genreIds, $popularity, $releaseDate, $video, $voteAverage, $voteCount, $name, $originalName, $firstAirDate, $originCountry";
  }
}