#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModuleDependencies : NSObject

@property(nonatomic, nonnull, copy, readonly) NSURL* url;
@property(nonatomic, nonnull, copy, readonly) UINavigationController* navigationController;

- (instancetype) initWithURL:(NSURL *)url
        navigationController:(UINavigationController *)navigationController;

@end

NS_ASSUME_NONNULL_END
