package TDD.Learinig.com;

import static org.junit.Assert.*;

import java.util.List;
import java.util.ArrayList;

import org.junit.Ignore;
import org.junit.Test;

public class CURD_TestCast {

	IDAO dbConnection=new DB_Connection();

	@Ignore
	@Test
	public void testConncetion()
	{
		boolean isConnected=dbConnection.getConnection();
		assertEquals(true,isConnected);
	}
	
	
	@Ignore
	@Test
	public void testRecords()
	{
		List<UserModels> userlist=new ArrayList<UserModels>();
		userlist=dbConnection.getRecords();
		assertEquals(true,userlist.size()>0);
		
	}
	
	@Ignore
	@Test
	public void testInsertValuse() {
		UserModels model=new UserModels();
		model.setId(03);
		model.setName("Manu");
		model.setEmail("manu@gmail.com");
		model.setAddre("Pune");
		boolean recordsInserted=dbConnection.insertingRecords(model);
		assertEquals(true,recordsInserted);
	}
	
	@Test
	public void eidtRecord() {
		UserModels model=new UserModels();
		model.setId(1);	
		model.setName("Das3333333");
		model.setEmail("Das1@gmail.com");
		model.setAddre("Pune");
		int rowAffected=dbConnection.editRecords(1,model);
		assertEquals(1, rowAffected);
	}
	@Ignore
	@Test
	public void textRecordById() {
		UserModels model=dbConnection.getRecordsById(2);
		String userName=model.getName();
		assertEquals("Rahul",userName);
	}
	@Ignore
	@Test
	public void deleteRecordTest() {
		int rowDelete=dbConnection.deleteRecords(2);
		assertEquals(1,rowDelete);
	}
	
}
