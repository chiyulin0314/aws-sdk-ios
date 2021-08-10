//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSChimeSDKMessagingModel.h"
#import "AWSChimeSDKMessagingResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSChimeSDKMessaging
FOUNDATION_EXPORT NSString *const AWSChimeSDKMessagingSDKVersion;

/**
 <p>The Amazon Chime SDK Messaging APIs in this section allow software developers to send and receive messages in custom messaging applications. These APIs depend on the frameworks provided by the Amazon Chime SDK Identity APIs. For more information about the messaging APIs, see .</p>
 */
@interface AWSChimeSDKMessaging : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let ChimeSDKMessaging = AWSChimeSDKMessaging.default()

 *Objective-C*

     AWSChimeSDKMessaging *ChimeSDKMessaging = [AWSChimeSDKMessaging defaultChimeSDKMessaging];

 @return The default service client.
 */
+ (instancetype)defaultChimeSDKMessaging;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSChimeSDKMessaging.register(with: configuration!, forKey: "USWest2ChimeSDKMessaging")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:@"USWest2ChimeSDKMessaging"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ChimeSDKMessaging = AWSChimeSDKMessaging(forKey: "USWest2ChimeSDKMessaging")

 *Objective-C*

     AWSChimeSDKMessaging *ChimeSDKMessaging = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:@"USWest2ChimeSDKMessaging"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerChimeSDKMessagingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerChimeSDKMessagingWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSChimeSDKMessaging.register(with: configuration!, forKey: "USWest2ChimeSDKMessaging")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:@"USWest2ChimeSDKMessaging"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ChimeSDKMessaging = AWSChimeSDKMessaging(forKey: "USWest2ChimeSDKMessaging")

 *Objective-C*

     AWSChimeSDKMessaging *ChimeSDKMessaging = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:@"USWest2ChimeSDKMessaging"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ChimeSDKMessagingForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeChimeSDKMessagingForKey:(NSString *)key;

/**
 <p>Adds a specified number of users to a channel. </p>
 
 @param request A container for the necessary parameters to execute the BatchCreateChannelMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingBatchCreateChannelMembershipResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorServiceFailure`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorThrottledClient`.
 
 @see AWSChimeSDKMessagingBatchCreateChannelMembershipRequest
 @see AWSChimeSDKMessagingBatchCreateChannelMembershipResponse
 */
- (AWSTask<AWSChimeSDKMessagingBatchCreateChannelMembershipResponse *> *)batchCreateChannelMembership:(AWSChimeSDKMessagingBatchCreateChannelMembershipRequest *)request;

/**
 <p>Adds a specified number of users to a channel. </p>
 
 @param request A container for the necessary parameters to execute the BatchCreateChannelMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorServiceFailure`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorThrottledClient`.
 
 @see AWSChimeSDKMessagingBatchCreateChannelMembershipRequest
 @see AWSChimeSDKMessagingBatchCreateChannelMembershipResponse
 */
