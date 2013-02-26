<?php
/**
* 文件名 :PurchaseAction.php  
* @文件描述 : 采购相关
* @作者  范占鳌   邮箱： fanzhanao@gmail.com 
* @创建时间 2013-2-26  上午11:54:38
* @ Copyright (c) 2012 – 2017 
*/

class PurchaseAction extends CommonModel{
	
	
	
	public function index(){
		
	}
	
	/**
	 * @类 : PurchaseAction
	 * @描述: 添加采购单
	 * author: fanzhanao@gmail.com
	 * @param
	 * @return int/bool/object/array
	 */
	public function add(){
		
	}
	
	/**
	 * @类 : PurchaseAction
	 * @描述: 编辑采购单
	 * author: fanzhanao@gmail.com
	 * @param
	 * @return int/bool/object/array
	 */
	public function edit(){
		
	}
	
	/**
	 * @类 : PurchaseAction 
	 * @描述: 删除采购单
	 * author: fanzhanao@gmail.com
	 * @param 
	 * @return int/bool/object/array
	*/
	public function remove(){
		
	}
	/**
	 * @类 : PurchaseAction 
	 * @描述: 供应商列表 
	 * author: fanzhanao@gmail.com
	 * @param 
	 * @return int/bool/object/array
	*/
	public function vendor(){
		
	}
	
	/**
	 * @类 : PurchaseAction 
	 * @描述:添加供应商
	 * author: fanzhanao@gmail.com
	 * @param 
	 * @return int/bool/object/array
	*/
	public function add_vendor(){
		
	}
	/**
	 * @类 : PurchaseAction 
	 * @描述: 修改供应商 
	 * author: fanzhanao@gmail.com
	 * @param 
	 * @return int/bool/object/array
	*/
	public function edit_vendor(){
		
	}
	
	/**
	 * @类 : PurchaseAction 
	 * @描述: 删除供应商
	 * author: fanzhanao@gmail.com
	 * @param 
	 * @return int/bool/object/array
	*/
	public function remove_vendor(){
		
		
	}
	
	/**
	 * @类 : PurchaseAction 
	 * @描述:
	 * author: fanzhanao@gmail.com
	 * @param 
	 * @return int/bool/object/array
	*/
	public function menu(){
		$node = D("Node");
		$list = $node->getNodeListByPid();
		$accessList = $_SESSION ['_ACCESS_LIST'];
		
		foreach ( $list as $key => $module ) {
			if (isset ( $accessList [strtoupper ( APP_NAME )] [strtoupper ( $module ['name'] )] ) || $_SESSION ['administrator']) {
				//设置模块访问权限
				$module ['access'] = 1;
				$menu [$key] = $module;
			}
		}
		if (! empty ( $_GET ['tag'] )) {
			$this->assign ( 'menuTag', $_GET ['tag'] );
		}
		//dump($menu);
		$this->assign ( 'menu', $menu );
	}
}