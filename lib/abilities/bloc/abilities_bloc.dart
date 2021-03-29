import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'abilities_event.dart';
part 'abilities_state.dart';

class AbilitiesBloc extends Bloc<AbilitiesEvent, AbilitiesState> {
  AbilitiesBloc() : super(AbilitiesInitial());

  @override
  Stream<AbilitiesState> mapEventToState(
    AbilitiesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

enum Stat {
  strength,
  agility,
  wisdom,
  charisma,
}
