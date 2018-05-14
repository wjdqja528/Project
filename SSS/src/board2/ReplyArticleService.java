package board2;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Date;

import board2.ArticleDao;
import board2.Article;
import board2.ReplyingRequest;
import board.JdbcUtil;
import book.ConnectionProvider;

public class ReplyArticleService {
	
	private static ReplyArticleService instance = new ReplyArticleService();
	public static ReplyArticleService getInstance() {
		return instance;
	}
	
	private ReplyArticleService() {
	}
	
	public Article reply(ReplyingRequest replyingRequest)
			throws ArticleNotFoundException, CannotReplyArticleException,
			LastChildAlreadyExistsException{
		Connection conn = null;
		
		Article article = replyingRequest.toArticle();
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			ArticleDao articleDao = ArticleDao.getInstance();
			Article parent = articleDao.selectById(conn, replyingRequest.getParentArticleId());
		
		try {
			checkParent(parent, replyingRequest.getParentArticleId());
		} catch(Exception e) {
			JdbcUtil.rollback(conn);
			if(e instanceof ArticleNotFoundException){
				throw(ArticleNotFoundException)e;
			} else if (e instanceof CannotReplyArticleException){
				throw(CannotReplyArticleException)e;
			} else if (e instanceof LastChildAlreadyExistsException){
				throw(LastChildAlreadyExistsException)e;
			}
		}
		
		String searchMaxSeqNum = parent.getSequenceNumber();
		String searchMinSeqNum = getSearchMinSeqNum(parent);
		
		String lastChildSeq = articleDao.selectLastSequenceNumber(conn, searchMaxSeqNum, searchMinSeqNum);
		
		String sequenceNumber = getSequenceNumber(parent, lastChildSeq);
		
		article.setGroupId(parent.getGroupId());
		article.setSequenceNumber(sequenceNumber);
		article.setPostingDate(new Date());
		
		int articleId = articleDao.insert(conn, article);
		if(articleId == -1) {
			throw new RuntimeException("DB 삽입 안됨: " + articleId);
			}
		conn.commit();
		article.setId(articleId);
		return article;
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException("DB 작업 실패: " + e.getMessage(),e);
		}finally {
			if(conn != null) {
				try {
					conn.setAutoCommit(true);
				}catch(SQLException e) {
			}
		}
		JdbcUtil.close(conn);
	}
}
	
	private void checkParent(Article parent, int parentId) throws ArticleNotFoundException, CannotReplyArticleException{
		if(parent == null) {
			throw new ArticleNotFoundException(
					"부모글이 존재하지 않음: " + parentId);			
		}
		int parentLevel = parent.getLevel();
		if(parentLevel == 3) {
			throw new CannotReplyArticleException(
					"마지막 레벨 글에는 답글을 달 수 없습니다:" + parent.getId());
		}
	}
	
	private String getSearchMinSeqNum(Article parent) {
		String parentSeqNum = parent.getSequenceNumber();
		DecimalFormat decimalFormat =
				new DecimalFormat("0000000000000000");
		long parentSeqLongValue = Long.parseLong(parentSeqNum);
		long searchMinLongValue = 0;
		switch(parent.getLevel()) {
		case 0:
			searchMinLongValue = parentSeqLongValue / 1000000L * 1000000L;
			break;
		case 1:
			searchMinLongValue = parentSeqLongValue / 10000L * 10000L;
			break;
		case 2:
			searchMinLongValue = parentSeqLongValue / 100L * 100L;
			break;
		}
		return decimalFormat.format(searchMinLongValue);
	}
	
	private String getSequenceNumber(Article parent, String lastChildSeq)
			throws LastChildAlreadyExistsException{
		long parentSeqLong = Long.parseLong(parent.getSequenceNumber());
		int parentLevel = parent.getLevel();
		
		long decUnit = 0;
		if(parentLevel == 0) {
			decUnit = 10000L;
		} else if(parentLevel == 1) {
			decUnit = 100L;
		} else if(parentLevel == 2) {
			decUnit = 1L;
		}
		
		String sequenceNumber = null;
		
		DecimalFormat decimalFormat =
				new DecimalFormat("0000000000000000");
		if(lastChildSeq == null) {
			sequenceNumber = decimalFormat.format(parentSeqLong - decUnit);
		} else {
			String orderOfLastChildSeq = null;
			if(parentLevel == 0) {
				orderOfLastChildSeq = lastChildSeq.substring(10,12);
				sequenceNumber = lastChildSeq.substring(0,12) + "9999";
			} else if(parentLevel == 1) {
				orderOfLastChildSeq = lastChildSeq.substring(12,14);
				sequenceNumber = lastChildSeq.substring(0,14) + "99";
			} else if(parentLevel ==2) {
				orderOfLastChildSeq = lastChildSeq.substring(14,16);
				sequenceNumber = lastChildSeq;
			}
			if(orderOfLastChildSeq.equals("00")) {
				throw new LastChildAlreadyExistsException(
						"마지막 자식 글이 이미 존재합니다:" + lastChildSeq);
			}
			long seq = Long.parseLong(sequenceNumber) - decUnit;
			sequenceNumber = decimalFormat.format(seq);
		}
		return sequenceNumber;
	}
}
		
		
		
		
		
		
		
		
		
		
		
		
		

	
	
	
	
	