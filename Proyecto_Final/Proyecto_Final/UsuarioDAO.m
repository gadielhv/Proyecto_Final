//
//  UsuarioDAO.m
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 21/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import "UsuarioDAO.h"
#import "Usuario.h"

@implementation UsuarioDAO


// Se obtine la ruta de la DB
- (NSString *) obtenerRutaBD{
    NSString *dirDocs;
    NSArray *rutas;
    NSString *rutaBD;
    
    rutas = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    dirDocs = [rutas objectAtIndex:0];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    rutaBD = [[NSString alloc] initWithString:[dirDocs stringByAppendingPathComponent:@"tiendaPelis.sqlite"]];
    
    if([fileMgr fileExistsAtPath:rutaBD] == NO){
        [fileMgr copyItemAtPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"tiendaPelis.sqlite"] toPath:rutaBD error:NULL];
    }
    
    return rutaBD;
}

// Crea usuarios en la BD
- (void) crearUsuario: (NSString *)nombre correo:(NSString *) correo edad:(NSInteger)edad usuario:(NSString *)usuario password:(NSString *)password{
    
    NSString *ubicacionDB = [self obtenerRutaBD];
    
    if(!(sqlite3_open([ubicacionDB UTF8String], &bd) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
        return;
    } else {
        NSString *sqlInsert = [NSString stringWithFormat:@"INSERT INTO Usuarios (nombre, correo, edad,user, password) VALUES ('%@','%@', %ld,'%@', '%@')", nombre, correo, edad, usuario, password];
        const char *sql = [sqlInsert UTF8String];
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(bd, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement");
            return;
        } else {
            if(sqlite3_step(sqlStatement) == SQLITE_DONE){
                sqlite3_finalize(sqlStatement);
                sqlite3_close(bd);
            }
        }
        
    }

    
}

//Consulta usuarios en DB

- (NSMutableArray *) obtenerUsuarios{
    
    NSMutableArray *listaUsuarios = [[NSMutableArray alloc] init];
    NSString *ubicacionDB = [self obtenerRutaBD];
    
    if(!(sqlite3_open([ubicacionDB UTF8String], &bd) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
    }
    
    const char *sentenciaSQL = "SELECT id, nombre, correo, edad, user,password FROM Usuarios";
    sqlite3_stmt *sqlStatement;
    
    if(sqlite3_prepare_v2(bd, sentenciaSQL, -1, &sqlStatement, NULL) != SQLITE_OK){
        NSLog(@"Problema al preparar el statement");
    }
    
    while(sqlite3_step(sqlStatement) == SQLITE_ROW){
        Usuario *usuario = [[Usuario alloc] init];
        usuario.ID = sqlite3_column_int(sqlStatement, 0);
        usuario.nombre = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
        usuario.correo = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
        usuario.edad = sqlite3_column_int(sqlStatement, 3);
        usuario.usuario = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 4)];
        usuario.password = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 5)];
        
        
        [listaUsuarios addObject:usuario];
    }
    
    return listaUsuarios;
}

//Actualiza usuarios

- (void) actualizarUsuario: (NSString *) usuario nombre:(NSString *)nombre password:(NSString *)password correo:(NSString *)correo edad:(NSInteger)edad ID:(NSInteger)ID{
    
    NSString *ubicacionBD = [self obtenerRutaBD];
    
    if(!(sqlite3_open([ubicacionBD UTF8String], &bd) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
        return;
    } else {
        NSString *sqlUpdate = [NSString stringWithFormat:@"UPDATE Usuarios SET nombre = '%@', correo = '%@' , edad = %ld , user = '%@', password = '%@' WHERE id = %ld", nombre, correo, edad, usuario, password, ID];
        const char *sql = [sqlUpdate UTF8String];
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(bd, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement.");
            return;
        } else {
            if(sqlite3_step(sqlStatement) == SQLITE_DONE){
                sqlite3_finalize(sqlStatement);
                sqlite3_close(bd);
            }
        }
    }
    
}

// Eliminar un usuario de la DB

- (void) borrarUsuario: (NSInteger) ID{
    
    NSString *ubicacionBD = [self obtenerRutaBD];
    
    if(!(sqlite3_open([ubicacionBD UTF8String], &bd) == SQLITE_OK)){
        NSLog(@"No se puede conectar con la BD");
        return;
    } else {
        NSString *sqlDelete = [NSString stringWithFormat:@"DELETE FROM Usuarios WHERE id = %ld", ID];
        const char *sql = [sqlDelete UTF8String];
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(bd, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement.");
            return;
        } else {
            if(sqlite3_step(sqlStatement) == SQLITE_DONE){
                sqlite3_finalize(sqlStatement);
                sqlite3_close(bd);
            }
        }
    }
    
}




@end
