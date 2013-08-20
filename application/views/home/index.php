<!DOCTYPE html>
<head>
	<title>ROTA DA ECONOMIA</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url('css/main.css');?>"/>
	<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url('css/960.css');?>"/>
	<script type="text/javascript" src="<?php echo base_url('js/main.js');?>"></script>
</head>
<body>
	<div id="site" class="container_26">

		<h1>
		<a class="grid_10" href="<?php echo base_url('?ref=logo');?>">
			<img src="<?php echo base_url('img/interface/rotadaeconomia-logo-1.jpg')?>">
		</a>
		</h1>

		<div class="clear"></div>

		<div id="site_in">

			<div class="col1 principal grid_4">

				<nav id="menu">
					
						<?php foreach($secoes AS $secao){ ?>
						
						<category class="root">
							<icon></icon>
							<a href="<?php echo base_url("secao/{$secao->slug}"); ?>" class="category"><?php echo $secao->nome; ?></a>
						</category>
						
						<?php } ?>

						<!--<category class="root expanded">
							<icon></icon>
							<a href="#" class="category">cafés</a>

							<category>
								<a href="#" class="category">moído</a>
							</category>
							<category>
								<a href="#" class="category">grãos</a>
							</category>

						</category>-->

				</nav>
				<!-- end #menu -->

				<div class="ads">
					Publicidade
				</div>

			</div>
			<!-- .col1.principal -->

			<div class="col2 principal grid_22">

				<header>

					<form id="search" class="grid_9">
						<input type="text" class="value" value="Buscar:" name="value"/>
						<select name="secao">
							<option value="">Todo o site</option>
							<option value="produtos">Produtos</option>
							<option value="listas">Listas</option>
							<option value="supermercados">Supermercados</option>
						</select>
						<input type="button" class="ok" value=""/>
					</form>
					<!-- end #search -->

					<nav id="my_lists" class="grid_6">
						<a href="javascript:void(0);">NOVA LISTA</a>
						•
						<a href="javascript:void(0);">MINHAS LISTAS</a>
					</nav>

					<div id="account" class="grid_7">
						<div>
							<span class="city destaq">Goiânia</span> • <a href="javascript:void(0);">Mudar região</a>
						</div>
						<div>
							Olá <span class="name destaq">Felipe Andrada</span> • <a href="javascript:void(0);">Sou outra pessoa</a>
						</div>
					</div>
					<!-- end #account -->

					<div class="clear"></div>

				</header>

				<div id="current_cart">
					<a class="compare grid_5 push_1" href="javascript:void(0);">COMPARAR PREÇOS</a>

					<div class="total grid_7 push_3">
						<div class="value">
							<span class="real">100</span>,<span class="cents">00</span>
						</div>
						<span class="parcial">Total médio</span>
					</div>
					<!-- end .total -->

					<ul class="items grid_6 push_3">

						<?php for($x=0; $x<4; $x++):?>
						<li>

							<button class="del">x</button>
							<input class="qtd" type="number" name="qtd" value="1" min="1" maxlength="2" max="99"/>
							<a class="add" href="javascript:void(0);"></a>

							<a class="title" href="#">Mortadela fatiada Sadia</a>

						</li>
						<?php endFor;?>

					</ul>
					<!-- end .items -->

					<a class="expand grid_6 push_3" href="javascript:void(0);">&nbsp;</a>

					<div class="clear"></div>

				</div>
				<!-- end #current_cart -->

				<div id="lists">

					<div class="col1 grid_5 push_2">
						<h3>LISTAS PÚBLICAS</h3>
						<div>Aproveite listas prontas para</div>
						<select></select>
					</div>

					<ul class="items grid_2 push_2 suffix_2">

						<li>
							<a href="javascript:void(0);">Aniversário infantil</a>
						</li>

					</ul>
					<!-- end .items -->					

					<div class="photo grid_9 push_2">foto</div>

					<div class="clear"></div>

					<a class="expand grid_5 push_7" href="javascript:void(0);">expand</a>

					<div class="clear"></div>

				</div>
				<!-- end #lists -->





				<div id="result">

					<div class="breadcrumb grid_17">
						<a href="#">Orgânicos</a> / <a href="#">Cereais</a>
					</div>
					<!-- end .breadcrumb -->

					<div class="total"><span class="featured">22</span> produtos encontrados</div>

					<div>
						<table class="products" border="0" width="100%" cellspacing="0" cellpadding="4" id="grid">
							<thead>
								<tr>
									<td colspan="2">Produto</td>
									<td>Preço médio • R$</td>
									<td>Quantidade</td>
									<td>Adicionar</td>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td colspan="2">Produto</td>
									<td>Preço médio • R$</td>
									<td>Quantidade</td>
									<td>Adicionar</td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td class="pic">foto</td>
									<td class="title">titulo</td>
									<td>preço</td>
									<td>qtd</td>
									<td>carrinho</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="clear"></div>

					<!-- end #grid -->

					<div id="pager">
						<div class="grid_7 push_7">
							<div>Exibindo <span class="destaq">8</span> a <span class="destaq">18</span>, de <span class="destaq">22</span> produtos encontrados</div>
							<div>Página <span class="destaq">2</span> de <span class="destaq">3</span></div>
							<a href="#">≤ Página anterior</a> • <a href="#">Próxima página ≥</a>
						</div>

						<div class="clear"></clear>

					</div>

				</div>
				<!-- end .result -->





			</div>
			<!-- .col2.principal -->

		</div>
		<!-- end #site_in -->

		<div class="clear"></div>

	</div>
	<!-- end #site -->
</body>
</html>

<?php //echo $this->load->view('header');?>
<?php //echo $this->load->view('footer');?>