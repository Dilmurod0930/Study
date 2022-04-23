import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/core/widgets/appbar_widget.dart';
import 'package:study/providers/login_provayder.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Sign Up ",
        context: context,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: Lottie.asset('assets/images/signup.json')),
              Form(
                key: context.watch<LoginProvider>().fromKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().phoneController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Phone',
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().passController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Passwor',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.063,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                  color: ColorConst.kButtonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                child: TextButton(
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.kScaffoldColor,
                    ),
                  ),
                  onPressed: () {
                    context.read<LoginProvider>().singUp(context);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign_In', (route) => false);
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: ColorConst.kButtonColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
