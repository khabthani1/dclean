<?php
/* Smarty version 3.1.33, created on 2021-02-19 11:03:06
  from 'C:\xampp\htdocs\dclean\modules\postabproductslider\producttabslider.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_602f8cdaab1e50_25687562',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd1a00ce428836429d686c0be0e569e2b1cfd0018' => 
    array (
      0 => 'C:\\xampp\\htdocs\\dclean\\modules\\postabproductslider\\producttabslider.tpl',
      1 => 1611822690,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:catalog/_partials/miniatures/product.tpl' => 1,
  ),
),false)) {
function content_602f8cdaab1e50_25687562 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div class="product-tabs-container-slider product_block_container">
	<ul class="tabs_slider">
	<?php $_smarty_tpl->_assignInScope('count', 0);?>
	<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['productTabslider']->value, 'productTab', false, NULL, 'posTabProduct', array (
  'first' => true,
  'last' => true,
  'index' => true,
  'iteration' => true,
  'total' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['productTab']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['index']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['first'] = !$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['index'];
$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['iteration'] === $_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['total'];
?>
		<li class="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['productTab']->value['id'], ENT_QUOTES, 'UTF-8');?>
 <?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['first']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['first'] : null)) {?>first_item<?php } elseif ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['last'] : null)) {?>last_item<?php } else {
}?> item <?php if ($_smarty_tpl->tpl_vars['count']->value == 0) {?> active <?php }?>" rel="tab_<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['productTab']->value['id'], ENT_QUOTES, 'UTF-8');?>
"  >
			<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['productTab']->value['name'], ENT_QUOTES, 'UTF-8');?>


		</li>
		<?php $_smarty_tpl->_assignInScope('count', $_smarty_tpl->tpl_vars['count']->value+1);?>
	<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>	
	</ul>
	<?php $_smarty_tpl->_assignInScope('rows', $_smarty_tpl->tpl_vars['config']->value['POS_HOME_PRODUCTTAB_ROWS']);?>
	<div class="row pos_content"> 
	<?php $_smarty_tpl->_assignInScope('countss', 0);?>
	<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['productTabslider']->value, 'productTab', false, NULL, 'posTabProduct', array (
  'first' => true,
  'last' => true,
  'index' => true,
  'iteration' => true,
  'total' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['productTab']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['index']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['first'] = !$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['index'];
$_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['iteration'] === $_smarty_tpl->tpl_vars['__smarty_foreach_posTabProduct']->value['total'];
?>
		<div id="tab_<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['productTab']->value['id'], ENT_QUOTES, 'UTF-8');?>
" class="tab_content">
			<div class="productTabContent<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['countss']->value, ENT_QUOTES, 'UTF-8');?>
 productTab-item owl-carousel">											
				<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['productTab']->value['productInfo'], 'product', false, NULL, 'myLoop', array (
  'index' => true,
  'first' => true,
  'iteration' => true,
  'last' => true,
  'total' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['index']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['first'] = !$_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['index'];
$_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['iteration'] === $_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['total'];
?>
					<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['index'] : null)%$_smarty_tpl->tpl_vars['rows']->value == 0 || (isset($_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['first']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['first'] : null)) {?>
						<div class="item-product">
					<?php }?>
						 <?php $_smarty_tpl->_subTemplateRender("file:catalog/_partials/miniatures/product.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('product'=>$_smarty_tpl->tpl_vars['product']->value), 0, true);
?>
						
					<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['iteration'] : null)%$_smarty_tpl->tpl_vars['rows']->value == 0 || (isset($_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_myLoop']->value['last'] : null)) {?>
						</div>
					<?php }?>
				<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
			
			</div>			
		</div>			
		<?php $_smarty_tpl->_assignInScope('countss', $_smarty_tpl->tpl_vars['countss']->value+1);?>
	<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>	
	</div>
</div>
<?php }
}
