import 'package:flutter/material.dart';
import 'package:notjusttodoapp/models/filter_model.dart';

class FilterProvider extends ChangeNotifier {
  FilterModel _filter = FilterModel();

  FilterModel get filter => _filter;

  void updateFilter(FilterModel newFilter) {
    _filter = newFilter;
    notifyListeners();
  }
}
