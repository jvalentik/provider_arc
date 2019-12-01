import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_arc/core/services/api_service.dart';
import 'package:provider_arc/core/viewmodels/base_model.dart';
import 'package:provider_arc/models/post.dart';

class PostsModel extends BaseModel {
  ApiService _api;

  PostsModel({@required ApiService api}) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
