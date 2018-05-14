package upload;

import java.sql.Connection;
import java.sql.SQLException;

import upload.PdsItemDao;
import board.JdbcUtil;
import book.ConnectionProvider;

public class IncreaseDownloadCountService {
		private static IncreaseDownloadCountService instance = new IncreaseDownloadCountService();
		
		public static IncreaseDownloadCountService getInstance() {
				return instance;
		}
		
		private IncreaseDownloadCountService() {
		}
		
		public boolean increaseCount(int id) {
				Connection conn = null;
				try {
						conn = ConnectionProvider.getConnection();
						int updatedCount = PdsItemDao.getInstance().increaseCount(conn, id);
						return updatedCount == 0 ? false : true;
				} catch (SQLException e) {
						throw new RuntimeException("DB 처리 에러 발생: " + e.getMessage(), e);
				} finally {
						JdbcUtil.close(conn);
				}
		}
}
