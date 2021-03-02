import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_shop_firebase/src/features/auth/domain/entities/user.dart';
import 'package:flutter_test_shop_firebase/src/features/auth/logic/auth_provider.dart';

///SignInPage
class SignInPage extends StatelessWidget {
  ///SignInPage constructor
  const SignInPage({Key key}) : super(key: key);

  ///SignInPage [routeName]
  static const routeName = 'SignInPage';

  ///Router for SignInPage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignInPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test LogIn'),
      ),
      body: _BodyConsumer(),
    );
  }
}

class _BodyConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(authNotifierProvider.state);

    return Center(
      child: state.when(
        initial: () => _Form(),
        loading: () => CircularProgressIndicator(),
        authenticated: (user) => _Authenticated(user: user),
        unauthenticated: () => _Form(),
      ),
    );
  }
}

class _Form extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Enter email',
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Enter password',
            ),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.lightBlue,
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              context.read(authNotifierProvider).singIn(
                    email: emailController.value.text,
                    password: passwordController.value.text,
                  );
            },
          )
        ],
      ),
    );
  }
}

class _Authenticated extends StatelessWidget {
  const _Authenticated({
    Key key,
    this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(user.id),
        Text(user.email),
        RaisedButton(
          color: Colors.lightBlue,
          child: Text(
            'SingOut',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            context.read(authNotifierProvider).signOut();
          },
        )
      ],
    );
  }
}
