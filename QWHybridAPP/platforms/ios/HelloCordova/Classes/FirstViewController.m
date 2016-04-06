//
//  FirstViewController.m
//  homezxb
//
//  Created by 乔丹丹 on 16/3/15.
//
//

#import "FirstViewController.h"
#import "MainViewController.h"
#import "ExerciseTwoViewController.h"
#import "ExerciseThreeViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataStr = @"hello,Html+JS+css!";
    self.view.backgroundColor = [UIColor grayColor];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Exercise01" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setFrame:CGRectMake(100, 50, 100, 80)];
    button.tag = 1000+1;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(nextViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"Exercise02" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blueColor]];
    [button2 setFrame:CGRectMake(100, 150, 100, 80)];
    button2.tag = 1000+2;
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(nextViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"Exercise03" forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor blueColor]];
    [button3 setFrame:CGRectMake(100, 250, 100, 80)];
    button3.tag = 1000+3;
    [self.view addSubview:button3];
    [button3 addTarget:self action:@selector(nextViewController:) forControlEvents:UIControlEventTouchUpInside];
}
//跳转到下个页面
- (void)nextViewController:(UIButton *)sender{
    if (sender.tag == 1001) {
        //项目task Exercise
        MainViewController *mainVC = [[MainViewController alloc] init];
        [self.navigationController pushViewController:mainVC animated:YES];
    }else if (sender.tag== 1002){
        //第二个混合开发页面的控制器
        ExerciseTwoViewController * ExerciserTwoVC = [[ExerciseTwoViewController alloc] initWithStartPage:@"index1.html"];
        [self.navigationController pushViewController:ExerciserTwoVC animated:YES];
    }else if (sender.tag == 1003){
        ExerciseThreeViewController * ExerciseThreeVC = [[ExerciseThreeViewController alloc] initWithStartPage:@"index3.html"];
        [self.navigationController pushViewController:ExerciseThreeVC animated:YES];
    }
  }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
