//
//  MZObjectController.h
//
//  Created by Mat Trudel on 2015-04-27.
//  Copyright (c) 2015 Moshozen Inc.
//
//  MIT License
//

@import Foundation;

@class MZObjectController;

@protocol MZObjectControllerDelegate <NSObject>
- (void)controller:(MZObjectController *)controller contentObject:(id)contentObject didChangeKeyPath:(NSString *)keyPath;
@end

@interface MZObjectController : NSObject
@property(weak) id<MZObjectControllerDelegate> delegate;
@property(readonly) id contentObject;
@property(readonly) NSArray *observedKeyPaths;

+ (instancetype)controllerWithContentObject:(id)object observedKeyPaths:(NSArray *)keyPaths delegate:(id<MZObjectControllerDelegate>)delegate;

@end
