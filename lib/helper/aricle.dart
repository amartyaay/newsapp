class Article {
  String title;
  String author;
  String description;
  String urlToImage;
  String content;
  String articleUrl;

  Article(
      {this.title = "Not Provided by API",
      this.description = "Not Provided by API",
      this.author = "Not Provided by API",
      this.content = "Not Provided by API",
      this.urlToImage =
          "https://images.unsplash.com/photo-1656137631671-f703745c69f9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDU5fEJKSk10dGVESkE0fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60",
      this.articleUrl = "https://www.google.com"});
}
