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

#import "AWSChimeSDKMessagingResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSChimeSDKMessagingResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSChimeSDKMessagingResources

+ (instancetype)sharedInstance {
    static AWSChimeSDKMessagingResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSChimeSDKMessagingResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2021-05-15\",\
    \"endpointPrefix\":\"messaging-chime\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"Amazon Chime SDK Messaging\",\
    \"serviceId\":\"Chime SDK Messaging\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"chime\",\
    \"uid\":\"chime-sdk-messaging-2021-05-15\"\
  },\
  \"operations\":{\
    \"AssociateChannelFlow\":{\
      \"name\":\"AssociateChannelFlow\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/channels/{channelArn}/channel-flow\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"AssociateChannelFlowRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Associates a channel flow with a channel. Once associated, all messages to that channel go through channel flow processors. To stop processing, use the <code>DisassociateChannelFlow</code> API.</p> <note> <p>Only administrators or channel moderators can associate a channel flow. The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"BatchCreateChannelMembership\":{\
      \"name\":\"BatchCreateChannelMembership\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/channels/{channelArn}/memberships?operation=batch-create\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchCreateChannelMembershipRequest\"},\
      \"output\":{\"shape\":\"BatchCreateChannelMembershipResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceFailureException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"}\
      ],\
      \"documentation\":\"<p>Adds a specified number of users to a channel. </p>\"\
    },\
    \"ChannelFlowCallback\":{\
      \"name\":\"ChannelFlowCallback\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/channels/{channelArn}?operation=channel-flow-callback\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ChannelFlowCallbackRequest\"},\
      \"output\":{\"shape\":\"ChannelFlowCallbackResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Calls back Chime SDK Messaging with a processing response message. This should be invoked from the processor Lambda. This is a developer API.</p> <p>You can return one of the following processing responses:</p> <ul> <li> <p>Update message content or metadata</p> </li> <li> <p>Deny a message</p> </li> <li> <p>Make no changes to the message</p> </li> </ul>\"\
    },\
    \"CreateChannel\":{\
      \"name\":\"CreateChannel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/channels\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateChannelRequest\"},\
      \"output\":{\"shape\":\"CreateChannelResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a channel to which you can add users and send messages.</p> <p> <b>Restriction</b>: You can't change a channel's privacy.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"CreateChannelBan\":{\
      \"name\":\"CreateChannelBan\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/channels/{channelArn}/bans\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateChannelBanRequest\"},\
      \"output\":{\"shape\":\"CreateChannelBanResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Permanently bans a member from a channel. Moderators can't add banned members to a channel. To undo a ban, you first have to <code>DeleteChannelBan</code>, and then <code>CreateChannelMembership</code>. Bans are cleaned up when you delete users or channels.</p> <p>If you ban a user who is already part of a channel, that user is automatically kicked from the channel.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"CreateChannelFlow\":{\
      \"name\":\"CreateChannelFlow\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/channel-flows\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateChannelFlowRequest\"},\
      \"output\":{\"shape\":\"CreateChannelFlowResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a channel flow, a container for processors. Processors are AWS Lambda functions that perform actions on chat messages, such as stripping out profanity. You can associate channel flows with channels, and the processors in the channel flow then take action on all messages sent to that channel. This is a developer API.</p> <p>Channel flows process the following items:</p> <ol> <li> <p>New and updated messages</p> </li> <li> <p>Persistent and non-persistent messages</p> </li> <li> <p>The Standard message type</p> </li> </ol> <note> <p>Channel flows don't process Control or System messages. For more information about the message types provided by Chime SDK Messaging, refer to <a href=\\\"https://docs.aws.amazon.com/chime/latest/dg/using-the-messaging-sdk.html#msg-types\\\">Message types</a> in the <i>Amazon Chime developer guide</i>.</p> </note>\"\
    },\
    \"CreateChannelMembership\":{\
      \"name\":\"CreateChannelMembership\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/channels/{channelArn}/memberships\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateChannelMembershipRequest\"},\
      \"output\":{\"shape\":\"CreateChannelMembershipResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Adds a user to a channel. The <code>InvitedBy</code> field in <code>ChannelMembership</code> is derived from the request header. A channel member can:</p> <ul> <li> <p>List messages</p> </li> <li> <p>Send messages</p> </li> <li> <p>Receive messages</p> </li> <li> <p>Edit their own messages</p> </li> <li> <p>Leave the channel</p> </li> </ul> <p>Privacy settings impact this action as follows:</p> <ul> <li> <p>Public Channels: You do not need to be a member to list messages, but you must be a member to send messages.</p> </li> <li> <p>Private Channels: You must be a member to list or send messages.</p> </li> </ul> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"CreateChannelModerator\":{\
      \"name\":\"CreateChannelModerator\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/channels/{channelArn}/moderators\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateChannelModeratorRequest\"},\
      \"output\":{\"shape\":\"CreateChannelModeratorResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a new <code>ChannelModerator</code>. A channel moderator can:</p> <ul> <li> <p>Add and remove other members of the channel.</p> </li> <li> <p>Add and remove other moderators of the channel.</p> </li> <li> <p>Add and remove user bans for the channel.</p> </li> <li> <p>Redact messages in the channel.</p> </li> <li> <p>List messages in the channel.</p> </li> </ul> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DeleteChannel\":{\
      \"name\":\"DeleteChannel\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/channels/{channelArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteChannelRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Immediately makes a channel and its memberships inaccessible and marks them for deletion. This is an irreversible process.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DeleteChannelBan\":{\
      \"name\":\"DeleteChannelBan\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/channels/{channelArn}/bans/{memberArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteChannelBanRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes a user from a channel's ban list.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DeleteChannelFlow\":{\
      \"name\":\"DeleteChannelFlow\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/channel-flows/{channelFlowArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteChannelFlowRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a channel flow, an irreversible process. This is a developer API.</p> <note> <p> This API works only when the channel flow is not associated with any channel. To get a list of all channels that a channel flow is associated with, use the <code>ListChannelsAssociatedWithChannelFlow</code> API. Use the <code>DisassociateChannelFlow</code> API to disassociate a channel flow from all channels. </p> </note>\"\
    },\
    \"DeleteChannelMembership\":{\
      \"name\":\"DeleteChannelMembership\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/channels/{channelArn}/memberships/{memberArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteChannelMembershipRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes a member from a channel.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DeleteChannelMessage\":{\
      \"name\":\"DeleteChannelMessage\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/channels/{channelArn}/messages/{messageId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteChannelMessageRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a channel message. Only admins can perform this action. Deletion makes messages inaccessible immediately. A background process deletes any revisions created by <code>UpdateChannelMessage</code>.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DeleteChannelModerator\":{\
      \"name\":\"DeleteChannelModerator\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/channels/{channelArn}/moderators/{channelModeratorArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteChannelModeratorRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a channel moderator.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DescribeChannel\":{\
      \"name\":\"DescribeChannel\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeChannelRequest\"},\
      \"output\":{\"shape\":\"DescribeChannelResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of a channel in an Amazon Chime <code>AppInstance</code>.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DescribeChannelBan\":{\
      \"name\":\"DescribeChannelBan\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/bans/{memberArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeChannelBanRequest\"},\
      \"output\":{\"shape\":\"DescribeChannelBanResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of a channel ban.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DescribeChannelFlow\":{\
      \"name\":\"DescribeChannelFlow\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channel-flows/{channelFlowArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeChannelFlowRequest\"},\
      \"output\":{\"shape\":\"DescribeChannelFlowResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of a channel flow in an Amazon Chime <code>AppInstance</code>. This is a developer API.</p>\"\
    },\
    \"DescribeChannelMembership\":{\
      \"name\":\"DescribeChannelMembership\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/memberships/{memberArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeChannelMembershipRequest\"},\
      \"output\":{\"shape\":\"DescribeChannelMembershipResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of a user's channel membership.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DescribeChannelMembershipForAppInstanceUser\":{\
      \"name\":\"DescribeChannelMembershipForAppInstanceUser\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}?scope=app-instance-user-membership\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeChannelMembershipForAppInstanceUserRequest\"},\
      \"output\":{\"shape\":\"DescribeChannelMembershipForAppInstanceUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Returns the details of a channel based on the membership of the specified <code>AppInstanceUser</code>.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DescribeChannelModeratedByAppInstanceUser\":{\
      \"name\":\"DescribeChannelModeratedByAppInstanceUser\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}?scope=app-instance-user-moderated-channel\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeChannelModeratedByAppInstanceUserRequest\"},\
      \"output\":{\"shape\":\"DescribeChannelModeratedByAppInstanceUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of a channel moderated by the specified <code>AppInstanceUser</code>.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DescribeChannelModerator\":{\
      \"name\":\"DescribeChannelModerator\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/moderators/{channelModeratorArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeChannelModeratorRequest\"},\
      \"output\":{\"shape\":\"DescribeChannelModeratorResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of a single ChannelModerator.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"DisassociateChannelFlow\":{\
      \"name\":\"DisassociateChannelFlow\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/channels/{channelArn}/channel-flow/{channelFlowArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DisassociateChannelFlowRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Disassociates a channel flow from all its channels. Once disassociated, all messages to that channel stop going through the channel flow processor.</p> <note> <p>Only administrators or channel moderators can disassociate a channel flow. The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"GetChannelMembershipPreferences\":{\
      \"name\":\"GetChannelMembershipPreferences\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/memberships/{memberArn}/preferences\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetChannelMembershipPreferencesRequest\"},\
      \"output\":{\"shape\":\"GetChannelMembershipPreferencesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets the membership preferences of an <code>AppInstanceUser</code> for the specified channel. The <code>AppInstanceUser</code> must be a member of the channel. Only the <code>AppInstanceUser</code> who owns the membership can retrieve preferences. Users in the <code>AppInstanceAdmin</code> and channel moderator roles can't retrieve preferences for other users. Banned users can't retrieve membership preferences for the channel from which they are banned.</p>\"\
    },\
    \"GetChannelMessage\":{\
      \"name\":\"GetChannelMessage\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/messages/{messageId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetChannelMessageRequest\"},\
      \"output\":{\"shape\":\"GetChannelMessageResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets the full details of a channel message.</p> <note> <p>The x-amz-chime-bearer request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"GetChannelMessageStatus\":{\
      \"name\":\"GetChannelMessageStatus\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/messages/{messageId}?scope=message-status\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetChannelMessageStatusRequest\"},\
      \"output\":{\"shape\":\"GetChannelMessageStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets message status for a specified <code>messageId</code>. Use this API to determine the intermediate status of messages going through channel flow processing. The API provides an alternative to retrieving message status if the event was not received because a client wasn't connected to a websocket. </p> <p>Messages can have any one of these statuses.</p> <dl> <dt>SENT</dt> <dd> <p>Message processed successfully</p> </dd> <dt>PENDING</dt> <dd> <p>Ongoing processing</p> </dd> <dt>FAILED</dt> <dd> <p>Processing failed</p> </dd> <dt>DENIED</dt> <dd> <p>Messasge denied by the processor</p> </dd> </dl> <note> <ul> <li> <p>This API does not return statuses for denied messages, because we don't store them once the processor denies them. </p> </li> <li> <p>Only the message sender can invoke this API.</p> </li> <li> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header</p> </li> </ul> </note>\"\
    },\
    \"GetMessagingSessionEndpoint\":{\
      \"name\":\"GetMessagingSessionEndpoint\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/endpoints/messaging-session\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetMessagingSessionEndpointRequest\"},\
      \"output\":{\"shape\":\"GetMessagingSessionEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>The details of the endpoint for the messaging session.</p>\"\
    },\
    \"ListChannelBans\":{\
      \"name\":\"ListChannelBans\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/bans\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListChannelBansRequest\"},\
      \"output\":{\"shape\":\"ListChannelBansResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all the users banned from a particular channel.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"ListChannelFlows\":{\
      \"name\":\"ListChannelFlows\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channel-flows\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListChannelFlowsRequest\"},\
      \"output\":{\"shape\":\"ListChannelFlowsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a paginated lists of all the channel flows created under a single Chime. This is a developer API.</p>\"\
    },\
    \"ListChannelMemberships\":{\
      \"name\":\"ListChannelMemberships\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/memberships\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListChannelMembershipsRequest\"},\
      \"output\":{\"shape\":\"ListChannelMembershipsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all channel memberships in a channel.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note> <p>If you want to list the channels to which a specific app instance user belongs, see the <a href=\\\"https://docs.aws.amazon.com/chime/latest/APIReference/API_messaging-chime_ListChannelMembershipsForAppInstanceUser.html\\\">ListChannelMembershipsForAppInstanceUser</a> API.</p>\"\
    },\
    \"ListChannelMembershipsForAppInstanceUser\":{\
      \"name\":\"ListChannelMembershipsForAppInstanceUser\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels?scope=app-instance-user-memberships\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListChannelMembershipsForAppInstanceUserRequest\"},\
      \"output\":{\"shape\":\"ListChannelMembershipsForAppInstanceUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Lists all channels that a particular <code>AppInstanceUser</code> is a part of. Only an <code>AppInstanceAdmin</code> can call the API with a user ARN that is not their own. </p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"ListChannelMessages\":{\
      \"name\":\"ListChannelMessages\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/messages\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListChannelMessagesRequest\"},\
      \"output\":{\"shape\":\"ListChannelMessagesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>List all the messages in a channel. Returns a paginated list of <code>ChannelMessages</code>. By default, sorted by creation timestamp in descending order.</p> <note> <p>Redacted messages appear in the results as empty, since they are only redacted, not deleted. Deleted messages do not appear in the results. This action always returns the latest version of an edited message.</p> <p>Also, the x-amz-chime-bearer request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"ListChannelModerators\":{\
      \"name\":\"ListChannelModerators\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels/{channelArn}/moderators\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListChannelModeratorsRequest\"},\
      \"output\":{\"shape\":\"ListChannelModeratorsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all the moderators for a channel.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"ListChannels\":{\
      \"name\":\"ListChannels\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListChannelsRequest\"},\
      \"output\":{\"shape\":\"ListChannelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all Channels created under a single Chime App as a paginated list. You can specify filters to narrow results.</p> <p class=\\\"title\\\"> <b>Functionality &amp; restrictions</b> </p> <ul> <li> <p>Use privacy = <code>PUBLIC</code> to retrieve all public channels in the account.</p> </li> <li> <p>Only an <code>AppInstanceAdmin</code> can set privacy = <code>PRIVATE</code> to list the private channels in an account.</p> </li> </ul> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"ListChannelsAssociatedWithChannelFlow\":{\
      \"name\":\"ListChannelsAssociatedWithChannelFlow\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels?scope=channel-flow-associations\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListChannelsAssociatedWithChannelFlowRequest\"},\
      \"output\":{\"shape\":\"ListChannelsAssociatedWithChannelFlowResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all channels associated with a specified channel flow. You can associate a channel flow with multiple channels, but you can only associate a channel with one channel flow. This is a developer API.</p>\"\
    },\
    \"ListChannelsModeratedByAppInstanceUser\":{\
      \"name\":\"ListChannelsModeratedByAppInstanceUser\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/channels?scope=app-instance-user-moderated-channels\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListChannelsModeratedByAppInstanceUserRequest\"},\
      \"output\":{\"shape\":\"ListChannelsModeratedByAppInstanceUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>A list of the channels moderated by an <code>AppInstanceUser</code>.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags applied to an Amazon Chime SDK messaging resource.</p>\"\
    },\
    \"PutChannelMembershipPreferences\":{\
      \"name\":\"PutChannelMembershipPreferences\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/channels/{channelArn}/memberships/{memberArn}/preferences\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"PutChannelMembershipPreferencesRequest\"},\
      \"output\":{\"shape\":\"PutChannelMembershipPreferencesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Sets the membership preferences of an <code>AppInstanceUser</code> for the specified channel. The <code>AppInstanceUser</code> must be a member of the channel. Only the <code>AppInstanceUser</code> who owns the membership can set preferences. Users in the <code>AppInstanceAdmin</code> and channel moderator roles can't set preferences for other users. Banned users can't set membership preferences for the channel from which they are banned.</p>\"\
    },\
    \"RedactChannelMessage\":{\
      \"name\":\"RedactChannelMessage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/channels/{channelArn}/messages/{messageId}?operation=redact\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"RedactChannelMessageRequest\"},\
      \"output\":{\"shape\":\"RedactChannelMessageResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Redacts message content, but not metadata. The message exists in the back end, but the action returns null content, and the state shows as redacted.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"SendChannelMessage\":{\
      \"name\":\"SendChannelMessage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/channels/{channelArn}/messages\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"SendChannelMessageRequest\"},\
      \"output\":{\"shape\":\"SendChannelMessageResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Sends a message to a particular channel that the member is a part of.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> <p>Also, <code>STANDARD</code> messages can contain 4KB of data and the 1KB of metadata. <code>CONTROL</code> messages can contain 30 bytes of data and no metadata.</p> </note>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags?operation=tag-resource\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Applies the specified tags to the specified Amazon Chime SDK messaging resource.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags?operation=untag-resource\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from the specified Amazon Chime SDK messaging resource.</p>\"\
    },\
    \"UpdateChannel\":{\
      \"name\":\"UpdateChannel\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/channels/{channelArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateChannelRequest\"},\
      \"output\":{\"shape\":\"UpdateChannelResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Update a channel's attributes.</p> <p> <b>Restriction</b>: You can't change a channel's privacy. </p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"UpdateChannelFlow\":{\
      \"name\":\"UpdateChannelFlow\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/channel-flows/{channelFlowArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateChannelFlowRequest\"},\
      \"output\":{\"shape\":\"UpdateChannelFlowResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates channel flow attributes. This is a developer API.</p>\"\
    },\
    \"UpdateChannelMessage\":{\
      \"name\":\"UpdateChannelMessage\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/channels/{channelArn}/messages/{messageId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateChannelMessageRequest\"},\
      \"output\":{\"shape\":\"UpdateChannelMessageResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the content of a message.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    },\
    \"UpdateChannelReadMarker\":{\
      \"name\":\"UpdateChannelReadMarker\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/channels/{channelArn}/readMarker\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateChannelReadMarkerRequest\"},\
      \"output\":{\"shape\":\"UpdateChannelReadMarkerResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>The details of the time when a user last read messages in a channel.</p> <note> <p>The <code>x-amz-chime-bearer</code> request header is mandatory. Use the <code>AppInstanceUserArn</code> of the user that makes the API call as the value in the header.</p> </note>\"\
    }\
  },\
  \"shapes\":{\
    \"AllowNotifications\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ALL\",\
        \"NONE\",\
        \"FILTERED\"\
      ]\
    },\
    \"AppInstanceUserMembershipSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"ChannelMembershipType\",\
          \"documentation\":\"<p>The type of <code>ChannelMembership</code>.</p>\"\
        },\
        \"ReadMarkerTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which a message was last read.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the membership details of an <code>AppInstanceUser</code>.</p>\"\
    },\
    \"AssociateChannelFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChannelFlowArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user making the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The input parameters don't match the service's restrictions.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"BatchChannelMemberships\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InvitedBy\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identifier of the member who invited another member.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ChannelMembershipType\",\
          \"documentation\":\"<p>The membership types set for the channel users.</p>\"\
        },\
        \"Members\":{\
          \"shape\":\"Members\",\
          \"documentation\":\"<p>The users successfully added to the request.</p>\"\
        },\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel to which you're adding users.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The membership information, including member ARNs, the channel ARN, and membership types.</p>\"\
    },\
    \"BatchCreateChannelMembershipError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MemberArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the member that the service couldn't add.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"ErrorCode\",\
          \"documentation\":\"<p>The error code.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of failed member ARNs, error codes, and error messages.</p>\"\
    },\
    \"BatchCreateChannelMembershipErrors\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchCreateChannelMembershipError\"}\
    },\
    \"BatchCreateChannelMembershipRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MemberArns\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel to which you're adding users.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"Type\":{\
          \"shape\":\"ChannelMembershipType\",\
          \"documentation\":\"<p>The membership type of a user, <code>DEFAULT</code> or <code>HIDDEN</code>. Default members are always returned as part of <code>ListChannelMemberships</code>. Hidden members are only returned if the type filter in <code>ListChannelMemberships</code> equals <code>HIDDEN</code>. Otherwise hidden members are not returned. This is only supported by moderators.</p>\"\
        },\
        \"MemberArns\":{\
          \"shape\":\"MemberArns\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code>s of the members you want to add to the channel.</p>\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"BatchCreateChannelMembershipResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BatchChannelMemberships\":{\
          \"shape\":\"BatchChannelMemberships\",\
          \"documentation\":\"<p>The list of channel memberships in the response.</p>\"\
        },\
        \"Errors\":{\
          \"shape\":\"BatchCreateChannelMembershipErrors\",\
          \"documentation\":\"<p>If the action fails for one or more of the memberships in the request, a list of the memberships is returned, along with error codes and error messages.</p>\"\
        }\
      }\
    },\
    \"CallbackIdType\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":32\
    },\
    \"Channel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of a channel.</p>\"\
        },\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of a channel.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"ChannelMode\",\
          \"documentation\":\"<p>The mode of the channel.</p>\"\
        },\
        \"Privacy\":{\
          \"shape\":\"ChannelPrivacy\",\
          \"documentation\":\"<p>The channel's privacy setting.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The channel's metadata.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The <code>AppInstanceUser</code> who created the channel.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the <code>AppInstanceUser</code> created the channel.</p>\"\
        },\
        \"LastMessageTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which a member sent the last message in the channel.</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which a channel was last updated.</p>\"\
        },\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of a channel.</p>\"\
    },\
    \"ChannelAssociatedWithFlowSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the channel flow.</p>\"\
        },\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"ChannelMode\",\
          \"documentation\":\"<p>The mode of the channel.</p>\"\
        },\
        \"Privacy\":{\
          \"shape\":\"ChannelPrivacy\",\
          \"documentation\":\"<p>The channel's privacy setting.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The channel's metadata.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of details of a channel associated with channel flow.</p>\"\
    },\
    \"ChannelAssociatedWithFlowSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelAssociatedWithFlowSummary\"}\
    },\
    \"ChannelBan\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Member\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The member being banned from the channel.</p>\"\
        },\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel from which a member is being banned.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the ban was created.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The <code>AppInstanceUser</code> who created the ban.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of a channel ban.</p>\"\
    },\
    \"ChannelBanSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Member\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The member being banned from a channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the details of a <code>ChannelBan</code>.</p>\"\
    },\
    \"ChannelBanSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelBanSummary\"}\
    },\
    \"ChannelFlow\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\"\
        },\
        \"Processors\":{\
          \"shape\":\"ProcessorList\",\
          \"documentation\":\"<p>Information about the processor Lambda functions.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the channel flow.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the channel flow was created.</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which a channel flow was updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of a channel flow.</p>\"\
    },\
    \"ChannelFlowCallbackRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CallbackId\",\
        \"ChannelArn\",\
        \"ChannelMessage\"\
      ],\
      \"members\":{\
        \"CallbackId\":{\
          \"shape\":\"CallbackIdType\",\
          \"documentation\":\"<p>The identifier passed to the processor by the service when invoked. Use the identifier to call back the service.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"DeleteResource\":{\
          \"shape\":\"NonNullableBoolean\",\
          \"documentation\":\"<p>When a processor determines that a message needs to be <code>DENIED</code>, pass this parameter with a value of true.</p>\"\
        },\
        \"ChannelMessage\":{\
          \"shape\":\"ChannelMessageCallback\",\
          \"documentation\":\"<p>Stores information about the processed message.</p>\"\
        }\
      }\
    },\
    \"ChannelFlowCallbackResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"CallbackId\":{\
          \"shape\":\"CallbackIdType\",\
          \"documentation\":\"<p>The call back ID passed in the request.</p>\"\
        }\
      }\
    },\
    \"ChannelFlowExecutionOrder\":{\
      \"type\":\"integer\",\
      \"max\":3,\
      \"min\":1\
    },\
    \"ChannelFlowSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the channel flow.</p>\"\
        },\
        \"Processors\":{\
          \"shape\":\"ProcessorList\",\
          \"documentation\":\"<p>Information about the processor Lambda functions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of details of a channel flow.</p>\"\
    },\
    \"ChannelFlowSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelFlowSummary\"}\
    },\
    \"ChannelMembership\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InvitedBy\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identifier of the member who invited another member.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ChannelMembershipType\",\
          \"documentation\":\"<p>The membership type set for the channel member.</p>\"\
        },\
        \"Member\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The data of the channel member.</p>\"\
        },\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the member's channel.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the channel membership was created.</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which a channel membership was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of a channel member.</p>\"\
    },\
    \"ChannelMembershipForAppInstanceUserSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelSummary\":{\
          \"shape\":\"ChannelSummary\",\
          \"documentation\":\"<p>Returns the channel data for an <code>AppInstance</code>.</p>\"\
        },\
        \"AppInstanceUserMembershipSummary\":{\
          \"shape\":\"AppInstanceUserMembershipSummary\",\
          \"documentation\":\"<p>Returns the channel membership data for an <code>AppInstance</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the channel membership details of an <code>AppInstanceUser</code>.</p>\"\
    },\
    \"ChannelMembershipForAppInstanceUserSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelMembershipForAppInstanceUserSummary\"}\
    },\
    \"ChannelMembershipPreferences\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PushNotifications\":{\
          \"shape\":\"PushNotificationPreferences\",\
          \"documentation\":\"<p>The push notification configuration of a message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The channel membership preferences for an <code>AppInstanceUser</code>.</p>\"\
    },\
    \"ChannelMembershipSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Member\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>A member's summary data.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the details of a <code>ChannelMembership</code>.</p>\"\
    },\
    \"ChannelMembershipSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelMembershipSummary\"}\
    },\
    \"ChannelMembershipType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"HIDDEN\"\
      ]\
    },\
    \"ChannelMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID of a message.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>The message content.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The message metadata.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ChannelMessageType\",\
          \"documentation\":\"<p>The message type.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the message was created.</p>\"\
        },\
        \"LastEditedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which a message was edited.</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which a message was updated.</p>\"\
        },\
        \"Sender\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The message sender.</p>\"\
        },\
        \"Redacted\":{\
          \"shape\":\"NonNullableBoolean\",\
          \"documentation\":\"<p>Hides the content of a message.</p>\"\
        },\
        \"Persistence\":{\
          \"shape\":\"ChannelMessagePersistenceType\",\
          \"documentation\":\"<p>The persistence setting for a channel message.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ChannelMessageStatusStructure\",\
          \"documentation\":\"<p>The status of the channel message.</p>\"\
        },\
        \"MessageAttributes\":{\
          \"shape\":\"MessageAttributeMap\",\
          \"documentation\":\"<p>The attributes for the message, used for message filtering along with a <code>FilterRule</code> defined in the <code>PushNotificationPreferences</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of a message in a channel.</p>\"\
    },\
    \"ChannelMessageCallback\":{\
      \"type\":\"structure\",\
      \"required\":[\"MessageId\"],\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The message ID.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"NonEmptyContent\",\
          \"documentation\":\"<p>The message content.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The message metadata.</p>\"\
        },\
        \"PushNotification\":{\
          \"shape\":\"PushNotificationConfiguration\",\
          \"documentation\":\"<p>The push notification configuration of the message.</p>\"\
        },\
        \"MessageAttributes\":{\
          \"shape\":\"MessageAttributeMap\",\
          \"documentation\":\"<p>The attributes for the message, used for message filtering along with a <code>FilterRule</code> defined in the <code>PushNotificationPreferences</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Stores information about a callback.</p>\"\
    },\
    \"ChannelMessagePersistenceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PERSISTENT\",\
        \"NON_PERSISTENT\"\
      ]\
    },\
    \"ChannelMessageStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SENT\",\
        \"PENDING\",\
        \"FAILED\",\
        \"DENIED\"\
      ]\
    },\
    \"ChannelMessageStatusStructure\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"ChannelMessageStatus\",\
          \"documentation\":\"<p>The message status value.</p>\"\
        },\
        \"Detail\":{\
          \"shape\":\"StatusDetail\",\
          \"documentation\":\"<p>Contains more details about the messasge status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Stores information about a message status.</p>\"\
    },\
    \"ChannelMessageSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID of the message.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>The content of the message.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the message.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ChannelMessageType\",\
          \"documentation\":\"<p>The type of message.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the message summary was created.</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which a message was last updated.</p>\"\
        },\
        \"LastEditedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which a message was last edited.</p>\"\
        },\
        \"Sender\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The message sender.</p>\"\
        },\
        \"Redacted\":{\
          \"shape\":\"NonNullableBoolean\",\
          \"documentation\":\"<p>Indicates whether a message was redacted.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ChannelMessageStatusStructure\",\
          \"documentation\":\"<p>The message status. The status value is <code>SENT</code> for messages sent to a channel without a channel flow. For channels associated with channel flow, the value determines the processing stage.</p>\"\
        },\
        \"MessageAttributes\":{\
          \"shape\":\"MessageAttributeMap\",\
          \"documentation\":\"<p>The message attribues listed in a the summary of a channel message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the messages in a <code>Channel</code>.</p>\"\
    },\
    \"ChannelMessageSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelMessageSummary\"}\
    },\
    \"ChannelMessageType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STANDARD\",\
        \"CONTROL\"\
      ]\
    },\
    \"ChannelMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UNRESTRICTED\",\
        \"RESTRICTED\"\
      ]\
    },\
    \"ChannelModeratedByAppInstanceUserSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelSummary\":{\
          \"shape\":\"ChannelSummary\",\
          \"documentation\":\"<p>Summary of the details of a <code>Channel</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the details of a moderated channel.</p>\"\
    },\
    \"ChannelModeratedByAppInstanceUserSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelModeratedByAppInstanceUserSummary\"}\
    },\
    \"ChannelModerator\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Moderator\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The moderator's data.</p>\"\
        },\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the moderator's channel.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the moderator was created.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The <code>AppInstanceUser</code> who created the moderator.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of a channel moderator.</p>\"\
    },\
    \"ChannelModeratorSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Moderator\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The data for a moderator.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the details of a <code>ChannelModerator</code>.</p>\"\
    },\
    \"ChannelModeratorSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelModeratorSummary\"}\
    },\
    \"ChannelPrivacy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PUBLIC\",\
        \"PRIVATE\"\
      ]\
    },\
    \"ChannelSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the channel.</p>\"\
        },\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"ChannelMode\",\
          \"documentation\":\"<p>The mode of the channel.</p>\"\
        },\
        \"Privacy\":{\
          \"shape\":\"ChannelPrivacy\",\
          \"documentation\":\"<p>The privacy setting of the channel.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the channel.</p>\"\
        },\
        \"LastMessageTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the last message in a channel was sent.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the details of a <code>Channel</code>.</p>\"\
    },\
    \"ChannelSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelSummary\"}\
    },\
    \"ChimeArn\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":5,\
      \"pattern\":\"arn:[a-z0-9-\\\\.]{1,63}:[a-z0-9-\\\\.]{0,63}:[a-z0-9-\\\\.]{0,63}:[a-z0-9-\\\\.]{0,63}:[^/].{0,1023}\"\
    },\
    \"ClientRequestToken\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":2,\
      \"pattern\":\"[-_a-zA-Z0-9]*\",\
      \"sensitive\":true\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request could not be processed because of conflict in the current state of the resource.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"Content\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0,\
      \"pattern\":\"[\\\\s\\\\S]*\",\
      \"sensitive\":true\
    },\
    \"CreateChannelBanRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MemberArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the ban request.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MemberArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the member being banned.</p>\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"CreateChannelBanResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the response to the ban request.</p>\"\
        },\
        \"Member\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The <code>ChannelArn</code> and <code>BannedIdentity</code> of the member in the ban response.</p>\"\
        }\
      }\
    },\
    \"CreateChannelFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceArn\",\
        \"Processors\",\
        \"Name\",\
        \"ClientRequestToken\"\
      ],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow request.</p>\"\
        },\
        \"Processors\":{\
          \"shape\":\"ProcessorList\",\
          \"documentation\":\"<p>Information about the processor Lambda functions.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the channel flow.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags for the creation request.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The client token for the request. An Idempotency token.</p>\"\
        }\
      }\
    },\
    \"CreateChannelFlowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\"\
        }\
      }\
    },\
    \"CreateChannelMembershipRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MemberArn\",\
        \"Type\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel to which you're adding users.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MemberArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the member you want to add to the channel.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ChannelMembershipType\",\
          \"documentation\":\"<p>The membership type of a user, <code>DEFAULT</code> or <code>HIDDEN</code>. Default members are always returned as part of <code>ListChannelMemberships</code>. Hidden members are only returned if the type filter in <code>ListChannelMemberships</code> equals <code>HIDDEN</code>. Otherwise hidden members are not returned. This is only supported by moderators.</p>\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"CreateChannelMembershipResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"Member\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The ARN and metadata of the member being added.</p>\"\
        }\
      }\
    },\
    \"CreateChannelModeratorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChannelModeratorArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"ChannelModeratorArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the moderator.</p>\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"CreateChannelModeratorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"ChannelModerator\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The ARNs of the channel and the moderator.</p>\"\
        }\
      }\
    },\
    \"CreateChannelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceArn\",\
        \"Name\",\
        \"ClientRequestToken\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel request.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the channel.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"ChannelMode\",\
          \"documentation\":\"<p>The channel mode: <code>UNRESTRICTED</code> or <code>RESTRICTED</code>. Administrators, moderators, and channel members can add themselves and other members to unrestricted channels. Only administrators and moderators can add members to restricted channels.</p>\"\
        },\
        \"Privacy\":{\
          \"shape\":\"ChannelPrivacy\",\
          \"documentation\":\"<p>The channel's privacy level: <code>PUBLIC</code> or <code>PRIVATE</code>. Private channels aren't discoverable by users outside the channel. Public channels are discoverable by anyone in the <code>AppInstance</code>.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the creation request. Limited to 1KB and UTF-8.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The client token for the request. An <code>Idempotency</code> token.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags for the creation request.</p>\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"CreateChannelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        }\
      }\
    },\
    \"DeleteChannelBanRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MemberArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel from which the <code>AppInstanceUser</code> was banned.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MemberArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code> that you want to reinstate.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"memberArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DeleteChannelFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChannelFlowArn\"],\
      \"members\":{\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelFlowArn\"\
        }\
      }\
    },\
    \"DeleteChannelMembershipRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MemberArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel from which you want to remove the user.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MemberArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the member that you're removing from the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"memberArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DeleteChannelMessageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MessageId\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID of the message being deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"messageId\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DeleteChannelModeratorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChannelModeratorArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"ChannelModeratorArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the moderator being deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelModeratorArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DeleteChannelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel being deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DescribeChannelBanRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MemberArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel from which the user is banned.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MemberArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the member being banned.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"memberArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DescribeChannelBanResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelBan\":{\
          \"shape\":\"ChannelBan\",\
          \"documentation\":\"<p>The details of the ban.</p>\"\
        }\
      }\
    },\
    \"DescribeChannelFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChannelFlowArn\"],\
      \"members\":{\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelFlowArn\"\
        }\
      }\
    },\
    \"DescribeChannelFlowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelFlow\":{\
          \"shape\":\"ChannelFlow\",\
          \"documentation\":\"<p>The channel flow details.</p>\"\
        }\
      }\
    },\
    \"DescribeChannelMembershipForAppInstanceUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"AppInstanceUserArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel to which the user belongs.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the user in a channel.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"app-instance-user-arn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DescribeChannelMembershipForAppInstanceUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelMembership\":{\
          \"shape\":\"ChannelMembershipForAppInstanceUserSummary\",\
          \"documentation\":\"<p>The channel to which a user belongs.</p>\"\
        }\
      }\
    },\
    \"DescribeChannelMembershipRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MemberArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MemberArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the member.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"memberArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DescribeChannelMembershipResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelMembership\":{\
          \"shape\":\"ChannelMembership\",\
          \"documentation\":\"<p>The details of the membership.</p>\"\
        }\
      }\
    },\
    \"DescribeChannelModeratedByAppInstanceUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"AppInstanceUserArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the moderated channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code> in the moderated channel.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"app-instance-user-arn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DescribeChannelModeratedByAppInstanceUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Channel\":{\
          \"shape\":\"ChannelModeratedByAppInstanceUserSummary\",\
          \"documentation\":\"<p>The moderated channel.</p>\"\
        }\
      }\
    },\
    \"DescribeChannelModeratorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChannelModeratorArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"ChannelModeratorArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the channel moderator.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelModeratorArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DescribeChannelModeratorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelModerator\":{\
          \"shape\":\"ChannelModerator\",\
          \"documentation\":\"<p>The details of the channel moderator.</p>\"\
        }\
      }\
    },\
    \"DescribeChannelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"DescribeChannelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channel details.</p>\"\
        }\
      }\
    },\
    \"DisassociateChannelFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChannelFlowArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelFlowArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user making the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"ErrorCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BadRequest\",\
        \"Conflict\",\
        \"Forbidden\",\
        \"NotFound\",\
        \"PreconditionFailed\",\
        \"ResourceLimitExceeded\",\
        \"ServiceFailure\",\
        \"AccessDenied\",\
        \"ServiceUnavailable\",\
        \"Throttled\",\
        \"Throttling\",\
        \"Unauthorized\",\
        \"Unprocessable\",\
        \"VoiceConnectorGroupAssociationsExist\",\
        \"PhoneNumberAssociationsExist\"\
      ]\
    },\
    \"FallbackAction\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONTINUE\",\
        \"ABORT\"\
      ]\
    },\
    \"FilterRule\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\",\
      \"sensitive\":true\
    },\
    \"ForbiddenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The client is permanently forbidden from making the request.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"GetChannelMembershipPreferencesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MemberArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MemberArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the member retrieving the preferences.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"memberArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserARN</code> of the user making the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"GetChannelMembershipPreferencesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"Member\":{\"shape\":\"Identity\"},\
        \"Preferences\":{\
          \"shape\":\"ChannelMembershipPreferences\",\
          \"documentation\":\"<p>The channel membership preferences for an <code>AppInstanceUser</code> .</p>\"\
        }\
      }\
    },\
    \"GetChannelMessageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MessageId\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID of the message.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"messageId\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"GetChannelMessageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelMessage\":{\
          \"shape\":\"ChannelMessage\",\
          \"documentation\":\"<p>The details of and content in the message.</p>\"\
        }\
      }\
    },\
    \"GetChannelMessageStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MessageId\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID of the message.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"messageId\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user making the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"GetChannelMessageStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ChannelMessageStatusStructure\",\
          \"documentation\":\"<p>The message status and details.</p>\"\
        }\
      }\
    },\
    \"GetMessagingSessionEndpointRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetMessagingSessionEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Endpoint\":{\
          \"shape\":\"MessagingSessionEndpoint\",\
          \"documentation\":\"<p>The endpoint returned in the response.</p>\"\
        }\
      }\
    },\
    \"Identity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN in an Identity.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name in an Identity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of a user.</p>\"\
    },\
    \"InvocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\"ASYNC\"]\
    },\
    \"LambdaConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"InvocationType\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"LambdaFunctionArn\",\
          \"documentation\":\"<p>The ARN of the Lambda message processing function.</p>\"\
        },\
        \"InvocationType\":{\
          \"shape\":\"InvocationType\",\
          \"documentation\":\"<p>Controls how the Lambda function is invoked.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Stores metadata about a Lambda processor.</p>\"\
    },\
    \"LambdaFunctionArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":15,\
      \"pattern\":\"arn:aws:lambda:[a-z]{2}-[a-z]+-\\\\d{1}:\\\\d{12}:function:[a-zA-Z0-9\\\\-_\\\\.]+(:(\\\\$LATEST|[a-zA-Z0-9\\\\-_]+))?\"\
    },\
    \"ListChannelBansRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of bans that you want returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested bans are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"ListChannelBansResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested bans are returned.</p>\"\
        },\
        \"ChannelBans\":{\
          \"shape\":\"ChannelBanSummaryList\",\
          \"documentation\":\"<p>The information for each requested ban.</p>\"\
        }\
      }\
    },\
    \"ListChannelFlowsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceArn\"],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the app instance.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"app-instance-arn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of channel flows that you want to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested channel flows are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        }\
      }\
    },\
    \"ListChannelFlowsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelFlows\":{\
          \"shape\":\"ChannelFlowSummaryList\",\
          \"documentation\":\"<p>The information about each channel flow.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested channels are returned.</p>\"\
        }\
      }\
    },\
    \"ListChannelMembershipsForAppInstanceUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChimeBearer\"],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>s</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"app-instance-user-arn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of users that you want returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned from previous API requests until the number of channel memberships is reached.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"ListChannelMembershipsForAppInstanceUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelMemberships\":{\
          \"shape\":\"ChannelMembershipForAppInstanceUserSummaryList\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested users are returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested users are returned.</p>\"\
        }\
      }\
    },\
    \"ListChannelMembershipsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The maximum number of channel memberships that you want returned.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"Type\":{\
          \"shape\":\"ChannelMembershipType\",\
          \"documentation\":\"<p>The membership type of a user, <code>DEFAULT</code> or <code>HIDDEN</code>. Default members are returned as part of <code>ListChannelMemberships</code> if no type is specified. Hidden members are only returned if the type filter in <code>ListChannelMemberships</code> equals <code>HIDDEN</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"type\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of channel memberships that you want returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested channel memberships are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"ListChannelMembershipsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"ChannelMemberships\":{\
          \"shape\":\"ChannelMembershipSummaryList\",\
          \"documentation\":\"<p>The information for the requested channel memberships.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested channel memberships are returned.</p>\"\
        }\
      }\
    },\
    \"ListChannelMessagesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The order in which you want messages sorted. Default is Descending, based on time created.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"sort-order\"\
        },\
        \"NotBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The initial or starting time stamp for your requested messages.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"not-before\"\
        },\
        \"NotAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The final or ending time stamp for your requested messages.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"not-after\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of messages that you want returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested messages are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"ListChannelMessagesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel containing the requested messages.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested messages are returned.</p>\"\
        },\
        \"ChannelMessages\":{\
          \"shape\":\"ChannelMessageSummaryList\",\
          \"documentation\":\"<p>The information about, and content of, each requested message.</p>\"\
        }\
      }\
    },\
    \"ListChannelModeratorsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of moderators that you want returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested moderators are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"ListChannelModeratorsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested moderators are returned.</p>\"\
        },\
        \"ChannelModerators\":{\
          \"shape\":\"ChannelModeratorSummaryList\",\
          \"documentation\":\"<p>The information about and names of each moderator.</p>\"\
        }\
      }\
    },\
    \"ListChannelsAssociatedWithChannelFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChannelFlowArn\"],\
      \"members\":{\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"channel-flow-arn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of channels that you want to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested channels are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        }\
      }\
    },\
    \"ListChannelsAssociatedWithChannelFlowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Channels\":{\
          \"shape\":\"ChannelAssociatedWithFlowSummaryList\",\
          \"documentation\":\"<p>The information about each channel.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested channels are returned.</p>\"\
        }\
      }\
    },\
    \"ListChannelsModeratedByAppInstanceUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChimeBearer\"],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the user in the moderated channel.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"app-instance-user-arn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of channels in the request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned from previous API requests until the number of channels moderated by the user is reached.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"ListChannelsModeratedByAppInstanceUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Channels\":{\
          \"shape\":\"ChannelModeratedByAppInstanceUserSummaryList\",\
          \"documentation\":\"<p>The moderated channels in the request.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned from previous API requests until the number of channels moderated by the user is reached.</p>\"\
        }\
      }\
    },\
    \"ListChannelsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"app-instance-arn\"\
        },\
        \"Privacy\":{\
          \"shape\":\"ChannelPrivacy\",\
          \"documentation\":\"<p>The privacy setting. <code>PUBLIC</code> retrieves all the public channels. <code>PRIVATE</code> retrieves private channels. Only an <code>AppInstanceAdmin</code> can retrieve private channels. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"privacy\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of channels that you want to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested channels are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"ListChannelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Channels\":{\
          \"shape\":\"ChannelSummaryList\",\
          \"documentation\":\"<p>The information about each channel.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned from previous API requests until the number of channels is reached.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceARN\"],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the resource.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"arn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag key-value pairs.</p>\"\
        }\
      }\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"MemberArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChimeArn\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"Members\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Identity\"}\
    },\
    \"MessageAttributeMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"MessageAttributeName\"},\
      \"value\":{\"shape\":\"MessageAttributeValue\"}\
    },\
    \"MessageAttributeName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\",\
      \"sensitive\":true\
    },\
    \"MessageAttributeStringValue\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\",\
      \"sensitive\":true\
    },\
    \"MessageAttributeStringValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MessageAttributeStringValue\"}\
    },\
    \"MessageAttributeValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StringValues\":{\
          \"shape\":\"MessageAttributeStringValues\",\
          \"documentation\":\"<p>The strings in a message attribute value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of message attribute values.</p>\"\
    },\
    \"MessageId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[-_a-zA-Z0-9]*\"\
    },\
    \"MessagingSessionEndpoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"UrlType\",\
          \"documentation\":\"<p>The endpoint to which you establish a websocket connection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The websocket endpoint used to connect to Amazon Chime SDK messaging.</p>\"\
    },\
    \"Metadata\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"NonEmptyContent\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\",\
      \"sensitive\":true\
    },\
    \"NonEmptyResourceName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0009\\\\u000A\\\\u000D\\\\u0020-\\\\u007E\\\\u0085\\\\u00A0-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\u10000-\\\\u10FFFF]*\",\
      \"sensitive\":true\
    },\
    \"NonNullableBoolean\":{\"type\":\"boolean\"},\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>One or more of the resources in the request does not exist in the system.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"Processor\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Configuration\",\
        \"ExecutionOrder\",\
        \"FallbackAction\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the channel flow.</p>\"\
        },\
        \"Configuration\":{\
          \"shape\":\"ProcessorConfiguration\",\
          \"documentation\":\"<p>The information about the type of processor and its identifier.</p>\"\
        },\
        \"ExecutionOrder\":{\
          \"shape\":\"ChannelFlowExecutionOrder\",\
          \"documentation\":\"<p>The sequence in which processors run. If you have multiple processors in a channel flow, message processing goes through each processor in the sequence. The value determines the sequence. At this point, we support only 1 processor within a flow.</p>\"\
        },\
        \"FallbackAction\":{\
          \"shape\":\"FallbackAction\",\
          \"documentation\":\"<p>Determines whether to continue with message processing or stop it in cases where communication with a processor fails. If a processor has a fallback action of <code>ABORT</code> and communication with it fails, the processor sets the message status to <code>FAILED</code> and does not send the message to any recipients. Note that if the last processor in the channel flow sequence has a fallback action of <code>CONTINUE</code> and communication with the processor fails, then the message is considered processed and sent to recipients of the channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The information about a processor in a channel flow.</p>\"\
    },\
    \"ProcessorConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Lambda\"],\
      \"members\":{\
        \"Lambda\":{\
          \"shape\":\"LambdaConfiguration\",\
          \"documentation\":\"<p>Indicates that the processor is of type Lambda.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A processor's metadata.</p>\"\
    },\
    \"ProcessorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Processor\"},\
      \"max\":3,\
      \"min\":1\
    },\
    \"PushNotificationBody\":{\
      \"type\":\"string\",\
      \"max\":150,\
      \"min\":0,\
      \"pattern\":\"[\\\\s\\\\S]*\",\
      \"sensitive\":true\
    },\
    \"PushNotificationConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Title\":{\
          \"shape\":\"PushNotificationTitle\",\
          \"documentation\":\"<p>The title of the push notification.</p>\"\
        },\
        \"Body\":{\
          \"shape\":\"PushNotificationBody\",\
          \"documentation\":\"<p>The body of the push notification.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"PushNotificationType\",\
          \"documentation\":\"<p>Enum value that indicates the type of the push notification for a message. <code>DEFAULT</code>: Normal mobile push notification. <code>VOIP</code>: VOIP mobile push notification.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The push notification configuration of the message.</p>\"\
    },\
    \"PushNotificationPreferences\":{\
      \"type\":\"structure\",\
      \"required\":[\"AllowNotifications\"],\
      \"members\":{\
        \"AllowNotifications\":{\
          \"shape\":\"AllowNotifications\",\
          \"documentation\":\"<p>Enum value that indicates which push notifications to send to the requested member of a channel. <code>ALL</code> sends all push notifications, <code>NONE</code> sends no push notifications, <code>FILTERED</code> sends only filtered push notifications. </p>\"\
        },\
        \"FilterRule\":{\
          \"shape\":\"FilterRule\",\
          \"documentation\":\"<p>The simple JSON object used to send a subset of a push notification to the requsted member.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The channel membership preferences for push notification.</p>\"\
    },\
    \"PushNotificationTitle\":{\
      \"type\":\"string\",\
      \"max\":50,\
      \"min\":0,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"PushNotificationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"VOIP\"\
      ]\
    },\
    \"PutChannelMembershipPreferencesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MemberArn\",\
        \"ChimeBearer\",\
        \"Preferences\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MemberArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the member setting the preferences.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"memberArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserARN</code> of the user making the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        },\
        \"Preferences\":{\
          \"shape\":\"ChannelMembershipPreferences\",\
          \"documentation\":\"<p>The channel membership preferences of an <code>AppInstanceUser</code> .</p>\"\
        }\
      }\
    },\
    \"PutChannelMembershipPreferencesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"Member\":{\"shape\":\"Identity\"},\
        \"Preferences\":{\
          \"shape\":\"ChannelMembershipPreferences\",\
          \"documentation\":\"<p>The ARN and metadata of the member being added.</p>\"\
        }\
      }\
    },\
    \"RedactChannelMessageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MessageId\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel containing the messages that you want to redact.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID of the message being redacted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"messageId\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"RedactChannelMessageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel containing the messages that you want to redact.</p>\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID of the message being redacted.</p>\"\
        }\
      }\
    },\
    \"ResourceLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request exceeds the resource limit.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[\\\\u0009\\\\u000A\\\\u000D\\\\u0020-\\\\u007E\\\\u0085\\\\u00A0-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\u10000-\\\\u10FFFF]*\",\
      \"sensitive\":true\
    },\
    \"SendChannelMessageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"Content\",\
        \"Type\",\
        \"Persistence\",\
        \"ClientRequestToken\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"Content\":{\
          \"shape\":\"NonEmptyContent\",\
          \"documentation\":\"<p>The content of the message.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ChannelMessageType\",\
          \"documentation\":\"<p>The type of message, <code>STANDARD</code> or <code>CONTROL</code>.</p>\"\
        },\
        \"Persistence\":{\
          \"shape\":\"ChannelMessagePersistenceType\",\
          \"documentation\":\"<p>Boolean that controls whether the message is persisted on the back end. Required.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The optional metadata for each message.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The <code>Idempotency</code> token for each client request.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        },\
        \"PushNotification\":{\
          \"shape\":\"PushNotificationConfiguration\",\
          \"documentation\":\"<p>The push notification configuration of the message.</p>\"\
        },\
        \"MessageAttributes\":{\
          \"shape\":\"MessageAttributeMap\",\
          \"documentation\":\"<p>The attributes for the message, used for message filtering along with a <code>FilterRule</code> defined in the <code>PushNotificationPreferences</code>.</p>\"\
        }\
      }\
    },\
    \"SendChannelMessageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID string assigned to each message.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ChannelMessageStatusStructure\",\
          \"documentation\":\"<p>The status of the channel message.</p>\"\
        }\
      }\
    },\
    \"ServiceFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The service encountered an unexpected error.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The service is currently unavailable.</p>\",\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"SortOrder\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ASCENDING\",\
        \"DESCENDING\"\
      ]\
    },\
    \"StatusDetail\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The key in a tag.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The value in a tag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A tag object containing a key-value pair.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceARN\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The resource ARN.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag key-value pairs.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"ThrottledClientException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The client exceeded its request rate limit.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"UnauthorizedClientException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The client is not currently authorized to make the request.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceARN\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The resource ARN.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tag keys.</p>\"\
        }\
      }\
    },\
    \"UpdateChannelFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelFlowArn\",\
        \"Processors\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelFlowArn\"\
        },\
        \"Processors\":{\
          \"shape\":\"ProcessorList\",\
          \"documentation\":\"<p>Information about the processor Lambda functions </p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the channel flow.</p>\"\
        }\
      }\
    },\
    \"UpdateChannelFlowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelFlowArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel flow.</p>\"\
        }\
      }\
    },\
    \"UpdateChannelMessageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"MessageId\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID string of the message being updated.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"messageId\"\
        },\
        \"Content\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>The content of the message being updated.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the message being updated.</p>\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"UpdateChannelMessageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID string of the message being updated.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ChannelMessageStatusStructure\",\
          \"documentation\":\"<p>The status of the message update.</p>\"\
        }\
      }\
    },\
    \"UpdateChannelReadMarkerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"UpdateChannelReadMarkerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        }\
      }\
    },\
    \"UpdateChannelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelArn\",\
        \"Name\",\
        \"Mode\",\
        \"ChimeBearer\"\
      ],\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"channelArn\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the channel.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"ChannelMode\",\
          \"documentation\":\"<p>The mode of the update request.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata for the update request.</p>\"\
        },\
        \"ChimeBearer\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-chime-bearer\"\
        }\
      }\
    },\
    \"UpdateChannelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the channel.</p>\"\
        }\
      }\
    },\
    \"UrlType\":{\
      \"type\":\"string\",\
      \"max\":4096\
    }\
  },\
  \"documentation\":\"<p>The Amazon Chime SDK Messaging APIs in this section allow software developers to send and receive messages in custom messaging applications. These APIs depend on the frameworks provided by the Amazon Chime SDK Identity APIs. For more information about the messaging APIs, see <a href=\\\"https://docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Messaging\\\">Amazon Chime SDK messaging</a> </p>\"\
}\
";
}

@end
