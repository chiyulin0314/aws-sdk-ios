//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSLogsModel.h"

@interface AWSLogsNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSLogsAccountPolicy API_AVAILABLE(ios(11));
- (void) test_AWSLogsAnomaly API_AVAILABLE(ios(11));
- (void) test_AWSLogsAnomalyDetector API_AVAILABLE(ios(11));
- (void) test_AWSLogsAssociateKmsKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsCancelExportTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsCreateDeliveryRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsCreateDeliveryResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsCreateExportTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsCreateExportTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsCreateLogAnomalyDetectorRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsCreateLogAnomalyDetectorResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsCreateLogGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsCreateLogStreamRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteAccountPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteDataProtectionPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteDeliveryDestinationPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteDeliveryDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteDeliveryRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteDeliverySourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteLogAnomalyDetectorRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteLogGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteLogStreamRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteMetricFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteQueryDefinitionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteQueryDefinitionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteResourcePolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteRetentionPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeleteSubscriptionFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDelivery API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeliveryDestination API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeliveryDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLogsDeliverySource API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeAccountPoliciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeAccountPoliciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeDeliveriesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeDeliveriesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeDeliveryDestinationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeDeliveryDestinationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeDeliverySourcesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeDeliverySourcesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeDestinationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeDestinationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeExportTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeExportTasksResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeLogGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeLogGroupsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeLogStreamsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeLogStreamsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeMetricFiltersRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeMetricFiltersResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeQueriesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeQueriesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeQueryDefinitionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeQueryDefinitionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeResourcePoliciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeResourcePoliciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeSubscriptionFiltersRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsDescribeSubscriptionFiltersResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsDestination API_AVAILABLE(ios(11));
- (void) test_AWSLogsDisassociateKmsKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsExportTask API_AVAILABLE(ios(11));
- (void) test_AWSLogsExportTaskExecutionInfo API_AVAILABLE(ios(11));
- (void) test_AWSLogsExportTaskStatus API_AVAILABLE(ios(11));
- (void) test_AWSLogsFilterLogEventsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsFilterLogEventsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsFilteredLogEvent API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDataProtectionPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDataProtectionPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDeliveryDestinationPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDeliveryDestinationPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDeliveryDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDeliveryDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDeliveryRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDeliveryResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDeliverySourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetDeliverySourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetLogAnomalyDetectorRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetLogAnomalyDetectorResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetLogEventsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetLogEventsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetLogGroupFieldsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetLogGroupFieldsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetLogRecordRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetLogRecordResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetQueryResultsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsGetQueryResultsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsInputLogEvent API_AVAILABLE(ios(11));
- (void) test_AWSLogsListAnomaliesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsListAnomaliesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsListLogAnomalyDetectorsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsListLogAnomalyDetectorsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsListTagsLogGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsListTagsLogGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsLiveTailSessionLogEvent API_AVAILABLE(ios(11));
- (void) test_AWSLogsLiveTailSessionMetadata API_AVAILABLE(ios(11));
- (void) test_AWSLogsLiveTailSessionStart API_AVAILABLE(ios(11));
- (void) test_AWSLogsLiveTailSessionUpdate API_AVAILABLE(ios(11));
- (void) test_AWSLogsLogEvent API_AVAILABLE(ios(11));
- (void) test_AWSLogsLogGroup API_AVAILABLE(ios(11));
- (void) test_AWSLogsLogGroupField API_AVAILABLE(ios(11));
- (void) test_AWSLogsLogStream API_AVAILABLE(ios(11));
- (void) test_AWSLogsMetricFilter API_AVAILABLE(ios(11));
- (void) test_AWSLogsMetricFilterMatchRecord API_AVAILABLE(ios(11));
- (void) test_AWSLogsMetricTransformation API_AVAILABLE(ios(11));
- (void) test_AWSLogsOutputLogEvent API_AVAILABLE(ios(11));
- (void) test_AWSLogsPatternToken API_AVAILABLE(ios(11));
- (void) test_AWSLogsPolicy API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutAccountPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutAccountPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDataProtectionPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDataProtectionPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDeliveryDestinationPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDeliveryDestinationPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDeliveryDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDeliveryDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDeliverySourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDeliverySourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDestinationPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutLogEventsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutLogEventsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutMetricFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutQueryDefinitionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutQueryDefinitionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutResourcePolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutResourcePolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutRetentionPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsPutSubscriptionFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsQueryCompileError API_AVAILABLE(ios(11));
- (void) test_AWSLogsQueryCompileErrorLocation API_AVAILABLE(ios(11));
- (void) test_AWSLogsQueryDefinition API_AVAILABLE(ios(11));
- (void) test_AWSLogsQueryInfo API_AVAILABLE(ios(11));
- (void) test_AWSLogsQueryStatistics API_AVAILABLE(ios(11));
- (void) test_AWSLogsRejectedLogEventsInfo API_AVAILABLE(ios(11));
- (void) test_AWSLogsResourcePolicy API_AVAILABLE(ios(11));
- (void) test_AWSLogsResultField API_AVAILABLE(ios(11));
- (void) test_AWSLogsSearchedLogStream API_AVAILABLE(ios(11));
- (void) test_AWSLogsStartLiveTailRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsStartLiveTailResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsStartLiveTailResponseStream API_AVAILABLE(ios(11));
- (void) test_AWSLogsStartQueryRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsStartQueryResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsStopQueryRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsStopQueryResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsSubscriptionFilter API_AVAILABLE(ios(11));
- (void) test_AWSLogsSuppressionPeriod API_AVAILABLE(ios(11));
- (void) test_AWSLogsTagLogGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsTestMetricFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsTestMetricFilterResponse API_AVAILABLE(ios(11));
- (void) test_AWSLogsUntagLogGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsUpdateAnomalyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLogsUpdateLogAnomalyDetectorRequest API_AVAILABLE(ios(11));

