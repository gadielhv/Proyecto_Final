//
//  AgregarProd.m
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 22/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import "AgregarProd.h"
#import "UsuarioDAO.h"
#import "Producto.h"
#import "AdminViewController.h"


@interface AgregarProd ()

@end

@implementation AgregarProd{
    int flag;
}


@synthesize txtTitulo;
@synthesize txtGenero;
@synthesize txtDescripcion;
@synthesize txtDuracion;
@synthesize txtPrecio;
@synthesize txtStock;
@synthesize dao;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Agregar Pelicula";
    // Do any additional setup after loading the view from its nib.
    dao = [[UsuarioDAO alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)guardarPelicula:(id)sender {
    
    NSMutableArray *usuarioDB = [[NSMutableArray alloc] init];
    usuarioDB = [dao obtenerPeliculas];
    
    NSString *titulo = txtTitulo.text;
    NSString *genero = txtGenero.text;
    NSInteger stock = [txtStock.text integerValue];
    NSString *descripcion = txtDescripcion.text;
    NSString *duracion = txtDuracion.text;
    float precio = [txtPrecio.text floatValue];
    
    if(![titulo isEqual:@""] && ![genero isEqual:@""] && ![descripcion isEqual:@""] && ![duracion isEqual:@""] && ![txtStock.text isEqual:@""] && ![txtPrecio.text isEqual:@""]){
        
        
       
            
            for (int i=0; i < [usuarioDB count]; i++) {
                
                Producto *producto = [usuarioDB objectAtIndex:i];
                
                if([producto.titulo isEqualToString:txtTitulo.text]) {
                    flag = 1;
                }
            }
            
            if (flag == 1) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Registro" message:@"El titulo ya existe, ingresa otro." delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
                txtTitulo.text = @"";
                flag = 0;
            }
            else{
                [dao crearPelicula:titulo genero:genero descripcion:descripcion duracion:duracion precio:precio stock:stock];
                NSLog(@"Agrego %@", dao);
                //NSLog(@"Registro exitoso");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nueva Pelicula" message:@"Se registro la pelicula con exito" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
                txtTitulo.text = @"";
                txtGenero.text = @"";
                txtDescripcion.text = @"";
                txtDuracion.text = @"";
                txtPrecio.text = @"";
                txtStock.text = @"";
                AdminViewController *viewAdmin = [[AdminViewController alloc]init];
                [self.navigationController pushViewController:viewAdmin animated:YES];
            }
        
        
 
        
        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Pelicula" message:@"Por favor llena los campos" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
    }
    

    
}
@end
