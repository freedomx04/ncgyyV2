package com.hm.ncgyy.service.office;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.office.MailEntity;
import com.hm.ncgyy.entity.office.MailEntity.DeleteStatus;
import com.hm.ncgyy.entity.office.MailEntity.MailStatus;
import com.hm.ncgyy.entity.office.MailEntity.PointStatus;
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
	public void delete(MailEntity mail) {
		mailRepository.delete(mail);
	}

	@Override
	public List<MailEntity> listInbox(Long userId) {
		return mailRepository.findByReceiverIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(userId,
				MailStatus.RECEIVE, DeleteStatus.NOT_DELETE);
	}

	@Override
	public List<MailEntity> listPoint(Long userId) {
		return mailRepository.findByReceiverIdAndMailStatusAndPointStatusAndDeleteStatusOrderByUpdateTimeDesc(userId,
				MailStatus.RECEIVE, PointStatus.POINT, DeleteStatus.NOT_DELETE);
	}

	@Override
	public List<MailEntity> listDraft(Long userId) {
		return mailRepository.findBySenderIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(userId, MailStatus.DRAFT,
				DeleteStatus.NOT_DELETE);
	}

	@Override
	public List<MailEntity> listSend(Long userId) {
		return mailRepository.findBySenderIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(userId, MailStatus.SEND,
				DeleteStatus.NOT_DELETE);
	}

	@Override
	public List<MailEntity> listDelete(Long userId) {
		List<MailEntity> retList = new LinkedList<>();

		List<MailEntity> draftDel = mailRepository.findBySenderIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(
				userId, MailStatus.DRAFT, DeleteStatus.DELETED);
		List<MailEntity> sendDel = mailRepository.findBySenderIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(
				userId, MailStatus.SEND, DeleteStatus.DELETED);
		List<MailEntity> receiveDel = mailRepository.findByReceiverIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(
				userId, MailStatus.RECEIVE, DeleteStatus.DELETED);

		retList.addAll(draftDel);
		retList.addAll(sendDel);
		retList.addAll(receiveDel);
		
		return retList;
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
	public void deleteFile(MailFileEntity file) {
		mailFileRepository.delete(file);
	}

}
