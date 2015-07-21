//
//  Usuario.h
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 21/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject{
    NSInteger ID;
    NSString *nombre;
    NSString *correo;
    NSInteger edad;
    NSString *usuario;
    NSString *password;
}

@property(nonatomic, assign) NSInteger ID;
@property(nonatomic, retain) NSString *nombre;
@property(nonatomic, retain) NSString *correo;
@property(nonatomic, assign) NSInteger edad;
@property(nonatomic, retain) NSString *usuario;
@property(nonatomic, retain) NSString *password;

@end
