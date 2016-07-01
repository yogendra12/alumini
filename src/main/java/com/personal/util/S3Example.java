package com.personal.util;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author srinivasa.dova
 */
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;

public class S3Example {
	private static String bucketName     = "dovasoftbucket";
	private static String keyName     = "sample";
	private static String uploadFileName    = "/home/koti/Downloads/secure_otp.gif";
        ///Users/srinivasa.dova/Documents/personalDocs
	
	void uploadfile(AWSCredentials credentials)
	{
		AmazonS3 s3client = new AmazonS3Client(credentials);
		
		try {
            File file = new File(uploadFileName);
            PutObjectRequest p =new PutObjectRequest(bucketName,keyName, file); 
            p.setCannedAcl(CannedAccessControlList.PublicRead);
            s3client.putObject(p);
            String _finalUrl = "https://"+bucketName+".s3.amazonaws.com/" + keyName ;
            System.out.println(_finalUrl);
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
	}
		
		void deletefile(AWSCredentials credentials1)
		{
			AmazonS3 s3client = new AmazonS3Client(credentials1);
			 try {
				 s3client.deleteObject(new DeleteObjectRequest(bucketName, keyName));
		        } catch (AmazonServiceException ase) {
		            System.out.println("Caught an AmazonServiceException.");
		            System.out.println("Error Message:    " + ase.getMessage());
		            System.out.println("HTTP Status Code: " + ase.getStatusCode());
		            System.out.println("AWS Error Code:   " + ase.getErrorCode());
		            System.out.println("Error Type:       " + ase.getErrorType());
		            System.out.println("Request ID:       " + ase.getRequestId());
		        } catch (AmazonClientException ace) {
		            System.out.println("Caught an AmazonClientException.");
		            System.out.println("Error Message: " + ace.getMessage());
		        }
		    }

		void downloadfile(AWSCredentials credentials2) throws IOException
		{
			AmazonS3 s3client = new AmazonS3Client(credentials2);
			try {
	            System.out.println("Downloading an object");
	            S3Object s3object = s3client.getObject(new GetObjectRequest(
	            		bucketName, keyName));
	            System.out.println("Content-Type: "  + 
	            s3object.getObjectMetadata().getContentType());	 
	            InputStream input = s3object.getObjectContent();
	            
	           BufferedReader reader = new BufferedReader(new InputStreamReader(input));
	           while (true) {
	               String line = reader.readLine();
	               if (line == null) break;

	               System.out.println("    " + line);
	           }
	           System.out.println();   
	        } catch (AmazonServiceException ase) {
	            System.out.println("Caught an AmazonServiceException, which" +
	            		" means your request made it " +
	                    "to Amazon S3, but was rejected with an error response" +
	                    " for some reason.");
	            System.out.println("Error Message:    " + ase.getMessage());
	            System.out.println("HTTP Status Code: " + ase.getStatusCode());
	            System.out.println("AWS Error Code:   " + ase.getErrorCode());
	            System.out.println("Error Type:       " + ase.getErrorType());
	            System.out.println("Request ID:       " + ase.getRequestId());
	        } catch (AmazonClientException ace) {
	            System.out.println("Caught an AmazonClientException, which means"+
	            		" the client encountered " +
	                    "an internal error while trying to " +
	                    "communicate with S3, " +
	                    "such as not being able to access the network.");
	            System.out.println("Error Message: " + ace.getMessage());
	        }
	    }

		
	
	public static void main(String[] args) throws IOException {
		AWSCredentials Credentials = new BasicAWSCredentials(
				"AKIAJKLWA7ECH7VQKWVQ", 
				"7XxAbyy0wZ+Dt25g3Ug4XYS7JW66YBLFyQ00MIg2");
		S3Example s3client = new S3Example();
        	s3client.uploadfile(Credentials);
	        //s3client.deletefile(Credentials);
	       //s3client.downloadfile(Credentials);
 	
  }
}