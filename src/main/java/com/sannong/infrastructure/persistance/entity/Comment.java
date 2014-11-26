package com.sannong.infrastructure.persistance.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * create questionnaire status comment object
 * @author william zhang
 */
public class Comment implements Serializable{

	private static final long serialVersionUID = -700429124233623714L;
	
	public Comment(){
		
	}
	
	public Comment(String content){
		this.content = content;
	}
	
	private int commentId;
	private int questionnaireNo;
	private String content;
	private Timestamp createTime;
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getQuestionnaireNo() {
		return questionnaireNo;
	}
	public void setQuestionnaireNo(int questionnaireNo) {
		this.questionnaireNo = questionnaireNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}
