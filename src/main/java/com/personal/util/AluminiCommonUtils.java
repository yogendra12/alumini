/**
 * 
 */
package com.personal.util;

import java.util.UUID;

/**
 * @author koti
 *
 */
public class AluminiCommonUtils {
	public static String getRandomNum(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	public static void main(String k[]){
		System.out.println(getRandomNum());
	}
}
