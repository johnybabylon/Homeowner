//
//  ItemsViewController.m
//  Homeowner
//
//  Created by Johny Babylon on 11/11/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import "ItemsViewController.h"
#import "THTItem.h"
#import "ItemStore.h"

@interface ItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation ItemsViewController

- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[ItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

//- (instancetype)initWithStyle:(UITableViewStyle)style
//{
//    return [self init];
//}

- (IBAction)addNewItem:(id)sender
{
    
}

- (IBAction)toggleEditingMode:(id)sender
{
    
        // If you are currently in editing mode...
        if (self.isEditing) {
            
            // Change text of button to inform user of state
            [sender setTitle:@"Edit" forState:UIControlStateNormal];
            
            // Turn off editing mode
            [self setEditing:NO animated:YES];
        } else {
            
            // Change text of button to inform user of state
            [sender setTitle:@"Done" forState:UIControlStateNormal];
            
            // Enter editing mode
            [self setEditing:YES animated:YES];
        }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    [self.headerView setAutoresizingMask:UIViewAutoresizingNone];

    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [[[ItemStore sharedStore] allItems] count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  // reuseIdentifier:@"UITableViewCell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    
    NSArray *items = [[ItemStore sharedStore] allItems];
    THTItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

- (UIView *)headerView
{
    if (!_headerView) {
        
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
        
    }
    
    return _headerView;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
