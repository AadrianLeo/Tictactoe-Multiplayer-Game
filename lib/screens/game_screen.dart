import 'package:flutter/material.dart';
import 'package:mp_tictactoe/provider/room_data_provider.dart';
import 'package:mp_tictactoe/resources/socket_methods.dart';
import 'package:mp_tictactoe/views/scoreboard.dart';
import 'package:mp_tictactoe/views/tictactoe_board.dart';
import 'package:mp_tictactoe/views/waiting_lobby.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    print(Provider.of<RoomDataProvider>(context).player1.nickname);
    print(Provider.of<RoomDataProvider>(context).player2.nickname);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Scoreboard(),
                const TocTacToeBoard(),
                Text('${roomDataProvider.roomData['turn']['nickname']}\'s turn'),
              ],
            ),
          ),
    );
  }
}
