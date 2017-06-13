package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.repository.authority.DepartmentEntity;
import com.hm.ncgyy.repository.authority.DepartmentRepository;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Autowired
	DepartmentRepository departmentRepository;

	@Override
	public DepartmentEntity findOne(Long departmentId) {
		return departmentRepository.findOne(departmentId);
	}

	@Override
	public DepartmentEntity findByName(String name) {
		return departmentRepository.findByName(name);
	}

	@Override
	public void save(DepartmentEntity department) {
		departmentRepository.save(department);
	}

	@Override
	public void delete(Long departmentId) {
		departmentRepository.delete(departmentId);
	}

	@Override
	public List<DepartmentEntity> list() {
		return (List<DepartmentEntity>) departmentRepository.findAll();
	}

}
