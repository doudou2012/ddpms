<?php
class IndexAction extends CommonAction {
	
	// 框架首页
	public function index() {
		$class = isset($_GET['class']) ? $_GET['class'] : '';
		if (isset ( $_SESSION [C ( 'USER_AUTH_KEY' )] )) {
			//显示菜单项
			$menu = array ();
			
			//读取数据库模块列表生成菜单项
			$node = M ( "Node" );
			$id = $node->getField ( "id" );
			$where ['level'] = 1;
			$where ['status'] = 1;
			$where ['pid'] = 0;
			$list = $node->where ( $where )->field ( 'id,name,group_id,title' )->order ( 'sort asc' )->select ();
			
			$accessList = $_SESSION ['_ACCESS_LIST'];
// 			var_dump($list);exit;
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
// 			$this->display('Public:menu');
		}
		C ( 'SHOW_RUN_TIME', false ); // 运行时间显示
		C ( 'SHOW_PAGE_TRACE', false );
		$this->display ();
	}

}
?>