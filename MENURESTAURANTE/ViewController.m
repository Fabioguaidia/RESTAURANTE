//
//  ViewController.m
//  MENURESTAURANTE
//
//  Created by Fabio Andres Guaidia Ruiz on 20/03/15.
//  Copyright (c) 2015 Fabio Andres Guaidia Ruiz. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Se crea la url con la direccion del web service
    // NSURL *url = [[NSURL alloc]initWithString:@"http://192.237.180.31/archies/public/category/details/1"];
    
    
    NSURL *url = [[NSURL alloc]initWithString:@"http://192.237.180.31/archies/public/category"];
    
    //Se captura la informacion de la URL
    NSData *data = [[NSData alloc]initWithContentsOfURL:url options:NSUTF8StringEncoding error:nil];
    
    
    self.vectorCategorias = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSLog(@" %@ ",self.vectorCategorias);
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
    
    return [self.vectorCategorias count];
    
}

// Crea cada celda y le asigna un contenido

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CeldaIdentificador =@"cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CeldaIdentificador];
    
    
    if (cell== nil) {
        
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CeldaIdentificador] ;
    }
    
    //Se crea un diccionario temporal para capturar los valores de la BD. Practicamente viene un diccionario dentro de cada posicion del vector.
    NSDictionary *tmp = [self.vectorCategorias objectAtIndex:indexPath.row];
    
    
       if (![[tmp objectForKey:@"img_path"] isKindOfClass:[NSNull class]]) {
        
        NSString *Url = [[NSString alloc]initWithFormat:@"http://192.237.180.31/archies/public/%@",[tmp objectForKey:@"img_path"]];
        NSURL *urlimg = [[NSURL alloc]initWithString:Url];
        NSLog(Url);
        
        NSData *dataImagen = [[NSData alloc]initWithContentsOfURL:urlimg options:NSUTF8StringEncoding error:nil];
        //cell.backgroundView= [UIImage imageWithData:dataImagen];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:dataImagen]];
    }
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    cell.textLabel.text= [tmp objectForKey:@"name"];
    
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SubViewController  *submenu = [self.storyboard instantiateViewControllerWithIdentifier:@"Submenu"];
    NSInteger *numero =(indexPath.row)+1;
    submenu.ide = [[NSString alloc]initWithFormat:@"%i",numero];
    
    
    [self.navigationController pushViewController:submenu animated:YES];
    
    
    NSLog(@"El index es: %i",indexPath.row);
}




@end
