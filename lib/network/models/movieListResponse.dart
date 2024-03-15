class MovieListResponse {
  List<Result>? result;
  QueryParam? queryParam;
  int? code;
  String? message;

  MovieListResponse({this.result, this.queryParam, this.code, this.message});

  MovieListResponse.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    queryParam = json['queryParam'] != null
        ? new QueryParam.fromJson(json['queryParam'])
        : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    if (this.queryParam != null) {
      data['queryParam'] = this.queryParam!.toJson();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Result {
  String? sId;
  List<String>? director;
  List<String>? writers;
  List<String>? stars;
  int? releasedDate;
  List<String>? productionCompany;
  String? title;
  String? language;
  int? runTime;
  String? genre;
  List<Voted>? voted;
  String? poster;
  int? pageViews;
  String? description;
  List<String>? upVoted;
  List<String>? downVoted;
  int? totalVoted;
  int? voting;

  Result(
      {this.sId,
      this.director,
      this.writers,
      this.stars,
      this.releasedDate,
      this.productionCompany,
      this.title,
      this.language,
      this.runTime,
      this.genre,
      this.voted,
      this.poster,
      this.pageViews,
      this.description,
      this.upVoted,
      this.downVoted,
      this.totalVoted,
      this.voting});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    director = json['director'].cast<String>();
    writers = json['writers'].cast<String>();
    stars = json['stars'].cast<String>();
    releasedDate = json['releasedDate'];
    productionCompany = json['productionCompany'].cast<String>();
    title = json['title'];
    language = json['language'];
    runTime = json['runTime'];
    genre = json['genre'];
    if (json['voted'] != null) {
      voted = <Voted>[];
      json['voted'].forEach((v) {
        voted!.add(new Voted.fromJson(v));
      });
    }
    poster = json['poster'];
    pageViews = json['pageViews'];
    description = json['description'];
    if (json['upVoted'] != null ) {
      upVoted = json['upVoted'].cast<String>();
    } else {
      upVoted = [];
    }
    if (json['downVoted'] != null ) {
      downVoted = json['downVoted'].cast<String>();
    } else {
      downVoted = [];
    }
   // downVoted = json['downVoted'].cast<String>();
    totalVoted = json['totalVoted'];
    voting = json['voting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['director'] = this.director;
    data['writers'] = this.writers;
    data['stars'] = this.stars;
    data['releasedDate'] = this.releasedDate;
    data['productionCompany'] = this.productionCompany;
    data['title'] = this.title;
    data['language'] = this.language;
    data['runTime'] = this.runTime;
    data['genre'] = this.genre;
    if (this.voted != null) {
      data['voted'] = this.voted!.map((v) => v.toJson()).toList();
    }
    data['poster'] = this.poster;
    data['pageViews'] = this.pageViews;
    data['description'] = this.description;
    data['upVoted'] = this.upVoted;
    data['downVoted'] = this.downVoted;
    data['totalVoted'] = this.totalVoted;
    data['voting'] = this.voting;
    return data;
  }
}

class Voted {
  List<String>? upVoted;
  List<String>? downVoted;
  String? sId;
  int? updatedAt;
  String? genre;

  Voted({this.upVoted, this.downVoted, this.sId, this.updatedAt, this.genre});

  Voted.fromJson(Map<String, dynamic> json) {
    upVoted = json['upVoted'].cast<String>();
    // if (json['downVoted'] != null) {
    //   downVoted = <String>[];
    //   json['downVoted'].forEach((v) {
    //     downVoted!.add(new Null.fromJson(v));
    //   });
    // }
    sId = json['_id'];
    updatedAt = json['updatedAt'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['upVoted'] = this.upVoted;
    // if (this.downVoted != null) {
    //   data['downVoted'] = this.downVoted!.map((v) => v.toJson()).toList();
    // }
    data['_id'] = this.sId;
    data['updatedAt'] = this.updatedAt;
    data['genre'] = this.genre;
    return data;
  }
}

class QueryParam {
  String? category;
  String? language;
  String? genre;
  String? sort;

  QueryParam({this.category, this.language, this.genre, this.sort});

  QueryParam.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    language = json['language'];
    genre = json['genre'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['language'] = this.language;
    data['genre'] = this.genre;
    data['sort'] = this.sort;
    return data;
  }
}
