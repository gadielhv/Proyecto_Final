//
//  AgregarProd.h
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 22/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioDAO.h"

@interface AgregarProd : UIViewController{
    IBOutlet UITextField *txtTitulo;
    IBOutlet UITextField *txtGenero;
    IBOutlet UITextField *txtDescripcion;
    IBOutlet UITextField *txtDuracion;
    IBOutlet UITextField *txtPrecio;
    IBOutlet UITextField *txtStock;
    UsuarioDAO *dao;
    
}


@property (strong, nonatomic) IBOutlet UITextField *txtTitulo;
@property (strong, nonatomic) IBOutlet UITextField *txtGenero;
@property (strong, nonatomic) IBOutlet UITextField *txtDescripcion;
@property (strong, nonatomic) IBOutlet UITextField *txtDuracion;
@property (strong, nonatomic) IBOutlet UITextField *txtPrecio;
@property (strong, nonatomic) IBOutlet UITextField *txtStock;
@property (nonatomic, strong) UsuarioDAO *dao;

- (IBAction)guardarPelicula:(id)sender;


@end
