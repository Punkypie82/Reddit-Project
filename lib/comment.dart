import 'Post.dart';

class Comment {
  String profilePictureUrl;
  String name;
  String date;
  String commentText;
  int upvotes = 0;
  bool upVoteEnabled = false;
  bool downVoteEnabled = false;

  Comment(this.profilePictureUrl, this.name, this.date, this.commentText);

  void upChanger() {this.upVoteEnabled ? this.upVoteEnabled = false : this.upVoteEnabled = true;}

  void downChanger() {downVoteEnabled ? downVoteEnabled = false : downVoteEnabled = true;}

  bool getUpVoteEnabled() {return upVoteEnabled;}

  bool getDownVoteEnabled() {return downVoteEnabled;}
}