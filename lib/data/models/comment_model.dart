class Comment {
  final String username;
  final String commentMessage;
  final String date;
  final String avatar;

  const Comment(this.username, this.commentMessage, this.date, this.avatar);

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      json['username'],
      json['content'],
      json['date'],
      json['avatar'],
    );
  }
}
