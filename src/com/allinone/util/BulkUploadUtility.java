package com.allinone.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.allinone.pojos.League;
import com.allinone.pojos.Player;
import com.allinone.pojos.Team;

public class BulkUploadUtility {
	
	
	@Autowired
	private static SessionFactory objSessionFactory;
	
	private static final String FILE_NAME = "C:\\Users\\rahul\\workspace\\All-In-One-FantasyGame\\DataMappings.xlsx";
	   
	   
	public static boolean readData() {

        List<Team> listOfTeams = new ArrayList<Team>();
        List<Player> listOfPlayers = new ArrayList<Player>();
        
        Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(League.class);
		Criterion usernameCriteria = Restrictions.eq("leagueName", "IPL");
		objCriteria.add(usernameCriteria);

		List<League> results = objCriteria.list();
		
		if(results == null || results.isEmpty())
			return false;
		
		League league = results.get(0);
        
	      try {

	            FileInputStream excelFile = new FileInputStream(new File(FILE_NAME));
	            Workbook workbook = new XSSFWorkbook(excelFile);

	            Sheet datatypeSheet = workbook.getSheetAt(0);
	            Iterator<Row> iterator = datatypeSheet.iterator();
	            Row currentRow = iterator.next();
	            Map<String,Team> mapOfCodeAndTeam = new HashMap<String,Team>();
	            
	            while (iterator.hasNext()) {

	            	currentRow = iterator.next();
	                Iterator<Cell> cellIterator = currentRow.iterator();
	             	Team team = new Team();
	                while (cellIterator.hasNext()) {

	                    Cell currentCell = cellIterator.next();
	                    int columnIndex = currentCell.getColumnIndex();
	                    
	                    switch (columnIndex) {
	                    case 1:
	                   
	                    	team.setTeamName((String)getCellValue(currentCell));
	                    //	team.setLeague(league);
	                        break;
	                    case 2:
	                    	team.setTeamInitials((String)getCellValue(currentCell));
	                    	break;

	                    }
	                    mapOfCodeAndTeam.put(team.getTeamInitials(), team);
	                    team.setLeague(league);
	                    listOfTeams.add(team);
	                    
	                    //getCellTypeEnum shown as deprecated for version 3.15
	                    //getCellTypeEnum ill be renamed to getCellType starting from version 4.0
	                 
	                }

	            }
	            
	            
	            datatypeSheet = workbook.getSheetAt(1);
	            iterator = datatypeSheet.iterator();
	            currentRow = iterator.next();
	            
	            while (iterator.hasNext()) {

	            	currentRow = iterator.next();
	                Iterator<Cell> cellIterator = currentRow.iterator();
	             	Player player = new Player();
	             	
	                while (cellIterator.hasNext()) {

	                    Cell currentCell = cellIterator.next();
	                    int columnIndex = currentCell.getColumnIndex();
	                    
	                    switch (columnIndex) {
	                    case 1:
	                   
	                    	player.setFirstName((String)getCellValue(currentCell));
	                    
	                        break;
	                    case 2:
	                    	player.setLastName((String)getCellValue(currentCell));
	                    	break;
	                    	
	                    case 3:
	                    	player.setPlayerRole((String)getCellValue(currentCell));
	                    	break;
	                    	
	                    case 4:
	                    	if(mapOfCodeAndTeam.containsKey((String)getCellValue(currentCell))) {
	                    		player.setTeam(mapOfCodeAndTeam.get((String)getCellValue(currentCell)));
	                    	} else {
	                    		//throw exception
	                    	}
	                    	break;

	                    }
	                    
	                    player.setLeague(league);
	                    listOfPlayers.add(player);
	                    //getCellTypeEnum shown as deprecated for version 3.15
	                    //getCellTypeEnum ill be renamed to getCellType starting from version 4.0
	                 
	                }

	            }
	            
	            
	            
	            workbook.close();
	            
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	      
	
	      for(Player player : listOfPlayers) {
          	    objSessionFactory.getCurrentSession().saveOrUpdate(player);
          }
	      
	      for(Team team : listOfTeams) {
	          	objSessionFactory.getCurrentSession().saveOrUpdate(team);
	      }
	      
	        return true;
	    }
	   
	   private static Object getCellValue(Cell currentCell) {
		    
		   if (currentCell.getCellTypeEnum() == CellType.STRING) {
               return currentCell.getStringCellValue();
           } else if (currentCell.getCellTypeEnum() == CellType.NUMERIC) {
               return currentCell.getNumericCellValue();
           } else if(currentCell.getCellTypeEnum() == CellType.BOOLEAN) {
        	   return currentCell.getBooleanCellValue();
           }

		 
		    return null;
		}
}
