<?php
/* 配置路由功能 */
return array(
		'URL_ROUTER_ON'   => true, //开启路由
		
		'URL_ROUTE_RULES'=>array(
				'/\#(\w+)$' => '/?class=1111',
				'/\/Admin\/(index\.php)?\#(\w+)$' => '/Admin/?class=1111'
		)
		);