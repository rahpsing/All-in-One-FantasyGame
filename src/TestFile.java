import org.hibernate.Session;
import org.junit.Test;

import com.allinone.pojos.User;
import com.allinone.util.HibernateUtil;

public class TestFile {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSessionFactory().openSession();

		session.beginTransaction();
		
		User user = new User();

		user.setAdmin(false);
		user.setUserName("Rahul");
		user.setEmailAddress("rahul_singh919@yahoo.com");
		user.setPhoneNumber("8123698563");

		session.save(user);
		session.getTransaction().commit();
		session.close();
	}

	@Test
	public void testMethod() {
		
		Session session = HibernateUtil.getSessionFactory().openSession();

		session.beginTransaction();
		
		User user = new User();

		user.setAdmin(false);
		user.setUserName("Rahul");
		user.setEmailAddress("rahul_singh919@yahoo.com");
		user.setPhoneNumber("8123698563");

		session.save(user);
		session.getTransaction().commit();
		session.close();
	}
}
