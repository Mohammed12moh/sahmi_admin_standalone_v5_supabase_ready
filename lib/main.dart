import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

const supabaseUrl = String.fromEnvironment(
  'SUPABASE_URL',
  defaultValue: 'https://rpkcvepfxlwfbwlwxikh.supabase.co',
);
const supabaseAnonKey = String.fromEnvironment(
  'SUPABASE_ANON_KEY',
  defaultValue: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwa2N2ZXBmeGx3ZmJ3bHd4aWtoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTExMzYxMTEsImV4cCI6MjEwNjcxMjExMX0.lTVBp2IDGMiPFVp1Mk1RzGjZTpvPn7iYAN528wdiFUQ',
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (supabaseAnonKey.isEmpty) {
    runApp(const ProviderScope(child: ConfigurationApp()));
    return;
  }
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  runApp(const ProviderScope(child: SahmiAdminApp()));
}

class ConfigurationApp extends StatelessWidget {
  const ConfigurationApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'إعداد ناقص: شغّل التطبيق مع --dart-define=SUPABASE_ANON_KEY=YOUR_ANON_KEY',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
}