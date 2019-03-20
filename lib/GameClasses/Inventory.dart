import 'package:rpg_tables/GameClasses/Item.dart';
import 'package:tuple/tuple.dart';

class Inventory {
  var _bag = <Tuple2< Item, int >>[]; // vector of item + index.
  int _size;
  int _lastIndex;

  Inventory( size ){
    _size = size;
    _size.toUnsigned(64);
    _lastIndex = 0;
  }

  aumentarCapacidade( int n ) { _size += n.toUnsigned(64); }
  diminuirCapacidade( int n ) { _size -= (n.toUnsigned(64) * -1 ); }

  addItem( Item item ){ _bag.add( Tuple2( item, _lastIndex ) ); }
}
