import 'package:flutter/cupertino.dart';
import 'package:provider_arc/core/services/api_service.dart';
import 'package:provider_arc/models/comment.dart';

import '../base_model.dart';

class CommentsModel extends BaseModel {
  ApiService _api;
  CommentsModel({@required ApiService api}) : _api = api;
  List<Comment> comments;
  Future fetchComments(int postId) async {
    setBusy(true);
    comments = await _api.getCommentsForPost(postId);
    setBusy(false);
  }
}
