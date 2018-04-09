package com.hm.ncgyy.controller.website;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.website.ProjectEntity;
import com.hm.ncgyy.entity.website.ProjectProgressEntity;
import com.hm.ncgyy.service.website.ProjectService;

@RestController
public class ProjectController {

	static Logger log = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	ProjectService projectService;

	@RequestMapping(value = "/api/website/project/create", method = RequestMethod.POST)
	public Result create(String name, String description) {
		try {
			Date now = new Date();
			ProjectEntity project = new ProjectEntity(name, description, now, now);
			projectService.save(project);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/project/update", method = RequestMethod.POST)
	public Result update(Long projectId, String name, String description) {
		try {
			ProjectEntity project = projectService.findOne(projectId);
			project.setName(name);
			project.setDescription(description);
			project.setUpdateTime(new Date());
			projectService.save(project);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/project/delete")
	public Result delete(Long projectId) {
		try {
			projectService.delete(projectId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/project/deleteBatch")
	public Result deleteBatch(@RequestParam("projectIdList[]") List<Long> projectIdList) {
		try {
			projectService.delete(projectIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/project/get")
	public Result get(Long projectId) {
		try {
			ProjectEntity project = projectService.findOne(projectId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", project);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/project/list")
	public Result list() {
		try {
			List<ProjectEntity> list = projectService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	/**
	 * progress
	 */
	@RequestMapping(value = "/api/website/project/progress/create", method = RequestMethod.POST)
	public Result progress_create(Long projectId, String name) {
		try {
			Date now = new Date();
			ProjectProgressEntity progress = new ProjectProgressEntity(projectId, name, now, now);
			projectService.saveProgress(progress);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/project/progress/update", method = RequestMethod.POST)
	public Result progress_update(Long progressId, String name) {
		try {
			ProjectProgressEntity progress = projectService.findOneProgress(progressId);
			progress.setName(name);
			progress.setUpdateTime(new Date());
			projectService.saveProgress(progress);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/project/progress/delete")
	public Result progress_delete(Long progressId) {
		try {
			projectService.deleteProgress(progressId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/project/progress/deleteBatch")
	public Result progress_deleteBatch(@RequestParam("progressIdList[]") List<Long> progressIdList) {
		try {
			projectService.deleteProgress(progressIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/project/progress/list")
	public Result progress_list(Long projectId) {
		try {
			List<ProjectProgressEntity> list = projectService.listProgress(projectId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}