@end

@implementation AWSLogsNSSecureCodingTests

- (void) test_AWSLogsAccountPolicy {
    [self validateSecureCodingForClass:[AWSLogsAccountPolicy class]];
}

- (void) test_AWSLogsAnomaly {
    [self validateSecureCodingForClass:[AWSLogsAnomaly class]];
}

- (void) test_AWSLogsAnomalyDetector {
    [self validateSecureCodingForClass:[AWSLogsAnomalyDetector class]];
}

- (void) test_AWSLogsAssociateKmsKeyRequest {
    [self validateSecureCodingForClass:[AWSLogsAssociateKmsKeyRequest class]];
}

- (void) test_AWSLogsCancelExportTaskRequest {
    [self validateSecureCodingForClass:[AWSLogsCancelExportTaskRequest class]];
}

- (void) test_AWSLogsCreateDeliveryRequest {
    [self validateSecureCodingForClass:[AWSLogsCreateDeliveryRequest class]];
}

- (void) test_AWSLogsCreateDeliveryResponse {
    [self validateSecureCodingForClass:[AWSLogsCreateDeliveryResponse class]];
}

- (void) test_AWSLogsCreateExportTaskRequest {
    [self validateSecureCodingForClass:[AWSLogsCreateExportTaskRequest class]];
}

- (void) test_AWSLogsCreateExportTaskResponse {
    [self validateSecureCodingForClass:[AWSLogsCreateExportTaskResponse class]];
}

- (void) test_AWSLogsCreateLogAnomalyDetectorRequest {
    [self validateSecureCodingForClass:[AWSLogsCreateLogAnomalyDetectorRequest class]];
}

- (void) test_AWSLogsCreateLogAnomalyDetectorResponse {
    [self validateSecureCodingForClass:[AWSLogsCreateLogAnomalyDetectorResponse class]];
}

- (void) test_AWSLogsCreateLogGroupRequest {
    [self validateSecureCodingForClass:[AWSLogsCreateLogGroupRequest class]];
}

- (void) test_AWSLogsCreateLogStreamRequest {
    [self validateSecureCodingForClass:[AWSLogsCreateLogStreamRequest class]];
}

- (void) test_AWSLogsDeleteAccountPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteAccountPolicyRequest class]];
}

