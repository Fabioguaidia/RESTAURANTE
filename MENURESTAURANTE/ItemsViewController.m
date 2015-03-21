//
//  ItemsViewController.m
//  MENURESTAURANTE
//
//  Created by Fabio Andres Guaidia Ruiz on 20/03/15.
//  Copyright (c) 2015 Fabio Andres Guaidia Ruiz. All rights reserved.
//

#import "ItemsViewController.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Items = [[NSMutableArray alloc]init];
    NSLog(@"Los items son ************ %@",_Ditems);
    
    
    
    NSMutableArray *principal = (NSMutableArray *)(_Ditems)[@"items"];
    
    
    
    for (NSInteger i=0; i<[principal count]; i++) {
        [Items addObject:[principal objectAtIndex:i]];
        //NSLog(@"ITEM %i",i);
        //NSLog(@"********* %@",Items);
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

//numero de celdas en la tabla


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
    
}

// Crea cada celda y le asigna un contenido

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CeldaIdentificador =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CeldaIdentificador];
    
    
    if (cell== nil) {
        
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CeldaIdentificador] ;
    }
    cell.textLabel.text = @"kakakaka";
    NSDictionary *tmp = [Items objectAtIndex:indexPath.row];
    cell.textLabel.text=[tmp objectForKey:@"name"];
    cell.detailTextLabel.text = [tmp objectForKey:@"description"];
    NSString *Url = [[NSString alloc]initWithFormat:@"http://192.237.180.31/archies/public/%@",[tmp objectForKey:@"img_path"]];
    NSURL *urlimg = [[NSURL alloc]initWithString:Url];
    NSLog(Url);
    
    NSData *dataImagen = [[NSData alloc]initWithContentsOfURL:urlimg options:NSUTF8StringEncoding error:nil];
    
    
    cell.imageView.image= [[UIImage alloc]initWithData:dataImagen];
    return cell;
    
    
}

@end
