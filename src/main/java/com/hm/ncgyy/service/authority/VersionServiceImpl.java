package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.VersionEntity;
import com.hm.ncgyy.repository.authority.VersionRepository;

@Service
public class VersionServiceImpl implements VersionService {
	
	@Autowired
	VersionRepository versionRepository;

	@Override
	public VersionEntity findOne(Long versionId) {
		return versionRepository.findOne(versionId);
	}
	
	@Override
	public VersionEntity findByCode(String code) {
		return versionRepository.findByCode(code);
	}

	@Override
	public void save(VersionEntity version) {
		versionRepository.save(version);
	}

	@Override
	public void delete(Long versionId) {
		versionRepository.delete(versionId);
	}

	@Override
	public void delete(List<Long> versionIdList) {
		Iterable<VersionEntity> it = versionRepository.findByIdIn(versionIdList);
		versionRepository.delete(it);
	}
	
	@Override
	public List<VersionEntity> list() {
		return versionRepository.findByOrderByCodeDesc();
	}

	@Override
	public String getLateset() {
		String code = "1.0";
		List<VersionEntity> list = list();
		if (list.size() > 0) {
			code = list.get(0).getCode();
		}
		return code;
	}

}
