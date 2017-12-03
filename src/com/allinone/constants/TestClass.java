package com.allinone.constants;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.DVConstraint;
import org.apache.poi.hssf.usermodel.HSSFDataValidation;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.Name;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddressList;

public class TestClass {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		 createLeagueUploadFile();
		 createGameUploadFile();
	}

	private static void createGameUploadFile() throws IOException{
		// TODO Auto-generated method stub
		//-----------------NEED TO HAVE THE LIST OF METRICS WITH ME---------------------//
		
		  HSSFWorkbook workbook = new HSSFWorkbook();
		  HSSFSheet sheet1 = workbook.createSheet("Team1");
		  HSSFSheet sheet2 = workbook.createSheet("Team2");
		 
		//-----------------PREFILL ALL THESE VALUES-----------------------//
		  
		  //Sheet1
		  Row row = sheet1.createRow((short)0);
		  Cell cell1 = row.createCell(0);
		  cell1.setCellValue("PLAYER-ID");
		  
		  Cell cell2 = row.createCell(0);
		  cell2.setCellValue("FIRST-NAME");
		  
		  Cell cell3 = row.createCell(1);
		  cell3.setCellValue("LAST-NAME");
		  sheet1.autoSizeColumn((short)0);
		  sheet1.autoSizeColumn((short)1);
		  sheet1.autoSizeColumn((short)2);
		  
		  sheet1.setColumnHidden(0, true);
		  
		  //---------------------ADD METRICS HERE---------------------//
		  
		  
		  //Sheet2
		//-----------------PREFILL ALL THESE VALUES-----------------------//
		  
		  Row sheet2Row = sheet1.createRow((short)0);
		  Cell sheet2Cell1 = sheet2Row.createCell(0);
		  sheet2Cell1.setCellValue("PLAYER-ID");
		  
		  Cell sheet2Cell2 = sheet2Row.createCell(0);
		  sheet2Cell2.setCellValue("FIRST-NAME");
		  
		  Cell sheet2Cell3 = sheet2Row.createCell(1);
		  sheet2Cell3.setCellValue("LAST-NAME");
		  sheet2.autoSizeColumn((short)0);
		  sheet2.autoSizeColumn((short)1);
		  sheet2.autoSizeColumn((short)2);
		  
		  sheet2.setColumnHidden(0, true);
		  
		  //---------------------ADD METRICS HERE---------------------//
			
		  
		  FileOutputStream fileOut = new FileOutputStream("GameFile.xls");
		  workbook.write(fileOut);
		    fileOut.close();
		    
		    
		  try {
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void createLeagueUploadFile() throws IOException {
		// TODO Auto-generated method stub
		 HSSFWorkbook workbook = new HSSFWorkbook();
		  HSSFSheet sheet1 = workbook.createSheet("TeamNames");
		  HSSFSheet sheet2 = workbook.createSheet("Team-Player-Mappings");
		  HSSFSheet sheet3 = workbook.createSheet("League-Rules");
		  HSSFSheet sheet4 = workbook.createSheet("League-Games");
		  
		  //Sheet1
		  Row row = sheet1.createRow((short)0);
		  Cell cell = row.createCell(0);
		  cell.setCellValue("TEAM-NAME");
		  
		  cell.setCellType(CellType.STRING);
		  
		  
		  Cell cell2 = row.createCell(1);
		  cell2.setCellValue("TEAM-INITIALS");
		  sheet1.autoSizeColumn((short)0);
		  sheet1.autoSizeColumn((short)1);
		  
		  
		  //Sheet2
		  Row sheet2Row = sheet2.createRow((short)0);
		  Cell sheet2Cell = sheet2Row.createCell(0);
		  sheet2Cell.setCellValue("FIRST-NAME");
		  
		  sheet2Cell.setCellType(CellType.STRING);
		  
		  
		  Cell sheet2Cell2 = sheet2Row.createCell(1);
		  sheet2Cell2.setCellValue("LAST-NAME");
		  
		  Cell sheet2Cell3 = sheet2Row.createCell(2);
		  sheet2Cell3.setCellValue("PLAYER-INITIALS");
		  
		  Cell sheet2Cell4 = sheet2Row.createCell(3);
		  sheet2Cell4.setCellValue("PLAYER-ROLE");
		  
		  Cell sheet2Cell5 = sheet2Row.createCell(4);
		  sheet2Cell5.setCellValue("TEAM-INITIALS");
		  
		  Name namedRange = workbook.createName();
		  namedRange.setNameName("list1");
		  namedRange.setRefersToFormula("'TeamNames'!$B$2:$B$100");
		  DVConstraint dvConstraint = DVConstraint.createFormulaListConstraint("list1");
		  CellRangeAddressList addressList = new CellRangeAddressList(1, 100, 4, 4);
		  DataValidation dataValidation = new HSSFDataValidation
				    (addressList, dvConstraint);
		  dataValidation.setSuppressDropDownArrow(false);
		  sheet2.addValidationData(dataValidation);
		  sheet2.autoSizeColumn((short)1);
		  sheet2.autoSizeColumn((short)2);
		  sheet2.autoSizeColumn((short)3);
		  sheet2.autoSizeColumn((short)4);
		  
		  
		  //Sheet 3
		  //-------------------------FETCH METRICS FROM LEAGUE------------------------------//
		  Row sheet3Row = sheet3.createRow((short)0);
		  Cell sheet3Cell = sheet3Row.createCell(0);
		  sheet3Cell.setCellValue("METRIC");
		  sheet3Cell.setCellType(CellType.STRING);
		  CellRangeAddressList metricAddressList = new CellRangeAddressList(
				    1, 100, 4, 4);
		  DVConstraint metricConstraint = DVConstraint.createExplicitListConstraint(
				    new String[]{ScoringRatio.PER_SCORE.toString(), ScoringRatio.TOTAL.toString()});
		  DataValidation metricValidation = new HSSFDataValidation
				    (metricAddressList, metricConstraint);
		  metricValidation.setSuppressDropDownArrow(false);
		  sheet3.addValidationData(metricValidation);
		  

		  Cell sheet3Cell2 = sheet3Row.createCell(1);
		  sheet3Cell2.setCellValue("OPERATOR");
		  
		  CellRangeAddressList operatorAddressList = new CellRangeAddressList(
				    1, 100, 1, 1);
		  DVConstraint operatorConstraint = DVConstraint.createExplicitListConstraint(
				    new String[]{Operators.GREATER_THAN.toString(), Operators.LESS_THAN.toString(), Operators.EQUALS.toString()});
		  DataValidation operatorValidation = new HSSFDataValidation
				    (operatorAddressList, operatorConstraint);
		  operatorValidation.setSuppressDropDownArrow(false);
		  sheet3.addValidationData(operatorValidation);
		  
		  
		  Cell sheet3Cell3 = sheet3Row.createCell(2);
		  sheet3Cell3.setCellValue("SCORE");
		  
		  Cell sheet3Cell4 = sheet3Row.createCell(3);
		  sheet3Cell4.setCellValue("POINTS");
		  
		  Cell sheet3Cell5 = sheet3Row.createCell(4);
		  sheet3Cell5.setCellValue("RATIO");
		  
		  CellRangeAddressList ratioAddressList = new CellRangeAddressList(
				    1, 100, 4, 4);
		  DVConstraint ratioConstraint = DVConstraint.createExplicitListConstraint(
				    new String[]{ScoringRatio.PER_SCORE.toString(), ScoringRatio.TOTAL.toString()});
		  DataValidation ratioValidation = new HSSFDataValidation
				    (ratioAddressList, ratioConstraint);
		  ratioValidation.setSuppressDropDownArrow(false);
		  sheet3.addValidationData(ratioValidation);
		  
		  sheet3.autoSizeColumn((short)0);
		  sheet3.autoSizeColumn((short)1);
		  sheet3.autoSizeColumn((short)2);
		  sheet3.autoSizeColumn((short)3);
		  sheet3.autoSizeColumn((short)4);
		  
		  //Sheet 4
		  Row sheet4Row = sheet4.createRow((short)0);
		  Cell sheet4Cell1 = sheet4Row.createCell(0);
		  sheet4Cell1.setCellValue("TEAM1");
		  sheet4Cell1.setCellType(CellType.STRING);
		  
		  Cell sheet4Cell2 = sheet4Row.createCell(1);
		  sheet4Cell2.setCellValue("TEAM2");
		  
		  Cell sheet4Cell3 = sheet4Row.createCell(2);
		  sheet4Cell3.setCellValue("DATE(MM/DD/YYYY)");
		  
		  CreationHelper createHelper = workbook.getCreationHelper();

		    // Create a row and put some cells in it. Rows are 0 based.

		    // we style the second cell as a date (and time).  It is important to
		    // create a new cell style from the workbook otherwise you can end up
		    // modifying the built in style and effecting not only this cell but other cells.
		    CellStyle cellStyle = workbook.createCellStyle();
		    cellStyle.setDataFormat(
		        createHelper.createDataFormat().getFormat("mm/dd/yyyy"));
		    sheet4Cell3.setCellStyle(cellStyle);

			 Cell sheet4Cell4 = sheet4Row.createCell(3);
			 sheet4Cell4.setCellValue("TIME(HH:MM)");
			  
			 Cell sheet4Cell5 = sheet4Row.createCell(4);
			 sheet4Cell5.setCellValue("VENUE");
			  sheet4.autoSizeColumn((short)0);
			  sheet4.autoSizeColumn((short)1);
			  sheet4.autoSizeColumn((short)2);
			  sheet4.autoSizeColumn((short)3);
			  sheet4.autoSizeColumn((short)4);
			
		  
		  FileOutputStream fileOut = new FileOutputStream("LeagueData.xls");
		  workbook.write(fileOut);
		    fileOut.close();
		    
		    
		  try {
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
