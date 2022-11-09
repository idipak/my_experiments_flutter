import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_experiments/rive/bot_animation.dart';
import 'package:rive/math.dart';
import 'package:rive/rive.dart';

class RiveAnim extends StatefulWidget {
  static const route = "/rive-animation";
  const RiveAnim({Key? key}) : super(key: key);

  @override
  State<RiveAnim> createState() => _RiveAnimState();
}

class _RiveAnimState extends State<RiveAnim> {

  SMIInput<bool>? _play;
  Artboard? _actorArtboard;


  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/oni.riv').then((data){
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(artboard, "State Machine 1");

      Future.delayed(const Duration(seconds: 2)).then((_){
        _moveActor(artboard);
      });

      if(controller != null){
        artboard.addController(controller);
        _play = controller.findInput("thunderGodMode");
      }

      setState(() {
        _actorArtboard = artboard;
      });

    });

  }

  // mainHeadControl

  void _moveActor(Artboard artboard){
    // print("Move start");
    var controller2 = StateMachineController.fromArtboard(artboard, "mainHeadControl");

    artboard.x = 400;
    setState(() {

    });

    if(controller2 != null){
      print("Move");
      setState(() {
        controller2.pointerDown(Vec2D.fromValues(30, 50));
      });
    }
  }

  void _scream(){
    // debugPrint("${_play?.value} ---- ${_play?.controller.isActive}");

    if(_play?.value == false){
      _play?.value = true;
    }else{
      _play?.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rive Animation"),),
      body: Center(
        child: _actorArtboard == null
            ? const SizedBox()
            :  GestureDetector(
            onTap: _scream,
            child: Rive(artboard: _actorArtboard!,)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) => const BotAnimation()));
        },
        child: const Text("Next"),
      ),
    );
  }
}
