//
// Copyright (c) 2014 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "APProgressHUD.h"

#import "ViewController.h"

//-------------------------------------------------------------------------------------------------------------------------------------------------
@interface ViewController()
{
	NSMutableArray *items;
}

@property (strong, nonatomic) IBOutlet UITableViewCell *cellText;

@end
//-------------------------------------------------------------------------------------------------------------------------------------------------

@implementation ViewController

@synthesize cellText;

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidLoad
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[super viewDidLoad];
	self.title = @"Related Code";

	items = [[NSMutableArray alloc] init];
	[items addObject:@"Dismiss HUD"];
	[items addObject:@"No status"];
	[items addObject:@"Some status"];
	[items addObject:@"Long status"];
    [items addObject:@"Status and text"];
	[items addObject:@"Success with status"];
	[items addObject:@"Success without status"];
    [items addObject:@"Success with status and text"];
	[items addObject:@"Error with status"];
	[items addObject:@"Error without status"];
    
    [[UIActivityIndicatorView appearance] setColor:[UIColor blueColor]];

}

#pragma mark - Table view data source

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	return 2;
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	if (section == 0) return 2;
	if (section == 1) return [items count];
	return 0;
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	return 44;
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	if (indexPath.section == 0)
	{
		if (indexPath.row == 0) return cellText;
		if (indexPath.row == 1) return [self tableView:tableView cellWithText:@"Dismiss Keyboard"];
	}
	if (indexPath.section == 1)
	{
		return [self tableView:tableView cellWithText:items[indexPath.row]];
	}
	return nil;
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellWithText:(NSString *)text
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
	cell.textLabel.text = text;
	return cell;
}

#pragma mark - Table view delegate

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	if (indexPath.section == 0)
	{
		if (indexPath.row == 1)
		{
			[self.view endEditing:YES];
		}
	}
	if (indexPath.section == 1)
	{
		switch (indexPath.row)
		{
			case 0: [APProgressHUD dismiss]; break;
			case 1: [APProgressHUD show:nil]; break;
			case 2: [APProgressHUD show:@"Please wait..."]; break;
			case 3: [APProgressHUD show:@"Please wait. We need some more time to work out this situation."]; break;
            case 4: [APProgressHUD show:@"Please wait..." text:@"Finding your stuff"]; break;
			case 5: [APProgressHUD showSuccess:@"That was great!"]; break;
			case 6: [APProgressHUD showSuccess:nil]; break;
            case 7: [APProgressHUD showSuccess:@"Success" text:@"You just won a Macbook"]; break;
			case 8: [APProgressHUD showError:@"Something went wrong."]; break;
			case 9: [APProgressHUD showError:nil]; break;
		}
	}
}

@end
