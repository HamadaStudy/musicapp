import 'package:client/core/provider/current_user_notifier.dart';
import 'package:client/features/auth/model/user_model.dart';
import 'package:client/features/auth/view_model/auth_view_model.dart';
import 'package:client/features/home/view/pages/home_page.dart';
import 'package:client/features/home/view/pages/upload_song_page.dart';
import 'package:flutter/material.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:client/features/auth/view/pages/login_page.dart';
import './core/theme/thema.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// main.dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(  // UncontrolledProviderScopeの代わりにProviderScopeを使用
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // ビルド後に初期化を実行
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authNotifier = ref.read(authViewModelProvider.notifier);
      await authNotifier.initSharedPreferences();
      await authNotifier.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    final authState = ref.watch(authViewModelProvider);
    
    // ローディング中の表示
    if (authState is AsyncLoading) {
      return MaterialApp(
        title: 'Music App',
        theme: AppTheme.darkThemeMode,
        home: const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    
    return MaterialApp(
      title: 'Music App',
      theme: AppTheme.darkThemeMode,
      home: currentUser == null ? const SignupPage() : const UploadSongPage(),
    );
  }
}