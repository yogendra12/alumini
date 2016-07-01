package com.personal.util;

import java.io.File;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AWSS3Util {
	
public String uploadfile(File uploadFile, boolean isPublic, String keyName)
	{
		AmazonS3 s3client = null;
		String finalUrl = null;
		String bucketName = null;
		AWSCredentials credentials = null;
		try {
			credentials = new BasicAWSCredentials(Constants.S3_AUTH_KEY, Constants.S3_SECRET_KEY);
			s3client = new AmazonS3Client(credentials);
           // File file = new File(uploadFileName);
            if(isPublic){
            	bucketName = Constants.S3_PUBLIC_BUCKET;
            }else{
            	bucketName = Constants.S3_NON_PUBLIC_BUCKET;
            }
            PutObjectRequest requestObj =new PutObjectRequest(bucketName,keyName, uploadFile); 
            requestObj.setCannedAcl(CannedAccessControlList.PublicRead);
            s3client.putObject(requestObj);
            finalUrl = "https://"+bucketName+".s3.amazonaws.com/" + keyName ;
         } catch (AmazonServiceException ase) {
            System.out.println("Caught an AmazonServiceException, which " +
            		"means your request made it " +
                    "to Amazon S3, but was rejected with an error response" +
                    " for some reason.");
            System.out.println("Error Message:    " + ase.getMessage());
            System.out.println("HTTP Status Code: " + ase.getStatusCode());
            System.out.println("AWS Error Code:   " + ase.getErrorCode());
            System.out.println("Error Type:       " + ase.getErrorType());
            System.out.println("Request ID:       " + ase.getRequestId());
        } catch (AmazonClientException ace) {
            System.out.println("Caught an AmazonClientException, which " +
            		"means the client encountered " +
                    "an internal error while trying to " +
                    "communicate with S3, " +
                    "such as not being able to access the network.");
            System.out.println("Error Message: " + ace.getMessage());
        }
		return finalUrl;
	}

}
