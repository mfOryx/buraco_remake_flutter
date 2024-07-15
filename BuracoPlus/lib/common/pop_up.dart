import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class PopUps {



  // Shows the popUp by taking the four arguments
  // - title : the title of the popup
  // - message : the message of the popup
  // - autocloseDuration : [Optional parameter if set to 0 the popup will remain shown unless clicked on ok Button otherwise will wait for given seconds and dismiss]
  // - onPressed : [optional] the function to be executed upon clicking ok button

 //**************** EXAMPLE USAGE ***************************************
  // PopUps.popUpWarningWithButton("Connection", "Connected sucessfully!",
  //     autocloseDuration: 5,onPressed: ()=>{
  //   print("custom on pressed")
  //     });

  static void popUpSucessWithButton(
    String title,
    String message, {
    int autocloseDuration = 0,
    void Function()? onPressed,
  }) {
    toastification.showCustom(
      autoCloseDuration: Duration(seconds: autocloseDuration),
      alignment: Alignment.topCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: const Color(0xFFBCFFA5),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

                children: [
                  const Icon(Icons.check_circle_outline_outlined,color: Color(
                      0xFF1F7900)),
                  Text(title,
                      style: const TextStyle(
                          color: Color(0xFF145600), fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Text(message, style: const TextStyle(color: Color(0xFF1F7900))),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (onPressed != null) {
                        onPressed();
                        toastification.dismiss(holder);
                      }
                    },
                    child: const Text('ok'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void popUpErorWithButton(
      String title,
      String message, {
        int autocloseDuration = 0,
        void Function()? onPressed,
      }) {
    toastification.showCustom(
      autoCloseDuration: Duration(seconds: autocloseDuration),
      alignment: Alignment.topCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: const Color(0xF5FF8484),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

                children: [
                  const Icon(Icons.error_outline_sharp,color: Color(0xFF8F0028)),
                  Text(title,
                      style: const TextStyle(
                          color: Color(0xFF830023), fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Text(message, style: const TextStyle(color: Color(0xFFD50033))),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (onPressed != null) {
                        onPressed();
                        toastification.dismiss(holder);
                      }
                    },
                    child: const Text('ok'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void popUpWarningWithButton(
      String title,
      String message, {
        int autocloseDuration = 0,
        void Function()? onPressed,
      }) {
    toastification.showCustom(
      autoCloseDuration: Duration(seconds: autocloseDuration),
      alignment: Alignment.topCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: const Color(0xF0FFF4C8),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

                children: [
                  const Icon(Icons.warning_amber_rounded,color: Color(0xFFFFAE41)),
                  Text(title,
                      style: const TextStyle(
                          color: Color(0xFF985400), fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Text(message, style: const TextStyle(color: Color(0xFFC97200))),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (onPressed != null) {
                        onPressed();
                        toastification.dismiss(holder);
                      }
                    },
                    child: const Text('ok'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

    static void popUpSimpleSucess(
        String title,
        String message, {
          int autocloseDuration = 4,}
        ){

      toastification.show(

        type: ToastificationType.success,
        style: ToastificationStyle.flatColored,
        title: Text(title),
        description: Text(message),
        alignment: Alignment.topCenter,
        autoCloseDuration:  Duration(seconds: autocloseDuration),
        borderRadius: BorderRadius.circular(4.0),
      );

    }

  static void popUpSimpleWarning(
      String title,
      String message, {
        int autocloseDuration = 4,}
      ){

    toastification.show(

      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration:  Duration(seconds: autocloseDuration),
      borderRadius: BorderRadius.circular(4.0),
    );

  }

  static void popUpSimpleError(
      String title,
      String message, {
        int autocloseDuration = 4,}
      ){
    toastification.show(

      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration:  Duration(seconds: autocloseDuration),
      borderRadius: BorderRadius.circular(4.0),
    );

  }


//Example code of showing the toast of 3 different types with the parameters

// PopUps.popUpWarningWithButton("Connection", "Connected sucessfully!",
//     autocloseDuration: 5,onPressed: ()=>{
//   print("custom on pressed")
//     });
// PopUps.popUpErorWithButton("Connection", "Connected sucessfully!",
//     autocloseDuration: 5,onPressed: ()=>{
//       print("custom on pressed")
//     });
// PopUps.popUpSucessWithButton("Connection", "Connected sucessfully!",
//     autocloseDuration: 5,onPressed: ()=>{
//       print("custom on pressed")
//     });
}
