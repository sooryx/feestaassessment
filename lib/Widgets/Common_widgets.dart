import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonWidgets {
  static Widget goldButton({
    required Widget child
}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.yellow, Color(0xffad9c00),Colors.yellow, Color(0xffad9c00)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(child: child),
    );  }

  static Widget gradientButton(
      {required double radius,
      required double padding,
      required VoidCallback? onPress,
      required String text,
      required BuildContext context}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF000046),
                    Color(0xFF1CB5E0),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(padding),
              backgroundColor: Colors.transparent,
            ),
            onPressed: onPress,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.surface),
            ),
          )
        ],
      ),
    );
  }

  static Widget gradientBorderPainter({
    required Widget child,
    double strokeWidth = 2.0,
    required Gradient gradient,
  }) {
    return CustomPaint(
      painter:
          _GradientBorderPainter(strokeWidth: strokeWidth, gradient: gradient),
      child: child,
    );
  }

  static Widget gradientTextField({
    String? labelText,
    String? hintText,
    required TextEditingController controller,
    IconButton? sicon,
    IconButton? picon,
    List<TextInputFormatter>? inputFormatter,
    TextInputType? type,
    Validator? validator,
    void Function(String)? onChanged,
  }) {
    return _GradientTextField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      sicon: sicon,
      picon: picon,
      inputFormatter: inputFormatter,
      type: type,
      validator: validator,
      onChanged: onChanged,
    );
  }

  static Widget CustomDivider({
    required double start,
    required double end,
    required double thickness,
    required Color color,
  }) {
    return Container(
      height: 1,
      width: double.infinity,
// Make the container width match the parent's width
// margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white.withOpacity(0),
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0), // Transparent color at end
          ],
        ),
      ),

      child: Divider(
        thickness: thickness,
        color: Colors.transparent, // Set transparent color
        indent: start.w,
        endIndent: end.w,
// Define gradient for fading effect
      ),
    );
  }

  static Widget CustomNeumorphism({
    required Widget child,
    required EdgeInsets padding,
  }) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  color: Colors.grey[900]!,
                  blurRadius: 8,
                  offset: const Offset(5, 5)),
              BoxShadow(
                  spreadRadius: 1,
                  color: Colors.grey[800]!,
                  blurRadius: 8,
                  offset: const Offset(-5, -5))
            ]),
        child: child);
  }

  static Widget CustomTextField({
    int? maxLength,
    required BuildContext   context,
    int? maxLines,
    required String hintText,
    required bool obscureText,
    TextStyle? hintstyle,
    Icon? icon,
    Icon? picon,
    TextEditingController? controller,
    FocusNode? focusNode,
    required BorderRadius borderRadius,
  }) {
    return TextField(
      textAlign: TextAlign.start,
      style: hintstyle ?? const TextStyle(color: Colors.white),
      maxLength: maxLength,
      maxLines: maxLines,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintstyle ?? const TextStyle(color: Colors.white),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        suffixIcon: icon,
        prefixIcon: picon,
        enabledBorder: OutlineInputBorder(
          borderRadius:borderRadius,
          borderSide:  BorderSide(
              width: 0.5,
              color: Colors.grey
          ),
        ),
        disabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(
            width: 0.5,
            color: Theme.of(context).primaryColor
        ),
      ),
        border: OutlineInputBorder(
          borderRadius: borderRadius ,
          borderSide:  BorderSide(
            width: 0.5,
            color: Theme.of(context).primaryColor
          ),
        ),
      ),
      obscureText: obscureText,
    );
  }

  static Widget roundButton({
    required Function onTap,
    required Icon icon,
  }) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        shape: WidgetStateProperty.all(
          CircleBorder(
            side: BorderSide(
              color: const Color(0xFF1CB5E0),
              width: 2.w,
            ),
          ),
        ),
        shadowColor: WidgetStateProperty.all(const Color(0xFF1CB5E0)),
        elevation: WidgetStateProperty.all(0.5),
      ),
      child: Center(
        child: Padding(padding: EdgeInsets.all(8.dg), child: icon),
      ),
    );
  }
}

class _GradientTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final IconButton? sicon;
  final IconButton? picon;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? type;
  final Validator? validator;
  final void Function(String)? onChanged;

  const _GradientTextField({
    this.labelText,
    this.hintText,
    required this.controller,
    this.sicon,
    this.picon,
    this.inputFormatter,
    this.type,
    this.validator,
    this.onChanged,
  });

  @override
  _GradientTextFieldState createState() => _GradientTextFieldState();
}

class _GradientTextFieldState extends State<_GradientTextField> {
  late FocusNode _focusNode;
  double _strokeWidth = 2.0;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _strokeWidth = _focusNode.hasFocus ? 3.0 : 2.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidgets.gradientBorderPainter(
      strokeWidth: _strokeWidth,
      gradient: const LinearGradient(
        colors: [
          Color(0xFF1CB5E0),
          Color.fromARGB(255, 44, 44, 81),
          Color(0xFF1CB5E0),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        validator: widget.validator,
        inputFormatters: widget.inputFormatter,
        keyboardType: widget.type,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: widget.sicon,
          prefixIcon: widget.picon != null
              ? IconButton(
                  icon: widget.picon!.icon,
                  color: _focusNode.hasFocus ? Colors.white : Colors.grey,
                  onPressed: widget.picon!.onPressed,
                )
              : null,
          labelStyle: const TextStyle(
            color: Colors.white,
            backgroundColor: Colors.transparent,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        obscureText: false,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Gradient gradient;

  _GradientBorderPainter({required this.strokeWidth, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(10.0)));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

typedef Validator = String? Function(String? value);

// class MyDropdown extends StatelessWidget {
//   final String hintText;
//   final double buttonWidth;
//   final double buttonHeight;
//   final List<String> items;
//   final String? selectedValue;
//   final void Function(String?) onChanged;
//
//   const MyDropdown({
//     required this.hintText,
//     required this.items,
//     required this.selectedValue,
//     required this.onChanged,
//     Key? key, required this.buttonWidth, required this.buttonHeight,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
