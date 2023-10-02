import 'package:flutter/material.dart';
import 'package:notjusttodoapp/models/filter_model.dart';
import 'package:notjusttodoapp/provider/filter_provider.dart';
import 'package:provider/provider.dart';

final List<String> allCategories = ['Work', 'Shopping', 'Other'];

class FilterTaskAlertDialog extends StatefulWidget {
  const FilterTaskAlertDialog({super.key});

  @override
  State<FilterTaskAlertDialog> createState() => _FilterTaskAlertDialogState();
}

class _FilterTaskAlertDialogState extends State<FilterTaskAlertDialog> {
  late FilterModel _filter;

  @override
  void initState() {
    super.initState();
    _filter = Provider.of<FilterProvider>(context, listen: false).filter;
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: const Text('Filter tasks'),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Column(
          children: <Widget>[
            for (String category in allCategories)
              CheckboxListTile(
                title: Text(category),
                value: _filter.isCategorySelected(category),
                onChanged: (value) {
                  setState(() {
                    _filter.toggleCategory(category);
                  });
                },
              ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
          ),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<FilterProvider>(context, listen: false)
                .updateFilter(_filter);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Text(
            'Apply',
            style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
        
      ],
    );
  }
}
