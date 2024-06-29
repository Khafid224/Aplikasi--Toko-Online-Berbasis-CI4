<?= $this->extend('layout') ?>
<?= $this->section('content') ?>

<h1>Selamat Datang di Toko Online</h1>
<h4>
  <?php
  echo session()->get('username');
  ?>
</h4>

<?= $this->endSection() ?>