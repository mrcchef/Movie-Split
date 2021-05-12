import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/presentation/journeys/login/login_form.dart';
import 'package:flutter_movie/presentation/widgets/movie_logo.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: Sizes.dimen_40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: Sizes.dimen_40),
            child: MovieLogo(height: Sizes.dimen_48),
          ),
          LoginForm(),
        ],
      ),
    );
  }
}
