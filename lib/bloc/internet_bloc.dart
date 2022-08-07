import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_bloc_p_2/bloc/internet_event.dart';
import 'package:use_bloc_p_2/bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
   Connectivity connectivity = Connectivity();
    StreamSubscription? streamSubscription;
  InternetBloc() : super(InternetInitial()) {
   

    on<InternetLost>((event, emit) => emit(InternetLossState()));
    on<InternetGain>((event, emit) => emit(InternetGainState()));
    streamSubscription = connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGain());
      } else {
        add(InternetLost());
      }
    });
    
  }
  @override
  Future<void> close() {
  streamSubscription?.cancel();
    return super.close();
  }
}
