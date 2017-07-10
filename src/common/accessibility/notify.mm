#import <Cocoa/Cocoa.h>

#include "notify.h"

extern NSString *const ChunkWMWindowRect;

NSString *const ChunkWMWindowRect = @"ChunkWMWindowRect";

void notifyChangeWindowRect(uint32_t WindowId, float X, float Y, float Width, float Height)
{
  NSDistributedNotificationCenter *Nc = [NSDistributedNotificationCenter defaultCenter];
  NSNumber *Id = [NSNumber numberWithUnsignedInt:WindowId];
  NSNumber *NsX = [NSNumber numberWithFloat:X];
  NSNumber *NsY = [NSNumber numberWithFloat:Y];
  NSNumber *NsWidth = [NSNumber numberWithFloat:Width];
  NSNumber *NsHeight = [NSNumber numberWithFloat:Height];
  NSDictionary *UserInfo = @{@"id": Id,
                             @"x": NsX, @"y": NsY,
                             @"width": NsWidth, @"height": NsHeight};
  
  [Nc postNotificationName:ChunkWMWindowRect object:nil userInfo:UserInfo];
}
