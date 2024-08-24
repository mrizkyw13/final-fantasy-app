import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'monsters_event.dart';
part 'monsters_state.dart';

class MonstersBloc extends Bloc<MonstersEvent, MonstersState> {
  MonstersBloc() : super(MonstersInitial()) {
    on<MonstersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
