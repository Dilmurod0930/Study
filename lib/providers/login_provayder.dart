import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/core/widgets/snak_bar_widget.dart';
import 'package:study/service/firebase/firbase_service.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  Future singIn(BuildContext context) async {
    try {
      if (fromKey.currentState!.validate()) {
        await FireService.auth.signInWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => true);
      } else {
        SnakBarWidget.mymessger(context, 'Fill all fields', Colors.red);
      }
    } catch (e) {
      SnakBarWidget.mymessger(
          context, 'Error while sign in $e ', ColorConst.kSnakBarColor);
      print('1)ERROR--->' + e.toString());
    }
  }

  Future singUp(BuildContext context) async {
    try {
      if (fromKey.currentState!.validate()) {
        await FireService.auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        await FireService.store
            .collection('users')
            .doc(emailController.text)
            .set({
          "name": nameController.text,
          "email": emailController.text,
          "password": passController.text,
          "phone_number": phoneController.text,
          "cireate_at": FieldValue.serverTimestamp(),
        });
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        SnakBarWidget.mymessger(context, 'Fill all fields', Colors.red);
      }
    } catch (e) {
      SnakBarWidget.mymessger(context, 'Tizimga kirishda hatolik yuz berdi',
          ColorConst.kSnakBarColor);
      print('2)ERROR--->' + e.toString());
    }
  }

  Future signOut(BuildContext context) async {
    try {
      await FireService.auth.signOut();
      Navigator.pushNamedAndRemoveUntil(context, '/sign_In', (route) => false);
    } catch (e) {
      SnakBarWidget.mymessger(
          context, "Siz tizimdan chiqib ketinggiz ", ColorConst.kSnakBarColor);
    }
  }

    userLogOut() {
    FireService.auth.signOut();
    notifyListeners();
  }
}
/* Future signIn(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        await FireService.auth.signInWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => true);
      } else {
        MyMessanger.messanger(context, 'Fill all fields', Colors.red);
      }
    } catch (e) {
      debugPrint(e.toString());
      MyMessanger.messanger(context, 'Error while sign in: $e', Colors.red);
    }
  }

  Future signUp(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        await FireService.auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        var location = await GetLocation.determinePosition();
        var address = await Geocoder.local.findAddressesFromCoordinates(
            Coordinates(location.latitude, location.longitude));
        await FireService.store
            .collection('users')
            .doc(emailController.text)
            .set({
          "name": nameController.text,
          "email": emailController.text,
          "password": passController.text,
          "phone_number": phoneNumController.text,
          "cireate_at": FieldValue.serverTimestamp(),
          "location": address[0].addressLine,
          "orders": [{}],
          "history_orders": [],
        });
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign_up_interest', (route) => false);
      } else {
        MyMessanger.messanger(context, 'Fill all fields', Colors.red);
      }
    } catch (e) {
      MyMessanger.messanger(context, 'Error while sign up: $e', Colors.red);
    }
  } */