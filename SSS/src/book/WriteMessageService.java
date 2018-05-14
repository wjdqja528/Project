package book;

import java.sql.Connection;
import java.sql.SQLException;

import book.MessageDao;
import book.MessageDaoProvider;
import book.Message;
import board.JdbcUtil;
import book.ConnectionProvider;

public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return instance;
	}
	
	private WriteMessageService() {}
	
	public void write(Message message)throws ServiceException{
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDaoProvider.getInstance().getMessageDao();
			messageDao.insert(conn, message);
		}catch(SQLException e) {
			throw new ServiceException(
					"메시지 등록 실패: " + e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
	}

}
