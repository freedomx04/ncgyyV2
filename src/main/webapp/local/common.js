;(function() {
	
	/**
	 * 通用对象
	 */
	$k = {
		page: {},
		proto: {},
		util: {},
		user: {}
	}
	
	/**
	 * bootstrap table中的数据获取id
	 */
	$k.util.getIds = function(arr) {
		var ids = new Array();
		$.each(arr, function(k, v) {
			ids.push(v.id);
		});
		return ids.join(',');
	}
	
	$k.util.getIdList = function(arr) {
		var ids = new Array();
		$.each(arr, function(k, v) {
			ids.push(v.id);
		});
		return ids;
	}
	
	/**
	 * 初始化bootstrap table
	 */
	$k.util.bsTable = function($table, param) {
		var defaultParam = $.extend(jQuery.fn.bootstrapTable.defaults, {
			cache: false,					// 是否禁用ajax数据缓存, 默认为true
			//height: 500,					// 定义表格的高度
			//undefinedText: '-',			// 当数据为 undefined 时显示的字符, 默认为 '-'
			striped: true,					// 设置为 true 会有隔行变色效果, 默认为false
			
			// 分页设置
			pagination: true,				// 是否显示分页条, 默认为false
			//pageNumber: 1, 				// 初始化加载第一页， 默认为1
			pageSize: 25, 					// 每页的记录行数, 默认为10
			//pageList: [10, 25, 50, 100], 	// 可供选择的每页的行数, 默认为[10, 25, 50, 100, All]
			paginationPreText: '上一页',	
			paginationNextText: '下一页',
			paginationFirstText: '首页',
			paginationLastText: '尾页',
			
			// 搜索设置
			search: true, 					// 是否显示表格搜索, 默认为false
			searchOnEnterKey: true,			// 设置为 true时，按回车触发搜索方法，否则自动触发搜索方法, 默认为false
			//strictSearch: true,			// 设置为 true启用 全匹配搜索，否则为模糊搜索, 默认为false
			//searchText: '',				// 初始化搜索文字, 默认为''
			
			// 显示设置
			iconSize: 'outline',			// btn样式
			showColumns: true,				// 是否显示 内容列下拉框, 默认为false
			showRefresh: true,				// 是否显示 刷新按钮, 默认为false
			showToggle: false,				// 是否显示 切换试图（table/card）按钮, 默认为false
			
			// 点击
			clickToSelect: true,			// 设置true 将在点击行时，自动选择rediobox 和 checkbox, 默认为false
			//singleSelect: true			// 设置True 将禁止多选, 默认为false
			
		}, param); 
		
		var ret = $table.bootstrapTable(defaultParam);
		return ret;
	}
	
	/**
	 * 验证器
	 */
	$k.util.bsValidator = function($form, param) {
		var defaultParam = $.extend({
			message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            excluded: [':disabled']
		}, param);
		
		$form.bootstrapValidator(defaultParam);
	}
	
	/**
	 * 图片选择器
	 */
	$k.util.fileinput = function($input, param) {
		var defaultParam = $.extend({
			language: 'zh', 
            showUpload: false, 
            showRemove: false,
            allowedFileExtensions: [ 'jpg', 'png', 'gif' ],
            browseClass: "btn btn-primary",
            browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i>"
		}, param);
		
		$input.fileinput(defaultParam);
	}
	
	/**
	 * 文本编辑器
	 */
	$k.util.summernote = function($obj, param) {
		var defaultParam = $.extend({
			minHeight: 360,
			lang: 'zh-CN',
			focus: true,
			dialogsFade: true,
			placeholder: '正文内容'
		}, param);
		
		$obj.summernote(defaultParam);
	}
	
	/**
	 * 根据文件名获取文件icon
	 */
	$k.util.getIconClass = function(filename) {
		var suffix = filename.substring(filename.lastIndexOf('.') + 1).toLowerCase();
		var iconClass = 'fa fa-file fa-fw';
		
		switch (suffix) {
		case 'jpg':case 'png':case 'bmp':case 'tiff':case 'gif':
			iconClass = 'fa fa-file-image-o fa-fw';
			break
		case 'doc':case 'docx':
			iconClass = 'fa fa-file-word-o fa-fw';
			break;
		case 'pdf':
			iconClass = 'fa fa-file-pdf-o fa-fw';
			break;
		case 'xls':case 'xlsx':
			iconClass = 'fa fa-file-excel-o fa-fw';
			break;
		case 'txt':
			iconClass = 'fa fa-file-text-o fa-fw';
			break;
		case 'ppt':case 'pptx':
			iconClass = 'fa fa-file-powerpoint-o fa-fw';
			break;
		case 'zip':case 'rar':case 'z':
			iconClass = 'fa fa-file-zip-o fa-fw';
			break;
		case 'avi':case 'mov':case 'mp4':case 'rmvb':case 'rm':case 'wma':
			iconClass = 'fa fa-file-video-o fa-fw';
			break;
		default:
			break;
		}
		
		return iconClass;
	}
	
	/**
	 * 设置附件图标
	 */
	$k.util.attachmentIcon = function($obj) {
		$obj.find('li').each(function(k, elem) {
			var $elem = $(elem);
			var filename = $elem.data('filename');
			var iconClass = $k.util.getIconClass(filename);
			$elem.find('i.icon-attachment').addClass(iconClass);
		});
	}
	
	/**
	 * 月份选择器
	 */
	$k.util.initDatePicker = function($obj) {
		$obj.datepicker({
			format: 'yyyy-mm',
			minViewMode: 1,
			keyboardNavigation: !1,
			forceParse: !1,
			autoclose: !0,
			todayHighlight: !0
		});
		var now = new Date();
		var month = now.getMonth();
		$obj.parent().find("input").val(now.getFullYear() + "-" + (month < 10 ? "0" + month : month));
	}
	
	/**
	 * 下拉选框插件
	 */
	$k.util.chosen = function() {
		//下拉选框
		var config = {
			".chosen-select": {},
			".chosen-select-deselect": {allow_single_deselect:!0},
			".chosen-select-no-single": {disable_search_threshold:10},
			".chosen-select-no-results": {no_results_text:"Oops, nothing found!"},
			".chosen-select-width": {width:"95%"}
		};
		for(var selector in config)
			$(selector).chosen(config[selector]);
	}
	
	/**
	 * 从url中获取参数
	 */
	$k.util.getRequestParam = function(paras) {
		var url = location.href;
		var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
		var paraObj = {};
		for ( var i = 0; j = paraString[i]; i++) {
			paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j
					.indexOf("=") + 1, j.length);
		}
		var returnValue = paraObj[paras.toLowerCase()];
		if (typeof (returnValue) == "undefined") {
			return "";
		} else {
			return returnValue;
		}
	}
	
	/**
	 * 从url中获取avatar
	 */
	$k.util.getAvatar = function($obj) {
		var url = $obj.attr('src');
		var avatar = url.substring(url.lastIndexOf('/') + 1);
		return avatar;
	}
	
	/**
	 * 其他方法
	 */
	Date.prototype.Format = function (fmt) { 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
})();

function formatDate2(val) {
	if (val) {
		return new Date(val).Format("yyyy-MM-dd hh:mm");
	}
	return undefined;
}
