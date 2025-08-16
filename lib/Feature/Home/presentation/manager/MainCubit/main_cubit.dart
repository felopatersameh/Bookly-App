import 'dart:async';
import 'package:bookly/Core/Utils/Entities/book_entities.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/network/api_keys.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  static MainCubit get(context) => BlocProvider.of(context);
  final Connectivity _connectivity;
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  MainCubit(this._connectivity) : super(ConnectivityLoading()) {
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      if (results.isEmpty || results.contains(ConnectivityResult.none)) {
        emit(ConnectivityDisconnected());
      } else {
        emit(ConnectivityConnected());
      }
    });
  }
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  List<BookEntities> listOfBookMaps = [];
  int listOfBookMapsLen = 0;
  int totalPrice = 0;
  void addBookMap(BookEntities bookMap) {
    emit(AddLoading());
    if (!listOfBookMaps.contains(bookMap)) {
      listOfBookMaps.add(bookMap);
      listOfBookMapsLen = listOfBookMaps.length;
      totalPrice =
          totalPrice +
          (bookMap.saleInfo!.listPrice!.amount!.round() / ApiKeys.dolorToday)
              .round();
      emit(AddSuccessful());
    } else {
      emit(AddError());
    }
  }

  void removeBookMap(BookEntities bookMap, int index) {
    emit(RemoveLoading());
    if (listOfBookMaps.contains(bookMap)) {
      listOfBookMaps.removeAt(index);
      listOfBookMapsLen = listOfBookMaps.length;
      totalPrice =
          totalPrice -
          (bookMap.saleInfo!.listPrice!.amount!.round() / ApiKeys.dolorToday)
              .round();
      emit(RemoveSuccessful());
    }
  }
}
