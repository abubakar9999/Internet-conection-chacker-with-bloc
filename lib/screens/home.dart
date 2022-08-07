import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/internet_bloc.dart';
import '../bloc/internet_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
           if(state is InternetGainState){
            return Text("Conected !");
           }
           else if(state is InternetLossState){
            return Text("NO Internet Conection");
           }
           else{
            return Text("Loadding...");
           }
          },
        ),
      ),
    ));
  }
}
