//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_absolute_path/FlutterAbsolutePathPlugin.h>)
#import <flutter_absolute_path/FlutterAbsolutePathPlugin.h>
#else
@import flutter_absolute_path;
#endif

#if __has_include(<multi_image_picker/MultiImagePickerPlugin.h>)
#import <multi_image_picker/MultiImagePickerPlugin.h>
#else
@import multi_image_picker;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterAbsolutePathPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterAbsolutePathPlugin"]];
  [MultiImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"MultiImagePickerPlugin"]];
}

@end
