import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_drive/controller/cubit/Auth/signin/states.dart';

class DriverLoginCubit extends Cubit<DriveLoginStates> {
  DriverLoginCubit() : super(IntialDriveLoginStates());

  static DriverLoginCubit get(context) => BlocProvider.of(context);
  int? gustID;

  void gustFlowCheck() {
    // ignore: avoid_print
    print(gustID);
    if (gustID == 1) {
      emit(GuestFlowStateSuccuss());
    } else {
      emit(GuestFlowStateError());
    }
  }
}
