//
//  QNHttpRequest+SingleRequestRetry.h
//  QiniuSDK
//
//  Created by yangsen on 2020/4/29.
//  Copyright © 2020 Qiniu. All rights reserved.
//

#import "QNHttpRequest.h"

NS_ASSUME_NONNULL_BEGIN

@class QNUploadRequstState, QNResponseInfo, QNConfiguration, QNUploadOption;

@interface QNHttpRequestSingleRetry : NSObject

- (instancetype)initWithConfig:(QNConfiguration *)config
                  uploadOption:(QNUploadOption *)uploadOption
                  requestState:(QNUploadRequstState *)requestState;


/// 网络请求
/// @param request 请求内容
/// @param isSkipDns 请求是否需要跳过Dns 当请求的中配置了IP即可跳过 反之不跳过
/// @param progress 上传进度回调
/// @param complete 上传完成回调
- (void)request:(NSURLRequest *)request
      isSkipDns:(BOOL)isSkipDns
       progress:(void(^)(long long totalBytesWritten, long long totalBytesExpectedToWrite))progress
       complete:(void(^)(QNResponseInfo * _Nullable httpResponseInfo, NSDictionary * _Nullable respBody))complete;

@end

NS_ASSUME_NONNULL_END
