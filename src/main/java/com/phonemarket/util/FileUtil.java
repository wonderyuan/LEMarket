package com.phonemarket.util;

public class FileUtil {

	public static String getFileType(String header){
		int index=header.lastIndexOf(".");
		String houzhui=header.substring(index,header.length()-1);
		return houzhui;
	}
}
