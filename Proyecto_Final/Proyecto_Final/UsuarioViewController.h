//
//  UsuarioViewController.h
//  Proyecto_Final
//
//  Created by GHERNANDEZ on 23/07/15.
//  Copyright (c) 2015 GHERNANDEZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioDAO.h"
#import "ActualizarProductosView.h"
#import "Producto.h"

@interface UsuarioViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    UsuarioDAO *dao;
    NSMutableArray *peliculas;
//    Producto *producto;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UsuarioDAO *dao;
@property (nonatomic, strong) NSMutableArray *peliculas;
//@property (nonatomic, strong) Producto *producto;

@end
