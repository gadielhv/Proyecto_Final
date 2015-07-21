//
//  UsuarioDAO.h
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 21/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface UsuarioDAO : NSObject{
    sqlite3 *bd;
}

- (void) crearUsuario: (NSString *)nombre correo:(NSString *) correo edad:(NSInteger)edad usuario:(NSString *)usuario password:(NSString *)password;

- (NSMutableArray *) obtenerUsuarios;

- (void) actualizarUsuario: (NSString *) usuario nombre:(NSString *)nombre password:(NSString *)password correo:(NSString *)correo edad:(NSInteger)edad ID:(NSInteger)ID;

- (void) borrarUsuario: (NSInteger) ID;

- (NSString *) obtenerRutaBD;

@end
