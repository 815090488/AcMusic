package com.bjwlxy.utils;

import java.security.Key;

/**
 * DES加密  
 * base64编码加密和解密
 */
import javax.crypto.Cipher;

import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class base64Util { 
	
	public static String desDecript(String clearText, String originKey) throws Exception {
		Cipher cipher = Cipher.getInstance("DES");
		Key key=getKey(originKey);
		cipher.init(Cipher.DECRYPT_MODE, key);
		byte[] decode = Base64.decodeBase64(clearText.getBytes());
		byte[] doFinal = cipher.doFinal(decode);
		return new String(doFinal);
	}

	public static  String desEncript(String clearText, String originKey) throws Exception {
		Cipher cipher = Cipher.getInstance("DES");
		SecretKeySpec key = getKey(originKey);
		cipher.init(Cipher.ENCRYPT_MODE, key);
		byte[] doFinal = cipher.doFinal(clearText.getBytes());
		byte[] endoce = Base64.encodeBase64(doFinal);
		return new String(endoce);
	}

	public static  SecretKeySpec getKey(String originKey) {
		
		byte[] buffer = new byte[8];
		byte[] originBytes = originKey.getBytes();
		for (int i = 0; i <8 &&i<originBytes.length; i++) {
			buffer[i]=originBytes[i];
		}
		SecretKeySpec key = new SecretKeySpec(buffer,"DES");
		return key;
	}
	
	
}
