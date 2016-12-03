//
//  SettingsViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 02/12/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

const NSString *reuseIdentifier = @"SettingsCell";

#import "SettingsViewController.h"
#import "SettingsItem.h"

@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<NSArray <SettingsItem *> *> *contents;

@end

@implementation SettingsViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; ++i) {

        NSMutableArray *subArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < 3; ++j) {

            SettingsItem *item = [[SettingsItem alloc] init];
            item.number = @(j);
            [subArray addObject:item];
        }

        [mutableArray addObject:subArray];
    }

    self.contents = mutableArray;
    
}

- (void)showDetailedWith:(SettingsItem *)settingsItem {
    
    if (self.showDetailedSettings) {
        self.showDetailedSettings(settingsItem);
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.contents count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.contents objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];

    SettingsItem *item = [self itemWithIndexPath:indexPath];

    cell.textLabel.text = [NSString stringWithFormat:@"Settings item #%@", item.number];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Settings #%d", section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    SettingsItem *item = [self itemWithIndexPath:indexPath];

    [self showDetailedWith:item];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Helpers

- (SettingsItem *)itemWithIndexPath:(NSIndexPath *)indexPath {

    return [[self.contents objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];

}



@end
