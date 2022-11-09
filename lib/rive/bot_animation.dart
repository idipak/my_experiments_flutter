import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class BotAnimation extends StatefulWidget {
  const BotAnimation({Key? key}) : super(key: key);

  @override
  State<BotAnimation> createState() => _BotAnimationState();
}

class _BotAnimationState extends State<BotAnimation> {

  Artboard? _actorArtboard;
  SMIInput<bool>? _play;
  
  @override
  void initState() {
    super.initState();
    

    
  }

  _loadArt(){
    rootBundle.load("assets/bot.riv").then((data){
      final file = RiveFile.import(data);
      final artBoard = file.mainArtboard;
      print(artBoard.animations);

      var controller = StateMachineController.fromArtboard(artBoard, "State Machine 1");

      if(controller != null){
        artBoard.addController(controller);
        _play = controller.findInput("isLimited");
      }

      setState(() {
        _actorArtboard = artBoard;
      });

    });
  }

  void _startAnim(){
    if(_play?.value == false){
      _play?.value = true;
    }else{
      _play?.value = false;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _actorArtboard != null
            ? GestureDetector(
            onTap: _startAnim,
            child: Rive(artboard: _actorArtboard!,))
            : const SizedBox(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadArt,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
