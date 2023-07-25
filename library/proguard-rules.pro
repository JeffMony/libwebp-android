# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#-optimizationpasses 5
# 混淆时不使用大小写混合，混淆后的类名为小写
#-dontusemixedcaseclassnames
# 指定不去忽略非公共库的类
#-dontskipnonpubliclibraryclasses
# 指定不去忽略非公共库的成员
#-dontskipnonpubliclibraryclassmembers
# 混淆时不做预校验
#-dontpreverify
# 混淆时不记录日志
-verbose
# 代码优化
#-dontshrink
# 不优化输入的类文件
#-dontoptimize
# 保留注解不混淆
-keepattributes *Annotation*,InnerClasses
# 避免混淆泛型
-keepattributes Signature
# 保留代码行号，方便异常信息的追踪
-keepattributes SourceFile,LineNumberTable
# 混淆采用的算法
-optimizations !code/simplification/cast,!field/*,!class/merging/*
# dump.txt文件列出apk包内所有class的内部结构
-dump class_files.txt
# seeds.txt文件列出未混淆的类和成员
-printseeds seeds.txt
# usage.txt文件列出从apk中删除的代码
-printusage unused.txt
# mapping.txt文件列出混淆前后的映射
-printmapping mapping.map

# 保持native方法不被混淆
-keepclasseswithmembernames class * {
    native <methods>;
    static <methods>;
}

# 不混淆枚举
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# 不混淆接口
-keep interface * {
    *;
}

-keep class com.jeffmony.media.MediaSdk { *; }
-keep class com.jeffmony.media.VideoRenderListener { *; }

-keep class com.jeffmony.media.audio.AudioInfoImpl { *; }
-keep class com.jeffmony.media.audio.AudioInfoListener { *; }
-keep class com.jeffmony.media.audio.AudioPlayerImpl { *; }
-keep class com.jeffmony.media.audio.AudioRecord { *; }
-keep interface com.jeffmony.media.audio.AudioRecord$* { *; }

-keep class com.jeffmony.media.editor.ClipListener { *; }
-keep class com.jeffmony.media.editor.MediaClip { *; }
-keep class com.jeffmony.media.editor.AudioEffectListener { *; }
-keep class com.jeffmony.media.editor.VideoCaptureListener { *; }
-keep class com.jeffmony.media.editor.VideoEditorImpl { *; }
-keep class com.jeffmony.media.editor.VideoEditorListener { *; }

-keep class com.jeffmony.media.effect.EffectListener { *; }

-keep class com.jeffmony.media.export.ExportInfo { *; }
-keep class com.jeffmony.media.export.ExportListener { *; }
-keep class com.jeffmony.media.export.VideoExportImpl { *; }
-keep class com.jeffmony.media.export.VideoExportRenderListener { *; }

-keep enum com.jeffmony.media.image.ImageFormat { *; }
-keep class com.jeffmony.media.image.ImageSaveConfig { *; }

-keep class com.jeffmony.media.record.RecordListener { *; }
-keep class com.jeffmony.media.record.TakePictureListener { *; }
-keep class com.jeffmony.media.record.VideoRecordImpl { *; }

-keep class com.jeffmony.media.util.DeviceUtils { *; }
-keep class com.jeffmony.media.util.ImageUtils { *; }
-keep class com.jeffmony.media.util.MediaCodecUtils { *; }
-keep class com.jeffmony.media.util.VideoComposite { *; }
-keep class com.jeffmony.media.util.VideoCompositeListener { *; }
-keep class com.jeffmony.media.video.VideoExtractImpl { *; }

# jni反调的类名不混淆
-keep class com.jeffmony.media.decode.MediaCodecDecode {
    # 不混淆类中的方法名
    <methods>;
}

-keep class com.jeffmony.media.encode.MediaCodecEncode {
    # 不混淆类中的方法名
    <methods>;
}

# 保留我们自定义控件（继承自View）不被混淆
-keep public class * extends android.view.View {
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}