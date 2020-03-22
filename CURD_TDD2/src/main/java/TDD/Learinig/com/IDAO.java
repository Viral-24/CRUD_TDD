package TDD.Learinig.com;

import java.util.*;;

public interface IDAO {

	boolean getConnection();

	boolean insertingRecords(UserModels model);

	int editRecords(int id,UserModels model);

	UserModels getRecordsById(int i);

	int deleteRecords(int i);

	List<UserModels> getRecords();



	

}
