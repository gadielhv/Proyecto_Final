//
//  ActualizarProductosView.m
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 22/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import "ActualizarProductosView.h"
#import "UsuarioDAO.h"
#import "Producto.h"
#import "AdminViewController.h"

@interface ActualizarProductosView ()

@end


@implementation ActualizarProductosView
@synthesize dao;
@synthesize peliculas;
@synthesize producto;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Modificar Pelicula";
    Producto * prod = self.producto;
    self.txtModTitulo.text = prod.titulo;
    self.txtModGenero.text = prod.genero;
    self.txtModDescripcion.text = prod.descripcion;
    self.txtModDuracion.text = prod.duracion;
    self.txtModPrecio.text = [NSString stringWithFormat:@"%.2f",prod.precio] ;
    self.txtModStock.text = [NSString stringWithFormat:@"%ld",prod.stock];
    dao = [[UsuarioDAO alloc] init];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)actualizarPelicula:(id)sender {
    NSInteger idPelicula = producto.idPelicula;
    NSString *titulo = self.txtModTitulo.text;
    NSString *genero = self.txtModGenero.text;
    NSInteger stock = [self.txtModStock.text integerValue];
    NSString *descripcion = self.txtModDescripcion.text;
    NSString *duracion = self.txtModDuracion.text;
    float precio = [self.txtModPrecio.text floatValue];
    
    
        
        [dao actualizarPelicula:titulo genero:genero descripcion:descripcion duracion:duracion precio:precio stock:stock idPelicula:idPelicula];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Actualizar Pelicula" message:@"Datos actualizados" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
        AdminViewController *viewAdmin = [[AdminViewController alloc]init];
        [self.navigationController pushViewController:viewAdmin animated:YES];
    
    
}
@end
