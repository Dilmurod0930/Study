import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/core/constants/radios_const.dart';
import 'package:study/core/widgets/appbar_widget.dart';
import 'package:study/providers/login_provayder.dart';

class PersonAccountScreen extends StatelessWidget {
  const PersonAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Account", context: context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.login_outlined),
        onPressed: () async {
          await context.read<LoginProvider>().userLogOut();
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign_In', (route) => false);
        },
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: RaduisConst.kExtraRaduis,
              backgroundColor: Colors.red,
              backgroundImage: const NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw4HhPbr7Cydwcy_T2U2y11LfadcrPSg6RFA&usqp=CAU',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
