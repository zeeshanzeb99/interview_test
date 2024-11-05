import 'dart:convert';

import 'package:flutter/services.dart';

import '../../helper/util/utils.dart';
import '../model/response/main_response_model.dart';

class MockApiClient {
  MockApiClient();

  static const _jsonDir = 'assets/json/';
  static const _jsonExtension = '.json';

  Future<MainResponseModel> mockApiCall(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    /**
     * For throwing exception uncomment below code.
     */

    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> getMyFriends(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> getRequestsAndSuggestion(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }
  Future<MainResponseModel> getInbox(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> getSchedulePosts(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> searchFriends(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> getProfile(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> getBlockedAccounts(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> getSubscriptionPlan(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> subscribePlan(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> updateProfile(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<dynamic> acceptRejectRequest() async {
    return "";
  }

  Future<dynamic> deleteAccount() async {
    return "";
  }

  Future<dynamic> blockUserRequest() async {
    return "";
  }

  Future<dynamic> reportUserRequest() async {
    return "";
  }

  Future<dynamic> updateNotification() async {
    return "";
  }

  Future<dynamic> logoutUser() async {
    return "";
  }

  Future<dynamic> adminAccess() async {
    return "";
  }

  Future<MainResponseModel> postExperience(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> getPostDetails(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> getSavedPosts(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> updateComment(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<MainResponseModel> getMyProfile(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    Utils.console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<dynamic> deleteComment() async {
    return "";
  }

  Future<dynamic> deletePost() async {
    return "";
  }

  Future<dynamic> addReply() async {
    return "";
  }

  Future<MainResponseModel> getPersonalDraft(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    return MainResponseModel.fromJson(jsonResult);
  }

  Future<dynamic> mockApiCallEmptyResponse() async {
    /**
     * For throwing exception uncomment below code.
     */

    return "";
  }
}