- (void) test_AWSLogsDeleteDataProtectionPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteDataProtectionPolicyRequest class]];
}

- (void) test_AWSLogsDeleteDeliveryDestinationPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteDeliveryDestinationPolicyRequest class]];
}

- (void) test_AWSLogsDeleteDeliveryDestinationRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteDeliveryDestinationRequest class]];
}

- (void) test_AWSLogsDeleteDeliveryRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteDeliveryRequest class]];
}

- (void) test_AWSLogsDeleteDeliverySourceRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteDeliverySourceRequest class]];
}

- (void) test_AWSLogsDeleteDestinationRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteDestinationRequest class]];
}

- (void) test_AWSLogsDeleteLogAnomalyDetectorRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteLogAnomalyDetectorRequest class]];
}

- (void) test_AWSLogsDeleteLogGroupRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteLogGroupRequest class]];
}

- (void) test_AWSLogsDeleteLogStreamRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteLogStreamRequest class]];
}

- (void) test_AWSLogsDeleteMetricFilterRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteMetricFilterRequest class]];
}

- (void) test_AWSLogsDeleteQueryDefinitionRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteQueryDefinitionRequest class]];
}

- (void) test_AWSLogsDeleteQueryDefinitionResponse {
    [self validateSecureCodingForClass:[AWSLogsDeleteQueryDefinitionResponse class]];
}

- (void) test_AWSLogsDeleteResourcePolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteResourcePolicyRequest class]];
}

- (void) test_AWSLogsDeleteRetentionPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteRetentionPolicyRequest class]];
}

- (void) test_AWSLogsDeleteSubscriptionFilterRequest {
    [self validateSecureCodingForClass:[AWSLogsDeleteSubscriptionFilterRequest class]];
}

- (void) test_AWSLogsDelivery {
    [self validateSecureCodingForClass:[AWSLogsDelivery class]];
}

- (void) test_AWSLogsDeliveryDestination {
    [self validateSecureCodingForClass:[AWSLogsDeliveryDestination class]];
}

- (void) test_AWSLogsDeliveryDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSLogsDeliveryDestinationConfiguration class]];
}

- (void) test_AWSLogsDeliverySource {
    [self validateSecureCodingForClass:[AWSLogsDeliverySource class]];
}

- (void) test_AWSLogsDescribeAccountPoliciesRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeAccountPoliciesRequest class]];
}

- (void) test_AWSLogsDescribeAccountPoliciesResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeAccountPoliciesResponse class]];
}

- (void) test_AWSLogsDescribeDeliveriesRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeDeliveriesRequest class]];
}

- (void) test_AWSLogsDescribeDeliveriesResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeDeliveriesResponse class]];
}

- (void) test_AWSLogsDescribeDeliveryDestinationsRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeDeliveryDestinationsRequest class]];
}

- (void) test_AWSLogsDescribeDeliveryDestinationsResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeDeliveryDestinationsResponse class]];
}

- (void) test_AWSLogsDescribeDeliverySourcesRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeDeliverySourcesRequest class]];
}

- (void) test_AWSLogsDescribeDeliverySourcesResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeDeliverySourcesResponse class]];
}

- (void) test_AWSLogsDescribeDestinationsRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeDestinationsRequest class]];
}

- (void) test_AWSLogsDescribeDestinationsResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeDestinationsResponse class]];
}

- (void) test_AWSLogsDescribeExportTasksRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeExportTasksRequest class]];
}

- (void) test_AWSLogsDescribeExportTasksResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeExportTasksResponse class]];
}

- (void) test_AWSLogsDescribeLogGroupsRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeLogGroupsRequest class]];
}

- (void) test_AWSLogsDescribeLogGroupsResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeLogGroupsResponse class]];
}

- (void) test_AWSLogsDescribeLogStreamsRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeLogStreamsRequest class]];
}

- (void) test_AWSLogsDescribeLogStreamsResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeLogStreamsResponse class]];
}

- (void) test_AWSLogsDescribeMetricFiltersRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeMetricFiltersRequest class]];
}

