// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/http;

public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "http://localhost:9090/") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    #
    # + return - Created 
    resource isolated function post addLecturer(Lecturer payload) returns string|error {
        string resourcePath = string `/addLecturer`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function get getAllLecturers() returns Lecturer[]|error {
        string resourcePath = string `/getAllLecturers`;
        Lecturer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function put updateLecturer(string staffNum, Lecturer payload) returns string|error {
        string resourcePath = string `/updateLecturer`;
        map<anydata> queryParam = {"staffNum": staffNum};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function get getLecturerByStaffNum(string staffNum) returns Lecturer|error {
        string resourcePath = string `/getLecturerByStaffNum`;
        map<anydata> queryParam = {"staffNum": staffNum};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Lecturer response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function delete deleteLecturerByStaffNum(string staffNum) returns string|error {
        string resourcePath = string `/deleteLecturerByStaffNum`;
        map<anydata> queryParam = {"staffNum": staffNum};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function get getLecturersInSameOffice(string officeNum) returns Lecturer[]|error {
        string resourcePath = string `/getLecturersInSameOffice`;
        map<anydata> queryParam = {"officeNum": officeNum};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Lecturer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function get getLecturersTeachingCourse(string courseName) returns Lecturer[]|error {
        string resourcePath = string `/getLecturersTeachingCourse`;
        map<anydata> queryParam = {"courseName": courseName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Lecturer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
}