<?php
class CategoryModel extends CommonModel {
	protected $tableName = 'provider';
	// 自动验证设置
	protected $_validate	 =	 array(
		array('title','require','分类名必须！',1),
		array('class','number','原料分类不正确',2),
		array('price','require','价格不能为空'),
		);
	// 自动填充设置
	protected $_auto	 =	 array(
		array('add_time','time',self::MODEL_INSERT,'function'),//创建时间
		array('up_time','time',self::MODEL_INSERT,'function'),//更新时间
		);
}
?>