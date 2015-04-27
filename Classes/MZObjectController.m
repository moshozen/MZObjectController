//
//  MZObjectController.h
//
//  Created by Mat Trudel on 2015-04-27.
//  Copyright (c) 2015 Moshozen Inc.
//
//  MIT License
//

#import "MZObjectController.h"

@interface MZObjectController ()
@property(readwrite) id contentObject;
@property(readwrite) NSArray *observedKeyPaths;
@end

@implementation MZObjectController

+ (instancetype)controllerWithContentObject:(id)object observedKeyPaths:(NSArray *)keyPaths delegate:(id<MZObjectControllerDelegate>)delegate {
  MZObjectController *controller = [[self alloc] initWithContentObject:object keyPaths:keyPaths];
  controller.delegate = delegate;
  return controller;
}

- (id)initWithContentObject:(id)object keyPaths:(NSArray *)keyPaths {
  if (self = [super init]) {
    self.contentObject = object;
    self.observedKeyPaths = keyPaths;
    [self startObserving];
  }
  return self;
}

- (void)dealloc {
  [self stopObserving];
}

- (void)startObserving {
  for (NSString *keyPath in self.observedKeyPaths) {
    [self.contentObject addObserver:self forKeyPath:keyPath options:0 context:(__bridge void *)self];
  }
}

- (void)stopObserving {
  for (NSString *keyPath in self.observedKeyPaths) {
    [self.contentObject removeObserver:self forKeyPath:keyPath];
  }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (context == (__bridge void *)self) {
    if ([self.delegate respondsToSelector:@selector(controller:contentObject:didChangeKeyPath:)]) {
      [self.delegate controller:self contentObject:self.contentObject didChangeKeyPath:keyPath];
    }
  }
}

@end
