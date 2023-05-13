// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);

import 'dart:convert';

GameModel gameModelFromJson(String str) => GameModel.fromJson(json.decode(str));

String gameModelToJson(GameModel data) => json.encode(data.toJson());

class GameModel {
    GameModel({
        this.count,
        this.next,
        this.previous,
        this.results,
        this.seoTitle,
        this.seoDescription,
        this.seoKeywords,
        this.seoH1,
        this.noindex,
        this.nofollow,
        this.description,
        this.filters,
        this.nofollowCollections,
    });

    int? count;
    String? next;
    dynamic previous;
    List<ResultGame>? results;
    String? seoTitle;
    String? seoDescription;
    String? seoKeywords;
    String? seoH1;
    bool? noindex;
    bool? nofollow;
    String? description;
    Filters? filters;
    List<String>? nofollowCollections;

    factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<ResultGame>.from(json["results"]!.map((x) => ResultGame.fromJson(x))),
        seoTitle: json["seo_title"],
        seoDescription: json["seo_description"],
        seoKeywords: json["seo_keywords"],
        seoH1: json["seo_h1"],
        noindex: json["noindex"],
        nofollow: json["nofollow"],
        description: json["description"],
        filters: json["filters"] == null ? null : Filters.fromJson(json["filters"]),
        nofollowCollections: json["nofollow_collections"] == null ? [] : List<String>.from(json["nofollow_collections"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "seo_title": seoTitle,
        "seo_description": seoDescription,
        "seo_keywords": seoKeywords,
        "seo_h1": seoH1,
        "noindex": noindex,
        "nofollow": nofollow,
        "description": description,
        "filters": filters?.toJson(),
        "nofollow_collections": nofollowCollections == null ? [] : List<dynamic>.from(nofollowCollections!.map((x) => x)),
    };
}

class Filters {
    Filters({
        this.years,
    });

    List<FiltersYear>? years;

    factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        years: json["years"] == null ? [] : List<FiltersYear>.from(json["years"]!.map((x) => FiltersYear.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "years": years == null ? [] : List<dynamic>.from(years!.map((x) => x.toJson())),
    };
}

class FiltersYear {
    FiltersYear({
        this.from,
        this.to,
        this.filter,
        this.decade,
        this.years,
        this.nofollow,
        this.count,
    });

    int? from;
    int? to;
    String? filter;
    int? decade;
    List<YearYear>? years;
    bool? nofollow;
    int? count;

    factory FiltersYear.fromJson(Map<String, dynamic> json) => FiltersYear(
        from: json["from"],
        to: json["to"],
        filter: json["filter"],
        decade: json["decade"],
        years: json["years"] == null ? [] : List<YearYear>.from(json["years"]!.map((x) => YearYear.fromJson(x))),
        nofollow: json["nofollow"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "filter": filter,
        "decade": decade,
        "years": years == null ? [] : List<dynamic>.from(years!.map((x) => x.toJson())),
        "nofollow": nofollow,
        "count": count,
    };
}

class YearYear {
    YearYear({
        this.year,
        this.count,
        this.nofollow,
    });

    int? year;
    int? count;
    bool? nofollow;

    factory YearYear.fromJson(Map<String, dynamic> json) => YearYear(
        year: json["year"],
        count: json["count"],
        nofollow: json["nofollow"],
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "count": count,
        "nofollow": nofollow,
    };
}

class ResultGame {
    ResultGame({
        this.id,
        this.slug,
        this.name,
        this.released,
        this.tba,
        this.backgroundImage,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.ratingsCount,
        this.reviewsTextCount,
        this.added,
        this.addedByStatus,
        this.metacritic,
        this.playtime,
        this.suggestionsCount,
        this.updated,
        this.userGame,
        this.reviewsCount,
        this.saturatedColor,
        this.dominantColor,
        this.platforms,
        this.parentPlatforms,
        this.genres,
        this.stores,
        this.clip,
        this.tags,
        this.esrbRating,
        this.shortScreenshots,
    });

    int? id;
    String? slug;
    String? name;
    DateTime? released;
    bool? tba;
    String? backgroundImage;
    double? rating;
    int? ratingTop;
    List<Rating>? ratings;
    int? ratingsCount;
    int? reviewsTextCount;
    int? added;
    AddedByStatus? addedByStatus;
    int? metacritic;
    int? playtime;
    int? suggestionsCount;
    DateTime? updated;
    dynamic userGame;
    int? reviewsCount;
    String? saturatedColor;
    String? dominantColor;
    List<PlatformElement>? platforms;
    List<ParentPlatform>? parentPlatforms;
    List<Genre>? genres;
    List<Store>? stores;
    dynamic clip;
    List<Genre>? tags;
    EsrbRating? esrbRating;
    List<ShortScreenshot>? shortScreenshots;

