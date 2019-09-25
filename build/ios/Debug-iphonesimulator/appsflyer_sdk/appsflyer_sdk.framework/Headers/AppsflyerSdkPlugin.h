#import <Flutter/Flutter.h>
#import <AppsFlyerLib/AppsFlyerTracker.h>

@interface AppsflyerSdkPlugin: NSObject<FlutterPlugin>

@end

// Appsflyer JS objects
#define afDevKey                        @"afDevKey"
#define afAppId                         @"afAppId"
#define afIsDebug                       @"isDebug"
#define afEventName                     @"eventName"
#define afEventValues                   @"eventValues"
#define afConversionData                @"GCD"

// Appsflyer native objects
#define afOnInstallConversionData       @"onInstallConversionData"
#define afSuccess                       @"success"
#define afFailure                       @"failure"
#define afOnAttributionFailure          @"onAttributionFailure"
#define afValidatePurchase              @"validatePurchase"
#define afOnAppOpenAttribution          @"onAppOpenAttribution"
#define afOnInstallConversionFailure    @"onInstallConversionFailure"
#define afOnInstallConversionDataLoaded @"onInstallConversionDataLoaded"

// Stream Channels
#define afMethodChannel                 @"af-api"
#define afEventChannel                  @"af-events"
#define afValidatePurchaseChannel       @"af-validate-purchase"
