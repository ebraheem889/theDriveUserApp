// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriveStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, DriveStates state) {
        DriverCubit getData = DriverCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text("here"),
          ),
        );
      },
    );
  }
}
