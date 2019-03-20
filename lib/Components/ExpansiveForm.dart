import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'FormInput.dart';

class ExpansiveFormState extends State<ExpansiveForm> {
  final String _title;
  final Color _fontColor;
  final Icon _trailing;
  final List<DefaultFormInput> _formInputs;

  int appendedFormIndex = 0;

  @override
  ExpansiveFormState(
    this._title,
    this._fontColor,
    this._trailing,
    this._formInputs,
  );

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      // Title
      title: Text(
        _title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 16.0, color: _fontColor, fontWeight: FontWeight.w600),
      ),

      // Trailing icon
      trailing: ClipRRect(
        borderRadius: new BorderRadius.circular(100.0),
        child: Container(
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(5),
          child: _trailing,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              _fontColor,
              _fontColor.withOpacity(.8),
              _fontColor.withOpacity(.7)
            ]),
          ),
        ),
      ),

      children: <Widget>[
        GestureDetector(
          onHorizontalDragEnd: ( horizontalChange ){

            double directionController = horizontalChange.velocity.pixelsPerSecond.dx;

            if( directionController > 0 ) _formForward();
            if( directionController < 0 ) _formBackward();



          },
          child: SafeArea(
            child: Container(
            height: 180,
            width: 500,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: _formInputs[appendedFormIndex],
                ),
                Center(
                  heightFactor: 2,
                  child: RaisedButton(
                    padding: EdgeInsets.only(top: 7, bottom: 7),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    color: _fontColor,
                    onPressed: (){ return null; }, // TO-DO: Check missing info and redirect to those text fields.
                  ),
                ),
              ],
            ),
          )),
        )
      ],
    );
  }

  _formForward() {
    setState(() {
      if (appendedFormIndex >= (_formInputs.length - 1)) {
        appendedFormIndex = 0;
        return;
      }
      appendedFormIndex++;
    });
  }

  _formBackward() {
    setState(() {
      if (appendedFormIndex <= 0) {
        appendedFormIndex = _formInputs.length - 1;
        return;
      }
      appendedFormIndex--;
    });
  }
}

class ExpansiveForm extends StatefulWidget {
  final String _title;
  final Color _fontColor;
  final Icon _trailing;
  final List<DefaultFormInput> _formInputs;

  ExpansiveForm({
    title,
    fontColor,
    trailing,
    formInputs,
  })  : _title = title,
        _fontColor = fontColor,
        _trailing = trailing,
        _formInputs = formInputs;

  @override
  ExpansiveFormState createState() =>
      new ExpansiveFormState(_title, _fontColor, _trailing, _formInputs);
}
