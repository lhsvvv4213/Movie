package com.pot.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.pot.dto.CinemaVO;
import com.pot.dto.MovieVO;

@Component
public class FileUtil {
	
	public static String uploadFile(String fileName, HttpServletRequest request, Object obj) {
		
		String path = getSaveLocation(request, obj);
		
		return path + fileName;
	}
	
	public static String rename(String fileName) {
		
		if (fileName == null) {
			return null;
		}
		
		int idx = fileName.lastIndexOf(".");
		String extention = fileName.substring(idx);
		String newName = Long.toString(System.currentTimeMillis());		
		
		String newFileName = newName + extention;

		return newFileName;
	}
	
	private static String getSaveLocation(HttpServletRequest request, Object obj) {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "assets/user/img/";
		
		if (obj instanceof CinemaVO) {
			attachPath += "cinemaPics/";
		} else if (obj instanceof MovieVO) {
			attachPath += "moviePics/";
		} else {
			attachPath += "eventPics/";
		}
		
		return uploadPath + attachPath;
	}

}
