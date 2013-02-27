<?php if (!defined('THINK_PATH')) exit();?><div class="pageContent">
	<form method="post" action="__URL__/update/navTabId/__MODULE__" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxMenu)">
		<input type="hidden" name="user_id" value="<?php echo $_SESSION[C('USER_AUTH_KEY')] ?>">
		<input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" >
		<input type="hidden" name="ajax" value="1">
		<input type="hidden" name="pid" value="<?php echo ($vo["pid"]); ?>">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>模块名：</label>
				<input type="text" class="required alphanumeric"  name="name" value="<?php echo ($vo["name"]); ?>">
			</div>
			
			<div class="unit">
				<label>显示名：</label>
				<input type="text" class="required"  name="title" value="<?php echo ($vo["title"]); ?>">
			</div>
			
			<div class="unit">
				<label>分 组：</label>
				<select name="group_id">
					<option value="">未分组</option>
						<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$group): $mod = ($i % 2 );++$i;?><option value="<?php echo ($group["id"]); ?>" <?php if(($group["id"]) == $vo['group_id']): ?>selected<?php endif; ?>><?php echo ($group["title"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
			</div>
			<div class="unit">
				<label>排序：</label>
				<input class="required number" name="sort" type="text" value="<?php echo ($vo['sort']); ?>" size="4" />
			</div>
			<div class="unit">
				<label>状态：</label>
				<select name="status">
					<option <?php if(($vo["status"]) == "1"): ?>selected<?php endif; ?> value="1">启用</option>
					<option <?php if(($vo["status"]) == "0"): ?>selected<?php endif; ?> value="0">禁用</option>
				</select>
			</div>
			
			<div class="unit">
				<label>类型：</label>
				<SELECT name="level">
					<option value="1" <?php if(($level) == $vo['level']): ?>selected<?php endif; ?> >一级模块</option>
					<option value="2" <?php if(($level) == $vo['level']): ?>selected<?php endif; ?> >二级模块</option>
					<option value="3" <?php if(($level) == $vo['level']): ?>selected<?php endif; ?> >操作</option>
				</SELECT>
			</div>
			<div class="unit">
				<label>父节点：</label>
				<input type="hidden" name="pnode.id" value="<?php echo ($vo["pid"]); ?>"/>
				<input class="required" name="pnode.title" type="text" readonly/><a class="btnLook" target=“dialog”  href="__APP__/Node/node_list" lookupGroup="pnode">查找带回</a>
			</div>
			<div class="unit">
				<label>描 述：</label>
				<textarea name="remark"  rows="3" cols="57"><?php echo ($vo["remark"]); ?></textarea>
			</div>
		</div>

		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>

</div>