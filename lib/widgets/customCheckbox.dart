import 'package:flutter/material.dart';
import '../User.dart';

class customCheckBox extends StatefulWidget {
  const customCheckBox({
    Key key,
    @required this.title,
    @required this.list,
}) : super(key: key);

  final String title;
  final List list;

  @override
  _customCheckBoxState createState() => _customCheckBoxState(this.title, this.list);
}

class _customCheckBoxState extends State<customCheckBox> {
  bool checkedValue = false;

  String title;
  List list;

  _customCheckBoxState(this.title, this.list);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title, style: TextStyle(fontSize: 20,)),
      activeColor: Colors.teal[300],
      value: checkedValue,
      onChanged: (newValue) {
        setState(() {
          checkedValue = newValue;
          if (checkedValue){
            list.add(title);

          }
          else{
            list.remove(title);
          }
          print(list);
        });
      },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
    );
  }
}
