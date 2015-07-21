//
//  ViewController.m
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 17/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import "ViewController.h"
#import "UsuarioDAO.h"
#import "Usuario.h"
#import "AdminViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize txtNombre;
@synthesize txtCorreo;
@synthesize txtEdad;
@synthesize txtUsuario;
@synthesize txtPassword;
@synthesize txtConfirmar;
@synthesize txtPasswordLogin;
@synthesize txtUserLogin;
@synthesize dao;

- (void)viewDidLoad {
    [super viewDidLoad];
    dao = [[UsuarioDAO alloc] init];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registrarUsuario:(id)sender {
    
    
    NSString *nombre = txtNombre.text;
    NSString *correo = txtCorreo.text;
    NSInteger edad = [txtEdad.text integerValue];
    NSString *usuario = txtUsuario.text;
    NSString *password = txtPassword.text;
    NSString *confirma = txtConfirmar.text;
    if(![nombre isEqual:@""] && ![correo isEqual:@""] && ![usuario isEqual:@""] && ![password isEqual:@""] && ![txtEdad.text isEqual:@""] && ![confirma isEqual:@""]){
        
        if([password isEqual:confirma]){
        [dao crearUsuario:nombre correo:correo edad:edad usuario:usuario password:password];
         //NSLog(@"Registro exitoso");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Registro" message:@"Te has registrado con exito" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
            txtNombre.text = @"";
            txtCorreo.text = @"";
            txtEdad.text = @"";
            txtUsuario.text = @"";
            txtPassword.text = @"";
            txtConfirmar.text = @"";
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"La contraseña no coincide" delegate:nil cancelButtonTitle:@"Regresar" otherButtonTitles:nil]; [alert show];
    }
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Registro" message:@"Por favor llena los campos" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
    }
    
    //[dao obtenerUsuarios];
    
    
    
    
}


- (IBAction)accesar:(id)sender {
//    Usuario *objusuario =[[Usuario alloc]init];
//    //objusuario = [dao obtenerUsuarios];
//    
//    if([objusuario.usuario isEqualToString:txtUsuario.text]){
//        NSLog(@"SI EXISTE!");
//    }

    int flag = 0;
    
    NSMutableArray *usuario = [[NSMutableArray alloc] init];
    usuario = [dao obtenerUsuarios];
    NSLog(@"Datos %@",usuario.description);
    NSString *user1 = txtUserLogin.text;
    NSString *pass = txtPasswordLogin.text;
    
    
    if(![txtUserLogin.text isEqualToString:@""] && ![txtPasswordLogin.text isEqualToString:@""]){
        for (int i=0; i < [usuario count]; i++) {
        
            Usuario *user = [usuario objectAtIndex:i];
    
            if([user.usuario isEqualToString:user1] && [user.password   isEqualToString:pass]) {
                
                flag = 1;

            }
            else{
                flag = 0;
            }

        
        }
    
        if (flag == 1 && [user1 isEqualToString:@"Admin"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bienvenido Admin" message:@"Datos correctos" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
            // Mandar el catalogo
            AdminViewController *viewAdmin = [[AdminViewController alloc]init];
            [self.navigationController pushViewController:viewAdmin animated:YES];
        }
        else if(flag==1){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bienvenido" message:@"Datos correctos" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];        }
        else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Usuario y/o contraseña incorrectos" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
        }
        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Por favor ingresa tus datos" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [alert show];
    }
    
    
}
@end
