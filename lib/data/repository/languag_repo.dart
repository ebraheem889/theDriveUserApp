import 'package:flutter/material.dart';
import 'package:the_drive/data/model/response/language_model.dart';
import 'package:the_drive/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext? context}) {
    return AppConstants.languages;
  }
}
