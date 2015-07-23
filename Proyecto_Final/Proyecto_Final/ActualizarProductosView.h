//
//  ActualizarProductosView.h
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 22/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioDAO.h"
#import "Producto.h"

@interface ActualizarProductosView : UIViewController{
    UsuarioDAO *dao;
    NSMutableArray *peliculas;
    Producto *producto;
}
@property (weak, nonatomic) IBOutlet UITextField *txtModTitulo;
@property (weak, nonatomic) IBOutlet UITextField *txtModGenero;
@property (weak, nonatomic) IBOutlet UITextField *txtModDescripcion;
@property (weak, nonatomic) IBOutlet UITextField *txtModDuracion;
@property (weak, nonatomic) IBOutlet UITextField *txtModPrecio;
@property (weak, nonatomic) IBOutlet UITextField *txtModStock;
- (IBAction)actualizarPelicula:(id)sender;
@property (nonatomic, strong) UsuarioDAO *dao;
@property (nonatomic, strong) NSMutableArray *peliculas;
@property (nonatomic, strong) Producto *producto;


@end
