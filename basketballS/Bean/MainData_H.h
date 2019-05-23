//
//  MainData_H.h
//  basketballS
//
//  Created by Apple on 2019/4/10.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"


@protocol DATA
@end

@interface DATA : JSONModel
@property NSString *id;
@property NSString *title;
@property NSString *image;

@end

@implementation DATA
@end

@interface MainData_H : JSONModel
@property NSString *status;
@property NSString *msg;
@property NSArray<DATA> *data;

@end

@implementation MainData_H
@end
