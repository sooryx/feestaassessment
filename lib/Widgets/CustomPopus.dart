
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

customSuccessToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    title: Text(message),
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: const Duration(seconds: 2),
    style: ToastificationStyle.minimal,
    alignment: Alignment.bottomCenter,
    type: ToastificationType.success,
    showProgressBar: true,
    borderRadius: BorderRadius.circular(30),
    margin: const EdgeInsets.symmetric(horizontal: 50),
    dragToClose: true,
    closeButtonShowType: CloseButtonShowType.always,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

customErrorToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    applyBlurEffect: false,
    title: Text(message),
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: const Duration(seconds: 2),
    style: ToastificationStyle.minimal,
    alignment: Alignment.bottomCenter,
    type: ToastificationType.error,
    showProgressBar: true,
    borderRadius: BorderRadius.circular(30.r),
    margin: EdgeInsets.symmetric(horizontal: 50.w),
    dragToClose: true,
    closeButtonShowType: CloseButtonShowType.always,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

customRandomToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    title: Text(message),
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: const Duration(seconds: 2),
    style: ToastificationStyle.minimal,
    alignment: Alignment.bottomCenter,
    type: ToastificationType.info,
    showProgressBar: true,
    borderRadius: BorderRadius.circular(30.r),
    margin: EdgeInsets.symmetric(horizontal: 50.w),
    dragToClose: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

customSnackBar(String text,TextStyle? textstyle) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,closeIconColor: Colors.red,
    dismissDirection: DismissDirection.down,
    backgroundColor: Colors.grey.withOpacity(0.2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
    content: Text(text,style: textstyle,),
  );
}







