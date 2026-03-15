<?php
include_once("../../configuracion.php");
$tituloPagina = "Productos";
include_once("../Estructuras/headSeguro.php");
include_once("../Estructuras/banner.php");
include_once("../Estructuras/navSeguro.php");
?>

<!-- ________________________________________ INICIO CONTENIDO _________________________________ -->
<div class="container-fluid px-4 py-4">
    <?php

    $datos = data_submitted();
    $objProducto = new AbmProducto();
    $listaProd = $objProducto->buscar($datos);

    if(count($listaProd) > 0){ ?>

    <!-- Grid de productos -->
    <div class="row row-cols-2 row-cols-md-3 row-cols-xl-4 g-4" id="grid-productos">
        <?php for ($i = 0; $i < count($listaProd); $i++): ?>
        <div class="col producto-item" data-categoria="<?= htmlspecialchars($listaProd[$i]->getTipo()) ?>">
            <div class="card-producto">
                <div class="card-producto-img-wrap">
                    <img src="<?= $listaProd[$i]->getImagenProducto() ?>" alt="<?= htmlspecialchars($listaProd[$i]->getProNombre()) ?>">
                    <span class="badge-categoria"><?= htmlspecialchars($listaProd[$i]->getTipo()) ?></span>
                </div>
                <div class="card-producto-body">
                    <h6 class="card-producto-titulo"><?= htmlspecialchars($listaProd[$i]->getProNombre()) ?></h6>
                    <div class="card-producto-precio">$<?= number_format((float)$listaProd[$i]->getProDetalle(), 0, ',', '.') ?></div>
                    <div class="card-producto-stock <?= $listaProd[$i]->getProCantstock() > 0 ? 'en-stock' : 'sin-stock' ?>">
                        <?= $listaProd[$i]->getProCantstock() > 0 ? '&#10003; En stock' : '&#10007; Sin stock' ?>
                    </div>
                    <a href="agregarProductoAlCarrito.php?idproducto=<?= $listaProd[$i]->getIdProducto() ?>" class="btn-agregar">Agregar al carrito</a>
                </div>
            </div>
        </div>
        <?php endfor; ?>
    </div>

    <?php } else { ?>
        <div class="row justify-content-center mt-5">
            <div class="col-md-5">
                <p class="alert alert-warning text-center">No se encontraron productos.</p>
            </div>
        </div>
    <?php } ?>
</div>

<style>
.card-producto {
    background: #fff;
    border-radius: 14px;
    overflow: hidden;
    box-shadow: 0 4px 18px rgba(0,0,0,0.18);
    transition: transform .25s, box-shadow .25s;
    height: 100%;
    display: flex;
    flex-direction: column;
}
.card-producto:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 32px rgba(0,0,0,0.28);
}

.card-producto-img-wrap {
    position: relative;
    overflow: hidden;
    height: 280px;
}
.card-producto-img-wrap img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform .35s;
}
.card-producto:hover .card-producto-img-wrap img {
    transform: scale(1.06);
}

.badge-categoria {
    position: absolute;
    top: 10px;
    left: 10px;
    background: rgba(0,0,0,0.55);
    color: #fff;
    font-size: .72rem;
    font-weight: 700;
    padding: 3px 10px;
    border-radius: 20px;
    text-transform: uppercase;
    letter-spacing: .05em;
}

.card-producto-body {
    padding: 16px;
    display: flex;
    flex-direction: column;
    flex: 1;
}
.card-producto-titulo {
    font-size: .92rem;
    font-weight: 700;
    color: #222;
    margin-bottom: 10px;
    line-height: 1.35;
    flex: 1;
}
.card-producto-precio {
    font-size: 1.4rem;
    font-weight: 900;
    color: #1a7c3e;
    margin-bottom: 6px;
}
.card-producto-stock {
    font-size: .78rem;
    font-weight: 600;
    margin-bottom: 14px;
}
.en-stock  { color: #1a7c3e; }
.sin-stock { color: #c0392b; }

.btn-agregar {
    display: block;
    text-align: center;
    background: #1a7c3e;
    color: #fff;
    border-radius: 8px;
    padding: 9px;
    font-size: .88rem;
    font-weight: 700;
    text-decoration: none;
    transition: background .2s;
}
.btn-agregar:hover {
    background: #145f2f;
    color: #fff;
}
</style>

<!-- ________________________________________ FIN CONTENIDO ____________________________________ -->

<?php
include_once("../Estructuras/footer.php");
?>