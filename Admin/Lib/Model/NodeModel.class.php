<?php
// 节点模型
class NodeModel extends CommonModel {
	protected $_validate	=	array(
		array('name','checkNode','节点已经存在',0,'callback'),
		);
	
	/**
	 * 字段映射
	 */
	/*  protected $_map	=	array(
			'name'			=>	'name',		//节点名
	 		'title'			=>	'title',	//节点标题
	 		'pnode_id'		=>	'pid',		//节点父分类id
	 		'level'			=>	'level',	//节点等级
	 		'group_id' 		=>	'group_id',	//节点分组id
	 		'sort'			=>	'sort',		//节点排序
	 		'status'		=>	'status',	//节点状态
	 		'remark'		=>	'remark',	//节点描述
			) ; */

	public function checkNode() {
		$map['name']	 =	 $_POST['name'];
		$map['pid']	=	isset($_POST['pid'])?$_POST['pid']:0;
        $map['status'] = 1;
        if(!empty($_POST['id'])) {
			$map['id']	=	array('neq',$_POST['id']);
        }
		$result	=	$this->where($map)->field('id')->find();
        if($result) {
        	return false;
        }else{
			return true;
		}
	}
	
	public function getAll(){
		return $this->field('id,name,title,pid,level,group_id') ->order( 'id asc' )->select ();
	}
	
	/**
	 * 根据父id，获取子节点的分类
	 * @param unknown_type $pid
	 * @return boolean
	 */
	public function getNodeListByPid($pid = '',$level = 2){
		if ($pid){
// 			$pid = is_array($pid) ? implode(',',$pid) : $pid;
			$where['pid'] = intval($pid);
		}
		!$level and $level = 2;
		$where['level'] = array('eq',$level);
		return $this->where($where)->field ( 'id,name,title,pid,level,group_id' )->order ( 'sort asc' )->select ();
	}
}
?>