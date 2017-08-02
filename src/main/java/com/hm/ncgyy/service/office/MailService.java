package com.hm.ncgyy.service.office;

import java.util.List;

import com.hm.ncgyy.entity.office.MailEntity;
import com.hm.ncgyy.entity.office.MailFileEntity;

public interface MailService {

	MailEntity findOne(Long mailId);
	
	void save(MailEntity mail);
	
	void delete(MailEntity mail);
	
	List<MailEntity> listInbox(Long userId);
	
	List<MailEntity> listPoint(Long userId);
	
	List<MailEntity> listDraft(Long userId);
	
	List<MailEntity> listSend(Long userId);
	
	List<MailEntity> listDelete(Long userId);
	
	void saveFile(MailFileEntity mailFile);
	
	List<MailFileEntity> getFileList(Long mailId);
	
	void deleteFile(MailFileEntity file);
	
	List<MailEntity> search(String input);
	
}
