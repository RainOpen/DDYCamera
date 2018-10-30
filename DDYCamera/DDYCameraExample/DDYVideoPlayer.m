#import "DDYVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface DDYVideoPlayer ()

@property (nonatomic ,strong) AVPlayer *player;

@end

@implementation DDYVideoPlayer

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}

- (void)playWithPath:(NSString *)path {
    AVAsset *liveAsset = [AVURLAsset URLAssetWithURL:[NSURL URLWithString:path] options:nil];
    [self setPlayer:[AVPlayer playerWithPlayerItem:[AVPlayerItem playerItemWithAsset:liveAsset]]] ;
    [self.player play];
}

@end
