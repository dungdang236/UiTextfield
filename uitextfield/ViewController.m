//
//  ViewController.m
//  uitextfield
//
//  Created by student on 23/11/2015.
//  Copyright © 2015 dungdang. All rights reserved.
//

#import "ViewController.h"

#pragma mark - Animals
@interface Cat : NSObject
@end

@implementation Cat
- (void) say {
    NSLog(@"Meo meo");
}
- (NSString*) image {
 return @"cat";
}
   
    
    

@end

@interface Dog : NSObject
@end
@implementation Dog
- (void) say {
    NSLog(@"Gau Gau");
}
- (NSString*) image {
    return @"dog";
}

@end

@interface Mouse : NSObject
@end
@implementation Mouse
- (void) say {
    NSLog(@"Chit chit");
}
- (NSString*) image {
    return @"mouse";
}

@end
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *hinhanh;
@property (weak, nonatomic) IBOutlet UITextField *ten;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)gotenconvat:(id)sender {
    
    
}
- (IBAction)timkiem:(id)sender {
   // NSArray* animals = @[@"Cat", @"Dog", @"Mouse", @"Elephant", @"Tiger"];
    
 //
    NSString* input= _ten.text;
    NSString* firstChar = [input substringToIndex:1];
    NSString* result = [[input stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstChar] capitalizedString];
    Class class = NSClassFromString(result);
    if (class == nil) {
    NSLog(@"Non exist class - %@", _ten.text);
        _hinhanh.image = [UIImage imageNamed:@"notfound"];
        return;}
        else{
id object = [class new];
SEL sayMethod = @selector(say);
SEL imageMethod= @selector(image);
if ([object respondsToSelector:sayMethod]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [object performSelector:sayMethod];
    _hinhanh.image= [UIImage imageNamed:[object performSelector:imageMethod]];
#pragma clang diagnostic pop
}}
}
@end
