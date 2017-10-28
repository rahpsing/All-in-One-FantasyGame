package com.allinone.dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import org.springframework.stereotype.Repository;

import com.allinone.dao.api.SportUtilityDaoAPI;
import com.allinone.pojos.League;
import com.allinone.pojos.Player;
import com.allinone.pojos.Sport;
import com.allinone.pojos.Team;
import com.allinone.util.BulkUploadUtility;

@Repository
public class SportUtilityDaoImpl implements SportUtilityDaoAPI {

	@Autowired
	private SessionFactory objSessionFactory;
	
	private static final String FILE_NAME = "C:\\Users\\rahul\\workspace\\All-In-One-FantasyGame\\DataMappings.xlsx";
	
	
/*	public static void main(String[] args) {
		try {
			InputStream stream = SportUtilityDaoImpl.class.getResourceAsStream("DataMappings.xlsx");
			FileInputStream excelFile = new FileInputStream(stream);
			System.out.println(excelFile);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	@Override
	public String getsportID(String sportName) {
		Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(Sport.class);
		Criterion sportIdCriteria = Restrictions.ilike("sportName", sportName);
		objCriteria.add(Restrictions.and(sportIdCriteria));
		
		List<Sport> listOfSport = new ArrayList<Sport>();
		listOfSport = objCriteria.list();
		return listOfSport.get(0).getId();
	}
	
	@Override
	public boolean addEntriesToDatabase() {
		// TODO Auto-generated method stub
		//code to add player
		
		//retrieve sport_roles and check if roles exists in that object
		
		try {
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
		                    case 0:
		                   
		                    	team.setTeamName((String)getCellValue(currentCell));
		                        break;
		                    case 1:
		                    	team.setTeamInitials((String)getCellValue(currentCell));
		                    	break;

		                    }
		                }
	                    
	                    team.setLeague(league);
	                    mapOfCodeAndTeam.put(team.getTeamInitials(), team);
	                    listOfTeams.add(team);
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
		                    case 0:
		                   
		                    	player.setFirstName((String)getCellValue(currentCell));
		                    
		                        break;
		                    case 1:
		                    	player.setLastName((String)getCellValue(currentCell));
		                    	break;
		                    	
		                    case 2:
		                    	player.setPlayerRole((String)getCellValue(currentCell));
		                    	break;
		                    	
		                    case 3:
		                    	if(mapOfCodeAndTeam.containsKey((String)getCellValue(currentCell))) {
		                    		player.setTeam(mapOfCodeAndTeam.get((String)getCellValue(currentCell)));
		                    	} else {
		                    		//throw exception
		                    	}
		                    	break;

		                    }

		                }
	                    player.setLeague(league);
	                    listOfPlayers.add(player);

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
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return true;
	}
	
	private void addTeams() {
		
		
	}
	
	@Override
	public boolean addNewSportEntry() {
		
		try {
			Sport sport = new Sport();
			sport.setSportName("Cricket");
			Set<String> setOfRoles = new HashSet<String>();
			setOfRoles.add("Bowler");
			setOfRoles.add("Batsman");
			setOfRoles.add("WicketKeeper");
			sport.setSetOfRoles(setOfRoles);
			
			sport.setSetOfLeagues(new HashSet<League>());
		//	sport.setSetOfPlayers(new HashSet<Player>());
			objSessionFactory.getCurrentSession().saveOrUpdate(sport);
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}

	@Override
	public boolean createLeague() {
		// TODO Auto-generated method stub

		try {
			
			League league = new League();
			league.setLeagueName("IPL");
			league.setSystemLeague(true);
			
			League league2 = new League();
			league2.setLeagueName("PSL");
			league2.setSystemLeague(true);
			
			
			League league3 = new League();
			league3.setLeagueName("Australian Summer League");
			league3.setSystemLeague(true);
			
			
			League league4 = new League();
			league4.setLeagueName("Carribean League");
			league4.setSystemLeague(true);
			
			
			League league5 = new League();
			league5.setLeagueName("Westeros League");
			league5.setSystemLeague(true);
			
			
			League league6 = new League();
			league6.setLeagueName("ICC top 11");
			league6.setSystemLeague(true);
			
			
			League league7 = new League();
			league7.setLeagueName("Westeros Champions League");
			league7.setSystemLeague(true);

			Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(Sport.class);
			Criterion usernameCriteria = Restrictions.eq("sportName", "Cricket");
			objCriteria.add(usernameCriteria);

			List<Sport> results = objCriteria.list();
			
			if(results == null || results.isEmpty())
				return false;
			
			Sport sport = results.get(0);
			Set set = new HashSet();
			set.add(league);
			//sport.setSetOfLeagues(set);
			league.setSport(sport);
			league2.setSport(sport);
			league3.setSport(sport);
			league4.setSport(sport);
			league5.setSport(sport);
			league6.setSport(sport);
			league7.setSport(sport);
			objSessionFactory.getCurrentSession().saveOrUpdate(league);
			objSessionFactory.getCurrentSession().saveOrUpdate(league2);
			objSessionFactory.getCurrentSession().saveOrUpdate(league3);
			objSessionFactory.getCurrentSession().saveOrUpdate(league4);
			objSessionFactory.getCurrentSession().saveOrUpdate(league5);
			objSessionFactory.getCurrentSession().saveOrUpdate(league6);
			objSessionFactory.getCurrentSession().saveOrUpdate(league7);
			//objSessionFactory.getCurrentSession().saveOrUpdate(sport);
		} catch(Exception e) {
			System.out.println(e);
			return false;
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
