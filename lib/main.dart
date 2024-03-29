import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade400,
        appBar: AppBar(
          title: Text('caishaizi',style: TextStyle(fontSize: 53.0,color: Colors.black38),),
          backgroundColor: Colors.blue,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var diceleft = 1, diceright = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('shengchanwuliao/caishaizi/wenjian/dice$diceleft.png'),
              onPressed: _buttonClick,
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('shengchanwuliao/caishaizi/wenjian/dice$diceright.png'),
              onPressed: _buttonClick,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AudioCache audioPlayer = AudioCache();
    audioPlayer.loop('backgroundAudio.mp3');

    print('播放背景音乐成功');
  }

  void _buttonClick() {
    print('button click');
    AudioCache audioPlayer1 = AudioCache();
    audioPlayer1.play('throwdice.mp3');
    print('播放音乐成功');

    setState(() {
      this.diceleft = Random().nextInt(6) + 1;
      this.diceright = Random().nextInt(6) + 1;
    });
    print('左侧骰子是：$diceleft，右侧骰子是：$diceright');
  }
}
