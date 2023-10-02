import 'package:flutter_test/flutter_test.dart';
import 'package:notjusttodoapp/models/filter_model.dart';

void main() {
  group('FilterModel', () {
    test('isCategorySelected should return true if category is selected', () {
      FilterModel filterModel = FilterModel();
      String category = 'Work';

      filterModel.selectedCategories = ['Work', 'Shopping'];

      expect(filterModel.isCategorySelected(category), true);
    });

    test('isCategorySelected should return false if category is not selected',
        () {
      FilterModel filterModel = FilterModel();
      String category = 'Work';

      filterModel.selectedCategories = ['Shopping', 'Other'];

      expect(filterModel.isCategorySelected(category), false);
    });

    test(
        'toggleCategory should add category if not selected and remove if selected',
        () {
      FilterModel filterModel = FilterModel();
      String category = 'Work';

      filterModel.toggleCategory(category);
      filterModel.toggleCategory(category);

      expect(filterModel.selectedCategories, []);
    });
  });
}
