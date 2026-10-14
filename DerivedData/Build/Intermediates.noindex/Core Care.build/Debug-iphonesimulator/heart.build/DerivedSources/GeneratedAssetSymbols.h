#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.saveetha.corecare";

/// The "bluefont" asset catalog color resource.
static NSString * const ACColorNameBluefont AC_SWIFT_PRIVATE = @"bluefont";

/// The "coreblue" asset catalog color resource.
static NSString * const ACColorNameCoreblue AC_SWIFT_PRIVATE = @"coreblue";

/// The "avatar1" asset catalog image resource.
static NSString * const ACImageNameAvatar1 AC_SWIFT_PRIVATE = @"avatar1";

/// The "avatar10" asset catalog image resource.
static NSString * const ACImageNameAvatar10 AC_SWIFT_PRIVATE = @"avatar10";

/// The "avatar11" asset catalog image resource.
static NSString * const ACImageNameAvatar11 AC_SWIFT_PRIVATE = @"avatar11";

/// The "avatar12" asset catalog image resource.
static NSString * const ACImageNameAvatar12 AC_SWIFT_PRIVATE = @"avatar12";

/// The "avatar2" asset catalog image resource.
static NSString * const ACImageNameAvatar2 AC_SWIFT_PRIVATE = @"avatar2";

/// The "avatar3" asset catalog image resource.
static NSString * const ACImageNameAvatar3 AC_SWIFT_PRIVATE = @"avatar3";

/// The "avatar4" asset catalog image resource.
static NSString * const ACImageNameAvatar4 AC_SWIFT_PRIVATE = @"avatar4";

/// The "avatar5" asset catalog image resource.
static NSString * const ACImageNameAvatar5 AC_SWIFT_PRIVATE = @"avatar5";

/// The "avatar6" asset catalog image resource.
static NSString * const ACImageNameAvatar6 AC_SWIFT_PRIVATE = @"avatar6";

/// The "avatar7" asset catalog image resource.
static NSString * const ACImageNameAvatar7 AC_SWIFT_PRIVATE = @"avatar7";

/// The "avatar8" asset catalog image resource.
static NSString * const ACImageNameAvatar8 AC_SWIFT_PRIVATE = @"avatar8";

/// The "avatar9" asset catalog image resource.
static NSString * const ACImageNameAvatar9 AC_SWIFT_PRIVATE = @"avatar9";

/// The "base" asset catalog image resource.
static NSString * const ACImageNameBase AC_SWIFT_PRIVATE = @"base";

/// The "corecarelogo" asset catalog image resource.
static NSString * const ACImageNameCorecarelogo AC_SWIFT_PRIVATE = @"corecarelogo";

#undef AC_SWIFT_PRIVATE