- (void) test_AWSLogsDescribeMetricFiltersResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeMetricFiltersResponse class]];
}

- (void) test_AWSLogsDescribeQueriesRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeQueriesRequest class]];
}

- (void) test_AWSLogsDescribeQueriesResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeQueriesResponse class]];
}

- (void) test_AWSLogsDescribeQueryDefinitionsRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeQueryDefinitionsRequest class]];
}

- (void) test_AWSLogsDescribeQueryDefinitionsResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeQueryDefinitionsResponse class]];
}

- (void) test_AWSLogsDescribeResourcePoliciesRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeResourcePoliciesRequest class]];
}

- (void) test_AWSLogsDescribeResourcePoliciesResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeResourcePoliciesResponse class]];
}

- (void) test_AWSLogsDescribeSubscriptionFiltersRequest {
    [self validateSecureCodingForClass:[AWSLogsDescribeSubscriptionFiltersRequest class]];
}

- (void) test_AWSLogsDescribeSubscriptionFiltersResponse {
    [self validateSecureCodingForClass:[AWSLogsDescribeSubscriptionFiltersResponse class]];
}

- (void) test_AWSLogsDestination {
    [self validateSecureCodingForClass:[AWSLogsDestination class]];
}

- (void) test_AWSLogsDisassociateKmsKeyRequest {
    [self validateSecureCodingForClass:[AWSLogsDisassociateKmsKeyRequest class]];
}

- (void) test_AWSLogsExportTask {
    [self validateSecureCodingForClass:[AWSLogsExportTask class]];
}

- (void) test_AWSLogsExportTaskExecutionInfo {
    [self validateSecureCodingForClass:[AWSLogsExportTaskExecutionInfo class]];
}

- (void) test_AWSLogsExportTaskStatus {
    [self validateSecureCodingForClass:[AWSLogsExportTaskStatus class]];
}

- (void) test_AWSLogsFilterLogEventsRequest {
    [self validateSecureCodingForClass:[AWSLogsFilterLogEventsRequest class]];
}

- (void) test_AWSLogsFilterLogEventsResponse {
    [self validateSecureCodingForClass:[AWSLogsFilterLogEventsResponse class]];
}

- (void) test_AWSLogsFilteredLogEvent {
    [self validateSecureCodingForClass:[AWSLogsFilteredLogEvent class]];
}

- (void) test_AWSLogsGetDataProtectionPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsGetDataProtectionPolicyRequest class]];
}

- (void) test_AWSLogsGetDataProtectionPolicyResponse {
    [self validateSecureCodingForClass:[AWSLogsGetDataProtectionPolicyResponse class]];
}

- (void) test_AWSLogsGetDeliveryDestinationPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsGetDeliveryDestinationPolicyRequest class]];
}

- (void) test_AWSLogsGetDeliveryDestinationPolicyResponse {
    [self validateSecureCodingForClass:[AWSLogsGetDeliveryDestinationPolicyResponse class]];
}

- (void) test_AWSLogsGetDeliveryDestinationRequest {
    [self validateSecureCodingForClass:[AWSLogsGetDeliveryDestinationRequest class]];
}

- (void) test_AWSLogsGetDeliveryDestinationResponse {
    [self validateSecureCodingForClass:[AWSLogsGetDeliveryDestinationResponse class]];
}

- (void) test_AWSLogsGetDeliveryRequest {
    [self validateSecureCodingForClass:[AWSLogsGetDeliveryRequest class]];
}

- (void) test_AWSLogsGetDeliveryResponse {
    [self validateSecureCodingForClass:[AWSLogsGetDeliveryResponse class]];
}

- (void) test_AWSLogsGetDeliverySourceRequest {
    [self validateSecureCodingForClass:[AWSLogsGetDeliverySourceRequest class]];
}

- (void) test_AWSLogsGetDeliverySourceResponse {
    [self validateSecureCodingForClass:[AWSLogsGetDeliverySourceResponse class]];
}

- (void) test_AWSLogsGetLogAnomalyDetectorRequest {
    [self validateSecureCodingForClass:[AWSLogsGetLogAnomalyDetectorRequest class]];
}