- (void)batchCreateChannelMembership:(AWSChimeSDKMessagingBatchCreateChannelMembershipRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingBatchCreateChannelMembershipResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a channel to which you can add users and send messages.</p><p><b>Restriction</b>: You can't change a channel's privacy.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingCreateChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorResourceLimitExceeded`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingCreateChannelRequest
 @see AWSChimeSDKMessagingCreateChannelResponse
 */
- (AWSTask<AWSChimeSDKMessagingCreateChannelResponse *> *)createChannel:(AWSChimeSDKMessagingCreateChannelRequest *)request;

/**
 <p>Creates a channel to which you can add users and send messages.</p><p><b>Restriction</b>: You can't change a channel's privacy.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorResourceLimitExceeded`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingCreateChannelRequest
 @see AWSChimeSDKMessagingCreateChannelResponse
 */
- (void)createChannel:(AWSChimeSDKMessagingCreateChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingCreateChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Permanently bans a member from a channel. Moderators can't add banned members to a channel. To undo a ban, you first have to <code>DeleteChannelBan</code>, and then <code>CreateChannelMembership</code>. Bans are cleaned up when you delete users or channels.</p><p>If you ban a user who is already part of a channel, that user is automatically kicked from the channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateChannelBan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingCreateChannelBanResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorResourceLimitExceeded`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingCreateChannelBanRequest
 @see AWSChimeSDKMessagingCreateChannelBanResponse
 */
- (AWSTask<AWSChimeSDKMessagingCreateChannelBanResponse *> *)createChannelBan:(AWSChimeSDKMessagingCreateChannelBanRequest *)request;

/**
 <p>Permanently bans a member from a channel. Moderators can't add banned members to a channel. To undo a ban, you first have to <code>DeleteChannelBan</code>, and then <code>CreateChannelMembership</code>. Bans are cleaned up when you delete users or channels.</p><p>If you ban a user who is already part of a channel, that user is automatically kicked from the channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateChannelBan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorResourceLimitExceeded`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingCreateChannelBanRequest
 @see AWSChimeSDKMessagingCreateChannelBanResponse
 */
- (void)createChannelBan:(AWSChimeSDKMessagingCreateChannelBanRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingCreateChannelBanResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a user to a channel. The <code>InvitedBy</code> response field is derived from the request header. A channel member can:</p><ul><li><p>List messages</p></li><li><p>Send messages</p></li><li><p>Receive messages</p></li><li><p>Edit their own messages</p></li><li><p>Leave the channel</p></li></ul><p>Privacy settings impact this action as follows:</p><ul><li><p>Public Channels: You do not need to be a member to list messages, but you must be a member to send messages.</p></li><li><p>Private Channels: You must be a member to list or send messages.</p></li></ul><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateChannelMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingCreateChannelMembershipResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorResourceLimitExceeded`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingCreateChannelMembershipRequest
 @see AWSChimeSDKMessagingCreateChannelMembershipResponse
 */
- (AWSTask<AWSChimeSDKMessagingCreateChannelMembershipResponse *> *)createChannelMembership:(AWSChimeSDKMessagingCreateChannelMembershipRequest *)request;

/**
 <p>Adds a user to a channel. The <code>InvitedBy</code> response field is derived from the request header. A channel member can:</p><ul><li><p>List messages</p></li><li><p>Send messages</p></li><li><p>Receive messages</p></li><li><p>Edit their own messages</p></li><li><p>Leave the channel</p></li></ul><p>Privacy settings impact this action as follows:</p><ul><li><p>Public Channels: You do not need to be a member to list messages, but you must be a member to send messages.</p></li><li><p>Private Channels: You must be a member to list or send messages.</p></li></ul><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateChannelMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorResourceLimitExceeded`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingCreateChannelMembershipRequest
 @see AWSChimeSDKMessagingCreateChannelMembershipResponse
 */
- (void)createChannelMembership:(AWSChimeSDKMessagingCreateChannelMembershipRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingCreateChannelMembershipResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new <code>ChannelModerator</code>. A channel moderator can:</p><ul><li><p>Add and remove other members of the channel.</p></li><li><p>Add and remove other moderators of the channel.</p></li><li><p>Add and remove user bans for the channel.</p></li><li><p>Redact messages in the channel.</p></li><li><p>List messages in the channel.</p></li></ul><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateChannelModerator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingCreateChannelModeratorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorResourceLimitExceeded`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingCreateChannelModeratorRequest
 @see AWSChimeSDKMessagingCreateChannelModeratorResponse
 */
- (AWSTask<AWSChimeSDKMessagingCreateChannelModeratorResponse *> *)createChannelModerator:(AWSChimeSDKMessagingCreateChannelModeratorRequest *)request;

/**
 <p>Creates a new <code>ChannelModerator</code>. A channel moderator can:</p><ul><li><p>Add and remove other members of the channel.</p></li><li><p>Add and remove other moderators of the channel.</p></li><li><p>Add and remove user bans for the channel.</p></li><li><p>Redact messages in the channel.</p></li><li><p>List messages in the channel.</p></li></ul><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateChannelModerator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorResourceLimitExceeded`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingCreateChannelModeratorRequest
 @see AWSChimeSDKMessagingCreateChannelModeratorResponse
 */
- (void)createChannelModerator:(AWSChimeSDKMessagingCreateChannelModeratorRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingCreateChannelModeratorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Immediately makes a channel and its memberships inaccessible and marks them for deletion. This is an irreversible process.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelRequest
 */
- (AWSTask *)deleteChannel:(AWSChimeSDKMessagingDeleteChannelRequest *)request;

/**
 <p>Immediately makes a channel and its memberships inaccessible and marks them for deletion. This is an irreversible process.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelRequest
 */
- (void)deleteChannel:(AWSChimeSDKMessagingDeleteChannelRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a user from a channel's ban list.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannelBan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelBanRequest
 */
- (AWSTask *)deleteChannelBan:(AWSChimeSDKMessagingDeleteChannelBanRequest *)request;

/**
 <p>Removes a user from a channel's ban list.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannelBan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelBanRequest
 */
- (void)deleteChannelBan:(AWSChimeSDKMessagingDeleteChannelBanRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a member from a channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannelMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelMembershipRequest
 */
- (AWSTask *)deleteChannelMembership:(AWSChimeSDKMessagingDeleteChannelMembershipRequest *)request;

/**
 <p>Removes a member from a channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannelMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelMembershipRequest
 */
- (void)deleteChannelMembership:(AWSChimeSDKMessagingDeleteChannelMembershipRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a channel message. Only admins can perform this action. Deletion makes messages inaccessible immediately. A background process deletes any revisions created by <code>UpdateChannelMessage</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannelMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelMessageRequest
 */
- (AWSTask *)deleteChannelMessage:(AWSChimeSDKMessagingDeleteChannelMessageRequest *)request;

/**
 <p>Deletes a channel message. Only admins can perform this action. Deletion makes messages inaccessible immediately. A background process deletes any revisions created by <code>UpdateChannelMessage</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannelMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelMessageRequest
 */
- (void)deleteChannelMessage:(AWSChimeSDKMessagingDeleteChannelMessageRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a channel moderator.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannelModerator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelModeratorRequest
 */
- (AWSTask *)deleteChannelModerator:(AWSChimeSDKMessagingDeleteChannelModeratorRequest *)request;

/**
 <p>Deletes a channel moderator.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteChannelModerator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDeleteChannelModeratorRequest
 */
- (void)deleteChannelModerator:(AWSChimeSDKMessagingDeleteChannelModeratorRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns the full details of a channel in an Amazon Chime <code>AppInstance</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingDescribeChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelRequest
 @see AWSChimeSDKMessagingDescribeChannelResponse
 */
- (AWSTask<AWSChimeSDKMessagingDescribeChannelResponse *> *)describeChannel:(AWSChimeSDKMessagingDescribeChannelRequest *)request;

/**
 <p>Returns the full details of a channel in an Amazon Chime <code>AppInstance</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelRequest
 @see AWSChimeSDKMessagingDescribeChannelResponse
 */
- (void)describeChannel:(AWSChimeSDKMessagingDescribeChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingDescribeChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the full details of a channel ban.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelBan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingDescribeChannelBanResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorNotFound`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelBanRequest
 @see AWSChimeSDKMessagingDescribeChannelBanResponse
 */
- (AWSTask<AWSChimeSDKMessagingDescribeChannelBanResponse *> *)describeChannelBan:(AWSChimeSDKMessagingDescribeChannelBanRequest *)request;

/**
 <p>Returns the full details of a channel ban.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelBan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorNotFound`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelBanRequest
 @see AWSChimeSDKMessagingDescribeChannelBanResponse
 */
- (void)describeChannelBan:(AWSChimeSDKMessagingDescribeChannelBanRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingDescribeChannelBanResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the full details of a user's channel membership.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelMembership service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingDescribeChannelMembershipResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorNotFound`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelMembershipRequest
 @see AWSChimeSDKMessagingDescribeChannelMembershipResponse
 */
- (AWSTask<AWSChimeSDKMessagingDescribeChannelMembershipResponse *> *)describeChannelMembership:(AWSChimeSDKMessagingDescribeChannelMembershipRequest *)request;

/**
 <p>Returns the full details of a user's channel membership.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelMembership service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorNotFound`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelMembershipRequest
 @see AWSChimeSDKMessagingDescribeChannelMembershipResponse
 */
- (void)describeChannelMembership:(AWSChimeSDKMessagingDescribeChannelMembershipRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingDescribeChannelMembershipResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the details of a channel based on the membership of the specified <code>AppInstanceUser</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelMembershipForAppInstanceUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest
 @see AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse
 */
- (AWSTask<AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse *> *)describeChannelMembershipForAppInstanceUser:(AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest *)request;

/**
 <p> Returns the details of a channel based on the membership of the specified <code>AppInstanceUser</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelMembershipForAppInstanceUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest
 @see AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse
 */
- (void)describeChannelMembershipForAppInstanceUser:(AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the full details of a channel moderated by the specified <code>AppInstanceUser</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelModeratedByAppInstanceUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest
 @see AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse
 */
- (AWSTask<AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse *> *)describeChannelModeratedByAppInstanceUser:(AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest *)request;

/**
 <p>Returns the full details of a channel moderated by the specified <code>AppInstanceUser</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelModeratedByAppInstanceUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest
 @see AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse
 */
- (void)describeChannelModeratedByAppInstanceUser:(AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the full details of a single ChannelModerator.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelModerator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingDescribeChannelModeratorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorNotFound`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelModeratorRequest
 @see AWSChimeSDKMessagingDescribeChannelModeratorResponse
 */
- (AWSTask<AWSChimeSDKMessagingDescribeChannelModeratorResponse *> *)describeChannelModerator:(AWSChimeSDKMessagingDescribeChannelModeratorRequest *)request;

/**
 <p>Returns the full details of a single ChannelModerator.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeChannelModerator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorNotFound`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingDescribeChannelModeratorRequest
 @see AWSChimeSDKMessagingDescribeChannelModeratorResponse
 */
- (void)describeChannelModerator:(AWSChimeSDKMessagingDescribeChannelModeratorRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingDescribeChannelModeratorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the full details of a channel message.</p><note><p>The x-amz-chime-bearer request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the GetChannelMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingGetChannelMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorNotFound`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingGetChannelMessageRequest
 @see AWSChimeSDKMessagingGetChannelMessageResponse
 */
- (AWSTask<AWSChimeSDKMessagingGetChannelMessageResponse *> *)getChannelMessage:(AWSChimeSDKMessagingGetChannelMessageRequest *)request;

/**
 <p>Gets the full details of a channel message.</p><note><p>The x-amz-chime-bearer request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the GetChannelMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorNotFound`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingGetChannelMessageRequest
 @see AWSChimeSDKMessagingGetChannelMessageResponse
 */
- (void)getChannelMessage:(AWSChimeSDKMessagingGetChannelMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingGetChannelMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The details of the endpoint for the messaging session.</p>
 
 @param request A container for the necessary parameters to execute the GetMessagingSessionEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingGetMessagingSessionEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingGetMessagingSessionEndpointRequest
 @see AWSChimeSDKMessagingGetMessagingSessionEndpointResponse
 */
- (AWSTask<AWSChimeSDKMessagingGetMessagingSessionEndpointResponse *> *)getMessagingSessionEndpoint:(AWSChimeSDKMessagingGetMessagingSessionEndpointRequest *)request;

/**
 <p>The details of the endpoint for the messaging session.</p>
 
 @param request A container for the necessary parameters to execute the GetMessagingSessionEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingGetMessagingSessionEndpointRequest
 @see AWSChimeSDKMessagingGetMessagingSessionEndpointResponse
 */
- (void)getMessagingSessionEndpoint:(AWSChimeSDKMessagingGetMessagingSessionEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingGetMessagingSessionEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the users banned from a particular channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelBans service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingListChannelBansResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelBansRequest
 @see AWSChimeSDKMessagingListChannelBansResponse
 */
- (AWSTask<AWSChimeSDKMessagingListChannelBansResponse *> *)listChannelBans:(AWSChimeSDKMessagingListChannelBansRequest *)request;

/**
 <p>Lists all the users banned from a particular channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelBans service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelBansRequest
 @see AWSChimeSDKMessagingListChannelBansResponse
 */
- (void)listChannelBans:(AWSChimeSDKMessagingListChannelBansRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingListChannelBansResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all channel memberships in a channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelMemberships service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingListChannelMembershipsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelMembershipsRequest
 @see AWSChimeSDKMessagingListChannelMembershipsResponse
 */
- (AWSTask<AWSChimeSDKMessagingListChannelMembershipsResponse *> *)listChannelMemberships:(AWSChimeSDKMessagingListChannelMembershipsRequest *)request;

/**
 <p>Lists all channel memberships in a channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelMemberships service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelMembershipsRequest
 @see AWSChimeSDKMessagingListChannelMembershipsResponse
 */
- (void)listChannelMemberships:(AWSChimeSDKMessagingListChannelMembershipsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingListChannelMembershipsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists all channels that a particular <code>AppInstanceUser</code> is a part of. Only an <code>AppInstanceAdmin</code> can call the API with a user ARN that is not their own. </p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelMembershipsForAppInstanceUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest
 @see AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse
 */
- (AWSTask<AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse *> *)listChannelMembershipsForAppInstanceUser:(AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest *)request;

/**
 <p> Lists all channels that a particular <code>AppInstanceUser</code> is a part of. Only an <code>AppInstanceAdmin</code> can call the API with a user ARN that is not their own. </p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelMembershipsForAppInstanceUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest
 @see AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse
 */
- (void)listChannelMembershipsForAppInstanceUser:(AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all the messages in a channel. Returns a paginated list of <code>ChannelMessages</code>. By default, sorted by creation timestamp in descending order.</p><note><p>Redacted messages appear in the results as empty, since they are only redacted, not deleted. Deleted messages do not appear in the results. This action always returns the latest version of an edited message.</p><p>Also, the x-amz-chime-bearer request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelMessages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingListChannelMessagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelMessagesRequest
 @see AWSChimeSDKMessagingListChannelMessagesResponse
 */
- (AWSTask<AWSChimeSDKMessagingListChannelMessagesResponse *> *)listChannelMessages:(AWSChimeSDKMessagingListChannelMessagesRequest *)request;

/**
 <p>List all the messages in a channel. Returns a paginated list of <code>ChannelMessages</code>. By default, sorted by creation timestamp in descending order.</p><note><p>Redacted messages appear in the results as empty, since they are only redacted, not deleted. Deleted messages do not appear in the results. This action always returns the latest version of an edited message.</p><p>Also, the x-amz-chime-bearer request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelMessages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelMessagesRequest
 @see AWSChimeSDKMessagingListChannelMessagesResponse
 */
- (void)listChannelMessages:(AWSChimeSDKMessagingListChannelMessagesRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingListChannelMessagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the moderators for a channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelModerators service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingListChannelModeratorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelModeratorsRequest
 @see AWSChimeSDKMessagingListChannelModeratorsResponse
 */
- (AWSTask<AWSChimeSDKMessagingListChannelModeratorsResponse *> *)listChannelModerators:(AWSChimeSDKMessagingListChannelModeratorsRequest *)request;

/**
 <p>Lists all the moderators for a channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelModerators service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelModeratorsRequest
 @see AWSChimeSDKMessagingListChannelModeratorsResponse
 */
- (void)listChannelModerators:(AWSChimeSDKMessagingListChannelModeratorsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingListChannelModeratorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all Channels created under a single Chime App as a paginated list. You can specify filters to narrow results.</p><p class="title"><b>Functionality &amp; restrictions</b></p><ul><li><p>Use privacy = <code>PUBLIC</code> to retrieve all public channels in the account.</p></li><li><p>Only an <code>AppInstanceAdmin</code> can set privacy = <code>PRIVATE</code> to list the private channels in an account.</p></li></ul><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingListChannelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelsRequest
 @see AWSChimeSDKMessagingListChannelsResponse
 */
- (AWSTask<AWSChimeSDKMessagingListChannelsResponse *> *)listChannels:(AWSChimeSDKMessagingListChannelsRequest *)request;

/**
 <p>Lists all Channels created under a single Chime App as a paginated list. You can specify filters to narrow results.</p><p class="title"><b>Functionality &amp; restrictions</b></p><ul><li><p>Use privacy = <code>PUBLIC</code> to retrieve all public channels in the account.</p></li><li><p>Only an <code>AppInstanceAdmin</code> can set privacy = <code>PRIVATE</code> to list the private channels in an account.</p></li></ul><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelsRequest
 @see AWSChimeSDKMessagingListChannelsResponse
 */
- (void)listChannels:(AWSChimeSDKMessagingListChannelsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingListChannelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A list of the channels moderated by an <code>AppInstanceUser</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelsModeratedByAppInstanceUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest
 @see AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse
 */
- (AWSTask<AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse *> *)listChannelsModeratedByAppInstanceUser:(AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest *)request;

/**
 <p>A list of the channels moderated by an <code>AppInstanceUser</code>.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the ListChannelsModeratedByAppInstanceUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest
 @see AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse
 */
- (void)listChannelsModeratedByAppInstanceUser:(AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Redacts message content, but not metadata. The message exists in the back end, but the action returns null content, and the state shows as redacted.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the RedactChannelMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingRedactChannelMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingRedactChannelMessageRequest
 @see AWSChimeSDKMessagingRedactChannelMessageResponse
 */
- (AWSTask<AWSChimeSDKMessagingRedactChannelMessageResponse *> *)redactChannelMessage:(AWSChimeSDKMessagingRedactChannelMessageRequest *)request;

/**
 <p>Redacts message content, but not metadata. The message exists in the back end, but the action returns null content, and the state shows as redacted.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the RedactChannelMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingRedactChannelMessageRequest
 @see AWSChimeSDKMessagingRedactChannelMessageResponse
 */
- (void)redactChannelMessage:(AWSChimeSDKMessagingRedactChannelMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingRedactChannelMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a message to a particular channel that the member is a part of.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p><p>Also, <code>STANDARD</code> messages can contain 4KB of data and the 1KB of metadata. <code>CONTROL</code> messages can contain 30 bytes of data and no metadata.</p></note>
 
 @param request A container for the necessary parameters to execute the SendChannelMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingSendChannelMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingSendChannelMessageRequest
 @see AWSChimeSDKMessagingSendChannelMessageResponse
 */
- (AWSTask<AWSChimeSDKMessagingSendChannelMessageResponse *> *)sendChannelMessage:(AWSChimeSDKMessagingSendChannelMessageRequest *)request;

/**
 <p>Sends a message to a particular channel that the member is a part of.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p><p>Also, <code>STANDARD</code> messages can contain 4KB of data and the 1KB of metadata. <code>CONTROL</code> messages can contain 30 bytes of data and no metadata.</p></note>
 
 @param request A container for the necessary parameters to execute the SendChannelMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingSendChannelMessageRequest
 @see AWSChimeSDKMessagingSendChannelMessageResponse
 */
- (void)sendChannelMessage:(AWSChimeSDKMessagingSendChannelMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingSendChannelMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update a channel's attributes.</p><p><b>Restriction</b>: You can't change a channel's privacy. </p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateChannel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingUpdateChannelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingUpdateChannelRequest
 @see AWSChimeSDKMessagingUpdateChannelResponse
 */
- (AWSTask<AWSChimeSDKMessagingUpdateChannelResponse *> *)updateChannel:(AWSChimeSDKMessagingUpdateChannelRequest *)request;

/**
 <p>Update a channel's attributes.</p><p><b>Restriction</b>: You can't change a channel's privacy. </p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateChannel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingUpdateChannelRequest
 @see AWSChimeSDKMessagingUpdateChannelResponse
 */
- (void)updateChannel:(AWSChimeSDKMessagingUpdateChannelRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingUpdateChannelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the content of a message.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateChannelMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingUpdateChannelMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingUpdateChannelMessageRequest
 @see AWSChimeSDKMessagingUpdateChannelMessageResponse
 */
- (AWSTask<AWSChimeSDKMessagingUpdateChannelMessageResponse *> *)updateChannelMessage:(AWSChimeSDKMessagingUpdateChannelMessageRequest *)request;

/**
 <p>Updates the content of a message.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateChannelMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingUpdateChannelMessageRequest
 @see AWSChimeSDKMessagingUpdateChannelMessageResponse
 */
- (void)updateChannelMessage:(AWSChimeSDKMessagingUpdateChannelMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingUpdateChannelMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The details of the time when a user last read messages in a channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateChannelReadMarker service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKMessagingUpdateChannelReadMarkerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingUpdateChannelReadMarkerRequest
 @see AWSChimeSDKMessagingUpdateChannelReadMarkerResponse
 */
- (AWSTask<AWSChimeSDKMessagingUpdateChannelReadMarkerResponse *> *)updateChannelReadMarker:(AWSChimeSDKMessagingUpdateChannelReadMarkerRequest *)request;

/**
 <p>The details of the time when a user last read messages in a channel.</p><note><p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateChannelReadMarker service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKMessagingErrorDomain` domain and the following error code: `AWSChimeSDKMessagingErrorBadRequest`, `AWSChimeSDKMessagingErrorForbidden`, `AWSChimeSDKMessagingErrorConflict`, `AWSChimeSDKMessagingErrorUnauthorizedClient`, `AWSChimeSDKMessagingErrorThrottledClient`, `AWSChimeSDKMessagingErrorServiceUnavailable`, `AWSChimeSDKMessagingErrorServiceFailure`.
 
 @see AWSChimeSDKMessagingUpdateChannelReadMarkerRequest
 @see AWSChimeSDKMessagingUpdateChannelReadMarkerResponse
 */
- (void)updateChannelReadMarker:(AWSChimeSDKMessagingUpdateChannelReadMarkerRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKMessagingUpdateChannelReadMarkerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
