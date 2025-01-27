class SearchDadJokeRequestModel {
  final int? page;
  final int? limit;
  final String? term;

  SearchDadJokeRequestModel(
      {required this.page, required this.limit, required this.term});

  Map<String, String> toJson() {
    return {
      "limit": limit.toString(),
      "page": page.toString(),
      "term": term ?? "",
    };
  }
}
