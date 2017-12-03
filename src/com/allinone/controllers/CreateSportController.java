package com.allinone.controllers;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.allinone.service.api.ExcelCreatorServiceAPI;
import com.allinone.service.api.SportUtilityServiceAPI;
import com.google.gson.Gson;

@Controller
public class CreateSportController {
	
	@Autowired
	ExcelCreatorServiceAPI objTemplateGenerator;
	
	
	@RequestMapping(value="/createTemplate")
	@ResponseBody
	public String createTemplate(HttpServletRequest objRequest, HttpServletResponse objResponse) throws IOException {
		
		String metrics = objRequest.getParameter("sportRoles");
		Set<String> setOfMetrics = new Gson().fromJson( metrics, Set.class);
		//Set playerSet=new HashSet(metrics);
		String sportName = objRequest.getParameter("sportName");
		
		String returnMessage = objTemplateGenerator.generateLeagueDataUploadFile(setOfMetrics, sportName);
		
		return returnMessage;
	}
	
	
	@RequestMapping(value="/downloadTemplate")
	   public ResponseEntity<InputStreamResource> downloadFile1(HttpServletRequest objRequest, HttpServletResponse objResponse) throws IOException {

/*			String metrics = objRequest.getParameter("sportRoles");
			Set<String> setOfMetrics = new Gson().fromJson( metrics, Set.class);
			//Set playerSet=new HashSet(metrics);
			String sportName = objRequest.getParameter("sportName");
			
			String returnMessage = objTemplateGenerator.generateLeagueDataUploadFile(setOfMetrics, sportName);*/
		   String fileName = objRequest.getParameter("fileName");
	      File file = new File("C:\\Users\\rahul\\eclipse\\jee-neon\\eclipse\\" + fileName);
	      InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

	      return ResponseEntity.ok()
	            .header(HttpHeaders.CONTENT_DISPOSITION,
	                  "attachment;filename=" + file.getName())
	            .contentType(MediaType.APPLICATION_JSON).contentLength(file.length())
	            .body(resource);
	   }
	
	
	   // Handling file upload request
	   @RequestMapping("/uploadTemplate")
	   public ResponseEntity<Object> fileUpload(@RequestParam("file") MultipartFile file)
	         throws IOException {

	      // Save file on system
	      if (!file.getOriginalFilename().isEmpty()) {
	         BufferedOutputStream outputStream = new BufferedOutputStream(
	               new FileOutputStream(
	                     new File("C:/Upload", file.getOriginalFilename())));
	         outputStream.write(file.getBytes());
	         outputStream.flush();
	         outputStream.close();
	      }else{
	         return new ResponseEntity<>("Invalid file.",HttpStatus.BAD_REQUEST);
	      }
	      
	      return new ResponseEntity<>("File Uploaded Successfully.",HttpStatus.OK);
	   }
	
	
	

}
