package board2;

public class ReplyingRequest extends WritingRequest {
	
	private int parentArticleId;
	
	public int getParentArticleId() {
		return parentArticleId;
	}
	
	public void setParentArticleId(int parentArticleId) {
		this.parentArticleId = parentArticleId;
	}

}
