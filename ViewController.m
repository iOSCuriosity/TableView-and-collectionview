//
//  ViewController.m
//  TableView
//
//  Created by Omnipresent on 17/02/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray *tblData;
    NSMutableArray *tblImg;
}
@synthesize tblObj;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //tblData = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    //tblImg = [NSArray arrayWithObjects:@"1.jpeg",@"2.jpeg",@"3.jpeg",@"4.png", nil];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    tblData = [dict objectForKey:@"RecipeName"];
    tblImg = [dict objectForKey:@"Thumbnail"];
    vc2=[[ViewController2 alloc] initWithNibName:@"ViewController2" bundle:nil];
    
    // Do any additional setup after loading the view from its nib.
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tblData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *tblViewCell = [ tableView 	dequeueReusableCellWithIdentifier:@"myCell"];
    if (tblViewCell == nil) {
        tblViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"myCell"];
        
    }
    
    tblViewCell.textLabel.text = [tblData objectAtIndex:indexPath.row];
    //tblViewCell.detailTextLabel.text = @"Detail1";
    tblViewCell.imageView.image = [UIImage imageNamed:[tblImg objectAtIndex:indexPath.row]];
    return tblViewCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    
    [messageAlert show];*/
    UITableViewCell *tblViewCell = [tblObj cellForRowAtIndexPath:indexPath];
    tblViewCell.accessoryType = UITableViewCellAccessoryNone;
    
    tblViewCell.accessoryType = UITableViewCellAccessoryCheckmark;
    [self.navigationController pushViewController:vc2 animated:YES];
    
    
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog( @"commitediting called");
    [tblData removeObjectAtIndex:indexPath.row];
    [tblObj reloadData];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
