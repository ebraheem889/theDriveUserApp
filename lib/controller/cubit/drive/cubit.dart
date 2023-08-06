import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/services/faweryHelper.dart';

class DriverCubit extends Cubit<DriveStates> {
  DriverCubit() : super(IntialDriveStates());

  static DriverCubit get(context) => BlocProvider.of(context);
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

  void faweryPayment() {
    emit(PaymentStateLoading());
    payWithFawry(
      billItemId: '1',
      billDescription: 'bill test',
      billPrice: 20.0,
      billQuantity: 2,
      customerEmail: 'test@test.com',
      customerMobile: '010000000000',
      customerName: 'the drive',
      merchantRefNum: 'f5dead49-4512-46c3-b3de-a072a6179233',
    ).then((value) {
      if (value == true) {
        emit(PaymentStateSuccuss());
      } else {
        emit(PaymentStateError());
      }
    });
  }
}