- (void) test_AWSLogsGetLogAnomalyDetectorResponse {
    [self validateSecureCodingForClass:[AWSLogsGetLogAnomalyDetectorResponse class]];
}

- (void) test_AWSLogsGetLogEventsRequest {
    [self validateSecureCodingForClass:[AWSLogsGetLogEventsRequest class]];
}

- (void) test_AWSLogsGetLogEventsResponse {
    [self validateSecureCodingForClass:[AWSLogsGetLogEventsResponse class]];
}

- (void) test_AWSLogsGetLogGroupFieldsRequest {
    [self validateSecureCodingForClass:[AWSLogsGetLogGroupFieldsRequest class]];
}

- (void) test_AWSLogsGetLogGroupFieldsResponse {
    [self validateSecureCodingForClass:[AWSLogsGetLogGroupFieldsResponse class]];
}

- (void) test_AWSLogsGetLogRecordRequest {
    [self validateSecureCodingForClass:[AWSLogsGetLogRecordRequest class]];
}

- (void) test_AWSLogsGetLogRecordResponse {
    [self validateSecureCodingForClass:[AWSLogsGetLogRecordResponse class]];
}

- (void) test_AWSLogsGetQueryResultsRequest {
    [self validateSecureCodingForClass:[AWSLogsGetQueryResultsRequest class]];
}

- (void) test_AWSLogsGetQueryResultsResponse {
    [self validateSecureCodingForClass:[AWSLogsGetQueryResultsResponse class]];
}

- (void) test_AWSLogsInputLogEvent {
    [self validateSecureCodingForClass:[AWSLogsInputLogEvent class]];
}

- (void) test_AWSLogsListAnomaliesRequest {
    [self validateSecureCodingForClass:[AWSLogsListAnomaliesRequest class]];
}

- (void) test_AWSLogsListAnomaliesResponse {
    [self validateSecureCodingForClass:[AWSLogsListAnomaliesResponse class]];
}

- (void) test_AWSLogsListLogAnomalyDetectorsRequest {
    [self validateSecureCodingForClass:[AWSLogsListLogAnomalyDetectorsRequest class]];
}

- (void) test_AWSLogsListLogAnomalyDetectorsResponse {
    [self validateSecureCodingForClass:[AWSLogsListLogAnomalyDetectorsResponse class]];
}

- (void) test_AWSLogsListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSLogsListTagsForResourceRequest class]];
}

- (void) test_AWSLogsListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSLogsListTagsForResourceResponse class]];
}

- (void) test_AWSLogsListTagsLogGroupRequest {
    [self validateSecureCodingForClass:[AWSLogsListTagsLogGroupRequest class]];
}

- (void) test_AWSLogsListTagsLogGroupResponse {
    [self validateSecureCodingForClass:[AWSLogsListTagsLogGroupResponse class]];
}

- (void) test_AWSLogsLiveTailSessionLogEvent {
    [self validateSecureCodingForClass:[AWSLogsLiveTailSessionLogEvent class]];
}

- (void) test_AWSLogsLiveTailSessionMetadata {
    [self validateSecureCodingForClass:[AWSLogsLiveTailSessionMetadata class]];
}

- (void) test_AWSLogsLiveTailSessionStart {
    [self validateSecureCodingForClass:[AWSLogsLiveTailSessionStart class]];
}

- (void) test_AWSLogsLiveTailSessionUpdate {
    [self validateSecureCodingForClass:[AWSLogsLiveTailSessionUpdate class]];
}

- (void) test_AWSLogsLogEvent {
    [self validateSecureCodingForClass:[AWSLogsLogEvent class]];
}

- (void) test_AWSLogsLogGroup {
    [self validateSecureCodingForClass:[AWSLogsLogGroup class]];
}

- (void) test_AWSLogsLogGroupField {
    [self validateSecureCodingForClass:[AWSLogsLogGroupField class]];
}

- (void) test_AWSLogsLogStream {
    [self validateSecureCodingForClass:[AWSLogsLogStream class]];
}

