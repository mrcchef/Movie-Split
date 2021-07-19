import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'loading_event.dart';
// part 'loading_state.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);

  void showLoading() => emit(true);

  void endLoading() => emit(false);

  // @override
  // Stream<LoadingState> mapEventToState(
  //   LoadingEvent event,
  // ) async* {
  //   if (event is LoadingStartEvent) {
  //     print("yielded LoadingStartState");
  //     yield LoadingStartState();
  //   } else if (event is LoadingEndEvent) {
  //     print("yielded LoadingEndState");
  //     yield LoadingEndState();
  //   }
  // }
}
