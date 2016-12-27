//
//  Wilddog.h
//  Wilddog
//
//  Created by junpengwang on 16/9/8.
//  Copyright © 2016年 wilddog. All rights reserved.
//

#if !defined(__has_include)
#error "Wilddog.h won't import anything if your compiler doesn't support __has_include. Please \
import the headers individually."
#else
#if __has_include(<WilddogAuth/WilddogAuth.h>)
#import <WilddogAuth/WilddogAuth.h>
#endif

#if __has_include(<WilddogSync/WilddogSync.h>)
#import <WilddogSync/WilddogSync.h>
#endif

#if __has_include(<WilddogCore/WilddogCore.h>)
#import <WilddogCore/WilddogCore.h>
#endif

#endif  // defined(__has_include)




