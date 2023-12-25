import 'package:flutter/widgets.dart';

/// A mock authentication service.
class DevFinAuth extends ChangeNotifier {
  bool _signedIn = false;

  /// Whether user has signed in.
  bool get signedIn => _signedIn;

  /// Signs out the current user.
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    // Sign out.
    _signedIn = false;
    notifyListeners();
  }

  /// Signs in a user.
  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    // Sign in. Allow any password.
    _signedIn = true;
    notifyListeners();
    return _signedIn;
  }
}

/// An inherited notifier to host [DevFinAuth] for the subtree.
class DevFinAuthScope extends InheritedNotifier<DevFinAuth> {
  /// Creates a [DevFinAuthScope].
  const DevFinAuthScope({
    required DevFinAuth super.notifier,
    required super.child,
    super.key,
  });

  /// Gets the [DevFinAuth] above the context.
  static DevFinAuth of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DevFinAuthScope>()!.notifier!;
}