- (void) test_AWSLogsMetricFilter {
    [self validateSecureCodingForClass:[AWSLogsMetricFilter class]];
}

- (void) test_AWSLogsMetricFilterMatchRecord {
    [self validateSecureCodingForClass:[AWSLogsMetricFilterMatchRecord class]];
}

- (void) test_AWSLogsMetricTransformation {
    [self validateSecureCodingForClass:[AWSLogsMetricTransformation class]];
}

- (void) test_AWSLogsOutputLogEvent {
    [self validateSecureCodingForClass:[AWSLogsOutputLogEvent class]];
}

- (void) test_AWSLogsPatternToken {
    [self validateSecureCodingForClass:[AWSLogsPatternToken class]];
}

- (void) test_AWSLogsPolicy {
    [self validateSecureCodingForClass:[AWSLogsPolicy class]];
}

- (void) test_AWSLogsPutAccountPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsPutAccountPolicyRequest class]];
}

- (void) test_AWSLogsPutAccountPolicyResponse {
    [self validateSecureCodingForClass:[AWSLogsPutAccountPolicyResponse class]];
}

- (void) test_AWSLogsPutDataProtectionPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsPutDataProtectionPolicyRequest class]];
}

- (void) test_AWSLogsPutDataProtectionPolicyResponse {
    [self validateSecureCodingForClass:[AWSLogsPutDataProtectionPolicyResponse class]];
}

- (void) test_AWSLogsPutDeliveryDestinationPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsPutDeliveryDestinationPolicyRequest class]];
}

- (void) test_AWSLogsPutDeliveryDestinationPolicyResponse {
    [self validateSecureCodingForClass:[AWSLogsPutDeliveryDestinationPolicyResponse class]];
}

- (void) test_AWSLogsPutDeliveryDestinationRequest {
    [self validateSecureCodingForClass:[AWSLogsPutDeliveryDestinationRequest class]];
}

- (void) test_AWSLogsPutDeliveryDestinationResponse {
    [self validateSecureCodingForClass:[AWSLogsPutDeliveryDestinationResponse class]];
}

- (void) test_AWSLogsPutDeliverySourceRequest {
    [self validateSecureCodingForClass:[AWSLogsPutDeliverySourceRequest class]];
}

- (void) test_AWSLogsPutDeliverySourceResponse {
    [self validateSecureCodingForClass:[AWSLogsPutDeliverySourceResponse class]];
}

- (void) test_AWSLogsPutDestinationPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsPutDestinationPolicyRequest class]];
}

- (void) test_AWSLogsPutDestinationRequest {
    [self validateSecureCodingForClass:[AWSLogsPutDestinationRequest class]];
}

- (void) test_AWSLogsPutDestinationResponse {
    [self validateSecureCodingForClass:[AWSLogsPutDestinationResponse class]];
}

- (void) test_AWSLogsPutLogEventsRequest {
    [self validateSecureCodingForClass:[AWSLogsPutLogEventsRequest class]];
}

- (void) test_AWSLogsPutLogEventsResponse {
    [self validateSecureCodingForClass:[AWSLogsPutLogEventsResponse class]];
}

- (void) test_AWSLogsPutMetricFilterRequest {
    [self validateSecureCodingForClass:[AWSLogsPutMetricFilterRequest class]];
}

- (void) test_AWSLogsPutQueryDefinitionRequest {
    [self validateSecureCodingForClass:[AWSLogsPutQueryDefinitionRequest class]];
}

- (void) test_AWSLogsPutQueryDefinitionResponse {
    [self validateSecureCodingForClass:[AWSLogsPutQueryDefinitionResponse class]];
}

- (void) test_AWSLogsPutResourcePolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsPutResourcePolicyRequest class]];
}

- (void) test_AWSLogsPutResourcePolicyResponse {
    [self validateSecureCodingForClass:[AWSLogsPutResourcePolicyResponse class]];
}

- (void) test_AWSLogsPutRetentionPolicyRequest {
    [self validateSecureCodingForClass:[AWSLogsPutRetentionPolicyRequest class]];
}

