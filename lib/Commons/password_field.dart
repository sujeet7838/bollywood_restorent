import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ObscureTextStateNotifier extends ChangeNotifier {
  bool isTextObscure = true;

  void updateObscureTextState() {
    isTextObscure = !isTextObscure;
    notifyListeners();
  }
}

final ChangeNotifierProvider<ObscureTextStateNotifier>
    obscureTextStateProvider = ChangeNotifierProvider<ObscureTextStateNotifier>(
  (ChangeNotifierProviderRef<ObscureTextStateNotifier> ref) =>
      ObscureTextStateNotifier(),
);

class PasswordField extends ConsumerWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    bool isTextObscure = ref.watch(obscureTextStateProvider).isTextObscure;

    return TextField(
      keyboardType: TextInputType.text,
      cursorRadius: const Radius.circular(0.8),
      obscureText: isTextObscure,
      style: const TextStyle(
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: GestureDetector(
          onTap: () {
            ref
                .read(obscureTextStateProvider.notifier)
                .updateObscureTextState();
          },
          child: isTextObscure == true
              ? const Icon(
                  Icons.visibility_off_rounded,
                )
              : const Icon(
                  Icons.visibility_rounded,
                ),
        ),
      ),
    );
  }
}
