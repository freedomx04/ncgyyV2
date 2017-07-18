package com.hm.ncgyy.repository.office;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.office.MailFileEntity;

public interface MailFileRepository extends CrudRepository<MailFileEntity, Long> {
	
	List<MailFileEntity> findByMailId(Long mailId);

}
