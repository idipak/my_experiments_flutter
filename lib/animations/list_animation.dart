import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({Key? key}) : super(key: key);

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  List<int> _items = List.generate(5, (index) => index);

  insert(){
    print("Item Insert");
   _items.insert(0, _items.length+1);
   _listKey.currentState!.insertItem(0, duration: Duration(milliseconds: 500));
   setState(() {});
   print(_items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List"),
      actions: [
        IconButton(onPressed: insert, icon: const Icon(Icons.add))
      ],),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (BuildContext context, int index, Animation<double> animation){
          return  ScaleTransition(
            scale: animation,
            child: Card(
              child: SizedBox(height: 60, child: Center(child: Text("$index"),),),
            ),
          );
        },
      ),
    );
  }
}
