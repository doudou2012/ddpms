<?php
/**
 * 文件名 :SupplierAction.class.php
 * @文件描述 
 * 供应商管理
 * @作者  范占鳌   邮箱： fanzhanao@gmail.com
 * @程序包 ddpms
 * @创建时间 下午10:57:33
 * @ Copyright (c) 2007 – 2007 www.ddpms.com
 */
class SupplierAction extends CommonAction{

	/**
	 * @类 : MaterialsAction
	 * @描述: 获取供应商列表
	 * author: fanzhanao@gmail.com
	 * @param
	 * @return int/bool/object/array
	 */
	public function _before_index() {
		$model	=	M("Provider");
		$list	=	$model->where('flag=1')->getField('id','name','address','contact','tel','tax','postcode','web','email','add_time','up_time');
		$this->assign('vo',$list);
	}
	
	


}