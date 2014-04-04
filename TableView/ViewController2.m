//
//  ViewController2.m
//  TableView
//
//  Created by Omnipresent on 20/02/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2
    NSMutableArray *tblImg;
NSMutableArray *tblData;

@synthesize collation;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    tblImg = [dict objectForKey:@"Thumbnail"];
    tblData= [dict objectForKey:@"RecipeName"];
    
    
    UINib * CollectionNib = [UINib nibWithNibName:@"CollectionNib" bundle:nil];
    [self.collation registerNib:CollectionNib  forCellWithReuseIdentifier:@"Mycell"];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(100, 100)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collation setCollectionViewLayout:flowLayout];
  
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *collectionCell = [collation dequeueReusableCellWithReuseIdentifier:@"Mycell" forIndexPath:indexPath];
   
    UIImageView *recipeImageView = (UIImageView *)[collectionCell viewWithTag:200];
    recipeImageView.image = [UIImage imageNamed:[tblImg objectAtIndex:indexPath.row]];
    
    
    UILabel *lblname = (UILabel *)[collectionCell viewWithTag:100];
    lblname.text=[tblData objectAtIndex:indexPath.row];
    collectionCell.backgroundColor=[UIColor redColor];
    return collectionCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
