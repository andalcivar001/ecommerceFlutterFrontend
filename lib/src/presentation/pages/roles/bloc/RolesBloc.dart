import 'package:ecommerce_flutter/src/presentation/pages/roles/bloc/RolesEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/bloc/RolesState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Rolesbloc extends Bloc<RolesEvent, RolesState> {

RolesBloc(): super(RolesState()){
  on<GetRolesList>(_onGetRolesList);
}

  Future<void> _onGetRolesList(GetRolesList event, Emitter<RolesState> emit){
    
  }

}
