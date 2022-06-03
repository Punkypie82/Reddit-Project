import 'package:reddit/comment.dart';

class Post {
  String subReddit;
  String username;
  String date;
  String title;
  String description;
  String profilePictureUrl;
  String postUrl;
  Comment comments;
  int upvotes = 0;
  int commentsNum = 0;
  bool upVoteEnabled = false;
  bool downVoteEnabled = false;

  Post(this.profilePictureUrl, this.postUrl, this.subReddit, this.username, this.date, this.title, this.description, this.comments);

  void upChanger() {this.upVoteEnabled ? this.upVoteEnabled = false : this.upVoteEnabled = true;}

  void downChanger() {downVoteEnabled ? downVoteEnabled = false : downVoteEnabled = true;}

  bool getUpVoteEnabled() {return upVoteEnabled;}

  bool getDownVoteEnabled() {return downVoteEnabled;}

  downVote() {
    downVoteEnabled ? downVoteEnabled = false : downVoteEnabled = true;
    if (upVoteEnabled && downVoteEnabled) upVoteEnabled = false;
  }
  void upVote() {
    upVoteEnabled ? upVoteEnabled = false : upVoteEnabled = true;
    if (upVoteEnabled && downVoteEnabled) downVoteEnabled = false;
  }
}