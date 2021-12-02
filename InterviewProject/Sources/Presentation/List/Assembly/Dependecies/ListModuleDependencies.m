#import "ListModuleDependencies.h"

@implementation ListModuleDependencies

- (instancetype) initWithURL:(NSURL *)url
        navigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        _url = url;
        _navigationController = navigationController;
    }
    return self;
}

@end
