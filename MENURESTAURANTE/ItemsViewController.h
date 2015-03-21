//
//  ItemsViewController.h
//  MENURESTAURANTE
//
//  Created by Fabio Andres Guaidia Ruiz on 20/03/15.
//  Copyright (c) 2015 Fabio Andres Guaidia Ruiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
NSMutableArray *Items;

}
@property (strong, nonatomic) NSMutableDictionary *Ditems;

@end
