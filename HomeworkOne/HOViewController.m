//
//  HOViewController.m
//  HomeworkOne
//
//  Created by Karen on 2014/8/13.
//  Copyright (c) 2014年 livebricks. All rights reserved.
//

#import "HOViewController.h"

@interface HOViewController ()

@end

@implementation HOViewController
@synthesize introScroll;
@synthesize introImage;
@synthesize introText;


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
    // Do any additional setup after loading the view from its nib.
    
    //self.introScroll.delegate = self; //karen mark it.
    self.introScroll.backgroundColor = [UIColor clearColor];
    self.introScroll.contentSize = CGSizeMake(1600,120);
    self.introScroll.pagingEnabled = YES;
    self.introScroll.showsHorizontalScrollIndicator = NO;
    self.introScroll.bounces = YES;
    self.introScroll.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:self.introScroll];
    //test
    //Trace request
    NSArray *array = [self locationsFromJSONFile:[NSURL URLWithString:@"http://www.indexbricks.com/data/get_update.php?function_code=Intro&store=livebricks&version=0&language=TW"]];
    int page = [array count];
    NSDictionary *dic = [array objectAtIndex:0];
    NSString *str = [dic objectForKey:@"description"];
    NSLog(@"str:%@",str);
    self.introText.text = str;
    self.introText.editable = NO;
    for(int i=0; i<page;i++){
 
    NSDictionary *picture = [array objectAtIndex:i];
        NSString *img_str = [picture objectForKey:@"image_url"];
        NSLog(@"str:%@",img_str);
        self.introImage.image =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:img_str]]];
        NSDictionary *dic = [array objectAtIndex:i];
        NSString *str = [dic objectForKey:@"description"];
        NSLog(@"str:%@",str);
        self.introText.text = str;
        
    }
    
    

    

// use code to write scrollview not with xib.
// UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];

    
    
}
- (NSArray *)locationsFromJSONFile:(NSURL *)url {
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                             timeoutInterval:30.0];
    // Get the data
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    // Create a new array to hold the locations
    //    NSMutableArray *locations = [[NSMutableArray alloc] init];
    
    // Get an array of dictionaries with the key "locations"
    NSArray *array = [jsonDictionary objectForKey:@"livebricks"];
//    // Iterate through the array of dictionaries
//    for(NSDictionary *dict in array) {
//        // Create a new Location object for each one and initialise it with information in the dictionary
//         }
//
//    // Return the array of Location objects
    //return locations;
    return array;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
