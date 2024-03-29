<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8">
<div class="pos-special-products " 
	data-items="{$slider_options.number_item}" 
	data-speed="{$slider_options.speed_slide}"
	data-autoplay="{$slider_options.auto_play}"
	data-time="{$slider_options.auto_time}"
	data-arrow="{$slider_options.show_arrow}"
	data-pagination="{$slider_options.show_pagination}"
	data-move="{$slider_options.move}"
	data-pausehover="{$slider_options.pausehover}"
	data-lg="{$slider_options.items_lg}" 
	data-md="{$slider_options.items_md}"
	data-sm="{$slider_options.items_sm}"
	data-xs="{$slider_options.items_xs}"
	data-xxs="{$slider_options.items_xxs}">
	<div class="pos_title">
		{if $title}
		<h2>
		{$title}
		</h2>
		{/if}
		{if $desc}
		<div class="desc_title">
			{$desc} 
		</div> 
		{/if}		
	</div>	
	{$rows= $slider_options.rows}
		<div class="row pos_content">
			<div class="special-item owl-carousel">
			{foreach from=$products item=product name=myLoop}
				{if $smarty.foreach.myLoop.index % $rows == 0 || $smarty.foreach.myLoop.first }
				<div class="item-product">
				{/if}	
				<!-- style products default -->
				 {if $postheme.grid_type == 0}
					{block name='product_miniature_item'}
					<article class="style_product_default product-miniature js-product-miniature item_in" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
						<div class="img_block">
							<div class="img-col-left">
								<ul class="thumb_cate slider-nav">
									{foreach from=$product.images item=image}
									  <div class="thumb-container">
										<div>
										<img
										  class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
										  src="{$image.bySize.home_default.url}"
										  alt="{$image.legend}"
										  title="{$image.legend}"
										  width="100%"
										  itemprop="image"
										>
										</div>
									  </div>
									{/foreach}
								</ul>
							</div>
							<div class="img-col-right">
							  {block name='product_thumbnail'}	
								<div class="slider-for">
								 {foreach from=$product.images item=image}
								 <div class="thumb-item">
								 <a href="{$product.url}" class="thumbnail product-thumbnail"> 
								   <img class="" style="width:100%;" src="{$image.bySize.large_default.url}" alt="{$image.legend}" title="{$image.legend}" itemprop="image">
								  </a>
								   </div>
								 {/foreach}
								</div>					
								{/block}
								
								<div class="quick-view">
									{block name='quick_view'}
									<a class="quick_view" href="#" data-link-action="quickview" title="{l s='Quick view' d='Shop.Theme.Actions'}">
									 <span>{l s='Quick view' d='Shop.Theme.Actions'}</span>
									</a>
									{/block}
								</div>
						
								{block name='product_flags'}
								<ul class="product-flag">
								{foreach from=$product.flags item=flag}
									<li class="{$flag.type}"><span>{$flag.label}</span></li>
								{/foreach}
								</ul>
								{/block}
							</div>
						</div>
						<div class="product_desc">
							<div class="inner_desc">
								{if isset($product.id_manufacturer)}
								 <div class="manufacturer"><a href="{url entity='manufacturer' id=$product.id_manufacturer }">{Manufacturer::getnamebyid($product.id_manufacturer)}</a></div>
								{/if}
								{block name='product_name'}
								  <h3 itemprop="name"><a href="{$product.url}" class="product_name {if $postheme.name_length ==0 }one_line{/if}" title="{$product.name}">{$product.name|truncate:50:'...'}</a></h3> 
								{/block}
								{block name='product_reviews'}
									<div class="hook-reviews">
									{hook h='displayProductListReviews' product=$product}
									</div>
								{/block} 
								{block name='product_price_and_shipping'}
								  {if $product.show_price}
									<div class="product-price-and-shipping">
									  {if $product.has_discount}
										{hook h='displayProductPriceBlock' product=$product type="old_price"}

										<span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
										<span class="regular-price">{$product.regular_price}</span>
									  {/if}

									  {hook h='displayProductPriceBlock' product=$product type="before_price"}

									  <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
									  <span itemprop="price" class="price {if $product.has_discount}price-sale{/if}">{$product.price}</span>
									  {hook h='displayProductPriceBlock' product=$product type='unit_price'}

									  {hook h='displayProductPriceBlock' product=$product type='weight'}
										{if $product.has_discount}
											{if $product.discount_type === 'percentage'}
											  <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
											{elseif $product.discount_type === 'amount'}
											  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
											{/if}
										  {/if}
									</div>
								  {/if}
								{/block} 
						
								<ul class="add-to-links">	
									<li class="cart">
										{include file='catalog/_partials/customize/button-cart.tpl' product=$product}
									</li>
									<li>
										{hook h='displayProductListFunctionalButtons' product=$product}
									</li>
									{assign var='displayProductListCompare' value={hook h='displayProductListCompare'} }
									{if $displayProductListCompare} 
									<li class="compare">	
										 <a href="#" class="poscompare-add compare-button js-poscompare-add"  data-id_product="{$product.id_product|intval}"   onclick="posCompare.addCompare($(this),{$product.id_product|intval}); return false;" title="{l s='Add to compare' d='Shop.Theme.Actions'}"><span>{l s='Add to compare' d='Shop.Theme.Actions'}</span></a>
									</li>
									 {/if}
									
								</ul>
							</div>	
							<div class="availability"> 
							{if $product.show_availability }
								{if $product.quantity > 0}
								<div class="availability-list in-stock">{l s='Availability' d='Shop.Theme.Actions'}: <span>{$product.quantity} {l s='In Stock' d='Shop.Theme.Actions'}</span></div>

								{else}

								<div class="availability-list out-of-stock">{l s='Availability' d='Shop.Theme.Actions'}: <span>{l s='Out of stock' d='Shop.Theme.Actions'}</span></div> 
								{/if}
							{/if}
							</div>
							{hook h='timecountdown' product=$product } 
								<span id="future_date_{$product.id_category_default}_{$product.id_product}"
								class="id_countdown"></span>
							<div class="clearfix"></div>
							{block name='product_description_short'}
								<div class="product-desc" itemprop="description">{$product.description_short nofilter}</div>
							{/block}
						
							<div class="variant-links">
							{block name='product_variants'}
							{if $product.main_variants}
							{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
							{/if}
							{/block} 
							</div>
						
						</div>
					</article>
				{/block}
				 <!-- end style products default --> 
				 
				 <!-- style products default type 1 -->
				{else if $postheme.grid_type == 1}
				{block name='product_miniature_item'}
					<article class="product-miniature js-product-miniature style_product1" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
						<div class="img_block">
							<div class="img-col-left">
								<ul class="thumb_cate slider-nav">
									{foreach from=$product.images item=image}
									  <div class="thumb-container">
										<div>
										<img
										  class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
										  src="{$image.bySize.home_default.url}"
										  alt="{$image.legend}"
										  title="{$image.legend}"
										  width="100%"
										  itemprop="image"
										>
										</div>
									  </div>
									{/foreach}
								</ul>
							</div>
							<div class="img-col-right">
							  {block name='product_thumbnail'}	
								<div class="slider-for">
								 {foreach from=$product.images item=image}
								 <div class="thumb-item">
								 <a href="{$product.url}" class="thumbnail product-thumbnail"> 
								   <img class="" style="width:100%;" src="{$image.bySize.large_default.url}" alt="{$image.legend}" title="{$image.legend}" itemprop="image">
								  </a>
								   </div>
								 {/foreach}
								</div>					
								{/block}
								<ul class="add-to-links">
									<li>
										{hook h='displayProductListFunctionalButtons' product=$product}
									</li>
									{assign var='displayProductListCompare' value={hook h='displayProductListCompare'} }
									{if $displayProductListCompare}
									<li class="compare">	
										 <a href="#" class="poscompare-add compare-button js-poscompare-add"  data-id_product="{$product.id_product|intval}"   onclick="posCompare.addCompare($(this),{$product.id_product|intval}); return false;" title="{l s='Add to compare' d='Shop.Theme.Actions'}"><span>{l s='Add to compare' d='Shop.Theme.Actions'}</span></a>
									</li>
									 {/if}
									<li class="quick-view">
										{block name='quick_view'}
										<a class="quick_view" href="#" data-link-action="quickview" title="{l s='Quick view' d='Shop.Theme.Actions'}">
										 <span>{l s='Quick view' d='Shop.Theme.Actions'}</span>
										</a>
										{/block}
									</li>
									
								</ul> 
							
								{block name='product_flags'}
								<ul class="product-flag">
								{foreach from=$product.flags item=flag}
									<li class="{$flag.type}"><span>{$flag.label}</span></li>
								{/foreach}
								</ul>
								{/block}
							</div>
						</div>
						<div class="product_desc">
							<div class="inner_desc">
								{if isset($product.id_manufacturer)}
								 <div class="manufacturer"><a href="{url entity='manufacturer' id=$product.id_manufacturer }">{Manufacturer::getnamebyid($product.id_manufacturer)}</a></div>
								{/if}
								{block name='product_name'}
								  <h3 itemprop="name"><a href="{$product.url}" class="product_name {if $postheme.name_length ==0 }one_line{/if}" title="{$product.name}">{$product.name|truncate:50:'...'}</a></h3> 
								{/block}
								{block name='product_reviews'}
									<div class="hook-reviews">
									{hook h='displayProductListReviews' product=$product}
									</div>
								{/block} 
								
								{block name='product_price_and_shipping'}
								  {if $product.show_price}
									<div class="product-price-and-shipping">
									  {if $product.has_discount}
										{hook h='displayProductPriceBlock' product=$product type="old_price"}

										<span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
										<span class="regular-price">{$product.regular_price}</span>
									  {/if}

									  {hook h='displayProductPriceBlock' product=$product type="before_price"}

									  <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
									  <span itemprop="price" class="price {if $product.has_discount}price-sale{/if}">{$product.price}</span>
									  {hook h='displayProductPriceBlock' product=$product type='unit_price'}

									  {hook h='displayProductPriceBlock' product=$product type='weight'}
										{if $product.has_discount}
											{if $product.discount_type === 'percentage'}
											  <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
											{elseif $product.discount_type === 'amount'}
											  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
											{/if}
										  {/if}
									</div>
								  {/if}
								{/block}
								{hook h='timecountdown' product=$product } 
								<span id="future_date_{$product.id_category_default}_{$product.id_product}"
									class="id_countdown"></span>
								<div class="clearfix"></div>
								<div class="cart">
									{include file='catalog/_partials/customize/button-cart.tpl' product=$product}
								</div>
							</div>
							<div class="availability"> 
							{if $product.show_availability }
								{if $product.quantity > 0}
								<div class="availability-list in-stock">{l s='Availability' d='Shop.Theme.Actions'}: <span>{$product.quantity} {l s='In Stock' d='Shop.Theme.Actions'}</span></div>

								{else}

								<div class="availability-list out-of-stock">{l s='Availability' d='Shop.Theme.Actions'}: <span>{l s='Out of stock' d='Shop.Theme.Actions'}</span></div> 
								{/if}
							{/if}
							</div>
							
							{block name='product_description_short'}
								<div class="product-desc" itemprop="description">{$product.description_short nofilter}</div>
							{/block}
						
								<div class="variant-links">
							{block name='product_variants'}
							{if $product.main_variants}
							{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
							{/if}
							{/block} 
							</div>
						
						</div>
					</article>
				{/block}
				 <!-- end style products default type 1 -->
				 
				  <!-- style products default type 2 -->
				{else if $postheme.grid_type == 2}
					{block name='product_miniature_item'}
					<article class="product-miniature js-product-miniature style_product2" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
						<div class="img_block">
							<div class="img-col-left">
								<ul class="thumb_cate slider-nav">
									{foreach from=$product.images item=image}
									  <div class="thumb-container">
										<div>
										<img
										  class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
										  src="{$image.bySize.home_default.url}"
										  alt="{$image.legend}"
										  title="{$image.legend}"
										  width="100%"
										  itemprop="image"
										>
										</div>
									  </div>
									{/foreach}
								</ul>
							</div>
							<div class="img-col-right">
							  {block name='product_thumbnail'}	
								<div class="slider-for">
								 {foreach from=$product.images item=image}
								 <div class="thumb-item">
								 <a href="{$product.url}" class="thumbnail product-thumbnail"> 
								   <img class="" style="width:100%;" src="{$image.bySize.large_default.url}" alt="{$image.legend}" title="{$image.legend}" itemprop="image">
								  </a>
								   </div>
								 {/foreach}
								</div>					
								{/block}
								<ul class="add-to-links">
									<li>
										{hook h='displayProductListFunctionalButtons' product=$product}
									</li>
									{assign var='displayProductListCompare' value={hook h='displayProductListCompare'} }
									{if $displayProductListCompare}
									<li class="compare">	
										 <a href="#" class="poscompare-add compare-button js-poscompare-add"  data-id_product="{$product.id_product|intval}"   onclick="posCompare.addCompare($(this),{$product.id_product|intval}); return false;" title="{l s='Add to compare' d='Shop.Theme.Actions'}"><span>{l s='Add to compare' d='Shop.Theme.Actions'}</span></a>
									</li>
									 {/if}
									<li class="quick-view">
										{block name='quick_view'}
										<a class="quick_view" href="#" data-link-action="quickview" title="{l s='Quick view' d='Shop.Theme.Actions'}">
										  <span>{l s='Quick view' d='Shop.Theme.Actions'}</span>
										</a>
										{/block}
									</li>
									<li class="cart"> 
										{include file='catalog/_partials/customize/button-cart.tpl' product=$product}
									</li>
								</ul> 
								{block name='product_flags'}
								<ul class="product-flag">
								{foreach from=$product.flags item=flag}
									<li class="{$flag.type}"><span>{$flag.label}</span></li>
								{/foreach}
								</ul>
								{/block}
							</div>
						</div>
						<div class="product_desc">
							{if isset($product.id_manufacturer)}
							 <div class="manufacturer"><a href="{url entity='manufacturer' id=$product.id_manufacturer }">{Manufacturer::getnamebyid($product.id_manufacturer)}</a></div>
							{/if}
							{block name='product_name'}
							  <h3 itemprop="name"><a href="{$product.url}" class="product_name {if $postheme.name_length ==0 }one_line{/if}" title="{$product.name}">{$product.name|truncate:50:'...'}</a></h3> 
							{/block}
							{block name='product_reviews'}
								<div class="hook-reviews">
								{hook h='displayProductListReviews' product=$product}
								</div>
							{/block} 
							
							{block name='product_price_and_shipping'}
							  {if $product.show_price}
								<div class="product-price-and-shipping">
								  {if $product.has_discount}
									{hook h='displayProductPriceBlock' product=$product type="old_price"}

									<span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
									<span class="regular-price">{$product.regular_price}</span>
								  {/if}

								  {hook h='displayProductPriceBlock' product=$product type="before_price"}

								  <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
								  <span itemprop="price" class="price {if $product.has_discount}price-sale{/if}">{$product.price}</span>
								  {hook h='displayProductPriceBlock' product=$product type='unit_price'}

								  {hook h='displayProductPriceBlock' product=$product type='weight'}
									{if $product.has_discount}
										{if $product.discount_type === 'percentage'}
										  <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
										{elseif $product.discount_type === 'amount'}
										  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
										{/if}
									  {/if}
								</div>
							  {/if}
							{/block}
							<div class="availability"> 
							{if $product.show_availability }
								{if $product.quantity > 0}
								<div class="availability-list in-stock">{l s='Availability' d='Shop.Theme.Actions'}: <span>{$product.quantity} {l s='In Stock' d='Shop.Theme.Actions'}</span></div>

								{else}

								<div class="availability-list out-of-stock">{l s='Availability' d='Shop.Theme.Actions'}: <span>{l s='Out of stock' d='Shop.Theme.Actions'}</span></div> 
								{/if}
							{/if}
							</div>
							{hook h='timecountdown' product=$product } 
							<span id="future_date_{$product.id_category_default}_{$product.id_product}"
								class="id_countdown"></span>
							<div class="clearfix"></div>
							{block name='product_description_short'}
								<div class="product-desc" itemprop="description">{$product.description_short nofilter}</div>
							{/block}
						
								<div class="variant-links">
							{block name='product_variants'}
							{if $product.main_variants}
							{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
							{/if}
							{/block} 
							</div>
						
						</div>
					</article>
				{/block}
				 <!-- end style products default type 2 -->
				 
				 <!-- style products default type 3 -->
				{else if $postheme.grid_type == 3}
					{block name='product_miniature_item'}
					<article class="product-miniature js-product-miniature style_product3" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
						<div class="img_block">
							<div class="img-col-left">
								<ul class="thumb_cate slider-nav">
									{foreach from=$product.images item=image}
									  <div class="thumb-container">
										<div>
										<img
										  class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
										  src="{$image.bySize.home_default.url}"
										  alt="{$image.legend}"
										  title="{$image.legend}"
										  width="100%"
										  itemprop="image"
										>
										</div>
									  </div>
									{/foreach}
								</ul>
							</div>
							<div class="img-col-right">
							  {block name='product_thumbnail'}	
								<div class="slider-for">
								 {foreach from=$product.images item=image}
								 <div class="thumb-item">
								 <a href="{$product.url}" class="thumbnail product-thumbnail"> 
								   <img class="" style="width:100%;" src="{$image.bySize.large_default.url}" alt="{$image.legend}" title="{$image.legend}" itemprop="image">
								  </a>
								   </div>
								 {/foreach}
								</div>					
								{/block}
								<ul class="add-to-links">
									<li>
										{hook h='displayProductListFunctionalButtons' product=$product}
									</li>
									{assign var='displayProductListCompare' value={hook h='displayProductListCompare'} }
									{if $displayProductListCompare}
									<li class="compare">	
										 <a href="#" class="poscompare-add compare-button js-poscompare-add"  data-id_product="{$product.id_product|intval}"   onclick="posCompare.addCompare($(this),{$product.id_product|intval}); return false;" title="{l s='Add to compare' d='Shop.Theme.Actions'}"><span>{l s='Add to compare' d='Shop.Theme.Actions'}</span></a>
									</li>
									 {/if}
									<li class="quick-view">
										{block name='quick_view'}
										<a class="quick_view" href="#" data-link-action="quickview" title="{l s='Quick view' d='Shop.Theme.Actions'}">
										 <span>{l s='Quick view' d='Shop.Theme.Actions'}</span>
										</a>
										{/block}
									</li>
									<li class="cart">
										{include file='catalog/_partials/customize/button-cart.tpl' product=$product}
									</li>
								</ul> 
								{block name='product_flags'}
								<ul class="product-flag">
								{foreach from=$product.flags item=flag}
									<li class="{$flag.type}"><span>{$flag.label}</span></li>
								{/foreach}
								</ul>
								{/block}
							</div>
						</div>
						<div class="product_desc">

							{if isset($product.id_manufacturer)}
							 <div class="manufacturer"><a href="{url entity='manufacturer' id=$product.id_manufacturer }">{Manufacturer::getnamebyid($product.id_manufacturer)}</a></div>
							{/if}
							{block name='product_name'}
							  <h3 itemprop="name"><a href="{$product.url}" class="product_name {if $postheme.name_length ==0 }one_line{/if}" title="{$product.name}">{$product.name|truncate:50:'...'}</a></h3> 
							{/block}
							{block name='product_reviews'}
								<div class="hook-reviews">
								{hook h='displayProductListReviews' product=$product}
								</div>
							{/block} 
							{block name='product_price_and_shipping'}
							  {if $product.show_price}
								<div class="product-price-and-shipping">
								  {if $product.has_discount}
									{hook h='displayProductPriceBlock' product=$product type="old_price"}

									<span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
									<span class="regular-price">{$product.regular_price}</span>
								  {/if}

								  {hook h='displayProductPriceBlock' product=$product type="before_price"}

								  <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
								  <span itemprop="price" class="price {if $product.has_discount}price-sale{/if}">{$product.price}</span>
								  {hook h='displayProductPriceBlock' product=$product type='unit_price'}

								  {hook h='displayProductPriceBlock' product=$product type='weight'}
									{if $product.has_discount}
										{if $product.discount_type === 'percentage'}
										  <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
										{elseif $product.discount_type === 'amount'}
										  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
										{/if}
									{/if}
								</div>
							  {/if}
							{/block}
							<div class="availability"> 
							{if $product.show_availability }
								{if $product.quantity > 0}
								<div class="availability-list in-stock">{l s='Availability' d='Shop.Theme.Actions'}: <span>{$product.quantity} {l s='In Stock' d='Shop.Theme.Actions'}</span></div>

								{else}

								<div class="availability-list out-of-stock">{l s='Availability' d='Shop.Theme.Actions'}: <span>{l s='Out of stock' d='Shop.Theme.Actions'}</span></div> 
								{/if}
							{/if}
							</div>
							{hook h='timecountdown' product=$product } 
							<span id="future_date_{$product.id_category_default}_{$product.id_product}"
								class="id_countdown"></span>
							<div class="clearfix"></div>
							{block name='product_description_short'}
								<div class="product-desc" itemprop="description">{$product.description_short nofilter}</div>
							{/block}
						
								<div class="variant-links">
							{block name='product_variants'}
							{if $product.main_variants}
							{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
							{/if}
							{/block} 
							</div>
						
						</div>
					</article>
					{/block}

				{/if}
				 <!-- end style products default type 3 -->  
				{if $smarty.foreach.myLoop.iteration % $rows == 0 || $smarty.foreach.myLoop.last  }
				</div>
				{/if}
			{/foreach} 
			</div>
		</div>
</div>
</div>



