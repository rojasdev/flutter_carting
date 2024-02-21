import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

// ignore: must_be_immutable
class ButtonPage extends StatelessWidget {
  ButtonPage({super.key});
  //final controller = GroupButtonController();
  final buttons = ['10:00', '11:00', '12:00'];
  final List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: GroupButton(
          isRadio: true, // change to false if acts like checkbox
          //onSelected: ,// add action here
          buttons: [
            "12:00",
            "13:00",
            "14:30",
            "18:00",
            "19:00",
            "21:40",
            "22:00",
            "23:30"
          ],
        ),
      ),
    );
  }
}