- (void) test_AWSLogsPutSubscriptionFilterRequest {
    [self validateSecureCodingForClass:[AWSLogsPutSubscriptionFilterRequest class]];
}

- (void) test_AWSLogsQueryCompileError {
    [self validateSecureCodingForClass:[AWSLogsQueryCompileError class]];
}

- (void) test_AWSLogsQueryCompileErrorLocation {
    [self validateSecureCodingForClass:[AWSLogsQueryCompileErrorLocation class]];
}

- (void) test_AWSLogsQueryDefinition {
    [self validateSecureCodingForClass:[AWSLogsQueryDefinition class]];
}

- (void) test_AWSLogsQueryInfo {
    [self validateSecureCodingForClass:[AWSLogsQueryInfo class]];
}

- (void) test_AWSLogsQueryStatistics {
    [self validateSecureCodingForClass:[AWSLogsQueryStatistics class]];
}

- (void) test_AWSLogsRejectedLogEventsInfo {
    [self validateSecureCodingForClass:[AWSLogsRejectedLogEventsInfo class]];
}

- (void) test_AWSLogsResourcePolicy {
    [self validateSecureCodingForClass:[AWSLogsResourcePolicy class]];
}

- (void) test_AWSLogsResultField {
    [self validateSecureCodingForClass:[AWSLogsResultField class]];
}

- (void) test_AWSLogsSearchedLogStream {
    [self validateSecureCodingForClass:[AWSLogsSearchedLogStream class]];
}

- (void) test_AWSLogsStartLiveTailRequest {
    [self validateSecureCodingForClass:[AWSLogsStartLiveTailRequest class]];
}

- (void) test_AWSLogsStartLiveTailResponse {
    [self validateSecureCodingForClass:[AWSLogsStartLiveTailResponse class]];
}

- (void) test_AWSLogsStartLiveTailResponseStream {
    [self validateSecureCodingForClass:[AWSLogsStartLiveTailResponseStream class]];
}

- (void) test_AWSLogsStartQueryRequest {
    [self validateSecureCodingForClass:[AWSLogsStartQueryRequest class]];
}

- (void) test_AWSLogsStartQueryResponse {
    [self validateSecureCodingForClass:[AWSLogsStartQueryResponse class]];
}

- (void) test_AWSLogsStopQueryRequest {
    [self validateSecureCodingForClass:[AWSLogsStopQueryRequest class]];
}

- (void) test_AWSLogsStopQueryResponse {
    [self validateSecureCodingForClass:[AWSLogsStopQueryResponse class]];
}

- (void) test_AWSLogsSubscriptionFilter {
    [self validateSecureCodingForClass:[AWSLogsSubscriptionFilter class]];
}

- (void) test_AWSLogsSuppressionPeriod {
    [self validateSecureCodingForClass:[AWSLogsSuppressionPeriod class]];
}

- (void) test_AWSLogsTagLogGroupRequest {
    [self validateSecureCodingForClass:[AWSLogsTagLogGroupRequest class]];
}

- (void) test_AWSLogsTagResourceRequest {
    [self validateSecureCodingForClass:[AWSLogsTagResourceRequest class]];
}

- (void) test_AWSLogsTestMetricFilterRequest {
    [self validateSecureCodingForClass:[AWSLogsTestMetricFilterRequest class]];
}

- (void) test_AWSLogsTestMetricFilterResponse {
    [self validateSecureCodingForClass:[AWSLogsTestMetricFilterResponse class]];
}

- (void) test_AWSLogsUntagLogGroupRequest {
    [self validateSecureCodingForClass:[AWSLogsUntagLogGroupRequest class]];
}

- (void) test_AWSLogsUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSLogsUntagResourceRequest class]];
}

- (void) test_AWSLogsUpdateAnomalyRequest {
    [self validateSecureCodingForClass:[AWSLogsUpdateAnomalyRequest class]];
}

- (void) test_AWSLogsUpdateLogAnomalyDetectorRequest {
    [self validateSecureCodingForClass:[AWSLogsUpdateLogAnomalyDetectorRequest class]];
}

@end

