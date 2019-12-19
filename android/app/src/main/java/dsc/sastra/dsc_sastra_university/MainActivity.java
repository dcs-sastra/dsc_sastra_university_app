package dsc.sastra.dsc_sastra_university;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

// import android.content.ContextWrapper;
// import android.content.Intent;
// import android.content.IntentFilter;
// import android.os.Build.VERSION;
// import android.os.Build.VERSION_CODES;
// import android.os.Bundle;

// import io.flutter.plugin.common.MethodCall;
// import io.flutter.plugin.common.MethodChannel;
// import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
// import io.flutter.plugin.common.MethodChannel.Result;

// import android.widget.Toast;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    // new MethodChannel(getFlutterView(), "com.dsc/share").setMethodCallHandler((call, result) -> {
    //   if (call.method.equals("share")) {
    //     String message = call.argument("msg");
    //     String poster = call.argument("poster");
    //     Toast.makeText(getApplicationContext(), message + "\n" + poster, Toast.LENGTH_SHORT).show();
    //     result.success(true);
    //     result.error("Error", null, null);
    //   }
    // });

  }
}
