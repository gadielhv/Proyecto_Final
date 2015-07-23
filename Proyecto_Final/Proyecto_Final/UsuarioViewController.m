//
//  UsuarioViewController.m
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 23/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import "UsuarioViewController.h"
#import "Producto.h"
#import "DetalleViewController.h"


@interface UsuarioViewController ()

@end

@implementation UsuarioViewController

@synthesize dao;
@synthesize peliculas;

-(id)init{
    self = [super initWithNibName:@"UserView" bundle:nil];
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
   
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Catalogo de peliculas";
    dao = [[UsuarioDAO alloc] init];
    peliculas = [[NSMutableArray alloc] init];
    peliculas = [dao obtenerPeliculas];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [peliculas count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"celda";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Producto *product = [peliculas objectAtIndex:indexPath.row];
    cell.textLabel.text  = product.titulo;
    
   //cell.textLabel.text = [[peliculas objectAtIndex:[indexPath row]] valueForKey:@"titulo"];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    DetalleViewController *viewDetalle = [[DetalleViewController alloc]initWithNibName:@"DetalleView" bundle:nil];
    viewDetalle.producto = [self.peliculas objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:viewDetalle animated:YES];
    
    
}

@end
