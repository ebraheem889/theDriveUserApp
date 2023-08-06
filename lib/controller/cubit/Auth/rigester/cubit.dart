// ignore_for_file: avoid_print, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_drive/controller/cubit/Auth/rigester/states.dart';
import 'package:the_drive/controller/services/helpers/dioHelper.dart';

class DriverRigestrationCubit extends Cubit<DriveAuthRigesterationStates> {
  DriverRigestrationCubit() : super(IntialDriveAuthRigesterationStates());

  static DriverRigestrationCubit get(context) => BlocProvider.of(context);
  int? gustID;
  String verificationID = "";
  String smsOTP = '222222';

//CHECK IF GUST OR NOT
  void gustFlowCheck() {
    // ignore: avoid_print
    print(gustID);
    if (gustID == 1) {
      emit(GuestFlowStateSuccuss());
    } else {
      emit(GuestFlowStateError());
    }
  }

//signup auth with phone number
  void rigesteration(
    String phoneNumber,
  ) async {
    emit(RigestrationStateLoading());
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 70),
        codeAutoRetrievalTimeout: (String verificationId) {
          // print("phoneNumber========================>#{phoneNumber}");
          // print("verificationId =============> ${verificationId}");
          // verificationId = verificationID!;
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          verificationID = verificationId;
          // Create a PhoneAuthCredential with the code
          // PhoneAuthCredential credential =
          //     PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsOTP);
          // signInWithCredential(verificationId: verificationId, smsCode: smsCode);
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          emit(RigestrationStateSuccuss());
          // ignore: avoid_print
          print("phoneAuthCredential=>>>>>>>>>>>>>>>>>>>>>$phoneAuthCredential");
        },
        verificationFailed: (FirebaseAuthException error) {
          emit(RigestrationStateError());
          // ignore: avoid_print
          print("errrrrrrrrrror=>>>>>>>>>>>>>>>>>>>>>$error");
        });
  }

// //validations
  Future<bool> signInWithCredential({required String smsCode}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: smsCode);
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(RigestrationStateSuccuss());
      return true;
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print("signInWithCredential error $e");
      return false;
    }
  }

  //// Auth data TO API
  void getLogin(
      {required String? email, required String? password, required String? name, required String? phone}) async {
    // emit(ShopAppLoadingRigesterStates());
    DioHelper.postDataAPI(
      url: "login",
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    ).then((value) {
      // print("2");
      // GetLogin = ShopLoginModel.fromjson(value.data);
      // print("3");
      // emit(ShopAppScuccessRigesterStates(GetLogin!));
      // print(GetLogin!.data!.token);
      // print("4");
    }).catchError((e) {
      print(e);
      emit(state);
    });
  }
}
