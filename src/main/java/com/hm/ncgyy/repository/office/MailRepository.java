package com.hm.ncgyy.repository.office;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.office.MailEntity;

public interface MailRepository extends PagingAndSortingRepository<MailEntity, Long> {
	
	List<MailEntity> findBySenderIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(Long senderId, Integer mailStatus, Integer deleteStatus);
	
}
