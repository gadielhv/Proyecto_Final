//
//  DetalleViewController.h
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 23/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioDAO.h"
#import "Producto.h"

@interface DetalleViewController : UIViewController{
    UsuarioDAO *dao;
    NSMutableArray *peliculas;
    Producto *producto;
}
@property (weak, nonatomic) IBOutlet UILabel *lblTitulo;
@property (weak, nonatomic) IBOutlet UILabel *lblDescripcion;
@property (weak, nonatomic) IBOutlet UILabel *lblGenero;
@property (weak, nonatomic) IBOutlet UILabel *lblDuracion;
@property (weak, nonatomic) IBOutlet UILabel *lblPrecio;
- (IBAction)btnComprar:(id)sender;
@property (nonatomic, strong) UsuarioDAO *dao;
@property (nonatomic, strong) NSMutableArray *peliculas;
@property (nonatomic, strong) Producto *producto;

@end
