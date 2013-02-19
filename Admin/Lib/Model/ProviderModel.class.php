<?php
class ProviderModel extends CommonModel {
	// 自动验证设置
	protected $_validate	 =	 array(
		array('name','require','供应商名字不能为空！',Model::MUST_VALIDATE ),
		array('address','require','供应商地址不能为空',Model::EXISTS_VALIDATE ),
		array('contact','require','联系人不能为空',Model::MUST_VALIDATE),
		array('tel','require','电话不能为空')
		);
	// 自动填充设置
	protected $_auto	 =	 array(
		array('add_time','time',self::MODEL_INSERT,'function'),//创建时间
		array('up_time','time',self::MODEL_INSERT,'function'),//更新时间
		);
	
	public function getList(){
		
	}
}
?>