//
//  ViewController.h
//  MENURESTAURANTE
//
//  Created by Fabio Andres Guaidia Ruiz on 20/03/15.
//  Copyright (c) 2015 Fabio Andres Guaidia Ruiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) NSArray *vectorCategorias;
@property (strong,nonatomic) NSArray *vector1;

@end
