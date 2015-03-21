//
//  SubViewController.h
//  MENURESTAURANTE
//
//  Created by Fabio Andres Guaidia Ruiz on 20/03/15.
//  Copyright (c) 2015 Fabio Andres Guaidia Ruiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *Items;
}
@property (strong,nonatomic) NSArray *vectorCategorias;

@property (strong,nonatomic) NSMutableDictionary *sub;
@property (strong, nonatomic) NSMutableDictionary *json;
@property (strong, nonatomic) NSString *ide;

@end
