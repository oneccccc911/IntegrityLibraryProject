package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateUtil {
	
	public static java.sql.Date toSqlDate(String dt){
		//스트링을 데이트로 바꾸기 string > java.util.date > java.sql.date
				//String dt = request.getParameter("hire_date");
				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
				java.sql.Date hire_date = null;
				try {
					java.util.Date hire = sd.parse(dt);
					hire_date = new java.sql.Date(hire.getTime());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return hire_date;
	}

}
