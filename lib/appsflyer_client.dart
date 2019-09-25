import 'package:appsflyer_sdk/appsflyer_sdk.dart';

class AppsFlyerClient {
  AppsflyerSdk appsflyerSdk;

  Future<String> getUID() {
    return appsflyerSdk.getAppsFlyerUID();
  }

  AppsFlyerClient(String devKey, String appId) {
    appsflyerSdk = AppsflyerSdk({
      "afDevKey": devKey,
      "afAppId": appId,
      "isDebug": true,
    });
  }

  Future<bool> initialize() async {
    await appsflyerSdk.initSdk();
    appsflyerSdk.registerOnAppOpenAttributionCallback().listen((event) {
      print("#appsflyerSdk# attribution data: $event");
    });
    appsflyerSdk.registerConversionDataCallback().listen((event) {
      print("#appsflyerSdk# conversion data: $event");
      final response = event as Map<String, dynamic>;

      final data = response["data"] as Map<String, String>;
      final adsetId = data["adset_id"];
      if (adsetId != null) {
        print("#appsflyerSdk# adsetId = $adsetId");
      }

      final campaignId = data["campaign_id"];
      if (campaignId != null) {
        print("#campaignId# adsetId = $campaignId");
      }
    }, onError: (error) {
      print("#appsflyerSdk# $error");
    }, onDone: () {
      print("#appsflyerSdk# done");
    });
    return Future<bool>.value(true);
  }

  void setUserProperty(String propertyId, dynamic value) {}

  void logEvent(String eventId, Map<String, dynamic> properties) {
    if (eventId == "subscription_trial_activated_client") {
      final price = properties["normalized_price"];
      properties["af_revenue"] = price * 0.4;
    }

    appsflyerSdk.trackEvent(eventId, properties);
  }
}
