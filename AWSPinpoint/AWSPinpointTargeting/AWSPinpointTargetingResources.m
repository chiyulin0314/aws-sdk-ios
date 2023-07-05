//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSPinpointTargetingResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSPinpointTargetingResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSPinpointTargetingResources

+ (instancetype)sharedInstance {
    static AWSPinpointTargetingResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSPinpointTargetingResources new];
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
  \"metadata\": {\
    \"apiVersion\": \"2016-12-01\",\
    \"endpointPrefix\": \"pinpoint\",\
    \"signingName\": \"mobiletargeting\",\
    \"serviceFullName\": \"Amazon Pinpoint\",\
    \"serviceId\": \"Pinpoint\",\
    \"protocol\": \"rest-json\",\
    \"jsonVersion\": \"1.1\",\
    \"uid\": \"pinpoint-2016-12-01\",\
    \"signatureVersion\": \"v4\"\
  },\
  \"documentation\": \"<p>Doc Engage API - Amazon Pinpoint API</p>\",\
  \"operations\": {\
    \"CreateApp\": {\
      \"name\": \"CreateApp\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateAppRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateAppResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \" <p>Creates an application.</p>\"\
    },\
    \"CreateCampaign\": {\
      \"name\": \"CreateCampaign\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/campaigns\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateCampaignRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateCampaignResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a new campaign for an application or updates the settings of an existing campaign for an application.</p>\"\
    },\
    \"CreateEmailTemplate\": {\
      \"name\": \"CreateEmailTemplate\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/templates/{template-name}/email\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateEmailTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateEmailTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a message template for messages that are sent through the email channel.</p>\"\
    },\
    \"CreateExportJob\": {\
      \"name\": \"CreateExportJob\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/jobs/export\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"CreateExportJobRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateExportJobResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates an export job for an application.</p>\"\
    },\
    \"CreateImportJob\": {\
      \"name\": \"CreateImportJob\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/jobs/import\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateImportJobRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateImportJobResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates an import job for an application.</p>\"\
    },\
    \"CreateInAppTemplate\": {\
      \"name\": \"CreateInAppTemplate\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/templates/{template-name}/inapp\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateInAppTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateInAppTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a new message template for messages using the in-app message channel.</p>\"\
    },\
    \"CreateJourney\": {\
      \"name\": \"CreateJourney\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateJourneyRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateJourneyResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a journey for an application.</p>\"\
    },\
    \"CreatePushTemplate\": {\
      \"name\": \"CreatePushTemplate\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/templates/{template-name}/push\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreatePushTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreatePushTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a message template for messages that are sent through a push notification channel.</p>\"\
    },\
    \"CreateRecommenderConfiguration\": {\
      \"name\": \"CreateRecommenderConfiguration\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/recommenders\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateRecommenderConfigurationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateRecommenderConfigurationResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates an Amazon Pinpoint configuration for a recommender model.</p>\"\
    },\
    \"CreateSegment\": {\
      \"name\": \"CreateSegment\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/segments\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateSegmentRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateSegmentResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.</p>\"\
    },\
    \"CreateSmsTemplate\": {\
      \"name\": \"CreateSmsTemplate\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/templates/{template-name}/sms\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateSmsTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateSmsTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a message template for messages that are sent through the SMS channel.</p>\"\
    },\
    \"CreateVoiceTemplate\": {\
      \"name\": \"CreateVoiceTemplate\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/templates/{template-name}/voice\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateVoiceTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateVoiceTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded and the specified resource was created.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a message template for messages that are sent through the voice channel.</p>\"\
    },\
    \"DeleteAdmChannel\": {\
      \"name\": \"DeleteAdmChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/adm\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteAdmChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteAdmChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the ADM channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteApnsChannel\": {\
      \"name\": \"DeleteApnsChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteApnsChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteApnsChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the APNs channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteApnsSandboxChannel\": {\
      \"name\": \"DeleteApnsSandboxChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns_sandbox\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteApnsSandboxChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteApnsSandboxChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the APNs sandbox channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteApnsVoipChannel\": {\
      \"name\": \"DeleteApnsVoipChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns_voip\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteApnsVoipChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteApnsVoipChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the APNs VoIP channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteApnsVoipSandboxChannel\": {\
      \"name\": \"DeleteApnsVoipSandboxChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns_voip_sandbox\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteApnsVoipSandboxChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteApnsVoipSandboxChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the APNs VoIP sandbox channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteApp\": {\
      \"name\": \"DeleteApp\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteAppRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteAppResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes an application.</p>\"\
    },\
    \"DeleteBaiduChannel\": {\
      \"name\": \"DeleteBaiduChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/baidu\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteBaiduChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteBaiduChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the Baidu channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteCampaign\": {\
      \"name\": \"DeleteCampaign\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/campaigns/{campaign-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteCampaignRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteCampaignResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a campaign from an application.</p>\"\
    },\
    \"DeleteEmailChannel\": {\
      \"name\": \"DeleteEmailChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/email\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteEmailChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteEmailChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the email channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteEmailTemplate\": {\
      \"name\": \"DeleteEmailTemplate\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/templates/{template-name}/email\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"DeleteEmailTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteEmailTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a message template for messages that were sent through the email channel.</p>\"\
    },\
    \"DeleteEndpoint\": {\
      \"name\": \"DeleteEndpoint\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/endpoints/{endpoint-id}\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"DeleteEndpointRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteEndpointResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes an endpoint from an application.</p>\"\
    },\
    \"DeleteEventStream\": {\
      \"name\": \"DeleteEventStream\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/eventstream\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteEventStreamRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteEventStreamResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes the event stream for an application.</p>\"\
    },\
    \"DeleteGcmChannel\": {\
      \"name\": \"DeleteGcmChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/gcm\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteGcmChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteGcmChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the GCM channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteInAppTemplate\": {\
      \"name\": \"DeleteInAppTemplate\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/templates/{template-name}/inapp\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"DeleteInAppTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteInAppTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a message template for messages sent using the in-app message channel.</p>\"\
    },\
    \"DeleteJourney\": {\
      \"name\": \"DeleteJourney\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteJourneyRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteJourneyResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a journey from an application.</p>\"\
    },\
    \"DeletePushTemplate\": {\
      \"name\": \"DeletePushTemplate\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/templates/{template-name}/push\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"DeletePushTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeletePushTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a message template for messages that were sent through a push notification channel.</p>\"\
    },\
    \"DeleteRecommenderConfiguration\": {\
      \"name\": \"DeleteRecommenderConfiguration\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/recommenders/{recommender-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteRecommenderConfigurationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteRecommenderConfigurationResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes an Amazon Pinpoint configuration for a recommender model.</p>\"\
    },\
    \"DeleteSegment\": {\
      \"name\": \"DeleteSegment\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/segments/{segment-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteSegmentRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteSegmentResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a segment from an application.</p>\"\
    },\
    \"DeleteSmsChannel\": {\
      \"name\": \"DeleteSmsChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/sms\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteSmsChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteSmsChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the SMS channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteSmsTemplate\": {\
      \"name\": \"DeleteSmsTemplate\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/templates/{template-name}/sms\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"DeleteSmsTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteSmsTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a message template for messages that were sent through the SMS channel.</p>\"\
    },\
    \"DeleteUserEndpoints\": {\
      \"name\": \"DeleteUserEndpoints\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/users/{user-id}\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"DeleteUserEndpointsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteUserEndpointsResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes all the endpoints that are associated with a specific user ID.</p>\"\
    },\
    \"DeleteVoiceChannel\": {\
      \"name\": \"DeleteVoiceChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/voice\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteVoiceChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteVoiceChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Disables the voice channel for an application and deletes any existing settings for the channel.</p>\"\
    },\
    \"DeleteVoiceTemplate\": {\
      \"name\": \"DeleteVoiceTemplate\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/templates/{template-name}/voice\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"DeleteVoiceTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteVoiceTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a message template for messages that were sent through the voice channel.</p>\"\
    },\
    \"GetAdmChannel\": {\
      \"name\": \"GetAdmChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/adm\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetAdmChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetAdmChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the ADM channel for an application.</p>\"\
    },\
    \"GetApnsChannel\": {\
      \"name\": \"GetApnsChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetApnsChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetApnsChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the APNs channel for an application.</p>\"\
    },\
    \"GetApnsSandboxChannel\": {\
      \"name\": \"GetApnsSandboxChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns_sandbox\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetApnsSandboxChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetApnsSandboxChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the APNs sandbox channel for an application.</p>\"\
    },\
    \"GetApnsVoipChannel\": {\
      \"name\": \"GetApnsVoipChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns_voip\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetApnsVoipChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetApnsVoipChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the APNs VoIP channel for an application.</p>\"\
    },\
    \"GetApnsVoipSandboxChannel\": {\
      \"name\": \"GetApnsVoipSandboxChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns_voip_sandbox\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetApnsVoipSandboxChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetApnsVoipSandboxChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the APNs VoIP sandbox channel for an application.</p>\"\
    },\
    \"GetApp\": {\
      \"name\": \"GetApp\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetAppRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetAppResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about an application.</p>\"\
    },\
    \"GetApplicationDateRangeKpi\": {\
      \"name\": \"GetApplicationDateRangeKpi\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/kpis/daterange/{kpi-name}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetApplicationDateRangeKpiRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetApplicationDateRangeKpiResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves (queries) pre-aggregated data for a standard metric that applies to an application.</p>\"\
    },\
    \"GetApplicationSettings\": {\
      \"name\": \"GetApplicationSettings\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/settings\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetApplicationSettingsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetApplicationSettingsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the settings for an application.</p>\"\
    },\
    \"GetApps\": {\
      \"name\": \"GetApps\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetAppsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetAppsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about all the applications that are associated with your Amazon Pinpoint account.</p>\"\
    },\
    \"GetBaiduChannel\": {\
      \"name\": \"GetBaiduChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/baidu\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetBaiduChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetBaiduChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the Baidu channel for an application.</p>\"\
    },\
    \"GetCampaign\": {\
      \"name\": \"GetCampaign\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/campaigns/{campaign-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetCampaignRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetCampaignResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status, configuration, and other settings for a campaign.</p>\"\
    },\
    \"GetCampaignActivities\": {\
      \"name\": \"GetCampaignActivities\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/campaigns/{campaign-id}/activities\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetCampaignActivitiesRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetCampaignActivitiesResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about all the activities for a campaign.</p>\"\
    },\
    \"GetCampaignDateRangeKpi\": {\
      \"name\": \"GetCampaignDateRangeKpi\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/campaigns/{campaign-id}/kpis/daterange/{kpi-name}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetCampaignDateRangeKpiRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetCampaignDateRangeKpiResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves (queries) pre-aggregated data for a standard metric that applies to a campaign.</p>\"\
    },\
    \"GetCampaignVersion\": {\
      \"name\": \"GetCampaignVersion\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/campaigns/{campaign-id}/versions/{version}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetCampaignVersionRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetCampaignVersionResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status, configuration, and other settings for a specific version of a campaign.</p>\"\
    },\
    \"GetCampaignVersions\": {\
      \"name\": \"GetCampaignVersions\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/campaigns/{campaign-id}/versions\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetCampaignVersionsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetCampaignVersionsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status, configuration, and other settings for all versions of a campaign.</p>\"\
    },\
    \"GetCampaigns\": {\
      \"name\": \"GetCampaigns\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/campaigns\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetCampaignsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetCampaignsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status, configuration, and other settings for all the campaigns that are associated with an application.</p>\"\
    },\
    \"GetChannels\": {\
      \"name\": \"GetChannels\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetChannelsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetChannelsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the history and status of each channel for an application.</p>\"\
    },\
    \"GetEmailChannel\": {\
      \"name\": \"GetEmailChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/email\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetEmailChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetEmailChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the email channel for an application.</p>\"\
    },\
    \"GetEmailTemplate\": {\
      \"name\": \"GetEmailTemplate\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/templates/{template-name}/email\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetEmailTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetEmailTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves the content and settings of a message template for messages that are sent through the email channel.</p>\"\
    },\
    \"GetEndpoint\": {\
      \"name\": \"GetEndpoint\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/endpoints/{endpoint-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetEndpointRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetEndpointResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the settings and attributes of a specific endpoint for an application.</p>\"\
    },\
    \"GetEventStream\": {\
      \"name\": \"GetEventStream\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/eventstream\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetEventStreamRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetEventStreamResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the event stream settings for an application.</p>\"\
    },\
    \"GetExportJob\": {\
      \"name\": \"GetExportJob\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/jobs/export/{job-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetExportJobRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetExportJobResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of a specific export job for an application.</p>\"\
    },\
    \"GetExportJobs\": {\
      \"name\": \"GetExportJobs\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/jobs/export\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetExportJobsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetExportJobsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of all the export jobs for an application.</p>\"\
    },\
    \"GetGcmChannel\": {\
      \"name\": \"GetGcmChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/gcm\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetGcmChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetGcmChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the GCM channel for an application.</p>\"\
    },\
    \"GetImportJob\": {\
      \"name\": \"GetImportJob\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/jobs/import/{job-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetImportJobRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetImportJobResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of a specific import job for an application.</p>\"\
    },\
    \"GetImportJobs\": {\
      \"name\": \"GetImportJobs\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/jobs/import\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetImportJobsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetImportJobsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of all the import jobs for an application.</p>\"\
    },\
    \"GetInAppMessages\": {\
      \"name\": \"GetInAppMessages\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/endpoints/{endpoint-id}/inappmessages\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetInAppMessagesRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetInAppMessagesResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves the in-app messages targeted for the provided endpoint ID.</p>\"\
    },\
    \"GetInAppTemplate\": {\
      \"name\": \"GetInAppTemplate\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/templates/{template-name}/inapp\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetInAppTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetInAppTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves the content and settings of a message template for messages sent through the in-app channel.</p>\"\
    },\
    \"GetJourney\": {\
      \"name\": \"GetJourney\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetJourneyRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetJourneyResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status, configuration, and other settings for a journey.</p>\"\
    },\
    \"GetJourneyDateRangeKpi\": {\
      \"name\": \"GetJourneyDateRangeKpi\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}/kpis/daterange/{kpi-name}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetJourneyDateRangeKpiRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetJourneyDateRangeKpiResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves (queries) pre-aggregated data for a standard engagement metric that applies to a journey.</p>\"\
    },\
    \"GetJourneyExecutionActivityMetrics\": {\
      \"name\": \"GetJourneyExecutionActivityMetrics\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}/activities/{journey-activity-id}/execution-metrics\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetJourneyExecutionActivityMetricsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetJourneyExecutionActivityMetricsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey activity.</p>\"\
    },\
    \"GetJourneyExecutionMetrics\": {\
      \"name\": \"GetJourneyExecutionMetrics\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}/execution-metrics\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetJourneyExecutionMetricsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetJourneyExecutionMetricsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey.</p>\"\
    },\
    \"GetJourneyRunExecutionActivityMetrics\": {\
      \"name\": \"GetJourneyRunExecutionActivityMetrics\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}/runs/{run-id}/activities/{journey-activity-id}/execution-metrics\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetJourneyRunExecutionActivityMetricsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetJourneyRunExecutionActivityMetricsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves (queries) pre-aggregated data for a standard run execution metric that applies to a journey activity.</p>\"\
    },\
    \"GetJourneyRunExecutionMetrics\": {\
      \"name\": \"GetJourneyRunExecutionMetrics\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}/runs/{run-id}/execution-metrics\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetJourneyRunExecutionMetricsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetJourneyRunExecutionMetricsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves (queries) pre-aggregated data for a standard run execution metric that applies to a journey.</p>\"\
    },\
    \"GetJourneyRuns\": {\
      \"name\": \"GetJourneyRuns\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}/runs\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetJourneyRunsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetJourneyRunsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Provides information about the runs of a journey.</p>\"\
    },\
    \"GetPushTemplate\": {\
      \"name\": \"GetPushTemplate\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/templates/{template-name}/push\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetPushTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetPushTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves the content and settings of a message template for messages that are sent through a push notification channel.</p>\"\
    },\
    \"GetRecommenderConfiguration\": {\
      \"name\": \"GetRecommenderConfiguration\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/recommenders/{recommender-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetRecommenderConfigurationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetRecommenderConfigurationResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about an Amazon Pinpoint configuration for a recommender model.</p>\"\
    },\
    \"GetRecommenderConfigurations\": {\
      \"name\": \"GetRecommenderConfigurations\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/recommenders\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetRecommenderConfigurationsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetRecommenderConfigurationsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about all the recommender model configurations that are associated with your Amazon Pinpoint account.</p>\"\
    },\
    \"GetSegment\": {\
      \"name\": \"GetSegment\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/segments/{segment-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetSegmentRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetSegmentResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the configuration, dimension, and other settings for a specific segment that's associated with an application.</p>\"\
    },\
    \"GetSegmentExportJobs\": {\
      \"name\": \"GetSegmentExportJobs\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/segments/{segment-id}/jobs/export\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetSegmentExportJobsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetSegmentExportJobsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the export jobs for a segment.</p>\"\
    },\
    \"GetSegmentImportJobs\": {\
      \"name\": \"GetSegmentImportJobs\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/segments/{segment-id}/jobs/import\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetSegmentImportJobsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetSegmentImportJobsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the import jobs for a segment.</p>\"\
    },\
    \"GetSegmentVersion\": {\
      \"name\": \"GetSegmentVersion\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/segments/{segment-id}/versions/{version}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetSegmentVersionRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetSegmentVersionResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the configuration, dimension, and other settings for a specific version of a segment that's associated with an application.</p>\"\
    },\
    \"GetSegmentVersions\": {\
      \"name\": \"GetSegmentVersions\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/segments/{segment-id}/versions\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetSegmentVersionsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetSegmentVersionsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the configuration, dimension, and other settings for all the versions of a specific segment that's associated with an application.</p>\"\
    },\
    \"GetSegments\": {\
      \"name\": \"GetSegments\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/segments\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetSegmentsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetSegmentsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the configuration, dimension, and other settings for all the segments that are associated with an application.</p>\"\
    },\
    \"GetSmsChannel\": {\
      \"name\": \"GetSmsChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/sms\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetSmsChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetSmsChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the SMS channel for an application.</p>\"\
    },\
    \"GetSmsTemplate\": {\
      \"name\": \"GetSmsTemplate\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/templates/{template-name}/sms\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetSmsTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetSmsTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves the content and settings of a message template for messages that are sent through the SMS channel.</p>\"\
    },\
    \"GetUserEndpoints\": {\
      \"name\": \"GetUserEndpoints\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/users/{user-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetUserEndpointsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetUserEndpointsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about all the endpoints that are associated with a specific user ID.</p>\"\
    },\
    \"GetVoiceChannel\": {\
      \"name\": \"GetVoiceChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/voice\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetVoiceChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetVoiceChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status and settings of the voice channel for an application.</p>\"\
    },\
    \"GetVoiceTemplate\": {\
      \"name\": \"GetVoiceTemplate\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/templates/{template-name}/voice\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetVoiceTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetVoiceTemplateResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves the content and settings of a message template for messages that are sent through the voice channel.</p>\"\
    },\
    \"ListJourneys\": {\
      \"name\": \"ListJourneys\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListJourneysRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListJourneysResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about the status, configuration, and other settings for all the journeys that are associated with an application.</p>\"\
    },\
    \"ListTagsForResource\": {\
      \"name\": \"ListTagsForResource\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/tags/{resource-arn}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListTagsForResourceRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListTagsForResourceResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [],\
      \"documentation\": \"<p>Retrieves all the tags (keys and values) that are associated with an application, campaign, message template, or segment.</p>\"\
    },\
    \"ListTemplateVersions\": {\
      \"name\": \"ListTemplateVersions\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/templates/{template-name}/{template-type}/versions\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListTemplateVersionsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListTemplateVersionsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about all the versions of a specific message template.</p>\"\
    },\
    \"ListTemplates\": {\
      \"name\": \"ListTemplates\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/templates\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListTemplatesRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListTemplatesResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about all the message templates that are associated with your Amazon Pinpoint account.</p>\"\
    },\
    \"PhoneNumberValidate\": {\
      \"name\": \"PhoneNumberValidate\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/phone/number/validate\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"PhoneNumberValidateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"PhoneNumberValidateResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves information about a phone number.</p>\"\
    },\
    \"PutEventStream\": {\
      \"name\": \"PutEventStream\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/eventstream\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"PutEventStreamRequest\"\
      },\
      \"output\": {\
        \"shape\": \"PutEventStreamResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a new event stream for an application or updates the settings of an existing event stream for an application.</p>\"\
    },\
    \"PutEvents\": {\
      \"name\": \"PutEvents\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/events\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"PutEventsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"PutEventsResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a new event to record for endpoints, or creates or updates endpoint data that existing events are associated with.</p>\"\
    },\
    \"RemoveAttributes\": {\
      \"name\": \"RemoveAttributes\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/attributes/{attribute-type}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"RemoveAttributesRequest\"\
      },\
      \"output\": {\
        \"shape\": \"RemoveAttributesResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Removes one or more attributes, of the same attribute type, from all the endpoints that are associated with an application.</p>\"\
    },\
    \"SendMessages\": {\
      \"name\": \"SendMessages\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/messages\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"SendMessagesRequest\"\
      },\
      \"output\": {\
        \"shape\": \"SendMessagesResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates and sends a direct message.</p>\"\
    },\
    \"SendOTPMessage\": {\
      \"name\": \"SendOTPMessage\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/otp\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"SendOTPMessageRequest\"\
      },\
      \"output\": {\
        \"shape\": \"SendOTPMessageResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>413 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>405 response</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>429 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Send an OTP message</p>\"\
    },\
    \"SendUsersMessages\": {\
      \"name\": \"SendUsersMessages\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/apps/{application-id}/users-messages\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"SendUsersMessagesRequest\"\
      },\
      \"output\": {\
        \"shape\": \"SendUsersMessagesResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates and sends a message to a list of users.</p>\"\
    },\
    \"TagResource\": {\
      \"name\": \"TagResource\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/tags/{resource-arn}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"TagResourceRequest\"\
      },\
      \"errors\": [],\
      \"documentation\": \"<p>Adds one or more tags (keys and values) to an application, campaign, message template, or segment.</p>\"\
    },\
    \"UntagResource\": {\
      \"name\": \"UntagResource\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/tags/{resource-arn}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"UntagResourceRequest\"\
      },\
      \"errors\": [],\
      \"documentation\": \"<p>Removes one or more tags (keys and values) from an application, campaign, message template, or segment.</p>\"\
    },\
    \"UpdateAdmChannel\": {\
      \"name\": \"UpdateAdmChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/adm\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateAdmChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateAdmChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the ADM channel for an application or updates the status and settings of the ADM channel for an application.</p>\"\
    },\
    \"UpdateApnsChannel\": {\
      \"name\": \"UpdateApnsChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateApnsChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateApnsChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the APNs channel for an application or updates the status and settings of the APNs channel for an application.</p>\"\
    },\
    \"UpdateApnsSandboxChannel\": {\
      \"name\": \"UpdateApnsSandboxChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns_sandbox\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateApnsSandboxChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateApnsSandboxChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the APNs sandbox channel for an application or updates the status and settings of the APNs sandbox channel for an application.</p>\"\
    },\
    \"UpdateApnsVoipChannel\": {\
      \"name\": \"UpdateApnsVoipChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns_voip\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateApnsVoipChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateApnsVoipChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the APNs VoIP channel for an application or updates the status and settings of the APNs VoIP channel for an application.</p>\"\
    },\
    \"UpdateApnsVoipSandboxChannel\": {\
      \"name\": \"UpdateApnsVoipSandboxChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/apns_voip_sandbox\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateApnsVoipSandboxChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateApnsVoipSandboxChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the APNs VoIP sandbox channel for an application or updates the status and settings of the APNs VoIP sandbox channel for an application.</p>\"\
    },\
    \"UpdateApplicationSettings\": {\
      \"name\": \"UpdateApplicationSettings\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/settings\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateApplicationSettingsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateApplicationSettingsResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates the settings for an application.</p>\"\
    },\
    \"UpdateBaiduChannel\": {\
      \"name\": \"UpdateBaiduChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/baidu\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateBaiduChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateBaiduChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the Baidu channel for an application or updates the status and settings of the Baidu channel for an application.</p>\"\
    },\
    \"UpdateCampaign\": {\
      \"name\": \"UpdateCampaign\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/campaigns/{campaign-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateCampaignRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateCampaignResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates the configuration and other settings for a campaign.</p>\"\
    },\
    \"UpdateEmailChannel\": {\
      \"name\": \"UpdateEmailChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/email\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateEmailChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateEmailChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the email channel for an application or updates the status and settings of the email channel for an application.</p>\"\
    },\
    \"UpdateEmailTemplate\": {\
      \"name\": \"UpdateEmailTemplate\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/templates/{template-name}/email\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"UpdateEmailTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateEmailTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing message template for messages that are sent through the email channel.</p>\"\
    },\
    \"UpdateEndpoint\": {\
      \"name\": \"UpdateEndpoint\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/endpoints/{endpoint-id}\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"UpdateEndpointRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateEndpointResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a new endpoint for an application or updates the settings and attributes of an existing endpoint for an application. You can also use this operation to define custom attributes for an endpoint. If an update includes one or more values for a custom attribute, Amazon Pinpoint replaces (overwrites) any existing values with the new values.</p>\"\
    },\
    \"UpdateEndpointsBatch\": {\
      \"name\": \"UpdateEndpointsBatch\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/endpoints\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"UpdateEndpointsBatchRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateEndpointsBatchResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a new batch of endpoints for an application or updates the settings and attributes of a batch of existing endpoints for an application. You can also use this operation to define custom attributes for a batch of endpoints. If an update includes one or more values for a custom attribute, Amazon Pinpoint replaces (overwrites) any existing values with the new values.</p>\"\
    },\
    \"UpdateGcmChannel\": {\
      \"name\": \"UpdateGcmChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/gcm\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateGcmChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateGcmChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the GCM channel for an application or updates the status and settings of the GCM channel for an application.</p>\"\
    },\
    \"UpdateInAppTemplate\": {\
      \"name\": \"UpdateInAppTemplate\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/templates/{template-name}/inapp\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"UpdateInAppTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateInAppTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing message template for messages sent through the in-app message channel.</p>\"\
    },\
    \"UpdateJourney\": {\
      \"name\": \"UpdateJourney\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateJourneyRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateJourneyResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"<p>The request failed due to a conflict with the current state of the specified resource (ConflictException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates the configuration and other settings for a journey.</p>\"\
    },\
    \"UpdateJourneyState\": {\
      \"name\": \"UpdateJourneyState\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/journeys/{journey-id}/state\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateJourneyStateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateJourneyStateResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Cancels (stops) an active journey.</p>\"\
    },\
    \"UpdatePushTemplate\": {\
      \"name\": \"UpdatePushTemplate\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/templates/{template-name}/push\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"UpdatePushTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdatePushTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing message template for messages that are sent through a push notification channel.</p>\"\
    },\
    \"UpdateRecommenderConfiguration\": {\
      \"name\": \"UpdateRecommenderConfiguration\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/recommenders/{recommender-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateRecommenderConfigurationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateRecommenderConfigurationResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an Amazon Pinpoint configuration for a recommender model.</p>\"\
    },\
    \"UpdateSegment\": {\
      \"name\": \"UpdateSegment\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/segments/{segment-id}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateSegmentRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateSegmentResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.</p>\"\
    },\
    \"UpdateSmsChannel\": {\
      \"name\": \"UpdateSmsChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/sms\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateSmsChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateSmsChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the SMS channel for an application or updates the status and settings of the SMS channel for an application.</p>\"\
    },\
    \"UpdateSmsTemplate\": {\
      \"name\": \"UpdateSmsTemplate\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/templates/{template-name}/sms\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"UpdateSmsTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateSmsTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing message template for messages that are sent through the SMS channel.</p>\"\
    },\
    \"UpdateTemplateActiveVersion\": {\
      \"name\": \"UpdateTemplateActiveVersion\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/templates/{template-name}/{template-type}/active-version\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateTemplateActiveVersionRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateTemplateActiveVersionResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Changes the status of a specific version of a message template to <i>active</i>.</p>\"\
    },\
    \"UpdateVoiceChannel\": {\
      \"name\": \"UpdateVoiceChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/apps/{application-id}/channels/voice\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateVoiceChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateVoiceChannelResponse\",\
        \"documentation\": \"<p>The request succeeded.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Enables the voice channel for an application or updates the status and settings of the voice channel for an application.</p>\"\
    },\
    \"UpdateVoiceTemplate\": {\
      \"name\": \"UpdateVoiceTemplate\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/templates/{template-name}/voice\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"UpdateVoiceTemplateRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateVoiceTemplateResponse\",\
        \"documentation\": \"<p>The request was accepted for processing. Processing may not be complete.</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>The request contains a syntax error (BadRequestException).</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>The request failed due to an unknown internal server error, exception, or failure (InternalServerErrorException).</p>\"\
        },\
        {\
          \"shape\": \"PayloadTooLargeException\",\
          \"documentation\": \"<p>The request failed because the payload for the body of the request is too large (RequestEntityTooLargeException).</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>The request was denied because access to the specified resource is forbidden (ForbiddenException).</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>The request failed because the specified resource was not found (NotFoundException).</p>\"\
        },\
        {\
          \"shape\": \"MethodNotAllowedException\",\
          \"documentation\": \"<p>The request failed because the method is not allowed for the specified resource (MethodNotAllowedException).</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>The request failed because too many requests were sent during a certain amount of time (TooManyRequestsException).</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing message template for messages that are sent through the voice channel.</p>\"\
  },\
  \"VerifyOTPMessage\": {\
    \"name\": \"VerifyOTPMessage\",\
    \"http\": {\
      \"method\": \"POST\",\
      \"requestUri\": \"/v1/apps/{application-id}/verify-otp\",\
      \"responseCode\": 200\
    },\
    \"input\": {\
      \"shape\": \"VerifyOTPMessageRequest\"\
    },\
    \"output\": {\
      \"shape\": \"VerifyOTPMessageResponse\",\
      \"documentation\": \"<p>200 response</p>\"\
    },\
    \"errors\": [\
      {\
        \"shape\": \"BadRequestException\",\
        \"documentation\": \"<p>400 response</p>\"\
      },\
      {\
        \"shape\": \"InternalServerErrorException\",\
        \"documentation\": \"<p>500 response</p>\"\
      },\
      {\
        \"shape\": \"PayloadTooLargeException\",\
        \"documentation\": \"<p>413 response</p>\"\
      },\
      {\
        \"shape\": \"ForbiddenException\",\
        \"documentation\": \"<p>403 response</p>\"\
      },\
      {\
        \"shape\": \"NotFoundException\",\
        \"documentation\": \"<p>404 response</p>\"\
      },\
      {\
        \"shape\": \"MethodNotAllowedException\",\
        \"documentation\": \"<p>405 response</p>\"\
      },\
      {\
        \"shape\": \"TooManyRequestsException\",\
        \"documentation\": \"<p>429 response</p>\"\
      }\
    ],\
    \"documentation\": \"<p>Verify an OTP</p>\"\
    }\
  },\
  \"shapes\": {\
    \"ADMChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClientId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Client ID that you received from Amazon to send messages by using ADM.</p>\"\
        },\
        \"ClientSecret\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Client Secret that you received from Amazon to send messages by using ADM.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable the ADM channel for the application.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the ADM (Amazon Device Messaging) channel for an application.</p>\",\
      \"required\": [\
        \"ClientSecret\",\
        \"ClientId\"\
      ]\
    },\
    \"ADMChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the ADM channel applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the ADM channel was enabled.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the ADM channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the ADM channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the ADM channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the ADM channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the ADM channel was last modified.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of messaging or notification platform for the channel. For the ADM channel, this value is ADM.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the ADM channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the ADM (Amazon Device Messaging) channel for an application.</p>\",\
      \"required\": [\
        \"Platform\"\
      ]\
    },\
    \"ADMMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Action\": {\
          \"shape\": \"Action\",\
          \"documentation\": \"<p>The action to occur if the recipient taps the push notification. Valid values are:</p> <ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li> <li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This action uses the deep-linking features of the Android platform.</p></li> <li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the notification message.</p>\"\
        },\
        \"ConsolidationKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>An arbitrary string that indicates that multiple messages are logically the same and that Amazon Device Messaging (ADM) can drop previously enqueued messages in favor of this message.</p>\"\
        },\
        \"Data\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>The JSON data payload to use for the push notification, if the notification is a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>\"\
        },\
        \"ExpiresAfter\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The amount of time, in seconds, that ADM should store the message if the recipient's device is offline. Amazon Pinpoint specifies this value in the expiresAfter parameter when it sends the notification message to ADM.</p>\"\
        },\
        \"IconReference\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The icon image name of the asset saved in your app.</p>\"\
        },\
        \"ImageIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the large icon image to display in the content view of the push notification.</p>\"\
        },\
        \"ImageUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of an image to display in the push notification.</p>\"\
        },\
        \"MD5\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The base64-encoded, MD5 checksum of the value specified by the Data property. ADM uses the MD5 value to verify the integrity of the data.</p>\"\
        },\
        \"RawContent\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p>\"\
        },\
        \"SilentPush\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration or supporting phone home functionality.</p>\"\
        },\
        \"SmallImageIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the small icon image to display in the status bar and the content view of the push notification.</p>\"\
        },\
        \"Sound\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The sound to play when the recipient receives the push notification. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>The default message variables to use in the notification message. You can override the default variables with individual address variables.</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title to display above the notification message on the recipient's device.</p>\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL to open in the recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a one-time message that's sent directly to an endpoint through the ADM (Amazon Device Messaging) channel.</p>\"\
    },\
    \"APNSChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BundleId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.</p>\"\
        },\
        \"Certificate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate with APNs by using an APNs certificate.</p>\"\
        },\
        \"DefaultAuthenticationMethod\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default authentication method that you want Amazon Pinpoint to use when authenticating with APNs, key or certificate.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable the APNs channel for the application.</p>\"\
        },\
        \"PrivateKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate with APNs.</p>\"\
        },\
        \"TeamId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identifier that's assigned to your Apple developer account team. This identifier is used for APNs tokens.</p>\"\
        },\
        \"TokenKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The authentication key to use for APNs tokens.</p>\"\
        },\
        \"TokenKeyId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to communicate with APNs by using APNs tokens.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the APNs (Apple Push Notification service) channel for an application.</p>\"\
    },\
    \"APNSChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the APNs channel applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the APNs channel was enabled.</p>\"\
        },\
        \"DefaultAuthenticationMethod\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default authentication method that Amazon Pinpoint uses to authenticate with APNs for this channel, key or certificate.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"HasTokenKey\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs channel is configured to communicate with APNs by using APNs tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the APNs channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the APNs channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the APNs channel was last modified.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \" <p>The type of messaging or notification platform for the channel. For the APNs channel, this value is APNS.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the APNs channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the APNs (Apple Push Notification service) channel for an application.</p>\",\
      \"required\": [\
        \"Platform\"\
      ]\
    },\
    \"APNSMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSPushType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of push notification to send. Valid values are:</p> <ul><li><p>alert - For a standard notification that's displayed on recipients' devices and prompts a recipient to interact with the notification.</p></li> <li><p>background - For a silent notification that delivers content in the background and isn't displayed on recipients' devices.</p></li> <li><p>complication - For a notification that contains update information for an appâs complication timeline.</p></li> <li><p>fileprovider - For a notification that signals changes to a File Provider extension.</p></li> <li><p>mdm - For a notification that tells managed devices to contact the MDM server.</p></li> <li><p>voip - For a notification that provides information about an incoming VoIP call.</p></li></ul> <p>Amazon Pinpoint specifies this value in the apns-push-type request header when it sends the notification message to APNs. If you don't specify a value for this property, Amazon Pinpoint sets the value to alert or background automatically, based on the value that you specify for the SilentPush or RawContent property of the message.</p> <p>For more information about the apns-push-type request header, see <a href=\\\"https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/sending_notification_requests_to_apns\\\">Sending Notification Requests to APNs</a> on the Apple Developer website.</p>\"\
        },\
        \"Action\": {\
          \"shape\": \"Action\",\
          \"documentation\": \"<p>The action to occur if the recipient taps the push notification. Valid values are:</p> <ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li> <li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of the iOS platform.</p></li> <li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>\"\
        },\
        \"Badge\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The key that indicates whether and how to modify the badge of your app's icon when the recipient receives the push notification. If this key isn't included in the dictionary, the badge doesn't change. To remove the badge, set this value to 0.</p>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the notification message.</p>\"\
        },\
        \"Category\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The key that indicates the notification type for the push notification. This key is a value that's defined by the identifier property of one of your app's registered categories.</p>\"\
        },\
        \"CollapseId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>An arbitrary identifier that, if assigned to multiple messages, APNs uses to coalesce the messages into a single push notification instead of delivering each message individually. This value can't exceed 64 bytes.</p> <p>Amazon Pinpoint specifies this value in the apns-collapse-id request header when it sends the notification message to APNs.</p>\"\
        },\
        \"Data\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>The JSON payload to use for a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>\"\
        },\
        \"MediaUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of an image or video to display in the push notification.</p>\"\
        },\
        \"PreferredAuthenticationMethod\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The authentication method that you want Amazon Pinpoint to use when authenticating with APNs, CERTIFICATE or TOKEN.</p>\"\
        },\
        \"Priority\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>para>5 - Low priority, the notification might be delayed, delivered as part of a group, or throttled.</p>/listitem> <li><p>10 - High priority, the notification is sent immediately. This is the default value. A high priority notification should trigger an alert, play a sound, or badge your app's icon on the recipient's device.</p></li>/para> <p>Amazon Pinpoint specifies this value in the apns-priority request header when it sends the notification message to APNs.</p> <p>The equivalent values for Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), are normal, for 5, and high, for 10. If you specify an FCM value for this property, Amazon Pinpoint accepts and converts the value to the corresponding APNs value.</p>\"\
        },\
        \"RawContent\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p> <note><p>If you specify the raw content of an APNs push notification, the message payload has to include the content-available key. The value of the content-available key has to be an integer, and can only be 0 or 1. If you're sending a standard notification, set the value of content-available to 0. If you're sending a silent (background) notification, set the value of content-available to 1. Additionally, silent notification payloads can't include the alert, badge, or sound keys. For more information, see <a href=\\\"https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification\\\">Generating a Remote Notification</a> and <a href=\\\"https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app\\\">Pushing Background Updates to Your App</a> on the Apple Developer website.</p></note>\"\
        },\
        \"SilentPush\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the notification is a silent push notification. A silent (or background) push notification isn't displayed on recipients' devices. You can use silent push notifications to make small updates to your app, or to display messages in an in-app message center.</p> <p>Amazon Pinpoint uses this property to determine the correct value for the apns-push-type request header when it sends the notification message to APNs. If you specify a value of true for this property, Amazon Pinpoint sets the value for the apns-push-type header field to background.</p> <note><p>If you specify the raw content of an APNs push notification, the message payload has to include the content-available key. For silent (background) notifications, set the value of content-available to 1. Additionally, the message payload for a silent notification can't include the alert, badge, or sound keys. For more information, see <a href=\\\"https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification\\\">Generating a Remote Notification</a> and <a href=\\\"https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app\\\">Pushing Background Updates to Your App</a> on the Apple Developer website.</p> <p>Apple has indicated that they will throttle \\\"excessive\\\" background notifications based on current traffic volumes. To prevent your notifications being throttled, Apple recommends that you send no more than 3 silent push notifications to each recipient per hour.</p></note>\"\
        },\
        \"Sound\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The key for the sound to play when the recipient receives the push notification. The value for this key is the name of a sound file in your app's main bundle or the Library/Sounds folder in your app's data container. If the sound file can't be found or you specify default for the value, the system plays the default alert sound.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>The default message variables to use in the notification message. You can override these default variables with individual address variables.</p>\"\
        },\
        \"ThreadId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The key that represents your app-specific identifier for grouping notifications. If you provide a Notification Content app extension, you can use this value to group your notifications together.</p>\"\
        },\
        \"TimeToLive\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The amount of time, in seconds, that APNs should store and attempt to deliver the push notification, if the service is unable to deliver the notification the first time. If this value is 0, APNs treats the notification as if it expires immediately and the service doesn't store or try to deliver the notification again.</p> <p>Amazon Pinpoint specifies this value in the apns-expiration request header when it sends the notification message to APNs.</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title to display above the notification message on the recipient's device.</p>\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL to open in the recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a one-time message that's sent directly to an endpoint through the APNs (Apple Push Notification service) channel.</p>\"\
    },\
    \"APNSPushNotificationTemplate\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Action\": {\
          \"shape\": \"Action\",\
          \"documentation\": \"<p>The action to occur if a recipient taps a push notification that's based on the message template. Valid values are:</p> <ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li> <li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of the iOS platform.</p></li> <li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body to use in push notifications that are based on the message template.</p>\"\
        },\
        \"MediaUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of an image or video to display in push notifications that are based on the message template.</p>\"\
        },\
        \"RawContent\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for push notifications that are based on the message template. If specified, this value overrides all other content for the message template.</p>\"\
        },\
        \"Sound\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The key for the sound to play when the recipient receives a push notification that's based on the message template. The value for this key is the name of a sound file in your app's main bundle or the Library/Sounds folder in your app's data container. If the sound file can't be found or you specify default for the value, the system plays the default alert sound.</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title to use in push notifications that are based on the message template. This title appears above the notification message on a recipient's device.</p>\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL to open in the recipient's default mobile browser, if a recipient taps a push notification that's based on the message template and the value of the Action property is URL.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies channel-specific content and settings for a message template that can be used in push notifications that are sent through the APNs (Apple Push Notification service) channel.</p>\"\
    },\
    \"APNSSandboxChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BundleId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.</p>\"\
        },\
        \"Certificate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate with the APNs sandbox environment by using an APNs certificate.</p>\"\
        },\
        \"DefaultAuthenticationMethod\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default authentication method that you want Amazon Pinpoint to use when authenticating with the APNs sandbox environment, key or certificate.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable the APNs sandbox channel for the application.</p>\"\
        },\
        \"PrivateKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate with the APNs sandbox environment.</p>\"\
        },\
        \"TeamId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identifier that's assigned to your Apple developer account team. This identifier is used for APNs tokens.</p>\"\
        },\
        \"TokenKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The authentication key to use for APNs tokens.</p>\"\
        },\
        \"TokenKeyId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to communicate with the APNs sandbox environment by using APNs tokens.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the APNs (Apple Push Notification service) sandbox channel for an application.</p>\"\
    },\
    \"APNSSandboxChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the APNs sandbox channel applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the APNs sandbox channel was enabled.</p>\"\
        },\
        \"DefaultAuthenticationMethod\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default authentication method that Amazon Pinpoint uses to authenticate with the APNs sandbox environment for this channel, key or certificate.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs sandbox channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"HasTokenKey\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs sandbox channel is configured to communicate with APNs by using APNs tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the APNs sandbox channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs sandbox channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the APNs sandbox channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the APNs sandbox channel was last modified.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of messaging or notification platform for the channel. For the APNs sandbox channel, this value is APNS_SANDBOX.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the APNs sandbox channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the APNs (Apple Push Notification service) sandbox channel for an application.</p>\",\
      \"required\": [\
        \"Platform\"\
      ]\
    },\
    \"APNSVoipChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BundleId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.</p>\"\
        },\
        \"Certificate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate with APNs by using an APNs certificate.</p>\"\
        },\
        \"DefaultAuthenticationMethod\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default authentication method that you want Amazon Pinpoint to use when authenticating with APNs, key or certificate.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable the APNs VoIP channel for the application.</p>\"\
        },\
        \"PrivateKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate with APNs.</p>\"\
        },\
        \"TeamId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identifier that's assigned to your Apple developer account team. This identifier is used for APNs tokens.</p>\"\
        },\
        \"TokenKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The authentication key to use for APNs tokens.</p>\"\
        },\
        \"TokenKeyId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to communicate with APNs by using APNs tokens.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the APNs (Apple Push Notification service) VoIP channel for an application.</p>\"\
    },\
    \"APNSVoipChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the APNs VoIP channel applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the APNs VoIP channel was enabled.</p>\"\
        },\
        \"DefaultAuthenticationMethod\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default authentication method that Amazon Pinpoint uses to authenticate with APNs for this channel, key or certificate.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs VoIP channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"HasTokenKey\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs VoIP channel is configured to communicate with APNs by using APNs tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the APNs VoIP channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs VoIP channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the APNs VoIP channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the APNs VoIP channel was last modified.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of messaging or notification platform for the channel. For the APNs VoIP channel, this value is APNS_VOIP.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the APNs VoIP channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP channel for an application.</p>\",\
      \"required\": [\
        \"Platform\"\
      ]\
    },\
    \"APNSVoipSandboxChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BundleId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.</p>\"\
        },\
        \"Certificate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate with the APNs sandbox environment by using an APNs certificate.</p>\"\
        },\
        \"DefaultAuthenticationMethod\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default authentication method that you want Amazon Pinpoint to use when authenticating with the APNs sandbox environment for this channel, key or certificate.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs VoIP sandbox channel is enabled for the application.</p>\"\
        },\
        \"PrivateKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate with the APNs sandbox environment.</p>\"\
        },\
        \"TeamId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identifier that's assigned to your Apple developer account team. This identifier is used for APNs tokens.</p>\"\
        },\
        \"TokenKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The authentication key to use for APNs tokens.</p>\"\
        },\
        \"TokenKeyId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to communicate with the APNs sandbox environment by using APNs tokens.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the APNs (Apple Push Notification service) VoIP sandbox channel for an application.</p>\"\
    },\
    \"APNSVoipSandboxChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the APNs VoIP sandbox channel applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the APNs VoIP sandbox channel was enabled.</p>\"\
        },\
        \"DefaultAuthenticationMethod\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default authentication method that Amazon Pinpoint uses to authenticate with the APNs sandbox environment for this channel, key or certificate.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs VoIP sandbox channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"HasTokenKey\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs VoIP sandbox channel is configured to communicate with APNs by using APNs tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the APNs VoIP sandbox channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the APNs VoIP sandbox channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the APNs VoIP sandbox channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the APNs VoIP sandbox channel was last modified.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of messaging or notification platform for the channel. For the APNs VoIP sandbox channel, this value is APNS_VOIP_SANDBOX.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the APNs VoIP sandbox channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP sandbox channel for an application.</p>\",\
      \"required\": [\
        \"Platform\"\
      ]\
    },\
    \"Action\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"OPEN_APP\",\
        \"DEEP_LINK\",\
        \"URL\"\
      ]\
    },\
    \"ActivitiesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfActivityResponse\",\
          \"documentation\": \"<p>An array of responses, one for each activity that was performed by the campaign.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the activities that were performed by a campaign.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"Activity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CUSTOM\": {\
          \"shape\": \"CustomMessageActivity\",\
          \"documentation\": \"<p>The settings for a custom message activity. This type of activity calls an AWS Lambda function or web hook that sends messages to participants.</p>\"\
        },\
        \"ConditionalSplit\": {\
          \"shape\": \"ConditionalSplitActivity\",\
          \"documentation\": \"<p>The settings for a yes/no split activity. This type of activity sends participants down one of two paths in a journey, based on conditions that you specify.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the activity.</p>\"\
        },\
        \"EMAIL\": {\
          \"shape\": \"EmailMessageActivity\",\
          \"documentation\": \"<p>The settings for an email activity. This type of activity sends an email message to participants.</p>\"\
        },\
        \"Holdout\": {\
          \"shape\": \"HoldoutActivity\",\
          \"documentation\": \"<p>The settings for a holdout activity. This type of activity stops a journey for a specified percentage of participants.</p>\"\
        },\
        \"MultiCondition\": {\
          \"shape\": \"MultiConditionalSplitActivity\",\
          \"documentation\": \"<p>The settings for a multivariate split activity. This type of activity sends participants down one of as many as five paths (including a default <i>Else</i> path) in a journey, based on conditions that you specify.</p>\"\
        },\
        \"PUSH\": {\
          \"shape\": \"PushMessageActivity\",\
          \"documentation\": \"<p>The settings for a push notification activity. This type of activity sends a push notification to participants.</p>\"\
        },\
        \"RandomSplit\": {\
          \"shape\": \"RandomSplitActivity\",\
          \"documentation\": \"<p>The settings for a random split activity. This type of activity randomly sends specified percentages of participants down one of as many as five paths in a journey, based on conditions that you specify.</p>\"\
        },\
        \"SMS\": {\
          \"shape\": \"SMSMessageActivity\",\
          \"documentation\": \"<p>The settings for an SMS activity. This type of activity sends a text message to participants.</p>\"\
        },\
        \"Wait\": {\
          \"shape\": \"WaitActivity\",\
          \"documentation\": \"<p>The settings for a wait activity. This type of activity waits for a certain amount of time or until a specific date and time before moving participants to the next activity in a journey.</p>\"\
        },\
        \"ContactCenter\": {\
          \"shape\": \"ContactCenterActivity\",\
          \"documentation\": \"<p>The settings for a connect activity. This type of activity initiates a contact center call to participants.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the configuration and other settings for an activity in a journey.</p>\"\
    },\
    \"ActivityResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the campaign applies to.</p>\"\
        },\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the campaign that the activity applies to.</p>\"\
        },\
        \"End\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The actual time, in ISO 8601 format, when the activity was marked CANCELLED or COMPLETED.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the activity.</p>\"\
        },\
        \"Result\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Specifies whether the activity succeeded. Possible values are SUCCESS and FAIL.</p>\"\
        },\
        \"ScheduledStart\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The scheduled start time, in ISO 8601 format, for the activity.</p>\"\
        },\
        \"Start\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The actual start time, in ISO 8601 format, of the activity.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The current status of the activity. Possible values are: PENDING, INITIALIZING, RUNNING, PAUSED, CANCELLED, and COMPLETED.</p>\"\
        },\
        \"SuccessfulEndpointCount\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of endpoints that the campaign successfully delivered messages to.</p>\"\
        },\
        \"TimezonesCompletedCount\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of time zones that were completed.</p>\"\
        },\
        \"TimezonesTotalCount\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of unique time zones that are in the segment for the campaign.</p>\"\
        },\
        \"TotalEndpointCount\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of endpoints that the campaign attempted to deliver messages to.</p>\"\
        },\
        \"TreatmentId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the campaign treatment that the activity applies to. A treatment is a variation of a campaign that's used for A/B testing of a campaign.</p>\"\
        },\
        \"ExecutionMetrics\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A JSON object that contains metrics relating to the campaign execution for this campaign activity. For information about the structure and contents of the results, see <a href=\\\"https://docs.aws.amazon.com//pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Standard Amazon Pinpoint analytics metrics</a> in the <i>Amazon Pinpoint Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an activity that was performed by a campaign.</p>\",\
      \"required\": [\
        \"CampaignId\",\
        \"Id\",\
        \"ApplicationId\"\
      ]\
    },\
    \"AddressConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BodyOverride\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body to use instead of the default message body. This value overrides the default message body.</p>\"\
        },\
        \"ChannelType\": {\
          \"shape\": \"ChannelType\",\
          \"documentation\": \"<p>The channel to use when sending the message.</p>\"\
        },\
        \"Context\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>An object that maps custom attributes to attributes for the address and is attached to the message. Attribute names are case sensitive.</p> <p>For a push notification, this payload is added to the data.pinpoint object. For an email or text message, this payload is added to email/SMS delivery receipt event attributes.</p>\"\
        },\
        \"RawContent\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for the message. If specified, this value overrides all other values for the message.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>A map of the message variables to merge with the variables specified by properties of the DefaultMessage object. The variables specified in this map take precedence over all other variables.</p>\"\
        },\
        \"TitleOverride\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message title to use instead of the default message title. This value overrides the default message title.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies address-based configuration settings for a message that's sent directly to an endpoint.</p>\"\
    },\
    \"Alignment\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"LEFT\",\
        \"CENTER\",\
        \"RIGHT\"\
      ]\
    },\
    \"AndroidPushNotificationTemplate\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Action\": {\
          \"shape\": \"Action\",\
          \"documentation\": \"<p>The action to occur if a recipient taps a push notification that's based on the message template. Valid values are:</p> <ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li> <li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This action uses the deep-linking features of the Android platform.</p></li> <li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body to use in a push notification that's based on the message template.</p>\"\
        },\
        \"ImageIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the large icon image to display in the content view of a push notification that's based on the message template.</p>\"\
        },\
        \"ImageUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of an image to display in a push notification that's based on the message template.</p>\"\
        },\
        \"RawContent\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for a push notification that's based on the message template. If specified, this value overrides all other content for the message template.</p>\"\
        },\
        \"SmallImageIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the small icon image to display in the status bar and the content view of a push notification that's based on the message template.</p>\"\
        },\
        \"Sound\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The sound to play when a recipient receives a push notification that's based on the message template. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title to use in a push notification that's based on the message template. This title appears above the notification message on a recipient's device.</p>\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL to open in a recipient's default mobile browser, if a recipient taps a push notification that's based on the message template and the value of the Action property is URL.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies channel-specific content and settings for a message template that can be used in push notifications that are sent through the ADM (Amazon Device Messaging), Baidu (Baidu Cloud Push), or GCM (Firebase Cloud Messaging, formerly Google Cloud Messaging) channel.</p>\"\
    },\
    \"ApplicationDateRangeKpiResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the metric applies to.</p>\"\
        },\
        \"EndTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The last date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>\"\
        },\
        \"KpiName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, that the data was retrieved for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. For a list of possible values, see the <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Amazon Pinpoint Developer Guide</a>.</p>\"\
        },\
        \"KpiResult\": {\
          \"shape\": \"BaseKpiResult\",\
          \"documentation\": \"<p>An array of objects that contains the results of the query. Each object contains the value for the metric and metadata about that value.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null for the Application Metrics resource because the resource returns all results in a single page.</p>\"\
        },\
        \"StartTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The first date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the results of a query that retrieved the data for a standard metric that applies to an application, and provides information about that query.</p>\",\
      \"required\": [\
        \"KpiResult\",\
        \"KpiName\",\
        \"EndTime\",\
        \"StartTime\",\
        \"ApplicationId\"\
      ]\
    },\
    \"ApplicationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the application.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The display name of the application. This name is displayed as the <b>Project name</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that identifies the tags that are associated with the application. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the Application was created.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an application.</p>\",\
      \"required\": [\
        \"Id\",\
        \"Arn\",\
        \"Name\"\
      ]\
    },\
    \"ApplicationSettingsResource\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"CampaignHook\": {\
          \"shape\": \"CampaignHook\",\
          \"documentation\": \"<p>The settings for the AWS Lambda function to invoke by default as a code hook for campaigns in the application. You can use this hook to customize segments that are used by campaigns in the application.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the application's settings were last modified.</p>\"\
        },\
        \"Limits\": {\
          \"shape\": \"CampaignLimits\",\
          \"documentation\": \"<p>The default sending limits for campaigns in the application.</p>\"\
        },\
        \"QuietTime\": {\
          \"shape\": \"QuietTime\",\
          \"documentation\": \"<p>The default quiet time for campaigns in the application. Quiet time is a specific time range when messages aren't sent to endpoints, if all the following conditions are met:</p> <ul><li><p>The EndpointDemographic.Timezone property of the endpoint is set to a valid value.</p></li> <li><p>The current time in the endpoint's time zone is later than or equal to the time specified by the QuietTime.Start property for the application (or a campaign or journey that has custom quiet time settings).</p></li> <li><p>The current time in the endpoint's time zone is earlier than or equal to the time specified by the QuietTime.End property for the application (or a campaign or journey that has custom quiet time settings).</p></li></ul> <p>If any of the preceding conditions isn't met, the endpoint will receive messages from a campaign or journey, even if quiet time is enabled.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an application, including the default settings for an application.</p>\",\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"ApplicationsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfApplicationResponse\",\
          \"documentation\": \"<p>An array of responses, one for each application that was returned.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about all of your applications.</p>\"\
    },\
    \"AttributeDimension\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AttributeType\": {\
          \"shape\": \"AttributeType\",\
          \"documentation\": \"<p>The type of segment dimension to use. Valid values are: <ul><li>INCLUSIVE - endpoints that have attributes matching the values are included in the segment.</li><li>EXCLUSIVE - endpoints that have attributes matching the values are excluded in the segment.</li><li>CONTAINS - endpoints that have attributes' substrings match the values are included in the segment.</li><li>BEFORE - endpoints with attributes read as ISO_INSTANT datetimes before the value are included in the segment.</li><li>AFTER - endpoints with attributes read as ISO_INSTANT datetimes after the value are included in the segment.</li><li>ON - endpoints with attributes read as ISO_INSTANT dates on the value are included in the segment. Time is ignored in this comparison.</li><li>BETWEEN - endpoints with attributes read as ISO_INSTANT datetimes between the values are included in the segment.</li></p>\"\
        },\
        \"Values\": {\
          \"shape\": \"ListOf__string\",\
          \"documentation\": \"<p>The criteria values to use for the segment dimension. Depending on the value of the AttributeType property, endpoints are included or excluded from the segment if their attribute values match the criteria values.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies attribute-based criteria for including or excluding endpoints from a segment.</p>\",\
      \"required\": [\
        \"Values\"\
      ]\
    },\
    \"AttributeType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"INCLUSIVE\",\
        \"EXCLUSIVE\",\
        \"CONTAINS\",\
        \"BEFORE\",\
        \"AFTER\",\
        \"ON\",\
        \"BETWEEN\"\
      ]\
    },\
    \"AttributesResource\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application.</p>\"\
        },\
        \"AttributeType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of attribute or attributes that were removed from the endpoints. Valid values are:</p> <ul><li><p>endpoint-custom-attributes - Custom attributes that describe endpoints.</p></li> <li><p>endpoint-metric-attributes - Custom metrics that your app reports to Amazon Pinpoint for endpoints.</p></li> <li><p>endpoint-user-attributes - Custom attributes that describe users.</p></li></ul>\"\
        },\
        \"Attributes\": {\
          \"shape\": \"ListOf__string\",\
          \"documentation\": \"<p>An array that specifies the names of the attributes that were removed from the endpoints.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the type and the names of attributes that were removed from all the endpoints that are associated with an application.</p>\",\
      \"required\": [\
        \"AttributeType\",\
        \"ApplicationId\"\
      ]\
    },\
    \"BadRequestException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request or response.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an API request or response.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 400\
      }\
    },\
    \"BaiduChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApiKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The API key that you received from the Baidu Cloud Push service to communicate with the service.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable the Baidu channel for the application.</p>\"\
        },\
        \"SecretKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The secret key that you received from the Baidu Cloud Push service to communicate with the service.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the Baidu (Baidu Cloud Push) channel for an application.</p>\",\
      \"required\": [\
        \"SecretKey\",\
        \"ApiKey\"\
      ]\
    },\
    \"BaiduChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the Baidu channel applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the Baidu channel was enabled.</p>\"\
        },\
        \"Credential\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The API key that you received from the Baidu Cloud Push service to communicate with the service.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the Baidu channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the Baidu channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the Baidu channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the Baidu channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the Baidu channel was last modified.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of messaging or notification platform for the channel. For the Baidu channel, this value is BAIDU.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the Baidu channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the Baidu (Baidu Cloud Push) channel for an application.</p>\",\
      \"required\": [\
        \"Credential\",\
        \"Platform\"\
      ]\
    },\
    \"BaiduMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Action\": {\
          \"shape\": \"Action\",\
          \"documentation\": \"<p>The action to occur if the recipient taps the push notification. Valid values are:</p> <ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li> <li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This action uses the deep-linking features of the Android platform.</p></li> <li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the notification message.</p>\"\
        },\
        \"Data\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>The JSON data payload to use for the push notification, if the notification is a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>\"\
        },\
        \"IconReference\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The icon image name of the asset saved in your app.</p>\"\
        },\
        \"ImageIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the large icon image to display in the content view of the push notification.</p>\"\
        },\
        \"ImageUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of an image to display in the push notification.</p>\"\
        },\
        \"RawContent\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p>\"\
        },\
        \"SilentPush\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration or supporting phone home functionality.</p>\"\
        },\
        \"SmallImageIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the small icon image to display in the status bar and the content view of the push notification.</p>\"\
        },\
        \"Sound\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The sound to play when the recipient receives the push notification. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>The default message variables to use in the notification message. You can override the default variables with individual address variables.</p>\"\
        },\
        \"TimeToLive\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The amount of time, in seconds, that the Baidu Cloud Push service should store the message if the recipient's device is offline. The default value and maximum supported time is 604,800 seconds (7 days).</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title to display above the notification message on the recipient's device.</p>\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL to open in the recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a one-time message that's sent directly to an endpoint through the Baidu (Baidu Cloud Push) channel.</p>\"\
    },\
    \"BaseKpiResult\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Rows\": {\
          \"shape\": \"ListOfResultRow\",\
          \"documentation\": \"<p>An array of objects that provides the results of a query that retrieved the data for a standard metric that applies to an application, campaign, or journey.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the results of a query that retrieved the data for a standard metric that applies to an application, campaign, or journey.</p>\",\
      \"required\": [\
        \"Rows\"\
      ]\
    },\
    \"ButtonAction\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"LINK\",\
        \"DEEP_LINK\",\
        \"CLOSE\"\
      ]\
    },\
    \"CampaignCustomMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Data\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for the message. The maximum size is 5 KB.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the contents of a message that's sent through a custom channel to recipients of a campaign.</p>\"\
    },\
    \"CampaignDateRangeKpiResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the metric applies to.</p>\"\
        },\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the campaign that the metric applies to.</p>\"\
        },\
        \"EndTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The last date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>\"\
        },\
        \"KpiName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, that the data was retrieved for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. For a list of possible values, see the <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Amazon Pinpoint Developer Guide</a>.</p>\"\
        },\
        \"KpiResult\": {\
          \"shape\": \"BaseKpiResult\",\
          \"documentation\": \"<p>An array of objects that contains the results of the query. Each object contains the value for the metric and metadata about that value.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null for the Campaign Metrics resource because the resource returns all results in a single page.</p>\"\
        },\
        \"StartTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The first date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the results of a query that retrieved the data for a standard metric that applies to a campaign, and provides information about that query.</p>\",\
      \"required\": [\
        \"KpiResult\",\
        \"KpiName\",\
        \"EndTime\",\
        \"CampaignId\",\
        \"StartTime\",\
        \"ApplicationId\"\
      ]\
    },\
    \"CampaignEmailMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the email for recipients whose email clients don't render HTML content.</p>\"\
        },\
        \"FromAddress\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The verified email address to send the email from. The default address is the FromAddress specified for the email channel for the application.</p>\"\
        },\
        \"HtmlBody\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the email, in HTML format, for recipients whose email clients render HTML content.</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The subject line, or title, of the email.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the content and \\\"From\\\" address for an email message that's sent to recipients of a campaign.</p>\"\
    },\
    \"CampaignEventFilter\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Dimensions\": {\
          \"shape\": \"EventDimensions\",\
          \"documentation\": \"<p>The dimension settings of the event filter for the campaign.</p>\"\
        },\
        \"FilterType\": {\
          \"shape\": \"FilterType\",\
          \"documentation\": \"<p>The type of event that causes the campaign to be sent. Valid values are: SYSTEM, sends the campaign when a system event occurs; and, ENDPOINT, sends the campaign when an endpoint event (<link  linkend=\\\"apps-application-id-events\\\">Events</link> resource) occurs.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for events that cause a campaign to be sent.</p>\",\
      \"required\": [\
        \"FilterType\",\
        \"Dimensions\"\
      ]\
    },\
    \"CampaignHook\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"LambdaFunctionName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name or Amazon Resource Name (ARN) of the AWS Lambda function that Amazon Pinpoint invokes to customize a segment for a campaign.</p>\"\
        },\
        \"Mode\": {\
          \"shape\": \"Mode\",\
          \"documentation\": \"<p>The mode that Amazon Pinpoint uses to invoke the AWS Lambda function. Possible values are:</p> <ul><li><p>FILTER - Invoke the function to customize the segment that's used by a campaign.</p></li> <li><p>DELIVERY - (Deprecated) Previously, invoked the function to send a campaign through a custom channel. This functionality is not supported anymore. To send a campaign through a custom channel, use the CustomDeliveryConfiguration and CampaignCustomMessage objects of the campaign.</p></li></ul>\"\
        },\
        \"WebUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \" <p>The web URL that Amazon Pinpoint calls to invoke the AWS Lambda function over HTTPS.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies settings for invoking an AWS Lambda function that customizes a segment for a campaign.</p>\"\
    },\
    \"CampaignInAppMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body of the notification, the email body or the text message.</p>\"\
        },\
        \"Content\": {\
          \"shape\": \"ListOfInAppMessageContent\",\
          \"documentation\": \"<p>In-app message content.</p>\"\
        },\
        \"CustomConfig\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>Custom config to be sent to client.</p>\"\
        },\
        \"Layout\": {\
          \"shape\": \"Layout\",\
          \"documentation\": \"<p>In-app message layout.</p>\"\
        }\
      },\
      \"documentation\": \"<p>In-app message configuration.</p>\"\
    },\
    \"CampaignLimits\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Daily\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum number of messages that a campaign can send to a single endpoint during a 24-hour period. For an application, this value specifies the default limit for the number of messages that campaigns and journeys can send to a single endpoint during a 24-hour period. The maximum value is 100.</p>\"\
        },\
        \"MaximumDuration\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum amount of time, in seconds, that a campaign can attempt to deliver a message after the scheduled start time for the campaign. The minimum value is 60 seconds.</p>\"\
        },\
        \"MessagesPerSecond\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum number of messages that a campaign can send each second. For an application, this value specifies the default limit for the number of messages that campaigns can send each second. The minimum value is 50. The maximum value is 20,000.</p>\"\
        },\
        \"Total\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum number of messages that a campaign can send to a single endpoint during the course of the campaign. If a campaign recurs, this setting applies to all runs of the campaign. The maximum value is 100.</p>\"\
        },\
        \"Session\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum total number of messages that the campaign can send per user session.</p>\"\
        }\
      },\
      \"documentation\": \"<p>For a campaign, specifies limits on the messages that the campaign can send. For an application, specifies the default limits for messages that campaigns in the application can send.</p>\"\
    },\
    \"CampaignResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AdditionalTreatments\": {\
          \"shape\": \"ListOfTreatmentResource\",\
          \"documentation\": \"<p>An array of responses, one for each treatment that you defined for the campaign, in addition to the default treatment.</p>\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the campaign applies to.</p>\"\
        },\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the campaign.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the campaign was created.</p>\"\
        },\
        \"CustomDeliveryConfiguration\": {\
          \"shape\": \"CustomDeliveryConfiguration\",\
          \"documentation\": \"<p>The delivery configuration settings for sending the campaign through a custom channel.</p>\"\
        },\
        \"DefaultState\": {\
          \"shape\": \"CampaignState\",\
          \"documentation\": \"<p>The current status of the campaign's default treatment. This value exists only for campaigns that have more than one treatment.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the campaign.</p>\"\
        },\
        \"HoldoutPercent\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The allocated percentage of users (segment members) who shouldn't receive messages from the campaign.</p>\"\
        },\
        \"Hook\": {\
          \"shape\": \"CampaignHook\",\
          \"documentation\": \"<p>The settings for the AWS Lambda function to use as a code hook for the campaign. You can use this hook to customize the segment that's used by the campaign.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the campaign.</p>\"\
        },\
        \"IsPaused\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the campaign is paused. A paused campaign doesn't run unless you resume it by changing this value to false.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the campaign was last modified.</p>\"\
        },\
        \"Limits\": {\
          \"shape\": \"CampaignLimits\",\
          \"documentation\": \"<p>The messaging limits for the campaign.</p>\"\
        },\
        \"MessageConfiguration\": {\
          \"shape\": \"MessageConfiguration\",\
          \"documentation\": \"<p>The message configuration settings for the campaign.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the campaign.</p>\"\
        },\
        \"Schedule\": {\
          \"shape\": \"Schedule\",\
          \"documentation\": \"<p>The schedule settings for the campaign.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the segment that's associated with the campaign.</p>\"\
        },\
        \"SegmentVersion\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The version number of the segment that's associated with the campaign.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"CampaignState\",\
          \"documentation\": \"<p>The current status of the campaign.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that identifies the tags that are associated with the campaign. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateConfiguration\": {\
          \"shape\": \"TemplateConfiguration\",\
          \"documentation\": \"<p>The message template thatâs used for the campaign.</p>\"\
        },\
        \"TreatmentDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the default treatment for the campaign.</p>\"\
        },\
        \"TreatmentName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom name of the default treatment for the campaign, if the campaign has multiple treatments. A <i>treatment</i> is a variation of a campaign that's used for A/B testing.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The version number of the campaign.</p>\"\
        },\
        \"Priority\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>Defines the priority of the campaign, used to decide the order of messages displayed to user if there are multiple messages scheduled to be displayed at the same moment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status, configuration, and other settings for a campaign.</p>\",\
      \"required\": [\
        \"LastModifiedDate\",\
        \"CreationDate\",\
        \"SegmentId\",\
        \"SegmentVersion\",\
        \"Id\",\
        \"Arn\",\
        \"ApplicationId\"\
      ]\
    },\
    \"CampaignSmsMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the SMS message.</p>\"\
        },\
        \"MessageType\": {\
          \"shape\": \"MessageType\",\
          \"documentation\": \"<p>The SMS message type. Valid values are TRANSACTIONAL (for messages that are critical or time-sensitive, such as a one-time passwords) and PROMOTIONAL (for messsages that aren't critical or time-sensitive, such as marketing messages).</p>\"\
        },\
        \"OriginationNumber\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The long code to send the SMS message from. This value should be one of the dedicated long codes that's assigned to your AWS account. Although it isn't required, we recommend that you specify the long code using an E.164 format to ensure prompt and accurate delivery of the message. For example, +12065550100.</p>\"\
        },\
        \"SenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The sender ID to display on recipients' devices when they receive the SMS message.</p>\"\
        },\
        \"EntityId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The entity ID or Principal Entity (PE) id received from the regulatory body for sending SMS in your country.</p>\"\
        },\
        \"TemplateId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The template ID received from the regulatory body for sending SMS in your country.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the content and settings for an SMS message that's sent to recipients of a campaign.</p>\"\
    },\
    \"CampaignState\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignStatus\": {\
          \"shape\": \"CampaignStatus\",\
          \"documentation\": \"<p>The current status of the campaign, or the current status of a treatment that belongs to an A/B test campaign.</p> <p>If a campaign uses A/B testing, the campaign has a status of COMPLETED only if all campaign treatments have a status of COMPLETED. If you delete the segment that's associated with a campaign, the campaign fails and has a status of DELETED.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status of a campaign.</p>\"\
    },\
    \"CampaignStatus\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"SCHEDULED\",\
        \"EXECUTING\",\
        \"PENDING_NEXT_RUN\",\
        \"COMPLETED\",\
        \"PAUSED\",\
        \"DELETED\",\
        \"INVALID\"\
      ]\
    },\
    \"CampaignsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfCampaignResponse\",\
          \"documentation\": \"<p>An array of responses, one for each campaign that's associated with the application.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the configuration and other settings for all the campaigns that are associated with an application.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"ChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the channel was enabled.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the channel was last modified.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the general settings and status of a channel for an application.</p>\"\
    },\
    \"ChannelType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"PUSH\",\
        \"GCM\",\
        \"APNS\",\
        \"APNS_SANDBOX\",\
        \"APNS_VOIP\",\
        \"APNS_VOIP_SANDBOX\",\
        \"ADM\",\
        \"SMS\",\
        \"VOICE\",\
        \"EMAIL\",\
        \"BAIDU\",\
        \"CUSTOM\",\
        \"IN_APP\"\
      ]\
    },\
    \"ChannelsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Channels\": {\
          \"shape\": \"MapOfChannelResponse\",\
          \"documentation\": \"<p>A map that contains a multipart response for each channel. For each item in this object, the ChannelType is the key and the Channel is the value.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the general settings and status of all channels for an application, including channels that aren't enabled for the application.</p>\",\
      \"required\": [\
        \"Channels\"\
      ]\
    },\
    \"Condition\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Conditions\": {\
          \"shape\": \"ListOfSimpleCondition\",\
          \"documentation\": \"<p>The conditions to evaluate for the activity.</p>\"\
        },\
        \"Operator\": {\
          \"shape\": \"Operator\",\
          \"documentation\": \"<p>Specifies how to handle multiple conditions for the activity. For example, if you specify two conditions for an activity, whether both or only one of the conditions must be met for the activity to be performed.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the conditions to evaluate for an activity in a journey, and how to evaluate those conditions.</p>\"\
    },\
    \"ConditionalSplitActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Condition\": {\
          \"shape\": \"Condition\",\
          \"documentation\": \"<p>The conditions that define the paths for the activity, and the relationship between the conditions.</p>\"\
        },\
        \"EvaluationWaitTime\": {\
          \"shape\": \"WaitTime\",\
          \"documentation\": \"<p>The amount of time to wait before determining whether the conditions are met, or the date and time when Amazon Pinpoint determines whether the conditions are met.</p>\"\
        },\
        \"FalseActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the activity to perform if the conditions aren't met.</p>\"\
        },\
        \"TrueActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the activity to perform if the conditions are met.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a yes/no split activity in a journey. This type of activity sends participants down one of two paths in a journey, based on conditions that you specify.</p> <note><p>To create yes/no split activities that send participants down different paths based on push notification events (such as Open or Received events), your mobile app has to specify the User ID and Endpoint ID values. For more information, see <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/integrate.html\\\">Integrating Amazon Pinpoint with your application</a> in the <i>Amazon Pinpoint Developer Guide</i>.</p></note>\"\
    },\
    \"ContactCenterActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the next activity to perform after the this activity.</p>\"\
        }\
      }\
    },\
    \"ConflictException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request or response.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an API request or response.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 409\
      }\
    },\
    \"CreateAppRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateApplicationRequest\": {\
          \"shape\": \"CreateApplicationRequest\"\
        }\
      },\
      \"required\": [\
        \"CreateApplicationRequest\"\
      ],\
      \"payload\": \"CreateApplicationRequest\"\
    },\
    \"CreateAppResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationResponse\": {\
          \"shape\": \"ApplicationResponse\"\
        }\
      },\
      \"required\": [\
        \"ApplicationResponse\"\
      ],\
      \"payload\": \"ApplicationResponse\"\
    },\
    \"CreateApplicationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The display name of the application. This name is displayed as the <b>Project name</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that defines the tags to associate with the application. Each tag consists of a required tag key and an associated tag value.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the display name of an application and the tags to associate with the application.</p>\",\
      \"required\": [\
        \"Name\"\
      ]\
    },\
    \"CreateCampaignRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"WriteCampaignRequest\": {\
          \"shape\": \"WriteCampaignRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"WriteCampaignRequest\"\
      ],\
      \"payload\": \"WriteCampaignRequest\"\
    },\
    \"CreateCampaignResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignResponse\": {\
          \"shape\": \"CampaignResponse\"\
        }\
      },\
      \"required\": [\
        \"CampaignResponse\"\
      ],\
      \"payload\": \"CampaignResponse\"\
    },\
    \"CreateEmailTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EmailTemplateRequest\": {\
          \"shape\": \"EmailTemplateRequest\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"EmailTemplateRequest\"\
      ],\
      \"payload\": \"EmailTemplateRequest\"\
    },\
    \"CreateEmailTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateTemplateMessageBody\": {\
          \"shape\": \"CreateTemplateMessageBody\"\
        }\
      },\
      \"required\": [\
        \"CreateTemplateMessageBody\"\
      ],\
      \"payload\": \"CreateTemplateMessageBody\"\
    },\
    \"CreateExportJobRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"ExportJobRequest\": {\
          \"shape\": \"ExportJobRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"ExportJobRequest\"\
      ],\
      \"payload\": \"ExportJobRequest\"\
    },\
    \"CreateExportJobResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ExportJobResponse\": {\
          \"shape\": \"ExportJobResponse\"\
        }\
      },\
      \"required\": [\
        \"ExportJobResponse\"\
      ],\
      \"payload\": \"ExportJobResponse\"\
    },\
    \"CreateImportJobRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"ImportJobRequest\": {\
          \"shape\": \"ImportJobRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"ImportJobRequest\"\
      ],\
      \"payload\": \"ImportJobRequest\"\
    },\
    \"CreateImportJobResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ImportJobResponse\": {\
          \"shape\": \"ImportJobResponse\"\
        }\
      },\
      \"required\": [\
        \"ImportJobResponse\"\
      ],\
      \"payload\": \"ImportJobResponse\"\
    },\
    \"CreateInAppTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InAppTemplateRequest\": {\
          \"shape\": \"InAppTemplateRequest\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"InAppTemplateRequest\"\
      ],\
      \"payload\": \"InAppTemplateRequest\"\
    },\
    \"CreateInAppTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateCreateMessageBody\": {\
          \"shape\": \"TemplateCreateMessageBody\"\
        }\
      },\
      \"required\": [\
        \"TemplateCreateMessageBody\"\
      ],\
      \"payload\": \"TemplateCreateMessageBody\"\
    },\
    \"CreateJourneyRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"WriteJourneyRequest\": {\
          \"shape\": \"WriteJourneyRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"WriteJourneyRequest\"\
      ],\
      \"payload\": \"WriteJourneyRequest\"\
    },\
    \"CreateJourneyResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyResponse\": {\
          \"shape\": \"JourneyResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyResponse\"\
      ],\
      \"payload\": \"JourneyResponse\"\
    },\
    \"CreatePushTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PushNotificationTemplateRequest\": {\
          \"shape\": \"PushNotificationTemplateRequest\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"PushNotificationTemplateRequest\"\
      ],\
      \"payload\": \"PushNotificationTemplateRequest\"\
    },\
    \"CreatePushTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateTemplateMessageBody\": {\
          \"shape\": \"CreateTemplateMessageBody\"\
        }\
      },\
      \"required\": [\
        \"CreateTemplateMessageBody\"\
      ],\
      \"payload\": \"CreateTemplateMessageBody\"\
    },\
    \"CreateRecommenderConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Attributes\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A map of key-value pairs that defines 1-10 custom endpoint or user attributes, depending on the value for the RecommendationProviderIdType property. Each of these attributes temporarily stores a recommended item that's retrieved from the recommender model and sent to an AWS Lambda function for additional processing. Each attribute can be used as a message variable in a message template.</p> <p>In the map, the key is the name of a custom attribute and the value is a custom display name for that attribute. The display name appears in the <b>Attribute finder</b> of the template editor on the Amazon Pinpoint console. The following restrictions apply to these names:</p> <ul><li><p>An attribute name must start with a letter or number and it can contain up to 50 characters. The characters can be letters, numbers, underscores (_), or hyphens (-). Attribute names are case sensitive and must be unique.</p></li> <li><p>An attribute display name must start with a letter or number and it can contain up to 25 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-).</p></li></ul> <p>This object is required if the configuration invokes an AWS Lambda function (RecommendationTransformerUri) to process recommendation data. Otherwise, don't include this object in your request.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom description of the configuration for the recommender model. The description can contain up to 128 characters. The characters can be letters, numbers, spaces, or the following symbols: _ ; () , â.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom name of the configuration for the recommender model. The name must start with a letter or number and it can contain up to 128 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-).</p>\"\
        },\
        \"RecommendationProviderIdType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of Amazon Pinpoint ID to associate with unique user IDs in the recommender model. This value enables the model to use attribute and event data thatâs specific to a particular endpoint or user in an Amazon Pinpoint application. Valid values are:</p> <ul><li><p>PINPOINT_ENDPOINT_ID - Associate each user in the model with a particular endpoint in Amazon Pinpoint. The data is correlated based on endpoint IDs in Amazon Pinpoint. This is the default value.</p></li> <li><p>PINPOINT_USER_ID - Associate each user in the model with a particular user and endpoint in Amazon Pinpoint. The data is correlated based on user IDs in Amazon Pinpoint. If you specify this value, an endpoint definition in Amazon Pinpoint has to specify both a user ID (UserId) and an endpoint ID. Otherwise, messages wonât be sent to the user's endpoint.</p></li></ul>\"\
        },\
        \"RecommendationProviderRoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data from the recommender model.</p>\"\
        },\
        \"RecommendationProviderUri\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the recommender model to retrieve recommendation data from. This value must match the ARN of an Amazon Personalize campaign.</p>\"\
        },\
        \"RecommendationTransformerUri\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke for additional processing of recommendation data that's retrieved from the recommender model.</p>\"\
        },\
        \"RecommendationsDisplayName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom display name for the standard endpoint or user attribute (RecommendationItems) that temporarily stores recommended items for each endpoint or user, depending on the value for the RecommendationProviderIdType property. This value is required if the configuration doesn't invoke an AWS Lambda function (RecommendationTransformerUri) to perform additional processing of recommendation data.</p> <p>This name appears in the <b>Attribute finder</b> of the template editor on the Amazon Pinpoint console. The name can contain up to 25 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-). These restrictions don't apply to attribute values.</p>\"\
        },\
        \"RecommendationsPerMessage\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of recommended items to retrieve from the model for each endpoint or user, depending on the value for the RecommendationProviderIdType property. This number determines how many recommended items are available for use in message variables. The minimum value is 1. The maximum value is 5. The default value is 5.</p> <p>To use multiple recommended items and custom attributes with message variables, you have to use an AWS Lambda function (RecommendationTransformerUri) to perform additional processing of recommendation data.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies Amazon Pinpoint configuration settings for retrieving and processing recommendation data from a recommender model.</p>\",\
      \"required\": [\
        \"RecommendationProviderUri\",\
        \"RecommendationProviderRoleArn\"\
      ]\
    },\
    \"CreateRecommenderConfigurationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateRecommenderConfiguration\": {\
          \"shape\": \"CreateRecommenderConfiguration\"\
        }\
      },\
      \"required\": [\
        \"CreateRecommenderConfiguration\"\
      ],\
      \"payload\": \"CreateRecommenderConfiguration\"\
    },\
    \"CreateRecommenderConfigurationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RecommenderConfigurationResponse\": {\
          \"shape\": \"RecommenderConfigurationResponse\"\
        }\
      },\
      \"required\": [\
        \"RecommenderConfigurationResponse\"\
      ],\
      \"payload\": \"RecommenderConfigurationResponse\"\
    },\
    \"CreateSegmentRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"WriteSegmentRequest\": {\
          \"shape\": \"WriteSegmentRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"WriteSegmentRequest\"\
      ],\
      \"payload\": \"WriteSegmentRequest\"\
    },\
    \"CreateSegmentResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SegmentResponse\": {\
          \"shape\": \"SegmentResponse\"\
        }\
      },\
      \"required\": [\
        \"SegmentResponse\"\
      ],\
      \"payload\": \"SegmentResponse\"\
    },\
    \"CreateSmsTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SMSTemplateRequest\": {\
          \"shape\": \"SMSTemplateRequest\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"SMSTemplateRequest\"\
      ],\
      \"payload\": \"SMSTemplateRequest\"\
    },\
    \"CreateSmsTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateTemplateMessageBody\": {\
          \"shape\": \"CreateTemplateMessageBody\"\
        }\
      },\
      \"required\": [\
        \"CreateTemplateMessageBody\"\
      ],\
      \"payload\": \"CreateTemplateMessageBody\"\
    },\
    \"CreateTemplateMessageBody\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the message template that was created.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API for the request to create the message template.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request to create the message template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about a request to create a message template.</p>\"\
    },\
    \"CreateVoiceTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"VoiceTemplateRequest\": {\
          \"shape\": \"VoiceTemplateRequest\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"VoiceTemplateRequest\"\
      ],\
      \"payload\": \"VoiceTemplateRequest\"\
    },\
    \"CreateVoiceTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateTemplateMessageBody\": {\
          \"shape\": \"CreateTemplateMessageBody\"\
        }\
      },\
      \"required\": [\
        \"CreateTemplateMessageBody\"\
      ],\
      \"payload\": \"CreateTemplateMessageBody\"\
    },\
    \"CustomDeliveryConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DeliveryUri\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The destination to send the campaign or treatment to. This value can be one of the following:</p> <ul><li><p>The name or Amazon Resource Name (ARN) of an AWS Lambda function to invoke to handle delivery of the campaign or treatment.</p></li> <li><p>The URL for a web application or service that supports HTTPS and can receive the message. The URL has to be a full URL, including the HTTPS protocol.</p></li></ul> \"\
        },\
        \"EndpointTypes\": {\
          \"shape\": \"ListOf__EndpointTypesElement\",\
          \"documentation\": \"<p>The types of endpoints to send the campaign or treatment to. Each valid value maps to a type of channel that you can associate with an endpoint by using the ChannelType property of an endpoint.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the delivery configuration settings for sending a campaign or campaign treatment through a custom channel. This object is required if you use the CampaignCustomMessage object to define the message to send for the campaign or campaign treatment.</p>\",\
      \"required\": [\
        \"DeliveryUri\"\
      ]\
    },\
    \"CustomMessageActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DeliveryUri\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The destination to send the campaign or treatment to. This value can be one of the following:</p> <ul><li><p>The name or Amazon Resource Name (ARN) of an AWS Lambda function to invoke to handle delivery of the campaign or treatment.</p></li> <li><p>The URL for a web application or service that supports HTTPS and can receive the message. The URL has to be a full URL, including the HTTPS protocol.</p></li></ul>\"\
        },\
        \"EndpointTypes\": {\
          \"shape\": \"ListOf__EndpointTypesElement\",\
          \"documentation\": \"<p>The types of endpoints to send the custom message to. Each valid value maps to a type of channel that you can associate with an endpoint by using the ChannelType property of an endpoint.</p>\"\
        },\
        \"MessageConfig\": {\
          \"shape\": \"JourneyCustomMessage\",\
          \"documentation\": \"<p>Specifies the message data included in a custom channel message that's sent to participants in a journey.</p>\"\
        },\
        \"NextActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the next activity to perform, after Amazon Pinpoint calls the AWS Lambda function or web hook.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the custom message template to use for the message. If specified, this value must match the name of an existing message template.</p>\"\
        },\
        \"TemplateVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to use for the message. If specified, this value must match the identifier for an existing template version. To retrieve a list of versions and version identifiers for a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If you don't specify a value for this property, Amazon Pinpoint uses the <i>active version</i> of the template. The <i>active version</i> is typically the version of a template that's been most recently reviewed and approved for use, depending on your workflow. It isn't necessarily the latest version of a template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>The settings for a custom message activity. This type of activity calls an AWS Lambda function or web hook that sends messages to participants.</p>\"\
    },\
    \"DefaultButtonConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BackgroundColor\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The background color of the button.</p>\"\
        },\
        \"BorderRadius\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The border radius of the button.</p>\"\
        },\
        \"ButtonAction\": {\
          \"shape\": \"ButtonAction\",\
          \"documentation\": \"<p>Action triggered by the button.</p>\"\
        },\
        \"Link\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Button destination.</p>\"\
        },\
        \"Text\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Button text.</p>\"\
        },\
        \"TextColor\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The text color of the button.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Default button configuration.</p>\",\
      \"required\": [\
        \"ButtonAction\",\
        \"Text\"\
      ]\
    },\
    \"DefaultMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default body of the message.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>The default message variables to use in the message. You can override these default variables with individual address variables.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the default message for all channels.</p>\"\
    },\
    \"DefaultPushNotificationMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Action\": {\
          \"shape\": \"Action\",\
          \"documentation\": \"<p>The default action to occur if a recipient taps the push notification. Valid values are:</p> <ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li> <li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of the iOS and Android platforms.</p></li> <li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default body of the notification message.</p>\"\
        },\
        \"Data\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>The JSON data payload to use for the default push notification, if the notification is a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>\"\
        },\
        \"SilentPush\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the default notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration or delivering messages to an in-app notification center.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>The default message variables to use in the notification message. You can override the default variables with individual address variables.</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default title to display above the notification message on a recipient's device.</p>\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The default URL to open in a recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the default settings and content for a push notification that's sent directly to an endpoint.</p>\"\
    },\
    \"DefaultPushNotificationTemplate\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Action\": {\
          \"shape\": \"Action\",\
          \"documentation\": \"<p>The action to occur if a recipient taps a push notification that's based on the message template. Valid values are:</p> <ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li> <li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of the iOS and Android platforms.</p></li> <li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body to use in push notifications that are based on the message template.</p>\"\
        },\
        \"Sound\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The sound to play when a recipient receives a push notification that's based on the message template. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p> <p>For an iOS platform, this value is the key for the name of a sound file in your app's main bundle or the Library/Sounds folder in your app's data container. If the sound file can't be found or you specify default for the value, the system plays the default alert sound.</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title to use in push notifications that are based on the message template. This title appears above the notification message on a recipient's device.</p>\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL to open in a recipient's default mobile browser, if a recipient taps a push notification that's based on the message template and the value of the Action property is URL.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the default settings and content for a message template that can be used in messages that are sent through a push notification channel.</p>\"\
    },\
    \"DeleteAdmChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteAdmChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ADMChannelResponse\": {\
          \"shape\": \"ADMChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"ADMChannelResponse\"\
      ],\
      \"payload\": \"ADMChannelResponse\"\
    },\
    \"DeleteApnsChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteApnsChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSChannelResponse\": {\
          \"shape\": \"APNSChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSChannelResponse\"\
      ],\
      \"payload\": \"APNSChannelResponse\"\
    },\
    \"DeleteApnsSandboxChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteApnsSandboxChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSSandboxChannelResponse\": {\
          \"shape\": \"APNSSandboxChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSSandboxChannelResponse\"\
      ],\
      \"payload\": \"APNSSandboxChannelResponse\"\
    },\
    \"DeleteApnsVoipChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteApnsVoipChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSVoipChannelResponse\": {\
          \"shape\": \"APNSVoipChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSVoipChannelResponse\"\
      ],\
      \"payload\": \"APNSVoipChannelResponse\"\
    },\
    \"DeleteApnsVoipSandboxChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteApnsVoipSandboxChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSVoipSandboxChannelResponse\": {\
          \"shape\": \"APNSVoipSandboxChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSVoipSandboxChannelResponse\"\
      ],\
      \"payload\": \"APNSVoipSandboxChannelResponse\"\
    },\
    \"DeleteAppRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteAppResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationResponse\": {\
          \"shape\": \"ApplicationResponse\"\
        }\
      },\
      \"required\": [\
        \"ApplicationResponse\"\
      ],\
      \"payload\": \"ApplicationResponse\"\
    },\
    \"DeleteBaiduChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteBaiduChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BaiduChannelResponse\": {\
          \"shape\": \"BaiduChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"BaiduChannelResponse\"\
      ],\
      \"payload\": \"BaiduChannelResponse\"\
    },\
    \"DeleteCampaignRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"campaign-id\",\
          \"documentation\": \"<p>The unique identifier for the campaign.</p>\"\
        }\
      },\
      \"required\": [\
        \"CampaignId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteCampaignResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignResponse\": {\
          \"shape\": \"CampaignResponse\"\
        }\
      },\
      \"required\": [\
        \"CampaignResponse\"\
      ],\
      \"payload\": \"CampaignResponse\"\
    },\
    \"DeleteEmailChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteEmailChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EmailChannelResponse\": {\
          \"shape\": \"EmailChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"EmailChannelResponse\"\
      ],\
      \"payload\": \"EmailChannelResponse\"\
    },\
    \"DeleteEmailTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"DeleteEmailTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"DeleteEndpointRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"EndpointId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"endpoint-id\",\
          \"documentation\": \"<p>The unique identifier for the endpoint.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"EndpointId\"\
      ]\
    },\
    \"DeleteEndpointResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EndpointResponse\": {\
          \"shape\": \"EndpointResponse\"\
        }\
      },\
      \"required\": [\
        \"EndpointResponse\"\
      ],\
      \"payload\": \"EndpointResponse\"\
    },\
    \"DeleteEventStreamRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteEventStreamResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EventStream\": {\
          \"shape\": \"EventStream\"\
        }\
      },\
      \"required\": [\
        \"EventStream\"\
      ],\
      \"payload\": \"EventStream\"\
    },\
    \"DeleteGcmChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteGcmChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"GCMChannelResponse\": {\
          \"shape\": \"GCMChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"GCMChannelResponse\"\
      ],\
      \"payload\": \"GCMChannelResponse\"\
    },\
    \"DeleteInAppTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"DeleteInAppTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"DeleteJourneyRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        }\
      },\
      \"required\": [\
        \"JourneyId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteJourneyResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyResponse\": {\
          \"shape\": \"JourneyResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyResponse\"\
      ],\
      \"payload\": \"JourneyResponse\"\
    },\
    \"DeletePushTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"DeletePushTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"DeleteRecommenderConfigurationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RecommenderId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"recommender-id\",\
          \"documentation\": \"<p>The unique identifier for the recommender model configuration. This identifier is displayed as the <b>Recommender ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"RecommenderId\"\
      ]\
    },\
    \"DeleteRecommenderConfigurationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RecommenderConfigurationResponse\": {\
          \"shape\": \"RecommenderConfigurationResponse\"\
        }\
      },\
      \"required\": [\
        \"RecommenderConfigurationResponse\"\
      ],\
      \"payload\": \"RecommenderConfigurationResponse\"\
    },\
    \"DeleteSegmentRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"segment-id\",\
          \"documentation\": \"<p>The unique identifier for the segment.</p>\"\
        }\
      },\
      \"required\": [\
        \"SegmentId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteSegmentResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SegmentResponse\": {\
          \"shape\": \"SegmentResponse\"\
        }\
      },\
      \"required\": [\
        \"SegmentResponse\"\
      ],\
      \"payload\": \"SegmentResponse\"\
    },\
    \"DeleteSmsChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteSmsChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SMSChannelResponse\": {\
          \"shape\": \"SMSChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"SMSChannelResponse\"\
      ],\
      \"payload\": \"SMSChannelResponse\"\
    },\
    \"DeleteSmsTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"DeleteSmsTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"DeleteUserEndpointsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"UserId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"user-id\",\
          \"documentation\": \"<p>The unique identifier for the user.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"UserId\"\
      ]\
    },\
    \"DeleteUserEndpointsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EndpointsResponse\": {\
          \"shape\": \"EndpointsResponse\"\
        }\
      },\
      \"required\": [\
        \"EndpointsResponse\"\
      ],\
      \"payload\": \"EndpointsResponse\"\
    },\
    \"DeleteVoiceChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"DeleteVoiceChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"VoiceChannelResponse\": {\
          \"shape\": \"VoiceChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"VoiceChannelResponse\"\
      ],\
      \"payload\": \"VoiceChannelResponse\"\
    },\
    \"DeleteVoiceTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"DeleteVoiceTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"DeliveryStatus\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"SUCCESSFUL\",\
        \"THROTTLED\",\
        \"TEMPORARY_FAILURE\",\
        \"PERMANENT_FAILURE\",\
        \"UNKNOWN_FAILURE\",\
        \"OPT_OUT\",\
        \"DUPLICATE\"\
      ]\
    },\
    \"DimensionType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"INCLUSIVE\",\
        \"EXCLUSIVE\"\
      ]\
    },\
    \"DirectMessageConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ADMMessage\": {\
          \"shape\": \"ADMMessage\",\
          \"documentation\": \"<p>The default push notification message for the ADM (Amazon Device Messaging) channel. This message overrides the default push notification message (DefaultPushNotificationMessage).</p>\"\
        },\
        \"APNSMessage\": {\
          \"shape\": \"APNSMessage\",\
          \"documentation\": \"<p>The default push notification message for the APNs (Apple Push Notification service) channel. This message overrides the default push notification message (DefaultPushNotificationMessage).</p>\"\
        },\
        \"BaiduMessage\": {\
          \"shape\": \"BaiduMessage\",\
          \"documentation\": \"<p>The default push notification message for the Baidu (Baidu Cloud Push) channel. This message overrides the default push notification message (DefaultPushNotificationMessage).</p>\"\
        },\
        \"DefaultMessage\": {\
          \"shape\": \"DefaultMessage\",\
          \"documentation\": \"<p>The default message for all channels.</p>\"\
        },\
        \"DefaultPushNotificationMessage\": {\
          \"shape\": \"DefaultPushNotificationMessage\",\
          \"documentation\": \"<p>The default push notification message for all push notification channels.</p>\"\
        },\
        \"EmailMessage\": {\
          \"shape\": \"EmailMessage\",\
          \"documentation\": \"<p>The default message for the email channel. This message overrides the default message (DefaultMessage).</p>\"\
        },\
        \"GCMMessage\": {\
          \"shape\": \"GCMMessage\",\
          \"documentation\": \"<p>The default push notification message for the GCM channel, which is used to send notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This message overrides the default push notification message (DefaultPushNotificationMessage).</p>\"\
        },\
        \"SMSMessage\": {\
          \"shape\": \"SMSMessage\",\
          \"documentation\": \"<p>The default message for the SMS channel. This message overrides the default message (DefaultMessage).</p>\"\
        },\
        \"VoiceMessage\": {\
          \"shape\": \"VoiceMessage\",\
          \"documentation\": \"<p>The default message for the voice channel. This message overrides the default message (DefaultMessage).</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings and content for the default message and any default messages that you tailored for specific channels.</p>\"\
    },\
    \"Duration\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"HR_24\",\
        \"DAY_7\",\
        \"DAY_14\",\
        \"DAY_30\"\
      ]\
    },\
    \"EmailChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ConfigurationSet\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The <a href=\\\"https://docs.aws.amazon.com/ses/latest/APIReference/API_ConfigurationSet.html\\\">Amazon SES configuration set</a> that you want to apply to messages that you send through the channel.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable the email channel for the application.</p>\"\
        },\
        \"FromAddress\": {\
          \"shape\": \"__string\",\
          \"documentation\": \" <p>The verified email address that you want to send email from when you send email through the channel.</p>\"\
        },\
        \"Identity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \" <p>The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple Email Service (Amazon SES), that you want to use when you send email through the channel.</p>\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \" <p>The ARN of the AWS Identity and Access Management (IAM) role that you want Amazon Pinpoint to use when it submits email-related event data for the channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the email channel for an application.</p>\",\
      \"required\": [\
        \"FromAddress\",\
        \"Identity\"\
      ]\
    },\
    \"EmailChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the email channel applies to.</p>\"\
        },\
        \"ConfigurationSet\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The <a href=\\\"https://docs.aws.amazon.com/ses/latest/APIReference/API_ConfigurationSet.html\\\">Amazon SES configuration set</a> that's applied to messages that are sent through the channel.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the email channel was enabled.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the email channel is enabled for the application.</p>\"\
        },\
        \"FromAddress\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The verified email address that email is sent from when you send email through the channel.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the email channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"Identity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \" <p>The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple Email Service (Amazon SES), that's used when you send email through the channel.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the email channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the email channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the email channel was last modified.</p>\"\
        },\
        \"MessagesPerSecond\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum number of emails that can be sent through the channel each second.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of messaging or notification platform for the channel. For the email channel, this value is EMAIL.</p>\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \" <p>The ARN of the AWS Identity and Access Management (IAM) role that Amazon Pinpoint uses to submit email-related event data for the channel.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the email channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the email channel for an application.</p>\",\
      \"required\": [\
        \"Platform\"\
      ]\
    },\
    \"EmailMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the email message.</p>\"\
        },\
        \"FeedbackForwardingAddress\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The email address to forward bounces and complaints to, if feedback forwarding is enabled.</p>\"\
        },\
        \"FromAddress\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The verified email address to send the email message from. The default value is the FromAddress specified for the email channel.</p>\"\
        },\
        \"RawEmail\": {\
          \"shape\": \"RawEmail\",\
          \"documentation\": \"<p>The email message, represented as a raw MIME message.</p>\"\
        },\
        \"ReplyToAddresses\": {\
          \"shape\": \"ListOf__string\",\
          \"documentation\": \"<p>The reply-to email address(es) for the email message. If a recipient replies to the email, each reply-to address receives the reply.</p>\"\
        },\
        \"SimpleEmail\": {\
          \"shape\": \"SimpleEmail\",\
          \"documentation\": \"<p>The email message, composed of a subject, a text part, and an HTML part.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>The default message variables to use in the email message. You can override the default variables with individual address variables.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the default settings and content for a one-time email message that's sent directly to an endpoint.</p>\"\
    },\
    \"EmailMessageActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageConfig\": {\
          \"shape\": \"JourneyEmailMessage\",\
          \"documentation\": \"<p>Specifies the sender address for an email message that's sent to participants in the journey.</p>\"\
        },\
        \"NextActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the next activity to perform, after the message is sent.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the email message template to use for the message. If specified, this value must match the name of an existing message template.</p>\"\
        },\
        \"TemplateVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the version of the email template to use for the message. If specified, this value must match the identifier for an existing template version. To retrieve a list of versions and version identifiers for a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If you don't specify a value for this property, Amazon Pinpoint uses the <i>active version</i> of the template. The <i>active version</i> is typically the version of a template that's been most recently reviewed and approved for use, depending on your workflow. It isn't necessarily the latest version of a template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for an email activity in a journey. This type of activity sends an email message to participants.</p>\"\
    },\
    \"EmailTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A JSON object that specifies the default values to use for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable. When you create a message that's based on the template, you can override these defaults with message-specific and address-specific variables and values.</p>\"\
        },\
        \"HtmlPart\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body, in HTML format, to use in email messages that are based on the message template. We recommend using HTML format for email clients that render HTML content. You can include links, formatted text, and more in an HTML message.</p>\"\
        },\
        \"RecommenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the recommender model to use for the message template. Amazon Pinpoint uses this value to determine how to retrieve and process data from a recommender model when it sends messages that use the template, if the template contains message variables for recommendation data.</p>\"\
        },\
        \"Subject\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The subject line, or title, to use in email messages that are based on the message template.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<note><p>As of <b>22-05-2023</b> tags has been deprecated for update operations. After this date any value in tags is not processed and an error code is not returned. To manage tags we recommend using either <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html\\\">Tags</a> in the <i>API Reference for Amazon Pinpoint</i>, <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html\\\">resourcegroupstaggingapi</a> commands in the <i>AWS Command Line Interface Documentation</i> or <a href=\\\"https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html\\\">resourcegroupstaggingapi</a> in the <i>AWS SDK</i>.</p></note> <p>(Deprecated) A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom description of the message template.</p>\"\
        },\
        \"TextPart\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body, in plain text format, to use in email messages that are based on the message template. We recommend using plain text format for email clients that don't render HTML content and clients that are connected to high-latency networks, such as mobile devices.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the content and settings for a message template that can be used in messages that are sent through the email channel.</p>\"\
    },\
    \"EmailTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the message template.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was created.</p>\"\
        },\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The JSON object that specifies the default values that are used for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>\"\
        },\
        \"HtmlPart\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body, in HTML format, that's used in email messages that are based on the message template.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was last modified.</p>\"\
        },\
        \"RecommenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the recommender model that's used by the message template.</p>\"\
        },\
        \"Subject\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The subject line, or title, that's used in email messages that are based on the message template.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that identifies the tags that are associated with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the message template.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the message template.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"TemplateType\",\
          \"documentation\": \"<p>The type of channel that the message template is designed for. For an email template, this value is EMAIL.</p>\"\
        },\
        \"TextPart\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body, in plain text format, that's used in email messages that are based on the message template.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier, as an integer, for the active version of the message template, or the version of the template that you specified by using the version parameter in your request.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the content and settings for a message template that can be used in messages that are sent through the email channel.</p>\",\
      \"required\": [\
        \"LastModifiedDate\",\
        \"CreationDate\",\
        \"TemplateName\",\
        \"TemplateType\"\
      ]\
    },\
    \"EndpointBatchItem\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Address\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The destination address for messages or push notifications that you send to the endpoint. The address varies by channel. For a push-notification channel, use the token provided by the push notification service, such as an Apple Push Notification service (APNs) device token or a Firebase Cloud Messaging (FCM) registration token. For the SMS channel, use a phone number in E.164 format, such as +12065550100. For the email channel, use an email address.</p>\"\
        },\
        \"Attributes\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>One or more custom attributes that describe the endpoint by associating a name with an array of values. For example, the value of a custom attribute named Interests might be: [\\\"Science\\\", \\\"Music\\\", \\\"Travel\\\"]. You can use these attributes as filter criteria when you create segments. Attribute names are case sensitive.</p> <p>An attribute name can contain up to 50 characters. An attribute value can contain up to 100 characters. When you define the name of a custom attribute, avoid using the following characters: number sign (#), colon (:), question mark (?), backslash (\\\\), and slash (/). The Amazon Pinpoint console can't display attribute names that contain these characters. This restriction doesn't apply to attribute values.</p>\"\
        },\
        \"ChannelType\": {\
          \"shape\": \"ChannelType\",\
          \"documentation\": \"<p>The channel to use when sending messages or push notifications to the endpoint.</p>\"\
        },\
        \"Demographic\": {\
          \"shape\": \"EndpointDemographic\",\
          \"documentation\": \"<p>The demographic information for the endpoint, such as the time zone and platform.</p>\"\
        },\
        \"EffectiveDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the endpoint was created or updated.</p>\"\
        },\
        \"EndpointStatus\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Specifies whether to send messages or push notifications to the endpoint. Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE, messages arenât sent to the endpoint.</p> <p>Amazon Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint that has the same address specified by the Address property.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the endpoint in the context of the batch.</p>\"\
        },\
        \"Location\": {\
          \"shape\": \"EndpointLocation\",\
          \"documentation\": \"<p>The geographic information for the endpoint.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOf__double\",\
          \"documentation\": \"<p>One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.</p>\"\
        },\
        \"OptOut\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Specifies whether the user who's associated with the endpoint has opted out of receiving messages and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to receive all messages and push notifications.</p>\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request to create or update the endpoint.</p>\"\
        },\
        \"User\": {\
          \"shape\": \"EndpointUser\",\
          \"documentation\": \"<p>One or more custom attributes that describe the user who's associated with the endpoint.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies an endpoint to create or update and the settings and attributes to set or change for the endpoint.</p>\"\
    },\
    \"EndpointBatchRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfEndpointBatchItem\",\
          \"documentation\": \"<p>An array that defines the endpoints to create or update and, for each endpoint, the property values to set or change. An array can contain a maximum of 100 items.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies a batch of endpoints to create or update and the settings and attributes to set or change for each endpoint.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"EndpointDemographic\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AppVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version of the app that's associated with the endpoint.</p>\"\
        },\
        \"Locale\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The locale of the endpoint, in the following format: the ISO 639-1 alpha-2 code, followed by an underscore (_), followed by an ISO 3166-1 alpha-2 value.</p>\"\
        },\
        \"Make\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The manufacturer of the endpoint device, such as apple or samsung.</p>\"\
        },\
        \"Model\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The model name or number of the endpoint device, such as iPhone or SM-G900F.</p>\"\
        },\
        \"ModelVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The model version of the endpoint device.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The platform of the endpoint device, such as ios.</p>\"\
        },\
        \"PlatformVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The platform version of the endpoint device.</p>\"\
        },\
        \"Timezone\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The time zone of the endpoint, specified as a tz database name value, such as America/Los_Angeles.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies demographic information about an endpoint, such as the applicable time zone and platform.</p>\"\
    },\
    \"EndpointItemResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom message that's returned in the response as a result of processing the endpoint data.</p>\"\
        },\
        \"StatusCode\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The status code that's returned in the response as a result of processing the endpoint data.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the status code and message that result from processing data for an endpoint.</p>\"\
    },\
    \"EndpointLocation\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"City\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the city where the endpoint is located.</p>\"\
        },\
        \"Country\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The two-character code, in ISO 3166-1 alpha-2 format, for the country or region where the endpoint is located. For example, US for the United States.</p>\"\
        },\
        \"Latitude\": {\
          \"shape\": \"__double\",\
          \"documentation\": \"<p>The latitude coordinate of the endpoint location, rounded to one decimal place.</p>\"\
        },\
        \"Longitude\": {\
          \"shape\": \"__double\",\
          \"documentation\": \"<p>The longitude coordinate of the endpoint location, rounded to one decimal place.</p>\"\
        },\
        \"PostalCode\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The postal or ZIP code for the area where the endpoint is located.</p>\"\
        },\
        \"Region\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the region where the endpoint is located. For locations in the United States, this value is the name of a state.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies geographic information about an endpoint.</p>\"\
    },\
    \"EndpointMessageResult\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Address\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The endpoint address that the message was delivered to.</p>\"\
        },\
        \"DeliveryStatus\": {\
          \"shape\": \"DeliveryStatus\",\
          \"documentation\": \"<p>The delivery status of the message. Possible values are:</p> <ul> <li><p>DUPLICATE - The endpoint address is a duplicate of another endpoint address. Amazon Pinpoint won't attempt to send the message again.</p></li> <li><p>OPT_OUT - The user who's associated with the endpoint has opted out of receiving messages from you. Amazon Pinpoint won't attempt to send the message again.</p></li> <li><p>PERMANENT_FAILURE - An error occurred when delivering the message to the endpoint. Amazon Pinpoint won't attempt to send the message again.</p></li>    <li><p>SUCCESSFUL - The message was successfully delivered to the endpoint.</p></li> <li><p>TEMPORARY_FAILURE - A temporary error occurred. Amazon Pinpoint won't attempt to send the message again.</p></li> <li><p>THROTTLED - Amazon Pinpoint throttled the operation to send the message to the endpoint.</p></li> <li><p>TIMEOUT - The message couldn't be sent within the timeout period.</p></li> <li><p>UNKNOWN_FAILURE - An unknown error occurred.</p></li></ul>\"\
        },\
        \"MessageId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the message that was sent.</p>\"\
        },\
        \"StatusCode\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The downstream service status code for delivering the message.</p>\"\
        },\
        \"StatusMessage\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The status message for delivering the message.</p>\"\
        },\
        \"UpdatedToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>For push notifications that are sent through the GCM channel, specifies whether the endpoint's device registration token was updated as part of delivering the message.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the delivery status and results of sending a message directly to an endpoint.</p>\",\
      \"required\": [\
        \"DeliveryStatus\",\
        \"StatusCode\"\
      ]\
    },\
    \"EndpointRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Address\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The destination address for messages or push notifications that you send to the endpoint. The address varies by channel. For a push-notification channel, use the token provided by the push notification service, such as an Apple Push Notification service (APNs) device token or a Firebase Cloud Messaging (FCM) registration token. For the SMS channel, use a phone number in E.164 format, such as +12065550100. For the email channel, use an email address.</p>\"\
        },\
        \"Attributes\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>One or more custom attributes that describe the endpoint by associating a name with an array of values. For example, the value of a custom attribute named Interests might be: [\\\"Science\\\", \\\"Music\\\", \\\"Travel\\\"]. You can use these attributes as filter criteria when you create segments. Attribute names are case sensitive.</p> <p>An attribute name can contain up to 50 characters. An attribute value can contain up to 100 characters. When you define the name of a custom attribute, avoid using the following characters: number sign (#), colon (:), question mark (?), backslash (\\\\), and slash (/). The Amazon Pinpoint console can't display attribute names that contain these characters. This restriction doesn't apply to attribute values.</p>\"\
        },\
        \"ChannelType\": {\
          \"shape\": \"ChannelType\",\
          \"documentation\": \"<p>The channel to use when sending messages or push notifications to the endpoint.</p>\"\
        },\
        \"Demographic\": {\
          \"shape\": \"EndpointDemographic\",\
          \"documentation\": \"<p>The demographic information for the endpoint, such as the time zone and platform.</p>\"\
        },\
        \"EffectiveDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the endpoint is updated.</p>\"\
        },\
        \"EndpointStatus\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Specifies whether to send messages or push notifications to the endpoint. Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE, messages arenât sent to the endpoint.</p> <p>Amazon Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint that has the same address specified by the Address property.</p>\"\
        },\
        \"Location\": {\
          \"shape\": \"EndpointLocation\",\
          \"documentation\": \"<p>The geographic information for the endpoint.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOf__double\",\
          \"documentation\": \"<p>One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.</p>\"\
        },\
        \"OptOut\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Specifies whether the user who's associated with the endpoint has opted out of receiving messages and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to receive all messages and push notifications.</p>\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the most recent request to update the endpoint.</p>\"\
        },\
        \"User\": {\
          \"shape\": \"EndpointUser\",\
          \"documentation\": \"<p>One or more custom attributes that describe the user who's associated with the endpoint.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the channel type and other settings for an endpoint.</p>\"\
    },\
    \"EndpointResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Address\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The destination address for messages or push notifications that you send to the endpoint. The address varies by channel. For example, the address for a push-notification channel is typically the token provided by a push notification service, such as an Apple Push Notification service (APNs) device token or a Firebase Cloud Messaging (FCM) registration token. The address for the SMS channel is a phone number in E.164 format, such as +12065550100. The address for the email channel is an email address.</p>\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that's associated with the endpoint.</p>\"\
        },\
        \"Attributes\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>One or more custom attributes that describe the endpoint by associating a name with an array of values. For example, the value of a custom attribute named Interests might be: [\\\"Science\\\", \\\"Music\\\", \\\"Travel\\\"]. You can use these attributes as filter criteria when you create segments.</p>\"\
        },\
        \"ChannelType\": {\
          \"shape\": \"ChannelType\",\
          \"documentation\": \"<p>The channel that's used when sending messages or push notifications to the endpoint.</p>\"\
        },\
        \"CohortId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A number from 0-99 that represents the cohort that the endpoint is assigned to. Endpoints are grouped into cohorts randomly, and each cohort contains approximately 1 percent of the endpoints for an application. Amazon Pinpoint assigns cohorts to the holdout or treatment allocations for campaigns.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the endpoint was created.</p>\"\
        },\
        \"Demographic\": {\
          \"shape\": \"EndpointDemographic\",\
          \"documentation\": \"<p>The demographic information for the endpoint, such as the time zone and platform.</p>\"\
        },\
        \"EffectiveDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the endpoint was last updated.</p>\"\
        },\
        \"EndpointStatus\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Specifies whether messages or push notifications are sent to the endpoint. Possible values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE, messages arenât sent to the endpoint.</p> <p>Amazon Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint that has the same address specified by the Address property.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier that you assigned to the endpoint. The identifier should be a globally unique identifier (GUID) to ensure that it doesn't conflict with other endpoint identifiers that are associated with the application.</p>\"\
        },\
        \"Location\": {\
          \"shape\": \"EndpointLocation\",\
          \"documentation\": \"<p>The geographic information for the endpoint.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOf__double\",\
          \"documentation\": \"<p>One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.</p>\"\
        },\
        \"OptOut\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Specifies whether the user who's associated with the endpoint has opted out of receiving messages and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to receive all messages and push notifications.</p>\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the most recent request to update the endpoint.</p>\"\
        },\
        \"User\": {\
          \"shape\": \"EndpointUser\",\
          \"documentation\": \"<p>One or more custom user attributes that your app reports to Amazon Pinpoint for the user who's associated with the endpoint.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the channel type and other settings for an endpoint.</p>\"\
    },\
    \"EndpointSendConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BodyOverride\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the message. If specified, this value overrides the default message body.</p>\"\
        },\
        \"Context\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A map of custom attributes to attach to the message for the address. Attribute names are case sensitive.</p> <p>For a push notification, this payload is added to the data.pinpoint object. For an email or text message, this payload is added to email/SMS delivery receipt event attributes.</p>\"\
        },\
        \"RawContent\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for the message. If specified, this value overrides all other values for the message.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>A map of the message variables to merge with the variables specified for the default message (DefaultMessage.Substitutions). The variables specified in this map take precedence over all other variables.</p>\"\
        },\
        \"TitleOverride\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title or subject line of the message. If specified, this value overrides the default message title or subject line.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the content, including message variables and attributes, to use in a message that's sent directly to an endpoint.</p>\"\
    },\
    \"EndpointUser\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"UserAttributes\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>One or more custom attributes that describe the user by associating a name with an array of values. For example, the value of an attribute named Interests might be: [\\\"Science\\\", \\\"Music\\\", \\\"Travel\\\"]. You can use these attributes as filter criteria when you create segments. Attribute names are case sensitive.</p> <p>An attribute name can contain up to 50 characters. An attribute value can contain up to 100 characters. When you define the name of a custom attribute, avoid using the following characters: number sign (#), colon (:), question mark (?), backslash (\\\\), and slash (/). The Amazon Pinpoint console can't display attribute names that contain these characters. This restriction doesn't apply to attribute values.</p>\"\
        },\
        \"UserId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the user.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies data for one or more attributes that describe the user who's associated with an endpoint.</p>\"\
    },\
    \"EndpointsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfEndpointResponse\",\
          \"documentation\": \"<p>An array of responses, one for each endpoint that's associated with the user ID.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about all the endpoints that are associated with a user ID.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"Event\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AppPackageName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The package name of the app that's recording the event.</p>\"\
        },\
        \"AppTitle\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title of the app that's recording the event.</p>\"\
        },\
        \"AppVersionCode\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the app that's recording the event.</p>\"\
        },\
        \"Attributes\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>One or more custom attributes that are associated with the event.</p>\"\
        },\
        \"ClientSdkVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version of the SDK that's running on the client device.</p>\"\
        },\
        \"EventType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the event.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOf__double\",\
          \"documentation\": \"<p>One or more custom metrics that are associated with the event.</p>\"\
        },\
        \"SdkName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the SDK that's being used to record the event.</p>\"\
        },\
        \"Session\": {\
          \"shape\": \"Session\",\
          \"documentation\": \"<p>Information about the session in which the event occurred.</p>\"\
        },\
        \"Timestamp\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the event occurred.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies information about an event that reports data to Amazon Pinpoint.</p>\",\
      \"required\": [\
        \"EventType\",\
        \"Timestamp\"\
      ]\
    },\
    \"EventCondition\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Dimensions\": {\
          \"shape\": \"EventDimensions\",\
          \"documentation\": \"<p>The dimensions for the event filter to use for the activity.</p>\"\
        },\
        \"MessageActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message identifier (message_id) for the message to use when determining whether message events meet the condition.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the conditions to evaluate for an event that applies to an activity in a journey.</p>\"\
    },\
    \"EventDimensions\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Attributes\": {\
          \"shape\": \"MapOfAttributeDimension\",\
          \"documentation\": \"<p>One or more custom attributes that your application reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create an event filter.</p>\"\
        },\
        \"EventType\": {\
          \"shape\": \"SetDimension\",\
          \"documentation\": \"<p>The name of the event that causes the campaign to be sent or the journey activity to be performed. This can be a standard event that Amazon Pinpoint generates, such as _email.delivered. For campaigns, this can also be a custom event that's specific to your application. For information about standard events, see <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/event-streams.html\\\">Streaming Amazon Pinpoint Events</a> in the <i>Amazon Pinpoint Developer Guide</i>.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOfMetricDimension\",\
          \"documentation\": \"<p>One or more custom metrics that your application reports to Amazon Pinpoint. You can use these metrics as selection criteria when you create an event filter.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the dimensions for an event filter that determines when a campaign is sent or a journey activity is performed.</p>\"\
    },\
    \"EventFilter\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Dimensions\": {\
          \"shape\": \"EventDimensions\",\
          \"documentation\": \"<p>The dimensions for the event filter to use for the campaign or the journey activity.</p>\"\
        },\
        \"FilterType\": {\
          \"shape\": \"FilterType\",\
          \"documentation\": \"<p>The type of event that causes the campaign to be sent or the journey activity to be performed. Valid values are: SYSTEM, sends the campaign or performs the activity when a system event occurs; and, ENDPOINT, sends the campaign or performs the activity when an endpoint event (<link  linkend=\\\"apps-application-id-events\\\">Events resource</link>) occurs.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for an event that causes a campaign to be sent or a journey activity to be performed.</p>\",\
      \"required\": [\
        \"FilterType\",\
        \"Dimensions\"\
      ]\
    },\
    \"EventItemResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom message that's returned in the response as a result of processing the event.</p>\"\
        },\
        \"StatusCode\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The status code that's returned in the response as a result of processing the event. Possible values are: 202, for events that were accepted; and, 400, for events that weren't valid.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the status code and message that result from processing an event.</p>\"\
    },\
    \"EventStartCondition\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EventFilter\": {\
          \"shape\": \"EventFilter\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for an event that causes a journey activity to start.</p>\"\
    },\
    \"EventStream\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application to publish event data for.</p>\"\
        },\
        \"DestinationStreamArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon Kinesis Data Firehose delivery stream to publish event data to.</p> <p>For a Kinesis data stream, the ARN format is: arn:aws:kinesis:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:stream/<replaceable>stream_name</replaceable>\\n               </p> <p>For a Kinesis Data Firehose delivery stream, the ARN format is: arn:aws:firehose:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:deliverystream/<replaceable>stream_name</replaceable>\\n               </p>\"\
        },\
        \"ExternalId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy. Amazon Pinpoint previously used this value to assume an IAM role when publishing event data, but we removed this requirement. We don't recommend use of external IDs for IAM roles that are assumed by Amazon Pinpoint.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the event stream was last modified.</p>\"\
        },\
        \"LastUpdatedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The IAM user who last modified the event stream.</p>\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to publish event data to the stream in your AWS account.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies settings for publishing event data to an Amazon Kinesis data stream or an Amazon Kinesis Data Firehose delivery stream.</p>\",\
      \"required\": [\
        \"ApplicationId\",\
        \"RoleArn\",\
        \"DestinationStreamArn\"\
      ]\
    },\
    \"EventsBatch\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Endpoint\": {\
          \"shape\": \"PublicEndpoint\",\
          \"documentation\": \"<p>A set of properties and attributes that are associated with the endpoint.</p>\"\
        },\
        \"Events\": {\
          \"shape\": \"MapOfEvent\",\
          \"documentation\": \"<p>A set of properties that are associated with the event.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies a batch of endpoints and events to process.</p>\",\
      \"required\": [\
        \"Endpoint\",\
        \"Events\"\
      ]\
    },\
    \"EventsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BatchItem\": {\
          \"shape\": \"MapOfEventsBatch\",\
          \"documentation\": \"<p>The batch of events to process. For each item in a batch, the endpoint ID acts as a key that has an EventsBatch object as its value.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies a batch of events to process.</p>\",\
      \"required\": [\
        \"BatchItem\"\
      ]\
    },\
    \"EventsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Results\": {\
          \"shape\": \"MapOfItemResponse\",\
          \"documentation\": \"<p>A map that contains a multipart response for each endpoint. For each item in this object, the endpoint ID is the key and the item response is the value. If no item response exists, the value can also be one of the following: 202, the request was processed successfully; or 400, the payload wasn't valid or required fields were missing.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about endpoints and the events that they're associated with.</p>\"\
    },\
    \"ExportJobRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location where you want to export endpoint definitions to.</p>\"\
        },\
        \"S3UrlPrefix\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the location in an Amazon Simple Storage Service (Amazon S3) bucket where you want to export endpoint definitions to. This location is typically a folder that contains multiple files. The URL should be in the following format: s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identifier for the segment to export endpoint definitions from. If you don't specify this value, Amazon Pinpoint exports definitions for all the endpoints that are associated with the application.</p>\"\
        },\
        \"SegmentVersion\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The version of the segment to export endpoint definitions from, if specified.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a job that exports endpoint definitions to an Amazon Simple Storage Service (Amazon S3) bucket.</p>\",\
      \"required\": [\
        \"S3UrlPrefix\",\
        \"RoleArn\"\
      ]\
    },\
    \"ExportJobResource\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorized Amazon Pinpoint to access the Amazon S3 location where the endpoint definitions were exported to.</p>\"\
        },\
        \"S3UrlPrefix\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the location in an Amazon Simple Storage Service (Amazon S3) bucket where the endpoint definitions were exported to. This location is typically a folder that contains multiple files. The URL should be in the following format: s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identifier for the segment that the endpoint definitions were exported from. If this value isn't present, Amazon Pinpoint exported definitions for all the endpoints that are associated with the application.</p>\"\
        },\
        \"SegmentVersion\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The version of the segment that the endpoint definitions were exported from.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the resource settings for a job that exports endpoint definitions to a file. The file can be added directly to an Amazon Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API or downloaded directly to a computer by using the Amazon Pinpoint console.</p>\",\
      \"required\": [\
        \"S3UrlPrefix\",\
        \"RoleArn\"\
      ]\
    },\
    \"ExportJobResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that's associated with the export job.</p>\"\
        },\
        \"CompletedPieces\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of pieces that were processed successfully (completed) by the export job, as of the time of the request.</p>\"\
        },\
        \"CompletionDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the export job was completed.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the export job was created.</p>\"\
        },\
        \"Definition\": {\
          \"shape\": \"ExportJobResource\",\
          \"documentation\": \"<p>The resource settings that apply to the export job.</p>\"\
        },\
        \"FailedPieces\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of pieces that weren't processed successfully (failed) by the export job, as of the time of the request.</p>\"\
        },\
        \"Failures\": {\
          \"shape\": \"ListOf__string\",\
          \"documentation\": \"<p>An array of entries, one for each of the first 100 entries that weren't processed successfully (failed) by the export job, if any.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the export job.</p>\"\
        },\
        \"JobStatus\": {\
          \"shape\": \"JobStatus\",\
          \"documentation\": \"<p>The status of the export job. The job status is FAILED if Amazon Pinpoint wasn't able to process one or more pieces in the job.</p>\"\
        },\
        \"TotalFailures\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of endpoint definitions that weren't processed successfully (failed) by the export job, typically because an error, such as a syntax error, occurred.</p>\"\
        },\
        \"TotalPieces\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of pieces that must be processed to complete the export job. Each piece consists of an approximately equal portion of the endpoint definitions that are part of the export job.</p>\"\
        },\
        \"TotalProcessed\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of endpoint definitions that were processed by the export job.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The job type. This value is EXPORT for export jobs.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of a job that exports endpoint definitions to a file. The file can be added directly to an Amazon Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API or downloaded directly to a computer by using the Amazon Pinpoint console.</p>\",\
      \"required\": [\
        \"JobStatus\",\
        \"CreationDate\",\
        \"Type\",\
        \"Definition\",\
        \"Id\",\
        \"ApplicationId\"\
      ]\
    },\
    \"ExportJobsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfExportJobResponse\",\
          \"documentation\": \"<p>An array of responses, one for each export job that's associated with the application (Export Jobs resource) or segment (Segment Export Jobs resource).</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about all the export jobs that are associated with an application or segment. An export job is a job that exports endpoint definitions to a file.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"FilterType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"SYSTEM\",\
        \"ENDPOINT\"\
      ]\
    },\
    \"ForbiddenException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request or response.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an API request or response.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 403\
      }\
    },\
    \"Format\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"CSV\",\
        \"JSON\"\
      ]\
    },\
    \"Frequency\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ONCE\",\
        \"HOURLY\",\
        \"DAILY\",\
        \"WEEKLY\",\
        \"MONTHLY\",\
        \"EVENT\",\
        \"IN_APP_EVENT\"\
      ]\
    },\
    \"GCMChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApiKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Web API Key, also referred to as an <i>API_KEY</i> or <i>server key</i>, that you received from Google to communicate with Google services.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable the GCM channel for the application.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the GCM channel for an application. This channel enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>\",\
      \"required\": [\
        \"ApiKey\"\
      ]\
    },\
    \"GCMChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the GCM channel applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the GCM channel was enabled.</p>\"\
        },\
        \"Credential\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Web API Key, also referred to as an <i>API_KEY</i> or <i>server key</i>, that you received from Google to communicate with Google services.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the GCM channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the GCM channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the GCM channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the GCM channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the GCM channel was last modified.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of messaging or notification platform for the channel. For the GCM channel, this value is GCM.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the GCM channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the GCM channel for an application. The GCM channel enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>\",\
      \"required\": [\
        \"Credential\",\
        \"Platform\"\
      ]\
    },\
    \"GCMMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Action\": {\
          \"shape\": \"Action\",\
          \"documentation\": \"<p>The action to occur if the recipient taps the push notification. Valid values are:</p> <ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li> <li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This action uses the deep-linking features of the Android platform.</p></li> <li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the notification message.</p>\"\
        },\
        \"CollapseKey\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>An arbitrary string that identifies a group of messages that can be collapsed to ensure that only the last message is sent when delivery can resume. This helps avoid sending too many instances of the same messages when the recipient's device comes online again or becomes active.</p> <p>Amazon Pinpoint specifies this value in the Firebase Cloud Messaging (FCM) collapse_key parameter when it sends the notification message to FCM.</p>\"\
        },\
        \"Data\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>The JSON data payload to use for the push notification, if the notification is a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>\"\
        },\
        \"IconReference\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The icon image name of the asset saved in your app.</p>\"\
        },\
        \"ImageIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the large icon image to display in the content view of the push notification.</p>\"\
        },\
        \"ImageUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of an image to display in the push notification.</p>\"\
        },\
        \"Priority\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>para>normal - The notification might be delayed. Delivery is optimized for battery usage on the recipient's device. Use this value unless immediate delivery is required.</p>/listitem> <li><p>high - The notification is sent immediately and might wake a sleeping device.</p></li>/para> <p>Amazon Pinpoint specifies this value in the FCM priority parameter when it sends the notification message to FCM.</p> <p>The equivalent values for Apple Push Notification service (APNs) are 5, for normal, and 10, for high. If you specify an APNs value for this property, Amazon Pinpoint accepts and converts the value to the corresponding FCM value.</p>\"\
        },\
        \"RawContent\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p>\"\
        },\
        \"RestrictedPackageName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The package name of the application where registration tokens must match in order for the recipient to receive the message.</p>\"\
        },\
        \"SilentPush\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration or supporting phone home functionality.</p>\"\
        },\
        \"SmallImageIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the small icon image to display in the status bar and the content view of the push notification.</p>\"\
        },\
        \"Sound\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The sound to play when the recipient receives the push notification. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>The default message variables to use in the notification message. You can override the default variables with individual address variables.</p>\"\
        },\
        \"TimeToLive\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The amount of time, in seconds, that FCM should store and attempt to deliver the push notification, if the service is unable to deliver the notification the first time. If you don't specify this value, FCM defaults to the maximum value, which is 2,419,200 seconds (28 days).</p> <p>Amazon Pinpoint specifies this value in the FCM time_to_live parameter when it sends the notification message to FCM.</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title to display above the notification message on the recipient's device.</p>\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL to open in the recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a one-time message that's sent directly to an endpoint through the GCM channel. The GCM channel enables Amazon Pinpoint to send messages to the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>\"\
    },\
    \"GPSCoordinates\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Latitude\": {\
          \"shape\": \"__double\",\
          \"documentation\": \"<p>The latitude coordinate of the location.</p>\"\
        },\
        \"Longitude\": {\
          \"shape\": \"__double\",\
          \"documentation\": \"<p>The longitude coordinate of the location.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the GPS coordinates of a location.</p>\",\
      \"required\": [\
        \"Latitude\",\
        \"Longitude\"\
      ]\
    },\
    \"GPSPointDimension\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Coordinates\": {\
          \"shape\": \"GPSCoordinates\",\
          \"documentation\": \"<p>The GPS coordinates to measure distance from.</p>\"\
        },\
        \"RangeInKilometers\": {\
          \"shape\": \"__double\",\
          \"documentation\": \"<p>The range, in kilometers, from the GPS coordinates.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies GPS-based criteria for including or excluding endpoints from a segment.</p>\",\
      \"required\": [\
        \"Coordinates\"\
      ]\
    },\
    \"GetAdmChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetAdmChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ADMChannelResponse\": {\
          \"shape\": \"ADMChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"ADMChannelResponse\"\
      ],\
      \"payload\": \"ADMChannelResponse\"\
    },\
    \"GetApnsChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetApnsChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSChannelResponse\": {\
          \"shape\": \"APNSChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSChannelResponse\"\
      ],\
      \"payload\": \"APNSChannelResponse\"\
    },\
    \"GetApnsSandboxChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetApnsSandboxChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSSandboxChannelResponse\": {\
          \"shape\": \"APNSSandboxChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSSandboxChannelResponse\"\
      ],\
      \"payload\": \"APNSSandboxChannelResponse\"\
    },\
    \"GetApnsVoipChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetApnsVoipChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSVoipChannelResponse\": {\
          \"shape\": \"APNSVoipChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSVoipChannelResponse\"\
      ],\
      \"payload\": \"APNSVoipChannelResponse\"\
    },\
    \"GetApnsVoipSandboxChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetApnsVoipSandboxChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSVoipSandboxChannelResponse\": {\
          \"shape\": \"APNSVoipSandboxChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSVoipSandboxChannelResponse\"\
      ],\
      \"payload\": \"APNSVoipSandboxChannelResponse\"\
    },\
    \"GetAppRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetAppResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationResponse\": {\
          \"shape\": \"ApplicationResponse\"\
        }\
      },\
      \"required\": [\
        \"ApplicationResponse\"\
      ],\
      \"payload\": \"ApplicationResponse\"\
    },\
    \"GetApplicationDateRangeKpiRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"EndTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"location\": \"querystring\",\
          \"locationName\": \"end-time\",\
          \"documentation\": \"<p>The last date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.</p>\"\
        },\
        \"KpiName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"kpi-name\",\
          \"documentation\": \"<p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, to retrieve data for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. Examples are email-open-rate and successful-delivery-rate. For a list of valid values, see the <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Amazon Pinpoint Developer Guide</a>.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"next-token\",\
          \"documentation\": \"<p>The  string that specifies which page of results to return in a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"StartTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"location\": \"querystring\",\
          \"locationName\": \"start-time\",\
          \"documentation\": \"<p>The first date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also be fewer than 90 days from the current day.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"KpiName\"\
      ]\
    },\
    \"GetApplicationDateRangeKpiResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationDateRangeKpiResponse\": {\
          \"shape\": \"ApplicationDateRangeKpiResponse\"\
        }\
      },\
      \"required\": [\
        \"ApplicationDateRangeKpiResponse\"\
      ],\
      \"payload\": \"ApplicationDateRangeKpiResponse\"\
    },\
    \"GetApplicationSettingsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetApplicationSettingsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationSettingsResource\": {\
          \"shape\": \"ApplicationSettingsResource\"\
        }\
      },\
      \"required\": [\
        \"ApplicationSettingsResource\"\
      ],\
      \"payload\": \"ApplicationSettingsResource\"\
    },\
    \"GetAppsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      }\
    },\
    \"GetAppsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationsResponse\": {\
          \"shape\": \"ApplicationsResponse\"\
        }\
      },\
      \"required\": [\
        \"ApplicationsResponse\"\
      ],\
      \"payload\": \"ApplicationsResponse\"\
    },\
    \"GetBaiduChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetBaiduChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BaiduChannelResponse\": {\
          \"shape\": \"BaiduChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"BaiduChannelResponse\"\
      ],\
      \"payload\": \"BaiduChannelResponse\"\
    },\
    \"GetCampaignActivitiesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"campaign-id\",\
          \"documentation\": \"<p>The unique identifier for the campaign.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"CampaignId\"\
      ]\
    },\
    \"GetCampaignActivitiesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ActivitiesResponse\": {\
          \"shape\": \"ActivitiesResponse\"\
        }\
      },\
      \"required\": [\
        \"ActivitiesResponse\"\
      ],\
      \"payload\": \"ActivitiesResponse\"\
    },\
    \"GetCampaignDateRangeKpiRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"campaign-id\",\
          \"documentation\": \"<p>The unique identifier for the campaign.</p>\"\
        },\
        \"EndTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"location\": \"querystring\",\
          \"locationName\": \"end-time\",\
          \"documentation\": \"<p>The last date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.</p>\"\
        },\
        \"KpiName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"kpi-name\",\
          \"documentation\": \"<p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, to retrieve data for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. Examples are email-open-rate and successful-delivery-rate. For a list of valid values, see the <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Amazon Pinpoint Developer Guide</a>.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"next-token\",\
          \"documentation\": \"<p>The  string that specifies which page of results to return in a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"StartTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"location\": \"querystring\",\
          \"locationName\": \"start-time\",\
          \"documentation\": \"<p>The first date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also be fewer than 90 days from the current day.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"KpiName\",\
        \"CampaignId\"\
      ]\
    },\
    \"GetCampaignDateRangeKpiResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignDateRangeKpiResponse\": {\
          \"shape\": \"CampaignDateRangeKpiResponse\"\
        }\
      },\
      \"required\": [\
        \"CampaignDateRangeKpiResponse\"\
      ],\
      \"payload\": \"CampaignDateRangeKpiResponse\"\
    },\
    \"GetCampaignRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"campaign-id\",\
          \"documentation\": \"<p>The unique identifier for the campaign.</p>\"\
        }\
      },\
      \"required\": [\
        \"CampaignId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"GetCampaignResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignResponse\": {\
          \"shape\": \"CampaignResponse\"\
        }\
      },\
      \"required\": [\
        \"CampaignResponse\"\
      ],\
      \"payload\": \"CampaignResponse\"\
    },\
    \"GetCampaignVersionRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"campaign-id\",\
          \"documentation\": \"<p>The unique identifier for the campaign.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique version number (Version property) for the campaign version.</p>\"\
        }\
      },\
      \"required\": [\
        \"Version\",\
        \"ApplicationId\",\
        \"CampaignId\"\
      ]\
    },\
    \"GetCampaignVersionResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignResponse\": {\
          \"shape\": \"CampaignResponse\"\
        }\
      },\
      \"required\": [\
        \"CampaignResponse\"\
      ],\
      \"payload\": \"CampaignResponse\"\
    },\
    \"GetCampaignVersionsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"campaign-id\",\
          \"documentation\": \"<p>The unique identifier for the campaign.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"CampaignId\"\
      ]\
    },\
    \"GetCampaignVersionsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignsResponse\": {\
          \"shape\": \"CampaignsResponse\"\
        }\
      },\
      \"required\": [\
        \"CampaignsResponse\"\
      ],\
      \"payload\": \"CampaignsResponse\"\
    },\
    \"GetCampaignsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetCampaignsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignsResponse\": {\
          \"shape\": \"CampaignsResponse\"\
        }\
      },\
      \"required\": [\
        \"CampaignsResponse\"\
      ],\
      \"payload\": \"CampaignsResponse\"\
    },\
    \"GetChannelsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetChannelsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelsResponse\": {\
          \"shape\": \"ChannelsResponse\"\
        }\
      },\
      \"required\": [\
        \"ChannelsResponse\"\
      ],\
      \"payload\": \"ChannelsResponse\"\
    },\
    \"GetEmailChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetEmailChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EmailChannelResponse\": {\
          \"shape\": \"EmailChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"EmailChannelResponse\"\
      ],\
      \"payload\": \"EmailChannelResponse\"\
    },\
    \"GetEmailTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"GetEmailTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EmailTemplateResponse\": {\
          \"shape\": \"EmailTemplateResponse\"\
        }\
      },\
      \"required\": [\
        \"EmailTemplateResponse\"\
      ],\
      \"payload\": \"EmailTemplateResponse\"\
    },\
    \"GetEndpointRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"EndpointId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"endpoint-id\",\
          \"documentation\": \"<p>The unique identifier for the endpoint.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"EndpointId\"\
      ]\
    },\
    \"GetEndpointResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EndpointResponse\": {\
          \"shape\": \"EndpointResponse\"\
        }\
      },\
      \"required\": [\
        \"EndpointResponse\"\
      ],\
      \"payload\": \"EndpointResponse\"\
    },\
    \"GetEventStreamRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetEventStreamResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EventStream\": {\
          \"shape\": \"EventStream\"\
        }\
      },\
      \"required\": [\
        \"EventStream\"\
      ],\
      \"payload\": \"EventStream\"\
    },\
    \"GetExportJobRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JobId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"job-id\",\
          \"documentation\": \"<p>The unique identifier for the job.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"JobId\"\
      ]\
    },\
    \"GetExportJobResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ExportJobResponse\": {\
          \"shape\": \"ExportJobResponse\"\
        }\
      },\
      \"required\": [\
        \"ExportJobResponse\"\
      ],\
      \"payload\": \"ExportJobResponse\"\
    },\
    \"GetExportJobsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetExportJobsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ExportJobsResponse\": {\
          \"shape\": \"ExportJobsResponse\"\
        }\
      },\
      \"required\": [\
        \"ExportJobsResponse\"\
      ],\
      \"payload\": \"ExportJobsResponse\"\
    },\
    \"GetGcmChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetGcmChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"GCMChannelResponse\": {\
          \"shape\": \"GCMChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"GCMChannelResponse\"\
      ],\
      \"payload\": \"GCMChannelResponse\"\
    },\
    \"GetImportJobRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JobId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"job-id\",\
          \"documentation\": \"<p>The unique identifier for the job.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"JobId\"\
      ]\
    },\
    \"GetImportJobResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ImportJobResponse\": {\
          \"shape\": \"ImportJobResponse\"\
        }\
      },\
      \"required\": [\
        \"ImportJobResponse\"\
      ],\
      \"payload\": \"ImportJobResponse\"\
    },\
    \"GetImportJobsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetImportJobsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ImportJobsResponse\": {\
          \"shape\": \"ImportJobsResponse\"\
        }\
      },\
      \"required\": [\
        \"ImportJobsResponse\"\
      ],\
      \"payload\": \"ImportJobsResponse\"\
    },\
    \"GetInAppMessagesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"EndpointId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"endpoint-id\",\
          \"documentation\": \"<p>The unique identifier for the endpoint.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"EndpointId\"\
      ]\
    },\
    \"GetInAppMessagesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InAppMessagesResponse\": {\
          \"shape\": \"InAppMessagesResponse\"\
        }\
      },\
      \"required\": [\
        \"InAppMessagesResponse\"\
      ],\
      \"payload\": \"InAppMessagesResponse\"\
    },\
    \"GetInAppTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"GetInAppTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InAppTemplateResponse\": {\
          \"shape\": \"InAppTemplateResponse\"\
        }\
      },\
      \"required\": [\
        \"InAppTemplateResponse\"\
      ],\
      \"payload\": \"InAppTemplateResponse\"\
    },\
    \"GetJourneyDateRangeKpiRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"EndTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"location\": \"querystring\",\
          \"locationName\": \"end-time\",\
          \"documentation\": \"<p>The last date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        },\
        \"KpiName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"kpi-name\",\
          \"documentation\": \"<p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, to retrieve data for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. Examples are email-open-rate and successful-delivery-rate. For a list of valid values, see the <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Amazon Pinpoint Developer Guide</a>.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"next-token\",\
          \"documentation\": \"<p>The  string that specifies which page of results to return in a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"StartTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"location\": \"querystring\",\
          \"locationName\": \"start-time\",\
          \"documentation\": \"<p>The first date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also be fewer than 90 days from the current day.</p>\"\
        }\
      },\
      \"required\": [\
        \"JourneyId\",\
        \"ApplicationId\",\
        \"KpiName\"\
      ]\
    },\
    \"GetJourneyDateRangeKpiResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyDateRangeKpiResponse\": {\
          \"shape\": \"JourneyDateRangeKpiResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyDateRangeKpiResponse\"\
      ],\
      \"payload\": \"JourneyDateRangeKpiResponse\"\
    },\
    \"GetJourneyExecutionActivityMetricsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JourneyActivityId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-activity-id\",\
          \"documentation\": \"<p>The unique identifier for the journey activity.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"next-token\",\
          \"documentation\": \"<p>The <code/> string that specifies which page of results to return in a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        }\
      },\
      \"required\": [\
        \"JourneyActivityId\",\
        \"ApplicationId\",\
        \"JourneyId\"\
      ]\
    },\
    \"GetJourneyExecutionActivityMetricsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyExecutionActivityMetricsResponse\": {\
          \"shape\": \"JourneyExecutionActivityMetricsResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyExecutionActivityMetricsResponse\"\
      ],\
      \"payload\": \"JourneyExecutionActivityMetricsResponse\"\
    },\
    \"GetJourneyExecutionMetricsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"next-token\",\
          \"documentation\": \"<p>The <code/> string that specifies which page of results to return in a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"JourneyId\"\
      ]\
    },\
    \"GetJourneyExecutionMetricsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyExecutionMetricsResponse\": {\
          \"shape\": \"JourneyExecutionMetricsResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyExecutionMetricsResponse\"\
      ],\
      \"payload\": \"JourneyExecutionMetricsResponse\"\
    },\
    \"GetJourneyRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        }\
      },\
      \"required\": [\
        \"JourneyId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"GetJourneyResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyResponse\": {\
          \"shape\": \"JourneyResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyResponse\"\
      ],\
      \"payload\": \"JourneyResponse\"\
    },\
    \"GetJourneyRunExecutionActivityMetricsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JourneyActivityId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-activity-id\",\
          \"documentation\": \"<p>The unique identifier for the journey activity.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"next-token\",\
          \"documentation\": \"<p>The <code/> string that specifies which page of results to return in a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"RunId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"run-id\",\
          \"documentation\": \"<p>The unique identifier for the journey run.</p>\"\
        }\
      },\
      \"required\": [\
        \"RunId\",\
        \"JourneyActivityId\",\
        \"JourneyId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"GetJourneyRunExecutionActivityMetricsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyRunExecutionActivityMetricsResponse\": {\
          \"shape\": \"JourneyRunExecutionActivityMetricsResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyRunExecutionActivityMetricsResponse\"\
      ],\
      \"payload\": \"JourneyRunExecutionActivityMetricsResponse\"\
    },\
    \"GetJourneyRunExecutionMetricsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"next-token\",\
          \"documentation\": \"<p>The <code/> string that specifies which page of results to return in a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"RunId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"run-id\",\
          \"documentation\": \"<p>The unique identifier for the journey run.</p>\"\
        }\
      },\
      \"required\": [\
        \"RunId\",\
        \"ApplicationId\",\
        \"JourneyId\"\
      ]\
    },\
    \"GetJourneyRunExecutionMetricsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyRunExecutionMetricsResponse\": {\
          \"shape\": \"JourneyRunExecutionMetricsResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyRunExecutionMetricsResponse\"\
      ],\
      \"payload\": \"JourneyRunExecutionMetricsResponse\"\
    },\
    \"GetJourneyRunsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"JourneyId\"\
      ]\
    },\
    \"GetJourneyRunsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyRunsResponse\": {\
          \"shape\": \"JourneyRunsResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyRunsResponse\"\
      ],\
      \"payload\": \"JourneyRunsResponse\"\
    },\
    \"GetPushTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"GetPushTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PushNotificationTemplateResponse\": {\
          \"shape\": \"PushNotificationTemplateResponse\"\
        }\
      },\
      \"required\": [\
        \"PushNotificationTemplateResponse\"\
      ],\
      \"payload\": \"PushNotificationTemplateResponse\"\
    },\
    \"GetRecommenderConfigurationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RecommenderId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"recommender-id\",\
          \"documentation\": \"<p>The unique identifier for the recommender model configuration. This identifier is displayed as the <b>Recommender ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"RecommenderId\"\
      ]\
    },\
    \"GetRecommenderConfigurationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RecommenderConfigurationResponse\": {\
          \"shape\": \"RecommenderConfigurationResponse\"\
        }\
      },\
      \"required\": [\
        \"RecommenderConfigurationResponse\"\
      ],\
      \"payload\": \"RecommenderConfigurationResponse\"\
    },\
    \"GetRecommenderConfigurationsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      }\
    },\
    \"GetRecommenderConfigurationsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ListRecommenderConfigurationsResponse\": {\
          \"shape\": \"ListRecommenderConfigurationsResponse\"\
        }\
      },\
      \"required\": [\
        \"ListRecommenderConfigurationsResponse\"\
      ],\
      \"payload\": \"ListRecommenderConfigurationsResponse\"\
    },\
    \"GetSegmentExportJobsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"segment-id\",\
          \"documentation\": \"<p>The unique identifier for the segment.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"SegmentId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"GetSegmentExportJobsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ExportJobsResponse\": {\
          \"shape\": \"ExportJobsResponse\"\
        }\
      },\
      \"required\": [\
        \"ExportJobsResponse\"\
      ],\
      \"payload\": \"ExportJobsResponse\"\
    },\
    \"GetSegmentImportJobsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"segment-id\",\
          \"documentation\": \"<p>The unique identifier for the segment.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"SegmentId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"GetSegmentImportJobsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ImportJobsResponse\": {\
          \"shape\": \"ImportJobsResponse\"\
        }\
      },\
      \"required\": [\
        \"ImportJobsResponse\"\
      ],\
      \"payload\": \"ImportJobsResponse\"\
    },\
    \"GetSegmentRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"segment-id\",\
          \"documentation\": \"<p>The unique identifier for the segment.</p>\"\
        }\
      },\
      \"required\": [\
        \"SegmentId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"GetSegmentResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SegmentResponse\": {\
          \"shape\": \"SegmentResponse\"\
        }\
      },\
      \"required\": [\
        \"SegmentResponse\"\
      ],\
      \"payload\": \"SegmentResponse\"\
    },\
    \"GetSegmentVersionRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"segment-id\",\
          \"documentation\": \"<p>The unique identifier for the segment.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique version number (Version property) for the campaign version.</p>\"\
        }\
      },\
      \"required\": [\
        \"SegmentId\",\
        \"Version\",\
        \"ApplicationId\"\
      ]\
    },\
    \"GetSegmentVersionResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SegmentResponse\": {\
          \"shape\": \"SegmentResponse\"\
        }\
      },\
      \"required\": [\
        \"SegmentResponse\"\
      ],\
      \"payload\": \"SegmentResponse\"\
    },\
    \"GetSegmentVersionsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"segment-id\",\
          \"documentation\": \"<p>The unique identifier for the segment.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"SegmentId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"GetSegmentVersionsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SegmentsResponse\": {\
          \"shape\": \"SegmentsResponse\"\
        }\
      },\
      \"required\": [\
        \"SegmentsResponse\"\
      ],\
      \"payload\": \"SegmentsResponse\"\
    },\
    \"GetSegmentsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetSegmentsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SegmentsResponse\": {\
          \"shape\": \"SegmentsResponse\"\
        }\
      },\
      \"required\": [\
        \"SegmentsResponse\"\
      ],\
      \"payload\": \"SegmentsResponse\"\
    },\
    \"GetSmsChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetSmsChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SMSChannelResponse\": {\
          \"shape\": \"SMSChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"SMSChannelResponse\"\
      ],\
      \"payload\": \"SMSChannelResponse\"\
    },\
    \"GetSmsTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"GetSmsTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SMSTemplateResponse\": {\
          \"shape\": \"SMSTemplateResponse\"\
        }\
      },\
      \"required\": [\
        \"SMSTemplateResponse\"\
      ],\
      \"payload\": \"SMSTemplateResponse\"\
    },\
    \"GetUserEndpointsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"UserId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"user-id\",\
          \"documentation\": \"<p>The unique identifier for the user.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"UserId\"\
      ]\
    },\
    \"GetUserEndpointsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EndpointsResponse\": {\
          \"shape\": \"EndpointsResponse\"\
        }\
      },\
      \"required\": [\
        \"EndpointsResponse\"\
      ],\
      \"payload\": \"EndpointsResponse\"\
    },\
    \"GetVoiceChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"GetVoiceChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"VoiceChannelResponse\": {\
          \"shape\": \"VoiceChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"VoiceChannelResponse\"\
      ],\
      \"payload\": \"VoiceChannelResponse\"\
    },\
    \"GetVoiceTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\"\
      ]\
    },\
    \"GetVoiceTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"VoiceTemplateResponse\": {\
          \"shape\": \"VoiceTemplateResponse\"\
        }\
      },\
      \"required\": [\
        \"VoiceTemplateResponse\"\
      ],\
      \"payload\": \"VoiceTemplateResponse\"\
    },\
    \"HoldoutActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the next activity to perform, after performing the holdout activity.</p>\"\
        },\
        \"Percentage\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The percentage of participants who shouldn't continue the journey.</p> <p>To determine which participants are held out, Amazon Pinpoint applies a probability-based algorithm to the percentage that you specify. Therefore, the actual percentage of participants who are held out may not be equal to the percentage that you specify.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a holdout activity in a journey. This type of activity stops a journey for a specified percentage of participants.</p>\",\
      \"required\": [\
        \"Percentage\"\
      ]\
    },\
    \"ImportJobRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DefineSegment\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to create a segment that contains the endpoints, when the endpoint definitions are imported.</p>\"\
        },\
        \"ExternalId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy. Amazon Pinpoint previously used this value to assume an IAM role when importing endpoint definitions, but we removed this requirement. We don't recommend use of external IDs for IAM roles that are assumed by Amazon Pinpoint.</p>\"\
        },\
        \"Format\": {\
          \"shape\": \"Format\",\
          \"documentation\": \"<p>The format of the files that contain the endpoint definitions to import. Valid values are: CSV, for comma-separated values format; and, JSON, for newline-delimited JSON format. If the Amazon S3 location stores multiple files that use different formats, Amazon Pinpoint imports data only from the files that use the specified format.</p>\"\
        },\
        \"RegisterEndpoints\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to register the endpoints with Amazon Pinpoint, when the endpoint definitions are imported.</p>\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location to import endpoint definitions from.</p>\"\
        },\
        \"S3Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the Amazon Simple Storage Service (Amazon S3) bucket that contains the endpoint definitions to import. This location can be a folder or a single file. If the location is a folder, Amazon Pinpoint imports endpoint definitions from the files in this location, including any subfolders that the folder contains.</p> <p>The URL should be in the following format: s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/<replaceable>file-name</replaceable>. The location can end with the key for an individual object or a prefix that qualifies multiple objects.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identifier for the segment to update or add the imported endpoint definitions to, if the import job is meant to update an existing segment.</p>\"\
        },\
        \"SegmentName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom name for the segment that's created by the import job, if the value of the DefineSegment property is true.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a job that imports endpoint definitions from an Amazon Simple Storage Service (Amazon S3) bucket.</p>\",\
      \"required\": [\
        \"Format\",\
        \"S3Url\",\
        \"RoleArn\"\
      ]\
    },\
    \"ImportJobResource\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DefineSegment\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the import job creates a segment that contains the endpoints, when the endpoint definitions are imported.</p>\"\
        },\
        \"ExternalId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy. Amazon Pinpoint previously used this value to assume an IAM role when importing endpoint definitions, but we removed this requirement. We don't recommend use of external IDs for IAM roles that are assumed by Amazon Pinpoint.</p>\"\
        },\
        \"Format\": {\
          \"shape\": \"Format\",\
          \"documentation\": \"<p>The format of the files that contain the endpoint definitions to import. Valid values are: CSV, for comma-separated values format; and, JSON, for newline-delimited JSON format.</p> <p>If the files are stored in an Amazon S3 location and that location contains multiple files that use different formats, Amazon Pinpoint imports data only from the files that use the specified format.</p>\"\
        },\
        \"RegisterEndpoints\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the import job registers the endpoints with Amazon Pinpoint, when the endpoint definitions are imported.</p>\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location to import endpoint definitions from.</p>\"\
        },\
        \"S3Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the Amazon Simple Storage Service (Amazon S3) bucket that contains the endpoint definitions to import. This location can be a folder or a single file. If the location is a folder, Amazon Pinpoint imports endpoint definitions from the files in this location, including any subfolders that the folder contains.</p> <p>The URL should be in the following format: s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/<replaceable>file-name</replaceable>. The location can end with the key for an individual object or a prefix that qualifies multiple objects.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identifier for the segment that the import job updates or adds endpoint definitions to, if the import job updates an existing segment.</p>\"\
        },\
        \"SegmentName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom name for the segment that's created by the import job, if the value of the DefineSegment property is true.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the resource settings for a job that imports endpoint definitions from one or more files. The files can be stored in an Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a computer by using the Amazon Pinpoint console.</p>\",\
      \"required\": [\
        \"Format\",\
        \"S3Url\",\
        \"RoleArn\"\
      ]\
    },\
    \"ImportJobResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that's associated with the import job.</p>\"\
        },\
        \"CompletedPieces\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of pieces that were processed successfully (completed) by the import job, as of the time of the request.</p>\"\
        },\
        \"CompletionDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the import job was completed.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the import job was created.</p>\"\
        },\
        \"Definition\": {\
          \"shape\": \"ImportJobResource\",\
          \"documentation\": \"<p>The resource settings that apply to the import job.</p>\"\
        },\
        \"FailedPieces\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of pieces that weren't processed successfully (failed) by the import job, as of the time of the request.</p>\"\
        },\
        \"Failures\": {\
          \"shape\": \"ListOf__string\",\
          \"documentation\": \"<p>An array of entries, one for each of the first 100 entries that weren't processed successfully (failed) by the import job, if any.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the import job.</p>\"\
        },\
        \"JobStatus\": {\
          \"shape\": \"JobStatus\",\
          \"documentation\": \"<p>The status of the import job. The job status is FAILED if Amazon Pinpoint wasn't able to process one or more pieces in the job.</p>\"\
        },\
        \"TotalFailures\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of endpoint definitions that weren't processed successfully (failed) by the import job, typically because an error, such as a syntax error, occurred.</p>\"\
        },\
        \"TotalPieces\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of pieces that must be processed to complete the import job. Each piece consists of an approximately equal portion of the endpoint definitions that are part of the import job.</p>\"\
        },\
        \"TotalProcessed\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The total number of endpoint definitions that were processed by the import job.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The job type. This value is IMPORT for import jobs.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of a job that imports endpoint definitions from one or more files. The files can be stored in an Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a computer by using the Amazon Pinpoint console.</p>\",\
      \"required\": [\
        \"JobStatus\",\
        \"CreationDate\",\
        \"Type\",\
        \"Definition\",\
        \"Id\",\
        \"ApplicationId\"\
      ]\
    },\
    \"ImportJobsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfImportJobResponse\",\
          \"documentation\": \"<p>An array of responses, one for each import job that's associated with the application (Import Jobs resource) or segment (Segment Import Jobs resource).</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of all the import jobs that are associated with an application or segment. An import job is a job that imports endpoint definitions from one or more files.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"InAppCampaignSchedule\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EndDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The scheduled time after which the in-app message should not be shown. Timestamp is in ISO 8601 format.</p>\"\
        },\
        \"EventFilter\": {\
          \"shape\": \"CampaignEventFilter\",\
          \"documentation\": \"<p>The event filter the SDK has to use to show the in-app message in the application.</p>\"\
        },\
        \"QuietTime\": {\
          \"shape\": \"QuietTime\",\
          \"documentation\": \"<p>Time during which the in-app message should not be shown to the user.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Schedule of the campaign.</p>\"\
    },\
    \"InAppMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Content\": {\
          \"shape\": \"ListOfInAppMessageContent\",\
          \"documentation\": \"<p>In-app message content.</p>\"\
        },\
        \"CustomConfig\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>Custom config to be sent to SDK.</p>\"\
        },\
        \"Layout\": {\
          \"shape\": \"Layout\",\
          \"documentation\": \"<p>The layout of the message.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides all fields required for building an in-app message.</p>\"\
    },\
    \"InAppMessageBodyConfig\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Alignment\": {\
          \"shape\": \"Alignment\",\
          \"documentation\": \"<p>The alignment of the text. Valid values: LEFT, CENTER, RIGHT.</p>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Message Body.</p>\"\
        },\
        \"TextColor\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The text color.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Text config for Message Body.</p>\",\
      \"required\": [\
        \"Alignment\",\
        \"TextColor\",\
        \"Body\"\
      ]\
    },\
    \"InAppMessageButton\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Android\": {\
          \"shape\": \"OverrideButtonConfiguration\",\
          \"documentation\": \"<p>Default button content.</p>\"\
        },\
        \"DefaultConfig\": {\
          \"shape\": \"DefaultButtonConfiguration\",\
          \"documentation\": \"<p>Default button content.</p>\"\
        },\
        \"IOS\": {\
          \"shape\": \"OverrideButtonConfiguration\",\
          \"documentation\": \"<p>Default button content.</p>\"\
        },\
        \"Web\": {\
          \"shape\": \"OverrideButtonConfiguration\",\
          \"documentation\": \"<p>Default button content.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Button Config for an in-app message.</p>\"\
    },\
    \"InAppMessageCampaign\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Campaign id of the corresponding campaign.</p>\"\
        },\
        \"DailyCap\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>Daily cap which controls the number of times any in-app messages can be shown to the endpoint during a day.</p>\"\
        },\
        \"InAppMessage\": {\
          \"shape\": \"InAppMessage\",\
          \"documentation\": \"<p>In-app message content with all fields required for rendering an in-app message.</p>\"\
        },\
        \"Priority\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>Priority of the in-app message.</p>\"\
        },\
        \"Schedule\": {\
          \"shape\": \"InAppCampaignSchedule\",\
          \"documentation\": \"<p>Schedule of the campaign.</p>\"\
        },\
        \"SessionCap\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>Session cap which controls the number of times an in-app message can be shown to the endpoint during an application session.</p>\"\
        },\
        \"TotalCap\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>Total cap which controls the number of times an in-app message can be shown to the endpoint.</p>\"\
        },\
        \"TreatmentId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Treatment id of the campaign.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Targeted in-app message campaign.</p>\"\
    },\
    \"InAppMessageContent\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BackgroundColor\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The background color for the message.</p>\"\
        },\
        \"BodyConfig\": {\
          \"shape\": \"InAppMessageBodyConfig\",\
          \"documentation\": \"<p>The configuration for the message body.</p>\"\
        },\
        \"HeaderConfig\": {\
          \"shape\": \"InAppMessageHeaderConfig\",\
          \"documentation\": \"<p>The configuration for the message header.</p>\"\
        },\
        \"ImageUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The image url for the background of message.</p>\"\
        },\
        \"PrimaryBtn\": {\
          \"shape\": \"InAppMessageButton\",\
          \"documentation\": \"<p>The first button inside the message.</p>\"\
        },\
        \"SecondaryBtn\": {\
          \"shape\": \"InAppMessageButton\",\
          \"documentation\": \"<p>The second button inside message.</p>\"\
        }\
      },\
      \"documentation\": \"<p>The configuration for the message content.</p>\"\
    },\
    \"InAppMessageHeaderConfig\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Alignment\": {\
          \"shape\": \"Alignment\",\
          \"documentation\": \"<p>The alignment of the text. Valid values: LEFT, CENTER, RIGHT.</p>\"\
        },\
        \"Header\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Message Header.</p>\"\
        },\
        \"TextColor\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The text color.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Text config for Message Header.</p>\",\
      \"required\": [\
        \"Alignment\",\
        \"Header\",\
        \"TextColor\"\
      ]\
    },\
    \"InAppMessagesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InAppMessageCampaigns\": {\
          \"shape\": \"ListOfInAppMessageCampaign\",\
          \"documentation\": \"<p>List of targeted in-app message campaigns.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Get in-app messages response object.</p>\"\
    },\
    \"InAppTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Content\": {\
          \"shape\": \"ListOfInAppMessageContent\",\
          \"documentation\": \"<p>The content of the message, can include up to 5 modals. Each modal must contain a message, a header, and background color. ImageUrl and buttons are optional.</p>\"\
        },\
        \"CustomConfig\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>Custom config to be sent to client.</p>\"\
        },\
        \"Layout\": {\
          \"shape\": \"Layout\",\
          \"documentation\": \"<p>The layout of the message.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<note><p>As of <b>22-05-2023</b> tags has been deprecated for update operations. After this date any value in tags is not processed and an error code is not returned. To manage tags we recommend using either <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html\\\">Tags</a> in the <i>API Reference for Amazon Pinpoint</i>, <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html\\\">resourcegroupstaggingapi</a> commands in the <i>AWS Command Line Interface Documentation</i> or <a href=\\\"https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html\\\">resourcegroupstaggingapi</a> in the <i>AWS SDK</i>.</p></note> <p>(Deprecated) A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>InApp Template Request.</p>\"\
    },\
    \"InAppTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The resource arn of the template.</p>\"\
        },\
        \"Content\": {\
          \"shape\": \"ListOfInAppMessageContent\",\
          \"documentation\": \"<p>The content of the message, can include up to 5 modals. Each modal must contain a message, a header, and background color. ImageUrl and buttons are optional.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The creation date of the template.</p>\"\
        },\
        \"CustomConfig\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>Custom config to be sent to client.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The last modified date of the template.</p>\"\
        },\
        \"Layout\": {\
          \"shape\": \"Layout\",\
          \"documentation\": \"<p>The layout of the message.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the template.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the template.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"TemplateType\",\
          \"documentation\": \"<p>The type of the template.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version id of the template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>In-App Template Response.</p>\",\
      \"required\": [\
        \"LastModifiedDate\",\
        \"CreationDate\",\
        \"TemplateName\",\
        \"TemplateType\"\
      ]\
    },\
    \"Include\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ALL\",\
        \"ANY\",\
        \"NONE\"\
      ]\
    },\
    \"InternalServerErrorException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request or response.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an API request or response.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 500\
      }\
    },\
    \"ItemResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EndpointItemResponse\": {\
          \"shape\": \"EndpointItemResponse\",\
          \"documentation\": \"<p>The response that was received after the endpoint data was accepted.</p>\"\
        },\
        \"EventsItemResponse\": {\
          \"shape\": \"MapOfEventItemResponse\",\
          \"documentation\": \"<p>A multipart response object that contains a key and a value for each event in the request. In each object, the event ID is the key and an EventItemResponse object is the value.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the results of a request to create or update an endpoint that's associated with an event.</p>\"\
    },\
    \"JobStatus\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"CREATED\",\
        \"PREPARING_FOR_INITIALIZATION\",\
        \"INITIALIZING\",\
        \"PROCESSING\",\
        \"PENDING_JOB\",\
        \"COMPLETING\",\
        \"COMPLETED\",\
        \"FAILING\",\
        \"FAILED\"\
      ]\
    },\
    \"JourneyCustomMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Data\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message content that's passed to an AWS Lambda function or to a web hook.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the message content for a custom channel message that's sent to participants in a journey.</p>\"\
    },\
    \"JourneyDateRangeKpiResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the metric applies to.</p>\"\
        },\
        \"EndTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The last date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the journey that the metric applies to.</p>\"\
        },\
        \"KpiName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, that the data was retrieved for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. For a list of possible values, see the <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Amazon Pinpoint Developer Guide</a>.</p>\"\
        },\
        \"KpiResult\": {\
          \"shape\": \"BaseKpiResult\",\
          \"documentation\": \"<p>An array of objects that contains the results of the query. Each object contains the value for the metric and metadata about that value.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null for the Journey Engagement Metrics resource because the resource returns all results in a single page.</p>\"\
        },\
        \"StartTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The first date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the results of a query that retrieved the data for a standard engagement metric that applies to a journey, and provides information about that query.</p>\",\
      \"required\": [\
        \"KpiResult\",\
        \"KpiName\",\
        \"JourneyId\",\
        \"EndTime\",\
        \"StartTime\",\
        \"ApplicationId\"\
      ]\
    },\
    \"JourneyEmailMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"FromAddress\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The verified email address to send the email message from. The default address is the FromAddress specified for the email channel for the application.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the \\\"From\\\" address for an email message that's sent to participants in a journey.</p>\"\
    },\
    \"JourneyExecutionActivityMetricsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ActivityType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of activity that the metric applies to. Possible values are:</p> <ul><li><p>CONDITIONAL_SPLIT â For a yes/no split activity, which is an activity that sends participants down one of two paths in a journey.</p></li> <li><p>HOLDOUT â For a holdout activity, which is an activity that stops a journey for a specified percentage of participants.</p></li> <li><p>MESSAGE â For an email activity, which is an activity that sends an email message to participants.</p></li> <li><p>MULTI_CONDITIONAL_SPLIT â For a multivariate split activity, which is an activity that sends participants down one of as many as five paths in a journey.</p></li> <li><p>RANDOM_SPLIT â For a random split activity, which is an activity that sends specified percentages of participants down one of as many as five paths in a journey.</p></li> <li><p>WAIT â For a wait activity, which is an activity that waits for a certain amount of time or until a specific date and time before moving participants to the next activity in a journey.</p></li></ul>\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the metric applies to.</p>\"\
        },\
        \"JourneyActivityId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the activity that the metric applies to.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the journey that the metric applies to.</p>\"\
        },\
        \"LastEvaluatedTime\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the execution status of the activity and updated the data for the metric.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A JSON object that contains the results of the query. The results vary depending on the type of activity (ActivityType). For information about the structure and contents of the results, see the <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Amazon Pinpoint Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the results of a query that retrieved the data for a standard execution metric that applies to a journey activity, and provides information about that query.</p>\",\
      \"required\": [\
        \"Metrics\",\
        \"JourneyId\",\
        \"LastEvaluatedTime\",\
        \"JourneyActivityId\",\
        \"ActivityType\",\
        \"ApplicationId\"\
      ]\
    },\
    \"JourneyExecutionMetricsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the metric applies to.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the journey that the metric applies to.</p>\"\
        },\
        \"LastEvaluatedTime\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the journey and updated the data for the metric.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A JSON object that contains the results of the query. For information about the structure and contents of the results, see the <a href=\\\"https://docs.aws.amazon.com//pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Amazon Pinpoint Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the results of a query that retrieved the data for a standard execution metric that applies to a journey, and provides information about that query.</p>\",\
      \"required\": [\
        \"Metrics\",\
        \"JourneyId\",\
        \"LastEvaluatedTime\",\
        \"ApplicationId\"\
      ]\
    },\
    \"JourneyLimits\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DailyCap\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum number of messages that the journey can send to a single participant during a 24-hour period. The maximum value is 100.</p>\"\
        },\
        \"EndpointReentryCap\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum number of times that a participant can enter the journey. The maximum value is 100. To allow participants to enter the journey an unlimited number of times, set this value to 0.</p>\"\
        },\
        \"MessagesPerSecond\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum number of messages that the journey can send each second.</p>\"\
        },\
        \"EndpointReentryInterval\": {\
            \"shape\": \"__string\",\
            \"documentation\": \"<p>Minimum time that must pass before an endpoint can re-enter a given journey. The duration should use an ISO 8601 format, such as PT1H. </p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies limits on the messages that a journey can send and the number of times participants can enter a journey.</p>\"\
    },\
    \"JourneyPushMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TimeToLive\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The number of seconds that the push notification service should keep the message, if the service is unable to deliver the notification the first time. This value is converted to an expiration value when it's sent to a push-notification service. If this value is 0, the service treats the notification as if it expires immediately and the service doesn't store or try to deliver the notification again.</p> <p>This value doesn't apply to messages that are sent through the Amazon Device Messaging (ADM) service.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the message configuration for a push notification that's sent to participants in a journey.</p>\"\
    },\
    \"JourneyChannelSettings\": {\
      \"type\": \"structure\",\
        \"members\": {\
          \"ConnectCampaignArn\": {\
            \"shape\": \"__string\",\
            \"documentation\": \"<p>Amazon Resource Name (ARN) of the Connect Campaign.</p>\"\
          },\
          \"ConnectCampaignExecutionRoleArn\": {\
            \"shape\": \"__string\",\
            \"documentation\": \"<p>IAM role ARN to be assumed when invoking Connect campaign execution APIs for dialing.</p>\"\
          }\
        },\
      \"documentation\": \"<p>The channel-specific configurations for the journey.</p>\"\
    },\
    \"JourneyResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Activities\": {\
          \"shape\": \"MapOfActivity\",\
          \"documentation\": \"<p>A map that contains a set of Activity objects, one object for each activity in the journey. For each Activity object, the key is the unique identifier (string) for an activity and the value is the settings for the activity.</p>\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the journey applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the journey was created.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the journey was last modified.</p>\"\
        },\
        \"Limits\": {\
          \"shape\": \"JourneyLimits\",\
          \"documentation\": \"<p>The messaging and entry limits for the journey.</p>\"\
        },\
        \"LocalTime\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the journey's scheduled start and end times use each participant's local time. If this value is true, the schedule uses each participant's local time.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the journey.</p>\"\
        },\
        \"QuietTime\": {\
          \"shape\": \"QuietTime\",\
          \"documentation\": \"<p>The quiet time settings for the journey. Quiet time is a specific time range when a journey doesn't send messages to participants, if all the following conditions are met:</p> <ul><li><p>The EndpointDemographic.Timezone property of the endpoint for the participant is set to a valid value.</p></li> <li><p>The current time in the participant's time zone is later than or equal to the time specified by the QuietTime.Start property for the journey.</p></li> <li><p>The current time in the participant's time zone is earlier than or equal to the time specified by the QuietTime.End property for the journey.</p></li></ul> <p>If any of the preceding conditions isn't met, the participant will receive messages from the journey, even if quiet time is enabled.</p>\"\
        },\
        \"RefreshFrequency\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The frequency with which Amazon Pinpoint evaluates segment and event data for the journey, as a duration in ISO 8601 format.</p>\"\
        },\
        \"Schedule\": {\
          \"shape\": \"JourneySchedule\",\
          \"documentation\": \"<p>The schedule settings for the journey.</p>\"\
        },\
        \"StartActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the first activity in the journey.</p>\"\
        },\
        \"StartCondition\": {\
          \"shape\": \"StartCondition\",\
          \"documentation\": \"<p>The segment that defines which users are participants in the journey.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"State\",\
          \"documentation\": \"<p>The current status of the journey. Possible values are:</p> <ul><li><p>DRAFT - The journey is being developed and hasn't been published yet.</p></li> <li><p>ACTIVE - The journey has been developed and published. Depending on the journey's schedule, the journey may currently be running or scheduled to start running at a later time. If a journey's status is ACTIVE, you can't add, change, or remove activities from it.</p></li> <li><p>COMPLETED - The journey has been published and has finished running. All participants have entered the journey and no participants are waiting to complete the journey or any activities in the journey.</p></li> <li><p>CANCELLED - The journey has been stopped. If a journey's status is CANCELLED, you can't add, change, or remove activities or segment settings from the journey.</p></li> <li><p>CLOSED - The journey has been published and has started running. It may have also passed its scheduled end time, or passed its scheduled start time and a refresh frequency hasn't been specified for it. If a journey's status is CLOSED, you can't add participants to it, and no existing participants can enter the journey for the first time. However, any existing participants who are currently waiting to start an activity may continue the journey.</p></li></ul>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>This object is not used or supported.</p>\"\
        },\
        \"WaitForQuietTime\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Indicates whether endpoints in quiet hours should enter a wait activity until quiet hours have elapsed.</p>\"\
        },\
        \"RefreshOnSegmentUpdate\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Indicates whether the journey participants should be refreshed when a segment is updated.</p>\"\
        },\
        \"JourneyChannelSettings\": {\
          \"shape\": \"JourneyChannelSettings\",\
          \"documentation\": \"<p>The channel-specific configurations for the journey.</p>\"\
        },\
        \"SendingSchedule\": {\
            \"shape\": \"__boolean\",\
            \"documentation\": \"<p>Indicates if journey has Advance Quiet Time enabled. This flag should be set to true in order to allow using OpenHours and ClosedDays.</p>\"\
        },\
        \"OpenHours\": {\
            \"shape\": \"OpenHours\",\
            \"documentation\": \"<p>The time when a journey can send messages. QuietTime should be configured first and SendingSchedule should be set to true.</p>\"\
        },\
        \"ClosedDays\": {\
            \"shape\": \"ClosedDays\",\
            \"documentation\": \"<p>The time when a journey will not send messages. QuietTime should be configured first and SendingSchedule should be set to true.</p>\"\
        },\
        \"TimezoneEstimationMethods\": {\
          \"shape\": \"ListOf__TimezoneEstimationMethodsElement\",\
          \"documentation\": \"<p>An array of time zone estimation methods, if any, to use for determining an <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-endpoints-endpoint-id.html\\\">Endpoints</a> time zone if the Endpoint does not have a value for the Demographic.Timezone attribute.</p> <ul> <li><p>PHONE_NUMBER - A time zone is determined based on the Endpoint.Address and Endpoint.Location.Country.</p></li> <li><p>POSTAL_CODE - A time zone is determined based on the Endpoint.Location.PostalCode and Endpoint.Location.Country.</p> <note><p>POSTAL_CODE detection is only supported in the United States, United Kingdom, Australia, New Zealand, Canada, France, Italy, Spain, Germany and in regions where Amazon Pinpoint is available.</p></note></li> </ul>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status, configuration, and other settings for a journey.</p>\",\
      \"required\": [\
        \"Name\",\
        \"Id\",\
        \"ApplicationId\"\
      ]\
    },\
    \"JourneyRunExecutionActivityMetricsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ActivityType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of activity that the metric applies to. Possible values are:</p> <ul><li><p>CONDITIONAL_SPLIT â For a yes/no split activity, which is an activity that sends participants down one of two paths in a journey.</p></li> <li><p>HOLDOUT â For a holdout activity, which is an activity that stops a journey for a specified percentage of participants.</p></li> <li><p>MESSAGE â For an email activity, which is an activity that sends an email message to participants.</p></li> <li><p>MULTI_CONDITIONAL_SPLIT â For a multivariate split activity, which is an activity that sends participants down one of as many as five paths in a journey.</p></li> <li><p>RANDOM_SPLIT â For a random split activity, which is an activity that sends specified percentages of participants down one of as many as five paths in a journey.</p></li> <li><p>WAIT â For a wait activity, which is an activity that waits for a certain amount of time or until a specific date and time before moving participants to the next activity in a journey.</p></li></ul>\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the metric applies to.</p>\"\
        },\
        \"JourneyActivityId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the activity that the metric applies to.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the journey that the metric applies to.</p>\"\
        },\
        \"LastEvaluatedTime\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the execution status of the activity for this journey run and updated the data for the metric.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A JSON object that contains the results of the query. For information about the structure and contents of the results, see see <a href=\\\"https://docs.aws.amazon.com//pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Standard Amazon Pinpoint analytics metrics</a> in the <i>Amazon Pinpoint Developer Guide</i>.</p>\"\
        },\
        \"RunId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the journey run that the metric applies to.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the results of a query that retrieved the data for a standard execution metric that applies to a journey activity for a particular journey run, and provides information about that query.</p>\",\
      \"required\": [\
        \"Metrics\",\
        \"JourneyId\",\
        \"LastEvaluatedTime\",\
        \"JourneyActivityId\",\
        \"ActivityType\",\
        \"RunId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"JourneyRunExecutionMetricsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the metric applies to.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the journey that the metric applies to.</p>\"\
        },\
        \"LastEvaluatedTime\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the journey run and updated the data for the metric.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A JSON object that contains the results of the query. For information about the structure and contents of the results, see the <a href=\\\"https://docs.aws.amazon.com//pinpoint/latest/developerguide/analytics-standard-metrics.html\\\">Standard Amazon Pinpoint analytics metrics</a> in the <i>Amazon Pinpoint Developer Guide</i>.</p>\"\
        },\
        \"RunId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the journey run that the metric applies to.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the results of a query that retrieved the data for a standard execution metric that applies to a journey run, and provides information about that query.</p>\",\
      \"required\": [\
        \"Metrics\",\
        \"JourneyId\",\
        \"LastEvaluatedTime\",\
        \"RunId\",\
        \"ApplicationId\"\
      ]\
    },\
    \"JourneyRunResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreationTime\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The time when the journey run was created or scheduled, in ISO 8601 format.</p>\"\
        },\
        \"LastUpdateTime\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The last time the journey run was updated, in ISO 8601 format..</p>\"\
        },\
        \"RunId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the run.</p>\"\
        },\
        \"Status\": {\
          \"shape\": \"JourneyRunStatus\",\
          \"documentation\": \"<p>The current status of the journey run.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information from a specified run of a journey.</p>\",\
      \"required\": [\
        \"Status\",\
        \"LastUpdateTime\",\
        \"CreationTime\",\
        \"RunId\"\
      ]\
    },\
    \"JourneyRunsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfJourneyRunResponse\",\
          \"documentation\": \"<p>An array of responses, one for each run of the journey</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information from all runs of a journey.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"JourneyRunStatus\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"SCHEDULED\",\
        \"RUNNING\",\
        \"COMPLETED\",\
        \"CANCELLED\"\
      ]\
    },\
    \"JourneySMSMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageType\": {\
          \"shape\": \"MessageType\",\
          \"documentation\": \"<p>The SMS message type. Valid values are TRANSACTIONAL (for messages that are critical or time-sensitive, such as a one-time passwords) and PROMOTIONAL (for messsages that aren't critical or time-sensitive, such as marketing messages).</p>\"\
        },\
        \"OriginationNumber\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The long code to send the SMS message from. This value should be one of the dedicated long codes that's assigned to your AWS account. Although it isn't required, we recommend that you specify the long code using an E.164 format to ensure prompt and accurate delivery of the message. For example, +12065550100.</p>\"\
        },\
        \"SenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The sender ID to display as the sender of the message on a recipient's device. Support for sender IDs varies by country or region. For more information, see <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-countries.html\\\">Supported Countries and Regions</a> in the Amazon Pinpoint User Guide.</p>\"\
        },\
        \"EntityId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The entity ID or Principal Entity (PE) id received from the regulatory body for sending SMS in your country.</p>\"\
        },\
        \"TemplateId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The template ID received from the regulatory body for sending SMS in your country.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the sender ID and message type for an SMS message that's sent to participants in a journey.</p>\"\
    },\
    \"JourneySchedule\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EndTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The scheduled time, in ISO 8601 format, when the journey ended or will end.</p>\"\
        },\
        \"StartTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The scheduled time, in ISO 8601 format, when the journey began or will begin.</p>\"\
        },\
        \"Timezone\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The starting UTC offset for the journey schedule, if the value of the journey's LocalTime property is true. Valid values are: UTC,\\n                  UTC+01, UTC+02, UTC+03, UTC+03:30, UTC+04, UTC+04:30, UTC+05, UTC+05:30,\\n                  UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+08:45, UTC+09, UTC+09:30,\\n                  UTC+10, UTC+10:30, UTC+11, UTC+12, UTC+12:45, UTC+13, UTC+13:45, UTC-02,\\n                  UTC-02:30, UTC-03, UTC-03:30, UTC-04, UTC-05, UTC-06, UTC-07, UTC-08, UTC-09,\\n                  UTC-09:30, UTC-10, and UTC-11.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the schedule settings for a journey.</p>\"\
    },\
    \"JourneyStateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"State\": {\
          \"shape\": \"State\",\
          \"documentation\": \"<p>The status of the journey. Currently, Supported values are ACTIVE, PAUSED, and CANCELLED</p> <p>If you cancel a journey, Amazon Pinpoint continues to perform activities that are currently in progress, until those activities are complete. Amazon Pinpoint also continues to collect and aggregate analytics data for those activities, until they are complete, and any activities that were complete when you cancelled the journey.</p> <p>After you cancel a journey, you can't add, change, or remove any activities from the journey. In addition, Amazon Pinpoint stops evaluating the journey and doesn't perform any activities that haven't started.</p> <p>When the journey is paused, Amazon Pinpoint continues to perform activities that are currently in progress, until those activities are complete. Endpoints will stop entering journeys when the journey is paused and will resume entering the journey after the journey is resumed. For wait activities, wait time is paused when the journey is paused. Currently, PAUSED only supports journeys with a segment refresh interval.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Changes the status of a journey.</p>\"\
    },\
    \"JourneysResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfJourneyResponse\",\
          \"documentation\": \"<p>An array of responses, one for each journey that's associated with the application.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status, configuration, and other settings for all the journeys that are associated with an application.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"Layout\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"BOTTOM_BANNER\",\
        \"TOP_BANNER\",\
        \"OVERLAYS\",\
        \"MOBILE_FEED\",\
        \"MIDDLE_BANNER\",\
        \"CAROUSEL\"\
      ]\
    },\
    \"ListJourneysRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"token\",\
          \"documentation\": \"<p>The NextToken string that specifies which page of results to return in a paginated response.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"ListJourneysResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneysResponse\": {\
          \"shape\": \"JourneysResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneysResponse\"\
      ],\
      \"payload\": \"JourneysResponse\"\
    },\
    \"ListRecommenderConfigurationsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfRecommenderConfigurationResponse\",\
          \"documentation\": \"<p>An array of responses, one for each recommender model configuration that's associated with your Amazon Pinpoint account.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about all the recommender model configurations that are associated with your Amazon Pinpoint account.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"ListTagsForResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resource-arn\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        }\
      },\
      \"required\": [\
        \"ResourceArn\"\
      ]\
    },\
    \"ListTagsForResourceResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TagsModel\": {\
          \"shape\": \"TagsModel\"\
        }\
      },\
      \"required\": [\
        \"TagsModel\"\
      ],\
      \"payload\": \"TagsModel\"\
    },\
    \"ListTemplateVersionsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"next-token\",\
          \"documentation\": \"<p>The  string that specifies which page of results to return in a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-type\",\
          \"documentation\": \"<p>The type of channel that the message template is designed for. Valid values are: EMAIL, PUSH, SMS, and VOICE.</p>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"TemplateType\"\
      ]\
    },\
    \"ListTemplateVersionsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateVersionsResponse\": {\
          \"shape\": \"TemplateVersionsResponse\"\
        }\
      },\
      \"required\": [\
        \"TemplateVersionsResponse\"\
      ],\
      \"payload\": \"TemplateVersionsResponse\"\
    },\
    \"ListTemplatesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"next-token\",\
          \"documentation\": \"<p>The  string that specifies which page of results to return in a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"PageSize\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"page-size\",\
          \"documentation\": \"<p>The maximum number of items to include in each page of a paginated response. This parameter is not supported for application, campaign, and journey metrics.</p>\"\
        },\
        \"Prefix\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"prefix\",\
          \"documentation\": \"<p>The substring to match in the names of the message templates to include in the results. If you specify this value, Amazon Pinpoint returns only those templates whose names begin with the value that you specify.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"template-type\",\
          \"documentation\": \"<p>The type of message template to include in the results. Valid values are: EMAIL, PUSH, SMS, and VOICE. To include all types of templates in the results, don't include this parameter in your request.</p>\"\
        }\
      }\
    },\
    \"ListTemplatesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplatesResponse\": {\
          \"shape\": \"TemplatesResponse\"\
        }\
      },\
      \"required\": [\
        \"TemplatesResponse\"\
      ],\
      \"payload\": \"TemplatesResponse\"\
    },\
    \"Message\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Action\": {\
          \"shape\": \"Action\",\
          \"documentation\": \"<p>The action to occur if a recipient taps the push notification. Valid values are:</p> <ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li> <li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of iOS and Android.</p></li> <li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the notification message. The maximum number of characters is 200.</p>\"\
        },\
        \"ImageIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the image to display as the push-notification icon, such as the icon for the app.</p>\"\
        },\
        \"ImageSmallIconUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the image to display as the small, push-notification icon, such as a small version of the icon for the app.</p>\"\
        },\
        \"ImageUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of an image to display in the push notification.</p>\"\
        },\
        \"JsonBody\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The JSON payload to use for a silent push notification.</p>\"\
        },\
        \"MediaUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the image or video to display in the push notification.</p>\"\
        },\
        \"RawContent\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p>\"\
        },\
        \"SilentPush\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration, displaying messages in an in-app message center, or supporting phone home functionality.</p>\"\
        },\
        \"TimeToLive\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of seconds that the push-notification service should keep the message, if the service is unable to deliver the notification the first time. This value is converted to an expiration value when it's sent to a push-notification service. If this value is 0, the service treats the notification as if it expires immediately and the service doesn't store or try to deliver the notification again.</p> <p>This value doesn't apply to messages that are sent through the Amazon Device Messaging (ADM) service.</p>\"\
        },\
        \"Title\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The title to display above the notification message on a recipient's device.</p>\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL to open in a recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the content and settings for a push notification that's sent to recipients of a campaign.</p>\"\
    },\
    \"MessageBody\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request or response.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an API request or response.</p>\"\
    },\
    \"MessageConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ADMMessage\": {\
          \"shape\": \"Message\",\
          \"documentation\": \"<p>The message that the campaign sends through the ADM (Amazon Device Messaging) channel. If specified, this message overrides the default message.</p>\"\
        },\
        \"APNSMessage\": {\
          \"shape\": \"Message\",\
          \"documentation\": \"<p>The message that the campaign sends through the APNs (Apple Push Notification service) channel. If specified, this message overrides the default message.</p>\"\
        },\
        \"BaiduMessage\": {\
          \"shape\": \"Message\",\
          \"documentation\": \"<p>The message that the campaign sends through the Baidu (Baidu Cloud Push) channel. If specified, this message overrides the default message.</p>\"\
        },\
        \"CustomMessage\": {\
          \"shape\": \"CampaignCustomMessage\",\
          \"documentation\": \"<p>The message that the campaign sends through a custom channel, as specified by the delivery configuration (CustomDeliveryConfiguration) settings for the campaign. If specified, this message overrides the default message.</p> \"\
        },\
        \"DefaultMessage\": {\
          \"shape\": \"Message\",\
          \"documentation\": \"<p>The default message that the campaign sends through all the channels that are configured for the campaign.</p>\"\
        },\
        \"EmailMessage\": {\
          \"shape\": \"CampaignEmailMessage\",\
          \"documentation\": \"<p>The message that the campaign sends through the email channel. If specified, this message overrides the default message.</p>\"\
        },\
        \"GCMMessage\": {\
          \"shape\": \"Message\",\
          \"documentation\": \"<p>The message that the campaign sends through the GCM channel, which enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. If specified, this message overrides the default message.</p>\"\
        },\
        \"SMSMessage\": {\
          \"shape\": \"CampaignSmsMessage\",\
          \"documentation\": \"<p>The message that the campaign sends through the SMS channel. If specified, this message overrides the default message.</p>\"\
        },\
        \"InAppMessage\": {\
          \"shape\": \"CampaignInAppMessage\",\
          \"documentation\": \"<p>The in-app message configuration.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the message configuration settings for a campaign.</p>\"\
    },\
    \"MessageRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Addresses\": {\
          \"shape\": \"MapOfAddressConfiguration\",\
          \"documentation\": \"<p>A map of key-value pairs, where each key is an address and each value is an <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-addressconfiguration\\\">AddressConfiguration</a> object. An address can be a push notification token, a phone number, or an email address. You can use an <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-addressconfiguration\\\">AddressConfiguration</a> object to tailor the message for an address by specifying settings such as content overrides and message variables.</p>\"\
        },\
        \"Context\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A map of custom attributes to attach to the message. For a push notification, this payload is added to the data.pinpoint object. For an email or text message, this payload is added to email/SMS delivery receipt event attributes.</p>\"\
        },\
        \"Endpoints\": {\
          \"shape\": \"MapOfEndpointSendConfiguration\",\
          \"documentation\": \"<p>A map of key-value pairs, where each key is an endpoint ID and each value is an <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration\\\">EndpointSendConfiguration</a> object. You can use an <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration\\\">EndpointSendConfiguration</a> object to tailor the message for an endpoint by specifying settings such as content overrides and message variables.</p>\"\
        },\
        \"MessageConfiguration\": {\
          \"shape\": \"DirectMessageConfiguration\",\
          \"documentation\": \"<p>The settings and content for the default message and any default messages that you defined for specific channels.</p>\"\
        },\
        \"TemplateConfiguration\": {\
          \"shape\": \"TemplateConfiguration\",\
          \"documentation\": \"<p>The message template to use for the message.</p>\"\
        },\
        \"TraceId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for tracing the message. This identifier is visible to message recipients.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the configuration and other settings for a message.</p>\",\
      \"required\": [\
        \"MessageConfiguration\"\
      ]\
    },\
    \"MessageResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that was used to send the message.</p>\"\
        },\
        \"EndpointResult\": {\
          \"shape\": \"MapOfEndpointMessageResult\",\
          \"documentation\": \"<p>A map that contains a multipart response for each address that the message was sent to. In the map, the endpoint ID is the key and the result is the value.</p>\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identifier for the original request that the message was delivered for.</p>\"\
        },\
        \"Result\": {\
          \"shape\": \"MapOfMessageResult\",\
          \"documentation\": \"<p>A map that contains a multipart response for each address (email address, phone number, or push notification token) that the message was sent to. In the map, the address is the key and the result is the value.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the results of a request to send a message to an endpoint address.</p>\",\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"MessageResult\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DeliveryStatus\": {\
          \"shape\": \"DeliveryStatus\",\
          \"documentation\": \"<p>The delivery status of the message. Possible values are:</p> <ul> <li><p>DUPLICATE - The endpoint address is a duplicate of another endpoint address. Amazon Pinpoint won't attempt to send the message again.</p></li>   <li><p>OPT_OUT - The user who's associated with the endpoint address has opted out of receiving messages from you. Amazon Pinpoint won't attempt to send the message again.</p></li> <li><p>PERMANENT_FAILURE - An error occurred when delivering the message to the endpoint address. Amazon Pinpoint won't attempt to send the message again.</p></li>   <li><p>SUCCESSFUL - The message was successfully delivered to the endpoint address.</p></li> <li><p>TEMPORARY_FAILURE - A temporary error occurred. Amazon Pinpoint won't attempt to send the message again.</p></li> <li><p>THROTTLED - Amazon Pinpoint throttled the operation to send the message to the endpoint address.</p></li> <li><p>TIMEOUT - The message couldn't be sent within the timeout period.</p></li> <li><p>UNKNOWN_FAILURE - An unknown error occurred.</p></li></ul>\"\
        },\
        \"MessageId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the message that was sent.</p>\"\
        },\
        \"StatusCode\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The downstream service status code for delivering the message.</p>\"\
        },\
        \"StatusMessage\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The status message for delivering the message.</p>\"\
        },\
        \"UpdatedToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>For push notifications that are sent through the GCM channel, specifies whether the endpoint's device registration token was updated as part of delivering the message.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the results of sending a message directly to an endpoint address.</p>\",\
      \"required\": [\
        \"DeliveryStatus\",\
        \"StatusCode\"\
      ]\
    },\
    \"MessageType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"TRANSACTIONAL\",\
        \"PROMOTIONAL\"\
      ]\
    },\
    \"MethodNotAllowedException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request or response.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an API request or response.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 405\
      }\
    },\
    \"MetricDimension\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ComparisonOperator\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The operator to use when comparing metric values. Valid values are: GREATER_THAN, LESS_THAN, GREATER_THAN_OR_EQUAL, LESS_THAN_OR_EQUAL, and EQUAL.</p>\"\
        },\
        \"Value\": {\
          \"shape\": \"__double\",\
          \"documentation\": \"<p>The value to compare.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies metric-based criteria for including or excluding endpoints from a segment. These criteria derive from custom metrics that you define for endpoints.</p>\",\
      \"required\": [\
        \"ComparisonOperator\",\
        \"Value\"\
      ]\
    },\
    \"Mode\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"DELIVERY\",\
        \"FILTER\"\
      ]\
    },\
    \"MultiConditionalBranch\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Condition\": {\
          \"shape\": \"SimpleCondition\",\
          \"documentation\": \"<p>The condition to evaluate for the activity path.</p>\"\
        },\
        \"NextActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the next activity to perform, after completing the activity for the path.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies a condition to evaluate for an activity path in a journey.</p>\"\
    },\
    \"MultiConditionalSplitActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Branches\": {\
          \"shape\": \"ListOfMultiConditionalBranch\",\
          \"documentation\": \"<p>The paths for the activity, including the conditions for entering each path and the activity to perform for each path.</p>\"\
        },\
        \"DefaultActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the activity to perform for participants who don't meet any of the conditions specified for other paths in the activity.</p>\"\
        },\
        \"EvaluationWaitTime\": {\
          \"shape\": \"WaitTime\",\
          \"documentation\": \"<p>The amount of time to wait or the date and time when Amazon Pinpoint determines whether the conditions are met.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a multivariate split activity in a journey. This type of activity sends participants down one of as many as five paths (including a default <i>Else</i> path) in a journey, based on conditions that you specify.</p> <note><p>To create multivariate split activities that send participants down different paths based on push notification events (such as Open or Received events), your mobile app has to specify the User ID and Endpoint ID values. For more information, see <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/developerguide/integrate.html\\\">Integrating Amazon Pinpoint with your application</a> in the <i>Amazon Pinpoint Developer Guide</i>.</p></note>\"\
    },\
    \"NotFoundException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request or response.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an API request or response.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 404\
      }\
    },\
    \"NumberValidateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"IsoCountryCode\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The two-character code, in ISO 3166-1 alpha-2 format, for the country or region where the phone number was originally registered.</p>\"\
        },\
        \"PhoneNumber\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The phone number to retrieve information about. The phone number that you provide should include a valid numeric country code. Otherwise, the operation might result in an error.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies a phone number to validate and retrieve information about.</p>\"\
    },\
    \"NumberValidateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Carrier\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The carrier or service provider that the phone number is currently registered with. In some countries and regions, this value may be the carrier or service provider that the phone number was originally registered with.</p>\"\
        },\
        \"City\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the city where the phone number was originally registered.</p>\"\
        },\
        \"CleansedPhoneNumberE164\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The cleansed phone number, in E.164 format, for the location where the phone number was originally registered.</p>\"\
        },\
        \"CleansedPhoneNumberNational\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The cleansed phone number, in the format for the location where the phone number was originally registered.</p>\"\
        },\
        \"Country\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the country or region where the phone number was originally registered.</p>\"\
        },\
        \"CountryCodeIso2\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The two-character code, in ISO 3166-1 alpha-2 format, for the country or region where the phone number was originally registered.</p>\"\
        },\
        \"CountryCodeNumeric\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The numeric code for the country or region where the phone number was originally registered.</p>\"\
        },\
        \"County\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the county where the phone number was originally registered.</p>\"\
        },\
        \"OriginalCountryCodeIso2\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The two-character code, in ISO 3166-1 alpha-2 format, that was sent in the request body.</p>\"\
        },\
        \"OriginalPhoneNumber\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The phone number that was sent in the request body.</p>\"\
        },\
        \"PhoneType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the phone type. Valid values are: MOBILE, LANDLINE, VOIP,\\n                  INVALID, PREPAID, and OTHER.</p>\"\
        },\
        \"PhoneTypeCode\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The phone type, represented by an integer. Valid values are: 0 (mobile), 1 (landline), 2 (VoIP), 3 (invalid), 4 (other), and 5 (prepaid).</p>\"\
        },\
        \"Timezone\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The time zone for the location where the phone number was originally registered.</p>\"\
        },\
        \"ZipCode\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The postal or ZIP code for the location where the phone number was originally registered.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about a phone number.</p>\"\
    },\
    \"Operator\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ALL\",\
        \"ANY\"\
      ]\
    },\
    \"OverrideButtonConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ButtonAction\": {\
          \"shape\": \"ButtonAction\",\
          \"documentation\": \"<p>Action triggered by the button.</p>\"\
        },\
        \"Link\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Button destination.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Override button configuration.</p>\",\
      \"required\": [\
        \"ButtonAction\"\
      ]\
    },\
    \"PayloadTooLargeException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request or response.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an API request or response.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 413\
      }\
    },\
    \"PhoneNumberValidateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NumberValidateRequest\": {\
          \"shape\": \"NumberValidateRequest\"\
        }\
      },\
      \"required\": [\
        \"NumberValidateRequest\"\
      ],\
      \"payload\": \"NumberValidateRequest\"\
    },\
    \"PhoneNumberValidateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NumberValidateResponse\": {\
          \"shape\": \"NumberValidateResponse\"\
        }\
      },\
      \"required\": [\
        \"NumberValidateResponse\"\
      ],\
      \"payload\": \"NumberValidateResponse\"\
    },\
    \"PublicEndpoint\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Address\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the recipient, such as a device token, email address, or mobile phone number.</p>\"\
        },\
        \"Attributes\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>One or more custom attributes that describe the endpoint by associating a name with an array of values. You can use these attributes as filter criteria when you create segments.</p>\"\
        },\
        \"ChannelType\": {\
          \"shape\": \"ChannelType\",\
          \"documentation\": \"<p>The channel that's used when sending messages or push notifications to the endpoint.</p>\"\
        },\
        \"Demographic\": {\
          \"shape\": \"EndpointDemographic\",\
          \"documentation\": \"<p>The demographic information for the endpoint, such as the time zone and platform.</p>\"\
        },\
        \"EffectiveDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the endpoint was last updated.</p>\"\
        },\
        \"EndpointStatus\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Specifies whether to send messages or push notifications to the endpoint. Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE, messages arenât sent to the endpoint.</p> <p>Amazon Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint that has the same address specified by the Address property.</p>\"\
        },\
        \"Location\": {\
          \"shape\": \"EndpointLocation\",\
          \"documentation\": \"<p>The geographic information for the endpoint.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOf__double\",\
          \"documentation\": \"<p>One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.</p>\"\
        },\
        \"OptOut\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Specifies whether the user who's associated with the endpoint has opted out of receiving messages and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to receive all messages and push notifications.</p>\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A unique identifier that's generated each time the endpoint is updated.</p>\"\
        },\
        \"User\": {\
          \"shape\": \"EndpointUser\",\
          \"documentation\": \"<p>One or more custom user attributes that your app reports to Amazon Pinpoint for the user who's associated with the endpoint.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the properties and attributes of an endpoint that's associated with an event.</p>\"\
    },\
    \"PushMessageActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageConfig\": {\
          \"shape\": \"JourneyPushMessage\",\
          \"documentation\": \"<p>Specifies the time to live (TTL) value for push notifications that are sent to participants in a journey.</p>\"\
        },\
        \"NextActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the next activity to perform, after the message is sent.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the push notification template to use for the message. If specified, this value must match the name of an existing message template.</p>\"\
        },\
        \"TemplateVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the version of the push notification template to use for the message. If specified, this value must match the identifier for an existing template version. To retrieve a list of versions and version identifiers for a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If you don't specify a value for this property, Amazon Pinpoint uses the <i>active version</i> of the template. The <i>active version</i> is typically the version of a template that's been most recently reviewed and approved for use, depending on your workflow. It isn't necessarily the latest version of a template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a push notification activity in a journey. This type of activity sends a push notification to participants.</p>\"\
    },\
    \"PushNotificationTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ADM\": {\
          \"shape\": \"AndroidPushNotificationTemplate\",\
          \"documentation\": \"<p>The message template to use for the ADM (Amazon Device Messaging) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>\"\
        },\
        \"APNS\": {\
          \"shape\": \"APNSPushNotificationTemplate\",\
          \"documentation\": \"<p>The message template to use for the APNs (Apple Push Notification service) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>\"\
        },\
        \"Baidu\": {\
          \"shape\": \"AndroidPushNotificationTemplate\",\
          \"documentation\": \"<p>The message template to use for the Baidu (Baidu Cloud Push) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>\"\
        },\
        \"Default\": {\
          \"shape\": \"DefaultPushNotificationTemplate\",\
          \"documentation\": \"<p>The default message template to use for push notification channels.</p>\"\
        },\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A JSON object that specifies the default values to use for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable. When you create a message that's based on the template, you can override these defaults with message-specific and address-specific variables and values.</p>\"\
        },\
        \"GCM\": {\
          \"shape\": \"AndroidPushNotificationTemplate\",\
          \"documentation\": \"<p>The message template to use for the GCM channel, which is used to send notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>\"\
        },\
        \"RecommenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the recommender model to use for the message template. Amazon Pinpoint uses this value to determine how to retrieve and process data from a recommender model when it sends messages that use the template, if the template contains message variables for recommendation data.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<note><p>As of <b>22-05-2023</b> tags has been deprecated for update operations. After this date any value in tags is not processed and an error code is not returned. To manage tags we recommend using either <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html\\\">Tags</a> in the <i>API Reference for Amazon Pinpoint</i>, <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html\\\">resourcegroupstaggingapi</a> commands in the <i>AWS Command Line Interface Documentation</i> or <a href=\\\"https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html\\\">resourcegroupstaggingapi</a> in the <i>AWS SDK</i>.</p></note> <p>(Deprecated) A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom description of the message template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the content and settings for a message template that can be used in messages that are sent through a push notification channel.</p>\"\
    },\
    \"PushNotificationTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ADM\": {\
          \"shape\": \"AndroidPushNotificationTemplate\",\
          \"documentation\": \"<p>The message template that's used for the ADM (Amazon Device Messaging) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>\"\
        },\
        \"APNS\": {\
          \"shape\": \"APNSPushNotificationTemplate\",\
          \"documentation\": \"<p>The message template that's used for the APNs (Apple Push Notification service) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>\"\
        },\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the message template.</p>\"\
        },\
        \"Baidu\": {\
          \"shape\": \"AndroidPushNotificationTemplate\",\
          \"documentation\": \"<p>The message template that's used for the Baidu (Baidu Cloud Push) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was created.</p>\"\
        },\
        \"Default\": {\
          \"shape\": \"DefaultPushNotificationTemplate\",\
          \"documentation\": \"<p>The default message template that's used for push notification channels.</p>\"\
        },\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The JSON object that specifies the default values that are used for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>\"\
        },\
        \"GCM\": {\
          \"shape\": \"AndroidPushNotificationTemplate\",\
          \"documentation\": \"<p>The message template that's used for the GCM channel, which is used to send notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was last modified.</p>\"\
        },\
        \"RecommenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the recommender model that's used by the message template.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that identifies the tags that are associated with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the message template.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the message template.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"TemplateType\",\
          \"documentation\": \"<p>The type of channel that the message template is designed for. For a push notification template, this value is PUSH.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier, as an integer, for the active version of the message template, or the version of the template that you specified by using the version parameter in your request.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the content and settings for a message template that can be used in messages that are sent through a push notification channel.</p>\",\
      \"required\": [\
        \"LastModifiedDate\",\
        \"CreationDate\",\
        \"TemplateType\",\
        \"TemplateName\"\
      ]\
    },\
    \"PutEventStreamRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"WriteEventStream\": {\
          \"shape\": \"WriteEventStream\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"WriteEventStream\"\
      ],\
      \"payload\": \"WriteEventStream\"\
    },\
    \"PutEventStreamResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EventStream\": {\
          \"shape\": \"EventStream\"\
        }\
      },\
      \"required\": [\
        \"EventStream\"\
      ],\
      \"payload\": \"EventStream\"\
    },\
    \"PutEventsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"EventsRequest\": {\
          \"shape\": \"EventsRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"EventsRequest\"\
      ],\
      \"payload\": \"EventsRequest\"\
    },\
    \"PutEventsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EventsResponse\": {\
          \"shape\": \"EventsResponse\"\
        }\
      },\
      \"required\": [\
        \"EventsResponse\"\
      ],\
      \"payload\": \"EventsResponse\"\
    },\
    \"QuietTime\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"End\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The specific time when quiet time ends. This value has to use 24-hour notation and be in HH:MM format, where HH is the hour (with a leading zero, if applicable) and MM is the minutes. For example, use 02:30 to represent 2:30 AM, or 14:30 to represent 2:30 PM.</p>\"\
        },\
        \"Start\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The specific time when quiet time begins. This value has to use 24-hour notation and be in HH:MM format, where HH is the hour (with a leading zero, if applicable) and MM is the minutes. For example, use 02:30 to represent 2:30 AM, or 14:30 to represent 2:30 PM.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the start and end times that define a time range when messages aren't sent to endpoints.</p>\"\
    },\
    \"RandomSplitActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Branches\": {\
          \"shape\": \"ListOfRandomSplitEntry\",\
          \"documentation\": \"<p>The paths for the activity, including the percentage of participants to enter each path and the activity to perform for each path.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a random split activity in a journey. This type of activity randomly sends specified percentages of participants down one of as many as five paths in a journey, based on conditions that you specify.</p>\"\
    },\
    \"RandomSplitEntry\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the next activity to perform, after completing the activity for the path.</p>\"\
        },\
        \"Percentage\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The percentage of participants to send down the activity path.</p> <p>To determine which participants are sent down each path, Amazon Pinpoint applies a probability-based algorithm to the percentages that you specify for the paths. Therefore, the actual percentage of participants who are sent down a path may not be equal to the percentage that you specify.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a path in a random split activity in a journey.</p>\"\
    },\
    \"RawEmail\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Data\": {\
          \"shape\": \"__blob\",\
          \"documentation\": \"<p>The email message, represented as a raw MIME message. The entire message must be base64 encoded.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the contents of an email message, represented as a raw MIME message.</p>\"\
    },\
    \"__blob\": {\
      \"type\": \"blob\"\
    },\
    \"RecencyDimension\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Duration\": {\
          \"shape\": \"Duration\",\
          \"documentation\": \"<p>The duration to use when determining whether an endpoint is active or inactive.</p>\"\
        },\
        \"RecencyType\": {\
          \"shape\": \"RecencyType\",\
          \"documentation\": \"<p>The type of recency dimension to use for the segment. Valid values are: ACTIVE, endpoints that were active within the specified duration are included in the segment; and, INACTIVE, endpoints that weren't active within the specified duration are included in the segment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies criteria for including or excluding endpoints from a segment based on how recently an endpoint was active.</p>\",\
      \"required\": [\
        \"Duration\",\
        \"RecencyType\"\
      ]\
    },\
    \"RecencyType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ACTIVE\",\
        \"INACTIVE\"\
      ]\
    },\
    \"RecommenderConfigurationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Attributes\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A map that defines 1-10 custom endpoint or user attributes, depending on the value for the RecommendationProviderIdType property. Each of these attributes temporarily stores a recommended item that's retrieved from the recommender model and sent to an AWS Lambda function for additional processing. Each attribute can be used as a message variable in a message template.</p> <p>This value is null if the configuration doesn't invoke an AWS Lambda function (RecommendationTransformerUri) to perform additional processing of recommendation data.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in extended ISO 8601 format, when the configuration was created for the recommender model.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the configuration for the recommender model.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the recommender model configuration.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in extended ISO 8601 format, when the configuration for the recommender model was last modified.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom name of the configuration for the recommender model.</p>\"\
        },\
        \"RecommendationProviderIdType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of Amazon Pinpoint ID that's associated with unique user IDs in the recommender model. This value enables the model to use attribute and event data thatâs specific to a particular endpoint or user in an Amazon Pinpoint application. Possible values are:</p> <ul><li><p>PINPOINT_ENDPOINT_ID - Each user in the model is associated with a particular endpoint in Amazon Pinpoint. The data is correlated based on endpoint IDs in Amazon Pinpoint. This is the default value.</p></li> <li><p>PINPOINT_USER_ID - Each user in the model is associated with a particular user and endpoint in Amazon Pinpoint. The data is correlated based on user IDs in Amazon Pinpoint. If this value is specified, an endpoint definition in Amazon Pinpoint has to specify both a user ID (UserId) and an endpoint ID. Otherwise, messages wonât be sent to the user's endpoint.</p></li></ul>\"\
        },\
        \"RecommendationProviderRoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data from the recommender model.</p>\"\
        },\
        \"RecommendationProviderUri\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the recommender model that Amazon Pinpoint retrieves the recommendation data from. This value is the ARN of an Amazon Personalize campaign.</p>\"\
        },\
        \"RecommendationTransformerUri\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name or Amazon Resource Name (ARN) of the AWS Lambda function that Amazon Pinpoint invokes to perform additional processing of recommendation data that it retrieves from the recommender model.</p>\"\
        },\
        \"RecommendationsDisplayName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom display name for the standard endpoint or user attribute (RecommendationItems) that temporarily stores recommended items for each endpoint or user, depending on the value for the RecommendationProviderIdType property. This name appears in the <b>Attribute finder</b> of the template editor on the Amazon Pinpoint console.</p> <p>This value is null if the configuration doesn't invoke an AWS Lambda function (RecommendationTransformerUri) to perform additional processing of recommendation data.</p>\"\
        },\
        \"RecommendationsPerMessage\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of recommended items that are retrieved from the model for each endpoint or user, depending on the value for the RecommendationProviderIdType property. This number determines how many recommended items are available for use in message variables.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about Amazon Pinpoint configuration settings for retrieving and processing data from a recommender model.</p>\",\
      \"required\": [\
        \"RecommendationProviderUri\",\
        \"LastModifiedDate\",\
        \"CreationDate\",\
        \"RecommendationProviderRoleArn\",\
        \"Id\"\
      ]\
    },\
    \"RemoveAttributesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"AttributeType\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"attribute-type\",\
          \"documentation\": \" <p>The type of attribute or attributes to remove. Valid values are:</p> <ul><li><p>endpoint-custom-attributes - Custom attributes that describe endpoints, such as the date when an associated user opted in or out of receiving communications from you through a specific type of channel.</p></li> <li><p>endpoint-metric-attributes - Custom metrics that your app reports to Amazon Pinpoint for endpoints, such as the number of app sessions or the number of items left in a cart.</p></li> <li><p>endpoint-user-attributes - Custom attributes that describe users, such as first name, last name, and age.</p></li></ul>\"\
        },\
        \"UpdateAttributesRequest\": {\
          \"shape\": \"UpdateAttributesRequest\"\
        }\
      },\
      \"required\": [\
        \"AttributeType\",\
        \"ApplicationId\",\
        \"UpdateAttributesRequest\"\
      ],\
      \"payload\": \"UpdateAttributesRequest\"\
    },\
    \"RemoveAttributesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AttributesResource\": {\
          \"shape\": \"AttributesResource\"\
        }\
      },\
      \"required\": [\
        \"AttributesResource\"\
      ],\
      \"payload\": \"AttributesResource\"\
    },\
    \"ResultRow\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"GroupedBys\": {\
          \"shape\": \"ListOfResultRowValue\",\
          \"documentation\": \"<p>An array of objects that defines the field and field values that were used to group data in a result set that contains multiple results. This value is null if the data in a result set isnât grouped.</p>\"\
        },\
        \"Values\": {\
          \"shape\": \"ListOfResultRowValue\",\
          \"documentation\": \"<p>An array of objects that provides pre-aggregated values for a standard metric that applies to an application, campaign, or journey.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides the results of a query that retrieved the data for a standard metric that applies to an application, campaign, or journey.</p>\",\
      \"required\": [\
        \"GroupedBys\",\
        \"Values\"\
      ]\
    },\
    \"ResultRowValue\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Key\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The friendly name of the metric whose value is specified by the Value property.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The data type of the value specified by the Value property.</p>\"\
        },\
        \"Value\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>In a Values object, the value for the metric that the query retrieved data for. In a GroupedBys object, the value for the field that was used to group data in a result set that contains multiple results (Values objects).</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides a single value and metadata about that value as part of an array of query results for a standard metric that applies to an application, campaign, or journey.</p>\",\
      \"required\": [\
        \"Type\",\
        \"Value\",\
        \"Key\"\
      ]\
    },\
    \"SMSChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable the SMS channel for the application.</p>\"\
        },\
        \"SenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identity that you want to display on recipients' devices when they receive messages from the SMS channel.</p>\"\
        },\
        \"ShortCode\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The registered short code that you want to use when you send messages through the SMS channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the SMS channel for an application.</p>\"\
    },\
    \"SMSChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the SMS channel applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the SMS channel was enabled.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the SMS channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the SMS channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the SMS channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the SMS channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the SMS channel was last modified.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of messaging or notification platform for the channel. For the SMS channel, this value is SMS.</p>\"\
        },\
        \"PromotionalMessagesPerSecond\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum number of promotional messages that you can send through the SMS channel each second.</p>\"\
        },\
        \"SenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The identity that displays on recipients' devices when they receive messages from the SMS channel.</p>\"\
        },\
        \"ShortCode\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The registered short code to use when you send messages through the SMS channel.</p>\"\
        },\
        \"TransactionalMessagesPerSecond\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The maximum number of transactional messages that you can send through the SMS channel each second.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the SMS channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the SMS channel for an application.</p>\",\
      \"required\": [\
        \"Platform\"\
      ]\
    },\
    \"SMSMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The body of the SMS message.</p>\"\
        },\
        \"Keyword\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The SMS program name that you provided to AWS Support when you requested your dedicated number.</p>\"\
        },\
        \"MediaUrl\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>This field is reserved for future use.</p>\"\
        },\
        \"MessageType\": {\
          \"shape\": \"MessageType\",\
          \"documentation\": \"<p>The SMS message type. Valid values are TRANSACTIONAL (for messages that are critical or time-sensitive, such as a one-time passwords) and PROMOTIONAL (for messsages that aren't critical or time-sensitive, such as marketing messages).</p>\"\
        },\
        \"OriginationNumber\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The number to send the SMS message from. This value should be one of the dedicated long or short codes that's assigned to your AWS account. If you don't specify a long or short code, Amazon Pinpoint assigns a random long code to the SMS message and sends the message from that code.</p>\"\
        },\
        \"SenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The sender ID to display as the sender of the message on a recipient's device. Support for sender IDs varies by country or region.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>The message variables to use in the SMS message. You can override the default variables with individual address variables.</p>\"\
        },\
        \"EntityId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The entity ID or Principal Entity (PE) id received from the regulatory body for sending SMS in your country.</p>\"\
        },\
        \"TemplateId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The template ID received from the regulatory body for sending SMS in your country.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the default settings for a one-time SMS message that's sent directly to an endpoint.</p>\"\
    },\
    \"SMSMessageActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageConfig\": {\
          \"shape\": \"JourneySMSMessage\",\
          \"documentation\": \"<p>Specifies the sender ID and message type for an SMS message that's sent to participants in a journey.</p>\"\
        },\
        \"NextActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the next activity to perform, after the message is sent.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the SMS message template to use for the message. If specified, this value must match the name of an existing message template.</p>\"\
        },\
        \"TemplateVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the version of the SMS template to use for the message. If specified, this value must match the identifier for an existing template version. To retrieve a list of versions and version identifiers for a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If you don't specify a value for this property, Amazon Pinpoint uses the <i>active version</i> of the template. The <i>active version</i> is typically the version of a template that's been most recently reviewed and approved for use, depending on your workflow. It isn't necessarily the latest version of a template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for an SMS activity in a journey. This type of activity sends a text message to participants.</p>\"\
    },\
    \"SMSTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body to use in text messages that are based on the message template.</p>\"\
        },\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A JSON object that specifies the default values to use for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable. When you create a message that's based on the template, you can override these defaults with message-specific and address-specific variables and values.</p>\"\
        },\
        \"RecommenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the recommender model to use for the message template. Amazon Pinpoint uses this value to determine how to retrieve and process data from a recommender model when it sends messages that use the template, if the template contains message variables for recommendation data.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<note><p>As of <b>22-05-2023</b> tags has been deprecated for update operations. After this date any value in tags is not processed and an error code is not returned. To manage tags we recommend using either <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html\\\">Tags</a> in the <i>API Reference for Amazon Pinpoint</i>, <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html\\\">resourcegroupstaggingapi</a> commands in the <i>AWS Command Line Interface Documentation</i> or <a href=\\\"https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html\\\">resourcegroupstaggingapi</a> in the <i>AWS SDK</i>.</p></note> <p>(Deprecated) A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom description of the message template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the content and settings for a message template that can be used in text messages that are sent through the SMS channel.</p>\"\
    },\
    \"SMSTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the message template.</p>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message body that's used in text messages that are based on the message template.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was created.</p>\"\
        },\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The JSON object that specifies the default values that are used for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was last modified.</p>\"\
        },\
        \"RecommenderId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the recommender model that's used by the message template.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that identifies the tags that are associated with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the message template.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the message template.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"TemplateType\",\
          \"documentation\": \"<p>The type of channel that the message template is designed for. For an SMS template, this value is SMS.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier, as an integer, for the active version of the message template, or the version of the template that you specified by using the version parameter in your request.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the content and settings for a message template that can be used in text messages that are sent through the SMS channel.</p>\",\
      \"required\": [\
        \"LastModifiedDate\",\
        \"CreationDate\",\
        \"TemplateName\",\
        \"TemplateType\"\
      ]\
    },\
    \"Schedule\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EndTime\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The scheduled time, in ISO 8601 format, when the campaign ended or will end.</p>\"\
        },\
        \"EventFilter\": {\
          \"shape\": \"CampaignEventFilter\",\
          \"documentation\": \"<p>The type of event that causes the campaign to be sent, if the value of the Frequency property is EVENT.</p>\"\
        },\
        \"Frequency\": {\
          \"shape\": \"Frequency\",\
          \"documentation\": \"<p>Specifies how often the campaign is sent or whether the campaign is sent in response to a specific event.</p>\"\
        },\
        \"IsLocalTime\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the start and end times for the campaign schedule use each recipient's local time. To base the schedule on each recipient's local time, set this value to true.</p>\"\
        },\
        \"QuietTime\": {\
          \"shape\": \"QuietTime\",\
          \"documentation\": \"<p>The default quiet time for the campaign. Quiet time is a specific time range when a campaign doesn't send messages to endpoints, if all the following conditions are met:</p> <ul><li><p>The EndpointDemographic.Timezone property of the endpoint is set to a valid value.</p></li> <li><p>The current time in the endpoint's time zone is later than or equal to the time specified by the QuietTime.Start property for the campaign.</p></li> <li><p>The current time in the endpoint's time zone is earlier than or equal to the time specified by the QuietTime.End property for the campaign.</p></li></ul> <p>If any of the preceding conditions isn't met, the endpoint will receive messages from the campaign, even if quiet time is enabled.</p>\"\
        },\
        \"StartTime\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The scheduled time when the campaign began or will begin. Valid values are: IMMEDIATE, to start the campaign immediately; or, a specific time in ISO 8601 format.</p>\"\
        },\
        \"Timezone\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The starting UTC offset for the campaign schedule, if the value of the IsLocalTime property is true. Valid values are: UTC, UTC+01, UTC+02, UTC+03, UTC+03:30, UTC+04, UTC+04:30, UTC+05,\\n                  UTC+05:30, UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+09, UTC+09:30,\\n                  UTC+10, UTC+10:30, UTC+11, UTC+12, UTC+13, UTC-02, UTC-03, UTC-04, UTC-05, UTC-06,\\n                  UTC-07, UTC-08, UTC-09, UTC-10, and UTC-11.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the schedule settings for a campaign.</p>\",\
      \"required\": [\
        \"StartTime\"\
      ]\
    },\
    \"SegmentBehaviors\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Recency\": {\
          \"shape\": \"RecencyDimension\",\
          \"documentation\": \"<p>The dimension settings that are based on how recently an endpoint was active.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies dimension settings for including or excluding endpoints from a segment based on how recently an endpoint was active.</p>\"\
    },\
    \"SegmentCondition\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the segment to associate with the activity.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies a segment to associate with an activity in a journey.</p>\",\
      \"required\": [\
        \"SegmentId\"\
      ]\
    },\
    \"SegmentDemographics\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AppVersion\": {\
          \"shape\": \"SetDimension\",\
          \"documentation\": \"<p>The app version criteria for the segment.</p>\"\
        },\
        \"Channel\": {\
          \"shape\": \"SetDimension\",\
          \"documentation\": \"<p>The channel criteria for the segment.</p>\"\
        },\
        \"DeviceType\": {\
          \"shape\": \"SetDimension\",\
          \"documentation\": \"<p>The device type criteria for the segment.</p>\"\
        },\
        \"Make\": {\
          \"shape\": \"SetDimension\",\
          \"documentation\": \"<p>The device make criteria for the segment.</p>\"\
        },\
        \"Model\": {\
          \"shape\": \"SetDimension\",\
          \"documentation\": \"<p>The device model criteria for the segment.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"SetDimension\",\
          \"documentation\": \"<p>The device platform criteria for the segment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies demographic-based dimension settings for including or excluding endpoints from a segment. These settings derive from characteristics of endpoint devices, such as platform, make, and model.</p>\"\
    },\
    \"SegmentDimensions\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Attributes\": {\
          \"shape\": \"MapOfAttributeDimension\",\
          \"documentation\": \"<p>One or more custom attributes to use as criteria for the segment.</p>\"\
        },\
        \"Behavior\": {\
          \"shape\": \"SegmentBehaviors\",\
          \"documentation\": \"<p>The behavior-based criteria, such as how recently users have used your app, for the segment.</p>\"\
        },\
        \"Demographic\": {\
          \"shape\": \"SegmentDemographics\",\
          \"documentation\": \"<p>The demographic-based criteria, such as device platform, for the segment.</p>\"\
        },\
        \"Location\": {\
          \"shape\": \"SegmentLocation\",\
          \"documentation\": \"<p>The location-based criteria, such as region or GPS coordinates, for the segment.</p>\"\
        },\
        \"Metrics\": {\
          \"shape\": \"MapOfMetricDimension\",\
          \"documentation\": \"<p>One or more custom metrics to use as criteria for the segment.</p>\"\
        },\
        \"UserAttributes\": {\
          \"shape\": \"MapOfAttributeDimension\",\
          \"documentation\": \"<p>One or more custom user attributes to use as criteria for the segment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the dimension settings for a segment.</p>\"\
    },\
    \"SegmentGroup\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Dimensions\": {\
          \"shape\": \"ListOfSegmentDimensions\",\
          \"documentation\": \"<p>An array that defines the dimensions for the segment.</p>\"\
        },\
        \"SourceSegments\": {\
          \"shape\": \"ListOfSegmentReference\",\
          \"documentation\": \"<p>The base segment to build the segment on. A base segment, also referred to as a <i>source segment</i>, defines the initial population of endpoints for a segment. When you add dimensions to a segment, Amazon Pinpoint filters the base segment by using the dimensions that you specify.</p> <p>You can specify more than one dimensional segment or only one imported segment. If you specify an imported segment, the Amazon Pinpoint console displays a segment size estimate that indicates the size of the imported segment without any filters applied to it.</p>\"\
        },\
        \"SourceType\": {\
          \"shape\": \"SourceType\",\
          \"documentation\": \"<p>Specifies how to handle multiple base segments for the segment. For example, if you specify three base segments for the segment, whether the resulting segment is based on all, any, or none of the base segments.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"Type\",\
          \"documentation\": \"<p>Specifies how to handle multiple dimensions for the segment. For example, if you specify three dimensions for the segment, whether the resulting segment includes endpoints that match all, any, or none of the dimensions.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the base segments and dimensions for a segment, and the relationships between these base segments and dimensions.</p>\"\
    },\
    \"SegmentGroupList\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Groups\": {\
          \"shape\": \"ListOfSegmentGroup\",\
          \"documentation\": \"<p>An array that defines the set of segment criteria to evaluate when handling segment groups for the segment.</p>\"\
        },\
        \"Include\": {\
          \"shape\": \"Include\",\
          \"documentation\": \"<p>Specifies how to handle multiple segment groups for the segment. For example, if the segment includes three segment groups, whether the resulting segment includes endpoints that match all, any, or none of the segment groups.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings that define the relationships between segment groups for a segment.</p>\"\
    },\
    \"SegmentImportResource\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelCounts\": {\
          \"shape\": \"MapOf__integer\",\
          \"documentation\": \"<p>The number of channel types in the endpoint definitions that were imported to create the segment.</p>\"\
        },\
        \"ExternalId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy. Amazon Pinpoint previously used this value to assume an IAM role when importing endpoint definitions, but we removed this requirement. We don't recommend use of external IDs for IAM roles that are assumed by Amazon Pinpoint.</p>\"\
        },\
        \"Format\": {\
          \"shape\": \"Format\",\
          \"documentation\": \"<p>The format of the files that were imported to create the segment. Valid values are: CSV, for comma-separated values format; and, JSON, for newline-delimited JSON format.</p>\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorized Amazon Pinpoint to access the Amazon S3 location to import endpoint definitions from.</p>\"\
        },\
        \"S3Url\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The URL of the Amazon Simple Storage Service (Amazon S3) bucket that the endpoint definitions were imported from to create the segment.</p>\"\
        },\
        \"Size\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of endpoint definitions that were imported successfully to create the segment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the import job that created a segment. An import job is a job that creates a user segment by importing endpoint definitions.</p>\",\
      \"required\": [\
        \"Format\",\
        \"S3Url\",\
        \"Size\",\
        \"ExternalId\",\
        \"RoleArn\"\
      ]\
    },\
    \"SegmentLocation\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Country\": {\
          \"shape\": \"SetDimension\",\
          \"documentation\": \"<p>The country or region code, in ISO 3166-1 alpha-2 format, for the segment.</p>\"\
        },\
        \"GPSPoint\": {\
          \"shape\": \"GPSPointDimension\",\
          \"documentation\": \"<p>The GPS location and range for the segment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies geographical dimension settings for a segment.</p>\"\
    },\
    \"SegmentReference\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the segment.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The version number of the segment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the segment identifier and version of a segment.</p>\",\
      \"required\": [\
        \"Id\"\
      ]\
    },\
    \"SegmentResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the segment is associated with.</p>\"\
        },\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the segment.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the segment was created.</p>\"\
        },\
        \"Dimensions\": {\
          \"shape\": \"SegmentDimensions\",\
          \"documentation\": \"<p>The dimension settings for the segment.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the segment.</p>\"\
        },\
        \"ImportDefinition\": {\
          \"shape\": \"SegmentImportResource\",\
          \"documentation\": \"<p>The settings for the import job that's associated with the segment.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the segment was last modified.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the segment.</p>\"\
        },\
        \"SegmentGroups\": {\
          \"shape\": \"SegmentGroupList\",\
          \"documentation\": \"<p>A list of one or more segment groups that apply to the segment. Each segment group consists of zero or more base segments and the dimensions that are applied to those base segments.</p>\"\
        },\
        \"SegmentType\": {\
          \"shape\": \"SegmentType\",\
          \"documentation\": \"<p>The segment type. Valid values are:</p> <ul><li><p>DIMENSIONAL - A dynamic segment, which is a segment that uses selection criteria that you specify and is based on endpoint data that's reported by your app. Dynamic segments can change over time.</p></li> <li><p>IMPORT - A static segment, which is a segment that uses selection criteria that you specify and is based on endpoint definitions that you import from a file. Imported segments are static; they don't change over time.</p></li></ul>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that identifies the tags that are associated with the segment. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The version number of the segment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the configuration, dimension, and other settings for a segment.</p>\",\
      \"required\": [\
        \"SegmentType\",\
        \"CreationDate\",\
        \"Id\",\
        \"Arn\",\
        \"ApplicationId\"\
      ]\
    },\
    \"SegmentType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"DIMENSIONAL\",\
        \"IMPORT\"\
      ]\
    },\
    \"SegmentsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfSegmentResponse\",\
          \"documentation\": \"<p>An array of responses, one for each segment that's associated with the application (Segments resource) or each version of a segment that's associated with the application (Segment Versions resource).</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about all the segments that are associated with an application.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"SendMessagesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"MessageRequest\": {\
          \"shape\": \"MessageRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"MessageRequest\"\
      ],\
      \"payload\": \"MessageRequest\"\
    },\
    \"SendMessagesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageResponse\": {\
          \"shape\": \"MessageResponse\"\
        }\
      },\
      \"required\": [\
        \"MessageResponse\"\
      ],\
      \"payload\": \"MessageResponse\"\
    },\
    \"SendOTPMessageRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique ID of your Amazon Pinpoint application.</p>\"\
        },\
        \"SendOTPMessageRequestParameters\": {\
          \"shape\": \"SendOTPMessageRequestParameters\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"SendOTPMessageRequestParameters\"\
      ],\
      \"payload\": \"SendOTPMessageRequestParameters\"\
    },\
    \"SendOTPMessageRequestParameters\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AllowedAttempts\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The attempts allowed to validate an OTP.</p>\"\
        },\
        \"BrandName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The brand name that will be substituted into the OTP message body. Should be owned by calling AWS account.</p>\"\
        },\
        \"Channel\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Channel type for the OTP message. Supported values: [SMS].</p>\"\
        },\
        \"CodeLength\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of characters in the generated OTP.</p>\"\
        },\
        \"DestinationIdentity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The destination identity to send OTP to.</p>\"\
        },\
        \"EntityId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A unique Entity ID received from DLT after entity registration is approved.</p>\"\
        },\
        \"Language\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The language to be used for the outgoing message body containing the OTP.</p>\"\
        },\
        \"OriginationIdentity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The origination identity used to send OTP from.</p>\"\
        },\
        \"ReferenceId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>Developer-specified reference identifier. Required to match during OTP verification.</p>\"\
        },\
        \"TemplateId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A unique Template ID received from DLT after entity registration is approved.</p>\"\
        },\
        \"ValidityPeriod\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The time in minutes before the OTP is no longer valid.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Send OTP message request parameters.</p>\",\
      \"required\": [\
        \"BrandName\",\
        \"ReferenceId\",\
        \"Channel\",\
        \"DestinationIdentity\",\
        \"OriginationIdentity\"\
      ]\
    },\
    \"SendOTPMessageResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageResponse\": {\
          \"shape\": \"MessageResponse\"\
        }\
      },\
      \"required\": [\
        \"MessageResponse\"\
      ],\
      \"payload\": \"MessageResponse\"\
    },\
    \"SendUsersMessageRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Context\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A map of custom attribute-value pairs. For a push notification, Amazon Pinpoint adds these attributes to the data.pinpoint object in the body of the notification payload. Amazon Pinpoint also provides these attributes in the events that it generates for users-messages deliveries.</p>\"\
        },\
        \"MessageConfiguration\": {\
          \"shape\": \"DirectMessageConfiguration\",\
          \"documentation\": \"<p>The settings and content for the default message and any default messages that you defined for specific channels.</p>\"\
        },\
        \"TemplateConfiguration\": {\
          \"shape\": \"TemplateConfiguration\",\
          \"documentation\": \"<p>The message template to use for the message.</p>\"\
        },\
        \"TraceId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for tracing the message. This identifier is visible to message recipients.</p>\"\
        },\
        \"Users\": {\
          \"shape\": \"MapOfEndpointSendConfiguration\",\
          \"documentation\": \"<p>A map that associates user IDs with <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration\\\">EndpointSendConfiguration</a> objects. You can use an <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration\\\">EndpointSendConfiguration</a> object to tailor the message for a user by specifying settings such as content overrides and message variables.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the configuration and other settings for a message to send to all the endpoints that are associated with a list of users.</p>\",\
      \"required\": [\
        \"MessageConfiguration\",\
        \"Users\"\
      ]\
    },\
    \"SendUsersMessageResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that was used to send the message.</p>\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier that was assigned to the message request.</p>\"\
        },\
        \"Result\": {\
          \"shape\": \"MapOfMapOfEndpointMessageResult\",\
          \"documentation\": \"<p>An object that indicates which endpoints the message was sent to, for each user. The object lists user IDs and, for each user ID, provides the endpoint IDs that the message was sent to. For each endpoint ID, it provides an EndpointMessageResult object.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about which users and endpoints a message was sent to.</p>\",\
      \"required\": [\
        \"ApplicationId\"\
      ]\
    },\
    \"SendUsersMessagesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"SendUsersMessageRequest\": {\
          \"shape\": \"SendUsersMessageRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"SendUsersMessageRequest\"\
      ],\
      \"payload\": \"SendUsersMessageRequest\"\
    },\
    \"SendUsersMessagesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SendUsersMessageResponse\": {\
          \"shape\": \"SendUsersMessageResponse\"\
        }\
      },\
      \"required\": [\
        \"SendUsersMessageResponse\"\
      ],\
      \"payload\": \"SendUsersMessageResponse\"\
    },\
    \"Session\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Duration\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The duration of the session, in milliseconds.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the session.</p>\"\
        },\
        \"StartTimestamp\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the session began.</p>\"\
        },\
        \"StopTimestamp\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time when the session ended.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about a session.</p>\",\
      \"required\": [\
        \"StartTimestamp\",\
        \"Id\"\
      ]\
    },\
    \"SetDimension\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DimensionType\": {\
          \"shape\": \"DimensionType\",\
          \"documentation\": \"<p>The type of segment dimension to use. Valid values are: INCLUSIVE, endpoints that match the criteria are included in the segment; and, EXCLUSIVE, endpoints that match the criteria are excluded from the segment.</p>\"\
        },\
        \"Values\": {\
          \"shape\": \"ListOf__string\",\
          \"documentation\": \"<p>The criteria values to use for the segment dimension. Depending on the value of the DimensionType property, endpoints are included or excluded from the segment if their values match the criteria values.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the dimension type and values for a segment dimension.</p>\",\
      \"required\": [\
        \"Values\"\
      ]\
    },\
    \"SimpleCondition\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EventCondition\": {\
          \"shape\": \"EventCondition\",\
          \"documentation\": \"<p>The dimension settings for the event that's associated with the activity.</p>\"\
        },\
        \"SegmentCondition\": {\
          \"shape\": \"SegmentCondition\",\
          \"documentation\": \"<p>The segment that's associated with the activity.</p>\"\
        },\
        \"SegmentDimensions\": {\
          \"shape\": \"SegmentDimensions\",\
          \"locationName\": \"segmentDimensions\",\
          \"documentation\": \"<p>The dimension settings for the segment that's associated with the activity.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies a condition to evaluate for an activity in a journey.</p>\"\
    },\
    \"SimpleEmail\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"HtmlPart\": {\
          \"shape\": \"SimpleEmailPart\",\
          \"documentation\": \"<p>The body of the email message, in HTML format. We recommend using HTML format for email clients that render HTML content. You can include links, formatted text, and more in an HTML message.</p>\"\
        },\
        \"Subject\": {\
          \"shape\": \"SimpleEmailPart\",\
          \"documentation\": \"<p>The subject line, or title, of the email.</p>\"\
        },\
        \"TextPart\": {\
          \"shape\": \"SimpleEmailPart\",\
          \"documentation\": \"<p>The body of the email message, in plain text format. We recommend using plain text format for email clients that don't render HTML content and clients that are connected to high-latency networks, such as mobile devices.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the contents of an email message, composed of a subject, a text part, and an HTML part.</p>\"\
    },\
    \"SimpleEmailPart\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Charset\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The applicable character set for the message content.</p>\"\
        },\
        \"Data\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The textual data of the message content.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the subject or body of an email message, represented as textual email data and the applicable character set.</p>\"\
    },\
    \"SourceType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ALL\",\
        \"ANY\",\
        \"NONE\"\
      ]\
    },\
    \"StartCondition\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the condition.</p>\"\
        },\
        \"EventStartCondition\": {\
          \"shape\": \"EventStartCondition\"\
        },\
        \"SegmentStartCondition\": {\
          \"shape\": \"SegmentCondition\",\
          \"documentation\": \"<p>The segment that's associated with the first activity in the journey. This segment determines which users are participants in the journey.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the conditions for the first activity in a journey. This activity and its conditions determine which users are participants in a journey.</p>\"\
    },\
    \"State\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"DRAFT\",\
        \"ACTIVE\",\
        \"COMPLETED\",\
        \"CANCELLED\",\
        \"CLOSED\",\
        \"PAUSED\"\
      ]\
    },\
    \"TagResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resource-arn\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"TagsModel\": {\
          \"shape\": \"TagsModel\"\
        }\
      },\
      \"required\": [\
        \"ResourceArn\",\
        \"TagsModel\"\
      ],\
      \"payload\": \"TagsModel\"\
    },\
    \"TagsModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that defines the tags for an application, campaign, message template, or segment. Each of these resources can have a maximum of 50 tags.</p> <p>Each tag consists of a required tag key and an associated tag value. The maximum length of a tag key is 128 characters. The maximum length of a tag value is 256 characters.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the tags (keys and values) for an application, campaign, message template, or segment.</p>\",\
      \"required\": [\
        \"tags\"\
      ]\
    },\
    \"Template\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the message template to use for the message. If specified, this value must match the name of an existing message template.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to use for the message. If specified, this value must match the identifier for an existing template version. To retrieve a list of versions and version identifiers for a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If you don't specify a value for this property, Amazon Pinpoint uses the <i>active version</i> of the template. The <i>active version</i> is typically the version of a template that's been most recently reviewed and approved for use, depending on your workflow. It isn't necessarily the latest version of a template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the name and version of the message template to use for the message.</p>\"\
    },\
    \"TemplateActiveVersionRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version of the message template to use as the active version of the template. Valid values are: latest, for the most recent version of the template; or, the unique identifier for any existing version of the template. If you specify an identifier, the value must match the identifier for an existing template version. To retrieve a list of versions and version identifiers for a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies which version of a message template to use as the active version of the template.</p>\"\
    },\
    \"TemplateConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EmailTemplate\": {\
          \"shape\": \"Template\",\
          \"documentation\": \"<p>The email template to use for the message.</p>\"\
        },\
        \"PushTemplate\": {\
          \"shape\": \"Template\",\
          \"documentation\": \"<p>The push notification template to use for the message.</p>\"\
        },\
        \"SMSTemplate\": {\
          \"shape\": \"Template\",\
          \"documentation\": \"<p>The SMS template to use for the message.</p>\"\
        },\
        \"VoiceTemplate\": {\
          \"shape\": \"Template\",\
          \"documentation\": \"<p>The voice template to use for the message. This object isn't supported for campaigns.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the message template to use for the message, for each type of channel.</p>\"\
    },\
    \"TemplateCreateMessageBody\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the message template that was created.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API for the request to create the message template.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request to create the message template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about a request to create a message template.</p>\"\
    },\
    \"TemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the message template. This value isn't included in a TemplateResponse object. To retrieve the ARN of a template, use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template that you want to retrieve the ARN for.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was created.</p>\"\
        },\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The JSON object that specifies the default values that are used for message variables in the message template. This object isn't included in a TemplateResponse object. To retrieve this object for a template, use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template that you want to retrieve the object for.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was last modified.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A map of key-value pairs that identifies the tags that are associated with the message template. This object isn't included in a TemplateResponse object. To retrieve this object for a template, use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template that you want to retrieve the object for.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the message template. This value isn't included in a TemplateResponse object. To retrieve the description of a template, use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template that you want to retrieve the description for.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the message template.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"TemplateType\",\
          \"documentation\": \"<p>The type of channel that the message template is designed for. Possible values are: EMAIL, PUSH, SMS, and VOICE.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier, as an integer, for the active version of the message template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about a message template that's associated with your Amazon Pinpoint account.</p>\",\
      \"required\": [\
        \"LastModifiedDate\",\
        \"CreationDate\",\
        \"TemplateName\",\
        \"TemplateType\"\
      ]\
    },\
    \"TemplateType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"EMAIL\",\
        \"SMS\",\
        \"VOICE\",\
        \"PUSH\",\
        \"INAPP\"\
      ]\
    },\
    \"TemplateVersionResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the version of the message template was created.</p>\"\
        },\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A JSON object that specifies the default values that are used for message variables in the version of the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the version of the message template was last modified.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the version of the message template.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the message template.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of channel that the message template is designed for. Possible values are: EMAIL, PUSH, SMS, and VOICE.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template. This value is an integer that Amazon Pinpoint automatically increments and assigns to each new version of a template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about a specific version of a message template.</p>\",\
      \"required\": [\
        \"LastModifiedDate\",\
        \"CreationDate\",\
        \"TemplateName\",\
        \"TemplateType\"\
      ]\
    },\
    \"TemplateVersionsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfTemplateVersionResponse\",\
          \"documentation\": \"<p>An array of responses, one for each version of the message template.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API for the request to retrieve information about all the versions of the message template.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request to retrieve information about all the versions of the message template.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about all the versions of a specific message template.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"TemplatesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Item\": {\
          \"shape\": \"ListOfTemplateResponse\",\
          \"documentation\": \"<p>An array of responses, one for each message template that's associated with your Amazon Pinpoint account and meets any filter criteria that you specified in the request.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about all the message templates that are associated with your Amazon Pinpoint account.</p>\",\
      \"required\": [\
        \"Item\"\
      ]\
    },\
    \"TooManyRequestsException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message that's returned from the API.</p>\"\
        },\
        \"RequestID\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the request or response.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about an API request or response.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 429\
      }\
    },\
    \"TreatmentResource\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CustomDeliveryConfiguration\": {\
          \"shape\": \"CustomDeliveryConfiguration\",\
          \"documentation\": \"<p>The delivery configuration settings for sending the treatment through a custom channel. This object is required if the MessageConfiguration object for the treatment specifies a CustomMessage object.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the treatment.</p>\"\
        },\
        \"MessageConfiguration\": {\
          \"shape\": \"MessageConfiguration\",\
          \"documentation\": \"<p>The message configuration settings for the treatment.</p>\"\
        },\
        \"Schedule\": {\
          \"shape\": \"Schedule\",\
          \"documentation\": \"<p>The schedule settings for the treatment.</p>\"\
        },\
        \"SizePercent\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The allocated percentage of users (segment members) that the treatment is sent to.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"CampaignState\",\
          \"documentation\": \"<p>The current status of the treatment.</p>\"\
        },\
        \"TemplateConfiguration\": {\
          \"shape\": \"TemplateConfiguration\",\
          \"documentation\": \"<p>The message template to use for the treatment.</p>\"\
        },\
        \"TreatmentDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the treatment.</p>\"\
        },\
        \"TreatmentName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom name of the treatment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a campaign treatment. A <i>treatment</i> is a variation of a campaign that's used for A/B testing of a campaign.</p>\",\
      \"required\": [\
        \"Id\",\
        \"SizePercent\"\
      ]\
    },\
    \"Type\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ALL\",\
        \"ANY\",\
        \"NONE\"\
      ]\
    },\
    \"UntagResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resource-arn\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"TagKeys\": {\
          \"shape\": \"ListOf__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"tagKeys\",\
          \"documentation\": \"<p>The key of the tag to remove from the resource. To remove multiple tags, append the tagKeys parameter and argument for each additional tag to remove, separated by an ampersand (&amp;).</p>\"\
        }\
      },\
      \"required\": [\
        \"TagKeys\",\
        \"ResourceArn\"\
      ]\
    },\
    \"UpdateAdmChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ADMChannelRequest\": {\
          \"shape\": \"ADMChannelRequest\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"ADMChannelRequest\"\
      ],\
      \"payload\": \"ADMChannelRequest\"\
    },\
    \"UpdateAdmChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ADMChannelResponse\": {\
          \"shape\": \"ADMChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"ADMChannelResponse\"\
      ],\
      \"payload\": \"ADMChannelResponse\"\
    },\
    \"UpdateApnsChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSChannelRequest\": {\
          \"shape\": \"APNSChannelRequest\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"APNSChannelRequest\"\
      ],\
      \"payload\": \"APNSChannelRequest\"\
    },\
    \"UpdateApnsChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSChannelResponse\": {\
          \"shape\": \"APNSChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSChannelResponse\"\
      ],\
      \"payload\": \"APNSChannelResponse\"\
    },\
    \"UpdateApnsSandboxChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSSandboxChannelRequest\": {\
          \"shape\": \"APNSSandboxChannelRequest\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"APNSSandboxChannelRequest\"\
      ],\
      \"payload\": \"APNSSandboxChannelRequest\"\
    },\
    \"UpdateApnsSandboxChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSSandboxChannelResponse\": {\
          \"shape\": \"APNSSandboxChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSSandboxChannelResponse\"\
      ],\
      \"payload\": \"APNSSandboxChannelResponse\"\
    },\
    \"UpdateApnsVoipChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSVoipChannelRequest\": {\
          \"shape\": \"APNSVoipChannelRequest\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"APNSVoipChannelRequest\"\
      ],\
      \"payload\": \"APNSVoipChannelRequest\"\
    },\
    \"UpdateApnsVoipChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSVoipChannelResponse\": {\
          \"shape\": \"APNSVoipChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSVoipChannelResponse\"\
      ],\
      \"payload\": \"APNSVoipChannelResponse\"\
    },\
    \"UpdateApnsVoipSandboxChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSVoipSandboxChannelRequest\": {\
          \"shape\": \"APNSVoipSandboxChannelRequest\"\
        },\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"APNSVoipSandboxChannelRequest\"\
      ],\
      \"payload\": \"APNSVoipSandboxChannelRequest\"\
    },\
    \"UpdateApnsVoipSandboxChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"APNSVoipSandboxChannelResponse\": {\
          \"shape\": \"APNSVoipSandboxChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"APNSVoipSandboxChannelResponse\"\
      ],\
      \"payload\": \"APNSVoipSandboxChannelResponse\"\
    },\
    \"UpdateApplicationSettingsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"WriteApplicationSettingsRequest\": {\
          \"shape\": \"WriteApplicationSettingsRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"WriteApplicationSettingsRequest\"\
      ],\
      \"payload\": \"WriteApplicationSettingsRequest\"\
    },\
    \"UpdateApplicationSettingsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationSettingsResource\": {\
          \"shape\": \"ApplicationSettingsResource\"\
        }\
      },\
      \"required\": [\
        \"ApplicationSettingsResource\"\
      ],\
      \"payload\": \"ApplicationSettingsResource\"\
    },\
    \"UpdateAttributesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Blacklist\": {\
          \"shape\": \"ListOf__string\",\
          \"documentation\": \"<p>An array of the attributes to remove from all the endpoints that are associated with the application. The array can specify the complete, exact name of each attribute to remove or it can specify a glob pattern that an attribute name must match in order for the attribute to be removed.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies one or more attributes to remove from all the endpoints that are associated with an application.</p>\"\
    },\
    \"UpdateBaiduChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"BaiduChannelRequest\": {\
          \"shape\": \"BaiduChannelRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"BaiduChannelRequest\"\
      ],\
      \"payload\": \"BaiduChannelRequest\"\
    },\
    \"UpdateBaiduChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BaiduChannelResponse\": {\
          \"shape\": \"BaiduChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"BaiduChannelResponse\"\
      ],\
      \"payload\": \"BaiduChannelResponse\"\
    },\
    \"UpdateCampaignRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"CampaignId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"campaign-id\",\
          \"documentation\": \"<p>The unique identifier for the campaign.</p>\"\
        },\
        \"WriteCampaignRequest\": {\
          \"shape\": \"WriteCampaignRequest\"\
        }\
      },\
      \"required\": [\
        \"CampaignId\",\
        \"ApplicationId\",\
        \"WriteCampaignRequest\"\
      ],\
      \"payload\": \"WriteCampaignRequest\"\
    },\
    \"UpdateCampaignResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignResponse\": {\
          \"shape\": \"CampaignResponse\"\
        }\
      },\
      \"required\": [\
        \"CampaignResponse\"\
      ],\
      \"payload\": \"CampaignResponse\"\
    },\
    \"UpdateEmailChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"EmailChannelRequest\": {\
          \"shape\": \"EmailChannelRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"EmailChannelRequest\"\
      ],\
      \"payload\": \"EmailChannelRequest\"\
    },\
    \"UpdateEmailChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EmailChannelResponse\": {\
          \"shape\": \"EmailChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"EmailChannelResponse\"\
      ],\
      \"payload\": \"EmailChannelResponse\"\
    },\
    \"UpdateEmailTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateNewVersion\": {\
          \"shape\": \"__boolean\",\
          \"location\": \"querystring\",\
          \"locationName\": \"create-new-version\",\
          \"documentation\": \"<p>Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.</p>\"\
        },\
        \"EmailTemplateRequest\": {\
          \"shape\": \"EmailTemplateRequest\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"EmailTemplateRequest\"\
      ],\
      \"payload\": \"EmailTemplateRequest\"\
    },\
    \"UpdateEmailTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"UpdateEndpointRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"EndpointId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"endpoint-id\",\
          \"documentation\": \"<p>The unique identifier for the endpoint.</p>\"\
        },\
        \"EndpointRequest\": {\
          \"shape\": \"EndpointRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"EndpointId\",\
        \"EndpointRequest\"\
      ],\
      \"payload\": \"EndpointRequest\"\
    },\
    \"UpdateEndpointResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"UpdateEndpointsBatchRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"EndpointBatchRequest\": {\
          \"shape\": \"EndpointBatchRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"EndpointBatchRequest\"\
      ],\
      \"payload\": \"EndpointBatchRequest\"\
    },\
    \"UpdateEndpointsBatchResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"UpdateGcmChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"GCMChannelRequest\": {\
          \"shape\": \"GCMChannelRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"GCMChannelRequest\"\
      ],\
      \"payload\": \"GCMChannelRequest\"\
    },\
    \"UpdateGcmChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"GCMChannelResponse\": {\
          \"shape\": \"GCMChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"GCMChannelResponse\"\
      ],\
      \"payload\": \"GCMChannelResponse\"\
    },\
    \"UpdateInAppTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateNewVersion\": {\
          \"shape\": \"__boolean\",\
          \"location\": \"querystring\",\
          \"locationName\": \"create-new-version\",\
          \"documentation\": \"<p>Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.</p>\"\
        },\
        \"InAppTemplateRequest\": {\
          \"shape\": \"InAppTemplateRequest\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"InAppTemplateRequest\"\
      ],\
      \"payload\": \"InAppTemplateRequest\"\
    },\
    \"UpdateInAppTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"UpdateJourneyRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        },\
        \"WriteJourneyRequest\": {\
          \"shape\": \"WriteJourneyRequest\"\
        }\
      },\
      \"required\": [\
        \"JourneyId\",\
        \"ApplicationId\",\
        \"WriteJourneyRequest\"\
      ],\
      \"payload\": \"WriteJourneyRequest\"\
    },\
    \"UpdateJourneyResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyResponse\": {\
          \"shape\": \"JourneyResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyResponse\"\
      ],\
      \"payload\": \"JourneyResponse\"\
    },\
    \"UpdateJourneyStateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"JourneyId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"journey-id\",\
          \"documentation\": \"<p>The unique identifier for the journey.</p>\"\
        },\
        \"JourneyStateRequest\": {\
          \"shape\": \"JourneyStateRequest\"\
        }\
      },\
      \"required\": [\
        \"JourneyId\",\
        \"ApplicationId\",\
        \"JourneyStateRequest\"\
      ],\
      \"payload\": \"JourneyStateRequest\"\
    },\
    \"UpdateJourneyStateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"JourneyResponse\": {\
          \"shape\": \"JourneyResponse\"\
        }\
      },\
      \"required\": [\
        \"JourneyResponse\"\
      ],\
      \"payload\": \"JourneyResponse\"\
    },\
    \"UpdatePushTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateNewVersion\": {\
          \"shape\": \"__boolean\",\
          \"location\": \"querystring\",\
          \"locationName\": \"create-new-version\",\
          \"documentation\": \"<p>Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.</p>\"\
        },\
        \"PushNotificationTemplateRequest\": {\
          \"shape\": \"PushNotificationTemplateRequest\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"PushNotificationTemplateRequest\"\
      ],\
      \"payload\": \"PushNotificationTemplateRequest\"\
    },\
    \"UpdatePushTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"UpdateRecommenderConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Attributes\": {\
          \"shape\": \"MapOf__string\",\
          \"documentation\": \"<p>A map of key-value pairs that defines 1-10 custom endpoint or user attributes, depending on the value for the RecommendationProviderIdType property. Each of these attributes temporarily stores a recommended item that's retrieved from the recommender model and sent to an AWS Lambda function for additional processing. Each attribute can be used as a message variable in a message template.</p> <p>In the map, the key is the name of a custom attribute and the value is a custom display name for that attribute. The display name appears in the <b>Attribute finder</b> of the template editor on the Amazon Pinpoint console. The following restrictions apply to these names:</p> <ul><li><p>An attribute name must start with a letter or number and it can contain up to 50 characters. The characters can be letters, numbers, underscores (_), or hyphens (-). Attribute names are case sensitive and must be unique.</p></li> <li><p>An attribute display name must start with a letter or number and it can contain up to 25 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-).</p></li></ul> <p>This object is required if the configuration invokes an AWS Lambda function (RecommendationTransformerUri) to process recommendation data. Otherwise, don't include this object in your request.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom description of the configuration for the recommender model. The description can contain up to 128 characters. The characters can be letters, numbers, spaces, or the following symbols: _ ; () , â.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom name of the configuration for the recommender model. The name must start with a letter or number and it can contain up to 128 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-).</p>\"\
        },\
        \"RecommendationProviderIdType\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of Amazon Pinpoint ID to associate with unique user IDs in the recommender model. This value enables the model to use attribute and event data thatâs specific to a particular endpoint or user in an Amazon Pinpoint application. Valid values are:</p> <ul><li><p>PINPOINT_ENDPOINT_ID - Associate each user in the model with a particular endpoint in Amazon Pinpoint. The data is correlated based on endpoint IDs in Amazon Pinpoint. This is the default value.</p></li> <li><p>PINPOINT_USER_ID - Associate each user in the model with a particular user and endpoint in Amazon Pinpoint. The data is correlated based on user IDs in Amazon Pinpoint. If you specify this value, an endpoint definition in Amazon Pinpoint has to specify both a user ID (UserId) and an endpoint ID. Otherwise, messages wonât be sent to the user's endpoint.</p></li></ul>\"\
        },\
        \"RecommendationProviderRoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data from the recommender model.</p>\"\
        },\
        \"RecommendationProviderUri\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the recommender model to retrieve recommendation data from. This value must match the ARN of an Amazon Personalize campaign.</p>\"\
        },\
        \"RecommendationTransformerUri\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke for additional processing of recommendation data that's retrieved from the recommender model.</p>\"\
        },\
        \"RecommendationsDisplayName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom display name for the standard endpoint or user attribute (RecommendationItems) that temporarily stores recommended items for each endpoint or user, depending on the value for the RecommendationProviderIdType property. This value is required if the configuration doesn't invoke an AWS Lambda function (RecommendationTransformerUri) to perform additional processing of recommendation data.</p> <p>This name appears in the <b>Attribute finder</b> of the template editor on the Amazon Pinpoint console. The name can contain up to 25 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-). These restrictions don't apply to attribute values.</p>\"\
        },\
        \"RecommendationsPerMessage\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The number of recommended items to retrieve from the model for each endpoint or user, depending on the value for the RecommendationProviderIdType property. This number determines how many recommended items are available for use in message variables. The minimum value is 1. The maximum value is 5. The default value is 5.</p> <p>To use multiple recommended items and custom attributes with message variables, you have to use an AWS Lambda function (RecommendationTransformerUri) to perform additional processing of recommendation data.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies Amazon Pinpoint configuration settings for retrieving and processing recommendation data from a recommender model.</p>\",\
      \"required\": [\
        \"RecommendationProviderUri\",\
        \"RecommendationProviderRoleArn\"\
      ]\
    },\
    \"UpdateRecommenderConfigurationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RecommenderId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"recommender-id\",\
          \"documentation\": \"<p>The unique identifier for the recommender model configuration. This identifier is displayed as the <b>Recommender ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"UpdateRecommenderConfiguration\": {\
          \"shape\": \"UpdateRecommenderConfiguration\"\
        }\
      },\
      \"required\": [\
        \"RecommenderId\",\
        \"UpdateRecommenderConfiguration\"\
      ],\
      \"payload\": \"UpdateRecommenderConfiguration\"\
    },\
    \"UpdateRecommenderConfigurationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RecommenderConfigurationResponse\": {\
          \"shape\": \"RecommenderConfigurationResponse\"\
        }\
      },\
      \"required\": [\
        \"RecommenderConfigurationResponse\"\
      ],\
      \"payload\": \"RecommenderConfigurationResponse\"\
    },\
    \"UpdateSegmentRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"segment-id\",\
          \"documentation\": \"<p>The unique identifier for the segment.</p>\"\
        },\
        \"WriteSegmentRequest\": {\
          \"shape\": \"WriteSegmentRequest\"\
        }\
      },\
      \"required\": [\
        \"SegmentId\",\
        \"ApplicationId\",\
        \"WriteSegmentRequest\"\
      ],\
      \"payload\": \"WriteSegmentRequest\"\
    },\
    \"UpdateSegmentResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SegmentResponse\": {\
          \"shape\": \"SegmentResponse\"\
        }\
      },\
      \"required\": [\
        \"SegmentResponse\"\
      ],\
      \"payload\": \"SegmentResponse\"\
    },\
    \"UpdateSmsChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"SMSChannelRequest\": {\
          \"shape\": \"SMSChannelRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"SMSChannelRequest\"\
      ],\
      \"payload\": \"SMSChannelRequest\"\
    },\
    \"UpdateSmsChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SMSChannelResponse\": {\
          \"shape\": \"SMSChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"SMSChannelResponse\"\
      ],\
      \"payload\": \"SMSChannelResponse\"\
    },\
    \"UpdateSmsTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateNewVersion\": {\
          \"shape\": \"__boolean\",\
          \"location\": \"querystring\",\
          \"locationName\": \"create-new-version\",\
          \"documentation\": \"<p>Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.</p>\"\
        },\
        \"SMSTemplateRequest\": {\
          \"shape\": \"SMSTemplateRequest\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"SMSTemplateRequest\"\
      ],\
      \"payload\": \"SMSTemplateRequest\"\
    },\
    \"UpdateSmsTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"UpdateTemplateActiveVersionRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemplateActiveVersionRequest\": {\
          \"shape\": \"TemplateActiveVersionRequest\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-type\",\
          \"documentation\": \"<p>The type of channel that the message template is designed for. Valid values are: EMAIL, PUSH, SMS, and VOICE.</p>\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"TemplateType\",\
        \"TemplateActiveVersionRequest\"\
      ],\
      \"payload\": \"TemplateActiveVersionRequest\"\
    },\
    \"UpdateTemplateActiveVersionResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"UpdateVoiceChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>\"\
        },\
        \"VoiceChannelRequest\": {\
          \"shape\": \"VoiceChannelRequest\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"VoiceChannelRequest\"\
      ],\
      \"payload\": \"VoiceChannelRequest\"\
    },\
    \"UpdateVoiceChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"VoiceChannelResponse\": {\
          \"shape\": \"VoiceChannelResponse\"\
        }\
      },\
      \"required\": [\
        \"VoiceChannelResponse\"\
      ],\
      \"payload\": \"VoiceChannelResponse\"\
    },\
    \"UpdateVoiceTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreateNewVersion\": {\
          \"shape\": \"__boolean\",\
          \"location\": \"querystring\",\
          \"locationName\": \"create-new-version\",\
          \"documentation\": \"<p>Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"template-name\",\
          \"documentation\": \"<p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"version\",\
          \"documentation\": \"<p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <link  linkend=\\\"templates-template-name-template-type-versions\\\">Template Versions</link> resource.</p> <p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p> <p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p> <ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li> <li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li> <li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>\"\
        },\
        \"VoiceTemplateRequest\": {\
          \"shape\": \"VoiceTemplateRequest\"\
        }\
      },\
      \"required\": [\
        \"TemplateName\",\
        \"VoiceTemplateRequest\"\
      ],\
      \"payload\": \"VoiceTemplateRequest\"\
    },\
    \"UpdateVoiceTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MessageBody\": {\
          \"shape\": \"MessageBody\"\
        }\
      },\
      \"required\": [\
        \"MessageBody\"\
      ],\
      \"payload\": \"MessageBody\"\
    },\
    \"VerificationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Valid\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the OTP is valid or not.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Verify OTP Message Response.</p>\"\
    },\
    \"VerifyOTPMessageRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"application-id\",\
          \"documentation\": \"<p>The unique ID of your Amazon Pinpoint application.</p>\"\
        },\
        \"VerifyOTPMessageRequestParameters\": {\
          \"shape\": \"VerifyOTPMessageRequestParameters\"\
        }\
      },\
      \"required\": [\
        \"ApplicationId\",\
        \"VerifyOTPMessageRequestParameters\"\
      ],\
      \"payload\": \"VerifyOTPMessageRequestParameters\"\
    },\
    \"VerifyOTPMessageRequestParameters\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DestinationIdentity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The destination identity to send OTP to.</p>\"\
        },\
        \"Otp\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The OTP the end user provided for verification.</p>\"\
        },\
        \"ReferenceId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The reference identifier provided when the OTP was previously sent.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Verify OTP message request.</p>\",\
      \"required\": [\
        \"ReferenceId\",\
        \"Otp\",\
        \"DestinationIdentity\"\
      ]\
    },\
    \"VerifyOTPMessageResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"VerificationResponse\": {\
          \"shape\": \"VerificationResponse\"\
        }\
      },\
      \"required\": [\
        \"VerificationResponse\"\
      ],\
      \"payload\": \"VerificationResponse\"\
    },\
    \"VoiceChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable the voice channel for the application.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the status and settings of the voice channel for an application.</p>\"\
    },\
    \"VoiceChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ApplicationId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the application that the voice channel applies to.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the voice channel was enabled.</p>\"\
        },\
        \"Enabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the voice channel is enabled for the application.</p>\"\
        },\
        \"HasCredential\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>(Not used) This property is retained only for backward compatibility.</p>\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>(Deprecated) An identifier for the voice channel. This property is retained only for backward compatibility.</p>\"\
        },\
        \"IsArchived\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the voice channel is archived.</p>\"\
        },\
        \"LastModifiedBy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The user who last modified the voice channel.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when the voice channel was last modified.</p>\"\
        },\
        \"Platform\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of messaging or notification platform for the channel. For the voice channel, this value is VOICE.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The current version of the voice channel.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the status and settings of the voice channel for an application.</p>\",\
      \"required\": [\
        \"Platform\"\
      ]\
    },\
    \"VoiceMessage\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The text of the script to use for the voice message.</p>\"\
        },\
        \"LanguageCode\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The code for the language to use when synthesizing the text of the message script. For a list of supported languages and the code for each one, see the <a href=\\\"https://docs.aws.amazon.com/polly/latest/dg/what-is.html\\\">Amazon Polly Developer Guide</a>.</p>\"\
        },\
        \"OriginationNumber\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The long code to send the voice message from. This value should be one of the dedicated long codes that's assigned to your AWS account. Although it isn't required, we recommend that you specify the long code in E.164 format, for example +12065550100, to ensure prompt and accurate delivery of the message.</p>\"\
        },\
        \"Substitutions\": {\
          \"shape\": \"MapOfListOf__string\",\
          \"documentation\": \"<p>The default message variables to use in the voice message. You can override the default variables with individual address variables.</p>\"\
        },\
        \"VoiceId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the voice to use when delivering the message. For a list of supported voices, see the <a href=\\\"https://docs.aws.amazon.com/polly/latest/dg/what-is.html\\\">Amazon Polly Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a one-time voice message that's sent directly to an endpoint through the voice channel.</p>\"\
    },\
    \"VoiceTemplateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The text of the script to use in messages that are based on the message template, in plain text format.</p>\"\
        },\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A JSON object that specifies the default values to use for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable. When you create a message that's based on the template, you can override these defaults with message-specific and address-specific variables and values.</p>\"\
        },\
        \"LanguageCode\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The code for the language to use when synthesizing the text of the script in messages that are based on the message template. For a list of supported languages and the code for each one, see the <a href=\\\"https://docs.aws.amazon.com/polly/latest/dg/what-is.html\\\">Amazon Polly Developer Guide</a>.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<note><p>As of <b>22-05-2023</b> tags has been deprecated for update operations. After this date any value in tags is not processed and an error code is not returned. To manage tags we recommend using either <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html\\\">Tags</a> in the <i>API Reference for Amazon Pinpoint</i>, <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html\\\">resourcegroupstaggingapi</a> commands in the <i>AWS Command Line Interface Documentation</i> or <a href=\\\"https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html\\\">resourcegroupstaggingapi</a> in the <i>AWS SDK</i>.</p></note> <p>(Deprecated) A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom description of the message template.</p>\"\
        },\
        \"VoiceId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the voice to use when delivering messages that are based on the message template. For a list of supported voices, see the <a href=\\\"https://docs.aws.amazon.com/polly/latest/dg/what-is.html\\\">Amazon Polly Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the content and settings for a message template that can be used in messages that are sent through the voice channel.</p>\"\
    },\
    \"VoiceTemplateResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the message template.</p>\"\
        },\
        \"Body\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The text of the script that's used in messages that are based on the message template, in plain text format.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was created.</p>\"\
        },\
        \"DefaultSubstitutions\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The JSON object that specifies the default values that are used for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>\"\
        },\
        \"LanguageCode\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The code for the language that's used when synthesizing the text of the script in messages that are based on the message template. For a list of supported languages and the code for each one, see the <a href=\\\"https://docs.aws.amazon.com/polly/latest/dg/what-is.html\\\">Amazon Polly Developer Guide</a>.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the message template was last modified.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>A string-to-string map of key-value pairs that identifies the tags that are associated with the message template. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The custom description of the message template.</p>\"\
        },\
        \"TemplateName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the message template.</p>\"\
        },\
        \"TemplateType\": {\
          \"shape\": \"TemplateType\",\
          \"documentation\": \"<p>The type of channel that the message template is designed for. For a voice template, this value is VOICE.</p>\"\
        },\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier, as an integer, for the active version of the message template, or the version of the template that you specified by using the version parameter in your request.</p>\"\
        },\
        \"VoiceId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the voice that's used when delivering messages that are based on the message template. For a list of supported voices, see the <a href=\\\"https://docs.aws.amazon.com/polly/latest/dg/what-is.html\\\">Amazon Polly Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Provides information about the content and settings for a message template that can be used in messages that are sent through the voice channel.</p>\",\
      \"required\": [\
        \"LastModifiedDate\",\
        \"CreationDate\",\
        \"TemplateName\",\
        \"TemplateType\"\
      ]\
    },\
    \"WaitActivity\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the next activity to perform, after performing the wait activity.</p>\"\
        },\
        \"WaitTime\": {\
          \"shape\": \"WaitTime\",\
          \"documentation\": \"<p>The amount of time to wait or the date and time when the activity moves participants to the next activity in the journey.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a wait activity in a journey. This type of activity waits for a certain amount of time or until a specific date and time before moving participants to the next activity in a journey.</p>\"\
    },\
    \"WaitTime\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"WaitFor\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The amount of time to wait, as a duration in ISO 8601 format, before determining whether the activity's conditions have been met or moving participants to the next activity in the journey.</p>\"\
        },\
        \"WaitUntil\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date and time, in ISO 8601 format, when Amazon Pinpoint determines whether the activity's conditions have been met or the activity moves participants to the next activity in the journey.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies a duration or a date and time that indicates when Amazon Pinpoint determines whether an activity's conditions have been met or an activity moves participants to the next activity in a journey.</p>\"\
    },\
    \"WriteApplicationSettingsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CampaignHook\": {\
          \"shape\": \"CampaignHook\",\
          \"documentation\": \"<p>The settings for the AWS Lambda function to invoke by default as a code hook for campaigns in the application. You can use this hook to customize segments that are used by campaigns in the application.</p> <p>To override these settings and define custom settings for a specific campaign, use the CampaignHook object of the <link  linkend=\\\"apps-application-id-campaigns-campaign-id\\\">Campaign</link> resource.</p>\"\
        },\
        \"CloudWatchMetricsEnabled\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to enable application-related alarms in Amazon CloudWatch.</p>\"\
        },\
        \"EventTaggingEnabled\": {\
          \"shape\": \"__boolean\"\
        },\
        \"Limits\": {\
          \"shape\": \"CampaignLimits\",\
          \"documentation\": \"<p>The default sending limits for campaigns in the application. To override these limits and define custom limits for a specific campaign or journey, use the <link  linkend=\\\"apps-application-id-campaigns-campaign-id\\\">Campaign</link> resource or the <link  linkend=\\\"apps-application-id-journeys-journey-id\\\">Journey</link> resource, respectively.</p>\"\
        },\
        \"QuietTime\": {\
          \"shape\": \"QuietTime\",\
          \"documentation\": \"<p>The default quiet time for campaigns in the application. Quiet time is a specific time range when messages aren't sent to endpoints, if all the following conditions are met:</p> <ul><li><p>The EndpointDemographic.Timezone property of the endpoint is set to a valid value.</p></li> <li><p>The current time in the endpoint's time zone is later than or equal to the time specified by the QuietTime.Start property for the application (or a campaign or journey that has custom quiet time settings).</p></li> <li><p>The current time in the endpoint's time zone is earlier than or equal to the time specified by the QuietTime.End property for the application (or a campaign or journey that has custom quiet time settings).</p></li></ul> <p>If any of the preceding conditions isn't met, the endpoint will receive messages from a campaign or journey, even if quiet time is enabled.</p> <p>To override the default quiet time settings for a specific campaign or journey, use the <link  linkend=\\\"apps-application-id-campaigns-campaign-id\\\">Campaign</link> resource or the <link  linkend=\\\"apps-application-id-journeys-journey-id\\\">Journey</link> resource to define a custom quiet time for the campaign or journey.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the default settings for an application.</p>\"\
    },\
    \"WriteCampaignRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AdditionalTreatments\": {\
          \"shape\": \"ListOfWriteTreatmentResource\",\
          \"documentation\": \"<p>An array of requests that defines additional treatments for the campaign, in addition to the default treatment for the campaign.</p>\"\
        },\
        \"CustomDeliveryConfiguration\": {\
          \"shape\": \"CustomDeliveryConfiguration\",\
          \"documentation\": \"<p>The delivery configuration settings for sending the campaign through a custom channel. This object is required if the MessageConfiguration object for the campaign specifies a CustomMessage object.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom description of the campaign.</p>\"\
        },\
        \"HoldoutPercent\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The allocated percentage of users (segment members) who shouldn't receive messages from the campaign.</p>\"\
        },\
        \"Hook\": {\
          \"shape\": \"CampaignHook\",\
          \"documentation\": \"<p>The settings for the AWS Lambda function to invoke as a code hook for the campaign. You can use this hook to customize the segment that's used by the campaign.</p>\"\
        },\
        \"IsPaused\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether to pause the campaign. A paused campaign doesn't run unless you resume it by changing this value to false.</p>\"\
        },\
        \"Limits\": {\
          \"shape\": \"CampaignLimits\",\
          \"documentation\": \"<p>The messaging limits for the campaign.</p>\"\
        },\
        \"MessageConfiguration\": {\
          \"shape\": \"MessageConfiguration\",\
          \"documentation\": \"<p>The message configuration settings for the campaign.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom name for the campaign.</p>\"\
        },\
        \"Schedule\": {\
          \"shape\": \"Schedule\",\
          \"documentation\": \"<p>The schedule settings for the campaign.</p>\"\
        },\
        \"SegmentId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the segment to associate with the campaign.</p>\"\
        },\
        \"SegmentVersion\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The version of the segment to associate with the campaign.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<note><p>As of <b>22-05-2023</b> tags has been deprecated for update operations. After this date any value in tags is not processed and an error code is not returned. To manage tags we recommend using either <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html\\\">Tags</a> in the <i>API Reference for Amazon Pinpoint</i>, <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html\\\">resourcegroupstaggingapi</a> commands in the <i>AWS Command Line Interface Documentation</i> or <a href=\\\"https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html\\\">resourcegroupstaggingapi</a> in the <i>AWS SDK</i>.</p></note> <p>(Deprecated) A string-to-string map of key-value pairs that defines the tags to associate with the campaign. Each tag consists of a required tag key and an associated tag value.</p>\"\
        },\
        \"TemplateConfiguration\": {\
          \"shape\": \"TemplateConfiguration\",\
          \"documentation\": \"<p>The message template to use for the campaign.</p>\"\
        },\
        \"TreatmentDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom description of the default treatment for the campaign.</p>\"\
        },\
        \"TreatmentName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom name of the default treatment for the campaign, if the campaign has multiple treatments. A <i>treatment</i> is a variation of a campaign that's used for A/B testing.</p>\"\
        },\
        \"Priority\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>Defines the priority of the campaign, used to decide the order of messages displayed to user if there are multiple messages scheduled to be displayed at the same moment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the configuration and other settings for a campaign.</p>\"\
    },\
    \"WriteEventStream\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DestinationStreamArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon Kinesis Data Firehose delivery stream that you want to publish event data to.</p> <p>For a Kinesis data stream, the ARN format is: arn:aws:kinesis:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:stream/<replaceable>stream_name</replaceable>\\n               </p> <p>For a Kinesis Data Firehose delivery stream, the ARN format is: arn:aws:firehose:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:deliverystream/<replaceable>stream_name</replaceable>\\n               </p>\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to publish event data to the stream in your AWS account.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the Amazon Resource Name (ARN) of an event stream to publish events to and the AWS Identity and Access Management (IAM) role to use when publishing those events.</p>\",\
      \"required\": [\
        \"RoleArn\",\
        \"DestinationStreamArn\"\
      ]\
    },\
    \"WriteJourneyRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Activities\": {\
          \"shape\": \"MapOfActivity\",\
          \"documentation\": \"<p>A map that contains a set of Activity objects, one object for each activity in the journey. For each Activity object, the key is the unique identifier (string) for an activity and the value is the settings for the activity. An activity identifier can contain a maximum of 100 characters. The characters must be alphanumeric characters.</p>\"\
        },\
        \"CreationDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the journey was created.</p>\"\
        },\
        \"LastModifiedDate\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The date, in ISO 8601 format, when the journey was last modified.</p>\"\
        },\
        \"Limits\": {\
          \"shape\": \"JourneyLimits\",\
          \"documentation\": \"<p>The messaging and entry limits for the journey.</p>\"\
        },\
        \"LocalTime\": {\
          \"shape\": \"__boolean\",\
          \"documentation\": \"<p>Specifies whether the journey's scheduled start and end times use each participant's local time. To base the schedule on each participant's local time, set this value to true.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the journey. A journey name can contain a maximum of 150 characters. The characters can be alphanumeric characters or symbols, such as underscores (_) or hyphens (-). A journey name can't contain any spaces.</p>\"\
        },\
        \"QuietTime\": {\
          \"shape\": \"QuietTime\",\
          \"documentation\": \"<p>The quiet time settings for the journey. Quiet time is a specific time range when a journey doesn't send messages to participants, if all the following conditions are met:</p> <ul><li><p>The EndpointDemographic.Timezone property of the endpoint for the participant is set to a valid value.</p></li> <li><p>The current time in the participant's time zone is later than or equal to the time specified by the QuietTime.Start property for the journey.</p></li> <li><p>The current time in the participant's time zone is earlier than or equal to the time specified by the QuietTime.End property for the journey.</p></li></ul> <p>If any of the preceding conditions isn't met, the participant will receive messages from the journey, even if quiet time is enabled.</p>\"\
        },\
        \"RefreshFrequency\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The frequency with which Amazon Pinpoint evaluates segment and event data for the journey, as a duration in ISO 8601 format.</p>\"\
        },\
        \"Schedule\": {\
          \"shape\": \"JourneySchedule\",\
          \"documentation\": \"<p>The schedule settings for the journey.</p>\"\
        },\
        \"StartActivity\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The unique identifier for the first activity in the journey. The identifier for this activity can contain a maximum of 128 characters. The characters must be alphanumeric characters.</p>\"\
        },\
        \"StartCondition\": {\
          \"shape\": \"StartCondition\",\
          \"documentation\": \"<p>The segment that defines which users are participants in the journey.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"State\",\
          \"documentation\": \"<p>The status of the journey. Valid values are:</p> <ul><li><p>DRAFT - Saves the journey and doesn't publish it.</p></li> <li><p>ACTIVE - Saves and publishes the journey. Depending on the journey's schedule, the journey starts running immediately or at the scheduled start time. If a journey's status is ACTIVE, you can't add, change, or remove activities from it.</p></li></ul> <p>PAUSED, CANCELLED, COMPLETED, and CLOSED states are not supported in requests to create or update a journey. To cancel, pause, or resume a journey, use the <link  linkend=\\\"apps-application-id-journeys-journey-id-state\\\">Journey State</link> resource.</p>\"\
        },\
        \"WaitForQuietTime\": {\
            \"shape\": \"__boolean\",\
            \"documentation\": \"<p>Specifies whether endpoints in quiet hours should enter a wait till the end of their quiet hours.</p>\"\
        },\
        \"RefreshOnSegmentUpdate\": {\
            \"shape\": \"__boolean\",\
            \"documentation\": \"<p>Indicates whether the journey participants should be refreshed when a segment is updated.</p>\"\
        },\
        \"JourneyChannelSettings\": {\
            \"shape\": \"JourneyChannelSettings\",\
            \"documentation\": \"<p>The channel-specific configurations for the journey.</p>\"\
        },\
        \"SendingSchedule\": {\
            \"shape\": \"__boolean\",\
            \"documentation\": \"<p>Indicates if journey has Advance Quiet Time enabled. This flag should be set to true in order to allow using OpenHours and ClosedDays.</p>\"\
        },\
        \"OpenHours\": {\
            \"shape\": \"OpenHours\",\
            \"documentation\": \"<p>The time when journey allow to send messages. QuietTime should be configured first and SendingSchedule should be set to true.</p>\"\
        },\
        \"ClosedDays\": {\
            \"shape\": \"ClosedDays\",\
            \"documentation\": \"<p>The time when journey will stop sending messages. QuietTime should be configured first and SendingSchedule should be set to true.</p>\"\
        },\
        \"TimezoneEstimationMethods\": {\
          \"shape\": \"ListOf__TimezoneEstimationMethodsElement\",\
          \"documentation\": \"<p>An array of time zone estimation methods, if any, to use for determining an <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-endpoints-endpoint-id.html\\\">Endpoints</a> time zone if the Endpoint does not have a value for the Demographic.Timezone attribute.</p> <ul> <li><p>PHONE_NUMBER - A time zone is determined based on the Endpoint.Address and Endpoint.Location.Country.</p></li> <li><p>POSTAL_CODE - A time zone is determined based on the Endpoint.Location.PostalCode and Endpoint.Location.Country.</p> <note><p>POSTAL_CODE detection is only supported in the United States, United Kingdom, Australia, New Zealand, Canada, France, Italy, Spain, Germany and in regions where Amazon Pinpoint is available.</p></note></li> </ul>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the configuration and other settings for a journey.</p>\",\
      \"required\": [\
        \"Name\"\
      ]\
    },\
    \"WriteSegmentRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Dimensions\": {\
          \"shape\": \"SegmentDimensions\",\
          \"documentation\": \"<p>The criteria that define the dimensions for the segment.</p>\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the segment.</p>\"\
        },\
        \"SegmentGroups\": {\
          \"shape\": \"SegmentGroupList\",\
          \"documentation\": \"<p>The segment group to use and the dimensions to apply to the group's base segments in order to build the segment. A segment group can consist of zero or more base segments. Your request can include only one segment group.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"MapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<note><p>As of <b>22-05-2023</b> tags has been deprecated for update operations. After this date any value in tags is not processed and an error code is not returned. To manage tags we recommend using either <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html\\\">Tags</a> in the <i>API Reference for Amazon Pinpoint</i>, <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html\\\">resourcegroupstaggingapi</a> commands in the <i>AWS Command Line Interface Documentation</i> or <a href=\\\"https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html\\\">resourcegroupstaggingapi</a> in the <i>AWS SDK</i>.</p></note> <p>(Deprecated) A string-to-string map of key-value pairs that defines the tags to associate with the segment. Each tag consists of a required tag key and an associated tag value.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the configuration, dimension, and other settings for a segment. A WriteSegmentRequest object can include a Dimensions object or a SegmentGroups object, but not both.</p>\"\
    },\
    \"WriteTreatmentResource\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CustomDeliveryConfiguration\": {\
          \"shape\": \"CustomDeliveryConfiguration\",\
          \"documentation\": \"<p>The delivery configuration settings for sending the treatment through a custom channel. This object is required if the MessageConfiguration object for the treatment specifies a CustomMessage object.</p>\"\
        },\
        \"MessageConfiguration\": {\
          \"shape\": \"MessageConfiguration\",\
          \"documentation\": \"<p>The message configuration settings for the treatment.</p>\"\
        },\
        \"Schedule\": {\
          \"shape\": \"Schedule\",\
          \"documentation\": \"<p>The schedule settings for the treatment.</p>\"\
        },\
        \"SizePercent\": {\
          \"shape\": \"__integer\",\
          \"documentation\": \"<p>The allocated percentage of users (segment members) to send the treatment to.</p>\"\
        },\
        \"TemplateConfiguration\": {\
          \"shape\": \"TemplateConfiguration\",\
          \"documentation\": \"<p>The message template to use for the treatment.</p>\"\
        },\
        \"TreatmentDescription\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom description of the treatment.</p>\"\
        },\
        \"TreatmentName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>A custom name for the treatment.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Specifies the settings for a campaign treatment. A <i>treatment</i> is a variation of a campaign that's used for A/B testing of a campaign.</p>\",\
      \"required\": [\
        \"SizePercent\"\
      ]\
    },\
    \"__EndpointTypesElement\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"PUSH\",\
        \"GCM\",\
        \"APNS\",\
        \"APNS_SANDBOX\",\
        \"APNS_VOIP\",\
        \"APNS_VOIP_SANDBOX\",\
        \"ADM\",\
        \"SMS\",\
        \"VOICE\",\
        \"EMAIL\",\
        \"BAIDU\",\
        \"CUSTOM\",\
        \"IN_APP\"\
      ]\
    },\
    \"__TimezoneEstimationMethodsElement\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"PHONE_NUMBER\",\
        \"POSTAL_CODE\"\
      ]\
    },\
    \"__boolean\": {\
      \"type\": \"boolean\"\
    },\
    \"__double\": {\
      \"type\": \"double\"\
    },\
    \"__integer\": {\
      \"type\": \"integer\"\
    },\
    \"ListOfActivityResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ActivityResponse\"\
      }\
    },\
    \"ListOfApplicationResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ApplicationResponse\"\
      }\
    },\
    \"ListOfCampaignResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"CampaignResponse\"\
      }\
    },\
    \"ListOfEndpointBatchItem\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"EndpointBatchItem\"\
      }\
    },\
    \"ListOfEndpointResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"EndpointResponse\"\
      }\
    },\
    \"ListOfExportJobResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ExportJobResponse\"\
      }\
    },\
    \"ListOfImportJobResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ImportJobResponse\"\
      }\
    },\
    \"ListOfInAppMessageCampaign\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InAppMessageCampaign\"\
      }\
    },\
    \"ListOfInAppMessageContent\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InAppMessageContent\"\
      }\
    },\
    \"ListOfJourneyResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"JourneyResponse\"\
      }\
    },\
    \"ListOfJourneyRunResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"JourneyRunResponse\"\
      }\
    },\
    \"ListOfMultiConditionalBranch\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"MultiConditionalBranch\"\
      }\
    },\
    \"ListOfRandomSplitEntry\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"RandomSplitEntry\"\
      }\
    },\
    \"ListOfRecommenderConfigurationResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"RecommenderConfigurationResponse\"\
      }\
    },\
    \"ListOfResultRow\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ResultRow\"\
      }\
    },\
    \"ListOfResultRowValue\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ResultRowValue\"\
      }\
    },\
    \"ListOfSegmentDimensions\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"SegmentDimensions\"\
      }\
    },\
    \"ListOfSegmentGroup\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"SegmentGroup\"\
      }\
    },\
    \"ListOfSegmentReference\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"SegmentReference\"\
      }\
    },\
    \"ListOfSegmentResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"SegmentResponse\"\
      }\
    },\
    \"ListOfSimpleCondition\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"SimpleCondition\"\
      }\
    },\
    \"ListOfTemplateResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"TemplateResponse\"\
      }\
    },\
    \"ListOfTemplateVersionResponse\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"TemplateVersionResponse\"\
      }\
    },\
    \"ListOfTreatmentResource\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"TreatmentResource\"\
      }\
    },\
    \"ListOfWriteTreatmentResource\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"WriteTreatmentResource\"\
      }\
    },\
    \"ListOf__EndpointTypesElement\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"__EndpointTypesElement\"\
      }\
    },\
    \"ListOf__TimezoneEstimationMethodsElement\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"__TimezoneEstimationMethodsElement\"\
      }\
    },\
    \"ListOf__string\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"__string\"\
      }\
    },\
    \"__long\": {\
      \"type\": \"long\"\
    },\
    \"MapOfActivity\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"Activity\"\
      }\
    },\
    \"MapOfAddressConfiguration\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"AddressConfiguration\"\
      }\
    },\
    \"MapOfAttributeDimension\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"AttributeDimension\"\
      }\
    },\
    \"MapOfChannelResponse\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"ChannelResponse\"\
      }\
    },\
    \"MapOfEndpointMessageResult\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"EndpointMessageResult\"\
      }\
    },\
    \"MapOfEndpointSendConfiguration\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"EndpointSendConfiguration\"\
      }\
    },\
    \"MapOfEvent\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"Event\"\
      }\
    },\
    \"MapOfEventItemResponse\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"EventItemResponse\"\
      }\
    },\
    \"MapOfEventsBatch\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"EventsBatch\"\
      }\
    },\
    \"MapOfItemResponse\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"ItemResponse\"\
      }\
    },\
    \"MapOfMessageResult\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"MessageResult\"\
      }\
    },\
    \"MapOfMetricDimension\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"MetricDimension\"\
      }\
    },\
    \"MapOf__double\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"__double\"\
      }\
    },\
    \"MapOf__integer\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"__integer\"\
      }\
    },\
    \"MapOfListOf__string\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"ListOf__string\"\
      }\
    },\
    \"MapOfMapOfEndpointMessageResult\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"MapOfEndpointMessageResult\"\
      }\
    },\
    \"MapOf__string\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"__string\"\
      }\
    },\
    \"__string\": {\
      \"type\": \"string\"\
    },\
    \"__timestampIso8601\": {\
      \"type\": \"timestamp\",\
      \"timestampFormat\": \"iso8601\"\
    },\
    \"__timestampUnix\": {\
      \"type\": \"timestamp\",\
      \"timestampFormat\": \"unixTimestamp\"\
    },\
    \"DayOfWeek\": {\
        \"type\": \"string\",\
        \"enum\": [\
          \"MONDAY\",\
          \"TUESDAY\",\
          \"WEDNESDAY\",\
          \"THURSDAY\",\
          \"FRIDAY\",\
          \"SATURDAY\",\
          \"SUNDAY\"\
        ]\
    },\
    \"OpenHoursRule\": {\
        \"type\": \"structure\",\
        \"documentation\": \"<p>Specifies the start and end time for OpenHours.</p>\",\
        \"members\": {\
          \"StartTime\": {\
              \"shape\": \"__string\",\
              \"documentation\": \"<p>The start of the scheduled time, in ISO 8601 format, when the channel can send messages.</p>\"\
          },\
          \"EndTime\": {\
              \"shape\": \"__string\",\
              \"documentation\": \"<p>The end of the scheduled time, in ISO 8601 format, when the channel can't send messages.</p>\"\
          }\
      }\
    },\
    \"ListOfOpenHoursRules\": {\
        \"type\": \"list\",\
        \"member\": {\
            \"shape\": \"OpenHoursRule\",\
            \"documentation\": \"<p>Open Hour Rule Details.</p>\"\
          }\
    },\
    \"MapOfListOfOpenHoursRules\": {\
        \"type\": \"map\",\
        \"key\": {\
          \"shape\": \"DayOfWeek\",\
          \"documentation\": \"<p>Day of a week when the rule will be applied. Valid values are [MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY]</p>\"\
        },\
        \"value\": {\
          \"shape\": \"ListOfOpenHoursRules\",\
          \"documentation\": \"<p>Open Hour Rules.</p>\"\
        }\
    },\
    \"OpenHours\": {\
        \"type\": \"structure\",\
        \"documentation\": \"<p>Specifies the times when message are allowed to be sent to endpoints.</p>\",\
        \"members\": {\
            \"EMAIL\": {\
                \"shape\": \"MapOfListOfOpenHoursRules\",\
                \"documentation\": \"<p>Specifies the schedule settings for the email channel.</p>\"\
            },\
            \"SMS\": {\
                \"shape\": \"MapOfListOfOpenHoursRules\",\
                \"documentation\": \"<p>Specifies the schedule settings for the SMS channel.</p>\"\
            },\
            \"PUSH\": {\
                \"shape\": \"MapOfListOfOpenHoursRules\",\
                \"documentation\": \"<p>Specifies the schedule settings for the push channel.</p>\"\
            },\
            \"VOICE\": {\
                \"shape\": \"MapOfListOfOpenHoursRules\",\
                \"documentation\": \"<p>Specifies the schedule settings for the voice channel.</p>\"\
            },\
            \"CUSTOM\": {\
                \"shape\": \"MapOfListOfOpenHoursRules\",\
                \"documentation\": \"<p>Specifies the schedule settings for the custom channel.</p>\"\
            }\
      }\
    },\
    \"ClosedDaysRule\": {\
        \"type\": \"structure\",\
        \"documentation\": \"<p>Specifies the rule settings for when messages can't be sent.</p>\",\
        \"members\": {\
            \"Name\": {\
                \"shape\": \"__string\",\
                \"documentation\": \"<p>The name of the closed day rule.</p>\"\
            },\
            \"StartDateTime\": {\
                \"shape\": \"__string\",\
                \"documentation\": \"<p>Start DateTime ISO 8601 format</p>\"\
            },\
            \"EndDateTime\": {\
                \"shape\": \"__string\",\
                \"documentation\": \"<p>End DateTime ISO 8601 format</p>\"\
            }\
      }\
    },\
    \"ListOfClosedDaysRules\": {\
        \"type\": \"list\",\
        \"member\": {\
            \"shape\": \"ClosedDaysRule\",\
            \"documentation\": \"<p>ClosedDays rule details.</p>\"\
          }\
    },\
    \"ClosedDays\": {\
        \"type\": \"structure\",\
        \"documentation\": \"<p>The time when a journey will not send messages. QuietTime should be configured first and SendingSchedule should be set to true.</p>\",\
        \"members\": {\
            \"EMAIL\": {\
                \"shape\": \"ListOfClosedDaysRules\",\
                \"documentation\": \"<p>Rules for the Email channel.</p>\"\
            },\
            \"SMS\": {\
                \"shape\": \"ListOfClosedDaysRules\",\
                \"documentation\": \"<p>Rules for the SMS channel.</p>\"\
            },\
            \"PUSH\": {\
                \"shape\": \"ListOfClosedDaysRules\",\
                \"documentation\": \"<p>Rules for the Push channel.</p>\"\
            },\
            \"VOICE\": {\
                \"shape\": \"ListOfClosedDaysRules\",\
                \"documentation\": \"<p>Rules for the Voice channel.</p>\"\
            },\
            \"CUSTOM\": {\
                \"shape\": \"ListOfClosedDaysRules\",\
                \"documentation\": \"<p>Rules for the Custom channel.</p>\"\
            }\
      }\
    }\
  }\
}\
";
}

@end
