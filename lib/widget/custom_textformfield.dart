import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investorentrepreneur/common/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final int? maxLines;
  final int? maxLength;
  final double? height;
  final double? hintSize;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final EdgeInsetsGeometry? contentPadding;
  final String? hint;
  final String? labelText;
  final String? initialValue;
  final bool? obscureText;
  final String? obscureTextCharacter;
  final bool? filled;
  final bool? isCollapsed;
  final bool? isDense;
  final bool? isEnabled;
  final bool? readOnly;
  final Color? fillColor;
  final Color? hintColor;
  final Color? inputColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? cursorColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final AutovalidateMode? autoValidateMode;
  final TextStyle? textStyle;
  final TextStyle? errorTextStyle;
  final InputDecoration? customDecoration;
  final String? semanticLabel;
  final BoxConstraints? prefixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextEditingController? controller;
  final String? Function(String?)? validator; 

  const CustomTextFormField({
    Key? key,
    this.maxLines,
    this.maxLength,
    this.height,
    this.hintSize,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.contentPadding,
    this.obscureTextCharacter = '.',
    this.hint,
    this.labelText,
    this.initialValue,
    this.prefixIconConstraints,
    this.obscureText = false,
    this.filled = true,
    this.isCollapsed,
    this.isDense,
    this.isEnabled = true,
    this.readOnly = false,
    this.fillColor,
    this.hintColor,
    this.inputColor,
    this.borderColor,
    this.focusBorderColor,
    this.cursorColor,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixConstraints,
    this.suffixConstraints,
    this.focusNode,
    this.keyboardType,
    this.inputAction,
    this.autoValidateMode,
    this.textStyle,
    this.errorTextStyle,
    this.customDecoration,
    this.semanticLabel,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.controller,
    this.validator, String? errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      maxLength: maxLength,
      obscuringCharacter: obscureTextCharacter ?? '.',
      obscureText: obscureText ?? false,
      cursorColor: cursorColor ?? Theme.of(context).primaryColor,
      maxLines: obscureText ?? false ? 1 : (maxLines ?? 1),
      textInputAction: inputAction,
      initialValue: initialValue,
      style: textStyle ??
          GoogleFonts.poppins(color: inputColor ?? AppColor.blackColor),
      autofocus: false,
      keyboardType: keyboardType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
      readOnly: readOnly ?? false,
      enabled: isEnabled ?? true,
      decoration: customDecoration ??
          InputDecoration(
            labelText: labelText,
            counterText: '',
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: hintColor ?? Colors.grey,
              fontSize: hintSize ?? 14,
            ),
            filled: filled ?? false,
            fillColor: fillColor ?? Colors.transparent,
            prefixIconConstraints: prefixConstraints,
            suffixIconConstraints: suffixConstraints,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: horizontalPadding ?? 16.0,
                  vertical: verticalPadding ?? 14.0,
                ),
            errorStyle: errorTextStyle,
            errorMaxLines: 2,
            isCollapsed: isCollapsed ?? false,
            isDense: isDense,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey.withOpacity(0.3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey.withOpacity(0.3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 6),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey.withOpacity(0.3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 6),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey.withOpacity(0.3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 6),
            ),
          ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: onTapOutside ??
          (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
    );
  }
}
