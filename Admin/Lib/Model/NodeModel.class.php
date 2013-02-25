<?php
// 节点模型
class NodeModel extends CommonModel {
	protected $_validate	=	array(
		array('name','checkNode','节点已经存在',0,'callback'),
		);

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
	
	/**
	 * 根据父id，获取子节点的分类
	 * @param unknown_type $pid
	 * @return boolean
	 */
	public function getNodeListByPid($pid = '',$level = 2){
		if ($pid){
			$pid = is_array($pid) ? implode(',',$pid) : $pid;
			$where['id'] = array('in',$pid);
		}
		!$level and $level = 2;
		$where['level'] = array('elt',$level);
		return $this->where($where)->select();
	}
}
?>