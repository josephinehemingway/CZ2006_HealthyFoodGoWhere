import 'package:flutter/material.dart';
import 'package:flutter_app/boundary/screens/Profile/EditPreferencesUI.dart';
import '../../entity/Database.dart';

/// The boundary class for a simple custom Checkbox.
///
/// Used in [EditPreferences].
class customCheckBox extends StatefulWidget {

  /// Class constructor for [customCheckBox].
  const customCheckBox({
    Key key,
    @required this.title,
    @required this.list,
}) : super(key: key);

  /// Parameter for [customCheckBox].
  ///
  /// [title] is the title of the checkbox.
  final String title;

  /// Parameter for [customCheckBox].
  ///
  /// [list] is the list of selected items.
  final List list;

  @override
  _customCheckBoxState createState() => _customCheckBoxState(this.title, this.list);
}

/// This class manages the state of [customCheckBox].
///
/// Includes logic and implementation of [customCheckBox].
class _customCheckBoxState extends State<customCheckBox> {

  /// Initial value of [customCheckBox] set as ['false'].
  ///
  /// Returns ['true'] if [customCheckBox] is selected, ['false'] if not selected.
  bool checkedValue = false;

  /// Title of [customCheckBox].
  String title;

  /// List of selected items from all [customCheckBox]es.
  List list;

  /// State of the [customCheckBox].
  ///
  /// Returns ['true'] if [customCheckBox] is selected, ['false'] if not selected.
  bool isSelected;

  /// Constructor of [customCheckBox].
  _customCheckBoxState(this.title, this.list);

  /// Widget build method to implement [customCheckBox].
  @override
  Widget build(BuildContext context) {

    // To check if the checkbox is selected previously.
    //
    // If the list contains the title of the checkbox, initialise the checkbox as 'selected'.
    // Else, checkbox remains 'unselected'.
    if (this.list.contains(this.title)){
      isSelected = true;
      checkedValue = true;
    }
    else{
      isSelected = false;
      checkedValue = false;
    }

    return CheckboxListTile(
      title: Text(widget.title, style: TextStyle(fontSize: 20,)),
      activeColor: Colors.teal[300],
      value: checkedValue,
      selected: isSelected,
      onChanged: (newValue) {
        setState(() {
          checkedValue = newValue;
          if (checkedValue){
            list.add(title);
          }
          else{
            list.remove(title);
          }
          Database.createPreferences(list);
          print(list);
        });
      },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
    );
  }
}
