//
//  ItemsViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 28/11/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

const NSString *ItemsReuseIdentifier = @"ItemsCell";

#import "ItemsViewController.h"

#import "Item.h"

@interface ItemsViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<Item *> *items;

@end

@implementation ItemsViewController {
    BOOL authorized;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    authorized = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAdd:)];

    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        Item *item = [[Item alloc] init];
        item.title = [NSString stringWithFormat:@"Title #%d", i];
        item.subtitle = [NSString stringWithFormat:@"Subtitle #%d", i];

        [mutableArray addObject:item];
    }

    self.items = mutableArray;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if (!authorized) {
        
        if (self.authNeeded) {
            self.authNeeded();
        }
        
        authorized = YES;
    }
    
}

- (void)selectWith:(Item *)item {
    
    if (self.onSelection) {
        self.onSelection(item);
    }
}

- (IBAction)actionAdd:(id)sender {
    
    if (self.onCreate) {
        self.onCreate();
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ItemsReuseIdentifier forIndexPath:indexPath];
    
    Item *item = [self.items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.subtitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Item *item = [self.items objectAtIndex:indexPath.row];
    
    [self selectWith:item];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
