
#Karen assignment1


##為什麼
###interface
`@property (weak, nonatomic) IBOutlet UIImageView *introImage;`
`@property (weak, nonatomic) IBOutlet UITextView *introText;`


###implementation
`self.introScroll.contentSize = CGSizeMake(1600,120);`

`NSDictionary *picture = [array objectAtIndex:i];`
`NSDictionary *dic = [array objectAtIndex:i];`

`NSURLRequest *request = [NSURLRequest requestWithURL:url
cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                             timeoutInterval:30.0];`

`- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat width = introScroll.frame.size.width;
    NSInteger currentPage = ((introScroll.contentOffset.x - width / 2) / width) + 1;
    [introPageControl setCurrentPage:currentPage];
}`

