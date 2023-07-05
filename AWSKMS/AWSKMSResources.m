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

#import "AWSKMSResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSKMSResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSKMSResources

+ (instancetype)sharedInstance {
    static AWSKMSResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSKMSResources new];
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
    \"apiVersion\":\"2014-11-01\",\
    \"endpointPrefix\":\"kms\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceAbbreviation\":\"KMS\",\
    \"serviceFullName\":\"AWS Key Management Service\",\
    \"serviceId\":\"KMS\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"TrentService\",\
    \"uid\":\"kms-2014-11-01\"\
  },\
  \"operations\":{\
    \"CancelKeyDeletion\":{\
      \"name\":\"CancelKeyDeletion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelKeyDeletionRequest\"},\
      \"output\":{\"shape\":\"CancelKeyDeletionResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Cancels the deletion of a KMS key. When this operation succeeds, the key state of the KMS key is <code>Disabled</code>. To enable the KMS key, use <a>EnableKey</a>. </p> <p>For more information about scheduling and canceling deletion of a KMS key, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html\\\">Deleting KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:CancelKeyDeletion</a> (key policy)</p> <p> <b>Related operations</b>: <a>ScheduleKeyDeletion</a> </p>\"\
    },\
    \"ConnectCustomKeyStore\":{\
      \"name\":\"ConnectCustomKeyStore\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConnectCustomKeyStoreRequest\"},\
      \"output\":{\"shape\":\"ConnectCustomKeyStoreResponse\"},\
      \"errors\":[\
        {\"shape\":\"CloudHsmClusterNotActiveException\"},\
        {\"shape\":\"CustomKeyStoreInvalidStateException\"},\
        {\"shape\":\"CustomKeyStoreNotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"CloudHsmClusterInvalidConfigurationException\"}\
      ],\
      \"documentation\":\"<p>Connects or reconnects a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a> to its backing key store. For an CloudHSM key store, <code>ConnectCustomKeyStore</code> connects the key store to its associated CloudHSM cluster. For an external key store, <code>ConnectCustomKeyStore</code> connects the key store to the external key store proxy that communicates with your external key manager.</p> <p>The custom key store must be connected before you can create KMS keys in the key store or use the KMS keys it contains. You can disconnect and reconnect a custom key store at any time.</p> <p>The connection process for a custom key store can take an extended amount of time to complete. This operation starts the connection process, but it does not wait for it to complete. When it succeeds, this operation quickly returns an HTTP 200 response and a JSON object with no properties. However, this response does not indicate that the custom key store is connected. To get the connection state of the custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p> <p> This operation is part of the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key stores</a> feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.</p> <p>The <code>ConnectCustomKeyStore</code> operation might fail for various reasons. To find the reason, use the <a>DescribeCustomKeyStores</a> operation and see the <code>ConnectionErrorCode</code> in the response. For help interpreting the <code>ConnectionErrorCode</code>, see <a>CustomKeyStoresListEntry</a>.</p> <p>To fix the failure, use the <a>DisconnectCustomKeyStore</a> operation to disconnect the custom key store, correct the error, use the <a>UpdateCustomKeyStore</a> operation if necessary, and then use <code>ConnectCustomKeyStore</code> again.</p> <p> <b>CloudHSM key store</b> </p> <p>During the connection process for an CloudHSM key store, KMS finds the CloudHSM cluster that is associated with the custom key store, creates the connection infrastructure, connects to the cluster, logs into the CloudHSM client as the <code>kmsuser</code> CU, and rotates its password.</p> <p>To connect an CloudHSM key store, its associated CloudHSM cluster must have at least one active HSM. To get the number of active HSMs in a cluster, use the <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html\\\">DescribeClusters</a> operation. To add HSMs to the cluster, use the <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html\\\">CreateHsm</a> operation. Also, the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser\\\"> <code>kmsuser</code> crypto user</a> (CU) must not be logged into the cluster. This prevents KMS from using this account to log in.</p> <p>If you are having trouble connecting or disconnecting a CloudHSM key store, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html\\\">Troubleshooting an CloudHSM key store</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>External key store</b> </p> <p>When you connect an external key store that uses public endpoint connectivity, KMS tests its ability to communicate with your external key manager by sending a request via the external key store proxy.</p> <p>When you connect to an external key store that uses VPC endpoint service connectivity, KMS establishes the networking elements that it needs to communicate with your external key manager via the external key store proxy. This includes creating an interface endpoint to the VPC endpoint service and a private hosted zone for traffic between KMS and the VPC endpoint service.</p> <p>To connect an external key store, KMS must be able to connect to the external key store proxy, the external key store proxy must be able to communicate with your external key manager, and the external key manager must be available for cryptographic operations.</p> <p>If you are having trouble connecting or disconnecting an external key store, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/xks-troubleshooting.html\\\">Troubleshooting an external key store</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ConnectCustomKeyStore</a> (IAM policy)</p> <p> <b>Related operations</b> </p> <ul> <li> <p> <a>CreateCustomKeyStore</a> </p> </li> <li> <p> <a>DeleteCustomKeyStore</a> </p> </li> <li> <p> <a>DescribeCustomKeyStores</a> </p> </li> <li> <p> <a>DisconnectCustomKeyStore</a> </p> </li> <li> <p> <a>UpdateCustomKeyStore</a> </p> </li> </ul>\"\
    },\
    \"CreateAlias\":{\
      \"name\":\"CreateAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateAliasRequest\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidAliasNameException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Creates a friendly name for a KMS key. </p> <note> <p>Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/abac.html\\\">ABAC for KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> </note> <p>You can use an alias to identify a KMS key in the KMS console, in the <a>DescribeKey</a> operation and in <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a>, such as <a>Encrypt</a> and <a>GenerateDataKey</a>. You can also change the KMS key that's associated with the alias (<a>UpdateAlias</a>) or delete the alias (<a>DeleteAlias</a>) at any time. These operations don't affect the underlying KMS key. </p> <p>You can associate the alias with any customer managed key in the same Amazon Web Services Region. Each alias is associated with only one KMS key at a time, but a KMS key can have multiple aliases. A valid KMS key is required. You can't create an alias without a KMS key.</p> <p>The alias must be unique in the account and Region, but you can have aliases with the same name in different Regions. For detailed information about aliases, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html\\\">Using aliases</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>This operation does not return a response. To get the alias that you created, use the <a>ListAliases</a> operation.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on an alias in a different Amazon Web Services account.</p> <p> <b>Required permissions</b> </p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:CreateAlias</a> on the alias (IAM policy).</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:CreateAlias</a> on the KMS key (key policy).</p> </li> </ul> <p>For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access\\\">Controlling access to aliases</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>DeleteAlias</a> </p> </li> <li> <p> <a>ListAliases</a> </p> </li> <li> <p> <a>UpdateAlias</a> </p> </li> </ul>\"\
    },\
    \"CreateCustomKeyStore\":{\
      \"name\":\"CreateCustomKeyStore\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCustomKeyStoreRequest\"},\
      \"output\":{\"shape\":\"CreateCustomKeyStoreResponse\"},\
      \"errors\":[\
        {\"shape\":\"CloudHsmClusterInUseException\"},\
        {\"shape\":\"CustomKeyStoreNameInUseException\"},\
        {\"shape\":\"CloudHsmClusterNotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"CloudHsmClusterNotActiveException\"},\
        {\"shape\":\"IncorrectTrustAnchorException\"},\
        {\"shape\":\"CloudHsmClusterInvalidConfigurationException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"XksProxyUriInUseException\"},\
        {\"shape\":\"XksProxyUriEndpointInUseException\"},\
        {\"shape\":\"XksProxyUriUnreachableException\"},\
        {\"shape\":\"XksProxyIncorrectAuthenticationCredentialException\"},\
        {\"shape\":\"XksProxyVpcEndpointServiceInUseException\"},\
        {\"shape\":\"XksProxyVpcEndpointServiceNotFoundException\"},\
        {\"shape\":\"XksProxyVpcEndpointServiceInvalidConfigurationException\"},\
        {\"shape\":\"XksProxyInvalidResponseException\"},\
        {\"shape\":\"XksProxyInvalidConfigurationException\"}\
      ],\
      \"documentation\":\"<p>Creates a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a> backed by a key store that you own and manage. When you use a KMS key in a custom key store for a cryptographic operation, the cryptographic operation is actually performed in your key store using your keys. KMS supports <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html\\\">CloudHSM key stores</a> backed by an <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/userguide/clusters.html\\\">CloudHSM cluster</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html\\\">external key stores</a> backed by an external key store proxy and external key manager outside of Amazon Web Services.</p> <p> This operation is part of the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key stores</a> feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.</p> <p>Before you create the custom key store, the required elements must be in place and operational. We recommend that you use the test tools that KMS provides to verify the configuration your external key store proxy. For details about the required elements and verification tests, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore\\\">Assemble the prerequisites (for CloudHSM key stores)</a> or <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keystore.html#xks-requirements\\\">Assemble the prerequisites (for external key stores)</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>To create a custom key store, use the following parameters.</p> <ul> <li> <p>To create an CloudHSM key store, specify the <code>CustomKeyStoreName</code>, <code>CloudHsmClusterId</code>, <code>KeyStorePassword</code>, and <code>TrustAnchorCertificate</code>. The <code>CustomKeyStoreType</code> parameter is optional for CloudHSM key stores. If you include it, set it to the default value, <code>AWS_CLOUDHSM</code>. For help with failures, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html\\\">Troubleshooting an CloudHSM key store</a> in the <i>Key Management Service Developer Guide</i>.</p> </li> <li> <p>To create an external key store, specify the <code>CustomKeyStoreName</code> and a <code>CustomKeyStoreType</code> of <code>EXTERNAL_KEY_STORE</code>. Also, specify values for <code>XksProxyConnectivity</code>, <code>XksProxyAuthenticationCredential</code>, <code>XksProxyUriEndpoint</code>, and <code>XksProxyUriPath</code>. If your <code>XksProxyConnectivity</code> value is <code>VPC_ENDPOINT_SERVICE</code>, specify the <code>XksProxyVpcEndpointServiceName</code> parameter. For help with failures, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/xks-troubleshooting.html\\\">Troubleshooting an external key store</a> in the <i>Key Management Service Developer Guide</i>.</p> </li> </ul> <note> <p>For external key stores:</p> <p>Some external key managers provide a simpler method for creating an external key store. For details, see your external key manager documentation.</p> <p>When creating an external key store in the KMS console, you can upload a JSON-based proxy configuration file with the desired values. You cannot use a proxy configuration with the <code>CreateCustomKeyStore</code> operation. However, you can use the values in the file to help you determine the correct values for the <code>CreateCustomKeyStore</code> parameters.</p> </note> <p>When the operation completes successfully, it returns the ID of the new custom key store. Before you can use your new custom key store, you need to use the <a>ConnectCustomKeyStore</a> operation to connect a new CloudHSM key store to its CloudHSM cluster, or to connect a new external key store to the external key store proxy for your external key manager. Even if you are not going to use your custom key store immediately, you might want to connect it to verify that all settings are correct and then disconnect it until you are ready to use it.</p> <p>For help with failures, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html\\\">Troubleshooting a custom key store</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:CreateCustomKeyStore</a> (IAM policy).</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>ConnectCustomKeyStore</a> </p> </li> <li> <p> <a>DeleteCustomKeyStore</a> </p> </li> <li> <p> <a>DescribeCustomKeyStores</a> </p> </li> <li> <p> <a>DisconnectCustomKeyStore</a> </p> </li> <li> <p> <a>UpdateCustomKeyStore</a> </p> </li> </ul>\"\
    },\
    \"CreateGrant\":{\
      \"name\":\"CreateGrant\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateGrantRequest\"},\
      \"output\":{\"shape\":\"CreateGrantResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Adds a grant to a KMS key. </p> <p>A <i>grant</i> is a policy instrument that allows Amazon Web Services principals to use KMS keys in cryptographic operations. It also can allow them to view a KMS key (<a>DescribeKey</a>) and create and manage grants. When authorizing access to a KMS key, grants are considered along with key policies and IAM policies. Grants are often used for temporary permissions because you can create one, use its permissions, and delete it without changing your key policies or IAM policies. </p> <p>For detailed information about grants, including grant terminology, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html\\\">Grants in KMS</a> in the <i> <i>Key Management Service Developer Guide</i> </i>. For examples of working with grants in several programming languages, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html\\\">Programming grants</a>. </p> <p>The <code>CreateGrant</code> operation returns a <code>GrantToken</code> and a <code>GrantId</code>.</p> <ul> <li> <p>When you create, retire, or revoke a grant, there might be a brief delay, usually less than five minutes, until the grant is available throughout KMS. This state is known as <i>eventual consistency</i>. Once the grant has achieved eventual consistency, the grantee principal can use the permissions in the grant without identifying the grant. </p> <p>However, to use the permissions in the grant immediately, use the <code>GrantToken</code> that <code>CreateGrant</code> returns. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> </li> <li> <p>The <code>CreateGrant</code> operation also returns a <code>GrantId</code>. You can use the <code>GrantId</code> and a key identifier to identify the grant in the <a>RetireGrant</a> and <a>RevokeGrant</a> operations. To find the grant ID, use the <a>ListGrants</a> or <a>ListRetirableGrants</a> operations.</p> </li> </ul> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the <code>KeyId</code> parameter. </p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:CreateGrant</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>ListGrants</a> </p> </li> <li> <p> <a>ListRetirableGrants</a> </p> </li> <li> <p> <a>RetireGrant</a> </p> </li> <li> <p> <a>RevokeGrant</a> </p> </li> </ul>\"\
    },\
    \"CreateKey\":{\
      \"name\":\"CreateKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateKeyRequest\"},\
      \"output\":{\"shape\":\"CreateKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedPolicyDocumentException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"TagException\"},\
        {\"shape\":\"CustomKeyStoreNotFoundException\"},\
        {\"shape\":\"CustomKeyStoreInvalidStateException\"},\
        {\"shape\":\"CloudHsmClusterInvalidConfigurationException\"},\
        {\"shape\":\"XksKeyInvalidConfigurationException\"},\
        {\"shape\":\"XksKeyAlreadyInUseException\"},\
        {\"shape\":\"XksKeyNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Creates a unique customer managed <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms-keys\\\">KMS key</a> in your Amazon Web Services account and Region. You can use a KMS key in cryptographic operations, such as encryption and signing. Some Amazon Web Services services let you use KMS keys that you create and manage to protect your service resources.</p> <p>A KMS key is a logical representation of a cryptographic key. In addition to the key material used in cryptographic operations, a KMS key includes metadata, such as the key ID, key policy, creation date, description, and key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/getting-started.html\\\">Managing keys</a> in the <i>Key Management Service Developer Guide</i> </p> <p>Use the parameters of <code>CreateKey</code> to specify the type of KMS key, the source of its key material, its key policy, description, tags, and other properties.</p> <note> <p>KMS has replaced the term <i>customer master key (CMK)</i> with <i>KMS key</i> and <i>KMS key</i>. The concept has not changed. To prevent breaking changes, KMS is keeping some variations of this term.</p> </note> <p>To create different types of KMS keys, use the following guidance:</p> <dl> <dt>Symmetric encryption KMS key</dt> <dd> <p>By default, <code>CreateKey</code> creates a symmetric encryption KMS key with key material that KMS generates. This is the basic and most widely used type of KMS key, and provides the best performance.</p> <p>To create a symmetric encryption KMS key, you don't need to specify any parameters. The default value for <code>KeySpec</code>, <code>SYMMETRIC_DEFAULT</code>, the default value for <code>KeyUsage</code>, <code>ENCRYPT_DECRYPT</code>, and the default value for <code>Origin</code>, <code>AWS_KMS</code>, create a symmetric encryption KMS key with KMS key material.</p> <p>If you need a key for basic encryption and decryption or you are creating a KMS key to protect your resources in an Amazon Web Services service, create a symmetric encryption KMS key. The key material in a symmetric encryption key never leaves KMS unencrypted. You can use a symmetric encryption KMS key to encrypt and decrypt data up to 4,096 bytes, but they are typically used to generate data keys and data keys pairs. For details, see <a>GenerateDataKey</a> and <a>GenerateDataKeyPair</a>.</p> <p> </p> </dd> <dt>Asymmetric KMS keys</dt> <dd> <p>To create an asymmetric KMS key, use the <code>KeySpec</code> parameter to specify the type of key material in the KMS key. Then, use the <code>KeyUsage</code> parameter to determine whether the KMS key will be used to encrypt and decrypt or sign and verify. You can't change these properties after the KMS key is created.</p> <p>Asymmetric KMS keys contain an RSA key pair, Elliptic Curve (ECC) key pair, or an SM2 key pair (China Regions only). The private key in an asymmetric KMS key never leaves KMS unencrypted. However, you can use the <a>GetPublicKey</a> operation to download the public key so it can be used outside of KMS. KMS keys with RSA or SM2 key pairs can be used to encrypt or decrypt data or sign and verify messages (but not both). KMS keys with ECC key pairs can be used only to sign and verify messages. For information about asymmetric KMS keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Asymmetric KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> </p> </dd> <dt>HMAC KMS key</dt> <dd> <p>To create an HMAC KMS key, set the <code>KeySpec</code> parameter to a key spec value for HMAC KMS keys. Then set the <code>KeyUsage</code> parameter to <code>GENERATE_VERIFY_MAC</code>. You must set the key usage even though <code>GENERATE_VERIFY_MAC</code> is the only valid key usage value for HMAC KMS keys. You can't change these properties after the KMS key is created.</p> <p>HMAC KMS keys are symmetric keys that never leave KMS unencrypted. You can use HMAC keys to generate (<a>GenerateMac</a>) and verify (<a>VerifyMac</a>) HMAC codes for messages up to 4096 bytes.</p> <p> </p> </dd> <dt>Multi-Region primary keys</dt> <dt>Imported key material</dt> <dd> <p>To create a multi-Region <i>primary key</i> in the local Amazon Web Services Region, use the <code>MultiRegion</code> parameter with a value of <code>True</code>. To create a multi-Region <i>replica key</i>, that is, a KMS key with the same key ID and key material as a primary key, but in a different Amazon Web Services Region, use the <a>ReplicateKey</a> operation. To change a replica key to a primary key, and its primary key to a replica key, use the <a>UpdatePrimaryRegion</a> operation.</p> <p>You can create multi-Region KMS keys for all supported KMS key types: symmetric encryption KMS keys, HMAC KMS keys, asymmetric encryption KMS keys, and asymmetric signing KMS keys. You can also create multi-Region keys with imported key material. However, you can't create multi-Region keys in a custom key store.</p> <p>This operation supports <i>multi-Region keys</i>, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html\\\">Multi-Region keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> </p> </dd> <dd> <p>To import your own key material into a KMS key, begin by creating a KMS key with no key material. To do this, use the <code>Origin</code> parameter of <code>CreateKey</code> with a value of <code>EXTERNAL</code>. Next, use <a>GetParametersForImport</a> operation to get a public key and import token. Use the wrapping public key to encrypt your key material. Then, use <a>ImportKeyMaterial</a> with your import token to import the key material. For step-by-step instructions, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing Key Material</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> <p>You can import key material into KMS keys of all supported KMS key types: symmetric encryption KMS keys, HMAC KMS keys, asymmetric encryption KMS keys, and asymmetric signing KMS keys. You can also create multi-Region keys with imported key material. However, you can't import key material into a KMS key in a custom key store.</p> <p>To create a multi-Region primary key with imported key material, use the <code>Origin</code> parameter of <code>CreateKey</code> with a value of <code>EXTERNAL</code> and the <code>MultiRegion</code> parameter with a value of <code>True</code>. To create replicas of the multi-Region primary key, use the <a>ReplicateKey</a> operation. For instructions, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-import.html \\\">Importing key material into multi-Region keys</a>. For more information about multi-Region keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html\\\">Multi-Region keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> </p> </dd> <dt>Custom key store</dt> <dd> <p>A <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a> lets you protect your Amazon Web Services resources using keys in a backing key store that you own and manage. When you request a cryptographic operation with a KMS key in a custom key store, the operation is performed in the backing key store using its cryptographic keys.</p> <p>KMS supports <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html\\\">CloudHSM key stores</a> backed by an CloudHSM cluster and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html\\\">external key stores</a> backed by an external key manager outside of Amazon Web Services. When you create a KMS key in an CloudHSM key store, KMS generates an encryption key in the CloudHSM cluster and associates it with the KMS key. When you create a KMS key in an external key store, you specify an existing encryption key in the external key manager.</p> <note> <p>Some external key managers provide a simpler method for creating a KMS key in an external key store. For details, see your external key manager documentation.</p> </note> <p>Before you create a KMS key in a custom key store, the <code>ConnectionState</code> of the key store must be <code>CONNECTED</code>. To connect the custom key store, use the <a>ConnectCustomKeyStore</a> operation. To find the <code>ConnectionState</code>, use the <a>DescribeCustomKeyStores</a> operation.</p> <p>To create a KMS key in a custom key store, use the <code>CustomKeyStoreId</code>. Use the default <code>KeySpec</code> value, <code>SYMMETRIC_DEFAULT</code>, and the default <code>KeyUsage</code> value, <code>ENCRYPT_DECRYPT</code> to create a symmetric encryption key. No other key type is supported in a custom key store.</p> <p>To create a KMS key in an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html\\\">CloudHSM key store</a>, use the <code>Origin</code> parameter with a value of <code>AWS_CLOUDHSM</code>. The CloudHSM cluster that is associated with the custom key store must have at least two active HSMs in different Availability Zones in the Amazon Web Services Region.</p> <p>To create a KMS key in an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html\\\">external key store</a>, use the <code>Origin</code> parameter with a value of <code>EXTERNAL_KEY_STORE</code> and an <code>XksKeyId</code> parameter that identifies an existing external key.</p> <note> <p>Some external key managers provide a simpler method for creating a KMS key in an external key store. For details, see your external key manager documentation.</p> </note> </dd> </dl> <p> <b>Cross-account use</b>: No. You cannot use this operation to create a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:CreateKey</a> (IAM policy). To use the <code>Tags</code> parameter, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:TagResource</a> (IAM policy). For examples and information about related permissions, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policy-example-create-key\\\">Allow a user to create KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>DescribeKey</a> </p> </li> <li> <p> <a>ListKeys</a> </p> </li> <li> <p> <a>ScheduleKeyDeletion</a> </p> </li> </ul>\"\
    },\
    \"Decrypt\":{\
      \"name\":\"Decrypt\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DecryptRequest\"},\
      \"output\":{\"shape\":\"DecryptResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidCiphertextException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"IncorrectKeyException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Decrypts ciphertext that was encrypted by a KMS key using any of the following operations:</p> <ul> <li> <p> <a>Encrypt</a> </p> </li> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyPair</a> </p> </li> <li> <p> <a>GenerateDataKeyWithoutPlaintext</a> </p> </li> <li> <p> <a>GenerateDataKeyPairWithoutPlaintext</a> </p> </li> </ul> <p>You can use this operation to decrypt ciphertext that was encrypted under a symmetric encryption KMS key or an asymmetric encryption KMS key. When the KMS key is asymmetric, you must specify the KMS key and the encryption algorithm that was used to encrypt the ciphertext. For information about asymmetric KMS keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Asymmetric KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>The <code>Decrypt</code> operation also decrypts ciphertext that was encrypted outside of KMS by the public key in an KMS asymmetric KMS key. However, it cannot decrypt symmetric ciphertext produced by other libraries, such as the <a href=\\\"https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/\\\">Amazon Web Services Encryption SDK</a> or <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html\\\">Amazon S3 client-side encryption</a>. These libraries return a ciphertext format that is incompatible with KMS.</p> <p>If the ciphertext was encrypted under a symmetric encryption KMS key, the <code>KeyId</code> parameter is optional. KMS can get this information from metadata that it adds to the symmetric ciphertext blob. This feature adds durability to your implementation by ensuring that authorized users can decrypt ciphertext decades after it was encrypted, even if they've lost track of the key ID. However, specifying the KMS key is always recommended as a best practice. When you use the <code>KeyId</code> parameter to specify a KMS key, KMS only uses the KMS key you specify. If the ciphertext was encrypted under a different KMS key, the <code>Decrypt</code> operation fails. This practice ensures that you use the KMS key that you intend.</p> <p>Whenever possible, use key policies to give users permission to call the <code>Decrypt</code> operation on a particular KMS key, instead of using &amp;IAM; policies. Otherwise, you might create an &amp;IAM; policy that gives the user <code>Decrypt</code> permission on all KMS keys. This user could decrypt ciphertext that was encrypted by KMS keys in other accounts if the key policy for the cross-account KMS key permits it. If you must use an IAM policy for <code>Decrypt</code> permissions, limit the user to particular KMS keys or particular trusted accounts. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policies-best-practices\\\">Best practices for IAM policies</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <code>Decrypt</code> also supports <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html\\\">Amazon Web Services Nitro Enclaves</a>, which provide an isolated compute environment in Amazon EC2. To call <code>Decrypt</code> for a Nitro enclave, use the <a href=\\\"https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk\\\">Amazon Web Services Nitro Enclaves SDK</a> or any Amazon Web Services SDK. Use the <code>Recipient</code> parameter to provide the attestation document for the enclave. Instead of the plaintext data, the response includes the plaintext data encrypted with the public key from the attestation document (<code>CiphertextForRecipient</code>).For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>..</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. If you use the <code>KeyId</code> parameter to identify a KMS key in a different Amazon Web Services account, specify the key ARN or the alias ARN of the KMS key.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:Decrypt</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>Encrypt</a> </p> </li> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyPair</a> </p> </li> <li> <p> <a>ReEncrypt</a> </p> </li> </ul>\"\
    },\
    \"DeleteAlias\":{\
      \"name\":\"DeleteAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAliasRequest\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified alias. </p> <note> <p>Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/abac.html\\\">ABAC for KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> </note> <p>Because an alias is not a property of a KMS key, you can delete and change the aliases of a KMS key without affecting the KMS key. Also, aliases do not appear in the response from the <a>DescribeKey</a> operation. To get the aliases of all KMS keys, use the <a>ListAliases</a> operation. </p> <p>Each KMS key can have multiple aliases. To change the alias of a KMS key, use <a>DeleteAlias</a> to delete the current alias and <a>CreateAlias</a> to create a new alias. To associate an existing alias with a different KMS key, call <a>UpdateAlias</a>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on an alias in a different Amazon Web Services account.</p> <p> <b>Required permissions</b> </p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:DeleteAlias</a> on the alias (IAM policy).</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:DeleteAlias</a> on the KMS key (key policy).</p> </li> </ul> <p>For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access\\\">Controlling access to aliases</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>CreateAlias</a> </p> </li> <li> <p> <a>ListAliases</a> </p> </li> <li> <p> <a>UpdateAlias</a> </p> </li> </ul>\"\
    },\
    \"DeleteCustomKeyStore\":{\
      \"name\":\"DeleteCustomKeyStore\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCustomKeyStoreRequest\"},\
      \"output\":{\"shape\":\"DeleteCustomKeyStoreResponse\"},\
      \"errors\":[\
        {\"shape\":\"CustomKeyStoreHasCMKsException\"},\
        {\"shape\":\"CustomKeyStoreInvalidStateException\"},\
        {\"shape\":\"CustomKeyStoreNotFoundException\"},\
        {\"shape\":\"KMSInternalException\"}\
      ],\
      \"documentation\":\"<p>Deletes a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>. This operation does not affect any backing elements of the custom key store. It does not delete the CloudHSM cluster that is associated with an CloudHSM key store, or affect any users or keys in the cluster. For an external key store, it does not affect the external key store proxy, external key manager, or any external keys.</p> <p> This operation is part of the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key stores</a> feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.</p> <p>The custom key store that you delete cannot contain any <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys\\\">KMS keys</a>. Before deleting the key store, verify that you will never need to use any of the KMS keys in the key store for any <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a>. Then, use <a>ScheduleKeyDeletion</a> to delete the KMS keys from the key store. After the required waiting period expires and all KMS keys are deleted from the custom key store, use <a>DisconnectCustomKeyStore</a> to disconnect the key store from KMS. Then, you can delete the custom key store.</p> <p>For keys in an CloudHSM key store, the <code>ScheduleKeyDeletion</code> operation makes a best effort to delete the key material from the associated cluster. However, you might need to manually <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key\\\">delete the orphaned key material</a> from the cluster and its backups. KMS never creates, manages, or deletes cryptographic keys in the external key manager associated with an external key store. You must manage them using your external key manager tools.</p> <p>Instead of deleting the custom key store, consider using the <a>DisconnectCustomKeyStore</a> operation to disconnect the custom key store from its backing key store. While the key store is disconnected, you cannot create or use the KMS keys in the key store. But, you do not need to delete KMS keys and you can reconnect a disconnected custom key store at any time.</p> <p>If the operation succeeds, it returns a JSON object with no properties.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:DeleteCustomKeyStore</a> (IAM policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>ConnectCustomKeyStore</a> </p> </li> <li> <p> <a>CreateCustomKeyStore</a> </p> </li> <li> <p> <a>DescribeCustomKeyStores</a> </p> </li> <li> <p> <a>DisconnectCustomKeyStore</a> </p> </li> <li> <p> <a>UpdateCustomKeyStore</a> </p> </li> </ul>\"\
    },\
    \"DeleteImportedKeyMaterial\":{\
      \"name\":\"DeleteImportedKeyMaterial\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteImportedKeyMaterialRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Deletes key material that was previously imported. This operation makes the specified KMS key temporarily unusable. To restore the usability of the KMS key, reimport the same key material. For more information about importing key material into KMS, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing Key Material</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>When the specified KMS key is in the <code>PendingDeletion</code> state, this operation does not change the KMS key's state. Otherwise, it changes the KMS key's state to <code>PendingImport</code>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:DeleteImportedKeyMaterial</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>GetParametersForImport</a> </p> </li> <li> <p> <a>ImportKeyMaterial</a> </p> </li> </ul>\"\
    },\
    \"DescribeCustomKeyStores\":{\
      \"name\":\"DescribeCustomKeyStores\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCustomKeyStoresRequest\"},\
      \"output\":{\"shape\":\"DescribeCustomKeyStoresResponse\"},\
      \"errors\":[\
        {\"shape\":\"CustomKeyStoreNotFoundException\"},\
        {\"shape\":\"InvalidMarkerException\"},\
        {\"shape\":\"KMSInternalException\"}\
      ],\
      \"documentation\":\"<p>Gets information about <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key stores</a> in the account and Region.</p> <p> This operation is part of the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key stores</a> feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.</p> <p>By default, this operation returns information about all custom key stores in the account and Region. To get only information about a particular custom key store, use either the <code>CustomKeyStoreName</code> or <code>CustomKeyStoreId</code> parameter (but not both).</p> <p>To determine whether the custom key store is connected to its CloudHSM cluster or external key store proxy, use the <code>ConnectionState</code> element in the response. If an attempt to connect the custom key store failed, the <code>ConnectionState</code> value is <code>FAILED</code> and the <code>ConnectionErrorCode</code> element in the response indicates the cause of the failure. For help interpreting the <code>ConnectionErrorCode</code>, see <a>CustomKeyStoresListEntry</a>.</p> <p>Custom key stores have a <code>DISCONNECTED</code> connection state if the key store has never been connected or you used the <a>DisconnectCustomKeyStore</a> operation to disconnect it. Otherwise, the connection state is CONNECTED. If your custom key store connection state is <code>CONNECTED</code> but you are having trouble using it, verify that the backing store is active and available. For an CloudHSM key store, verify that the associated CloudHSM cluster is active and contains the minimum number of HSMs required for the operation, if any. For an external key store, verify that the external key store proxy and its associated external key manager are reachable and enabled.</p> <p> For help repairing your CloudHSM key store, see the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html\\\">Troubleshooting CloudHSM key stores</a>. For help repairing your external key store, see the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/xks-troubleshooting.html\\\">Troubleshooting external key stores</a>. Both topics are in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:DescribeCustomKeyStores</a> (IAM policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>ConnectCustomKeyStore</a> </p> </li> <li> <p> <a>CreateCustomKeyStore</a> </p> </li> <li> <p> <a>DeleteCustomKeyStore</a> </p> </li> <li> <p> <a>DisconnectCustomKeyStore</a> </p> </li> <li> <p> <a>UpdateCustomKeyStore</a> </p> </li> </ul>\"\
    },\
    \"DescribeKey\":{\
      \"name\":\"DescribeKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeKeyRequest\"},\
      \"output\":{\"shape\":\"DescribeKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"}\
      ],\
      \"documentation\":\"<p>Provides detailed information about a KMS key. You can run <code>DescribeKey</code> on a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk\\\">customer managed key</a> or an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk\\\">Amazon Web Services managed key</a>.</p> <p>This detailed information includes the key ARN, creation date (and deletion date, if applicable), the key state, and the origin and expiration date (if any) of the key material. It includes fields, like <code>KeySpec</code>, that help you distinguish different types of KMS keys. It also displays the key usage (encryption, signing, or generating and verifying MACs) and the algorithms that the KMS key supports. </p> <p>For <a href=\\\"kms/latest/developerguide/multi-region-keys-overview.html\\\">multi-Region keys</a>, <code>DescribeKey</code> displays the primary key and all related replica keys. For KMS keys in <a href=\\\"kms/latest/developerguide/keystore-cloudhsm.html\\\">CloudHSM key stores</a>, it includes information about the key store, such as the key store ID and the CloudHSM cluster ID. For KMS keys in <a href=\\\"kms/latest/developerguide/keystore-external.html\\\">external key stores</a>, it includes the custom key store ID and the ID of the external key.</p> <p> <code>DescribeKey</code> does not return the following information:</p> <ul> <li> <p>Aliases associated with the KMS key. To get this information, use <a>ListAliases</a>.</p> </li> <li> <p>Whether automatic key rotation is enabled on the KMS key. To get this information, use <a>GetKeyRotationStatus</a>. Also, some key states prevent a KMS key from being automatically rotated. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-how-it-works\\\">How Automatic Key Rotation Works</a> in the <i>Key Management Service Developer Guide</i>.</p> </li> <li> <p>Tags on the KMS key. To get this information, use <a>ListResourceTags</a>.</p> </li> <li> <p>Key policies and grants on the KMS key. To get this information, use <a>GetKeyPolicy</a> and <a>ListGrants</a>.</p> </li> </ul> <p>In general, <code>DescribeKey</code> is a non-mutating operation. It returns data about KMS keys, but doesn't change them. However, Amazon Web Services services use <code>DescribeKey</code> to create <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk\\\">Amazon Web Services managed keys</a> from a <i>predefined Amazon Web Services alias</i> with no key ID.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:DescribeKey</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>GetKeyPolicy</a> </p> </li> <li> <p> <a>GetKeyRotationStatus</a> </p> </li> <li> <p> <a>ListAliases</a> </p> </li> <li> <p> <a>ListGrants</a> </p> </li> <li> <p> <a>ListKeys</a> </p> </li> <li> <p> <a>ListResourceTags</a> </p> </li> <li> <p> <a>ListRetirableGrants</a> </p> </li> </ul>\"\
    },\
    \"DisableKey\":{\
      \"name\":\"DisableKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Sets the state of a KMS key to disabled. This change temporarily prevents use of the KMS key for <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a>. </p> <p>For more information about how key state affects the use of a KMS key, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:DisableKey</a> (key policy)</p> <p> <b>Related operations</b>: <a>EnableKey</a> </p>\"\
    },\
    \"DisableKeyRotation\":{\
      \"name\":\"DisableKeyRotation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableKeyRotationRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"UnsupportedOperationException\"}\
      ],\
      \"documentation\":\"<p>Disables <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html\\\">automatic rotation of the key material</a> of the specified symmetric encryption KMS key.</p> <p>Automatic key rotation is supported only on symmetric encryption KMS keys. You cannot enable automatic rotation of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">asymmetric KMS keys</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html\\\">HMAC KMS keys</a>, KMS keys with <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">imported key material</a>, or KMS keys in a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>. To enable or disable automatic rotation of a set of related <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate\\\">multi-Region keys</a>, set the property on the primary key.</p> <p>You can enable (<a>EnableKeyRotation</a>) and disable automatic rotation of the key material in <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk\\\">customer managed KMS keys</a>. Key material rotation of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk\\\">Amazon Web Services managed KMS keys</a> is not configurable. KMS always rotates the key material for every year. Rotation of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk\\\">Amazon Web Services owned KMS keys</a> varies.</p> <note> <p>In May 2022, KMS changed the rotation schedule for Amazon Web Services managed keys from every three years to every year. For details, see <a>EnableKeyRotation</a>.</p> </note> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:DisableKeyRotation</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>EnableKeyRotation</a> </p> </li> <li> <p> <a>GetKeyRotationStatus</a> </p> </li> </ul>\"\
    },\
    \"DisconnectCustomKeyStore\":{\
      \"name\":\"DisconnectCustomKeyStore\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisconnectCustomKeyStoreRequest\"},\
      \"output\":{\"shape\":\"DisconnectCustomKeyStoreResponse\"},\
      \"errors\":[\
        {\"shape\":\"CustomKeyStoreInvalidStateException\"},\
        {\"shape\":\"CustomKeyStoreNotFoundException\"},\
        {\"shape\":\"KMSInternalException\"}\
      ],\
      \"documentation\":\"<p>Disconnects the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a> from its backing key store. This operation disconnects an CloudHSM key store from its associated CloudHSM cluster or disconnects an external key store from the external key store proxy that communicates with your external key manager.</p> <p> This operation is part of the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key stores</a> feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.</p> <p>While a custom key store is disconnected, you can manage the custom key store and its KMS keys, but you cannot create or use its KMS keys. You can reconnect the custom key store at any time.</p> <note> <p>While a custom key store is disconnected, all attempts to create KMS keys in the custom key store or to use existing KMS keys in <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a> will fail. This action can prevent users from storing and accessing sensitive data.</p> </note> <p>When you disconnect a custom key store, its <code>ConnectionState</code> changes to <code>Disconnected</code>. To find the connection state of a custom key store, use the <a>DescribeCustomKeyStores</a> operation. To reconnect a custom key store, use the <a>ConnectCustomKeyStore</a> operation.</p> <p>If the operation succeeds, it returns a JSON object with no properties.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:DisconnectCustomKeyStore</a> (IAM policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>ConnectCustomKeyStore</a> </p> </li> <li> <p> <a>CreateCustomKeyStore</a> </p> </li> <li> <p> <a>DeleteCustomKeyStore</a> </p> </li> <li> <p> <a>DescribeCustomKeyStores</a> </p> </li> <li> <p> <a>UpdateCustomKeyStore</a> </p> </li> </ul>\"\
    },\
    \"EnableKey\":{\
      \"name\":\"EnableKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Sets the key state of a KMS key to enabled. This allows you to use the KMS key for <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a>. </p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:EnableKey</a> (key policy)</p> <p> <b>Related operations</b>: <a>DisableKey</a> </p>\"\
    },\
    \"EnableKeyRotation\":{\
      \"name\":\"EnableKeyRotation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableKeyRotationRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"UnsupportedOperationException\"}\
      ],\
      \"documentation\":\"<p>Enables <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html\\\">automatic rotation of the key material</a> of the specified symmetric encryption KMS key. </p> <p>When you enable automatic rotation of a<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk\\\">customer managed KMS key</a>, KMS rotates the key material of the KMS key one year (approximately 365 days) from the enable date and every year thereafter. You can monitor rotation of the key material for your KMS keys in CloudTrail and Amazon CloudWatch. To disable rotation of the key material in a customer managed KMS key, use the <a>DisableKeyRotation</a> operation.</p> <p>Automatic key rotation is supported only on <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#symmetric-cmks\\\">symmetric encryption KMS keys</a>. You cannot enable automatic rotation of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">asymmetric KMS keys</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html\\\">HMAC KMS keys</a>, KMS keys with <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">imported key material</a>, or KMS keys in a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>. To enable or disable automatic rotation of a set of related <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate\\\">multi-Region keys</a>, set the property on the primary key. </p> <p>You cannot enable or disable automatic rotation <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk\\\">Amazon Web Services managed KMS keys</a>. KMS always rotates the key material of Amazon Web Services managed keys every year. Rotation of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk\\\">Amazon Web Services owned KMS keys</a> varies.</p> <note> <p>In May 2022, KMS changed the rotation schedule for Amazon Web Services managed keys from every three years (approximately 1,095 days) to every year (approximately 365 days).</p> <p>New Amazon Web Services managed keys are automatically rotated one year after they are created, and approximately every year thereafter. </p> <p>Existing Amazon Web Services managed keys are automatically rotated one year after their most recent rotation, and every year thereafter.</p> </note> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:EnableKeyRotation</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>DisableKeyRotation</a> </p> </li> <li> <p> <a>GetKeyRotationStatus</a> </p> </li> </ul>\"\
    },\
    \"Encrypt\":{\
      \"name\":\"Encrypt\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EncryptRequest\"},\
      \"output\":{\"shape\":\"EncryptResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Encrypts plaintext of up to 4,096 bytes using a KMS key. You can use a symmetric or asymmetric KMS key with a <code>KeyUsage</code> of <code>ENCRYPT_DECRYPT</code>.</p> <p>You can use this operation to encrypt small amounts of arbitrary data, such as a personal identifier or database password, or other sensitive information. You don't need to use the <code>Encrypt</code> operation to encrypt a data key. The <a>GenerateDataKey</a> and <a>GenerateDataKeyPair</a> operations return a plaintext data key and an encrypted copy of that data key.</p> <p>If you use a symmetric encryption KMS key, you can use an encryption context to add additional security to your encryption operation. If you specify an <code>EncryptionContext</code> when encrypting data, you must specify the same encryption context (a case-sensitive exact match) when decrypting the data. Otherwise, the request to decrypt fails with an <code>InvalidCiphertextException</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption Context</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>If you specify an asymmetric KMS key, you must also specify the encryption algorithm. The algorithm must be compatible with the KMS key spec.</p> <important> <p>When you use an asymmetric KMS key to encrypt or reencrypt data, be sure to record the KMS key and encryption algorithm that you choose. You will be required to provide the same KMS key and encryption algorithm when you decrypt the data. If the KMS key and algorithm do not match the values used to encrypt the data, the decrypt operation fails.</p> <p>You are not required to supply the key ID and encryption algorithm when you decrypt with symmetric encryption KMS keys because KMS stores this information in the ciphertext blob. KMS cannot store metadata in ciphertext generated with asymmetric keys. The standard format for asymmetric key ciphertext does not include configurable fields.</p> </important> <p>The maximum size of the data that you can encrypt varies with the type of KMS key and the encryption algorithm that you choose.</p> <ul> <li> <p>Symmetric encryption KMS keys</p> <ul> <li> <p> <code>SYMMETRIC_DEFAULT</code>: 4096 bytes</p> </li> </ul> </li> <li> <p> <code>RSA_2048</code> </p> <ul> <li> <p> <code>RSAES_OAEP_SHA_1</code>: 214 bytes</p> </li> <li> <p> <code>RSAES_OAEP_SHA_256</code>: 190 bytes</p> </li> </ul> </li> <li> <p> <code>RSA_3072</code> </p> <ul> <li> <p> <code>RSAES_OAEP_SHA_1</code>: 342 bytes</p> </li> <li> <p> <code>RSAES_OAEP_SHA_256</code>: 318 bytes</p> </li> </ul> </li> <li> <p> <code>RSA_4096</code> </p> <ul> <li> <p> <code>RSAES_OAEP_SHA_1</code>: 470 bytes</p> </li> <li> <p> <code>RSAES_OAEP_SHA_256</code>: 446 bytes</p> </li> </ul> </li> <li> <p> <code>SM2PKE</code>: 1024 bytes (China Regions only)</p> </li> </ul> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:Encrypt</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>Decrypt</a> </p> </li> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyPair</a> </p> </li> </ul>\"\
    },\
    \"GenerateDataKey\":{\
      \"name\":\"GenerateDataKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GenerateDataKeyRequest\"},\
      \"output\":{\"shape\":\"GenerateDataKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Returns a unique symmetric data key for use outside of KMS. This operation returns a plaintext copy of the data key and a copy that is encrypted under a symmetric encryption KMS key that you specify. The bytes in the plaintext key are random; they are not related to the caller or the KMS key. You can use the plaintext key to encrypt your data outside of KMS and store the encrypted data key with the encrypted data.</p> <p>To generate a data key, specify the symmetric encryption KMS key that will be used to encrypt the data key. You cannot use an asymmetric KMS key to encrypt data keys. To get the type of your KMS key, use the <a>DescribeKey</a> operation.</p> <p>You must also specify the length of the data key. Use either the <code>KeySpec</code> or <code>NumberOfBytes</code> parameters (but not both). For 128-bit and 256-bit data keys, use the <code>KeySpec</code> parameter.</p> <p>To generate a 128-bit SM4 data key (China Regions only), specify a <code>KeySpec</code> value of <code>AES_128</code> or a <code>NumberOfBytes</code> value of <code>16</code>. The symmetric encryption key used in China Regions to encrypt your data key is an SM4 encryption key.</p> <p>To get only an encrypted copy of the data key, use <a>GenerateDataKeyWithoutPlaintext</a>. To generate an asymmetric data key pair, use the <a>GenerateDataKeyPair</a> or <a>GenerateDataKeyPairWithoutPlaintext</a> operation. To get a cryptographically secure random byte string, use <a>GenerateRandom</a>.</p> <p>You can use an optional encryption context to add additional security to the encryption operation. If you specify an <code>EncryptionContext</code>, you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an <code>InvalidCiphertextException</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption Context</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <code>GenerateDataKey</code> also supports <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html\\\">Amazon Web Services Nitro Enclaves</a>, which provide an isolated compute environment in Amazon EC2. To call <code>GenerateDataKey</code> for an Amazon Web Services Nitro enclave, use the <a href=\\\"https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk\\\">Amazon Web Services Nitro Enclaves SDK</a> or any Amazon Web Services SDK. Use the <code>Recipient</code> parameter to provide the attestation document for the enclave. <code>GenerateDataKey</code> returns a copy of the data key encrypted under the specified KMS key, as usual. But instead of a plaintext copy of the data key, the response includes a copy of the data key encrypted under the public key from the attestation document (<code>CiphertextForRecipient</code>). For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>..</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>How to use your data key</b> </p> <p>We recommend that you use the following pattern to encrypt data locally in your application. You can write your own code or use a client-side encryption library, such as the <a href=\\\"https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/\\\">Amazon Web Services Encryption SDK</a>, the <a href=\\\"https://docs.aws.amazon.com/dynamodb-encryption-client/latest/devguide/\\\">Amazon DynamoDB Encryption Client</a>, or <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html\\\">Amazon S3 client-side encryption</a> to do these tasks for you.</p> <p>To encrypt data outside of KMS:</p> <ol> <li> <p>Use the <code>GenerateDataKey</code> operation to get a data key.</p> </li> <li> <p>Use the plaintext data key (in the <code>Plaintext</code> field of the response) to encrypt your data outside of KMS. Then erase the plaintext data key from memory.</p> </li> <li> <p>Store the encrypted data key (in the <code>CiphertextBlob</code> field of the response) with the encrypted data.</p> </li> </ol> <p>To decrypt data outside of KMS:</p> <ol> <li> <p>Use the <a>Decrypt</a> operation to decrypt the encrypted data key. The operation returns a plaintext copy of the data key.</p> </li> <li> <p>Use the plaintext data key to decrypt data outside of KMS, then erase the plaintext data key from memory.</p> </li> </ol> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GenerateDataKey</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>Decrypt</a> </p> </li> <li> <p> <a>Encrypt</a> </p> </li> <li> <p> <a>GenerateDataKeyPair</a> </p> </li> <li> <p> <a>GenerateDataKeyPairWithoutPlaintext</a> </p> </li> <li> <p> <a>GenerateDataKeyWithoutPlaintext</a> </p> </li> </ul>\"\
    },\
    \"GenerateDataKeyPair\":{\
      \"name\":\"GenerateDataKeyPair\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GenerateDataKeyPairRequest\"},\
      \"output\":{\"shape\":\"GenerateDataKeyPairResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Returns a unique asymmetric data key pair for use outside of KMS. This operation returns a plaintext public key, a plaintext private key, and a copy of the private key that is encrypted under the symmetric encryption KMS key you specify. You can use the data key pair to perform asymmetric cryptography and implement digital signatures outside of KMS. The bytes in the keys are random; they not related to the caller or to the KMS key that is used to encrypt the private key. </p> <p>You can use the public key that <code>GenerateDataKeyPair</code> returns to encrypt data or verify a signature outside of KMS. Then, store the encrypted private key with the data. When you are ready to decrypt data or sign a message, you can use the <a>Decrypt</a> operation to decrypt the encrypted private key.</p> <p>To generate a data key pair, you must specify a symmetric encryption KMS key to encrypt the private key in a data key pair. You cannot use an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation. </p> <p>Use the <code>KeyPairSpec</code> parameter to choose an RSA or Elliptic Curve (ECC) data key pair. In China Regions, you can also choose an SM2 data key pair. KMS recommends that you use ECC key pairs for signing, and use RSA and SM2 key pairs for either encryption or signing, but not both. However, KMS cannot enforce any restrictions on the use of data key pairs outside of KMS.</p> <p>If you are using the data key pair to encrypt data, or for any operation where you don't immediately need a private key, consider using the <a>GenerateDataKeyPairWithoutPlaintext</a> operation. <code>GenerateDataKeyPairWithoutPlaintext</code> returns a plaintext public key and an encrypted private key, but omits the plaintext private key that you need only to decrypt ciphertext or sign a message. Later, when you need to decrypt the data or sign a message, use the <a>Decrypt</a> operation to decrypt the encrypted private key in the data key pair.</p> <p> <code>GenerateDataKeyPair</code> returns a unique data key pair for each request. The bytes in the keys are random; they are not related to the caller or the KMS key that is used to encrypt the private key. The public key is a DER-encoded X.509 SubjectPublicKeyInfo, as specified in <a href=\\\"https://tools.ietf.org/html/rfc5280\\\">RFC 5280</a>. The private key is a DER-encoded PKCS8 PrivateKeyInfo, as specified in <a href=\\\"https://tools.ietf.org/html/rfc5958\\\">RFC 5958</a>.</p> <p> <code>GenerateDataKeyPair</code> also supports <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html\\\">Amazon Web Services Nitro Enclaves</a>, which provide an isolated compute environment in Amazon EC2. To call <code>GenerateDataKeyPair</code> for an Amazon Web Services Nitro enclave, use the <a href=\\\"https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk\\\">Amazon Web Services Nitro Enclaves SDK</a> or any Amazon Web Services SDK. Use the <code>Recipient</code> parameter to provide the attestation document for the enclave. <code>GenerateDataKeyPair</code> returns the public data key and a copy of the private data key encrypted under the specified KMS key, as usual. But instead of a plaintext copy of the private data key (<code>PrivateKeyPlaintext</code>), the response includes a copy of the private data key encrypted under the public key from the attestation document (<code>CiphertextForRecipient</code>). For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>..</p> <p>You can use an optional encryption context to add additional security to the encryption operation. If you specify an <code>EncryptionContext</code>, you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an <code>InvalidCiphertextException</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption Context</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GenerateDataKeyPair</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>Decrypt</a> </p> </li> <li> <p> <a>Encrypt</a> </p> </li> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyPairWithoutPlaintext</a> </p> </li> <li> <p> <a>GenerateDataKeyWithoutPlaintext</a> </p> </li> </ul>\"\
    },\
    \"GenerateDataKeyPairWithoutPlaintext\":{\
      \"name\":\"GenerateDataKeyPairWithoutPlaintext\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GenerateDataKeyPairWithoutPlaintextRequest\"},\
      \"output\":{\"shape\":\"GenerateDataKeyPairWithoutPlaintextResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Returns a unique asymmetric data key pair for use outside of KMS. This operation returns a plaintext public key and a copy of the private key that is encrypted under the symmetric encryption KMS key you specify. Unlike <a>GenerateDataKeyPair</a>, this operation does not return a plaintext private key. The bytes in the keys are random; they are not related to the caller or to the KMS key that is used to encrypt the private key. </p> <p>You can use the public key that <code>GenerateDataKeyPairWithoutPlaintext</code> returns to encrypt data or verify a signature outside of KMS. Then, store the encrypted private key with the data. When you are ready to decrypt data or sign a message, you can use the <a>Decrypt</a> operation to decrypt the encrypted private key.</p> <p>To generate a data key pair, you must specify a symmetric encryption KMS key to encrypt the private key in a data key pair. You cannot use an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation. </p> <p>Use the <code>KeyPairSpec</code> parameter to choose an RSA or Elliptic Curve (ECC) data key pair. In China Regions, you can also choose an SM2 data key pair. KMS recommends that you use ECC key pairs for signing, and use RSA and SM2 key pairs for either encryption or signing, but not both. However, KMS cannot enforce any restrictions on the use of data key pairs outside of KMS.</p> <p> <code>GenerateDataKeyPairWithoutPlaintext</code> returns a unique data key pair for each request. The bytes in the key are not related to the caller or KMS key that is used to encrypt the private key. The public key is a DER-encoded X.509 SubjectPublicKeyInfo, as specified in <a href=\\\"https://tools.ietf.org/html/rfc5280\\\">RFC 5280</a>.</p> <p>You can use an optional encryption context to add additional security to the encryption operation. If you specify an <code>EncryptionContext</code>, you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an <code>InvalidCiphertextException</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption Context</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GenerateDataKeyPairWithoutPlaintext</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>Decrypt</a> </p> </li> <li> <p> <a>Encrypt</a> </p> </li> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyPair</a> </p> </li> <li> <p> <a>GenerateDataKeyWithoutPlaintext</a> </p> </li> </ul>\"\
    },\
    \"GenerateDataKeyWithoutPlaintext\":{\
      \"name\":\"GenerateDataKeyWithoutPlaintext\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GenerateDataKeyWithoutPlaintextRequest\"},\
      \"output\":{\"shape\":\"GenerateDataKeyWithoutPlaintextResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Returns a unique symmetric data key for use outside of KMS. This operation returns a data key that is encrypted under a symmetric encryption KMS key that you specify. The bytes in the key are random; they are not related to the caller or to the KMS key.</p> <p> <code>GenerateDataKeyWithoutPlaintext</code> is identical to the <a>GenerateDataKey</a> operation except that it does not return a plaintext copy of the data key. </p> <p>This operation is useful for systems that need to encrypt data at some point, but not immediately. When you need to encrypt the data, you call the <a>Decrypt</a> operation on the encrypted copy of the key.</p> <p>It's also useful in distributed systems with different levels of trust. For example, you might store encrypted data in containers. One component of your system creates new containers and stores an encrypted data key with each container. Then, a different component puts the data into the containers. That component first decrypts the data key, uses the plaintext data key to encrypt data, puts the encrypted data into the container, and then destroys the plaintext data key. In this system, the component that creates the containers never sees the plaintext data key.</p> <p>To request an asymmetric data key pair, use the <a>GenerateDataKeyPair</a> or <a>GenerateDataKeyPairWithoutPlaintext</a> operations.</p> <p>To generate a data key, you must specify the symmetric encryption KMS key that is used to encrypt the data key. You cannot use an asymmetric KMS key or a key in a custom key store to generate a data key. To get the type of your KMS key, use the <a>DescribeKey</a> operation.</p> <p>You must also specify the length of the data key. Use either the <code>KeySpec</code> or <code>NumberOfBytes</code> parameters (but not both). For 128-bit and 256-bit data keys, use the <code>KeySpec</code> parameter.</p> <p>To generate an SM4 data key (China Regions only), specify a <code>KeySpec</code> value of <code>AES_128</code> or <code>NumberOfBytes</code> value of <code>16</code>. The symmetric encryption key used in China Regions to encrypt your data key is an SM4 encryption key.</p> <p>If the operation succeeds, you will find the encrypted copy of the data key in the <code>CiphertextBlob</code> field.</p> <p>You can use an optional encryption context to add additional security to the encryption operation. If you specify an <code>EncryptionContext</code>, you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an <code>InvalidCiphertextException</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption Context</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GenerateDataKeyWithoutPlaintext</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>Decrypt</a> </p> </li> <li> <p> <a>Encrypt</a> </p> </li> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyPair</a> </p> </li> <li> <p> <a>GenerateDataKeyPairWithoutPlaintext</a> </p> </li> </ul>\"\
    },\
    \"GenerateMac\":{\
      \"name\":\"GenerateMac\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GenerateMacRequest\"},\
      \"output\":{\"shape\":\"GenerateMacResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Generates a hash-based message authentication code (HMAC) for a message using an HMAC KMS key and a MAC algorithm that the key supports. HMAC KMS keys and the HMAC algorithms that KMS uses conform to industry standards defined in <a href=\\\"https://datatracker.ietf.org/doc/html/rfc2104\\\">RFC 2104</a>.</p> <p>You can use value that GenerateMac returns in the <a>VerifyMac</a> operation to demonstrate that the original message has not changed. Also, because a secret key is used to create the hash, you can verify that the party that generated the hash has the required secret key. You can also use the raw result to implement HMAC-based algorithms such as key derivation functions. This operation is part of KMS support for HMAC KMS keys. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html\\\">HMAC keys in KMS</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> <note> <p>Best practices recommend that you limit the time during which any signing mechanism, including an HMAC, is effective. This deters an attack where the actor uses a signed message to establish validity repeatedly or long after the message is superseded. HMAC tags do not include a timestamp, but you can include a timestamp in the token or message to help you detect when its time to refresh the HMAC. </p> </note> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter. </p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GenerateMac</a> (key policy)</p> <p> <b>Related operations</b>: <a>VerifyMac</a> </p>\"\
    },\
    \"GenerateRandom\":{\
      \"name\":\"GenerateRandom\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GenerateRandomRequest\"},\
      \"output\":{\"shape\":\"GenerateRandomResponse\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"CustomKeyStoreNotFoundException\"},\
        {\"shape\":\"CustomKeyStoreInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Returns a random byte string that is cryptographically secure.</p> <p>You must use the <code>NumberOfBytes</code> parameter to specify the length of the random byte string. There is no default value for string length.</p> <p>By default, the random byte string is generated in KMS. To generate the byte string in the CloudHSM cluster associated with an CloudHSM key store, use the <code>CustomKeyStoreId</code> parameter.</p> <p> <code>GenerateRandom</code> also supports <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html\\\">Amazon Web Services Nitro Enclaves</a>, which provide an isolated compute environment in Amazon EC2. To call <code>GenerateRandom</code> for a Nitro enclave, use the <a href=\\\"https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk\\\">Amazon Web Services Nitro Enclaves SDK</a> or any Amazon Web Services SDK. Use the <code>Recipient</code> parameter to provide the attestation document for the enclave. Instead of plaintext bytes, the response includes the plaintext bytes encrypted under the public key from the attestation document (<code>CiphertextForRecipient</code>).For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>For more information about entropy and random number generation, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/cryptographic-details/\\\">Key Management Service Cryptographic Details</a>.</p> <p> <b>Cross-account use</b>: Not applicable. <code>GenerateRandom</code> does not use any account-specific resources, such as KMS keys.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GenerateRandom</a> (IAM policy)</p>\"\
    },\
    \"GetKeyPolicy\":{\
      \"name\":\"GetKeyPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetKeyPolicyRequest\"},\
      \"output\":{\"shape\":\"GetKeyPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Gets a key policy attached to the specified KMS key.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GetKeyPolicy</a> (key policy)</p> <p> <b>Related operations</b>: <a>PutKeyPolicy</a> </p>\"\
    },\
    \"GetKeyRotationStatus\":{\
      \"name\":\"GetKeyRotationStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetKeyRotationStatusRequest\"},\
      \"output\":{\"shape\":\"GetKeyRotationStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"UnsupportedOperationException\"}\
      ],\
      \"documentation\":\"<p>Gets a Boolean value that indicates whether <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html\\\">automatic rotation of the key material</a> is enabled for the specified KMS key.</p> <p>When you enable automatic rotation for <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk\\\">customer managed KMS keys</a>, KMS rotates the key material of the KMS key one year (approximately 365 days) from the enable date and every year thereafter. You can monitor rotation of the key material for your KMS keys in CloudTrail and Amazon CloudWatch.</p> <p>Automatic key rotation is supported only on <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#symmetric-cmks\\\">symmetric encryption KMS keys</a>. You cannot enable automatic rotation of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">asymmetric KMS keys</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html\\\">HMAC KMS keys</a>, KMS keys with <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">imported key material</a>, or KMS keys in a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>. To enable or disable automatic rotation of a set of related <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate\\\">multi-Region keys</a>, set the property on the primary key..</p> <p>You can enable (<a>EnableKeyRotation</a>) and disable automatic rotation (<a>DisableKeyRotation</a>) of the key material in customer managed KMS keys. Key material rotation of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk\\\">Amazon Web Services managed KMS keys</a> is not configurable. KMS always rotates the key material in Amazon Web Services managed KMS keys every year. The key rotation status for Amazon Web Services managed KMS keys is always <code>true</code>.</p> <note> <p>In May 2022, KMS changed the rotation schedule for Amazon Web Services managed keys from every three years to every year. For details, see <a>EnableKeyRotation</a>.</p> </note> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <ul> <li> <p>Disabled: The key rotation status does not change when you disable a KMS key. However, while the KMS key is disabled, KMS does not rotate the key material. When you re-enable the KMS key, rotation resumes. If the key material in the re-enabled KMS key hasn't been rotated in one year, KMS rotates it immediately, and every year thereafter. If it's been less than a year since the key material in the re-enabled KMS key was rotated, the KMS key resumes its prior rotation schedule.</p> </li> <li> <p>Pending deletion: While a KMS key is pending deletion, its key rotation status is <code>false</code> and KMS does not rotate the key material. If you cancel the deletion, the original key rotation status returns to <code>true</code>.</p> </li> </ul> <p> <b>Cross-account use</b>: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GetKeyRotationStatus</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>DisableKeyRotation</a> </p> </li> <li> <p> <a>EnableKeyRotation</a> </p> </li> </ul>\"\
    },\
    \"GetParametersForImport\":{\
      \"name\":\"GetParametersForImport\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetParametersForImportRequest\"},\
      \"output\":{\"shape\":\"GetParametersForImportResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Returns the public key and an import token you need to import or reimport key material for a KMS key. </p> <p>By default, KMS keys are created with key material that KMS generates. This operation supports <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing key material</a>, an advanced feature that lets you generate and import the cryptographic key material for a KMS key. For more information about importing key material into KMS, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing key material</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>Before calling <code>GetParametersForImport</code>, use the <a>CreateKey</a> operation with an <code>Origin</code> value of <code>EXTERNAL</code> to create a KMS key with no key material. You can import key material for a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, or asymmetric signing KMS key. You can also import key material into a <a href=\\\"kms/latest/developerguide/multi-region-keys-overview.html\\\">multi-Region key</a> of any supported type. However, you can't import key material into a KMS key in a <a href=\\\"kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>. You can also use <code>GetParametersForImport</code> to get a public key and import token to <a href=\\\"kms/latest/developerguide/importing-keys.html#reimport-key-material\\\">reimport the original key material</a> into a KMS key whose key material expired or was deleted.</p> <p> <code>GetParametersForImport</code> returns the items that you need to import your key material.</p> <ul> <li> <p>The public key (or \\\"wrapping key\\\") of an RSA key pair that KMS generates.</p> <p>You will use this public key to encrypt (\\\"wrap\\\") your key material while it's in transit to KMS. </p> </li> <li> <p>A import token that ensures that KMS can decrypt your key material and associate it with the correct KMS key.</p> </li> </ul> <p>The public key and its import token are permanently linked and must be used together. Each public key and import token set is valid for 24 hours. The expiration date and time appear in the <code>ParametersValidTo</code> field in the <code>GetParametersForImport</code> response. You cannot use an expired public key or import token in an <a>ImportKeyMaterial</a> request. If your key and token expire, send another <code>GetParametersForImport</code> request.</p> <p> <code>GetParametersForImport</code> requires the following information:</p> <ul> <li> <p>The key ID of the KMS key for which you are importing the key material.</p> </li> <li> <p>The key spec of the public key (\\\"wrapping key\\\") that you will use to encrypt your key material during import.</p> </li> <li> <p>The wrapping algorithm that you will use with the public key to encrypt your key material.</p> </li> </ul> <p>You can use the same or a different public key spec and wrapping algorithm each time you import or reimport the same key material. </p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GetParametersForImport</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>ImportKeyMaterial</a> </p> </li> <li> <p> <a>DeleteImportedKeyMaterial</a> </p> </li> </ul>\"\
    },\
    \"GetPublicKey\":{\
      \"name\":\"GetPublicKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetPublicKeyRequest\"},\
      \"output\":{\"shape\":\"GetPublicKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Returns the public key of an asymmetric KMS key. Unlike the private key of a asymmetric KMS key, which never leaves KMS unencrypted, callers with <code>kms:GetPublicKey</code> permission can download the public key of an asymmetric KMS key. You can share the public key to allow others to encrypt messages and verify signatures outside of KMS. For information about asymmetric KMS keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Asymmetric KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>You do not need to download the public key. Instead, you can use the public key within KMS by calling the <a>Encrypt</a>, <a>ReEncrypt</a>, or <a>Verify</a> operations with the identifier of an asymmetric KMS key. When you use the public key within KMS, you benefit from the authentication, authorization, and logging that are part of every KMS operation. You also reduce of risk of encrypting data that cannot be decrypted. These features are not effective outside of KMS.</p> <p>To help you use the public key safely outside of KMS, <code>GetPublicKey</code> returns important information about the public key in the response, including:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeySpec\\\">KeySpec</a>: The type of key material in the public key, such as <code>RSA_4096</code> or <code>ECC_NIST_P521</code>.</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeyUsage\\\">KeyUsage</a>: Whether the key is used for encryption or signing.</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-EncryptionAlgorithms\\\">EncryptionAlgorithms</a> or <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-SigningAlgorithms\\\">SigningAlgorithms</a>: A list of the encryption algorithms or the signing algorithms for the key.</p> </li> </ul> <p>Although KMS cannot enforce these restrictions on external operations, it is crucial that you use this information to prevent the public key from being used improperly. For example, you can prevent a public signing key from being used encrypt data, or prevent a public key from being used with an encryption algorithm that is not supported by KMS. You can also avoid errors, such as using the wrong signing algorithm in a verification operation.</p> <p>To verify a signature outside of KMS with an SM2 public key (China Regions only), you must specify the distinguishing ID. By default, KMS uses <code>1234567812345678</code> as the distinguishing ID. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification\\\">Offline verification with SM2 key pairs</a>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:GetPublicKey</a> (key policy)</p> <p> <b>Related operations</b>: <a>CreateKey</a> </p>\"\
    },\
    \"ImportKeyMaterial\":{\
      \"name\":\"ImportKeyMaterial\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ImportKeyMaterialRequest\"},\
      \"output\":{\"shape\":\"ImportKeyMaterialResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"InvalidCiphertextException\"},\
        {\"shape\":\"IncorrectKeyMaterialException\"},\
        {\"shape\":\"ExpiredImportTokenException\"},\
        {\"shape\":\"InvalidImportTokenException\"}\
      ],\
      \"documentation\":\"<p>Imports or reimports key material into an existing KMS key that was created without key material. <code>ImportKeyMaterial</code> also sets the expiration model and expiration date of the imported key material.</p> <p>By default, KMS keys are created with key material that KMS generates. This operation supports <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing key material</a>, an advanced feature that lets you generate and import the cryptographic key material for a KMS key. For more information about importing key material into KMS, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing key material</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>After you successfully import key material into a KMS key, you can <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#reimport-key-material\\\">reimport the same key material</a> into that KMS key, but you cannot import different key material. You might reimport key material to replace key material that expired or key material that you deleted. You might also reimport key material to change the expiration model or expiration date of the key material. Before reimporting key material, if necessary, call <a>DeleteImportedKeyMaterial</a> to delete the current imported key material. </p> <p>Each time you import key material into KMS, you can determine whether (<code>ExpirationModel</code>) and when (<code>ValidTo</code>) the key material expires. To change the expiration of your key material, you must import it again, either by calling <code>ImportKeyMaterial</code> or using the <a href=\\\"kms/latest/developerguide/importing-keys-import-key-material.html#importing-keys-import-key-material-console\\\">import features</a> of the KMS console.</p> <p>Before calling <code>ImportKeyMaterial</code>:</p> <ul> <li> <p>Create or identify a KMS key with no key material. The KMS key must have an <code>Origin</code> value of <code>EXTERNAL</code>, which indicates that the KMS key is designed for imported key material. </p> <p>To create an new KMS key for imported key material, call the <a>CreateKey</a> operation with an <code>Origin</code> value of <code>EXTERNAL</code>. You can create a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, or asymmetric signing KMS key. You can also import key material into a <a href=\\\"kms/latest/developerguide/multi-region-keys-overview.html\\\">multi-Region key</a> of any supported type. However, you can't import key material into a KMS key in a <a href=\\\"kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>.</p> </li> <li> <p>Use the <a>DescribeKey</a> operation to verify that the <code>KeyState</code> of the KMS key is <code>PendingImport</code>, which indicates that the KMS key has no key material. </p> <p>If you are reimporting the same key material into an existing KMS key, you might need to call the <a>DeleteImportedKeyMaterial</a> to delete its existing key material.</p> </li> <li> <p>Call the <a>GetParametersForImport</a> operation to get a public key and import token set for importing key material. </p> </li> <li> <p>Use the public key in the <a>GetParametersForImport</a> response to encrypt your key material.</p> </li> </ul> <p> Then, in an <code>ImportKeyMaterial</code> request, you submit your encrypted key material and import token. When calling this operation, you must specify the following values:</p> <ul> <li> <p>The key ID or key ARN of the KMS key to associate with the imported key material. Its <code>Origin</code> must be <code>EXTERNAL</code> and its <code>KeyState</code> must be <code>PendingImport</code>. You cannot perform this operation on a KMS key in a <a href=\\\"kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>, or on a KMS key in a different Amazon Web Services account. To get the <code>Origin</code> and <code>KeyState</code> of a KMS key, call <a>DescribeKey</a>.</p> </li> <li> <p>The encrypted key material. </p> </li> <li> <p>The import token that <a>GetParametersForImport</a> returned. You must use a public key and token from the same <code>GetParametersForImport</code> response.</p> </li> <li> <p>Whether the key material expires (<code>ExpirationModel</code>) and, if so, when (<code>ValidTo</code>). For help with this choice, see <a href=\\\"https://docs.aws.amazon.com/en_us/kms/latest/developerguide/importing-keys.html#importing-keys-expiration\\\">Setting an expiration time</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>If you set an expiration date, KMS deletes the key material from the KMS key on the specified date, making the KMS key unusable. To use the KMS key in cryptographic operations again, you must reimport the same key material. However, you can delete and reimport the key material at any time, including before the key material expires. Each time you reimport, you can eliminate or reset the expiration time.</p> </li> </ul> <p>When this operation is successful, the key state of the KMS key changes from <code>PendingImport</code> to <code>Enabled</code>, and you can use the KMS key in cryptographic operations.</p> <p>If this operation fails, use the exception to help determine the problem. If the error is related to the key material, the import token, or wrapping key, use <a>GetParametersForImport</a> to get a new public key and import token for the KMS key and repeat the import procedure. For help, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#importing-keys-overview\\\">How To Import Key Material</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ImportKeyMaterial</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>DeleteImportedKeyMaterial</a> </p> </li> <li> <p> <a>GetParametersForImport</a> </p> </li> </ul>\"\
    },\
    \"ListAliases\":{\
      \"name\":\"ListAliases\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListAliasesRequest\"},\
      \"output\":{\"shape\":\"ListAliasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidMarkerException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of aliases in the caller's Amazon Web Services account and region. For more information about aliases, see <a>CreateAlias</a>.</p> <p>By default, the <code>ListAliases</code> operation returns all aliases in the account and region. To get only the aliases associated with a particular KMS key, use the <code>KeyId</code> parameter.</p> <p>The <code>ListAliases</code> response can include aliases that you created and associated with your customer managed keys, and aliases that Amazon Web Services created and associated with Amazon Web Services managed keys in your account. You can recognize Amazon Web Services aliases because their names have the format <code>aws/&lt;service-name&gt;</code>, such as <code>aws/dynamodb</code>.</p> <p>The response might also include aliases that have no <code>TargetKeyId</code> field. These are predefined aliases that Amazon Web Services has created but has not yet associated with a KMS key. Aliases that Amazon Web Services creates in your account, including predefined aliases, do not count against your <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#aliases-limit\\\">KMS aliases quota</a>.</p> <p> <b>Cross-account use</b>: No. <code>ListAliases</code> does not return aliases in other Amazon Web Services accounts.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ListAliases</a> (IAM policy)</p> <p>For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access\\\">Controlling access to aliases</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>CreateAlias</a> </p> </li> <li> <p> <a>DeleteAlias</a> </p> </li> <li> <p> <a>UpdateAlias</a> </p> </li> </ul>\"\
    },\
    \"ListGrants\":{\
      \"name\":\"ListGrants\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListGrantsRequest\"},\
      \"output\":{\"shape\":\"ListGrantsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidMarkerException\"},\
        {\"shape\":\"InvalidGrantIdException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of all grants for the specified KMS key. </p> <p>You must specify the KMS key in all requests. You can filter the grant list by grant ID or grantee principal.</p> <p>For detailed information about grants, including grant terminology, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html\\\">Grants in KMS</a> in the <i> <i>Key Management Service Developer Guide</i> </i>. For examples of working with grants in several programming languages, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html\\\">Programming grants</a>. </p> <note> <p>The <code>GranteePrincipal</code> field in the <code>ListGrants</code> response usually contains the user or role designated as the grantee principal in the grant. However, when the grantee principal in the grant is an Amazon Web Services service, the <code>GranteePrincipal</code> field contains the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services\\\">service principal</a>, which might represent several different grantee principals.</p> </note> <p> <b>Cross-account use</b>: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ListGrants</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>CreateGrant</a> </p> </li> <li> <p> <a>ListRetirableGrants</a> </p> </li> <li> <p> <a>RetireGrant</a> </p> </li> <li> <p> <a>RevokeGrant</a> </p> </li> </ul>\"\
    },\
    \"ListKeyPolicies\":{\
      \"name\":\"ListKeyPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListKeyPoliciesRequest\"},\
      \"output\":{\"shape\":\"ListKeyPoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Gets the names of the key policies that are attached to a KMS key. This operation is designed to get policy names that you can use in a <a>GetKeyPolicy</a> operation. However, the only valid policy name is <code>default</code>. </p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ListKeyPolicies</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>GetKeyPolicy</a> </p> </li> <li> <p> <a>PutKeyPolicy</a> </p> </li> </ul>\"\
    },\
    \"ListKeys\":{\
      \"name\":\"ListKeys\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListKeysRequest\"},\
      \"output\":{\"shape\":\"ListKeysResponse\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"InvalidMarkerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of all KMS keys in the caller's Amazon Web Services account and Region.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ListKeys</a> (IAM policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>CreateKey</a> </p> </li> <li> <p> <a>DescribeKey</a> </p> </li> <li> <p> <a>ListAliases</a> </p> </li> <li> <p> <a>ListResourceTags</a> </p> </li> </ul>\"\
    },\
    \"ListResourceTags\":{\
      \"name\":\"ListResourceTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListResourceTagsRequest\"},\
      \"output\":{\"shape\":\"ListResourceTagsResponse\"},\
      \"errors\":[\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"InvalidMarkerException\"}\
      ],\
      \"documentation\":\"<p>Returns all tags on the specified KMS key.</p> <p>For general information about tags, including the format and syntax, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a> in the <i>Amazon Web Services General Reference</i>. For information about using tags in KMS, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html\\\">Tagging keys</a>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ListResourceTags</a> (key policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>CreateKey</a> </p> </li> <li> <p> <a>ReplicateKey</a> </p> </li> <li> <p> <a>TagResource</a> </p> </li> <li> <p> <a>UntagResource</a> </p> </li> </ul>\"\
    },\
    \"ListRetirableGrants\":{\
      \"name\":\"ListRetirableGrants\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListRetirableGrantsRequest\"},\
      \"output\":{\"shape\":\"ListGrantsResponse\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidMarkerException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all grants in the Amazon Web Services account and Region that have the specified retiring principal. </p> <p>You can specify any principal in your Amazon Web Services account. The grants that are returned include grants for KMS keys in your Amazon Web Services account and other Amazon Web Services accounts. You might use this operation to determine which grants you may retire. To retire a grant, use the <a>RetireGrant</a> operation.</p> <p>For detailed information about grants, including grant terminology, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html\\\">Grants in KMS</a> in the <i> <i>Key Management Service Developer Guide</i> </i>. For examples of working with grants in several programming languages, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html\\\">Programming grants</a>. </p> <p> <b>Cross-account use</b>: You must specify a principal in your Amazon Web Services account. However, this operation can return grants in any Amazon Web Services account. You do not need <code>kms:ListRetirableGrants</code> permission (or any other additional permission) in any Amazon Web Services account other than your own.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ListRetirableGrants</a> (IAM policy) in your Amazon Web Services account.</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>CreateGrant</a> </p> </li> <li> <p> <a>ListGrants</a> </p> </li> <li> <p> <a>RetireGrant</a> </p> </li> <li> <p> <a>RevokeGrant</a> </p> </li> </ul>\"\
    },\
    \"PutKeyPolicy\":{\
      \"name\":\"PutKeyPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutKeyPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"MalformedPolicyDocumentException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"UnsupportedOperationException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Attaches a key policy to the specified KMS key. </p> <p>For more information about key policies, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">Key Policies</a> in the <i>Key Management Service Developer Guide</i>. For help writing and formatting a JSON policy document, see the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html\\\">IAM JSON Policy Reference</a> in the <i> <i>Identity and Access Management User Guide</i> </i>. For examples of adding a key policy in multiple programming languages, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-key-policies.html#put-policy\\\">Setting a key policy</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:PutKeyPolicy</a> (key policy)</p> <p> <b>Related operations</b>: <a>GetKeyPolicy</a> </p>\"\
    },\
    \"ReEncrypt\":{\
      \"name\":\"ReEncrypt\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReEncryptRequest\"},\
      \"output\":{\"shape\":\"ReEncryptResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidCiphertextException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"IncorrectKeyException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Decrypts ciphertext and then reencrypts it entirely within KMS. You can use this operation to change the KMS key under which data is encrypted, such as when you <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-manually\\\">manually rotate</a> a KMS key or change the KMS key that protects a ciphertext. You can also use it to reencrypt ciphertext under the same KMS key, such as to change the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">encryption context</a> of a ciphertext.</p> <p>The <code>ReEncrypt</code> operation can decrypt ciphertext that was encrypted by using a KMS key in an KMS operation, such as <a>Encrypt</a> or <a>GenerateDataKey</a>. It can also decrypt ciphertext that was encrypted by using the public key of an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks\\\">asymmetric KMS key</a> outside of KMS. However, it cannot decrypt ciphertext produced by other libraries, such as the <a href=\\\"https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/\\\">Amazon Web Services Encryption SDK</a> or <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html\\\">Amazon S3 client-side encryption</a>. These libraries return a ciphertext format that is incompatible with KMS.</p> <p>When you use the <code>ReEncrypt</code> operation, you need to provide information for the decrypt operation and the subsequent encrypt operation.</p> <ul> <li> <p>If your ciphertext was encrypted under an asymmetric KMS key, you must use the <code>SourceKeyId</code> parameter to identify the KMS key that encrypted the ciphertext. You must also supply the encryption algorithm that was used. This information is required to decrypt the data.</p> </li> <li> <p>If your ciphertext was encrypted under a symmetric encryption KMS key, the <code>SourceKeyId</code> parameter is optional. KMS can get this information from metadata that it adds to the symmetric ciphertext blob. This feature adds durability to your implementation by ensuring that authorized users can decrypt ciphertext decades after it was encrypted, even if they've lost track of the key ID. However, specifying the source KMS key is always recommended as a best practice. When you use the <code>SourceKeyId</code> parameter to specify a KMS key, KMS uses only the KMS key you specify. If the ciphertext was encrypted under a different KMS key, the <code>ReEncrypt</code> operation fails. This practice ensures that you use the KMS key that you intend.</p> </li> <li> <p>To reencrypt the data, you must use the <code>DestinationKeyId</code> parameter to specify the KMS key that re-encrypts the data after it is decrypted. If the destination KMS key is an asymmetric KMS key, you must also provide the encryption algorithm. The algorithm that you choose must be compatible with the KMS key.</p> <important> <p>When you use an asymmetric KMS key to encrypt or reencrypt data, be sure to record the KMS key and encryption algorithm that you choose. You will be required to provide the same KMS key and encryption algorithm when you decrypt the data. If the KMS key and algorithm do not match the values used to encrypt the data, the decrypt operation fails.</p> <p>You are not required to supply the key ID and encryption algorithm when you decrypt with symmetric encryption KMS keys because KMS stores this information in the ciphertext blob. KMS cannot store metadata in ciphertext generated with asymmetric keys. The standard format for asymmetric key ciphertext does not include configurable fields.</p> </important> </li> </ul> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. The source KMS key and destination KMS key can be in different Amazon Web Services accounts. Either or both KMS keys can be in a different account than the caller. To specify a KMS key in a different account, you must use its key ARN or alias ARN.</p> <p> <b>Required permissions</b>:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ReEncryptFrom</a> permission on the source KMS key (key policy)</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:ReEncryptTo</a> permission on the destination KMS key (key policy)</p> </li> </ul> <p>To permit reencryption from or to a KMS key, include the <code>\\\"kms:ReEncrypt*\\\"</code> permission in your <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">key policy</a>. This permission is automatically included in the key policy when you use the console to create a KMS key. But you must include it manually when you create a KMS key programmatically or when you use the <a>PutKeyPolicy</a> operation to set a key policy.</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>Decrypt</a> </p> </li> <li> <p> <a>Encrypt</a> </p> </li> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyPair</a> </p> </li> </ul>\"\
    },\
    \"ReplicateKey\":{\
      \"name\":\"ReplicateKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReplicateKeyRequest\"},\
      \"output\":{\"shape\":\"ReplicateKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"MalformedPolicyDocumentException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TagException\"},\
        {\"shape\":\"UnsupportedOperationException\"}\
      ],\
      \"documentation\":\"<p>Replicates a multi-Region key into the specified Region. This operation creates a multi-Region replica key based on a multi-Region primary key in a different Region of the same Amazon Web Services partition. You can create multiple replicas of a primary key, but each must be in a different Region. To create a multi-Region primary key, use the <a>CreateKey</a> operation.</p> <p>This operation supports <i>multi-Region keys</i>, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html\\\">Multi-Region keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>A <i>replica key</i> is a fully-functional KMS key that can be used independently of its primary and peer replica keys. A primary key and its replica keys share properties that make them interoperable. They have the same <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id\\\">key ID</a> and key material. They also have the same <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-spec\\\">key spec</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-usage\\\">key usage</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-origin\\\">key material origin</a>, and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html\\\">automatic key rotation status</a>. KMS automatically synchronizes these shared properties among related multi-Region keys. All other properties of a replica key can differ, including its <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">key policy</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html\\\">tags</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html\\\">aliases</a>, and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a>. KMS pricing and quotas for KMS keys apply to each primary key and replica key.</p> <p>When this operation completes, the new replica key has a transient key state of <code>Creating</code>. This key state changes to <code>Enabled</code> (or <code>PendingImport</code>) after a few seconds when the process of creating the new replica key is complete. While the key state is <code>Creating</code>, you can manage key, but you cannot yet use it in cryptographic operations. If you are creating and using the replica key programmatically, retry on <code>KMSInvalidStateException</code> or call <code>DescribeKey</code> to check its <code>KeyState</code> value before using it. For details about the <code>Creating</code> key state, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>You cannot create more than one replica of a primary key in any Region. If the Region already includes a replica of the key you're trying to replicate, <code>ReplicateKey</code> returns an <code>AlreadyExistsException</code> error. If the key state of the existing replica is <code>PendingDeletion</code>, you can cancel the scheduled key deletion (<a>CancelKeyDeletion</a>) or wait for the key to be deleted. The new replica key you create will have the same <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-sync-properties\\\">shared properties</a> as the original replica key.</p> <p>The CloudTrail log of a <code>ReplicateKey</code> operation records a <code>ReplicateKey</code> operation in the primary key's Region and a <a>CreateKey</a> operation in the replica key's Region.</p> <p>If you replicate a multi-Region primary key with imported key material, the replica key is created with no key material. You must import the same key material that you imported into the primary key. For details, see <a href=\\\"kms/latest/developerguide/multi-region-keys-import.html\\\">Importing key material into multi-Region keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>To convert a replica key to a primary key, use the <a>UpdatePrimaryRegion</a> operation.</p> <note> <p> <code>ReplicateKey</code> uses different default values for the <code>KeyPolicy</code> and <code>Tags</code> parameters than those used in the KMS console. For details, see the parameter descriptions.</p> </note> <p> <b>Cross-account use</b>: No. You cannot use this operation to create a replica key in a different Amazon Web Services account. </p> <p> <b>Required permissions</b>: </p> <ul> <li> <p> <code>kms:ReplicateKey</code> on the primary key (in the primary key's Region). Include this permission in the primary key's key policy.</p> </li> <li> <p> <code>kms:CreateKey</code> in an IAM policy in the replica Region.</p> </li> <li> <p>To use the <code>Tags</code> parameter, <code>kms:TagResource</code> in an IAM policy in the replica Region.</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p> <a>CreateKey</a> </p> </li> <li> <p> <a>UpdatePrimaryRegion</a> </p> </li> </ul>\"\
    },\
    \"RetireGrant\":{\
      \"name\":\"RetireGrant\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RetireGrantRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"InvalidGrantIdException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Deletes a grant. Typically, you retire a grant when you no longer need its permissions. To identify the grant to retire, use a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">grant token</a>, or both the grant ID and a key identifier (key ID or key ARN) of the KMS key. The <a>CreateGrant</a> operation returns both values.</p> <p>This operation can be called by the <i>retiring principal</i> for a grant, by the <i>grantee principal</i> if the grant allows the <code>RetireGrant</code> operation, and by the Amazon Web Services account in which the grant is created. It can also be called by principals to whom permission for retiring a grant is delegated. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete\\\">Retiring and revoking grants</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>For detailed information about grants, including grant terminology, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html\\\">Grants in KMS</a> in the <i> <i>Key Management Service Developer Guide</i> </i>. For examples of working with grants in several programming languages, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html\\\">Programming grants</a>. </p> <p> <b>Cross-account use</b>: Yes. You can retire a grant on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions:</b>:Permission to retire a grant is determined primarily by the grant. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete\\\">Retiring and revoking grants</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>CreateGrant</a> </p> </li> <li> <p> <a>ListGrants</a> </p> </li> <li> <p> <a>ListRetirableGrants</a> </p> </li> <li> <p> <a>RevokeGrant</a> </p> </li> </ul>\"\
    },\
    \"RevokeGrant\":{\
      \"name\":\"RevokeGrant\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RevokeGrantRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"InvalidGrantIdException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified grant. You revoke a grant to terminate the permissions that the grant allows. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/managing-grants.html#grant-delete\\\">Retiring and revoking grants</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> <p>When you create, retire, or revoke a grant, there might be a brief delay, usually less than five minutes, until the grant is available throughout KMS. This state is known as <i>eventual consistency</i>. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency\\\">Eventual consistency</a> in the <i> <i>Key Management Service Developer Guide</i> </i>. </p> <p>For detailed information about grants, including grant terminology, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html\\\">Grants in KMS</a> in the <i> <i>Key Management Service Developer Guide</i> </i>. For examples of working with grants in several programming languages, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html\\\">Programming grants</a>. </p> <p> <b>Cross-account use</b>: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:RevokeGrant</a> (key policy).</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>CreateGrant</a> </p> </li> <li> <p> <a>ListGrants</a> </p> </li> <li> <p> <a>ListRetirableGrants</a> </p> </li> <li> <p> <a>RetireGrant</a> </p> </li> </ul>\"\
    },\
    \"ScheduleKeyDeletion\":{\
      \"name\":\"ScheduleKeyDeletion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ScheduleKeyDeletionRequest\"},\
      \"output\":{\"shape\":\"ScheduleKeyDeletionResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Schedules the deletion of a KMS key. By default, KMS applies a waiting period of 30 days, but you can specify a waiting period of 7-30 days. When this operation is successful, the key state of the KMS key changes to <code>PendingDeletion</code> and the key can't be used in any cryptographic operations. It remains in this state for the duration of the waiting period. Before the waiting period ends, you can use <a>CancelKeyDeletion</a> to cancel the deletion of the KMS key. After the waiting period ends, KMS deletes the KMS key, its key material, and all KMS data associated with it, including all aliases that refer to it.</p> <important> <p>Deleting a KMS key is a destructive and potentially dangerous operation. When a KMS key is deleted, all data that was encrypted under the KMS key is unrecoverable. (The only exception is a <a href=\\\"kms/latest/developerguide/multi-region-keys-delete.html\\\">multi-Region replica key</a>, or an <a href=\\\"kms/latest/developerguide/importing-keys-managing.html#import-delete-key\\\">asymmetric or HMAC KMS key with imported key material</a>.) To prevent the use of a KMS key without deleting it, use <a>DisableKey</a>. </p> </important> <p>You can schedule the deletion of a multi-Region primary key and its replica keys at any time. However, KMS will not delete a multi-Region primary key with existing replica keys. If you schedule the deletion of a primary key with replicas, its key state changes to <code>PendingReplicaDeletion</code> and it cannot be replicated or used in cryptographic operations. This status can continue indefinitely. When the last of its replicas keys is deleted (not just scheduled), the key state of the primary key changes to <code>PendingDeletion</code> and its waiting period (<code>PendingWindowInDays</code>) begins. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-delete.html\\\">Deleting multi-Region keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>When KMS <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/delete-cmk-keystore.html\\\">deletes a KMS key from an CloudHSM key store</a>, it makes a best effort to delete the associated key material from the associated CloudHSM cluster. However, you might need to manually <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key\\\">delete the orphaned key material</a> from the cluster and its backups. <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/delete-xks-key.html\\\">Deleting a KMS key from an external key store</a> has no effect on the associated external key. However, for both types of custom key stores, deleting a KMS key is destructive and irreversible. You cannot decrypt ciphertext encrypted under the KMS key by using only its associated external key or CloudHSM key. Also, you cannot recreate a KMS key in an external key store by creating a new KMS key with the same key material.</p> <p>For more information about scheduling a KMS key for deletion, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html\\\">Deleting KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: kms:ScheduleKeyDeletion (key policy)</p> <p> <b>Related operations</b> </p> <ul> <li> <p> <a>CancelKeyDeletion</a> </p> </li> <li> <p> <a>DisableKey</a> </p> </li> </ul>\"\
    },\
    \"Sign\":{\
      \"name\":\"Sign\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SignRequest\"},\
      \"output\":{\"shape\":\"SignResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Creates a <a href=\\\"https://en.wikipedia.org/wiki/Digital_signature\\\">digital signature</a> for a message or message digest by using the private key in an asymmetric signing KMS key. To verify the signature, use the <a>Verify</a> operation, or use the public key in the same asymmetric KMS key outside of KMS. For information about asymmetric KMS keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Asymmetric KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>Digital signatures are generated and verified by using asymmetric key pair, such as an RSA or ECC pair that is represented by an asymmetric KMS key. The key owner (or an authorized user) uses their private key to sign a message. Anyone with the public key can verify that the message was signed with that particular private key and that the message hasn't changed since it was signed. </p> <p>To use the <code>Sign</code> operation, provide the following information:</p> <ul> <li> <p>Use the <code>KeyId</code> parameter to identify an asymmetric KMS key with a <code>KeyUsage</code> value of <code>SIGN_VERIFY</code>. To get the <code>KeyUsage</code> value of a KMS key, use the <a>DescribeKey</a> operation. The caller must have <code>kms:Sign</code> permission on the KMS key.</p> </li> <li> <p>Use the <code>Message</code> parameter to specify the message or message digest to sign. You can submit messages of up to 4096 bytes. To sign a larger message, generate a hash digest of the message, and then provide the hash digest in the <code>Message</code> parameter. To indicate whether the message is a full message or a digest, use the <code>MessageType</code> parameter.</p> </li> <li> <p>Choose a signing algorithm that is compatible with the KMS key. </p> </li> </ul> <important> <p>When signing a message, be sure to record the KMS key and the signing algorithm. This information is required to verify the signature.</p> </important> <note> <p>Best practices recommend that you limit the time during which any signature is effective. This deters an attack where the actor uses a signed message to establish validity repeatedly or long after the message is superseded. Signatures do not include a timestamp, but you can include a timestamp in the signed message to help you detect when its time to refresh the signature. </p> </note> <p>To verify the signature that this operation generates, use the <a>Verify</a> operation. Or use the <a>GetPublicKey</a> operation to download the public key and then use the public key to verify the signature outside of KMS. </p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:Sign</a> (key policy)</p> <p> <b>Related operations</b>: <a>Verify</a> </p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"TagException\"}\
      ],\
      \"documentation\":\"<p>Adds or edits tags on a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk\\\">customer managed key</a>.</p> <note> <p>Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/abac.html\\\">ABAC for KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> </note> <p>Each tag consists of a tag key and a tag value, both of which are case-sensitive strings. The tag value can be an empty (null) string. To add a tag, specify a new tag key and a tag value. To edit a tag, specify an existing tag key and a new tag value.</p> <p>You can use this operation to tag a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk\\\">customer managed key</a>, but you cannot tag an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk\\\">Amazon Web Services managed key</a>, an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk\\\">Amazon Web Services owned key</a>, a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#keystore-concept\\\">custom key store</a>, or an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#alias-concept\\\">alias</a>.</p> <p>You can also add tags to a KMS key while creating it (<a>CreateKey</a>) or replicating it (<a>ReplicateKey</a>).</p> <p>For information about using tags in KMS, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html\\\">Tagging keys</a>. For general information about tags, including the format and syntax, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a> in the <i>Amazon Web Services General Reference</i>. </p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account. </p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:TagResource</a> (key policy)</p> <p> <b>Related operations</b> </p> <ul> <li> <p> <a>CreateKey</a> </p> </li> <li> <p> <a>ListResourceTags</a> </p> </li> <li> <p> <a>ReplicateKey</a> </p> </li> <li> <p> <a>UntagResource</a> </p> </li> </ul>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"TagException\"}\
      ],\
      \"documentation\":\"<p>Deletes tags from a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk\\\">customer managed key</a>. To delete a tag, specify the tag key and the KMS key.</p> <note> <p>Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/abac.html\\\">ABAC for KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> </note> <p>When it succeeds, the <code>UntagResource</code> operation doesn't return any output. Also, if the specified tag key isn't found on the KMS key, it doesn't throw an exception or return a response. To confirm that the operation worked, use the <a>ListResourceTags</a> operation.</p> <p>For information about using tags in KMS, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html\\\">Tagging keys</a>. For general information about tags, including the format and syntax, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a> in the <i>Amazon Web Services General Reference</i>. </p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:UntagResource</a> (key policy)</p> <p> <b>Related operations</b> </p> <ul> <li> <p> <a>CreateKey</a> </p> </li> <li> <p> <a>ListResourceTags</a> </p> </li> <li> <p> <a>ReplicateKey</a> </p> </li> <li> <p> <a>TagResource</a> </p> </li> </ul>\"\
    },\
    \"UpdateAlias\":{\
      \"name\":\"UpdateAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateAliasRequest\"},\
      \"errors\":[\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Associates an existing KMS alias with a different KMS key. Each alias is associated with only one KMS key at a time, although a KMS key can have multiple aliases. The alias and the KMS key must be in the same Amazon Web Services account and Region.</p> <note> <p>Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/abac.html\\\">ABAC for KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> </note> <p>The current and new KMS key must be the same type (both symmetric or both asymmetric or both HMAC), and they must have the same key usage. This restriction prevents errors in code that uses aliases. If you must assign an alias to a different type of KMS key, use <a>DeleteAlias</a> to delete the old alias and <a>CreateAlias</a> to create a new alias.</p> <p>You cannot use <code>UpdateAlias</code> to change an alias name. To change an alias name, use <a>DeleteAlias</a> to delete the old alias and <a>CreateAlias</a> to create a new alias.</p> <p>Because an alias is not a property of a KMS key, you can create, update, and delete the aliases of a KMS key without affecting the KMS key. Also, aliases do not appear in the response from the <a>DescribeKey</a> operation. To get the aliases of all KMS keys in the account, use the <a>ListAliases</a> operation. </p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account. </p> <p> <b>Required permissions</b> </p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:UpdateAlias</a> on the alias (IAM policy).</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:UpdateAlias</a> on the current KMS key (key policy).</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:UpdateAlias</a> on the new KMS key (key policy).</p> </li> </ul> <p>For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access\\\">Controlling access to aliases</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>CreateAlias</a> </p> </li> <li> <p> <a>DeleteAlias</a> </p> </li> <li> <p> <a>ListAliases</a> </p> </li> </ul>\"\
    },\
    \"UpdateCustomKeyStore\":{\
      \"name\":\"UpdateCustomKeyStore\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateCustomKeyStoreRequest\"},\
      \"output\":{\"shape\":\"UpdateCustomKeyStoreResponse\"},\
      \"errors\":[\
        {\"shape\":\"CustomKeyStoreNotFoundException\"},\
        {\"shape\":\"CustomKeyStoreNameInUseException\"},\
        {\"shape\":\"CloudHsmClusterNotFoundException\"},\
        {\"shape\":\"CloudHsmClusterNotRelatedException\"},\
        {\"shape\":\"CustomKeyStoreInvalidStateException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"CloudHsmClusterNotActiveException\"},\
        {\"shape\":\"CloudHsmClusterInvalidConfigurationException\"},\
        {\"shape\":\"XksProxyUriInUseException\"},\
        {\"shape\":\"XksProxyUriEndpointInUseException\"},\
        {\"shape\":\"XksProxyUriUnreachableException\"},\
        {\"shape\":\"XksProxyIncorrectAuthenticationCredentialException\"},\
        {\"shape\":\"XksProxyVpcEndpointServiceInUseException\"},\
        {\"shape\":\"XksProxyVpcEndpointServiceNotFoundException\"},\
        {\"shape\":\"XksProxyVpcEndpointServiceInvalidConfigurationException\"},\
        {\"shape\":\"XksProxyInvalidResponseException\"},\
        {\"shape\":\"XksProxyInvalidConfigurationException\"}\
      ],\
      \"documentation\":\"<p>Changes the properties of a custom key store. You can use this operation to change the properties of an CloudHSM key store or an external key store.</p> <p>Use the required <code>CustomKeyStoreId</code> parameter to identify the custom key store. Use the remaining optional parameters to change its properties. This operation does not return any property values. To verify the updated property values, use the <a>DescribeCustomKeyStores</a> operation.</p> <p> This operation is part of the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key stores</a> feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.</p> <important> <p>When updating the properties of an external key store, verify that the updated settings connect your key store, via the external key store proxy, to the same external key manager as the previous settings, or to a backup or snapshot of the external key manager with the same cryptographic keys. If the updated connection settings fail, you can fix them and retry, although an extended delay might disrupt Amazon Web Services services. However, if KMS permanently loses its access to cryptographic keys, ciphertext encrypted under those keys is unrecoverable.</p> </important> <note> <p>For external key stores:</p> <p>Some external key managers provide a simpler method for updating an external key store. For details, see your external key manager documentation.</p> <p>When updating an external key store in the KMS console, you can upload a JSON-based proxy configuration file with the desired values. You cannot upload the proxy configuration file to the <code>UpdateCustomKeyStore</code> operation. However, you can use the file to help you determine the correct values for the <code>UpdateCustomKeyStore</code> parameters.</p> </note> <p>For an CloudHSM key store, you can use this operation to change the custom key store friendly name (<code>NewCustomKeyStoreName</code>), to tell KMS about a change to the <code>kmsuser</code> crypto user password (<code>KeyStorePassword</code>), or to associate the custom key store with a different, but related, CloudHSM cluster (<code>CloudHsmClusterId</code>). To update any property of an CloudHSM key store, the <code>ConnectionState</code> of the CloudHSM key store must be <code>DISCONNECTED</code>. </p> <p>For an external key store, you can use this operation to change the custom key store friendly name (<code>NewCustomKeyStoreName</code>), or to tell KMS about a change to the external key store proxy authentication credentials (<code>XksProxyAuthenticationCredential</code>), connection method (<code>XksProxyConnectivity</code>), external proxy endpoint (<code>XksProxyUriEndpoint</code>) and path (<code>XksProxyUriPath</code>). For external key stores with an <code>XksProxyConnectivity</code> of <code>VPC_ENDPOINT_SERVICE</code>, you can also update the Amazon VPC endpoint service name (<code>XksProxyVpcEndpointServiceName</code>). To update most properties of an external key store, the <code>ConnectionState</code> of the external key store must be <code>DISCONNECTED</code>. However, you can update the <code>CustomKeyStoreName</code>, <code>XksProxyAuthenticationCredential</code>, and <code>XksProxyUriPath</code> of an external key store when it is in the CONNECTED or DISCONNECTED state. </p> <p>If your update requires a <code>DISCONNECTED</code> state, before using <code>UpdateCustomKeyStore</code>, use the <a>DisconnectCustomKeyStore</a> operation to disconnect the custom key store. After the <code>UpdateCustomKeyStore</code> operation completes, use the <a>ConnectCustomKeyStore</a> to reconnect the custom key store. To find the <code>ConnectionState</code> of the custom key store, use the <a>DescribeCustomKeyStores</a> operation. </p> <p> </p> <p>Before updating the custom key store, verify that the new values allow KMS to connect the custom key store to its backing key store. For example, before you change the <code>XksProxyUriPath</code> value, verify that the external key store proxy is reachable at the new path.</p> <p>If the operation succeeds, it returns a JSON object with no properties.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.</p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:UpdateCustomKeyStore</a> (IAM policy)</p> <p> <b>Related operations:</b> </p> <ul> <li> <p> <a>ConnectCustomKeyStore</a> </p> </li> <li> <p> <a>CreateCustomKeyStore</a> </p> </li> <li> <p> <a>DeleteCustomKeyStore</a> </p> </li> <li> <p> <a>DescribeCustomKeyStores</a> </p> </li> <li> <p> <a>DisconnectCustomKeyStore</a> </p> </li> </ul>\"\
    },\
    \"UpdateKeyDescription\":{\
      \"name\":\"UpdateKeyDescription\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateKeyDescriptionRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"}\
      ],\
      \"documentation\":\"<p>Updates the description of a KMS key. To see the description of a KMS key, use <a>DescribeKey</a>. </p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account. </p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:UpdateKeyDescription</a> (key policy)</p> <p> <b>Related operations</b> </p> <ul> <li> <p> <a>CreateKey</a> </p> </li> <li> <p> <a>DescribeKey</a> </p> </li> </ul>\"\
    },\
    \"UpdatePrimaryRegion\":{\
      \"name\":\"UpdatePrimaryRegion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdatePrimaryRegionRequest\"},\
      \"errors\":[\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"InvalidArnException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnsupportedOperationException\"}\
      ],\
      \"documentation\":\"<p>Changes the primary key of a multi-Region key. </p> <p>This operation changes the replica key in the specified Region to a primary key and changes the former primary key to a replica key. For example, suppose you have a primary key in <code>us-east-1</code> and a replica key in <code>eu-west-2</code>. If you run <code>UpdatePrimaryRegion</code> with a <code>PrimaryRegion</code> value of <code>eu-west-2</code>, the primary key is now the key in <code>eu-west-2</code>, and the key in <code>us-east-1</code> becomes a replica key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-update\\\">Updating the primary Region</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>This operation supports <i>multi-Region keys</i>, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html\\\">Multi-Region keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>The <i>primary key</i> of a multi-Region key is the source for properties that are always shared by primary and replica keys, including the key material, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id\\\">key ID</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-spec\\\">key spec</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-usage\\\">key usage</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-origin\\\">key material origin</a>, and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html\\\">automatic key rotation</a>. It's the only key that can be replicated. You cannot <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_ScheduleKeyDeletion.html\\\">delete the primary key</a> until all replica keys are deleted.</p> <p>The key ID and primary Region that you specify uniquely identify the replica key that will become the primary key. The primary Region must already have a replica key. This operation does not create a KMS key in the specified Region. To find the replica keys, use the <a>DescribeKey</a> operation on the primary key or any replica key. To create a replica key, use the <a>ReplicateKey</a> operation.</p> <p>You can run this operation while using the affected multi-Region keys in cryptographic operations. This operation should not delay, interrupt, or cause failures in cryptographic operations. </p> <p>Even after this operation completes, the process of updating the primary Region might still be in progress for a few more seconds. Operations such as <code>DescribeKey</code> might display both the old and new primary keys as replicas. The old and new primary keys have a transient key state of <code>Updating</code>. The original key state is restored when the update is complete. While the key state is <code>Updating</code>, you can use the keys in cryptographic operations, but you cannot replicate the new primary key or perform certain management operations, such as enabling or disabling these keys. For details about the <code>Updating</code> key state, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>This operation does not return any output. To verify that primary key is changed, use the <a>DescribeKey</a> operation.</p> <p> <b>Cross-account use</b>: No. You cannot use this operation in a different Amazon Web Services account. </p> <p> <b>Required permissions</b>: </p> <ul> <li> <p> <code>kms:UpdatePrimaryRegion</code> on the current primary key (in the primary key's Region). Include this permission primary key's key policy.</p> </li> <li> <p> <code>kms:UpdatePrimaryRegion</code> on the current replica key (in the replica key's Region). Include this permission in the replica key's key policy.</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p> <a>CreateKey</a> </p> </li> <li> <p> <a>ReplicateKey</a> </p> </li> </ul>\"\
    },\
    \"Verify\":{\
      \"name\":\"Verify\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"VerifyRequest\"},\
      \"output\":{\"shape\":\"VerifyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"DependencyTimeoutException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"KMSInvalidSignatureException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Verifies a digital signature that was generated by the <a>Sign</a> operation. </p> <p/> <p>Verification confirms that an authorized user signed the message with the specified KMS key and signing algorithm, and the message hasn't changed since it was signed. If the signature is verified, the value of the <code>SignatureValid</code> field in the response is <code>True</code>. If the signature verification fails, the <code>Verify</code> operation fails with an <code>KMSInvalidSignatureException</code> exception.</p> <p>A digital signature is generated by using the private key in an asymmetric KMS key. The signature is verified by using the public key in the same asymmetric KMS key. For information about asymmetric KMS keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Asymmetric KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>To use the <code>Verify</code> operation, specify the same asymmetric KMS key, message, and signing algorithm that were used to produce the signature. The message type does not need to be the same as the one used for signing, but it must indicate whether the value of the <code>Message</code> parameter should be hashed as part of the verification process.</p> <p>You can also verify the digital signature by using the public key of the KMS key outside of KMS. Use the <a>GetPublicKey</a> operation to download the public key in the asymmetric KMS key and then use the public key to verify the signature outside of KMS. The advantage of using the <code>Verify</code> operation is that it is performed within KMS. As a result, it's easy to call, the operation is performed within the FIPS boundary, it is logged in CloudTrail, and you can use key policy and IAM policy to determine who is authorized to use the KMS key to verify signatures.</p> <p>To verify a signature outside of KMS with an SM2 public key (China Regions only), you must specify the distinguishing ID. By default, KMS uses <code>1234567812345678</code> as the distinguishing ID. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification\\\">Offline verification with SM2 key pairs</a>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter. </p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:Verify</a> (key policy)</p> <p> <b>Related operations</b>: <a>Sign</a> </p>\"\
    },\
    \"VerifyMac\":{\
      \"name\":\"VerifyMac\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"VerifyMacRequest\"},\
      \"output\":{\"shape\":\"VerifyMacResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"DisabledException\"},\
        {\"shape\":\"KeyUnavailableException\"},\
        {\"shape\":\"InvalidKeyUsageException\"},\
        {\"shape\":\"InvalidGrantTokenException\"},\
        {\"shape\":\"KMSInternalException\"},\
        {\"shape\":\"KMSInvalidMacException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"DryRunOperationException\"}\
      ],\
      \"documentation\":\"<p>Verifies the hash-based message authentication code (HMAC) for a specified message, HMAC KMS key, and MAC algorithm. To verify the HMAC, <code>VerifyMac</code> computes an HMAC using the message, HMAC KMS key, and MAC algorithm that you specify, and compares the computed HMAC to the HMAC that you specify. If the HMACs are identical, the verification succeeds; otherwise, it fails. Verification indicates that the message hasn't changed since the HMAC was calculated, and the specified key was used to generate and verify the HMAC.</p> <p>HMAC KMS keys and the HMAC algorithms that KMS uses conform to industry standards defined in <a href=\\\"https://datatracker.ietf.org/doc/html/rfc2104\\\">RFC 2104</a>.</p> <p>This operation is part of KMS support for HMAC KMS keys. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html\\\">HMAC keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>The KMS key that you use for this operation must be in a compatible key state. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p> <p> <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the <code>KeyId</code> parameter. </p> <p> <b>Required permissions</b>: <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:VerifyMac</a> (key policy)</p> <p> <b>Related operations</b>: <a>GenerateMac</a> </p>\"\
    }\
  },\
  \"shapes\":{\
    \"AWSAccountIdType\":{\"type\":\"string\"},\
    \"AlgorithmSpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RSAES_PKCS1_V1_5\",\
        \"RSAES_OAEP_SHA_1\",\
        \"RSAES_OAEP_SHA_256\",\
        \"RSA_AES_KEY_WRAP_SHA_1\",\
        \"RSA_AES_KEY_WRAP_SHA_256\"\
      ]\
    },\
    \"AliasList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AliasListEntry\"}\
    },\
    \"AliasListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AliasName\":{\
          \"shape\":\"AliasNameType\",\
          \"documentation\":\"<p>String that contains the alias. This value begins with <code>alias/</code>.</p>\"\
        },\
        \"AliasArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>String that contains the key ARN.</p>\"\
        },\
        \"TargetKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>String that contains the key identifier of the KMS key associated with the alias.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>Date and time that the alias was most recently created in the account and Region. Formatted as Unix time.</p>\"\
        },\
        \"LastUpdatedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>Date and time that the alias was most recently associated with a KMS key in the account and Region. Formatted as Unix time.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about an alias.</p>\"\
    },\
    \"AliasNameType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9:/_-]+$\"\
    },\
    \"AlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because it attempted to create a resource that already exists.</p>\",\
      \"exception\":true\
    },\
    \"ArnType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"AttestationDocumentType\":{\
      \"type\":\"blob\",\
      \"max\":262144,\
      \"min\":1\
    },\
    \"BooleanType\":{\"type\":\"boolean\"},\
    \"CancelKeyDeletionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the KMS key whose deletion is being canceled.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"CancelKeyDeletionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key whose deletion is canceled.</p>\"\
        }\
      }\
    },\
    \"CiphertextType\":{\
      \"type\":\"blob\",\
      \"max\":6144,\
      \"min\":1\
    },\
    \"CloudHsmClusterIdType\":{\
      \"type\":\"string\",\
      \"max\":24,\
      \"min\":19,\
      \"pattern\":\"cluster-[2-7a-zA-Z]{11,16}\"\
    },\
    \"CloudHsmClusterInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified CloudHSM cluster is already associated with an CloudHSM key store in the account, or it shares a backup history with an CloudHSM key store in the account. Each CloudHSM key store in the account must be associated with a different CloudHSM cluster.</p> <p>CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html\\\">DescribeClusters</a> operation.</p>\",\
      \"exception\":true\
    },\
    \"CloudHsmClusterInvalidConfigurationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the associated CloudHSM cluster did not meet the configuration requirements for an CloudHSM key store.</p> <ul> <li> <p>The CloudHSM cluster must be configured with private subnets in at least two different Availability Zones in the Region.</p> </li> <li> <p>The <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html\\\">security group for the cluster</a> (cloudhsm-cluster-<i>&lt;cluster-id&gt;</i>-sg) must include inbound rules and outbound rules that allow TCP traffic on ports 2223-2225. The <b>Source</b> in the inbound rules and the <b>Destination</b> in the outbound rules must match the security group ID. These rules are set by default when you create the CloudHSM cluster. Do not delete or change them. To get information about a particular security group, use the <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSecurityGroups.html\\\">DescribeSecurityGroups</a> operation.</p> </li> <li> <p>The CloudHSM cluster must contain at least as many HSMs as the operation requires. To add HSMs, use the CloudHSM <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html\\\">CreateHsm</a> operation.</p> <p>For the <a>CreateCustomKeyStore</a>, <a>UpdateCustomKeyStore</a>, and <a>CreateKey</a> operations, the CloudHSM cluster must have at least two active HSMs, each in a different Availability Zone. For the <a>ConnectCustomKeyStore</a> operation, the CloudHSM must contain at least one active HSM.</p> </li> </ul> <p>For information about the requirements for an CloudHSM cluster that is associated with an CloudHSM key store, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore\\\">Assemble the Prerequisites</a> in the <i>Key Management Service Developer Guide</i>. For information about creating a private subnet for an CloudHSM cluster, see <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/userguide/create-subnets.html\\\">Create a Private Subnet</a> in the <i>CloudHSM User Guide</i>. For information about cluster security groups, see <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html\\\">Configure a Default Security Group</a> in the <i> <i>CloudHSM User Guide</i> </i>. </p>\",\
      \"exception\":true\
    },\
    \"CloudHsmClusterNotActiveException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the CloudHSM cluster associated with the CloudHSM key store is not active. Initialize and activate the cluster and try the command again. For detailed instructions, see <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/userguide/getting-started.html\\\">Getting Started</a> in the <i>CloudHSM User Guide</i>.</p>\",\
      \"exception\":true\
    },\
    \"CloudHsmClusterNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because KMS cannot find the CloudHSM cluster with the specified cluster ID. Retry the request with a different cluster ID.</p>\",\
      \"exception\":true\
    },\
    \"CloudHsmClusterNotRelatedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified CloudHSM cluster has a different cluster certificate than the original cluster. You cannot use the operation to specify an unrelated cluster for an CloudHSM key store.</p> <p>Specify an CloudHSM cluster that shares a backup history with the original cluster. This includes clusters that were created from a backup of the current cluster, and clusters that were created from the same backup that produced the current cluster.</p> <p>CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html\\\">DescribeClusters</a> operation.</p>\",\
      \"exception\":true\
    },\
    \"ConnectCustomKeyStoreRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CustomKeyStoreId\"],\
      \"members\":{\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>Enter the key store ID of the custom key store that you want to connect. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p>\"\
        }\
      }\
    },\
    \"ConnectCustomKeyStoreResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ConnectionErrorCodeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INVALID_CREDENTIALS\",\
        \"CLUSTER_NOT_FOUND\",\
        \"NETWORK_ERRORS\",\
        \"INTERNAL_ERROR\",\
        \"INSUFFICIENT_CLOUDHSM_HSMS\",\
        \"USER_LOCKED_OUT\",\
        \"USER_NOT_FOUND\",\
        \"USER_LOGGED_IN\",\
        \"SUBNET_NOT_FOUND\",\
        \"INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET\",\
        \"XKS_PROXY_ACCESS_DENIED\",\
        \"XKS_PROXY_NOT_REACHABLE\",\
        \"XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND\",\
        \"XKS_PROXY_INVALID_RESPONSE\",\
        \"XKS_PROXY_INVALID_CONFIGURATION\",\
        \"XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION\",\
        \"XKS_PROXY_TIMED_OUT\",\
        \"XKS_PROXY_INVALID_TLS_CONFIGURATION\"\
      ]\
    },\
    \"ConnectionStateType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONNECTED\",\
        \"CONNECTING\",\
        \"FAILED\",\
        \"DISCONNECTED\",\
        \"DISCONNECTING\"\
      ]\
    },\
    \"CreateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AliasName\",\
        \"TargetKeyId\"\
      ],\
      \"members\":{\
        \"AliasName\":{\
          \"shape\":\"AliasNameType\",\
          \"documentation\":\"<p>Specifies the alias name. This value must begin with <code>alias/</code> followed by a name, such as <code>alias/ExampleAlias</code>. </p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>The <code>AliasName</code> value must be string of 1-256 characters. It can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). The alias name cannot begin with <code>alias/aws/</code>. The <code>alias/aws/</code> prefix is reserved for <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk\\\">Amazon Web Services managed keys</a>.</p>\"\
        },\
        \"TargetKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Associates the alias with the specified <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk\\\">customer managed key</a>. The KMS key must be in the same Amazon Web Services Region. </p> <p>A valid key ID is required. If you supply a null or empty string value, this operation returns an error.</p> <p>For help finding the key ID and ARN, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html#find-cmk-id-arn\\\">Finding the Key ID and ARN</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"CreateCustomKeyStoreRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CustomKeyStoreName\"],\
      \"members\":{\
        \"CustomKeyStoreName\":{\
          \"shape\":\"CustomKeyStoreNameType\",\
          \"documentation\":\"<p>Specifies a friendly name for the custom key store. The name must be unique in your Amazon Web Services account and Region. This parameter is required for all custom key stores.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important>\"\
        },\
        \"CloudHsmClusterId\":{\
          \"shape\":\"CloudHsmClusterIdType\",\
          \"documentation\":\"<p>Identifies the CloudHSM cluster for an CloudHSM key store. This parameter is required for custom key stores with <code>CustomKeyStoreType</code> of <code>AWS_CLOUDHSM</code>.</p> <p>Enter the cluster ID of any active CloudHSM cluster that is not already associated with a custom key store. To find the cluster ID, use the <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html\\\">DescribeClusters</a> operation.</p>\"\
        },\
        \"TrustAnchorCertificate\":{\
          \"shape\":\"TrustAnchorCertificateType\",\
          \"documentation\":\"<p>Specifies the certificate for an CloudHSM key store. This parameter is required for custom key stores with a <code>CustomKeyStoreType</code> of <code>AWS_CLOUDHSM</code>.</p> <p>Enter the content of the trust anchor certificate for the CloudHSM cluster. This is the content of the <code>customerCA.crt</code> file that you created when you <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html\\\">initialized the cluster</a>.</p>\"\
        },\
        \"KeyStorePassword\":{\
          \"shape\":\"KeyStorePasswordType\",\
          \"documentation\":\"<p>Specifies the <code>kmsuser</code> password for an CloudHSM key store. This parameter is required for custom key stores with a <code>CustomKeyStoreType</code> of <code>AWS_CLOUDHSM</code>.</p> <p>Enter the password of the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser\\\"> <code>kmsuser</code> crypto user (CU) account</a> in the specified CloudHSM cluster. KMS logs into the cluster as this user to manage key material on your behalf.</p> <p>The password must be a string of 7 to 32 characters. Its value is case sensitive.</p> <p>This parameter tells KMS the <code>kmsuser</code> account password; it does not change the password in the CloudHSM cluster.</p>\"\
        },\
        \"CustomKeyStoreType\":{\
          \"shape\":\"CustomKeyStoreType\",\
          \"documentation\":\"<p>Specifies the type of custom key store. The default value is <code>AWS_CLOUDHSM</code>.</p> <p>For a custom key store backed by an CloudHSM cluster, omit the parameter or enter <code>AWS_CLOUDHSM</code>. For a custom key store backed by an external key manager outside of Amazon Web Services, enter <code>EXTERNAL_KEY_STORE</code>. You cannot change this property after the key store is created.</p>\"\
        },\
        \"XksProxyUriEndpoint\":{\
          \"shape\":\"XksProxyUriEndpointType\",\
          \"documentation\":\"<p>Specifies the endpoint that KMS uses to send requests to the external key store proxy (XKS proxy). This parameter is required for custom key stores with a <code>CustomKeyStoreType</code> of <code>EXTERNAL_KEY_STORE</code>.</p> <p>The protocol must be HTTPS. KMS communicates on port 443. Do not specify the port in the <code>XksProxyUriEndpoint</code> value.</p> <p>For external key stores with <code>XksProxyConnectivity</code> value of <code>VPC_ENDPOINT_SERVICE</code>, specify <code>https://</code> followed by the private DNS name of the VPC endpoint service.</p> <p>For external key stores with <code>PUBLIC_ENDPOINT</code> connectivity, this endpoint must be reachable before you create the custom key store. KMS connects to the external key store proxy while creating the custom key store. For external key stores with <code>VPC_ENDPOINT_SERVICE</code> connectivity, KMS connects when you call the <a>ConnectCustomKeyStore</a> operation.</p> <p>The value of this parameter must begin with <code>https://</code>. The remainder can contain upper and lower case letters (A-Z and a-z), numbers (0-9), dots (<code>.</code>), and hyphens (<code>-</code>). Additional slashes (<code>/</code> and <code>\\\\</code>) are not permitted.</p> <p> <b>Uniqueness requirements: </b> </p> <ul> <li> <p>The combined <code>XksProxyUriEndpoint</code> and <code>XksProxyUriPath</code> values must be unique in the Amazon Web Services account and Region.</p> </li> <li> <p>An external key store with <code>PUBLIC_ENDPOINT</code> connectivity cannot use the same <code>XksProxyUriEndpoint</code> value as an external key store with <code>VPC_ENDPOINT_SERVICE</code> connectivity in the same Amazon Web Services Region.</p> </li> <li> <p>Each external key store with <code>VPC_ENDPOINT_SERVICE</code> connectivity must have its own private DNS name. The <code>XksProxyUriEndpoint</code> value for external key stores with <code>VPC_ENDPOINT_SERVICE</code> connectivity (private DNS name) must be unique in the Amazon Web Services account and Region.</p> </li> </ul>\"\
        },\
        \"XksProxyUriPath\":{\
          \"shape\":\"XksProxyUriPathType\",\
          \"documentation\":\"<p>Specifies the base path to the proxy APIs for this external key store. To find this value, see the documentation for your external key store proxy. This parameter is required for all custom key stores with a <code>CustomKeyStoreType</code> of <code>EXTERNAL_KEY_STORE</code>.</p> <p>The value must start with <code>/</code> and must end with <code>/kms/xks/v1</code> where <code>v1</code> represents the version of the KMS external key store proxy API. This path can include an optional prefix between the required elements such as <code>/<i>prefix</i>/kms/xks/v1</code>.</p> <p> <b>Uniqueness requirements: </b> </p> <ul> <li> <p>The combined <code>XksProxyUriEndpoint</code> and <code>XksProxyUriPath</code> values must be unique in the Amazon Web Services account and Region.</p> </li> </ul>\"\
        },\
        \"XksProxyVpcEndpointServiceName\":{\
          \"shape\":\"XksProxyVpcEndpointServiceNameType\",\
          \"documentation\":\"<p>Specifies the name of the Amazon VPC endpoint service for interface endpoints that is used to communicate with your external key store proxy (XKS proxy). This parameter is required when the value of <code>CustomKeyStoreType</code> is <code>EXTERNAL_KEY_STORE</code> and the value of <code>XksProxyConnectivity</code> is <code>VPC_ENDPOINT_SERVICE</code>.</p> <p>The Amazon VPC endpoint service must <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keystore.html#xks-requirements\\\">fulfill all requirements</a> for use with an external key store. </p> <p> <b>Uniqueness requirements:</b> </p> <ul> <li> <p>External key stores with <code>VPC_ENDPOINT_SERVICE</code> connectivity can share an Amazon VPC, but each external key store must have its own VPC endpoint service and private DNS name.</p> </li> </ul>\"\
        },\
        \"XksProxyAuthenticationCredential\":{\
          \"shape\":\"XksProxyAuthenticationCredentialType\",\
          \"documentation\":\"<p>Specifies an authentication credential for the external key store proxy (XKS proxy). This parameter is required for all custom key stores with a <code>CustomKeyStoreType</code> of <code>EXTERNAL_KEY_STORE</code>.</p> <p>The <code>XksProxyAuthenticationCredential</code> has two required elements: <code>RawSecretAccessKey</code>, a secret key, and <code>AccessKeyId</code>, a unique identifier for the <code>RawSecretAccessKey</code>. For character requirements, see <a href=\\\"kms/latest/APIReference/API_XksProxyAuthenticationCredentialType.html\\\">XksProxyAuthenticationCredentialType</a>.</p> <p>KMS uses this authentication credential to sign requests to the external key store proxy on your behalf. This credential is unrelated to Identity and Access Management (IAM) and Amazon Web Services credentials.</p> <p>This parameter doesn't set or change the authentication credentials on the XKS proxy. It just tells KMS the credential that you established on your external key store proxy. If you rotate your proxy authentication credential, use the <a>UpdateCustomKeyStore</a> operation to provide the new credential to KMS.</p>\"\
        },\
        \"XksProxyConnectivity\":{\
          \"shape\":\"XksProxyConnectivityType\",\
          \"documentation\":\"<p>Indicates how KMS communicates with the external key store proxy. This parameter is required for custom key stores with a <code>CustomKeyStoreType</code> of <code>EXTERNAL_KEY_STORE</code>.</p> <p>If the external key store proxy uses a public endpoint, specify <code>PUBLIC_ENDPOINT</code>. If the external key store proxy uses a Amazon VPC endpoint service for communication with KMS, specify <code>VPC_ENDPOINT_SERVICE</code>. For help making this choice, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/plan-xks-keystore.html#choose-xks-connectivity\\\">Choosing a connectivity option</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>An Amazon VPC endpoint service keeps your communication with KMS in a private address space entirely within Amazon Web Services, but it requires more configuration, including establishing a Amazon VPC with multiple subnets, a VPC endpoint service, a network load balancer, and a verified private DNS name. A public endpoint is simpler to set up, but it might be slower and might not fulfill your security requirements. You might consider testing with a public endpoint, and then establishing a VPC endpoint service for production tasks. Note that this choice does not determine the location of the external key store proxy. Even if you choose a VPC endpoint service, the proxy can be hosted within the VPC or outside of Amazon Web Services such as in your corporate data center.</p>\"\
        }\
      }\
    },\
    \"CreateCustomKeyStoreResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>A unique identifier for the new custom key store.</p>\"\
        }\
      }\
    },\
    \"CreateGrantRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"GranteePrincipal\",\
        \"Operations\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the KMS key for the grant. The grant gives principals permission to use this KMS key.</p> <p>Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"GranteePrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The identity that gets the permissions specified in the grant.</p> <p>To specify the grantee principal, use the Amazon Resource Name (ARN) of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a> in the <i> <i>Identity and Access Management User Guide</i> </i>.</p>\"\
        },\
        \"RetiringPrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The principal that has permission to use the <a>RetireGrant</a> operation to retire the grant. </p> <p>To specify the principal, use the <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Name (ARN)</a> of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a> in the <i> <i>Identity and Access Management User Guide</i> </i>.</p> <p>The grant determines the retiring principal. Other principals might have permission to retire the grant or revoke the grant. For details, see <a>RevokeGrant</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete\\\">Retiring and revoking grants</a> in the <i>Key Management Service Developer Guide</i>. </p>\"\
        },\
        \"Operations\":{\
          \"shape\":\"GrantOperationList\",\
          \"documentation\":\"<p>A list of operations that the grant permits. </p> <p>This list must include only operations that are permitted in a grant. Also, the operation must be supported on the KMS key. For example, you cannot create a grant for a symmetric encryption KMS key that allows the <a>Sign</a> operation, or a grant for an asymmetric KMS key that allows the <a>GenerateDataKey</a> operation. If you try, KMS returns a <code>ValidationError</code> exception. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations\\\">Grant operations</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"Constraints\":{\
          \"shape\":\"GrantConstraints\",\
          \"documentation\":\"<p>Specifies a grant constraint.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>KMS supports the <code>EncryptionContextEquals</code> and <code>EncryptionContextSubset</code> grant constraints, which allow the permissions in the grant only when the encryption context in the request matches (<code>EncryptionContextEquals</code>) or includes (<code>EncryptionContextSubset</code>) the encryption context specified in the constraint. </p> <p>The encryption context grant constraints are supported only on <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations\\\">grant operations</a> that include an <code>EncryptionContext</code> parameter, such as cryptographic operations on symmetric encryption KMS keys. Grants with grant constraints can include the <a>DescribeKey</a> and <a>RetireGrant</a> operations, but the constraint doesn't apply to these operations. If a grant with a grant constraint includes the <code>CreateGrant</code> operation, the constraint requires that any grants created with the <code>CreateGrant</code> permission have an equally strict or stricter encryption context constraint.</p> <p>You cannot use an encryption context grant constraint for cryptographic operations with asymmetric KMS keys or HMAC KMS keys. Operations with these keys don't support an encryption context.</p> <p>Each constraint value can include up to 8 encryption context pairs. The encryption context value in each constraint cannot exceed 384 characters. For information about grant constraints, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-grant-overview.html#grant-constraints\\\">Using grant constraints</a> in the <i>Key Management Service Developer Guide</i>. For more information about encryption context, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption context</a> in the <i> <i>Key Management Service Developer Guide</i> </i>. </p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens. </p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"GrantNameType\",\
          \"documentation\":\"<p>A friendly name for the grant. Use this value to prevent the unintended creation of duplicate grants when retrying this request.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>When this value is absent, all <code>CreateGrant</code> requests result in a new grant with a unique <code>GrantId</code> even if all the supplied parameters are identical. This can result in unintended duplicates when you retry the <code>CreateGrant</code> request.</p> <p>When this value is present, you can retry a <code>CreateGrant</code> request with identical parameters; if the grant already exists, the original <code>GrantId</code> is returned without creating a new grant. Note that the returned grant token is unique with every <code>CreateGrant</code> request, even when a duplicate <code>GrantId</code> is returned. All grant tokens for the same grant ID can be used interchangeably.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"CreateGrantResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GrantToken\":{\
          \"shape\":\"GrantTokenType\",\
          \"documentation\":\"<p>The grant token.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"GrantId\":{\
          \"shape\":\"GrantIdType\",\
          \"documentation\":\"<p>The unique identifier for the grant.</p> <p>You can use the <code>GrantId</code> in a <a>ListGrants</a>, <a>RetireGrant</a>, or <a>RevokeGrant</a> operation.</p>\"\
        }\
      }\
    },\
    \"CreateKeyRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The key policy to attach to the KMS key.</p> <p>If you provide a key policy, it must meet the following criteria:</p> <ul> <li> <p>The key policy must allow the calling principal to make a subsequent <code>PutKeyPolicy</code> request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key\\\">Default key policy</a> in the <i>Key Management Service Developer Guide</i>. (To omit this condition, set <code>BypassPolicyLockoutSafetyCheck</code> to true.)</p> </li> <li> <p>Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency\\\">Changes that I make are not always immediately visible</a> in the <i>Amazon Web Services Identity and Access Management User Guide</i>.</p> </li> </ul> <p>If you do not provide a key policy, KMS attaches a default key policy to the KMS key. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default\\\">Default key policy</a> in the <i>Key Management Service Developer Guide</i>. </p> <p>The key policy size quota is 32 kilobytes (32768 bytes).</p> <p>For help writing and formatting a JSON policy document, see the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html\\\">IAM JSON Policy Reference</a> in the <i> <i>Identity and Access Management User Guide</i> </i>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>A description of the KMS key. Use a description that helps you decide whether the KMS key is appropriate for a task. The default value is an empty string (no description).</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>To set or change the description after the key is created, use <a>UpdateKeyDescription</a>.</p>\"\
        },\
        \"KeyUsage\":{\
          \"shape\":\"KeyUsageType\",\
          \"documentation\":\"<p>Determines the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a> for which you can use the KMS key. The default value is <code>ENCRYPT_DECRYPT</code>. This parameter is optional when you are creating a symmetric encryption KMS key; otherwise, it is required. You can't change the <code>KeyUsage</code> value after the KMS key is created.</p> <p>Select only one valid value.</p> <ul> <li> <p>For symmetric encryption KMS keys, omit the parameter or specify <code>ENCRYPT_DECRYPT</code>.</p> </li> <li> <p>For HMAC KMS keys (symmetric), specify <code>GENERATE_VERIFY_MAC</code>.</p> </li> <li> <p>For asymmetric KMS keys with RSA key material, specify <code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>.</p> </li> <li> <p>For asymmetric KMS keys with ECC key material, specify <code>SIGN_VERIFY</code>.</p> </li> <li> <p>For asymmetric KMS keys with SM2 key material (China Regions only), specify <code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>.</p> </li> </ul>\"\
        },\
        \"CustomerMasterKeySpec\":{\
          \"shape\":\"CustomerMasterKeySpec\",\
          \"documentation\":\"<p>Instead, use the <code>KeySpec</code> parameter.</p> <p>The <code>KeySpec</code> and <code>CustomerMasterKeySpec</code> parameters work the same way. Only the names differ. We recommend that you use <code>KeySpec</code> parameter in your code. However, to avoid breaking changes, KMS supports both parameters.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"This parameter has been deprecated. Instead, use the KeySpec parameter.\"\
        },\
        \"KeySpec\":{\
          \"shape\":\"KeySpec\",\
          \"documentation\":\"<p>Specifies the type of KMS key to create. The default value, <code>SYMMETRIC_DEFAULT</code>, creates a KMS key with a 256-bit AES-GCM key that is used for encryption and decryption, except in China Regions, where it creates a 128-bit symmetric key that uses SM4 encryption. For help choosing a key spec for your KMS key, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-types.html#symm-asymm-choose\\\">Choosing a KMS key type</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> <p>The <code>KeySpec</code> determines whether the KMS key contains a symmetric key or an asymmetric key pair. It also determines the algorithms that the KMS key supports. You can't change the <code>KeySpec</code> after the KMS key is created. To further restrict the algorithms that can be used with the KMS key, use a condition key in its key policy or IAM policy. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-algorithm\\\">kms:EncryptionAlgorithm</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-mac-algorithm\\\">kms:MacAlgorithm</a> or <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-signing-algorithm\\\">kms:Signing Algorithm</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> <important> <p> <a href=\\\"http://aws.amazon.com/kms/features/#AWS_Service_Integration\\\">Amazon Web Services services that are integrated with KMS</a> use symmetric encryption KMS keys to protect your data. These services do not support asymmetric KMS keys or HMAC KMS keys.</p> </important> <p>KMS supports the following key specs for KMS keys:</p> <ul> <li> <p>Symmetric encryption key (default)</p> <ul> <li> <p> <code>SYMMETRIC_DEFAULT</code> </p> </li> </ul> </li> <li> <p>HMAC keys (symmetric)</p> <ul> <li> <p> <code>HMAC_224</code> </p> </li> <li> <p> <code>HMAC_256</code> </p> </li> <li> <p> <code>HMAC_384</code> </p> </li> <li> <p> <code>HMAC_512</code> </p> </li> </ul> </li> <li> <p>Asymmetric RSA key pairs</p> <ul> <li> <p> <code>RSA_2048</code> </p> </li> <li> <p> <code>RSA_3072</code> </p> </li> <li> <p> <code>RSA_4096</code> </p> </li> </ul> </li> <li> <p>Asymmetric NIST-recommended elliptic curve key pairs</p> <ul> <li> <p> <code>ECC_NIST_P256</code> (secp256r1)</p> </li> <li> <p> <code>ECC_NIST_P384</code> (secp384r1)</p> </li> <li> <p> <code>ECC_NIST_P521</code> (secp521r1)</p> </li> </ul> </li> <li> <p>Other asymmetric elliptic curve key pairs</p> <ul> <li> <p> <code>ECC_SECG_P256K1</code> (secp256k1), commonly used for cryptocurrencies.</p> </li> </ul> </li> <li> <p>SM2 key pairs (China Regions only)</p> <ul> <li> <p> <code>SM2</code> </p> </li> </ul> </li> </ul>\"\
        },\
        \"Origin\":{\
          \"shape\":\"OriginType\",\
          \"documentation\":\"<p>The source of the key material for the KMS key. You cannot change the origin after you create the KMS key. The default is <code>AWS_KMS</code>, which means that KMS creates the key material.</p> <p>To <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-create-cmk.html\\\">create a KMS key with no key material</a> (for imported key material), set this value to <code>EXTERNAL</code>. For more information about importing key material into KMS, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">Importing Key Material</a> in the <i>Key Management Service Developer Guide</i>. The <code>EXTERNAL</code> origin value is valid only for symmetric KMS keys.</p> <p>To <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-cmk-keystore.html\\\">create a KMS key in an CloudHSM key store</a> and create its key material in the associated CloudHSM cluster, set this value to <code>AWS_CLOUDHSM</code>. You must also use the <code>CustomKeyStoreId</code> parameter to identify the CloudHSM key store. The <code>KeySpec</code> value must be <code>SYMMETRIC_DEFAULT</code>.</p> <p>To <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keys.html\\\">create a KMS key in an external key store</a>, set this value to <code>EXTERNAL_KEY_STORE</code>. You must also use the <code>CustomKeyStoreId</code> parameter to identify the external key store and the <code>XksKeyId</code> parameter to identify the associated external key. The <code>KeySpec</code> value must be <code>SYMMETRIC_DEFAULT</code>.</p>\"\
        },\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>Creates the KMS key in the specified <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>. The <code>ConnectionState</code> of the custom key store must be <code>CONNECTED</code>. To find the CustomKeyStoreID and ConnectionState use the <a>DescribeCustomKeyStores</a> operation.</p> <p>This parameter is valid only for symmetric encryption KMS keys in a single Region. You cannot create any other type of KMS key in a custom key store.</p> <p>When you create a KMS key in an CloudHSM key store, KMS generates a non-exportable 256-bit symmetric key in its associated CloudHSM cluster and associates it with the KMS key. When you create a KMS key in an external key store, you must use the <code>XksKeyId</code> parameter to specify an external key that serves as key material for the KMS key.</p>\"\
        },\
        \"BypassPolicyLockoutSafetyCheck\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Skips (\\\"bypasses\\\") the key policy lockout safety check. The default value is false.</p> <important> <p>Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key\\\">Default key policy</a> in the <i>Key Management Service Developer Guide</i>.</p> </important> <p>Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent <a>PutKeyPolicy</a> request on the KMS key.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Assigns one or more tags to the KMS key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the <a>TagResource</a> operation.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <note> <p>Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/abac.html\\\">ABAC for KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> </note> <p>To use this parameter, you must have <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:TagResource</a> permission in an IAM policy.</p> <p>Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.</p> <p>When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html\\\">Tagging Keys</a>.</p>\"\
        },\
        \"MultiRegion\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Creates a multi-Region primary key that you can replicate into other Amazon Web Services Regions. You cannot change this value after you create the KMS key. </p> <p>For a multi-Region key, set this parameter to <code>True</code>. For a single-Region KMS key, omit this parameter or set it to <code>False</code>. The default value is <code>False</code>.</p> <p>This operation supports <i>multi-Region keys</i>, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html\\\">Multi-Region keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>This value creates a <i>primary key</i>, not a replica. To create a <i>replica key</i>, use the <a>ReplicateKey</a> operation. </p> <p>You can create a symmetric or asymmetric multi-Region key, and you can create a multi-Region key with imported key material. However, you cannot create a multi-Region key in a custom key store.</p>\"\
        },\
        \"XksKeyId\":{\
          \"shape\":\"XksKeyIdType\",\
          \"documentation\":\"<p>Identifies the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key\\\">external key</a> that serves as key material for the KMS key in an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html\\\">external key store</a>. Specify the ID that the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-xks-proxy\\\">external key store proxy</a> uses to refer to the external key. For help, see the documentation for your external key store proxy.</p> <p>This parameter is required for a KMS key with an <code>Origin</code> value of <code>EXTERNAL_KEY_STORE</code>. It is not valid for KMS keys with any other <code>Origin</code> value.</p> <p>The external key must be an existing 256-bit AES symmetric encryption key hosted outside of Amazon Web Services in an external key manager associated with the external key store specified by the <code>CustomKeyStoreId</code> parameter. This key must be enabled and configured to perform encryption and decryption. Each KMS key in an external key store must use a different external key. For details, see <a href=\\\"https://docs.aws.amazon.com/create-xks-keys.html#xks-key-requirements\\\">Requirements for a KMS key in an external key store</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>Each KMS key in an external key store is associated two backing keys. One is key material that KMS generates. The other is the external key specified by this parameter. When you use the KMS key in an external key store to encrypt data, the encryption operation is performed first by KMS using the KMS key material, and then by the external key manager using the specified external key, a process known as <i>double encryption</i>. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-double-encryption\\\">Double encryption</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"CreateKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyMetadata\":{\
          \"shape\":\"KeyMetadata\",\
          \"documentation\":\"<p>Metadata associated with the KMS key.</p>\"\
        }\
      }\
    },\
    \"CustomKeyStoreHasCMKsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the custom key store contains KMS keys. After verifying that you do not need to use the KMS keys, use the <a>ScheduleKeyDeletion</a> operation to delete the KMS keys. After they are deleted, you can delete the custom key store.</p>\",\
      \"exception\":true\
    },\
    \"CustomKeyStoreIdType\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"CustomKeyStoreInvalidStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because of the <code>ConnectionState</code> of the custom key store. To get the <code>ConnectionState</code> of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p> <p>This exception is thrown under the following conditions:</p> <ul> <li> <p>You requested the <a>ConnectCustomKeyStore</a> operation on a custom key store with a <code>ConnectionState</code> of <code>DISCONNECTING</code> or <code>FAILED</code>. This operation is valid for all other <code>ConnectionState</code> values. To reconnect a custom key store in a <code>FAILED</code> state, disconnect it (<a>DisconnectCustomKeyStore</a>), then connect it (<code>ConnectCustomKeyStore</code>).</p> </li> <li> <p>You requested the <a>CreateKey</a> operation in a custom key store that is not connected. This operations is valid only when the custom key store <code>ConnectionState</code> is <code>CONNECTED</code>.</p> </li> <li> <p>You requested the <a>DisconnectCustomKeyStore</a> operation on a custom key store with a <code>ConnectionState</code> of <code>DISCONNECTING</code> or <code>DISCONNECTED</code>. This operation is valid for all other <code>ConnectionState</code> values.</p> </li> <li> <p>You requested the <a>UpdateCustomKeyStore</a> or <a>DeleteCustomKeyStore</a> operation on a custom key store that is not disconnected. This operation is valid only when the custom key store <code>ConnectionState</code> is <code>DISCONNECTED</code>.</p> </li> <li> <p>You requested the <a>GenerateRandom</a> operation in an CloudHSM key store that is not connected. This operation is valid only when the CloudHSM key store <code>ConnectionState</code> is <code>CONNECTED</code>. </p> </li> </ul>\",\
      \"exception\":true\
    },\
    \"CustomKeyStoreNameInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified custom key store name is already assigned to another custom key store in the account. Try again with a custom key store name that is unique in the account.</p>\",\
      \"exception\":true\
    },\
    \"CustomKeyStoreNameType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"CustomKeyStoreNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because KMS cannot find a custom key store with the specified key store name or ID.</p>\",\
      \"exception\":true\
    },\
    \"CustomKeyStoreType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWS_CLOUDHSM\",\
        \"EXTERNAL_KEY_STORE\"\
      ]\
    },\
    \"CustomKeyStoresList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CustomKeyStoresListEntry\"}\
    },\
    \"CustomKeyStoresListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>A unique identifier for the custom key store.</p>\"\
        },\
        \"CustomKeyStoreName\":{\
          \"shape\":\"CustomKeyStoreNameType\",\
          \"documentation\":\"<p>The user-specified friendly name for the custom key store.</p>\"\
        },\
        \"CloudHsmClusterId\":{\
          \"shape\":\"CloudHsmClusterIdType\",\
          \"documentation\":\"<p>A unique identifier for the CloudHSM cluster that is associated with an CloudHSM key store. This field appears only when the <code>CustomKeyStoreType</code> is <code>AWS_CLOUDHSM</code>.</p>\"\
        },\
        \"TrustAnchorCertificate\":{\
          \"shape\":\"TrustAnchorCertificateType\",\
          \"documentation\":\"<p>The trust anchor certificate of the CloudHSM cluster associated with an CloudHSM key store. When you <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr\\\">initialize the cluster</a>, you create this certificate and save it in the <code>customerCA.crt</code> file.</p> <p>This field appears only when the <code>CustomKeyStoreType</code> is <code>AWS_CLOUDHSM</code>.</p>\"\
        },\
        \"ConnectionState\":{\
          \"shape\":\"ConnectionStateType\",\
          \"documentation\":\"<p>Indicates whether the custom key store is connected to its backing key store. For an CloudHSM key store, the <code>ConnectionState</code> indicates whether it is connected to its CloudHSM cluster. For an external key store, the <code>ConnectionState</code> indicates whether it is connected to the external key store proxy that communicates with your external key manager.</p> <p>You can create and use KMS keys in your custom key stores only when its <code>ConnectionState</code> is <code>CONNECTED</code>.</p> <p>The <code>ConnectionState</code> value is <code>DISCONNECTED</code> only if the key store has never been connected or you use the <a>DisconnectCustomKeyStore</a> operation to disconnect it. If the value is <code>CONNECTED</code> but you are having trouble using the custom key store, make sure that the backing key store is reachable and active. For an CloudHSM key store, verify that its associated CloudHSM cluster is active and contains at least one active HSM. For an external key store, verify that the external key store proxy and external key manager are connected and enabled.</p> <p>A value of <code>FAILED</code> indicates that an attempt to connect was unsuccessful. The <code>ConnectionErrorCode</code> field in the response indicates the cause of the failure. For help resolving a connection failure, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html\\\">Troubleshooting a custom key store</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"ConnectionErrorCode\":{\
          \"shape\":\"ConnectionErrorCodeType\",\
          \"documentation\":\"<p>Describes the connection error. This field appears in the response only when the <code>ConnectionState</code> is <code>FAILED</code>.</p> <p>Many failures can be resolved by updating the properties of the custom key store. To update a custom key store, disconnect it (<a>DisconnectCustomKeyStore</a>), correct the errors (<a>UpdateCustomKeyStore</a>), and try to connect again (<a>ConnectCustomKeyStore</a>). For additional help resolving these errors, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed\\\">How to Fix a Connection Failure</a> in <i>Key Management Service Developer Guide</i>.</p> <p> <b>All custom key stores:</b> </p> <ul> <li> <p> <code>INTERNAL_ERROR</code> â KMS could not complete the request due to an internal error. Retry the request. For <code>ConnectCustomKeyStore</code> requests, disconnect the custom key store before trying to connect again.</p> </li> <li> <p> <code>NETWORK_ERRORS</code> â Network errors are preventing KMS from connecting the custom key store to its backing key store.</p> </li> </ul> <p> <b>CloudHSM key stores:</b> </p> <ul> <li> <p> <code>CLUSTER_NOT_FOUND</code> â KMS cannot find the CloudHSM cluster with the specified cluster ID.</p> </li> <li> <p> <code>INSUFFICIENT_CLOUDHSM_HSMS</code> â The associated CloudHSM cluster does not contain any active HSMs. To connect a custom key store to its CloudHSM cluster, the cluster must contain at least one active HSM.</p> </li> <li> <p> <code>INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET</code> â At least one private subnet associated with the CloudHSM cluster doesn't have any available IP addresses. A CloudHSM key store connection requires one free IP address in each of the associated private subnets, although two are preferable. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed\\\">How to Fix a Connection Failure</a> in the <i>Key Management Service Developer Guide</i>.</p> </li> <li> <p> <code>INVALID_CREDENTIALS</code> â The <code>KeyStorePassword</code> for the custom key store doesn't match the current password of the <code>kmsuser</code> crypto user in the CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must change the <code>kmsuser</code> account password and update the <code>KeyStorePassword</code> value for the custom key store.</p> </li> <li> <p> <code>SUBNET_NOT_FOUND</code> â A subnet in the CloudHSM cluster configuration was deleted. If KMS cannot find all of the subnets in the cluster configuration, attempts to connect the custom key store to the CloudHSM cluster fail. To fix this error, create a cluster from a recent backup and associate it with your custom key store. (This process creates a new cluster configuration with a VPC and private subnets.) For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed\\\">How to Fix a Connection Failure</a> in the <i>Key Management Service Developer Guide</i>.</p> </li> <li> <p> <code>USER_LOCKED_OUT</code> â The <code>kmsuser</code> CU account is locked out of the associated CloudHSM cluster due to too many failed password attempts. Before you can connect your custom key store to its CloudHSM cluster, you must change the <code>kmsuser</code> account password and update the key store password value for the custom key store.</p> </li> <li> <p> <code>USER_LOGGED_IN</code> â The <code>kmsuser</code> CU account is logged into the associated CloudHSM cluster. This prevents KMS from rotating the <code>kmsuser</code> account password and logging into the cluster. Before you can connect your custom key store to its CloudHSM cluster, you must log the <code>kmsuser</code> CU out of the cluster. If you changed the <code>kmsuser</code> password to log into the cluster, you must also and update the key store password value for the custom key store. For help, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#login-kmsuser-2\\\">How to Log Out and Reconnect</a> in the <i>Key Management Service Developer Guide</i>.</p> </li> <li> <p> <code>USER_NOT_FOUND</code> â KMS cannot find a <code>kmsuser</code> CU account in the associated CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must create a <code>kmsuser</code> CU account in the cluster, and then update the key store password value for the custom key store.</p> </li> </ul> <p> <b>External key stores:</b> </p> <ul> <li> <p> <code>INVALID_CREDENTIALS</code> â One or both of the <code>XksProxyAuthenticationCredential</code> values is not valid on the specified external key store proxy.</p> </li> <li> <p> <code>XKS_PROXY_ACCESS_DENIED</code> â KMS requests are denied access to the external key store proxy. If the external key store proxy has authorization rules, verify that they permit KMS to communicate with the proxy on your behalf.</p> </li> <li> <p> <code>XKS_PROXY_INVALID_CONFIGURATION</code> â A configuration error is preventing the external key store from connecting to its proxy. Verify the value of the <code>XksProxyUriPath</code>.</p> </li> <li> <p> <code>XKS_PROXY_INVALID_RESPONSE</code> â KMS cannot interpret the response from the external key store proxy. If you see this connection error code repeatedly, notify your external key store proxy vendor.</p> </li> <li> <p> <code>XKS_PROXY_INVALID_TLS_CONFIGURATION</code> â KMS cannot connect to the external key store proxy because the TLS configuration is invalid. Verify that the XKS proxy supports TLS 1.2 or 1.3. Also, verify that the TLS certificate is not expired, and that it matches the hostname in the <code>XksProxyUriEndpoint</code> value, and that it is signed by a certificate authority included in the <a href=\\\"https://github.com/aws/aws-kms-xksproxy-api-spec/blob/main/TrustedCertificateAuthorities\\\">Trusted Certificate Authorities</a> list.</p> </li> <li> <p> <code>XKS_PROXY_NOT_REACHABLE</code> â KMS can't communicate with your external key store proxy. Verify that the <code>XksProxyUriEndpoint</code> and <code>XksProxyUriPath</code> are correct. Use the tools for your external key store proxy to verify that the proxy is active and available on its network. Also, verify that your external key manager instances are operating properly. Connection attempts fail with this connection error code if the proxy reports that all external key manager instances are unavailable.</p> </li> <li> <p> <code>XKS_PROXY_TIMED_OUT</code> â KMS can connect to the external key store proxy, but the proxy does not respond to KMS in the time allotted. If you see this connection error code repeatedly, notify your external key store proxy vendor.</p> </li> <li> <p> <code>XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION</code> â The Amazon VPC endpoint service configuration doesn't conform to the requirements for an KMS external key store.</p> <ul> <li> <p>The VPC endpoint service must be an endpoint service for interface endpoints in the caller's Amazon Web Services account.</p> </li> <li> <p>It must have a network load balancer (NLB) connected to at least two subnets, each in a different Availability Zone.</p> </li> <li> <p>The <code>Allow principals</code> list must include the KMS service principal for the Region, <code>cks.kms.&lt;region&gt;.amazonaws.com</code>, such as <code>cks.kms.us-east-1.amazonaws.com</code>.</p> </li> <li> <p>It must <i>not</i> require <a href=\\\"https://docs.aws.amazon.com/vpc/latest/privatelink/create-endpoint-service.html\\\">acceptance</a> of connection requests.</p> </li> <li> <p>It must have a private DNS name. The private DNS name for an external key store with <code>VPC_ENDPOINT_SERVICE</code> connectivity must be unique in its Amazon Web Services Region.</p> </li> <li> <p>The domain of the private DNS name must have a <a href=\\\"https://docs.aws.amazon.com/vpc/latest/privatelink/verify-domains.html\\\">verification status</a> of <code>verified</code>.</p> </li> <li> <p>The <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html\\\">TLS certificate</a> specifies the private DNS hostname at which the endpoint is reachable.</p> </li> </ul> </li> <li> <p> <code>XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND</code> â KMS can't find the VPC endpoint service that it uses to communicate with the external key store proxy. Verify that the <code>XksProxyVpcEndpointServiceName</code> is correct and the KMS service principal has service consumer permissions on the Amazon VPC endpoint service.</p> </li> </ul>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time when the custom key store was created.</p>\"\
        },\
        \"CustomKeyStoreType\":{\
          \"shape\":\"CustomKeyStoreType\",\
          \"documentation\":\"<p>Indicates the type of the custom key store. <code>AWS_CLOUDHSM</code> indicates a custom key store backed by an CloudHSM cluster. <code>EXTERNAL_KEY_STORE</code> indicates a custom key store backed by an external key store proxy and external key manager outside of Amazon Web Services.</p>\"\
        },\
        \"XksProxyConfiguration\":{\
          \"shape\":\"XksProxyConfigurationType\",\
          \"documentation\":\"<p>Configuration settings for the external key store proxy (XKS proxy). The external key store proxy translates KMS requests into a format that your external key manager can understand. The proxy configuration includes connection information that KMS requires.</p> <p>This field appears only when the <code>CustomKeyStoreType</code> is <code>EXTERNAL_KEY_STORE</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about each custom key store in the custom key store list.</p>\"\
    },\
    \"CustomerMasterKeySpec\":{\
      \"type\":\"string\",\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"This enum has been deprecated. Instead, use the KeySpec enum.\",\
      \"enum\":[\
        \"RSA_2048\",\
        \"RSA_3072\",\
        \"RSA_4096\",\
        \"ECC_NIST_P256\",\
        \"ECC_NIST_P384\",\
        \"ECC_NIST_P521\",\
        \"ECC_SECG_P256K1\",\
        \"SYMMETRIC_DEFAULT\",\
        \"HMAC_224\",\
        \"HMAC_256\",\
        \"HMAC_384\",\
        \"HMAC_512\",\
        \"SM2\"\
      ]\
    },\
    \"DataKeyPairSpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RSA_2048\",\
        \"RSA_3072\",\
        \"RSA_4096\",\
        \"ECC_NIST_P256\",\
        \"ECC_NIST_P384\",\
        \"ECC_NIST_P521\",\
        \"ECC_SECG_P256K1\",\
        \"SM2\"\
      ]\
    },\
    \"DataKeySpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AES_256\",\
        \"AES_128\"\
      ]\
    },\
    \"DateType\":{\"type\":\"timestamp\"},\
    \"DecryptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CiphertextBlob\"],\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>Ciphertext to be decrypted. The blob includes metadata.</p>\"\
        },\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Specifies the encryption context to use when decrypting the data. An encryption context is valid only for <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a> with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context.</p> <p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens. </p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Specifies the KMS key that KMS uses to decrypt the ciphertext.</p> <p>Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the <code>Decrypt</code> operation throws an <code>IncorrectKeyException</code>.</p> <p>This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"EncryptionAlgorithm\":{\
          \"shape\":\"EncryptionAlgorithmSpec\",\
          \"documentation\":\"<p>Specifies the encryption algorithm that will be used to decrypt the ciphertext. Specify the same algorithm that was used to encrypt the data. If you specify a different algorithm, the <code>Decrypt</code> operation fails.</p> <p>This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. The default value, <code>SYMMETRIC_DEFAULT</code>, represents the only supported algorithm that is valid for symmetric encryption KMS keys.</p>\"\
        },\
        \"Recipient\":{\
          \"shape\":\"RecipientInfo\",\
          \"documentation\":\"<p>A signed <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc\\\">attestation document</a> from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is <code>RSAES_OAEP_SHA_256</code>. </p> <p>This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the <a href=\\\"https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk\\\">Amazon Web Services Nitro Enclaves SDK</a> or any Amazon Web Services SDK.</p> <p>When you use this parameter, instead of returning the plaintext data, KMS encrypts the plaintext data with the public key in the attestation document, and returns the resulting ciphertext in the <code>CiphertextForRecipient</code> field in the response. This ciphertext can be decrypted only with the private key in the enclave. The <code>Plaintext</code> field in the response is null or empty.</p> <p>For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"DecryptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key that was used to decrypt the ciphertext.</p>\"\
        },\
        \"Plaintext\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>Decrypted plaintext data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p> <p>If the response includes the <code>CiphertextForRecipient</code> field, the <code>Plaintext</code> field is null or empty.</p>\"\
        },\
        \"EncryptionAlgorithm\":{\
          \"shape\":\"EncryptionAlgorithmSpec\",\
          \"documentation\":\"<p>The encryption algorithm that was used to decrypt the ciphertext.</p>\"\
        },\
        \"CiphertextForRecipient\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The plaintext data encrypted with the public key in the attestation document. </p> <p>This field is included in the response only when the <code>Recipient</code> parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"DeleteAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AliasName\"],\
      \"members\":{\
        \"AliasName\":{\
          \"shape\":\"AliasNameType\",\
          \"documentation\":\"<p>The alias to be deleted. The alias name must begin with <code>alias/</code> followed by the alias name, such as <code>alias/ExampleAlias</code>.</p>\"\
        }\
      }\
    },\
    \"DeleteCustomKeyStoreRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CustomKeyStoreId\"],\
      \"members\":{\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>Enter the ID of the custom key store you want to delete. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p>\"\
        }\
      }\
    },\
    \"DeleteCustomKeyStoreResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteImportedKeyMaterialRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the KMS key from which you are deleting imported key material. The <code>Origin</code> of the KMS key must be <code>EXTERNAL</code>.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"DependencyTimeoutException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The system timed out while trying to fulfill the request. You can retry the request.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"DescribeCustomKeyStoresRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>Gets only information about the specified custom key store. Enter the key store ID.</p> <p>By default, this operation gets information about all custom key stores in the account and Region. To limit the output to a particular custom key store, provide either the <code>CustomKeyStoreId</code> or <code>CustomKeyStoreName</code> parameter, but not both.</p>\"\
        },\
        \"CustomKeyStoreName\":{\
          \"shape\":\"CustomKeyStoreNameType\",\
          \"documentation\":\"<p>Gets only information about the specified custom key store. Enter the friendly name of the custom key store.</p> <p>By default, this operation gets information about all custom key stores in the account and Region. To limit the output to a particular custom key store, provide either the <code>CustomKeyStoreId</code> or <code>CustomKeyStoreName</code> parameter, but not both.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        }\
      }\
    },\
    \"DescribeCustomKeyStoresResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomKeyStores\":{\
          \"shape\":\"CustomKeyStoresList\",\
          \"documentation\":\"<p>Contains metadata about each custom key store.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"DescribeKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Describes the specified KMS key. </p> <p>If you specify a predefined Amazon Web Services alias (an Amazon Web Services alias with no key ID), KMS associates the alias with an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html##aws-managed-cmk\\\">Amazon Web Services managed key</a> and returns its <code>KeyId</code> and <code>Arn</code> in the response.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"DescribeKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyMetadata\":{\
          \"shape\":\"KeyMetadata\",\
          \"documentation\":\"<p>Metadata associated with the key.</p>\"\
        }\
      }\
    },\
    \"DescriptionType\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"min\":0\
    },\
    \"DisableKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the KMS key to disable.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"DisableKeyRotationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies a symmetric encryption KMS key. You cannot enable or disable automatic rotation of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html#asymmetric-cmks\\\">asymmetric KMS keys</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html\\\">HMAC KMS keys</a>, KMS keys with <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">imported key material</a>, or KMS keys in a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"DisabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified KMS key is not enabled.</p>\",\
      \"exception\":true\
    },\
    \"DisconnectCustomKeyStoreRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CustomKeyStoreId\"],\
      \"members\":{\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>Enter the ID of the custom key store you want to disconnect. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p>\"\
        }\
      }\
    },\
    \"DisconnectCustomKeyStoreResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DryRunOperationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p> The request was rejected because the DryRun parameter was specified. </p>\",\
      \"exception\":true\
    },\
    \"EnableKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the KMS key to enable.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"EnableKeyRotationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies a symmetric encryption KMS key. You cannot enable automatic rotation of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">asymmetric KMS keys</a>, <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html\\\">HMAC KMS keys</a>, KMS keys with <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html\\\">imported key material</a>, or KMS keys in a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>. To enable or disable automatic rotation of a set of related <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate\\\">multi-Region keys</a>, set the property on the primary key.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"EncryptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"Plaintext\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the KMS key to use in the encryption operation. The KMS key must have a <code>KeyUsage</code> of <code>ENCRYPT_DECRYPT</code>. To find the <code>KeyUsage</code> of a KMS key, use the <a>DescribeKey</a> operation.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"Plaintext\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>Data to be encrypted.</p>\"\
        },\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Specifies the encryption context that will be used to encrypt the data. An encryption context is valid only for <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a> with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context. </p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"EncryptionAlgorithm\":{\
          \"shape\":\"EncryptionAlgorithmSpec\",\
          \"documentation\":\"<p>Specifies the encryption algorithm that KMS will use to encrypt the plaintext message. The algorithm must be compatible with the KMS key that you specify.</p> <p>This parameter is required only for asymmetric KMS keys. The default value, <code>SYMMETRIC_DEFAULT</code>, is the algorithm used for symmetric encryption KMS keys. If you are using an asymmetric KMS key, we recommend RSAES_OAEP_SHA_256.</p> <p>The SM2PKE algorithm is only available in China Regions.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"EncryptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted plaintext. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key that was used to encrypt the plaintext.</p>\"\
        },\
        \"EncryptionAlgorithm\":{\
          \"shape\":\"EncryptionAlgorithmSpec\",\
          \"documentation\":\"<p>The encryption algorithm that was used to encrypt the plaintext.</p>\"\
        }\
      }\
    },\
    \"EncryptionAlgorithmSpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SYMMETRIC_DEFAULT\",\
        \"RSAES_OAEP_SHA_1\",\
        \"RSAES_OAEP_SHA_256\",\
        \"SM2PKE\"\
      ]\
    },\
    \"EncryptionAlgorithmSpecList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EncryptionAlgorithmSpec\"}\
    },\
    \"EncryptionContextKey\":{\"type\":\"string\"},\
    \"EncryptionContextType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"EncryptionContextKey\"},\
      \"value\":{\"shape\":\"EncryptionContextValue\"}\
    },\
    \"EncryptionContextValue\":{\"type\":\"string\"},\
    \"ErrorMessageType\":{\"type\":\"string\"},\
    \"ExpirationModelType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"KEY_MATERIAL_EXPIRES\",\
        \"KEY_MATERIAL_DOES_NOT_EXPIRE\"\
      ]\
    },\
    \"ExpiredImportTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified import token is expired. Use <a>GetParametersForImport</a> to get a new import token and public key, use the new public key to encrypt the key material, and then try the request again.</p>\",\
      \"exception\":true\
    },\
    \"GenerateDataKeyPairRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"KeyPairSpec\"\
      ],\
      \"members\":{\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Specifies the encryption context that will be used when encrypting the private key in the data key pair.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"KeyPairSpec\":{\
          \"shape\":\"DataKeyPairSpec\",\
          \"documentation\":\"<p>Determines the type of data key pair that is generated. </p> <p>The KMS rule that restricts the use of asymmetric RSA and SM2 KMS keys to encrypt and decrypt or to sign and verify (but not both), and the rule that permits you to use ECC KMS keys only to sign and verify, are not effective on data key pairs, which are used outside of KMS. The SM2 key spec is only available in China Regions.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"Recipient\":{\
          \"shape\":\"RecipientInfo\",\
          \"documentation\":\"<p>A signed <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc\\\">attestation document</a> from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is <code>RSAES_OAEP_SHA_256</code>. </p> <p>This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the <a href=\\\"https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk\\\">Amazon Web Services Nitro Enclaves SDK</a> or any Amazon Web Services SDK.</p> <p>When you use this parameter, instead of returning a plaintext copy of the private data key, KMS encrypts the plaintext private data key under the public key in the attestation document, and returns the resulting ciphertext in the <code>CiphertextForRecipient</code> field in the response. This ciphertext can be decrypted only with the private key in the enclave. The <code>CiphertextBlob</code> field in the response contains a copy of the private data key encrypted under the KMS key specified by the <code>KeyId</code> parameter. The <code>PrivateKeyPlaintext</code> field in the response is null or empty.</p> <p>For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyPairResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrivateKeyCiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>\"\
        },\
        \"PrivateKeyPlaintext\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>The plaintext copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p> <p>If the response includes the <code>CiphertextForRecipient</code> field, the <code>PrivateKeyPlaintext</code> field is null or empty.</p>\"\
        },\
        \"PublicKey\":{\
          \"shape\":\"PublicKeyType\",\
          \"documentation\":\"<p>The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key that encrypted the private key.</p>\"\
        },\
        \"KeyPairSpec\":{\
          \"shape\":\"DataKeyPairSpec\",\
          \"documentation\":\"<p>The type of data key pair that was generated.</p>\"\
        },\
        \"CiphertextForRecipient\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The plaintext private data key encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave. </p> <p>This field is included in the response only when the <code>Recipient</code> parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyPairWithoutPlaintextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"KeyPairSpec\"\
      ],\
      \"members\":{\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Specifies the encryption context that will be used when encrypting the private key in the data key pair.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation. </p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"KeyPairSpec\":{\
          \"shape\":\"DataKeyPairSpec\",\
          \"documentation\":\"<p>Determines the type of data key pair that is generated.</p> <p>The KMS rule that restricts the use of asymmetric RSA and SM2 KMS keys to encrypt and decrypt or to sign and verify (but not both), and the rule that permits you to use ECC KMS keys only to sign and verify, are not effective on data key pairs, which are used outside of KMS. The SM2 key spec is only available in China Regions.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyPairWithoutPlaintextResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrivateKeyCiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>\"\
        },\
        \"PublicKey\":{\
          \"shape\":\"PublicKeyType\",\
          \"documentation\":\"<p>The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key that encrypted the private key.</p>\"\
        },\
        \"KeyPairSpec\":{\
          \"shape\":\"DataKeyPairSpec\",\
          \"documentation\":\"<p>The type of data key pair that was generated.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Specifies the encryption context that will be used when encrypting the data key.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"NumberOfBytes\":{\
          \"shape\":\"NumberOfBytesType\",\
          \"documentation\":\"<p>Specifies the length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For 128-bit (16-byte) and 256-bit (32-byte) data keys, use the <code>KeySpec</code> parameter.</p> <p>You must specify either the <code>KeySpec</code> or the <code>NumberOfBytes</code> parameter (but not both) in every <code>GenerateDataKey</code> request.</p>\"\
        },\
        \"KeySpec\":{\
          \"shape\":\"DataKeySpec\",\
          \"documentation\":\"<p>Specifies the length of the data key. Use <code>AES_128</code> to generate a 128-bit symmetric key, or <code>AES_256</code> to generate a 256-bit symmetric key.</p> <p>You must specify either the <code>KeySpec</code> or the <code>NumberOfBytes</code> parameter (but not both) in every <code>GenerateDataKey</code> request.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"Recipient\":{\
          \"shape\":\"RecipientInfo\",\
          \"documentation\":\"<p>A signed <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc\\\">attestation document</a> from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is <code>RSAES_OAEP_SHA_256</code>. </p> <p>This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the <a href=\\\"https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk\\\">Amazon Web Services Nitro Enclaves SDK</a> or any Amazon Web Services SDK.</p> <p>When you use this parameter, instead of returning the plaintext data key, KMS encrypts the plaintext data key under the public key in the attestation document, and returns the resulting ciphertext in the <code>CiphertextForRecipient</code> field in the response. This ciphertext can be decrypted only with the private key in the enclave. The <code>CiphertextBlob</code> field in the response contains a copy of the data key encrypted under the KMS key specified by the <code>KeyId</code> parameter. The <code>Plaintext</code> field in the response is null or empty.</p> <p>For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted copy of the data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>\"\
        },\
        \"Plaintext\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>The plaintext data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded. Use this data key to encrypt your data outside of KMS. Then, remove it from memory as soon as possible.</p> <p>If the response includes the <code>CiphertextForRecipient</code> field, the <code>Plaintext</code> field is null or empty.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key that encrypted the data key.</p>\"\
        },\
        \"CiphertextForRecipient\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The plaintext data key encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave. </p> <p>This field is included in the response only when the <code>Recipient</code> parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyWithoutPlaintextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"EncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Specifies the encryption context that will be used when encrypting the data key.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"KeySpec\":{\
          \"shape\":\"DataKeySpec\",\
          \"documentation\":\"<p>The length of the data key. Use <code>AES_128</code> to generate a 128-bit symmetric key, or <code>AES_256</code> to generate a 256-bit symmetric key.</p>\"\
        },\
        \"NumberOfBytes\":{\
          \"shape\":\"NumberOfBytesType\",\
          \"documentation\":\"<p>The length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use the <code>KeySpec</code> field instead of this one.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateDataKeyWithoutPlaintextResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key that encrypted the data key.</p>\"\
        }\
      }\
    },\
    \"GenerateMacRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Message\",\
        \"KeyId\",\
        \"MacAlgorithm\"\
      ],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>The message to be hashed. Specify a message of up to 4,096 bytes. </p> <p> <code>GenerateMac</code> and <a>VerifyMac</a> do not provide special handling for message digests. If you generate an HMAC for a hash digest of a message, you must verify the HMAC of the same hash digest.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The HMAC KMS key to use in the operation. The MAC algorithm computes the HMAC for the message and the key as described in <a href=\\\"https://datatracker.ietf.org/doc/html/rfc2104\\\">RFC 2104</a>.</p> <p>To identify an HMAC KMS key, use the <a>DescribeKey</a> operation and see the <code>KeySpec</code> field in the response.</p>\"\
        },\
        \"MacAlgorithm\":{\
          \"shape\":\"MacAlgorithmSpec\",\
          \"documentation\":\"<p>The MAC algorithm used in the operation.</p> <p> The algorithm must be compatible with the HMAC KMS key that you specify. To find the MAC algorithms that your HMAC KMS key supports, use the <a>DescribeKey</a> operation and see the <code>MacAlgorithms</code> field in the <code>DescribeKey</code> response.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateMacResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Mac\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The hash-based message authentication code (HMAC) that was generated for the specified message, HMAC KMS key, and MAC algorithm.</p> <p>This is the standard, raw HMAC defined in <a href=\\\"https://datatracker.ietf.org/doc/html/rfc2104\\\">RFC 2104</a>.</p>\"\
        },\
        \"MacAlgorithm\":{\
          \"shape\":\"MacAlgorithmSpec\",\
          \"documentation\":\"<p>The MAC algorithm that was used to generate the HMAC.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The HMAC KMS key used in the operation.</p>\"\
        }\
      }\
    },\
    \"GenerateRandomRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NumberOfBytes\":{\
          \"shape\":\"NumberOfBytesType\",\
          \"documentation\":\"<p>The length of the random byte string. This parameter is required.</p>\"\
        },\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>Generates the random byte string in the CloudHSM cluster that is associated with the specified CloudHSM key store. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p> <p>External key store IDs are not valid for this parameter. If you specify the ID of an external key store, <code>GenerateRandom</code> throws an <code>UnsupportedOperationException</code>.</p>\"\
        },\
        \"Recipient\":{\
          \"shape\":\"RecipientInfo\",\
          \"documentation\":\"<p>A signed <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc\\\">attestation document</a> from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is <code>RSAES_OAEP_SHA_256</code>. </p> <p>This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the <a href=\\\"https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk\\\">Amazon Web Services Nitro Enclaves SDK</a> or any Amazon Web Services SDK.</p> <p>When you use this parameter, instead of returning plaintext bytes, KMS encrypts the plaintext bytes under the public key in the attestation document, and returns the resulting ciphertext in the <code>CiphertextForRecipient</code> field in the response. This ciphertext can be decrypted only with the private key in the enclave. The <code>Plaintext</code> field in the response is null or empty.</p> <p>For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GenerateRandomResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Plaintext\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>The random byte string. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p> <p>If the response includes the <code>CiphertextForRecipient</code> field, the <code>Plaintext</code> field is null or empty.</p>\"\
        },\
        \"CiphertextForRecipient\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The plaintext random bytes encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave. </p> <p>This field is included in the response only when the <code>Recipient</code> parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GetKeyPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"PolicyName\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Gets the key policy for the specified KMS key.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyNameType\",\
          \"documentation\":\"<p>Specifies the name of the key policy. The only valid name is <code>default</code>. To get the names of key policies, use <a>ListKeyPolicies</a>.</p>\"\
        }\
      }\
    },\
    \"GetKeyPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>A key policy document in JSON format.</p>\"\
        }\
      }\
    },\
    \"GetKeyRotationStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Gets the rotation status for the specified KMS key.</p> <p>Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        }\
      }\
    },\
    \"GetKeyRotationStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyRotationEnabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A Boolean value that specifies whether key rotation is enabled.</p>\"\
        }\
      }\
    },\
    \"GetParametersForImportRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"WrappingAlgorithm\",\
        \"WrappingKeySpec\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the KMS key that will be associated with the imported key material. The <code>Origin</code> of the KMS key must be <code>EXTERNAL</code>.</p> <p>All KMS key types are supported, including multi-Region keys. However, you cannot import key material into a KMS key in a custom key store.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"WrappingAlgorithm\":{\
          \"shape\":\"AlgorithmSpec\",\
          \"documentation\":\"<p>The algorithm you will use with the RSA public key (<code>PublicKey</code>) in the response to protect your key material during import. For more information, see <a href=\\\"kms/latest/developerguide/importing-keys-get-public-key-and-token.html#select-wrapping-algorithm\\\">Select a wrapping algorithm</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>For RSA_AES wrapping algorithms, you encrypt your key material with an AES key that you generate, then encrypt your AES key with the RSA public key from KMS. For RSAES wrapping algorithms, you encrypt your key material directly with the RSA public key from KMS.</p> <p>The wrapping algorithms that you can use depend on the type of key material that you are importing. To import an RSA private key, you must use an RSA_AES wrapping algorithm.</p> <ul> <li> <p> <b>RSA_AES_KEY_WRAP_SHA_256</b> â Supported for wrapping RSA and ECC key material.</p> </li> <li> <p> <b>RSA_AES_KEY_WRAP_SHA_1</b> â Supported for wrapping RSA and ECC key material.</p> </li> <li> <p> <b>RSAES_OAEP_SHA_256</b> â Supported for all types of key material, except RSA key material (private key).</p> <p>You cannot use the RSAES_OAEP_SHA_256 wrapping algorithm with the RSA_2048 wrapping key spec to wrap ECC_NIST_P521 key material.</p> </li> <li> <p> <b>RSAES_OAEP_SHA_1</b> â Supported for all types of key material, except RSA key material (private key).</p> <p>You cannot use the RSAES_OAEP_SHA_1 wrapping algorithm with the RSA_2048 wrapping key spec to wrap ECC_NIST_P521 key material.</p> </li> <li> <p> <b>RSAES_PKCS1_V1_5</b> (Deprecated) â Supported only for symmetric encryption key material (and only in legacy mode).</p> </li> </ul>\"\
        },\
        \"WrappingKeySpec\":{\
          \"shape\":\"WrappingKeySpec\",\
          \"documentation\":\"<p>The type of RSA public key to return in the response. You will use this wrapping key with the specified wrapping algorithm to protect your key material during import. </p> <p>Use the longest RSA wrapping key that is practical. </p> <p>You cannot use an RSA_2048 public key to directly wrap an ECC_NIST_P521 private key. Instead, use an RSA_AES wrapping algorithm or choose a longer RSA public key.</p>\"\
        }\
      }\
    },\
    \"GetParametersForImportResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key to use in a subsequent <a>ImportKeyMaterial</a> request. This is the same KMS key specified in the <code>GetParametersForImport</code> request.</p>\"\
        },\
        \"ImportToken\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The import token to send in a subsequent <a>ImportKeyMaterial</a> request.</p>\"\
        },\
        \"PublicKey\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>The public key to use to encrypt the key material before importing it with <a>ImportKeyMaterial</a>.</p>\"\
        },\
        \"ParametersValidTo\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time at which the import token and public key are no longer valid. After this time, you cannot use them to make an <a>ImportKeyMaterial</a> request and you must send another <code>GetParametersForImport</code> request to get new ones.</p>\"\
        }\
      }\
    },\
    \"GetPublicKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the asymmetric KMS key that includes the public key.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GetPublicKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the asymmetric KMS key from which the public key was downloaded.</p>\"\
        },\
        \"PublicKey\":{\
          \"shape\":\"PublicKeyType\",\
          \"documentation\":\"<p>The exported public key. </p> <p>The value is a DER-encoded X.509 public key, also known as <code>SubjectPublicKeyInfo</code> (SPKI), as defined in <a href=\\\"https://tools.ietf.org/html/rfc5280\\\">RFC 5280</a>. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p> <p/>\"\
        },\
        \"CustomerMasterKeySpec\":{\
          \"shape\":\"CustomerMasterKeySpec\",\
          \"documentation\":\"<p>Instead, use the <code>KeySpec</code> field in the <code>GetPublicKey</code> response.</p> <p>The <code>KeySpec</code> and <code>CustomerMasterKeySpec</code> fields have the same value. We recommend that you use the <code>KeySpec</code> field in your code. However, to avoid breaking changes, KMS supports both fields.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"This field has been deprecated. Instead, use the KeySpec field.\"\
        },\
        \"KeySpec\":{\
          \"shape\":\"KeySpec\",\
          \"documentation\":\"<p>The type of the of the public key that was downloaded.</p>\"\
        },\
        \"KeyUsage\":{\
          \"shape\":\"KeyUsageType\",\
          \"documentation\":\"<p>The permitted use of the public key. Valid values are <code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>. </p> <p>This information is critical. If a public key with <code>SIGN_VERIFY</code> key usage encrypts data outside of KMS, the ciphertext cannot be decrypted. </p>\"\
        },\
        \"EncryptionAlgorithms\":{\
          \"shape\":\"EncryptionAlgorithmSpecList\",\
          \"documentation\":\"<p>The encryption algorithms that KMS supports for this key. </p> <p>This information is critical. If a public key encrypts data outside of KMS by using an unsupported encryption algorithm, the ciphertext cannot be decrypted. </p> <p>This field appears in the response only when the <code>KeyUsage</code> of the public key is <code>ENCRYPT_DECRYPT</code>.</p>\"\
        },\
        \"SigningAlgorithms\":{\
          \"shape\":\"SigningAlgorithmSpecList\",\
          \"documentation\":\"<p>The signing algorithms that KMS supports for this key.</p> <p>This field appears in the response only when the <code>KeyUsage</code> of the public key is <code>SIGN_VERIFY</code>.</p>\"\
        }\
      }\
    },\
    \"GrantConstraints\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EncryptionContextSubset\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>A list of key-value pairs that must be included in the encryption context of the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operation</a> request. The grant allows the cryptographic operation only when the encryption context in the request includes the key-value pairs specified in this constraint, although it can include additional key-value pairs.</p>\"\
        },\
        \"EncryptionContextEquals\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>A list of key-value pairs that must match the encryption context in the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operation</a> request. The grant allows the operation only when the encryption context in the request is the same as the encryption context specified in this constraint.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Use this structure to allow <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a> in the grant only when the operation request includes the specified <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">encryption context</a>. </p> <p>KMS applies the grant constraints only to cryptographic operations that support an encryption context, that is, all cryptographic operations with a <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#symmetric-cmks\\\">symmetric KMS key</a>. Grant constraints are not applied to operations that do not support an encryption context, such as cryptographic operations with asymmetric KMS keys and management operations, such as <a>DescribeKey</a> or <a>RetireGrant</a>.</p> <important> <p>In a cryptographic operation, the encryption context in the decryption operation must be an exact, case-sensitive match for the keys and values in the encryption context of the encryption operation. Only the order of the pairs can vary.</p> <p>However, in a grant constraint, the key in each key-value pair is not case sensitive, but the value is case sensitive.</p> <p>To avoid confusion, do not use multiple encryption context pairs that differ only by case. To require a fully case-sensitive encryption context, use the <code>kms:EncryptionContext:</code> and <code>kms:EncryptionContextKeys</code> conditions in an IAM or key policy. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-context\\\">kms:EncryptionContext:</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> </important>\"\
    },\
    \"GrantIdType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"GrantList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GrantListEntry\"}\
    },\
    \"GrantListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The unique identifier for the KMS key to which the grant applies.</p>\"\
        },\
        \"GrantId\":{\
          \"shape\":\"GrantIdType\",\
          \"documentation\":\"<p>The unique identifier for the grant.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"GrantNameType\",\
          \"documentation\":\"<p>The friendly name that identifies the grant. If a name was provided in the <a>CreateGrant</a> request, that name is returned. Otherwise this value is null.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time when the grant was created.</p>\"\
        },\
        \"GranteePrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The identity that gets the permissions in the grant.</p> <p>The <code>GranteePrincipal</code> field in the <code>ListGrants</code> response usually contains the user or role designated as the grantee principal in the grant. However, when the grantee principal in the grant is an Amazon Web Services service, the <code>GranteePrincipal</code> field contains the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services\\\">service principal</a>, which might represent several different grantee principals.</p>\"\
        },\
        \"RetiringPrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The principal that can retire the grant.</p>\"\
        },\
        \"IssuingAccount\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The Amazon Web Services account under which the grant was issued.</p>\"\
        },\
        \"Operations\":{\
          \"shape\":\"GrantOperationList\",\
          \"documentation\":\"<p>The list of operations permitted by the grant.</p>\"\
        },\
        \"Constraints\":{\
          \"shape\":\"GrantConstraints\",\
          \"documentation\":\"<p>A list of key-value pairs that must be present in the encryption context of certain subsequent operations that the grant allows.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a grant.</p>\"\
    },\
    \"GrantNameType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9:/_-]+$\"\
    },\
    \"GrantOperation\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Decrypt\",\
        \"Encrypt\",\
        \"GenerateDataKey\",\
        \"GenerateDataKeyWithoutPlaintext\",\
        \"ReEncryptFrom\",\
        \"ReEncryptTo\",\
        \"Sign\",\
        \"Verify\",\
        \"GetPublicKey\",\
        \"CreateGrant\",\
        \"RetireGrant\",\
        \"DescribeKey\",\
        \"GenerateDataKeyPair\",\
        \"GenerateDataKeyPairWithoutPlaintext\",\
        \"GenerateMac\",\
        \"VerifyMac\"\
      ]\
    },\
    \"GrantOperationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GrantOperation\"}\
    },\
    \"GrantTokenList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GrantTokenType\"},\
      \"max\":10,\
      \"min\":0\
    },\
    \"GrantTokenType\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"min\":1\
    },\
    \"ImportKeyMaterialRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"ImportToken\",\
        \"EncryptedKeyMaterial\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The identifier of the KMS key that will be associated with the imported key material. This must be the same KMS key specified in the <code>KeyID</code> parameter of the corresponding <a>GetParametersForImport</a> request. The <code>Origin</code> of the KMS key must be <code>EXTERNAL</code> and its <code>KeyState</code> must be <code>PendingImport</code>. </p> <p>The KMS key can be a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, or asymmetric signing KMS key, including a <a href=\\\"kms/latest/developerguide/multi-region-keys-overview.html\\\">multi-Region key</a> of any supported type. You cannot perform this operation on a KMS key in a custom key store, or on a KMS key in a different Amazon Web Services account.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"ImportToken\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The import token that you received in the response to a previous <a>GetParametersForImport</a> request. It must be from the same response that contained the public key that you used to encrypt the key material.</p>\"\
        },\
        \"EncryptedKeyMaterial\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The encrypted key material to import. The key material must be encrypted under the public wrapping key that <a>GetParametersForImport</a> returned, using the wrapping algorithm that you specified in the same <code>GetParametersForImport</code> request.</p>\"\
        },\
        \"ValidTo\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time when the imported key material expires. This parameter is required when the value of the <code>ExpirationModel</code> parameter is <code>KEY_MATERIAL_EXPIRES</code>. Otherwise it is not valid.</p> <p>The value of this parameter must be a future date and time. The maximum value is 365 days from the request date.</p> <p>When the key material expires, KMS deletes the key material from the KMS key. Without its key material, the KMS key is unusable. To use the KMS key in cryptographic operations, you must reimport the same key material.</p> <p>You cannot change the <code>ExpirationModel</code> or <code>ValidTo</code> values for the current import after the request completes. To change either value, you must delete (<a>DeleteImportedKeyMaterial</a>) and reimport the key material.</p>\"\
        },\
        \"ExpirationModel\":{\
          \"shape\":\"ExpirationModelType\",\
          \"documentation\":\"<p>Specifies whether the key material expires. The default is <code>KEY_MATERIAL_EXPIRES</code>. For help with this choice, see <a href=\\\"https://docs.aws.amazon.com/en_us/kms/latest/developerguide/importing-keys.html#importing-keys-expiration\\\">Setting an expiration time</a> in the <i>Key Management Service Developer Guide</i>.</p> <p>When the value of <code>ExpirationModel</code> is <code>KEY_MATERIAL_EXPIRES</code>, you must specify a value for the <code>ValidTo</code> parameter. When value is <code>KEY_MATERIAL_DOES_NOT_EXPIRE</code>, you must omit the <code>ValidTo</code> parameter.</p> <p>You cannot change the <code>ExpirationModel</code> or <code>ValidTo</code> values for the current import after the request completes. To change either value, you must reimport the key material.</p>\"\
        }\
      }\
    },\
    \"ImportKeyMaterialResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"IncorrectKeyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified KMS key cannot decrypt the data. The <code>KeyId</code> in a <a>Decrypt</a> request and the <code>SourceKeyId</code> in a <a>ReEncrypt</a> request must identify the same KMS key that was used to encrypt the ciphertext.</p>\",\
      \"exception\":true\
    },\
    \"IncorrectKeyMaterialException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the key material in the request is, expired, invalid, or is not the same key material that was previously imported into this KMS key.</p>\",\
      \"exception\":true\
    },\
    \"IncorrectTrustAnchorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the trust anchor certificate in the request to create an CloudHSM key store is not the trust anchor certificate for the specified CloudHSM cluster.</p> <p>When you <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr\\\">initialize the CloudHSM cluster</a>, you create the trust anchor certificate and save it in the <code>customerCA.crt</code> file.</p>\",\
      \"exception\":true\
    },\
    \"InvalidAliasNameException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified alias name is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidArnException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because a specified ARN, or an ARN in a key policy, is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidCiphertextException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>From the <a>Decrypt</a> or <a>ReEncrypt</a> operation, the request was rejected because the specified ciphertext, or additional authenticated data incorporated into the ciphertext, such as the encryption context, is corrupted, missing, or otherwise invalid.</p> <p>From the <a>ImportKeyMaterial</a> operation, the request was rejected because KMS could not decrypt the encrypted (wrapped) key material. </p>\",\
      \"exception\":true\
    },\
    \"InvalidGrantIdException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified <code>GrantId</code> is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidGrantTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified grant token is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidImportTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the provided import token is invalid or is associated with a different KMS key.</p>\",\
      \"exception\":true\
    },\
    \"InvalidKeyUsageException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected for one of the following reasons: </p> <ul> <li> <p>The <code>KeyUsage</code> value of the KMS key is incompatible with the API operation.</p> </li> <li> <p>The encryption algorithm or signing algorithm specified for the operation is incompatible with the type of key material in the KMS key <code>(KeySpec</code>).</p> </li> </ul> <p>For encrypting, decrypting, re-encrypting, and generating data keys, the <code>KeyUsage</code> must be <code>ENCRYPT_DECRYPT</code>. For signing and verifying messages, the <code>KeyUsage</code> must be <code>SIGN_VERIFY</code>. For generating and verifying message authentication codes (MACs), the <code>KeyUsage</code> must be <code>GENERATE_VERIFY_MAC</code>. To find the <code>KeyUsage</code> of a KMS key, use the <a>DescribeKey</a> operation.</p> <p>To find the encryption or signing algorithms supported for a particular KMS key, use the <a>DescribeKey</a> operation.</p>\",\
      \"exception\":true\
    },\
    \"InvalidMarkerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the marker that specifies where pagination should next begin is not valid.</p>\",\
      \"exception\":true\
    },\
    \"KMSInternalException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because an internal exception occurred. The request can be retried.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"KMSInvalidMacException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the HMAC verification failed. HMAC verification fails when the HMAC computed by using the specified message, HMAC KMS key, and MAC algorithm does not match the HMAC specified in the request.</p>\",\
      \"exception\":true\
    },\
    \"KMSInvalidSignatureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the signature verification failed. Signature verification fails when it cannot confirm that signature was produced by signing the specified message with the specified KMS key and signing algorithm.</p>\",\
      \"exception\":true\
    },\
    \"KMSInvalidStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the state of the specified resource is not valid for this request.</p> <p>This exceptions means one of the following:</p> <ul> <li> <p>The key state of the KMS key is not compatible with the operation. </p> <p>To find the key state, use the <a>DescribeKey</a> operation. For more information about which key states are compatible with each KMS operation, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.</p> </li> <li> <p>For cryptographic operations on KMS keys in custom key stores, this exception represents a general failure with many possible causes. To identify the cause, see the error message that accompanies the exception.</p> </li> </ul>\",\
      \"exception\":true\
    },\
    \"KeyEncryptionMechanism\":{\
      \"type\":\"string\",\
      \"enum\":[\"RSAES_OAEP_SHA_256\"]\
    },\
    \"KeyIdType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"KeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeyListEntry\"}\
    },\
    \"KeyListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Unique identifier of the key.</p>\"\
        },\
        \"KeyArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>ARN of the key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about each entry in the key list.</p>\"\
    },\
    \"KeyManagerType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWS\",\
        \"CUSTOMER\"\
      ]\
    },\
    \"KeyMetadata\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"AWSAccountId\":{\
          \"shape\":\"AWSAccountIdType\",\
          \"documentation\":\"<p>The twelve-digit account ID of the Amazon Web Services account that owns the KMS key.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The globally unique identifier for the KMS key.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the KMS key. For examples, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms\\\">Key Management Service (KMS)</a> in the Example ARNs section of the <i>Amazon Web Services General Reference</i>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time when the KMS key was created.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether the KMS key is enabled. When <code>KeyState</code> is <code>Enabled</code> this value is true, otherwise it is false.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>The description of the KMS key.</p>\"\
        },\
        \"KeyUsage\":{\
          \"shape\":\"KeyUsageType\",\
          \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations\\\">cryptographic operations</a> for which you can use the KMS key.</p>\"\
        },\
        \"KeyState\":{\
          \"shape\":\"KeyState\",\
          \"documentation\":\"<p>The current status of the KMS key.</p> <p>For more information about how key state affects the use of a KMS key, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DeletionDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time after which KMS deletes this KMS key. This value is present only when the KMS key is scheduled for deletion, that is, when its <code>KeyState</code> is <code>PendingDeletion</code>.</p> <p>When the primary key in a multi-Region key is scheduled for deletion but still has replica keys, its key state is <code>PendingReplicaDeletion</code> and the length of its waiting period is displayed in the <code>PendingDeletionWindowInDays</code> field.</p>\"\
        },\
        \"ValidTo\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time at which the imported key material expires. When the key material expires, KMS deletes the key material and the KMS key becomes unusable. This value is present only for KMS keys whose <code>Origin</code> is <code>EXTERNAL</code> and whose <code>ExpirationModel</code> is <code>KEY_MATERIAL_EXPIRES</code>, otherwise this value is omitted.</p>\"\
        },\
        \"Origin\":{\
          \"shape\":\"OriginType\",\
          \"documentation\":\"<p>The source of the key material for the KMS key. When this value is <code>AWS_KMS</code>, KMS created the key material. When this value is <code>EXTERNAL</code>, the key material was imported or the KMS key doesn't have any key material. When this value is <code>AWS_CLOUDHSM</code>, the key material was created in the CloudHSM cluster associated with a custom key store.</p>\"\
        },\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>A unique identifier for the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a> that contains the KMS key. This field is present only when the KMS key is created in a custom key store.</p>\"\
        },\
        \"CloudHsmClusterId\":{\
          \"shape\":\"CloudHsmClusterIdType\",\
          \"documentation\":\"<p>The cluster ID of the CloudHSM cluster that contains the key material for the KMS key. When you create a KMS key in an CloudHSM <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html\\\">custom key store</a>, KMS creates the key material for the KMS key in the associated CloudHSM cluster. This field is present only when the KMS key is created in an CloudHSM key store.</p>\"\
        },\
        \"ExpirationModel\":{\
          \"shape\":\"ExpirationModelType\",\
          \"documentation\":\"<p>Specifies whether the KMS key's key material expires. This value is present only when <code>Origin</code> is <code>EXTERNAL</code>, otherwise this value is omitted.</p>\"\
        },\
        \"KeyManager\":{\
          \"shape\":\"KeyManagerType\",\
          \"documentation\":\"<p>The manager of the KMS key. KMS keys in your Amazon Web Services account are either customer managed or Amazon Web Services managed. For more information about the difference, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys\\\">KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"CustomerMasterKeySpec\":{\
          \"shape\":\"CustomerMasterKeySpec\",\
          \"documentation\":\"<p>Instead, use the <code>KeySpec</code> field.</p> <p>The <code>KeySpec</code> and <code>CustomerMasterKeySpec</code> fields have the same value. We recommend that you use the <code>KeySpec</code> field in your code. However, to avoid breaking changes, KMS supports both fields.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"This field has been deprecated. Instead, use the KeySpec field.\"\
        },\
        \"KeySpec\":{\
          \"shape\":\"KeySpec\",\
          \"documentation\":\"<p>Describes the type of key material in the KMS key.</p>\"\
        },\
        \"EncryptionAlgorithms\":{\
          \"shape\":\"EncryptionAlgorithmSpecList\",\
          \"documentation\":\"<p>The encryption algorithms that the KMS key supports. You cannot use the KMS key with other encryption algorithms within KMS.</p> <p>This value is present only when the <code>KeyUsage</code> of the KMS key is <code>ENCRYPT_DECRYPT</code>.</p>\"\
        },\
        \"SigningAlgorithms\":{\
          \"shape\":\"SigningAlgorithmSpecList\",\
          \"documentation\":\"<p>The signing algorithms that the KMS key supports. You cannot use the KMS key with other signing algorithms within KMS.</p> <p>This field appears only when the <code>KeyUsage</code> of the KMS key is <code>SIGN_VERIFY</code>.</p>\"\
        },\
        \"MultiRegion\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Indicates whether the KMS key is a multi-Region (<code>True</code>) or regional (<code>False</code>) key. This value is <code>True</code> for multi-Region primary and replica keys and <code>False</code> for regional KMS keys.</p> <p>For more information about multi-Region keys, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html\\\">Multi-Region keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"MultiRegionConfiguration\":{\
          \"shape\":\"MultiRegionConfiguration\",\
          \"documentation\":\"<p>Lists the primary and replica keys in same multi-Region key. This field is present only when the value of the <code>MultiRegion</code> field is <code>True</code>.</p> <p>For more information about any listed KMS key, use the <a>DescribeKey</a> operation.</p> <ul> <li> <p> <code>MultiRegionKeyType</code> indicates whether the KMS key is a <code>PRIMARY</code> or <code>REPLICA</code> key.</p> </li> <li> <p> <code>PrimaryKey</code> displays the key ARN and Region of the primary key. This field displays the current KMS key if it is the primary key.</p> </li> <li> <p> <code>ReplicaKeys</code> displays the key ARNs and Regions of all replica keys. This field includes the current KMS key if it is a replica key.</p> </li> </ul>\"\
        },\
        \"PendingDeletionWindowInDays\":{\
          \"shape\":\"PendingWindowInDaysType\",\
          \"documentation\":\"<p>The waiting period before the primary key in a multi-Region key is deleted. This waiting period begins when the last of its replica keys is deleted. This value is present only when the <code>KeyState</code> of the KMS key is <code>PendingReplicaDeletion</code>. That indicates that the KMS key is the primary key in a multi-Region key, it is scheduled for deletion, and it still has existing replica keys.</p> <p>When a single-Region KMS key or a multi-Region replica key is scheduled for deletion, its deletion date is displayed in the <code>DeletionDate</code> field. However, when the primary key in a multi-Region key is scheduled for deletion, its waiting period doesn't begin until all of its replica keys are deleted. This value displays that waiting period. When the last replica key in the multi-Region key is deleted, the <code>KeyState</code> of the scheduled primary key changes from <code>PendingReplicaDeletion</code> to <code>PendingDeletion</code> and the deletion date appears in the <code>DeletionDate</code> field.</p>\"\
        },\
        \"MacAlgorithms\":{\
          \"shape\":\"MacAlgorithmSpecList\",\
          \"documentation\":\"<p>The message authentication code (MAC) algorithm that the HMAC KMS key supports.</p> <p>This value is present only when the <code>KeyUsage</code> of the KMS key is <code>GENERATE_VERIFY_MAC</code>.</p>\"\
        },\
        \"XksKeyConfiguration\":{\
          \"shape\":\"XksKeyConfigurationType\",\
          \"documentation\":\"<p>Information about the external key that is associated with a KMS key in an external key store.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key\\\">External key</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains metadata about a KMS key.</p> <p>This data type is used as a response element for the <a>CreateKey</a>, <a>DescribeKey</a>, and <a>ReplicateKey</a> operations.</p>\"\
    },\
    \"KeySpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RSA_2048\",\
        \"RSA_3072\",\
        \"RSA_4096\",\
        \"ECC_NIST_P256\",\
        \"ECC_NIST_P384\",\
        \"ECC_NIST_P521\",\
        \"ECC_SECG_P256K1\",\
        \"SYMMETRIC_DEFAULT\",\
        \"HMAC_224\",\
        \"HMAC_256\",\
        \"HMAC_384\",\
        \"HMAC_512\",\
        \"SM2\"\
      ]\
    },\
    \"KeyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Creating\",\
        \"Enabled\",\
        \"Disabled\",\
        \"PendingDeletion\",\
        \"PendingImport\",\
        \"PendingReplicaDeletion\",\
        \"Unavailable\",\
        \"Updating\"\
      ]\
    },\
    \"KeyStorePasswordType\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":7,\
      \"sensitive\":true\
    },\
    \"KeyUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified KMS key was not available. You can retry the request.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"KeyUsageType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SIGN_VERIFY\",\
        \"ENCRYPT_DECRYPT\",\
        \"GENERATE_VERIFY_MAC\"\
      ]\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because a quota was exceeded. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/limits.html\\\">Quotas</a> in the <i>Key Management Service Developer Guide</i>.</p>\",\
      \"exception\":true\
    },\
    \"LimitType\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"ListAliasesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Lists only aliases that are associated with the specified KMS key. Enter a KMS key in your Amazon Web Services account. </p> <p>This parameter is optional. If you omit it, <code>ListAliases</code> returns all aliases in the account and Region.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        }\
      }\
    },\
    \"ListAliasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Aliases\":{\
          \"shape\":\"AliasList\",\
          \"documentation\":\"<p>A list of aliases.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListGrantsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Returns only grants for the specified KMS key. This parameter is required.</p> <p>Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"GrantId\":{\
          \"shape\":\"GrantIdType\",\
          \"documentation\":\"<p>Returns only the grant with the specified grant ID. The grant ID uniquely identifies the grant. </p>\"\
        },\
        \"GranteePrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>Returns only grants where the specified principal is the grantee principal for the grant.</p>\"\
        }\
      }\
    },\
    \"ListGrantsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Grants\":{\
          \"shape\":\"GrantList\",\
          \"documentation\":\"<p>A list of grants.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListKeyPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Gets the names of key policies for the specified KMS key.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.</p> <p>Only one policy can be attached to a key.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        }\
      }\
    },\
    \"ListKeyPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNameList\",\
          \"documentation\":\"<p>A list of key policy names. The only valid value is <code>default</code>.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListKeysRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        }\
      }\
    },\
    \"ListKeysResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Keys\":{\
          \"shape\":\"KeyList\",\
          \"documentation\":\"<p>A list of KMS keys.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListResourceTagsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Gets tags on the specified KMS key.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 50, inclusive. If you do not include a value, it defaults to 50.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p> <p>Do not attempt to construct this value. Use only the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        }\
      }\
    },\
    \"ListResourceTagsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags. Each tag consists of a tag key and a tag value.</p> <note> <p>Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/abac.html\\\">ABAC for KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> </note>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p> <p>Do not assume or infer any information from this value.</p>\"\
        },\
        \"Truncated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListRetirableGrantsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"RetiringPrincipal\"],\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"LimitType\",\
          \"documentation\":\"<p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p> <p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"MarkerType\",\
          \"documentation\":\"<p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>\"\
        },\
        \"RetiringPrincipal\":{\
          \"shape\":\"PrincipalIdType\",\
          \"documentation\":\"<p>The retiring principal for which to list grants. Enter a principal in your Amazon Web Services account.</p> <p>To specify the retiring principal, use the <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Name (ARN)</a> of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a> in the <i> <i>Identity and Access Management User Guide</i> </i>.</p>\"\
        }\
      }\
    },\
    \"MacAlgorithmSpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HMAC_SHA_224\",\
        \"HMAC_SHA_256\",\
        \"HMAC_SHA_384\",\
        \"HMAC_SHA_512\"\
      ]\
    },\
    \"MacAlgorithmSpecList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MacAlgorithmSpec\"}\
    },\
    \"MalformedPolicyDocumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified policy is not syntactically or semantically correct.</p>\",\
      \"exception\":true\
    },\
    \"MarkerType\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\u00FF]*\"\
    },\
    \"MessageType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RAW\",\
        \"DIGEST\"\
      ]\
    },\
    \"MultiRegionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MultiRegionKeyType\":{\
          \"shape\":\"MultiRegionKeyType\",\
          \"documentation\":\"<p>Indicates whether the KMS key is a <code>PRIMARY</code> or <code>REPLICA</code> key.</p>\"\
        },\
        \"PrimaryKey\":{\
          \"shape\":\"MultiRegionKey\",\
          \"documentation\":\"<p>Displays the key ARN and Region of the primary key. This field includes the current KMS key if it is the primary key.</p>\"\
        },\
        \"ReplicaKeys\":{\
          \"shape\":\"MultiRegionKeyList\",\
          \"documentation\":\"<p>displays the key ARNs and Regions of all replica keys. This field includes the current KMS key if it is a replica key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration of this multi-Region key. This field appears only when the KMS key is a primary or replica of a multi-Region key.</p> <p>For more information about any listed KMS key, use the <a>DescribeKey</a> operation.</p>\"\
    },\
    \"MultiRegionKey\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>Displays the key ARN of a primary or replica key of a multi-Region key.</p>\"\
        },\
        \"Region\":{\
          \"shape\":\"RegionType\",\
          \"documentation\":\"<p>Displays the Amazon Web Services Region of a primary or replica key in a multi-Region key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the primary or replica key in a multi-Region key.</p>\"\
    },\
    \"MultiRegionKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MultiRegionKey\"}\
    },\
    \"MultiRegionKeyType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRIMARY\",\
        \"REPLICA\"\
      ]\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified entity or resource could not be found.</p>\",\
      \"exception\":true\
    },\
    \"NullableBooleanType\":{\"type\":\"boolean\"},\
    \"NumberOfBytesType\":{\
      \"type\":\"integer\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"OriginType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWS_KMS\",\
        \"EXTERNAL\",\
        \"AWS_CLOUDHSM\",\
        \"EXTERNAL_KEY_STORE\"\
      ]\
    },\
    \"PendingWindowInDaysType\":{\
      \"type\":\"integer\",\
      \"max\":365,\
      \"min\":1\
    },\
    \"PlaintextType\":{\
      \"type\":\"blob\",\
      \"max\":4096,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"PolicyNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyNameType\"}\
    },\
    \"PolicyNameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w]+\"\
    },\
    \"PolicyType\":{\
      \"type\":\"string\",\
      \"max\":131072,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0009\\\\u000A\\\\u000D\\\\u0020-\\\\u00FF]+\"\
    },\
    \"PrincipalIdType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^[\\\\w+=,.@:/-]+$\"\
    },\
    \"PublicKeyType\":{\
      \"type\":\"blob\",\
      \"max\":8192,\
      \"min\":1\
    },\
    \"PutKeyPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"PolicyName\",\
        \"Policy\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Sets the key policy on the specified KMS key.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyNameType\",\
          \"documentation\":\"<p>The name of the key policy. The only valid value is <code>default</code>.</p>\"\
        },\
        \"Policy\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The key policy to attach to the KMS key.</p> <p>The key policy must meet the following criteria:</p> <ul> <li> <p>The key policy must allow the calling principal to make a subsequent <code>PutKeyPolicy</code> request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key\\\">Default key policy</a> in the <i>Key Management Service Developer Guide</i>. (To omit this condition, set <code>BypassPolicyLockoutSafetyCheck</code> to true.)</p> </li> <li> <p>Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency\\\">Changes that I make are not always immediately visible</a> in the <i>Amazon Web Services Identity and Access Management User Guide</i>.</p> </li> </ul> <p>A key policy document can include only the following characters:</p> <ul> <li> <p>Printable ASCII characters from the space character (<code>\\\\u0020</code>) through the end of the ASCII character range.</p> </li> <li> <p>Printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\\\\u00FF</code>).</p> </li> <li> <p>The tab (<code>\\\\u0009</code>), line feed (<code>\\\\u000A</code>), and carriage return (<code>\\\\u000D</code>) special characters</p> </li> </ul> <p>For information about key policies, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">Key policies in KMS</a> in the <i>Key Management Service Developer Guide</i>.For help writing and formatting a JSON policy document, see the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html\\\">IAM JSON Policy Reference</a> in the <i> <i>Identity and Access Management User Guide</i> </i>.</p>\"\
        },\
        \"BypassPolicyLockoutSafetyCheck\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Skips (\\\"bypasses\\\") the key policy lockout safety check. The default value is false.</p> <important> <p>Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key\\\">Default key policy</a> in the <i>Key Management Service Developer Guide</i>.</p> </important> <p>Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent <a>PutKeyPolicy</a> request on the KMS key.</p>\"\
        }\
      }\
    },\
    \"ReEncryptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CiphertextBlob\",\
        \"DestinationKeyId\"\
      ],\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>Ciphertext of the data to reencrypt.</p>\"\
        },\
        \"SourceEncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Specifies the encryption context to use to decrypt the ciphertext. Enter the same encryption context that was used to encrypt the ciphertext.</p> <p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"SourceKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Specifies the KMS key that KMS will use to decrypt the ciphertext before it is re-encrypted.</p> <p>Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the <code>ReEncrypt</code> operation throws an <code>IncorrectKeyException</code>.</p> <p>This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"DestinationKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the KMS key that is used to reencrypt the data. Specify a symmetric encryption KMS key or an asymmetric KMS key with a <code>KeyUsage</code> value of <code>ENCRYPT_DECRYPT</code>. To find the <code>KeyUsage</code> value of a KMS key, use the <a>DescribeKey</a> operation.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"DestinationEncryptionContext\":{\
          \"shape\":\"EncryptionContextType\",\
          \"documentation\":\"<p>Specifies that encryption context to use when the reencrypting the data.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>A destination encryption context is valid only when the destination KMS key is a symmetric encryption KMS key. The standard ciphertext format for asymmetric KMS keys does not include fields for metadata.</p> <p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context\\\">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"SourceEncryptionAlgorithm\":{\
          \"shape\":\"EncryptionAlgorithmSpec\",\
          \"documentation\":\"<p>Specifies the encryption algorithm that KMS will use to decrypt the ciphertext before it is reencrypted. The default value, <code>SYMMETRIC_DEFAULT</code>, represents the algorithm used for symmetric encryption KMS keys.</p> <p>Specify the same algorithm that was used to encrypt the ciphertext. If you specify a different algorithm, the decrypt attempt fails.</p> <p>This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key.</p>\"\
        },\
        \"DestinationEncryptionAlgorithm\":{\
          \"shape\":\"EncryptionAlgorithmSpec\",\
          \"documentation\":\"<p>Specifies the encryption algorithm that KMS will use to reecrypt the data after it has decrypted it. The default value, <code>SYMMETRIC_DEFAULT</code>, represents the encryption algorithm used for symmetric encryption KMS keys.</p> <p>This parameter is required only when the destination KMS key is an asymmetric KMS key.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"ReEncryptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CiphertextBlob\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The reencrypted data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>\"\
        },\
        \"SourceKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Unique identifier of the KMS key used to originally encrypt the data.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key that was used to reencrypt the data.</p>\"\
        },\
        \"SourceEncryptionAlgorithm\":{\
          \"shape\":\"EncryptionAlgorithmSpec\",\
          \"documentation\":\"<p>The encryption algorithm that was used to decrypt the ciphertext before it was reencrypted.</p>\"\
        },\
        \"DestinationEncryptionAlgorithm\":{\
          \"shape\":\"EncryptionAlgorithmSpec\",\
          \"documentation\":\"<p>The encryption algorithm that was used to reencrypt the data.</p>\"\
        }\
      }\
    },\
    \"RecipientInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyEncryptionAlgorithm\":{\
          \"shape\":\"KeyEncryptionMechanism\",\
          \"documentation\":\"<p>The encryption algorithm that KMS should use with the public key for an Amazon Web Services Nitro Enclave to encrypt plaintext values for the response. The only valid value is <code>RSAES_OAEP_SHA_256</code>.</p>\"\
        },\
        \"AttestationDocument\":{\
          \"shape\":\"AttestationDocumentType\",\
          \"documentation\":\"<p>The attestation document for an Amazon Web Services Nitro Enclave. This document includes the enclave's public key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the party that receives the response from the API operation.</p> <p>This data type is designed to support Amazon Web Services Nitro Enclaves, which lets you create an isolated compute environment in Amazon EC2. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html\\\">How Amazon Web Services Nitro Enclaves uses KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
    },\
    \"RegionType\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"^([a-z]+-){2,3}\\\\d+$\"\
    },\
    \"ReplicateKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"ReplicaRegion\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the multi-Region primary key that is being replicated. To determine whether a KMS key is a multi-Region primary key, use the <a>DescribeKey</a> operation to check the value of the <code>MultiRegionKeyType</code> property.</p> <p>Specify the key ID or key ARN of a multi-Region primary key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>mrk-1234abcd12ab34cd56ef1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"ReplicaRegion\":{\
          \"shape\":\"RegionType\",\
          \"documentation\":\"<p>The Region ID of the Amazon Web Services Region for this replica key. </p> <p>Enter the Region ID, such as <code>us-east-1</code> or <code>ap-southeast-2</code>. For a list of Amazon Web Services Regions in which KMS is supported, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/kms.html#kms_region\\\">KMS service endpoints</a> in the <i>Amazon Web Services General Reference</i>.</p> <note> <p>HMAC KMS keys are not supported in all Amazon Web Services Regions. If you try to replicate an HMAC KMS key in an Amazon Web Services Region in which HMAC keys are not supported, the <code>ReplicateKey</code> operation returns an <code>UnsupportedOperationException</code>. For a list of Regions in which HMAC KMS keys are supported, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html\\\">HMAC keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> </note> <p>The replica must be in a different Amazon Web Services Region than its primary key and other replicas of that primary key, but in the same Amazon Web Services partition. KMS must be available in the replica Region. If the Region is not enabled by default, the Amazon Web Services account must be enabled in the Region. For information about Amazon Web Services partitions, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General Reference</i>. For information about enabling and disabling Regions, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-enable\\\">Enabling a Region</a> and <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-disable\\\">Disabling a Region</a> in the <i>Amazon Web Services General Reference</i>.</p>\"\
        },\
        \"Policy\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The key policy to attach to the KMS key. This parameter is optional. If you do not provide a key policy, KMS attaches the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default\\\">default key policy</a> to the KMS key.</p> <p>The key policy is not a shared property of multi-Region keys. You can specify the same key policy or a different key policy for each key in a set of related multi-Region keys. KMS does not synchronize this property.</p> <p>If you provide a key policy, it must meet the following criteria:</p> <ul> <li> <p>The key policy must allow the calling principal to make a subsequent <code>PutKeyPolicy</code> request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key\\\">Default key policy</a> in the <i>Key Management Service Developer Guide</i>. (To omit this condition, set <code>BypassPolicyLockoutSafetyCheck</code> to true.)</p> </li> <li> <p>Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency\\\">Changes that I make are not always immediately visible</a> in the <i>Amazon Web Services Identity and Access Management User Guide</i>.</p> </li> </ul> <p>A key policy document can include only the following characters:</p> <ul> <li> <p>Printable ASCII characters from the space character (<code>\\\\u0020</code>) through the end of the ASCII character range.</p> </li> <li> <p>Printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\\\\u00FF</code>).</p> </li> <li> <p>The tab (<code>\\\\u0009</code>), line feed (<code>\\\\u000A</code>), and carriage return (<code>\\\\u000D</code>) special characters</p> </li> </ul> <p>For information about key policies, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">Key policies in KMS</a> in the <i>Key Management Service Developer Guide</i>. For help writing and formatting a JSON policy document, see the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html\\\">IAM JSON Policy Reference</a> in the <i> <i>Identity and Access Management User Guide</i> </i>.</p>\"\
        },\
        \"BypassPolicyLockoutSafetyCheck\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Skips (\\\"bypasses\\\") the key policy lockout safety check. The default value is false.</p> <important> <p>Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key\\\">Default key policy</a> in the <i>Key Management Service Developer Guide</i>.</p> </important> <p>Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent <a>PutKeyPolicy</a> request on the KMS key.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>A description of the KMS key. The default value is an empty string (no description).</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>The description is not a shared property of multi-Region keys. You can specify the same description or a different description for each key in a set of related multi-Region keys. KMS does not synchronize this property.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Assigns one or more tags to the replica key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the <a>TagResource</a> operation.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <note> <p>Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/abac.html\\\">ABAC for KMS</a> in the <i>Key Management Service Developer Guide</i>.</p> </note> <p>To use this parameter, you must have <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html\\\">kms:TagResource</a> permission in an IAM policy.</p> <p>Tags are not a shared property of multi-Region keys. You can specify the same tags or different tags for each key in a set of related multi-Region keys. KMS does not synchronize this property.</p> <p>Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.</p> <p>When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html\\\">Tagging Keys</a>.</p>\"\
        }\
      }\
    },\
    \"ReplicateKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicaKeyMetadata\":{\
          \"shape\":\"KeyMetadata\",\
          \"documentation\":\"<p>Displays details about the new replica key, including its Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a>. It also includes the ARN and Amazon Web Services Region of its primary key and other replica keys.</p>\"\
        },\
        \"ReplicaPolicy\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The key policy of the new replica key. The value is a key policy document in JSON format.</p>\"\
        },\
        \"ReplicaTags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags on the new replica key. The value is a list of tag key and tag value pairs.</p>\"\
        }\
      }\
    },\
    \"RetireGrantRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GrantToken\":{\
          \"shape\":\"GrantTokenType\",\
          \"documentation\":\"<p>Identifies the grant to be retired. You can use a grant token to identify a new grant even before it has achieved eventual consistency.</p> <p>Only the <a>CreateGrant</a> operation returns a grant token. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency\\\">Eventual consistency</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The key ARN KMS key associated with the grant. To find the key ARN, use the <a>ListKeys</a> operation.</p> <p>For example: <code>arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p>\"\
        },\
        \"GrantId\":{\
          \"shape\":\"GrantIdType\",\
          \"documentation\":\"<p>Identifies the grant to retire. To get the grant ID, use <a>CreateGrant</a>, <a>ListGrants</a>, or <a>ListRetirableGrants</a>.</p> <ul> <li> <p>Grant ID Example - 0123456789012345678901234567890123456789012345678901234567890123</p> </li> </ul>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"RevokeGrantRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"GrantId\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the KMS key associated with the grant. To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p> <p>Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"GrantId\":{\
          \"shape\":\"GrantIdType\",\
          \"documentation\":\"<p>Identifies the grant to revoke. To get the grant ID, use <a>CreateGrant</a>, <a>ListGrants</a>, or <a>ListRetirableGrants</a>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"ScheduleKeyDeletionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyId\"],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The unique identifier of the KMS key to delete.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"PendingWindowInDays\":{\
          \"shape\":\"PendingWindowInDaysType\",\
          \"documentation\":\"<p>The waiting period, specified in number of days. After the waiting period ends, KMS deletes the KMS key.</p> <p>If the KMS key is a multi-Region primary key with replica keys, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.</p> <p>This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you do not include a value, it defaults to 30. You can use the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-schedule-key-deletion-pending-window-in-days\\\"> <code>kms:ScheduleKeyDeletionPendingWindowInDays</code> </a> condition key to further constrain the values that principals can specify in the <code>PendingWindowInDays</code> parameter.</p>\"\
        }\
      }\
    },\
    \"ScheduleKeyDeletionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the KMS key whose deletion is scheduled.</p>\"\
        },\
        \"DeletionDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time after which KMS deletes the KMS key.</p> <p>If the KMS key is a multi-Region primary key with replica keys, this field does not appear. The deletion date for the primary key isn't known until its last replica key is deleted.</p>\"\
        },\
        \"KeyState\":{\
          \"shape\":\"KeyState\",\
          \"documentation\":\"<p>The current status of the KMS key.</p> <p>For more information about how key state affects the use of a KMS key, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"PendingWindowInDays\":{\
          \"shape\":\"PendingWindowInDaysType\",\
          \"documentation\":\"<p>The waiting period before the KMS key is deleted. </p> <p>If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.</p>\"\
        }\
      }\
    },\
    \"SignRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"Message\",\
        \"SigningAlgorithm\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies an asymmetric KMS key. KMS uses the private key in the asymmetric KMS key to sign the message. The <code>KeyUsage</code> type of the KMS key must be <code>SIGN_VERIFY</code>. To find the <code>KeyUsage</code> of a KMS key, use the <a>DescribeKey</a> operation.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>Specifies the message or message digest to sign. Messages can be 0-4096 bytes. To sign a larger message, provide a message digest.</p> <p>If you provide a message digest, use the <code>DIGEST</code> value of <code>MessageType</code> to prevent the digest from being hashed again while signing.</p>\"\
        },\
        \"MessageType\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>Tells KMS whether the value of the <code>Message</code> parameter should be hashed as part of the signing algorithm. Use <code>RAW</code> for unhashed messages; use <code>DIGEST</code> for message digests, which are already hashed.</p> <p>When the value of <code>MessageType</code> is <code>RAW</code>, KMS uses the standard signing algorithm, which begins with a hash function. When the value is <code>DIGEST</code>, KMS skips the hashing step in the signing algorithm.</p> <important> <p>Use the <code>DIGEST</code> value only when the value of the <code>Message</code> parameter is a message digest. If you use the <code>DIGEST</code> value with an unhashed message, the security of the signing operation can be compromised.</p> </important> <p>When the value of <code>MessageType</code>is <code>DIGEST</code>, the length of the <code>Message</code> value must match the length of hashed messages for the specified signing algorithm.</p> <p>You can submit a message digest and omit the <code>MessageType</code> or specify <code>RAW</code> so the digest is hashed again while signing. However, this can cause verification failures when verifying with a system that assumes a single hash.</p> <p>The hashing algorithm in that <code>Sign</code> uses is based on the <code>SigningAlgorithm</code> value.</p> <ul> <li> <p>Signing algorithms that end in SHA_256 use the SHA_256 hashing algorithm.</p> </li> <li> <p>Signing algorithms that end in SHA_384 use the SHA_384 hashing algorithm.</p> </li> <li> <p>Signing algorithms that end in SHA_512 use the SHA_512 hashing algorithm.</p> </li> <li> <p>SM2DSA uses the SM3 hashing algorithm. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification\\\">Offline verification with SM2 key pairs</a>.</p> </li> </ul>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"SigningAlgorithm\":{\
          \"shape\":\"SigningAlgorithmSpec\",\
          \"documentation\":\"<p>Specifies the signing algorithm to use when signing the message. </p> <p>Choose an algorithm that is compatible with the type and size of the specified asymmetric KMS key. When signing with RSA key pairs, RSASSA-PSS algorithms are preferred. We include RSASSA-PKCS1-v1_5 algorithms for compatibility with existing applications.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"SignResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the asymmetric KMS key that was used to sign the message.</p>\"\
        },\
        \"Signature\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The cryptographic signature that was generated for the message. </p> <ul> <li> <p>When used with the supported RSA signing algorithms, the encoding of this value is defined by <a href=\\\"https://tools.ietf.org/html/rfc8017\\\">PKCS #1 in RFC 8017</a>.</p> </li> <li> <p>When used with the <code>ECDSA_SHA_256</code>, <code>ECDSA_SHA_384</code>, or <code>ECDSA_SHA_512</code> signing algorithms, this value is a DER-encoded object as defined by ANSI X9.62â2005 and <a href=\\\"https://tools.ietf.org/html/rfc3279#section-2.2.3\\\">RFC 3279 Section 2.2.3</a>. This is the most commonly used signature format and is appropriate for most uses. </p> </li> </ul> <p>When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>\"\
        },\
        \"SigningAlgorithm\":{\
          \"shape\":\"SigningAlgorithmSpec\",\
          \"documentation\":\"<p>The signing algorithm that was used to sign the message.</p>\"\
        }\
      }\
    },\
    \"SigningAlgorithmSpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RSASSA_PSS_SHA_256\",\
        \"RSASSA_PSS_SHA_384\",\
        \"RSASSA_PSS_SHA_512\",\
        \"RSASSA_PKCS1_V1_5_SHA_256\",\
        \"RSASSA_PKCS1_V1_5_SHA_384\",\
        \"RSASSA_PKCS1_V1_5_SHA_512\",\
        \"ECDSA_SHA_256\",\
        \"ECDSA_SHA_384\",\
        \"ECDSA_SHA_512\",\
        \"SM2DSA\"\
      ]\
    },\
    \"SigningAlgorithmSpecList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SigningAlgorithmSpec\"}\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TagKey\",\
        \"TagValue\"\
      ],\
      \"members\":{\
        \"TagKey\":{\
          \"shape\":\"TagKeyType\",\
          \"documentation\":\"<p>The key of the tag.</p>\"\
        },\
        \"TagValue\":{\
          \"shape\":\"TagValueType\",\
          \"documentation\":\"<p>The value of the tag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>For information about the rules that apply to tag keys and tag values, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html\\\">User-Defined Tag Restrictions</a> in the <i>Amazon Web Services Billing and Cost Management User Guide</i>.</p>\"\
    },\
    \"TagException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because one or more tags are not valid.</p>\",\
      \"exception\":true\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKeyType\"}\
    },\
    \"TagKeyType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies a customer managed key in the account and Region.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>One or more tags. Each tag consists of a tag key and a tag value. The tag value can be an empty (null) string. </p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.</p>\"\
        }\
      }\
    },\
    \"TagValueType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"TrustAnchorCertificateType\":{\
      \"type\":\"string\",\
      \"max\":5000,\
      \"min\":1\
    },\
    \"UnsupportedOperationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation.</p>\",\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the KMS key from which you are removing tags.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>One or more tag keys. Specify only the tag keys, not the tag values.</p>\"\
        }\
      }\
    },\
    \"UpdateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AliasName\",\
        \"TargetKeyId\"\
      ],\
      \"members\":{\
        \"AliasName\":{\
          \"shape\":\"AliasNameType\",\
          \"documentation\":\"<p>Identifies the alias that is changing its KMS key. This value must begin with <code>alias/</code> followed by the alias name, such as <code>alias/ExampleAlias</code>. You cannot use <code>UpdateAlias</code> to change the alias name.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important>\"\
        },\
        \"TargetKeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk\\\">customer managed key</a> to associate with the alias. You don't have permission to associate an alias with an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk\\\">Amazon Web Services managed key</a>.</p> <p>The KMS key must be in the same Amazon Web Services account and Region as the alias. Also, the new target KMS key must be the same type as the current target KMS key (both symmetric or both asymmetric or both HMAC) and they must have the same key usage. </p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p> <p>To verify that the alias is mapped to the correct KMS key, use <a>ListAliases</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateCustomKeyStoreRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CustomKeyStoreId\"],\
      \"members\":{\
        \"CustomKeyStoreId\":{\
          \"shape\":\"CustomKeyStoreIdType\",\
          \"documentation\":\"<p>Identifies the custom key store that you want to update. Enter the ID of the custom key store. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p>\"\
        },\
        \"NewCustomKeyStoreName\":{\
          \"shape\":\"CustomKeyStoreNameType\",\
          \"documentation\":\"<p>Changes the friendly name of the custom key store to the value that you specify. The custom key store name must be unique in the Amazon Web Services account.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important> <p>To change this value, an CloudHSM key store must be disconnected. An external key store can be connected or disconnected.</p>\"\
        },\
        \"KeyStorePassword\":{\
          \"shape\":\"KeyStorePasswordType\",\
          \"documentation\":\"<p>Enter the current password of the <code>kmsuser</code> crypto user (CU) in the CloudHSM cluster that is associated with the custom key store. This parameter is valid only for custom key stores with a <code>CustomKeyStoreType</code> of <code>AWS_CLOUDHSM</code>.</p> <p>This parameter tells KMS the current password of the <code>kmsuser</code> crypto user (CU). It does not set or change the password of any users in the CloudHSM cluster.</p> <p>To change this value, the CloudHSM key store must be disconnected.</p>\"\
        },\
        \"CloudHsmClusterId\":{\
          \"shape\":\"CloudHsmClusterIdType\",\
          \"documentation\":\"<p>Associates the custom key store with a related CloudHSM cluster. This parameter is valid only for custom key stores with a <code>CustomKeyStoreType</code> of <code>AWS_CLOUDHSM</code>.</p> <p>Enter the cluster ID of the cluster that you used to create the custom key store or a cluster that shares a backup history and has the same cluster certificate as the original cluster. You cannot use this parameter to associate a custom key store with an unrelated cluster. In addition, the replacement cluster must <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore\\\">fulfill the requirements</a> for a cluster associated with a custom key store. To view the cluster certificate of a cluster, use the <a href=\\\"https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html\\\">DescribeClusters</a> operation.</p> <p>To change this value, the CloudHSM key store must be disconnected.</p>\"\
        },\
        \"XksProxyUriEndpoint\":{\
          \"shape\":\"XksProxyUriEndpointType\",\
          \"documentation\":\"<p>Changes the URI endpoint that KMS uses to connect to your external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a <code>CustomKeyStoreType</code> of <code>EXTERNAL_KEY_STORE</code>.</p> <p>For external key stores with an <code>XksProxyConnectivity</code> value of <code>PUBLIC_ENDPOINT</code>, the protocol must be HTTPS.</p> <p>For external key stores with an <code>XksProxyConnectivity</code> value of <code>VPC_ENDPOINT_SERVICE</code>, specify <code>https://</code> followed by the private DNS name associated with the VPC endpoint service. Each external key store must use a different private DNS name.</p> <p>The combined <code>XksProxyUriEndpoint</code> and <code>XksProxyUriPath</code> values must be unique in the Amazon Web Services account and Region.</p> <p>To change this value, the external key store must be disconnected.</p>\"\
        },\
        \"XksProxyUriPath\":{\
          \"shape\":\"XksProxyUriPathType\",\
          \"documentation\":\"<p>Changes the base path to the proxy APIs for this external key store. To find this value, see the documentation for your external key manager and external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a <code>CustomKeyStoreType</code> of <code>EXTERNAL_KEY_STORE</code>.</p> <p>The value must start with <code>/</code> and must end with <code>/kms/xks/v1</code>, where <code>v1</code> represents the version of the KMS external key store proxy API. You can include an optional prefix between the required elements such as <code>/<i>example</i>/kms/xks/v1</code>.</p> <p>The combined <code>XksProxyUriEndpoint</code> and <code>XksProxyUriPath</code> values must be unique in the Amazon Web Services account and Region.</p> <p>You can change this value when the external key store is connected or disconnected.</p>\"\
        },\
        \"XksProxyVpcEndpointServiceName\":{\
          \"shape\":\"XksProxyVpcEndpointServiceNameType\",\
          \"documentation\":\"<p>Changes the name that KMS uses to identify the Amazon VPC endpoint service for your external key store proxy (XKS proxy). This parameter is valid when the <code>CustomKeyStoreType</code> is <code>EXTERNAL_KEY_STORE</code> and the <code>XksProxyConnectivity</code> is <code>VPC_ENDPOINT_SERVICE</code>.</p> <p>To change this value, the external key store must be disconnected.</p>\"\
        },\
        \"XksProxyAuthenticationCredential\":{\
          \"shape\":\"XksProxyAuthenticationCredentialType\",\
          \"documentation\":\"<p>Changes the credentials that KMS uses to sign requests to the external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a <code>CustomKeyStoreType</code> of <code>EXTERNAL_KEY_STORE</code>.</p> <p>You must specify both the <code>AccessKeyId</code> and <code>SecretAccessKey</code> value in the authentication credential, even if you are only updating one value.</p> <p>This parameter doesn't establish or change your authentication credentials on the proxy. It just tells KMS the credential that you established with your external key store proxy. For example, if you rotate the credential on your external key store proxy, you can use this parameter to update the credential in KMS.</p> <p>You can change this value when the external key store is connected or disconnected.</p>\"\
        },\
        \"XksProxyConnectivity\":{\
          \"shape\":\"XksProxyConnectivityType\",\
          \"documentation\":\"<p>Changes the connectivity setting for the external key store. To indicate that the external key store proxy uses a Amazon VPC endpoint service to communicate with KMS, specify <code>VPC_ENDPOINT_SERVICE</code>. Otherwise, specify <code>PUBLIC_ENDPOINT</code>.</p> <p>If you change the <code>XksProxyConnectivity</code> to <code>VPC_ENDPOINT_SERVICE</code>, you must also change the <code>XksProxyUriEndpoint</code> and add an <code>XksProxyVpcEndpointServiceName</code> value. </p> <p>If you change the <code>XksProxyConnectivity</code> to <code>PUBLIC_ENDPOINT</code>, you must also change the <code>XksProxyUriEndpoint</code> and specify a null or empty string for the <code>XksProxyVpcEndpointServiceName</code> value.</p> <p>To change this value, the external key store must be disconnected.</p>\"\
        }\
      }\
    },\
    \"UpdateCustomKeyStoreResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateKeyDescriptionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"Description\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Updates the description of the specified KMS key.</p> <p>Specify the key ID or key ARN of the KMS key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>New description for the KMS key.</p> <important> <p>Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.</p> </important>\"\
        }\
      }\
    },\
    \"UpdatePrimaryRegionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"PrimaryRegion\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the current primary key. When the operation completes, this KMS key will be a replica key.</p> <p>Specify the key ID or key ARN of a multi-Region primary key.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>mrk-1234abcd12ab34cd56ef1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>\"\
        },\
        \"PrimaryRegion\":{\
          \"shape\":\"RegionType\",\
          \"documentation\":\"<p>The Amazon Web Services Region of the new primary key. Enter the Region ID, such as <code>us-east-1</code> or <code>ap-southeast-2</code>. There must be an existing replica key in this Region. </p> <p>When the operation completes, the multi-Region key in this Region will be the primary key.</p>\"\
        }\
      }\
    },\
    \"VerifyMacRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Message\",\
        \"KeyId\",\
        \"MacAlgorithm\",\
        \"Mac\"\
      ],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>The message that will be used in the verification. Enter the same message that was used to generate the HMAC.</p> <p> <a>GenerateMac</a> and <code>VerifyMac</code> do not provide special handling for message digests. If you generated an HMAC for a hash digest of a message, you must verify the HMAC for the same hash digest.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The KMS key that will be used in the verification.</p> <p>Enter a key ID of the KMS key that was used to generate the HMAC. If you identify a different KMS key, the <code>VerifyMac</code> operation fails.</p>\"\
        },\
        \"MacAlgorithm\":{\
          \"shape\":\"MacAlgorithmSpec\",\
          \"documentation\":\"<p>The MAC algorithm that will be used in the verification. Enter the same MAC algorithm that was used to compute the HMAC. This algorithm must be supported by the HMAC KMS key identified by the <code>KeyId</code> parameter.</p>\"\
        },\
        \"Mac\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The HMAC to verify. Enter the HMAC that was generated by the <a>GenerateMac</a> operation when you specified the same message, HMAC KMS key, and MAC algorithm as the values specified in this request.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"VerifyMacResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The HMAC KMS key used in the verification.</p>\"\
        },\
        \"MacValid\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A Boolean value that indicates whether the HMAC was verified. A value of <code>True</code> indicates that the HMAC (<code>Mac</code>) was generated with the specified <code>Message</code>, HMAC KMS key (<code>KeyID</code>) and <code>MacAlgorithm.</code>.</p> <p>If the HMAC is not verified, the <code>VerifyMac</code> operation fails with a <code>KMSInvalidMacException</code> exception. This exception indicates that one or more of the inputs changed since the HMAC was computed.</p>\"\
        },\
        \"MacAlgorithm\":{\
          \"shape\":\"MacAlgorithmSpec\",\
          \"documentation\":\"<p>The MAC algorithm used in the verification.</p>\"\
        }\
      }\
    },\
    \"VerifyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyId\",\
        \"Message\",\
        \"Signature\",\
        \"SigningAlgorithm\"\
      ],\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>Identifies the asymmetric KMS key that will be used to verify the signature. This must be the same KMS key that was used to generate the signature. If you specify a different KMS key, the signature verification fails.</p> <p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>\\\"alias/\\\"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p> <p>For example:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"PlaintextType\",\
          \"documentation\":\"<p>Specifies the message that was signed. You can submit a raw message of up to 4096 bytes, or a hash digest of the message. If you submit a digest, use the <code>MessageType</code> parameter with a value of <code>DIGEST</code>.</p> <p>If the message specified here is different from the message that was signed, the signature verification fails. A message and its hash digest are considered to be the same message.</p>\"\
        },\
        \"MessageType\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>Tells KMS whether the value of the <code>Message</code> parameter should be hashed as part of the signing algorithm. Use <code>RAW</code> for unhashed messages; use <code>DIGEST</code> for message digests, which are already hashed.</p> <p>When the value of <code>MessageType</code> is <code>RAW</code>, KMS uses the standard signing algorithm, which begins with a hash function. When the value is <code>DIGEST</code>, KMS skips the hashing step in the signing algorithm.</p> <important> <p>Use the <code>DIGEST</code> value only when the value of the <code>Message</code> parameter is a message digest. If you use the <code>DIGEST</code> value with an unhashed message, the security of the verification operation can be compromised.</p> </important> <p>When the value of <code>MessageType</code>is <code>DIGEST</code>, the length of the <code>Message</code> value must match the length of hashed messages for the specified signing algorithm.</p> <p>You can submit a message digest and omit the <code>MessageType</code> or specify <code>RAW</code> so the digest is hashed again while signing. However, if the signed message is hashed once while signing, but twice while verifying, verification fails, even when the message hasn't changed.</p> <p>The hashing algorithm in that <code>Verify</code> uses is based on the <code>SigningAlgorithm</code> value.</p> <ul> <li> <p>Signing algorithms that end in SHA_256 use the SHA_256 hashing algorithm.</p> </li> <li> <p>Signing algorithms that end in SHA_384 use the SHA_384 hashing algorithm.</p> </li> <li> <p>Signing algorithms that end in SHA_512 use the SHA_512 hashing algorithm.</p> </li> <li> <p>SM2DSA uses the SM3 hashing algorithm. For details, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification\\\">Offline verification with SM2 key pairs</a>.</p> </li> </ul>\"\
        },\
        \"Signature\":{\
          \"shape\":\"CiphertextType\",\
          \"documentation\":\"<p>The signature that the <code>Sign</code> operation generated.</p>\"\
        },\
        \"SigningAlgorithm\":{\
          \"shape\":\"SigningAlgorithmSpec\",\
          \"documentation\":\"<p>The signing algorithm that was used to sign the message. If you submit a different algorithm, the signature verification fails.</p>\"\
        },\
        \"GrantTokens\":{\
          \"shape\":\"GrantTokenList\",\
          \"documentation\":\"<p>A list of grant tokens.</p> <p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token\\\">Grant token</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token\\\">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"NullableBooleanType\",\
          \"documentation\":\"<p>Checks if your request will succeed. <code>DryRun</code> is an optional parameter. </p> <p>To learn more about how to use this parameter, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html\\\">Testing your KMS API calls</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
        }\
      }\
    },\
    \"VerifyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyId\":{\
          \"shape\":\"KeyIdType\",\
          \"documentation\":\"<p>The Amazon Resource Name (<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN\\\">key ARN</a>) of the asymmetric KMS key that was used to verify the signature.</p>\"\
        },\
        \"SignatureValid\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A Boolean value that indicates whether the signature was verified. A value of <code>True</code> indicates that the <code>Signature</code> was produced by signing the <code>Message</code> with the specified <code>KeyID</code> and <code>SigningAlgorithm.</code> If the signature is not verified, the <code>Verify</code> operation fails with a <code>KMSInvalidSignatureException</code> exception. </p>\"\
        },\
        \"SigningAlgorithm\":{\
          \"shape\":\"SigningAlgorithmSpec\",\
          \"documentation\":\"<p>The signing algorithm that was used to verify the signature.</p>\"\
        }\
      }\
    },\
    \"WrappingKeySpec\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RSA_2048\",\
        \"RSA_3072\",\
        \"RSA_4096\"\
      ]\
    },\
    \"XksKeyAlreadyInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the (<code>XksKeyId</code>) is already associated with a KMS key in this external key store. Each KMS key in an external key store must be associated with a different external key.</p>\",\
      \"exception\":true\
    },\
    \"XksKeyConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"XksKeyIdType\",\
          \"documentation\":\"<p>The ID of the external key in its external key manager. This is the ID that the external key store proxy uses to identify the external key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key\\\">external key </a>that is associated with a KMS key in an external key store. </p> <p>This element appears in a <a>CreateKey</a> or <a>DescribeKey</a> response only for a KMS key in an external key store.</p> <p>The <i>external key</i> is a symmetric encryption key that is hosted by an external key manager outside of Amazon Web Services. When you use the KMS key in an external key store in a cryptographic operation, the cryptographic operation is performed in the external key manager using the specified external key. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key\\\">External key</a> in the <i>Key Management Service Developer Guide</i>.</p>\"\
    },\
    \"XksKeyIdType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-_.]+$\"\
    },\
    \"XksKeyInvalidConfigurationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the external key specified by the <code>XksKeyId</code> parameter did not meet the configuration requirements for an external key store.</p> <p>The external key must be an AES-256 symmetric key that is enabled and performs encryption and decryption.</p>\",\
      \"exception\":true\
    },\
    \"XksKeyNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the external key store proxy could not find the external key. This exception is thrown when the value of the <code>XksKeyId</code> parameter doesn't identify a key in the external key manager associated with the external key proxy.</p> <p>Verify that the <code>XksKeyId</code> represents an existing key in the external key manager. Use the key identifier that the external key store proxy uses to identify the key. For details, see the documentation provided with your external key store proxy or key manager.</p>\",\
      \"exception\":true\
    },\
    \"XksProxyAuthenticationAccessKeyIdType\":{\
      \"type\":\"string\",\
      \"max\":30,\
      \"min\":20,\
      \"pattern\":\"^[A-Z2-7]+$\",\
      \"sensitive\":true\
    },\
    \"XksProxyAuthenticationCredentialType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AccessKeyId\",\
        \"RawSecretAccessKey\"\
      ],\
      \"members\":{\
        \"AccessKeyId\":{\
          \"shape\":\"XksProxyAuthenticationAccessKeyIdType\",\
          \"documentation\":\"<p>A unique identifier for the raw secret access key.</p>\"\
        },\
        \"RawSecretAccessKey\":{\
          \"shape\":\"XksProxyAuthenticationRawSecretAccessKeyType\",\
          \"documentation\":\"<p>A secret string of 43-64 characters. Valid characters are a-z, A-Z, 0-9, /, +, and =.</p>\"\
        }\
      },\
      \"documentation\":\"<p>KMS uses the authentication credential to sign requests that it sends to the external key store proxy (XKS proxy) on your behalf. You establish these credentials on your external key store proxy and report them to KMS.</p> <p>The <code>XksProxyAuthenticationCredential</code> includes two required elements.</p>\"\
    },\
    \"XksProxyAuthenticationRawSecretAccessKeyType\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":43,\
      \"pattern\":\"^[a-zA-Z0-9\\\\/+=]+$\",\
      \"sensitive\":true\
    },\
    \"XksProxyConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Connectivity\":{\
          \"shape\":\"XksProxyConnectivityType\",\
          \"documentation\":\"<p>Indicates whether the external key store proxy uses a public endpoint or an Amazon VPC endpoint service to communicate with KMS.</p>\"\
        },\
        \"AccessKeyId\":{\
          \"shape\":\"XksProxyAuthenticationAccessKeyIdType\",\
          \"documentation\":\"<p>The part of the external key store <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateCustomKeyStore.html#KMS-CreateCustomKeyStore-request-XksProxyAuthenticationCredential\\\">proxy authentication credential</a> that uniquely identifies the secret access key.</p>\"\
        },\
        \"UriEndpoint\":{\
          \"shape\":\"XksProxyUriEndpointType\",\
          \"documentation\":\"<p>The URI endpoint for the external key store proxy.</p> <p>If the external key store proxy has a public endpoint, it is displayed here.</p> <p>If the external key store proxy uses an Amazon VPC endpoint service name, this field displays the private DNS name associated with the VPC endpoint service.</p>\"\
        },\
        \"UriPath\":{\
          \"shape\":\"XksProxyUriPathType\",\
          \"documentation\":\"<p>The path to the external key store proxy APIs.</p>\"\
        },\
        \"VpcEndpointServiceName\":{\
          \"shape\":\"XksProxyVpcEndpointServiceNameType\",\
          \"documentation\":\"<p>The Amazon VPC endpoint service used to communicate with the external key store proxy. This field appears only when the external key store proxy uses an Amazon VPC endpoint service to communicate with KMS.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about the external key store proxy (XKS proxy). Your external key store proxy translates KMS requests into a format that your external key manager can understand. These fields appear in a <a>DescribeCustomKeyStores</a> response only when the <code>CustomKeyStoreType</code> is <code>EXTERNAL_KEY_STORE</code>.</p>\"\
    },\
    \"XksProxyConnectivityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PUBLIC_ENDPOINT\",\
        \"VPC_ENDPOINT_SERVICE\"\
      ]\
    },\
    \"XksProxyIncorrectAuthenticationCredentialException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the proxy credentials failed to authenticate to the specified external key store proxy. The specified external key store proxy rejected a status request from KMS due to invalid credentials. This can indicate an error in the credentials or in the identification of the external key store proxy.</p>\",\
      \"exception\":true\
    },\
    \"XksProxyInvalidConfigurationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the Amazon VPC endpoint service configuration does not fulfill the requirements for an external key store proxy. For details, see the exception message.</p>\",\
      \"exception\":true\
    },\
    \"XksProxyInvalidResponseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p/> <p>KMS cannot interpret the response it received from the external key store proxy. The problem might be a poorly constructed response, but it could also be a transient network issue. If you see this error repeatedly, report it to the proxy vendor.</p>\",\
      \"exception\":true\
    },\
    \"XksProxyUriEndpointInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the concatenation of the <code>XksProxyUriEndpoint</code> is already associated with an external key store in the Amazon Web Services account and Region. Each external key store in an account and Region must use a unique external key store proxy address.</p>\",\
      \"exception\":true\
    },\
    \"XksProxyUriEndpointType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":10,\
      \"pattern\":\"^https://[a-zA-Z0-9.-]+$\"\
    },\
    \"XksProxyUriInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the concatenation of the <code>XksProxyUriEndpoint</code> and <code>XksProxyUriPath</code> is already associated with an external key store in the Amazon Web Services account and Region. Each external key store in an account and Region must use a unique external key store proxy API address.</p>\",\
      \"exception\":true\
    },\
    \"XksProxyUriPathType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":10,\
      \"pattern\":\"^(/[a-zA-Z0-9\\\\/_-]+/kms/xks/v\\\\d{1,2})$|^(/kms/xks/v\\\\d{1,2})$\"\
    },\
    \"XksProxyUriUnreachableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>KMS was unable to reach the specified <code>XksProxyUriPath</code>. The path must be reachable before you create the external key store or update its settings.</p> <p>This exception is also thrown when the external key store proxy response to a <code>GetHealthStatus</code> request indicates that all external key manager instances are unavailable.</p>\",\
      \"exception\":true\
    },\
    \"XksProxyVpcEndpointServiceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the specified Amazon VPC endpoint service is already associated with an external key store in the Amazon Web Services account and Region. Each external key store in an Amazon Web Services account and Region must use a different Amazon VPC endpoint service.</p>\",\
      \"exception\":true\
    },\
    \"XksProxyVpcEndpointServiceInvalidConfigurationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because the Amazon VPC endpoint service configuration does not fulfill the requirements for an external key store proxy. For details, see the exception message and <a href=\\\"kms/latest/developerguide/vpc-connectivity.html#xks-vpc-requirements\\\">review the requirements</a> for Amazon VPC endpoint service connectivity for an external key store.</p>\",\
      \"exception\":true\
    },\
    \"XksProxyVpcEndpointServiceNameType\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":20,\
      \"pattern\":\"^com\\\\.amazonaws\\\\.vpce\\\\.([a-z]+-){2,3}\\\\d+\\\\.vpce-svc-[0-9a-z]+$\"\
    },\
    \"XksProxyVpcEndpointServiceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessageType\"}\
      },\
      \"documentation\":\"<p>The request was rejected because KMS could not find the specified VPC endpoint service. Use <a>DescribeCustomKeyStores</a> to verify the VPC endpoint service name for the external key store. Also, confirm that the <code>Allow principals</code> list for the VPC endpoint service includes the KMS service principal for the Region, such as <code>cks.kms.us-east-1.amazonaws.com</code>.</p>\",\
      \"exception\":true\
    }\
  },\
  \"documentation\":\"<fullname>Key Management Service</fullname> <p>Key Management Service (KMS) is an encryption and key management web service. This guide describes the KMS operations that you can call programmatically. For general information about KMS, see the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/\\\"> <i>Key Management Service Developer Guide</i> </a>.</p> <note> <p>KMS has replaced the term <i>customer master key (CMK)</i> with <i>KMS key</i> and <i>KMS key</i>. The concept has not changed. To prevent breaking changes, KMS is keeping some variations of this term.</p> <p>Amazon Web Services provides SDKs that consist of libraries and sample code for various programming languages and platforms (Java, Ruby, .Net, macOS, Android, etc.). The SDKs provide a convenient way to create programmatic access to KMS and other Amazon Web Services services. For example, the SDKs take care of tasks such as signing requests (see below), managing errors, and retrying requests automatically. For more information about the Amazon Web Services SDKs, including how to download and install them, see <a href=\\\"http://aws.amazon.com/tools/\\\">Tools for Amazon Web Services</a>.</p> </note> <p>We recommend that you use the Amazon Web Services SDKs to make programmatic API calls to KMS.</p> <p>If you need to use FIPS 140-2 validated cryptographic modules when communicating with Amazon Web Services, use the FIPS endpoint in your preferred Amazon Web Services Region. For more information about the available FIPS endpoints, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/kms.html#kms_region\\\">Service endpoints</a> in the Key Management Service topic of the <i>Amazon Web Services General Reference</i>.</p> <p>All KMS API calls must be signed and be transmitted using Transport Layer Security (TLS). KMS recommends you always use the latest supported TLS version. Clients must also support cipher suites with Perfect Forward Secrecy (PFS) such as Ephemeral Diffie-Hellman (DHE) or Elliptic Curve Ephemeral Diffie-Hellman (ECDHE). Most modern systems such as Java 7 and later support these modes.</p> <p> <b>Signing Requests</b> </p> <p>Requests must be signed using an access key ID and a secret access key. We strongly recommend that you do not use your Amazon Web Services account root access key ID and secret access key for everyday work. You can use the access key ID and secret access key for an IAM user or you can use the Security Token Service (STS) to generate temporary security credentials and use those to sign requests. </p> <p>All KMS requests must be signed with <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4</a>.</p> <p> <b>Logging API Requests</b> </p> <p>KMS supports CloudTrail, a service that logs Amazon Web Services API calls and related events for your Amazon Web Services account and delivers them to an Amazon S3 bucket that you specify. By using the information collected by CloudTrail, you can determine what requests were made to KMS, who made the request, when it was made, and so on. To learn more about CloudTrail, including how to turn it on and find your log files, see the <a href=\\\"https://docs.aws.amazon.com/awscloudtrail/latest/userguide/\\\">CloudTrail User Guide</a>.</p> <p> <b>Additional Resources</b> </p> <p>For more information about credentials and request signing, see the following:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html\\\">Amazon Web Services Security Credentials</a> - This topic provides general information about the types of credentials used to access Amazon Web Services.</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html\\\">Temporary Security Credentials</a> - This section of the <i>IAM User Guide</i> describes how to create and use temporary security credentials.</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 Signing Process</a> - This set of topics walks you through the process of signing a request using an access key ID and a secret access key.</p> </li> </ul> <p> <b>Commonly Used API Operations</b> </p> <p>Of the API operations discussed in this guide, the following will prove the most useful for most applications. You will likely perform operations other than these, such as creating keys and assigning policies, by using the console.</p> <ul> <li> <p> <a>Encrypt</a> </p> </li> <li> <p> <a>Decrypt</a> </p> </li> <li> <p> <a>GenerateDataKey</a> </p> </li> <li> <p> <a>GenerateDataKeyWithoutPlaintext</a> </p> </li> </ul>\"\
}\
";
}

@end