    factory ResultGame.fromJson(Map<String, dynamic> json) => ResultGame(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released: json["released"] == null ? null : DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: json["added_by_status"] == null ? null : AddedByStatus.fromJson(json["added_by_status"]),
        metacritic: json["metacritic"],
        playtime: json["playtime"],
        suggestionsCount: json["suggestions_count"],
        updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        platforms: json["platforms"] == null ? [] : List<PlatformElement>.from(json["platforms"]!.map((x) => PlatformElement.fromJson(x))),
        parentPlatforms: json["parent_platforms"] == null ? [] : List<ParentPlatform>.from(json["parent_platforms"]!.map((x) => ParentPlatform.fromJson(x))),
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
        stores: json["stores"] == null ? [] : List<Store>.from(json["stores"]!.map((x) => Store.fromJson(x))),
        clip: json["clip"],
        tags: json["tags"] == null ? [] : List<Genre>.from(json["tags"]!.map((x) => Genre.fromJson(x))),
        esrbRating: json["esrb_rating"] == null ? null : EsrbRating.fromJson(json["esrb_rating"]),
        shortScreenshots: json["short_screenshots"] == null ? [] : List<ShortScreenshot>.from(json["short_screenshots"]!.map((x) => ShortScreenshot.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released": "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status": addedByStatus?.toJson(),
        "metacritic": metacritic,
        "playtime": playtime,
        "suggestions_count": suggestionsCount,
        "updated": updated?.toIso8601String(),
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "platforms": platforms == null ? [] : List<dynamic>.from(platforms!.map((x) => x.toJson())),
        "parent_platforms": parentPlatforms == null ? [] : List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "stores": stores == null ? [] : List<dynamic>.from(stores!.map((x) => x.toJson())),
        "clip": clip,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "esrb_rating": esrbRating?.toJson(),
        "short_screenshots": shortScreenshots == null ? [] : List<dynamic>.from(shortScreenshots!.map((x) => x.toJson())),
    };
}

class AddedByStatus {
    AddedByStatus({
        this.yet,
        this.owned,
        this.beaten,
        this.toplay,
        this.dropped,
        this.playing,
    });

    int? yet;
    int? owned;
    int? beaten;
    int? toplay;
    int? dropped;
    int? playing;

    factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
    );

    Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
    };
}

class EsrbRating {
    EsrbRating({
        this.id,
        this.name,
      required  this.slug,
    });

    int? id;
    String? name;
    String slug;

    factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}

class Genre {
    Genre({
        this.id,
        this.name,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.domain,
        this.language,
    });

    int? id;
    String? name;
    String? slug;
    int? gamesCount;
    String? imageBackground;
    String? domain;
    Language? language;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"],
        language: languageValues.map[json["language"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain,
        "language": languageValues.reverse[language],
    };
}

enum Language { ENG }

final languageValues = EnumValues({
    "eng": Language.ENG
});

class ParentPlatform {
    ParentPlatform({
       required this.platform,
    });

    EsrbRating platform;

    factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: EsrbRating.fromJson(json["platform"]),
    );

    Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
    };
}

class PlatformElement {
    PlatformElement({
        this.platform,
        this.releasedAt,
        this.requirementsEn,
        this.requirementsRu,
    });

    PlatformPlatform? platform;
    DateTime? releasedAt;
    RequirementsEn? requirementsEn;
    dynamic requirementsRu;

    factory PlatformElement.fromJson(Map<String, dynamic> json) => PlatformElement(
        platform: json["platform"] == null ? null : PlatformPlatform.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null ? null : DateTime.parse(json["released_at"]),
        requirementsEn: json["requirements_en"] == null ? null : RequirementsEn.fromJson(json["requirements_en"]),
        requirementsRu: json["requirements_ru"],
    );

    Map<String, dynamic> toJson() => {
        "platform": platform?.toJson(),
        "released_at": "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
        "requirements_en": requirementsEn?.toJson(),
        "requirements_ru": requirementsRu,
    };
}

class PlatformPlatform {
    PlatformPlatform({
        this.id,
        this.name,
        this.slug,
        this.image,
        this.yearEnd,
        this.yearStart,
        this.gamesCount,
        this.imageBackground,
    });

    int? id;
    String? name;
    String? slug;
    dynamic image;
    dynamic yearEnd;
    int? yearStart;
    int? gamesCount;
    String? imageBackground;

    factory PlatformPlatform.fromJson(Map<String, dynamic> json) => PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}

class RequirementsEn {
    RequirementsEn({
        this.minimum,
        this.recommended,
    });

    String? minimum;
    String? recommended;

    factory RequirementsEn.fromJson(Map<String, dynamic> json) => RequirementsEn(
        minimum: json["minimum"],
        recommended: json["recommended"],
    );

    Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended,
    };
}

class Rating {
    Rating({
        this.id,
        this.title,
        this.count,
        this.percent,
    });

    int? id;
    String? title;
    int? count;
    double? percent;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
    };
}

class ShortScreenshot {
    ShortScreenshot({
        this.id,
        this.image,
    });

    int? id;
    String? image;

    factory ShortScreenshot.fromJson(Map<String, dynamic> json) => ShortScreenshot(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}

class Store {
    Store({
        this.id,
        this.store,
    });

    int? id;
    Genre? store;

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        store: json["store"] == null ? null : Genre.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "store": store?.toJson(),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
