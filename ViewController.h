//
//  ViewController.h
//  TableView
//
//  Created by Omnipresent on 17/02/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"
@interface ViewController : UIViewController{
    UITableView *tblObj;
    ViewController2 *vc2;
    
}


@property (strong, nonatomic) IBOutlet UITableView * tblObj;
@end
