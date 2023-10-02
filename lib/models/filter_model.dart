class FilterModel {
  List<String> selectedCategories = [];

  bool isCategorySelected(String category) {
    return selectedCategories.contains(category);
  }

  void toggleCategory(String category){
    if(selectedCategories.contains(category)){
      selectedCategories.remove(category);
    }else{
      selectedCategories.add(category);
    }
  }
}
