package com.hm.ncgyy.repository.office;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.office.MailEntity;

public interface MailRepository extends PagingAndSortingRepository<MailEntity, Long> {

	List<MailEntity> findByReceiverIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(Long receiverId,
			Integer mailStatus, Integer deleteStatus);

	List<MailEntity> findByReceiverIdAndMailStatusAndPointStatusAndDeleteStatusOrderByUpdateTimeDesc(Long receiverId,
			Integer mailStatus, Integer pointStatus, Integer deleteStatus);

	List<MailEntity> findBySenderIdAndMailStatusAndDeleteStatusOrderByUpdateTimeDesc(Long senderId, Integer mailStatus,
			Integer deleteStatus);
	
	//搜索
	List<MailEntity> findByReceiverIdAndMailStatusAndDeleteStatusAndTitleContainingOrderByUpdateTimeDesc(Long receiverId,
			Integer mailStatus, Integer deleteStatus, String title);
	
	List<MailEntity> findByReceiverIdAndMailStatusAndPointStatusAndDeleteStatusAndTitleContainingOrderByUpdateTimeDesc(Long receiverId,
			Integer mailStatus, Integer pointStatus, Integer deleteStatus, String title);
	
	List<MailEntity> findBySenderIdAndMailStatusAndDeleteStatusAndTitleContainingOrderByUpdateTimeDesc(Long senderId, Integer mailStatus,
			Integer deleteStatus, String title);
	
}
