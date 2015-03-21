//
//  SubViewController.m
//  MENURESTAURANTE
//
//  Created by Fabio Andres Guaidia Ruiz on 20/03/15.
//  Copyright (c) 2015 Fabio Andres Guaidia Ruiz. All rights reserved.
//

#import "SubViewController.h"
#import "ItemsViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Items = [[NSMutableArray alloc] init];
    //Se crea la url con la direccion del web service
    NSString *url1 = [[NSString alloc]initWithFormat:@"http://192.237.180.31/archies/public/category/details/%@",self.ide];
    NSURL *url = [[NSURL alloc]initWithString:url1];
    NSLog(@"El Ide es: %@",self.ide);
    NSLog(@"El Ide es: %@",url1);
    
    //Se captura la informacion de la URL
    NSData *data = [[NSData alloc]initWithContentsOfURL:url options:NSUTF8StringEncoding error:nil];
    
    
    
    NSError *error;
    _json = [[NSMutableDictionary alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error]];
    
    // NSLog(@"Total de items %i",[_json count]);
    
    
    
    NSMutableArray *principal = (NSMutableArray *)(_json)[@"subcategory"];
    
    
    
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

//Numero de  secciones en la table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

//numero de celdas en la tabla


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [Items count];
    
    
}

// Crea cada celda y le asigna un contenido

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CeldaIdentificador =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CeldaIdentificador];
    
    
    if (cell== nil) {
        
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CeldaIdentificador] ;
    }
    
    NSDictionary *tmp = [Items objectAtIndex:indexPath.row];
    cell.textLabel.text=[tmp objectForKey:@"name"];
    cell.imageView.image= [UIImage imageNamed:@"bullet-green.png"];
    return cell;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemsViewController  *itm = [self.storyboard instantiateViewControllerWithIdentifier:@"Items"];
    
    NSLog(@"El index en la parte 2 es: %i",indexPath.row);
    
    NSMutableDictionary *tmp2 = [Items objectAtIndex:indexPath.row];
    itm.Ditems = tmp2;
     
    [self.navigationController pushViewController:itm animated:YES];
    
}











@end
