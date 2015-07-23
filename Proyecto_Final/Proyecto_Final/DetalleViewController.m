//
//  DetalleViewController.m
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 23/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import "DetalleViewController.h"
#import "Producto.h"
#import "UsuarioDAO.h"
#import "UsuarioViewController.h"

@interface DetalleViewController ()

@end

@implementation DetalleViewController
@synthesize dao;
@synthesize peliculas;
@synthesize producto;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Detalles";
    Producto *prod = self.producto;
    self.lblTitulo.text = prod.titulo;
    self.lblDescripcion.text = prod.descripcion;
    self.lblGenero.text = prod.genero;
    self.lblDuracion.text = prod.duracion;
    self.lblPrecio.text = [NSString stringWithFormat:@"%.2f",prod.precio];
    dao= [[UsuarioDAO alloc]init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnComprar:(id)sender {
    NSInteger idPelicula = producto.idPelicula;
    NSInteger stock = producto.stock;
    
    if (stock > 0) {
        [dao comprar:(stock-1) id:idPelicula];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Movie Mark" message:@"Compra Exitosa" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
        UsuarioViewController *viewUser = [[UsuarioViewController alloc]initWithNibName:@"UsuarioView" bundle:nil];
        [self.navigationController pushViewController:viewUser animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Movie Mark" message:@"Pelicula Agotada!" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
        UsuarioViewController *viewUser = [[UsuarioViewController alloc]initWithNibName:@"UsuarioView" bundle:nil];
        [self.navigationController pushViewController:viewUser animated:YES];
    }
    
    
    
    
}
@end
