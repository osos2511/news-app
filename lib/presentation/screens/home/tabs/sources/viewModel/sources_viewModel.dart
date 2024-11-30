import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/result.dart';

class SourcesViewModel extends ChangeNotifier {
  List<Source>? sources;
  bool isLoading = false;
  String? errorMessage;
  void getSourcesByCategoryId(String categoryId) async {
      isLoading = true;
      notifyListeners();
      var result = await ApiManager.getSources(categoryId);
      isLoading=false;
      switch (result) {
        case Success<List<Source>>():
          sources = result.data;
        case ServerError<List<Source>>():
          errorMessage = result.message;
        case Error<List<Source>>():
        errorMessage=result.exception.toString();
      }
      notifyListeners();
  }
}
    //   if(response.status=='ok'){
    //     sources=response.sources;
    //   }else{
    //     errorMessage=response.message;
    //   }
    //   notifyListeners();
    // }catch(e){
    //   isLoading=false;
    //   errorMessage=e.toString();
    //   notifyListeners();
    // }

