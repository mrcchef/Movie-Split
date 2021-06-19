import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/route_constants.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_movie/presentation/journeys/login/label_field_widget.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';
import 'package:flutter_movie/presentation/widgets/button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool isEnabledLogin = false;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    usernameController.addListener(() {
      setState(() {
        isEnabledLogin = usernameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      });
    });

    passwordController.addListener(() {
      setState(() {
        isEnabledLogin = usernameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    usernameController?.dispose();
    passwordController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.dimen_20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_18),
              child: Text(
                'Login to Movie App via TMDP',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_24),
              child: LabelFieldWidget(
                title: 'USERNAME',
                controller: usernameController,
                hintText: 'Enter your usrname',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_24),
              child: LabelFieldWidget(
                title: 'PASSWORD',
                controller: passwordController,
                hintText: 'Enter your password',
                isPasswordField: true,
              ),
            ),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              buildWhen: (previous, current) => current is AuthenticationError,
              builder: (context, state) {
                if (state is AuthenticationError) {
                  print('BlocCosumer');
                  return Text(
                    state.message,
                    style: Theme.of(context).textTheme.orangeSubtitle2,
                  );
                }
                print('BlocCosumer1');
                return const SizedBox.shrink();
              },
              listenWhen: (previous, current) => current is LoginSuccess,
              listener: (context, state) {
                print('BlocCosumer');
                if (state is LoginSuccess)
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteConstants.homeScreen, (route) => false);
              },
            ),
            Button(
              buttonText: 'Login',
              onPressed: isEnabledLogin
                  ? () {
                      print(usernameController.text);
                      print(passwordController.text);

                      BlocProvider.of<AuthenticationBloc>(context).add(
                        LoginInitiateEvent(
                          password: passwordController.text,
                          username: usernameController.text,
                        ),
                      );
                    }
                  : null,
              isEnabled: isEnabledLogin,
            ),
          ],
        ),
      ),
    );
  }
}
