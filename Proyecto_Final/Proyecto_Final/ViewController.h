//
//  ViewController.h
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 17/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioDAO.h"

@protocol ViewControllerDelegate <NSObject>

@end

@interface ViewController : UIViewController{
    IBOutlet UITextField *txtNombre;
    IBOutlet UITextField *txtCorreo;
    IBOutlet UITextField *txtEdad;
    IBOutlet UITextField *txtUsuario;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtConfirmar;
    IBOutlet UITextField *txtUserLogin;
    IBOutlet UITextField *txtPasswordLogin;
    UsuarioDAO *dao;
    
}
@property(nonatomic, assign)id<ViewControllerDelegate> delegate;
- (IBAction)registrarUsuario:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtCorreo;
@property (strong, nonatomic) IBOutlet UITextField *txtEdad;
@property (strong, nonatomic) IBOutlet UITextField *txtUsuario;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmar;
@property (nonatomic, strong) UsuarioDAO *dao;

@property (strong, nonatomic) IBOutlet UITextField *txtUserLogin;
@property (strong, nonatomic) IBOutlet UITextField *txtPasswordLogin;



- (IBAction)accesar:(id)sender;

@end

