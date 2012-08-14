//
//  MoreViewController.h
//  KICKVideo
//
//  Created by 杜 鹏 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface MoreViewController : UITableViewController<MFMailComposeViewControllerDelegate>{

}

@property (nonatomic, strong) NSArray * moreArray;

@end
