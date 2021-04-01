import 'package:flutter/material.dart';
import 'package:flutter_app/boundary/screens/Profile/EditPreferencesUI.dart';
import '../../entity/CurrentUser.dart';
import '../../Database.dart';

class customCheckBox extends StatefulWidget {
  const customCheckBox({
    Key key,
    @required this.title,
    @required this.list,
    // this.user
}) : super(key: key);

  final String title;
  final List list;
  // final User user;

  @override
  _customCheckBoxState createState() => _customCheckBoxState(this.title, this.list);
}

class _customCheckBoxState extends State<customCheckBox> {
  bool checkedValue = false;

  String title;
  List list;
  bool isSelected;

  _customCheckBoxState(this.title, this.list);

  @override
  Widget build(BuildContext context) {
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
