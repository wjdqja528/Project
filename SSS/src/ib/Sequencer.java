package ib;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.JdbcUtil;

public class Sequencer {
	
	public synchronized static int nextId(Connection conn, String tableName)
		throws SQLException{
			PreparedStatement pstmtSelect = null;
			ResultSet rsSelect = null;
			PreparedStatement pstmtUpdate = null;
			
			try {
				pstmtSelect = conn.prepareStatement(
						"select MESSAGE_ID from ID_SEQUENCESjj where TABLE_NAME = ?");
				pstmtSelect.setString(1, tableName);
				
				rsSelect = pstmtSelect.executeQuery();
				
				if(rsSelect.next()) {
					int id = rsSelect.getInt(1);
					id++;
					
					pstmtUpdate = conn.prepareStatement(
							"update ID_SEQUENCESjj set MESSAGE_ID = ? "+
							"where TABLE_NAME = ?");
					pstmtUpdate.setInt(1, id);
					pstmtUpdate.setString(2, tableName);
					pstmtUpdate.executeUpdate();
					
					return id;
				} else {
					pstmtUpdate = conn.prepareStatement(
							"insert into ID_SEQUENCESjj values (?, ?)");
					pstmtUpdate.setString(1, tableName);
					pstmtUpdate.setInt(2, 1);
					pstmtUpdate.executeUpdate();
					
					return 1;
				}
			} finally {
				JdbcUtil.close(pstmtSelect);
				JdbcUtil.close(rsSelect);
				JdbcUtil.close(pstmtUpdate);
			}
	}

}
