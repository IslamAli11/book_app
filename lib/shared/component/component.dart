

import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';


defaultTextStyle({
  FontWeight? fontWeight,
  double? fontSize,
  String? fontFamily,
  Color? textColor,
}) => TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: textColor,
    );

navigateAndRemove(BuildContext context, Widget widget) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultOutlineButton({
  required String text,
}) =>
    Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.blue, width: 1)),
      child: OutlinedButton(
          clipBehavior: Clip.antiAlias,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/icons8-google-48 (1).png'),
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 5,
              ),
              LocaleText(text),
            ],
          )),
    );

class DefaultTextButton extends StatelessWidget {
  DefaultTextButton(
      {required this.fontSize,
      required this.color,
      required this.text,
      required this.onPressed,
      required this.height,
      required this.width,
      this.fontWeight,
      required this.textColor,
      required this.radius,
      Key? key})
      : super(key: key);
  String text;
  Function onPressed;
  Color textColor;
  Color color;
  double fontSize;
  FontWeight? fontWeight;
  double width = double.infinity;
  double height = 40;
  double radius = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

class DefaultTextField extends StatelessWidget {
  DefaultTextField(

      {this.keyboard,
      this.prefixIcon,
      this.controller,
      this.validator,
      this.hintText,
        this.obscureText,
        this.suffixIcon,
      Key? key})
      : super(key: key);
  String? hintText;
  String? validator;
  TextEditingController? controller;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboard;
  bool? obscureText ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: keyboard,
      controller: controller,
      validator: (String? value) {
        if (value!.isEmpty) {
          return validator;
        }
      },
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(color: Colors.grey),
        hintText: hintText,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
      ),
    );
  }
}
Widget defaultTextFormField({
  VoidCallback? onTap,
  Function? onPressIcon,
  String? Function(String?)? validate,
  required String? labelText,
  String? hintText,
  required IconData prefixIcon,
  IconData? suffixIcon,
  required TextEditingController controller,
  required TextInputType keyboardType,
  bool obscureText = false,
  Color? borderColor =Colors.grey ,
  Color? prefixIconColor = Colors.black,
  floatingLabelColor = Colors.white,
}) => TextFormField(
      validator: validate,
      onTap: () {
        onTap;
      },
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey[400]),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        floatingLabelStyle: TextStyle(color: floatingLabelColor),
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: () {
            onPressIcon!();
          },
        ),
        prefixIconColor:prefixIconColor ,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),

      ),
    );


navigateTo({
  required Widget widget,
  required BuildContext context,
}) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget));


Widget bookItem({
  required BuildContext context,
  required  data,
}) =>
    InkWell(
      onTap: () {

      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${data['cover']}')),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Text('${data['title']}')
          ],
        ),
      ),
    );




Widget bookBuilder({required List list, required context}) =>
    ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) =>
            bookItem(context: context,data: list[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        itemCount: list.length,
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );