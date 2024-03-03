
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/internet_bloc/internet_event.dart';
import 'package:bloc_demo/bloc/internet_bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{

  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivtySubsciption;
  InternetBloc() : super(InternetInitialState())
  {
    on<InternetLostEvent>((event,emit)=> emit(InternetLostState()));
    on<InternetGainedEvent>((event,emit)=> emit(InternetGainedState()));

    _connectivtySubsciption=    _connectivity.onConnectivityChanged.listen((result) {

      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi)
        {
          add(InternetGainedEvent());
        }
      else{
        add(InternetLostEvent());
      }
    });
  }


  @override
  Future<void> close() {
    _connectivtySubsciption?.cancel();
    return super.close();
  }
}