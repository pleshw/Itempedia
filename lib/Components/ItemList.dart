import 'package:flutter/material.dart';
import '../Components/ExpansiveItemList.dart';
import '../Components/ExpansiveForm.dart';
import '../Components/FormInput.dart';
import '../GameClasses/Item.dart';


// Item list app build.
class ItemListState extends State<ItemList> {

  Map<String, Item> _itemMap;

  @override
  ItemListState( this._itemMap );

  @override
  Widget build(BuildContext context) {
    var leadingImage = ExactAssetImage(
        "assets/images/Potion.png"); // icon by https://www.flaticon.com/authors/freepik

    return new Scaffold(
      // Make the header/appbar with a controlled size image on leading
      appBar: AppBar(
        leading: OverflowBox(
          minHeight: 34,
          minWidth: 34,
          child: Image(
            image: leadingImage,
            fit: BoxFit.cover,
            width: 32,
            height: 32,
          ),
        ),
        backgroundColor: Color.fromRGBO(247, 130, 136, .9),
        title: new Text("Itempedia", textAlign: TextAlign.right),
      ),

      body: SafeArea(
          child: Container(
              child: Column(
        children: <Widget>[
          // Make an expanded with
          Expanded(
            child: ListView.builder(
                itemCount: _itemMap.length,
                itemBuilder: (BuildContext context, int index) {
                  var _keys = _itemMap.keys.toList();
                  return _itemRow(_itemMap[_keys[index]]);
                }),
          ),

          ExpansiveForm(
            title: " Add an item ",
            fontColor: Color.fromRGBO(227, 148, 76, 1),
            trailing: Icon(
              Icons.add,
              color: Colors.white,
            ),
            formInputs: <DefaultFormInput>[
              DefaultFormInput(
                labelText: "Name ___",
                labelColor: Colors.orangeAccent,
                margin: EdgeInsets.only(
                  top: 15,
                  left: 50,
                  right: 50,
                ),
              ),
              DefaultFormInput(
                labelText: "Brief {...}",
                labelColor: Colors.orangeAccent,
                margin: EdgeInsets.only(
                  top: 15,
                  left: 50,
                  right: 50,
                ),
              ),
              DefaultFormInput(
                labelText: "Price \$\$",
                labelColor: Colors.orangeAccent,
                margin: EdgeInsets.only(
                  top: 15,
                  left: 50,
                  right: 50,
                ),
              ),
            ],
          ),
        ],
      ))),
    );
  }

  //
  //  _addItem( String name, String brief, {double price = 0, String imgUrl } ) {
  //    catalogItem( makeItem( name, brief, price: price, imgUrl: imgUrl) );
  //    print( catalog );
  //  }

  // Build and that shows the item info on tap.
  Widget _itemRow(Item item) {
    return ExpansiveListItem(
      item.name(),
      item.brief(),
      item.price(),
      imgUrl: item.image(),
    );
  }
}

class ItemList extends StatefulWidget {
  final Map<String, Item> catalog;
  ItemList( this.catalog );

  @override
  ItemListState createState() => new ItemListState( catalog );
}
