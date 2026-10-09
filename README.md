# Sahmi Admin — Flutter Android project

لوحة إدارة منفصلة لتطبيق سهمي، بواجهة عربية داكنة واتصال Supabase.

## إصلاح خطأ Android v1 embedding

ملفات Android موجودة داخل المشروع، وملف `MainActivity.kt` يستخدم `io.flutter.embedding.android.FlutterActivity` (Embedding v2). سير عمل GitHub Actions يعيد توليد مجلد Android من قالب Flutter الحديث قبل البناء حتى يتجنب ملفات Android القديمة أو الناقصة.

## إنشاء APK من GitHub

1. ارفع محتويات هذا المجلد إلى مستودع GitHub باسم `sahmi_admin_flutter_source` على فرع `main`.
2. مفتاح Supabase من نوع `anon` مضبوط مسبقاً في `lib/main.dart`، لذلك لا تحتاج لإضافة GitHub Secret.
3. افتح **Actions → Build Sahmi Admin APK → Run workflow** (أو ادفع commit جديداً إلى `main`).
4. عند نجاح البناء افتح تشغيل workflow ونزّل artifact باسم `sahmi-admin-release-apk`؛ بداخله `app-release.apk`.

## تشغيل محلياً

```bash
flutter pub get
flutter run --dart-define=SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

## ملاحظات مهمة

- عنوان Supabase الافتراضي مضبوط داخل `lib/main.dart`.
- راجع `supabase/admin_schema.sql` وقارنه بمخطط قاعدة بياناتك قبل تشغيله.
- هذه نسخة أساس للإدارة وليست نظاماً إنتاجياً مكتملاً. جداول العرض في لوحة التحكم قد تحتاج مطابقة مع جداول مشروعك الفعلية. لا تعتمد إجراءات مالية أو صلاحيات حساسة قبل اختبار سياسات RLS وعمليات الخادم.
