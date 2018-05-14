package book;

//import book.mysql.MSSQLMessageDao;
//import book.mysql.MySQLMessageDao;

//MessageDao md = MessageDaoProvider.getInstance().getMessageDao()
import book.OracleMessageDao;

public class MessageDaoProvider {
		private static MessageDaoProvider instance = new MessageDaoProvider();
		public static MessageDaoProvider getInstance() {
				return instance;
		}
		private MessageDaoProvider() {}
		
		//private MySQLMessageDao mysqlDao = new MySQLMessageDao();
		private OracleMessageDao oracleDao = new OracleMessageDao();
		//private MSSQLMessageDao mssqlDao = new MSSQLMessageDao();
		private String dbms;
		
		void setDbms(String dbms) {
				this.dbms = dbms;
		}
		
		//messageDaoProvider.getInstance().getMessageDao()
		public MessageDao getMessageDao() {
				if("oracle".equals(dbms)) {
						return oracleDao;
				}
				return null;
		}
}
