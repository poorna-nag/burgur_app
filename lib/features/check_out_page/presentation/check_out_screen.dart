import 'package:burget_app_ui/features/check_out_page/presentation/bloc/check_out_bloc.dart';
import 'package:burget_app_ui/features/check_out_page/presentation/bloc/check_out_event.dart';
import 'package:burget_app_ui/features/check_out_page/presentation/bloc/check_out_state.dart';
import 'package:burget_app_ui/features/home/presentation/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  void initState() {
    super.initState();

    context.read<CheckOutBloc>().add(LoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CheckOutBloc, CheckOutState>(
        builder: (context, state) {
          if (state is Loading) {
            return LoadingStateView();
          } else if (state is Loaded) {
            return LoadedStateView();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class LoadingStateView extends StatefulWidget {
  const LoadingStateView({super.key});

  @override
  State<LoadingStateView> createState() => _LoadingStateViewState();
}

class _LoadingStateViewState extends State<LoadingStateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 128, 89),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/images/lottie_ani.json"),
                Text(
                  "Your Payment is Done",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadedStateView extends StatefulWidget {
  const LoadedStateView({super.key});

  @override
  State<LoadedStateView> createState() => _LoadedStateViewState();
}

class _LoadedStateViewState extends State<LoadedStateView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset("assets/images/delivery_guy.json"),
        SizedBox(height: 10),
        Text(
          "We Will Reach You Soon",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Text(
          " Do You want Order More..",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // context.read<HomeBloc>().add(MoveToHomeEvent());
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Text(
            "See More Here",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
