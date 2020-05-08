//
//  QNFormUpload.m
//  QiniuSDK
//
//  Created by bailong on 15/1/4.
//  Copyright (c) 2015年 Qiniu. All rights reserved.
//

#import "QNFormUpload.h"
#import "QNResponseInfo.h"
#import "QNUploadRequestTranscation.h"

@interface QNFormUpload ()

@property (nonatomic) float previousPercent;

@property(nonatomic, strong)NSArray <id <QNUploadRegion> > *regions;
@property(nonatomic, strong)QNUploadRequestTranscation *uploadTranscation;

@end

@implementation QNFormUpload

- (void)startToUpload {
    
    self.uploadTranscation = [[QNUploadRequestTranscation alloc] initWithConfig:self.config
                                                                   uploadOption:self.option
                                                                         region:[self getCurrentRegion]
                                                                            key:self.key
                                                                          token:self.token];

    __weak typeof(self) weakSelf = self;
    void(^progressHandler)(long long totalBytesWritten, long long totalBytesExpectedToWrite) = ^(long long totalBytesWritten, long long totalBytesExpectedToWrite){
        if (weakSelf.option.progressHandler) {
            float percent = (float)totalBytesWritten / (float)totalBytesExpectedToWrite;
            if (percent > 0.95) {
                percent = 0.95;
            }
            if (percent > self.previousPercent) {
                self.previousPercent = percent;
            } else {
                percent = self.previousPercent;
            }
            weakSelf.option.progressHandler(weakSelf.key, percent);
        }
    };

    [self.uploadTranscation uploadFormData:self.data
                                  fileName:self.fileName
                                  progress:progressHandler
                                  complete:^(QNResponseInfo * _Nullable responseInfo, NSDictionary * _Nullable response) {
        if (responseInfo.isOK) {
            self.option.progressHandler(self.key, 1.0);
            self.completionHandler(responseInfo, self.key, response);
        } else if (responseInfo.couldRetry && self.config.allowBackupHost) {
            [self switchRegionAndUpload];
        } else {
            self.completionHandler(responseInfo, self.key, response);
        }
    }];
}

@end
