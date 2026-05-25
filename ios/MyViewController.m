//
//  MyViewController.m
//  FaceRN
//

#import "MyViewController.h"
#import "FaceRN-Swift.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MyViewController";

    // 中间红色标签
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"这是原生页面";
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:titleLabel];

    [NSLayoutConstraint activateConstraints:@[
        [titleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [titleLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
    ]];

    // 关闭按钮
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    closeButton.titleLabel.font = [UIFont systemFontOfSize:18];
    closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [closeButton addTarget:self action:@selector(closeTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];

    [NSLayoutConstraint activateConstraints:@[
        [closeButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [closeButton.topAnchor constraintEqualToAnchor:titleLabel.bottomAnchor constant:40],
    ]];
}

- (void)closeTapped {
//    [self dismissViewControllerAnimated:YES completion:nil];
  FaceImportController *faceVC = [[FaceImportController alloc] init];
  [self presentViewController:faceVC animated:YES completion:nil];
}

@end
