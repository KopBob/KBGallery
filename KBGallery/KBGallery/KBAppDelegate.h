//
//  KBAppDelegate.h
//  KBGallery
//
//  Created by Boris kopin on 05.09.12.
//  Copyright (c) 2012 Boris Kopin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
