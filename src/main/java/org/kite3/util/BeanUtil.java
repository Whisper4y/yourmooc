package org.kite3.util;

public class BeanUtil {

	/**
	 * 转换将第一个字母大写变成小写，并在前面加下划线
	 * 
	 * @param args
	 */
	public static String fieldToColumn(String str) {
		char[] chars = str.toCharArray();
		String rstStr = "";
		for (int i = 0; i < chars.length; i++) {
			if (chars[i] > 64 && chars[i] < 94) {
				rstStr += ("_" + chars[i]).toLowerCase();
			} else {
				rstStr += chars[i];
			}
		}
		return rstStr;
	}

}
