package com.hm.ncgyy.service.office;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.office.MailEntity;
import com.hm.ncgyy.entity.office.MailEntity.DeleteStatus;
import com.hm.ncgyy.entity.office.MailEntity.MailStatus;
import com.hm.ncgyy.entity.office.MailFileEntity;
import com.hm.ncgyy.repository.office.MailFileRepository;
import com.hm.ncgyy.repository.office.MailRepository;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	MailRepository mailRepository;
	
	@Autowired
	MailFileRepository mailFileRepository;

	@Override
	public MailEntity findOne(Long mailId) {
		return mailRepository.findOne(mailId);
	}

	@Override
	public void save(MailEntity mail) {
		mailRepository.save(mail);
	}

	@Override
	public void saveFile(MailFileEntity mailFile) {
		mailFileRepository.save(mailFile);
	}
	
	@Override
	public List<MailFileEntity> getFileList(Long mailId) {
		return mailFileRepository.findByMailId(mailId);
	}

	@Override
	public List<MailEntity> listInbox(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MailEntity> listPoint(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MailEntity> listDraft(Long userId) {
		return mailRepository.findBySenderIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(userId, MailStatus.DRAFT, DeleteStatus.NOT_DELETE);
	}

	@Override
	public List<MailEntity> listSend(Long userId) {
		return mailRepository.findBySenderIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(userId, MailStatus.SEND, DeleteStatus.NOT_DELETE);
	}

	@Override
	public List<MailEntity> listDelete(Long userId) {
		return null;
	}

}
