-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2024 pada 22.47
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` text NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `nama`, `harga`, `stok`, `gambar`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'Play Station 5 New', 4000000, 8, '1719345454_cb0a95c45d1e66c97411.jpg', 1, '2024-06-25 14:57:34', NULL, NULL),
(2, 'Laptop Gaming Boss', 15000000, 4, '1719345539_4dd1eb3d506a6022aa66.jpg', 1, '2024-06-25 14:58:59', NULL, NULL),
(3, 'Ipad Pro Maxxx', 10000000, 20, '1719345686_7fd0108cbbd1b5a2cf31.jpg', 1, '2024-06-25 15:01:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_barang` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `komentar` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2024-06-25-151652', 'App\\Database\\Migrations\\User', 'default', 'App', 1719329409, 1),
(2, '2024-06-25-152124', 'App\\Database\\Migrations\\Barang', 'default', 'App', 1719329409, 1),
(3, '2024-06-25-152437', 'App\\Database\\Migrations\\Transaksi', 'default', 'App', 1719329410, 1),
(4, '2024-06-25-152738', 'App\\Database\\Migrations\\Komentar', 'default', 'App', 1719329410, 1),
(5, '2024-06-25-153205', 'App\\Database\\Migrations\\TransaksiAlterFk', 'default', 'App', 1719329764, 2),
(6, '2024-06-25-153231', 'App\\Database\\Migrations\\KomentarAlterFk', 'default', 'App', 1719329766, 2),
(7, '2024-06-25-173948', 'App\\Database\\Migrations\\TransaksiAlterAlamat', 'default', 'App', 1719337229, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_barang` int(11) UNSIGNED NOT NULL,
  `id_pembeli` int(11) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `alamat` text,
  `ongkir` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `salt` text NOT NULL,
  `avatar` text,
  `role` int(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `salt`, `avatar`, `role`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'Muzaqi', '10cfd50b37a5adbada9ea174d91b83f5', '667af2c84bcb98.70241042', NULL, 0, 0, '2024-06-25 11:39:36', NULL, NULL),
(2, 'user01', '8f15fcf5a651a4d5e33516a15894350a', '667b02c1347dd0.11191790', NULL, 1, 0, '2024-06-25 12:47:45', NULL, NULL),
(3, 'monty00', ':_}|5;gE\\LHEPP>t2', '}{8NP*HOL,m', NULL, 1, 0, '2024-06-25 14:30:50', NULL, NULL),
(4, 'nathen.considine', 'I[*SyJ+C)k$lir!{', 'W5S#qIbDc6RYA*1', NULL, 1, 0, '2024-06-25 14:30:50', NULL, NULL),
(5, 'schneider.marianne', '^U4RGNT48Ff', 'z2Tec6m5%>', NULL, 1, 0, '2024-06-25 14:30:50', NULL, NULL),
(6, 'candelario.kutch', ':vA(XjwHe', 'Cyww6(Z', NULL, 1, 0, '2024-06-25 14:30:50', NULL, NULL),
(7, 'peter.hudson', '55*M8C$O\'fE\\U', 'I%wAD#kjZI_\"]^|\\9WA', NULL, 1, 0, '2024-06-25 14:30:50', NULL, NULL),
(8, 'lysanne07', 'jvmea;&5G\\:{', '0yd1i-e*]W[0S', NULL, 1, 0, '2024-06-25 14:30:50', NULL, NULL),
(9, 'virgil91', '$KHz/<)#g', 'rE|E:Zd$\"', NULL, 1, 0, '2024-06-25 14:30:50', NULL, NULL),
(10, 'larson.braden', '>-}anzO:J/\"\\KdQC[cX', 'k{d&-r.{R|@h;i]`', NULL, 1, 0, '2024-06-25 14:30:50', NULL, NULL),
(11, 'dickinson.junior', '>-\'U.pq', '8fcn1UHCu', NULL, 1, 0, '2024-06-25 14:30:50', NULL, NULL),
(12, 'talia.oconner', 'Zl6QC{$WhP<soux)1C', 'E$PqUBF}CFtu+\"', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(13, 'dickinson.april', 'O,n>xpT@30rDe_/H9', '\"Bt74hw2`m&J', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(14, 'holden.rosenbaum', 'Ix.=<^Q&^', '-B!mI4HasMKQ', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(15, 'amcclure', '`PMQxi!k.+KzVNRO', '1Kp}-53Lf6$KXt-H9s', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(16, 'polly69', 'OZS1C\"~\"EcAs\"', '*YFL3C#4b\"8x', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(17, 'magdalena24', 'l##l\'lO#', '1:;|:h7u.%Zg$nW$^L49', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(18, 'carole.leffler', 'LFzEH9.rd]GHX~_=f', 'AG-LaAjF<O^*\'@=!`V', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(19, 'zulauf.telly', '?X7DQ=9+m', '0[@|\\F+e{1B-]|&yDl', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(20, 'loy46', '55-CI>;Ajekt', '.\"#*x0ag', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(21, 'lehner.haven', '|u&6\'Llg$Dygx<ai', 'U26f\"Q&fqY,?', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(22, 'ava.tillman', 'v51=Ov9', '.CSxGE3?T8a18Ci', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(23, 'trantow.wilson', ',M~.39yV!~3QF[Gg)@', 'lItFvs|3g8J', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(24, 'stoltenberg.verna', 'D+?J`4', '0o>z\"?\'', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(25, 'daniel.sarina', '!Een$9', '!xTA|c):pR@', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(26, 'wmosciski', 'VxK{\';z~}7+', 'j/oYGGk45VhO7v3oI3', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(27, 'kylie96', 'xvfouk', '(&>uV&AJ;!m7k3yh\\u', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(28, 'cbins', 'LVC23u-', 'ZMdp{K', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(29, 'bartoletti.giuseppe', 'lUUfYN8m!b+rB-tTEF', 'fg?YIh4[8\\%t}pt5\\', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(30, 'kreiger.leslie', ']c!\\ydmmXv4k}\"7>[ePW', ']v?fiF7:]c\\=a.;my|]\\', NULL, 1, 0, '2024-06-25 14:30:51', NULL, NULL),
(31, 'tcollier', 'Ab#a(3y', '7HT0#V*R/2)7FBh:hM^J', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(32, 'carley75', 'w((.+KrZM/', 'Tw!=:C;bcV9.S2<p_', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(33, 'wstracke', 's-lg6x`', '&L#]a)%t,.hcq[*', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(34, 'olen.wisozk', 'Tk\"T8[?G', '(\'(h~uI?_3', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(35, 'uglover', '=dQa/TIu0V$Ld*d1', 'KhCcPYR8ZQY7kmqy],', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(36, 'corrine29', 'CA<9)s=)2|j=^', '68Q0U7O@-_?9hHK', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(37, 'monahan.litzy', '#m.+VD', 'j9jZz2', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(38, 'royce.howe', 'g~V\"M\'1nVtPG{)', '>5Q#+@~LA', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(39, 'ratke.sibyl', 'dO/AD00I&H4){bze\"{', '0cYh#d>yMB2TYa=0xcU', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(40, 'itillman', 'xFT:ss+)Jy*c.R]', 'Na@Cr[U|HF?YTK', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(41, 'madonna52', 'rh\'*5^a;:b]fXFRZ', '0yA?P`3,xa^Sa', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(42, 'rvon', 'd85>P:8g2jk:F~|E', 'dx/~1vEYdxfpcFX', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(43, 'pfeffer.marian', 'ABW-e_0OP1)AyI*sP', 'H9^g7Z\"#Y{r4N1CRT+', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(44, 'audrey.tremblay', ')ovb!A!', 'k}[|VUNG', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(45, 'newell09', '&*`%Pac__-nfY', 'M,JWN_D#', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(46, 'myrtle.roberts', '0/8\"R]JFs6*{Vezc1F', '0c1cT\"', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(47, 'shania09', ';~b/\'\'tu5_IL', '1^:471T/#|_Z0%k$Gd', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(48, 'romaguera.nellie', '{PuL7Nppdx', '^dgh&g2/qhGkc,Eq(0d', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(49, 'jaskolski.jacinto', 'o}BMM#27', ',?4{tJUp%s\\F21k', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(50, 'kulas.emmitt', 'S##7]RI[q[d', '>3SeA|7=a`zp{%MV', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(51, 'eunice.altenwerth', 'hv!}/*!', '1A>EwjAlGLKj\\Be', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(52, 'chanel.williamson', 'ugC)i-KPG\"84$', 'BUrg#m_wujz', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(53, 'dan70', '3-]G8mT|rYDF3)9%1fq', '&-beouU:O3mY', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(54, 'ebba63', '0W\'S9[L>^', '[{@\'o|QQ,i\\_?', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(55, 'isaias.osinski', 'Da\'z5fhwp,FZ7j0&vPb', '~\"C!GNy8(uM;6', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(56, 'kerluke.elisa', '7X[.jtN?ytTG5L6Z', 'G4-0viDg', NULL, 1, 0, '2024-06-25 14:30:52', NULL, NULL),
(57, 'kristy.jacobson', 'l[CG|=ThOf', '_VfjIq', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(58, 'lillian37', '#IWD1<-wpH;~tA}Y1Y!', 'G\'Fmt3,oD$[El3%1h+AJ', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(59, 'abartoletti', 'jMI[7FY}Wi', 'pD#i?kxtf5U#b:8', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(60, 'delilah11', '`~eq43oD.H(Y4K', '[V`}U}+g2~\"\'}~98D7lV', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(61, 'iwelch', 'Lj4}teO$v~,usC%', 'sxL7D0wh2\"h%', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(62, 'rolfson.dayana', '[V\"0uQTF-.az&,', 'TwF5{tkiLzzPJT', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(63, 'luz.schroeder', ';in5z/Y\"|Fb=$A+', 'm~t0mo6wCb', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(64, 'xankunding', '[JZZ:+_#j(', '+f}ZD]GA', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(65, 'selina76', 'CQvgU\'G^', '!Z[*kr~)AA', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(66, 'claudia.collier', '%\\N;NGatx.C|9', '#w+d0Hv_Un</r{', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(67, 'shanny48', 'xW\'/&L_x;;tQ/09W3', '!0N\\OoK(\\_`$tTY', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(68, 'jarrell.ziemann', '2hnlt*N,S_Gpg2%j,9N', '_?EiB4Im', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(69, 'sohara', 'Fc}7g2E:tl%Ous_%', 'mEy3?@B\"', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(70, 'meta41', '_4;yZ|2//A/r=', ';>qnS_#lmu&Cqjzz[wq', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(71, 'zjacobson', '4RPswq1U7#N?)', 'Z%g])?Y8x0n|', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(72, 'kuphal.alisa', '$gZT&lhE@x', '>xF=o@->ri1Df\'Q', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(73, 'tturcotte', 'Su`x\')CtqOTs-fP\'?h.', 'xypODMfU3y*', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(74, 'ernesto37', '4#|pW1[SJk:T!.#AN9XQ', 'Atx|\"-g7,8tF|c', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(75, 'catalina07', '`^AMUI', '`;{~Vlx}|M', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(76, 'mcglynn.idella', '86l)1r.aq6M@cu', '@FdSqKKEk6l', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(77, 'turcotte.darrell', '\\f/T)>m', '_;)c;%VM}cZYWUS,8#Bh', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(78, 'jenifer53', '\':aC4h-', '%Z,\\7(~A_3_4S^ri&p', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(79, 'qsteuber', '?<B|bO<FHP$6/nY_>E', 's5n\"ZPVH', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(80, 'bayer.joey', '=a?9H;wzg5$', 'Cdij#F$C]?Xl5', NULL, 1, 0, '2024-06-25 14:30:53', NULL, NULL),
(81, 'timmy43', 'z+<f#FKV.', 'tkhVEr3)U-x2}\"0lOn+', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(82, 'abernathy.emmie', '`}@fpmO&/!Fm:7eR', 'dK5$-=]+y', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(83, 'ariane.bins', '{QR}j2JFEea\\_eaV6*C', 'GJ&L$Bj&@QzDT>u', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(84, 'mitchel.considine', '/r2%hciq}\"@}', '&W7#XhGj\\6x]8K2\"t;A', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(85, 'alexander.legros', 'QHYmrpT.!RVvk=', '43z{-2_#LYL', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(86, 'erika.walter', '-4*dE8%9<UZyFb', '(S(<\'06aV],!OXI]}\\9', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(87, 'langworth.genevieve', 'HR1T\'/8ng', 'kr|QKih?', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(88, 'mcglynn.amani', 'KmQ%b38-LM*xW._|Zm', '&){tr\"]o%SDy', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(89, 'dhettinger', 'ROxzPR(YmL&c', '=\'@*I:cSL%o%x+>s}\'m', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(90, 'sauer.jairo', '0~&^Q7<n', 'Oak3gePbo', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(91, 'hilton.conn', 'yVq68,*](#H3R_l#', 'Rzr?e:Q4Mk<inJe', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(92, 'dorthy88', 'p&_g0c\'y*qe~f', 'Uhxg{ea2ABQ$F', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(93, 'xbergnaum', '[Lf7K$bgA', 'jrt)e[,<zyX:bHk\"rn]7', NULL, 1, 0, '2024-06-25 14:30:54', NULL, NULL),
(94, 'aprice', '<Fxe%QY_CF', '4BqW2z@HAbWHAm?cJAdH', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(95, 'fgottlieb', 'ELo))B,I{J(#[Wcj', 'jd.I9L', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(96, 'pacocha.megane', 'X[B6;b$*lIs', 'rT9+bQA9pEr#@Mn', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(97, 'qpowlowski', '#_jE{rXH4>.cw;9Dcr;', 'H*[[\"jvQE', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(98, 'tremblay.dudley', 'mj7w*]9BL`zXFklQ\'`', '\'/Y7QURNwIp', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(99, 'clement79', 'yJ617:w5IS/Y_)gi', '!OmqgMS{_\\J', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(100, 'kraig51', '-F19W?|Z@A+3#7r', 'os\'c/\"YT$:-kV', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(101, 'deckow.hillard', 'i=kMyM`?YM=e._iW=', '`jh{LCzGGECPm', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(102, 'armstrong.guido', 'wVs\"lg[{', 'gmy%R3smerZ8o8q', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(103, 'leopold.price', 'WDFCf\"[3k', '!_9IuN[+t55YXSj\'GBX#', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(104, 'melvina.zboncak', ',t@!L+bX=[:?bZ.i[\\>', '8)s|5G2.Z', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(105, 'oleta.fahey', 'v}wGeSpe}R%,NLAI%D\';', 'PT>Na?Z>XZ^K1?', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(106, 'wbauch', 'VN[}f`HUiUzFP`', '-A0nOG\',n$Pwz6x', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(107, 'maxie61', '4>%%98FdS-W-fp~', '7(K:nMp\\T&', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(108, 'shany53', '.tYz#A@W+p3,KF', '22[|Z*', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(109, 'sawayn.nelda', 'i&3Rgn?U/\'No,Ipk', 'hMOm1Op', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(110, 'dora95', '[L-6(E', 'O_Ys8(T', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(111, 'asmith', '/Oh&qj', '(Bf_6kq~{_ONvRdVI', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(112, 'brown.emerson', '(AiNQ),|ZOO!', 'NPl<9;wB', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(113, 'hlind', 'cL_*!#JOpspzW7N*', '\'5U?|I8}\"jPZMxWGX^', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(114, 'kleuschke', 'qn>i./iS8Kv:6nHiF&Dh', '.\"T+=j$.z!4;|;vSQ<v\'', NULL, 1, 0, '2024-06-25 14:30:55', NULL, NULL),
(115, 'wrutherford', '-|y?wywpZR.)\'w?8', '+3&0O!7\"#E,$G]J&2', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(116, 'libbie.frami', 'Y`TgLR>S!f=B}9', '),s4a_OO7@5Z0)PJx;', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(117, 'royce.treutel', ';.5HV{k[01c4L_)W', 'PPfGzuF', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(118, 'ted.rowe', '52gAl;', '0k7Tl\\~E$', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(119, 'adelbert77', '-KgKYf', 'a#Jp;%kUm({ziu*xz|F', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(120, 'broderick.dare', 'p68Saq-tC)oQ<jo', 'Q_#oAur.]>TwcY', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(121, 'hilton.dibbert', '\\CT}5W[\'a&\"ae*Q#H', 'wdOR/X;8', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(122, 'spinka.wilfredo', 'tKSxo]p!V7c>z>%R\"', '$sJscS)dSv![s', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(123, 'cgulgowski', 'W(O,{TK(', '3oMBNn5#', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(124, 'hilpert.dion', '\\:;ZJ)e+7Mw\'N[upX', 'ceNR2R]X\'\"d0)PD|Ki?', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(125, 'kaela04', '$BiHig)ihE;#4LXJy', 'i@[?Lz#g+ol1R1%?KZ', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(126, 'amalia.fay', '<\'gOkh', ')PJ1_V&.L*S:Jm6T%f1', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(127, 'bogan.michael', 'J&!OQ~~ji*~#%\'\'', 'c1k;flT,o8ygto', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(128, 'junius.wiza', 'VBJ<K]obhu.T-}Lzf@5', '!%o:&}8j#', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(129, 'clemmie09', '6ks\'ko', ',g+\"y|G+x\\@Fk', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(130, 'moen.annetta', '<@wEw4Ky', 'LHzQ~EF2uQ', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(131, 'schmidt.earnestine', 'Z9vw-]ucc{Mt(=v+_A', ',yf?IcI30Q3+N#,d)', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(132, 'jimmy.hamill', 'Vqh\'@k=', 'o[R`0-kHF`', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(133, 'sigmund.gottlieb', 'wb8jHCqONqnnN|B<t', 'M`F#v&J+)_3M', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(134, 'bella77', '(>grj~G#9|}?XI5U8', ':\\6y0]z', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(135, 'charlotte.feil', '<./boTo6%cJ|:(-vy', 'chmebk:N&g', NULL, 1, 0, '2024-06-25 14:30:56', NULL, NULL),
(136, 'patricia.oberbrunner', '\'$#sR)c_Y]%HbH', '\'YS/@iypJDzN', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(137, 'tillman.malvina', '2g7I254@v>>3', '%YV:+PjQe8F>J5e7A\"', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(138, 'greenholt.adan', 'H,Um9]B[`dj)T', '?o<p\'#&6OI))(]', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(139, 'maverick99', '4.>VUn_v}_P\"nUnQ7ZgQ', '\\+*u]Z}zM', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(140, 'marisol38', 'IDoL^C.', '#P=\'qwl_V<}D_+G', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(141, 'wmayer', '*5K0\'NB+j$k8rP', 'nMnBBD', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(142, 'hand.jeanette', 'fCQ85&5(c?', '_At2E86\"T!AAR', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(143, 'olegros', 'n]Bt;zdhQ/iKADVMLs', 'lCp]>O', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(144, 'fkirlin', 'C17&|2kQq[', 'z6-8O1Dn)&Y\"`P.6', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(145, 'lelia.vonrueden', '{eqR&d$vupNi2hOV', '}?`(/[ld)Q|$LWrIv>?', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(146, 'beer.eloise', 'xM_h+~d$Hum-', '?|o\"W00v4', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(147, 'stiedemann.may', 'r3\"+@w_C3z', '@R=BVn`f3{', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(148, 'brando24', 'y)s@H9', '+]~)*c%(M8\\!/p', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(149, 'lyla18', 'kxD*&~RLr`8&`md,#5y', '1wPrj=U(yP=Bb_(H`J', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(150, 'hessel.jensen', '36:JO`', 'j?z:oYa\'sA', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(151, 'alexandro19', '9jh5qAIg', 'Xux14HgFC\'a\\;*|fd!', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(152, 'reynolds.tiffany', 'T7Fz~+gqh]:yY', '3y)\"/GPV)JG', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(153, 'jcummings', 'T:*R${>c|?rH1yqu', '^6=@wI{eMf}2~q>+Q7', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(154, 'jess.lehner', 'PnxR53qgwtft(7gc', 'l%\"SFYr', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(155, 'diamond.carter', '?bYi*&=', '#U^:FLlX@c)Qns4!BNg', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(156, 'chodkiewicz', '\\_3\"#<wcR5qM', 'Pj-9k3-8YsO/0D8C@d', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(157, 'barrett17', 'L[dGz>tI9A){A?\'?', 'Q=x$Xe`N-Q;LM\\V', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(158, 'richie35', 'TCjG7N6ld-Oi#voeS[', '|C<}wBqo', NULL, 1, 0, '2024-06-25 14:30:57', NULL, NULL),
(159, 'gutkowski.vicenta', 'K>{_:5+', 'E.3\"ge', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(160, 'oconner.kiel', 'LNHLHfgGa)]yHg', 'maZ[=x2.hbudU;(M^}J', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(161, 'xzavier.bergstrom', 'y2\'w.)\"(~h4pLD', 'TiP0zc?*|p{c', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(162, 'mraz.joesph', ':F5XBoq3a', 'SaSbqAlj\'At', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(163, 'simonis.odell', '2$IRqB;\"V^ivESVgy([7', '*Q>IqQMHTE70O~', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(164, 'west.demetris', ']7j@#OfM@383Q?Y|t', 'lW;B%tP+R4U+3D', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(165, 'daisy.towne', '=_~/QXhRo0+mzT.1l', 'W?\"+e93j%.-6RX@{[Gc', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(166, 'maggio.felix', 'x<IVmGL7Y8OxrB', '${a~xim*W0|;{d9x', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(167, 'bergstrom.katharina', '5=*<JBfb`9u4Y', 'nP$ze:2p\\6', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(168, 'pbode', 'BqieH?-a', ',H\\Y0cc_#A', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(169, 'ratke.ally', '4\'1WAA\'@eQkR2p}R', 'cS6.jsL_r%2dP', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(170, 'turner.walter', '?{Qga_?n\\0Ac#v', '`Y,!?n\"_KQ5cW*>(', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(171, 'cecelia37', 'qL3l|P,@;J20$o', 'mrX]!>', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(172, 'wmccullough', '/;e+H8($6)_zrH1z<h~F', ']fsf[onn', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(173, 'reichert.esmeralda', '3$~K,\\:u=}Wb/*d|n;', '(c&`?Ei*jp5$1r<H]E', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(174, 'mary.witting', '?\'d\"e@Z`r/(g|', 'jO.~r~', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(175, 'magdalena54', '5t8U+W;E', '$,fe]kG#p#e(f', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(176, 'braxton.ryan', '%i\\9u\'', 'JdSGK<', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(177, 'minnie92', 'f^S8oWbn(g7E;', 'J\\OC:x]o|X;6@\"hT?W&2', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(178, 'swift.ed', '2qZXH9]vnj|$k', 'k6k<9^*', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(179, 'abeer', 'AHE(.v5_dxZ$>iVQ)@', 'uQEN!a//biH', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(180, 'hermann.kiel', '`w4A^e\\W>Qava=Qf56', 'v5L})tM)[>r(', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(181, 'gulgowski.lexi', 'l%=P\"gV68e@Y<3\\)rv(', 'k8E^V&QUTWW,Q', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(182, 'steve.metz', ')h(``Vp$7`PmQX\'', 'F:]PS=Ytaw', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(183, 'sawayn.grayce', '9Eq-:G?', '0e/r5l?\\', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(184, 'mohammad01', '^Q(upi2veJP|', '\'<{m+9nS8\"}Tfr)', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(185, 'hazel.collier', 'aeOnuW(>J]w[oHll+', '\\\"tP2RzvM?N-\'a4w~2M', NULL, 1, 0, '2024-06-25 14:30:58', NULL, NULL),
(186, 'winston.predovic', ';!QoxX@U4', '0++Yg>kTp?m1V\'YiLtU', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(187, 'runte.gino', 'U$5Q?KfnZ(zrD', '[s~19wF2EsV|Y}C', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(188, 'kautzer.madilyn', '|{0kcuV87', 'iV%..+', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(189, 'maymie36', ';aXG|,7oCN?N.F', 'f6er:t-Uf^)f1@]El', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(190, 'wilkinson.alden', 'K77[4bjCLErJ*R&<hP', 'M%\\2+!?u-0.#q7#', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(191, 'wisoky.sherwood', 'nc_thGaKL`*V(zE[!J3$', 'Ia31k@=TD$?/dVa{', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(192, 'glover.abigale', 'arx_a!3LqgrO3eUM^g7', 'hW\\+s3', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(193, 'bechtelar.darrell', 'F;f5P)6(m_^FHr[;', '+7g{p#k1W3.', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(194, 'isabell01', ',M)\'VX,', 'Mvwe>x8y~r', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(195, 'block.jaime', 'RiPUc!&Ha480?jW#B8i', 'q6l*J#', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(196, 'jaeden.wolf', '1=-FMV\']E`', '0^k\"zEBSY|ddp#y>pPz', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(197, 'wrolfson', 'Oc*97{t>N&izBUJm', '%>WLrDM}WZ', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(198, 'will.wilhelm', 'B6RoT0@TIx-KA^5-y', '{:\"}gZ\\[X|hLu^MVC0', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(199, 'gleason.christina', 'B0!%\\X:', '&@+<I\\\\R\\M?\"g', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(200, 'shanel78', '6||T!%~$\'VTS;ybC\'>6', '\'RL$]Bn.S', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(201, 'jacobs.garnett', '5g%V0]I^BubAq-=', 'uI*}C,bC)Rl', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(202, 'wgaylord', '>m}J5i3**#b8TwH<T', 'tFCexZQBE&km.i', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(203, 'iklocko', '9Do7iys-\\5lT', 'F{{OIZh``+2PqR', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(204, 'kuhlman.melvin', '?j7&p@~jEY\"W}', '4?fVBER_SKHH>G^io9', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(205, 'schneider.reinhold', 'Xztk-czB-xtY&5?C', 'w0O_b<i+{', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(206, 'nannie62', '428[*)', ']udiJC9lg[Y', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(207, 'douglas.ena', '#B]Gu`;W;=', '@2t/\\vRRR{-]', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(208, 'theathcote', '7*n$K\\VCQT-\\I.(tB', '*mpL\'[+]FTh3Y7.iAt&', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(209, 'darron.stehr', '{f#|_~zFD.P81*H', '_Yn3Yl&xJvf/|<Sh', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(210, 'effertz.jaren', '0]!2FA', 'i9Mdh+M>u', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(211, 'collins.adolphus', '>a:{|g~=!U\'[%Bk<', '(o3-u1V]xjawU3,OpP', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(212, 'rogahn.ashly', 'jxlSLu1I', 'R`,L\"HG(9_.6', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(213, 'yazmin.herman', 'X(`[ltBm', 'ao5Z8-xI0,%Y/Be]1?', NULL, 1, 0, '2024-06-25 14:30:59', NULL, NULL),
(214, 'hauck.demario', 'q;Y<Ul:<Kpje,eY\'YR', 'C%p*.MK@9HDPd,4', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(215, 'velma66', 'i*dzF]~<T$_-3:)', '\"b*LB2nD.<pz]Sk@', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(216, 'blanca56', 'yr}\"q%\\=Fu-.L', 'cHn<t={R@<]E', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(217, 'theller', 'o)vv0nh|jCcCB,7;\\_;7', 'JB+CpV{sXa9Q', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(218, 'turner.kim', 'e5zl]mWVu', 'S]ik$/Zn', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(219, 'iboyer', 'a0pMHbENzeg~3v~9%1', 'I;brnZxO', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(220, 'alfred.boyer', 'HO}w{DBi[V<)R!9Iq', 'K0.$;EK*\"1KBX1+', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(221, 'barton.marianne', 'h;(;k^ot6)', 'M3S%BBjH', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(222, 'bednar.jamir', 'cKt}\\GluyW`$dfl<!', 'JZB`#?-Iyi[4{8)Ecv@A', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(223, 'jazmyne90', '\\UcV70cei\\V10{6y`K', 'M9D)o\':e^])f>KJ2', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(224, 'kyle.bayer', '(\'uuUv:H/&<', 's]=UZ8(H!k\"`n', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(225, 'felipe97', 'ofbJ4xXMpSVE@T-@:\\z', '8T|4BEH=\"YP|', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(226, 'pcruickshank', '4w=N@TSkdFUQ', 'w9r[y&\'0A1s>+$L', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(227, 'oberbrunner.darrin', 'K#iwU6:|l(Ftms04^', '`*&8=h5mD', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(228, 'glennie.hills', 'LhfKdH7+5ZjmV}*~S`Z{', '<E9<:jb', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(229, 'qbernhard', 'jsjwJaqL45i\"Ld=zf', ':jCzgI&NHvpJ]!_', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(230, 'roma.lang', 'bqYy$d*U@XT2ksjh', '\"a8pyWR>#G?8', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(231, 'loren.bayer', ':JTJtxd\"8`r0\\D#`Z:?', '}/^_dx`', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(232, 'sheila83', '#CswYJ0_qyBx1MI]|@-', '%eZ@[ZG*J', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(233, 'beatty.linwood', 'CfvICgAQ\\%>P(%[DNQ', 'tz/gxB\\\\L{', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(234, 'durward.jones', 'R\"hjkNon', 'd`K}48WQ', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(235, 'kuhic.mafalda', 't5_E,74QQ_pwn', 'ON^s-=i^mD%J(moa[2h', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(236, 'odell.hauck', 'q:BI2CNFPp9', 'fyJ=%?\"^/Wo\"{i;J', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(237, 'wbrekke', 'r3q|[4)', 'jM{m^?wJ*}tYQyk1\'!', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(238, 'hugh.kessler', '.*Pf+HLv[_z~YC:3[Dg', 'X&z?%av:w$5MqkmS=n', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(239, 'izabella.connelly', '!q,!F:E`/12[j_`{`', 'hT4Dj].34p`<Y.mF_?Q\"', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(240, 'salvatore77', '@&^YdLUK2yj]lO!PJ`', 'z+UBzyEN', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(241, 'xavier.olson', '(+.o+/_W#pnO', 'a_.r)^}+?\"EG/,', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(242, 'oreilly.sofia', '[mTUE1#Lj+sA', 'GU@Jd]ICtv7*WE\\?wnA', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(243, 'prenner', ';>D\'4jL=@D$%^\\%gZ', 'w/Y7F^L', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(244, 'fpadberg', 'j4X;e=8C?3{\\tJvTk*wp', '>rX+.!/', NULL, 1, 0, '2024-06-25 14:31:00', NULL, NULL),
(245, 'frederick43', 'V13X2\'[#Txh', '^D.I=PN6j', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(246, 'ddaugherty', 'p5dc@6,YgFP\"', '\';V\\bz9#%E;', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(247, 'ward.okon', 'S82g(%(9oh<mimF%', '0R3$w8aOJ5aQn', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(248, 'ivandervort', 'm]A7j6gv4Y', '(p!Qb)t7_b', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(249, 'dhammes', '}\'qcQ5_(^MP7_Nnu', 'j)x/]E', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(250, 'nicolas.maximilian', '\'T!%^%;I<jQt`VK?/', '>|M8uld5rM;.HE5R&}jg', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(251, 'alisha79', 'uu\'Z}8', '51M*me', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(252, 'kiehn.oral', '*J\\:^fbQq\":;z', 'WYOFIVD)g8%grRLLA', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(253, 'amani71', 'EwBu:#`lNFA[Jwx%F[', 'Nu:&9aD+:0MD/fKW8', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(254, 'litzy.lesch', '2onKCz{aa?j3B1', 'my.1a\\3T,#iKk', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(255, 'bobbie07', 'cM~~@Af{', 'fS|Y@PTk7`', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(256, 'spencer84', 'x,@j$7[k3[I~d.Rg:59', 'tH$JJ#CqCZ##nM5s,0', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(257, 'wherzog', 'cD:^TQ!{%', '@?mSt/jh1y_9_5l', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(258, 'doyle.jolie', 'H=;Gc*QH@P', 'Daab#o@', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(259, 'hill.vilma', '$7RkSu\\V=aQY[', 'z{&[@zg-dStTSG@&BVT', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(260, 'alysson.wehner', 'mZh\"n<', '\"hK#\\|3p:4B}', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(261, 'rowland87', ',474Cn*J(8ZWkjDM0IE~', 'pfK0,`qEcKo', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(262, 'uschmidt', 'QPhT1<M\"Pl&', 'c_%UEeDVm0`', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(263, 'cummings.kennith', '!>Xu5ct\'#xw>:1an', 'xv+Eq<v', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(264, 'easter09', 'RxQ$#o!>,`k9', 'PGA|{j>I;<BjJ', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(265, 'berge.brycen', 'M#i?&}us', 'QsQc#Z\\P', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(266, 'stephon13', '*FlzUeR`^:b1YU,<{tCp', 'J`It>,Aw\\A>', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(267, 'niko12', '](#6vrhf@8', 'g#;#LC4Va|+)cx.\'&~T5', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(268, 'elinore88', 'D9`nzb-spMj^s]r^-%E', '\',b(+%5y4~', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(269, 'lorenz05', '?l_J6g(-VF?', '/$RRy/fZ,>:+8FDHM', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(270, 'garth68', 'iEY:]U31Cow+pLu>y', 's2Fte+<3;7q2#rTk$', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(271, 'balistreri.beau', 'n3=nMe', '.2*8[d[`>L^R}%kk\\', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(272, 'jamarcus.abbott', '/(y+I0W_^GCi', '/)%GCz&3\\<u', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(273, 'gutmann.eli', '2/)\\#`%&<b*OTB', '0u`4b=Iw*Oo:c', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(274, 'walsh.tom', 'Teg@RMh)eMW-L', ':|92-t^U[u5H`[', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(275, 'moore.louvenia', 'T4<ujxx(8XM-A21L', 'CY:&&2zhovRZ,P', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(276, 'ankunding.juliet', 'J2w$|VoAH*}~-2%0', 't&Hb}V(*y/U-`*`$H%', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(277, 'raoul89', 'JrMV1$@sFY;\"(nz', ':#L_nA^*x*&}9', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(278, 'sigrid18', 'fk0d4u.3]/W{X', 'zeg_(W&?&<G<rav', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(279, 'fnolan', '@~-rJ%rs:0w:', '?l2D\\?!GR#}oDm?|yP>', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(280, 'zboncak.josiane', 'd-4:#[oIJw40f&Yey;', 'r\\Gd{E%VKo9yn)5bJ', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(281, 'zwest', 'X{PnhmCVH>~6~Mc', '*jG.Z>\'vS', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(282, 'neal51', 'fj$4qd//[', ':4)SX6`', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(283, 'weber.tobin', 'aMPH}n%9D', '.wz;WYLWv', NULL, 1, 0, '2024-06-25 14:31:01', NULL, NULL),
(284, 'kautzer.olin', '#yWYq.v*^69<]{qdFe;6', ';J*53a$', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(285, 'alycia.hackett', '?uJeq\'>v_X', '(a8vwOOv', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(286, 'eaufderhar', '6dWOn,hm?Uwui&LhD%', 'iGj~snv;:Y,iN4G*q1e?', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(287, 'kobe.ratke', 'WCG*+cuF%a9_R7DFE-=', '$b;s-Z5zc$', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(288, 'vandervort.emory', 'uc~[4+e', '\\xoa$\'0_@y&Wl8^Dw5tr', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(289, 'ozboncak', 'Qlu`dLj', '~PGc[5+cM3D6{0_+IPGq', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(290, 'luisa.luettgen', 'Idv[-*%`NW%2W5', '\"2^^)m\"Agh\\2\"q', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(291, 'gennaro21', 'ey%i`Kr{N', 'DYs})8OsAc]', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(292, 'jonathon43', '4|IN~=E)>hoNd2\\', ':CKLr&mR', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(293, 'kennedi35', 'RTo]\\`KEd=^Axl&', '5gG=!-P%aq.fE,', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(294, 'zachery.goyette', '4JICi)ND0vKTdyI!R`64', 'J(5w}Z/#(b_t', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(295, 'wkoepp', 'LbeZ#_b=5k+uyZLRXYXH', '.%G!BG', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(296, 'nwalter', 'Kucv/HM7?uAS2}C', 'AcXFT?CMqP^cMU', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(297, 'arnold.wintheiser', '`xTWAYE', 'ccowzm9ZjA', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(298, 'alayna.oberbrunner', '%,NNhbeC*#jN?\"R]aweS', '6?+:ilgp%.7h\\', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(299, 'arielle50', 'Ia&9yqpnuN7?', 'yv$Hi]sO#F_(g6zj`4', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(300, 'cernser', '*,P?\\@=9QRzWEv5s', '/y?8|e5!R#Mo}I', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(301, 'valentine58', '65c.RC3Khn%a', 'ae$D0%', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(302, 'dstreich', '|\"QK3+uMds#A%q', 'qqtjc3@O%m]hY', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(303, 'tromp.margarete', 'W|6J5Yxz+Zh$H^', '`3,^a>m*.V~/h', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(304, 'chase.little', 'gU#Qag&d5', '?F+|kJ#&qgEn\"\\y', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(305, 'goodwin.roger', 'w9Rtt6:EECM=\'DaT', 'D4,if\'!p3', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(306, 'uherman', 'f,Gq,1}8kU~st;Z', 'y97lroBz<1g', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(307, 'erowe', '\"NK@TH', 'E?p5ajUa8lGH', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(308, 'kling.skylar', 'a]4wPRX|bp7s1n3>p', 'htvRJpg', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(309, 'bradtke.jackeline', 'u6dyye*Q~GNa9', 'ayf<j}6k^3>Lu', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(310, 'jeanie99', '+mZ_:0b', 'b&c|X0]Ok+wqlXA1', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(311, 'jed11', ':zUmw<7vON/_LqOv\'', 'uL7G0@qI', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(312, 'calista.monahan', 'Mo)`8fv3', 'vFa#`9S', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(313, 'kevon.maggio', 'RmOS+EI:5', ';oA+=^vBQ9TG^&2P;', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(314, 'ahowe', '=\"xLY$-5|1Xxb:}Dz', 'crQbZ_h', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(315, 'marian92', 'zF(!08bJRFoRa', 'lXzy~qy`}T<xPT,2@', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(316, 'amparo58', '1Q{42i8f$*.[:f', 'z\'9yI&I!}TD3)f', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(317, 'johnston.murray', '=mV&DmD8(F\\', 'f9?|3;iX>2r\\e[/', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(318, 'ottilie.hilpert', '?5%epF>3]wX-!bER6', 'V_%hNc/rjO;5', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(319, 'blanda.alysson', 'XrPvi5A4B\",2kN', 'S}s(5>~lg9dsf?%4', NULL, 1, 0, '2024-06-25 14:31:02', NULL, NULL),
(320, 'xstoltenberg', 'H<u<!W~9mfX0[!rZt', '[p`.lIi=OtTdkQ9:', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(321, 'pkuhic', 'A}S;\\\'\\EAce2', 'AHX9pvYh', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(322, 'tre.wolf', 'L:yIb0^-@WcSzHk', 'IU-Hx3~2#cys,.Q1-DM2', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(323, 'ohara.dameon', 'V%$5?^Bv<`gs', 'u2Quj1LdYMlW\"L;<U', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(324, 'kitty.wilderman', 'jV\'=P90wxB;\'bG:f', '.Je4nIA-h$', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(325, 'demetrius57', 't7v[M%]', '0eD7C~+p', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(326, 'demarcus.cronin', 'r_p18Cl-=^k?d', 'RobxicQyg~g', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(327, 'bogan.bella', '(z2v<e<<GK}U&', 'd7py4rX%y*', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(328, 'windler.rachelle', 'Q1*d\\C<v)xATrq#Uj;\\', ',Pw4z~;i\"b$<\"', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(329, 'skiles.raymond', '4W)\',m;p', '0LL7`L1@n4G', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(330, 'alexandra52', 'Sp8YV^3*<,q@o?zgGtc', '8j*I#-$dyz;m', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(331, 'ahamill', 'r%9;<0%', 'QC*UAmlw|J`r$', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(332, 'kuhlman.kolby', '(K@N:%EmiFVfbm!', 'P[>fZ|895E5e', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(333, 'kelly.krajcik', 'wly}nKMo}Axi(Xz@2', 'o\"m`->oV9Dq]', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(334, 'cummings.salvatore', ';+T7mnN<S_t', 'tpc~YqqpUVqsLiSF8D', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(335, 'jamel55', '9q{q>I\"', '}E*\\m@T:^>.Agk/O', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(336, 'estel.cassin', 'a4`6x{', '8\\C_-,!E\\._', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(337, 'yhagenes', '*-8>acApC$N|', '?\\.);ew{vApRC(0ci', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(338, 'nellie57', ',?_Dm.iu{~5o%U/T*FI\\', 'c.efr1[D2R', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(339, 'lauriane.medhurst', '6*7NVs', '^_{6<%N^+;Nj?C-s|', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(340, 'xbreitenberg', 'PIfOw2},n!)%', 'FI\'+&~vs=n0-#L8b8', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(341, 'gberge', '4j{d^}', 's;^fS?', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(342, 'kyra.schaefer', 'ZMB0xGt5U6V4h4?,*/', 'rUIQ^l4h', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(343, 'claudie14', '?(<{MG@,$WV4jq3x/-vA', 'eqQGI4b`=}%NvfU', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(344, 'wbechtelar', '/3q:_4n#vwHRJ', 'HHsv6L;P', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(345, 'catalina.larson', 'kBg+bo3a1', 'i(=D|nyc22|', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(346, 'konopelski.zula', 'jNWJ41jY8xJ9v-kK', '4z5)Iy%Sr', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(347, 'kautzer.kattie', 'Fx7n_Ozf[}k+%OD_l\"', ']DLS$X0V.bv#wz', NULL, 1, 0, '2024-06-25 14:31:03', NULL, NULL),
(348, 'jordi.morar', 'S-C];&FR2lgE5R', '5_T_TB.gk\'ZXD2T(OipB', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(349, 'gottlieb.melissa', 'Vl``8hV', '8236e-FGyo#', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(350, 'nyundt', '[7Ws\\.G|2', 'Ci5OL(]', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(351, 'gilbert.collins', 'P_HYte2Ef', 'RH4kIag:7e14w0AKMXy', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(352, 'horacio60', '93\\TriP3\'aRW(7?,%hF', '-IuRx(3.gdc.PeH3', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(353, 'emile65', 'M9FzEr^p(]O\'^@.', 'm^j`lE$*z]<Mt', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(354, 'roslyn86', 'm~MU5t:a.\\<', 'A/S;)qj+n*;V(&', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(355, 'lexus14', '}x=}H0', 'fwolh%LFgFL', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(356, 'jessika.runolfsson', 'vJfGM{;k`hnVKO', '2sq]1Pz0a8s`O?R', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(357, 'darrell82', 'nUW.z[GIjv!-7b=?O}G', '-Ne9j/9j{hU(l0M[U8&', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(358, 'turcotte.ophelia', '_@u3\\0du}pO,J,', ')V&(\'}WfSn&Jgp#5Va_', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(359, 'parker.rowan', '+sl.s<a~yb&ohs', 'D{cz.@e', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(360, 'bergnaum.martine', ',_&RT,,._~g?Y', 'hd?-Aa/7', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(361, 'kulas.jada', 'hbwH8Kasx2\\K4zGC*\\_\"', 'i)%VCVE/{g', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(362, 'jacobi.danielle', '5W\\(g#VH!m_\'%\'', '@Rd2l9fj1msVC', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(363, 'eichmann.leta', 'pbSv,>ms`u7V.7?MK', 'uu|{28D<#', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(364, 'rasheed.johnston', 'yC&+{})7%nD&e\"X_hAh', ':4IXY2M0B}\"@\\v', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(365, 'bogisich.ignacio', 'dLcO_W5~S*T)cu\'/#,', 'JIEi4ni}~;T7jZ_', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(366, 'kasey22', '|ErR(}N', '\"i{5#>a', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(367, 'ned.bahringer', 'AFWC=0$]<\'pEibo@\'g%', 'H`HhU^Re\"', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(368, 'damian92', 'Ro9w=p\\J0nz[IH6F1', '5*/)AuRTMxZ8K[H-C\\X', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(369, 'stamm.taya', 'ONx!s}Eo%j(?Gn', '7[=Q+~z]5:x^(*v$', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(370, 'ramona16', 'dj%[1pSHam9pv', '[mO{f*R50fKjII%z', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(371, 'ikoch', '34k+[%4.L9ROg', '}j)Bwf[/1zgpI#fQR', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(372, 'gussie03', '3H5Wn\"KRRH{^IQu9}PH2', 'c*JZ:E{x_`;', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(373, 'mckayla.raynor', '5;KAD}jB,h', '3_T<(7\'WQ{_RS_7[', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(374, 'nyah10', 'kE>asDC(', 'FT^YX8GgS', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(375, 'faustino89', 'LkmC^%\'L5flEEGM', 'NveO%MS`6sWt/]0', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(376, 'emcglynn', 'jUt25EPr;GrS?d0A', 'XSdCxVy1Ig!,', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(377, 'powlowski.garrick', '+66ye,9:(y\"mdYk_R', 'Hps?bkxZFaMWS@', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(378, 'verner30', '+kvmL!+qA', 'oRHDHQ]B:Lk9!j-p0kvy', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(379, 'stamm.gregoria', 'c;k}|/', '-T:|It#:\"Z4./):j', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(380, 'pdibbert', 'AMQgKLq)HHp\'21_H@', 'PiluD;MyUw8=xW', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(381, 'yost.brandyn', '\"0eBTr8aAA<I}Rq', 'S,+.3@.2n)>RKfb*@U', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(382, 'hparisian', '`(cJyxm8tG!}T;/', 'KpTBj/*d\"tET0i', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(383, 'susie.abshire', ';kD[b~XdC8j5\"', '[|D~j@tt]', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(384, 'koelpin.mazie', 'uw2o(*y', 'a9Mlmm0M-t7#B', NULL, 1, 0, '2024-06-25 14:31:04', NULL, NULL),
(385, 'wava.block', 'k\"#YJ;4SsJwF>', 'Vk^u](fl\'qB_a<\\>', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(386, 'gdooley', 'qM-ct~Y2;|^?q?Y9', 'W/aU\"i:^=>sp|^D?b', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(387, 'walter29', '`hAY\"t,Q4v^WC*,U9j&', '\"[\\`tBz', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(388, 'elouise.skiles', 'mvy?0VJhPg2q?8\'', '|B+^#!I)7)/9B|0#', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(389, 'rhowe', '-U8fEA=', 'l5=6j(s?@fme-q', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(390, 'emmerich.gene', 'O\"b3xnq=&5', ']\\_Mj)d', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(391, 'schmitt.frank', 'Lo;1+9R!pNs9&yhf0`(9', '>z>bPUO&', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(392, 'rory.schmeler', 'W$zKCV', 'y,R;X7Y/a', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(393, 'pdickens', 'Tg[_cZQ7}K[&_;(\\naxA', 't:@!U~G', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(394, 'oschimmel', '?f_Q904D}o^N*^F', 'k$ezG+yo\\Y\"aeM', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(395, 'ford29', '1\\umGjA*RZSMZ%', 'o\'=0-}F=dzY+<fYbf', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(396, 'terrill.casper', 'DBRu`RI-Cx)X', 'GbV=F=', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(397, 'uward', '`3s]w9\\C\';[dE+LAG~Sb', 'NGc$#u*^', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(398, 'kyla.bode', 'vn1!Oz}KST-d?', 'py/#?l;o;}TP<&a5r9', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(399, 'georgette14', '\'e\"\\hfUe~?,*$f0K', 'pNScF!\\128T', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(400, 'xgrimes', ']KK`_{Z', 's)Jo=MP9oeB', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(401, 'carmen.batz', 'd4=9][>}xl?*V[s$#jZ', '93]L}u', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(402, 'monroe.barton', '#FoeTY]Zb', '4@X=*A', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(403, 'hayley32', '@o>}J=60r', ':Ux/3gMr]cJL\";AYzWa', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(404, 'dovie56', 'RXQ$fy}oB+eEcJwuE', 'P^EI^Zh)=+Sd,hC.k<c2', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(405, 'batz.tatum', 'P$wuQYOl9LpS\\', '[j9GF0m,OKk66', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(406, 'blanca96', '9Uar{G|~B0H\"d,V', '-ba7x:YQj8', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(407, 'janae.davis', 'gZdf:,bv@{Q', 'K!A^3!IF', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(408, 'wskiles', '`,c2l()Q', '/n+u0[_?Kl01[o#\"EW', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(409, 'ukoepp', '~XotVuK!<5CBC', 'em%g/.[C?m9^Bn4>', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(410, 'grimes.zetta', 'w8]rt!zecToEB}AH', 'UZ{I72g', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(411, 'mckenzie.katelyn', 'oxIT&T@B|/:S', 'VA,?\"M', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(412, 'qnicolas', '\\(6vwGu', 'qo`)y-\"', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(413, 'ivy28', 'u,46A;Bm5\"Iy~d', 't`V?]1\'vg`Y$Jk1(>!&', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(414, 'erin98', '_lepar*y94uD(G2y)', '=:vEjIaLwA)y$', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(415, 'ypredovic', '*s(,gE', 'u}.&w@', NULL, 1, 0, '2024-06-25 14:31:05', NULL, NULL),
(416, 'jerde.orin', 'Y{jK${Z_', '}y9U^BNfu8<78BT7)z', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(417, 'mueller.corrine', '/i5kw}]\"JRb', ';n@.Xh_9jrb\'W,?/[sJV', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(418, 'wyman.cletus', 'Hr@6?g)h&p3', ']4>%C*;H%o6FbY0FWn', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(419, 'umetz', 'aCJjPx7koc<', '@p0/UD/J@uh,', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(420, 'brooks27', 'O3p#..5}f\"a', '5?P32>', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(421, 'jovanny.lynch', ':YKCv;E]9RK', '<Zl`\"-c(M@o`[XJ0~9I', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(422, 'ghuel', '9s,Kw&jh2/tpm<', '{VelU`&R&UhaQihn|', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(423, 'conroy.coby', '7DaZ,=', '6uJ2pwbK', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(424, 'rosalee.langosh', 'W1&.Y=w1#FZ}LWk1yo(>', '8VvmhV:0%]9d', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(425, 'zullrich', 'mB`TE\\;p5p55O#', 'L+EXU$o', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(426, 'pagac.vidal', '&9[X7i[{dHH>KCuQ', 'muBAp*c{(\"NW', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(427, 'maida15', 'o(/(lcKstf^he5mSjH@', 'hSJK54P.FS5y2d<', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(428, 'antonia35', '[4b=w;R\"*{2Y}', 'oC*9Hr)x>a`c1\"3{]`Tz', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(429, 'napoleon92', 'lp%\"0N-i]r%$`q~A2', 'R*?w+}ARgPmEYz&8;F%R', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(430, 'vmclaughlin', '\'b.%z3o2a<lm(N', 'IPOj3U\"}zO:X', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(431, 'waelchi.celestino', ',GZ`g}bc9[~4brb', 'FSvqd.jm^|tG}vVXEdO', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(432, 'matilde.nader', '/9ybm\\JRY5aYr', 'iX&M(C_JPg;B)~', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(433, 'howe.arne', '_YJ]~>)!(u\'d=', 'woL&JnF+D2', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(434, 'espencer', '<18*B{S', 'WHnd-q~WBm]8bk', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(435, 'enrico.wolff', 'Rp-7cWGx^Q', 'F9Bmpj_mv8#', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(436, 'okeefe.josie', '#vxIlEb4', 'hm?6tQLye)Cv', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(437, 'dvolkman', 'r/^pR8N:aT;eO8djOL', '^}K`_\\xPfQFF)U%;,\'::', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(438, 'urau', 'PJ$|dTdT@q&F&}\"_a%B', '\"_y,*vv', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(439, 'padberg.thomas', 'rI~:P`uuVpB&25tH5NW', 'K9Z!xk}}}Z!d<`e', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(440, 'brooklyn61', 'Cp$obhrHwfBgu{', 'zdkf%tTCo\"L|CrTz`{\\', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(441, 'ibartoletti', '1HEM)!^5;7>d?u/]', '8ID9^6X]\"_', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(442, 'torp.della', 'k[Y>ds=~bN\'f*?*ZM', 'u/939=hBmY\\Y^@9je', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(443, 'johnny.west', '$zHF95XjcO,\'IwEX', 'xzQC_IZ<K6^}{cjDi', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(444, 'lilla.schmidt', '\\SV#>(#;=\"', 'Oy\\q\"ajKYEY+PAu2(Y@~', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(445, 'ggraham', '{p3C[A\"f', '*C)7+$maPw:{o]l2w', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(446, 'jarrod.hackett', '5v?l(N;[Jq1.F', 'shWKVt:R%', NULL, 1, 0, '2024-06-25 14:31:06', NULL, NULL),
(447, 'johnston.tessie', 's!ZfmV|AU1~', '0CxzV+[`*`*45^', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(448, 'jgutmann', 'q/5+&V8', '8JAFSE@xQVl&2w', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(449, 'schowalter.merle', 'FMtkm8r)kAJB/-', 't4:xOR;N[b', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(450, 'elena32', 'Ix.=<BKMl.', '?O;v3j', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(451, 'ludie.franecki', '5k7ro=N/!?#u`\'/G', '|1bwwZ`3vXCf-z%X', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(452, 'jevon.schoen', 'w&Ri=gLpk$Q.0:$<RK', ')\\Pvg+Nb?YxV{O4', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(453, 'dschinner', 'Ejx`6fuZ(n7-', '\"\"CAZv<9G', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(454, 'delta.sipes', 'M\"kG-?SL:-U', '^n^Spiip%', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(455, 'lcasper', 'Qkz`S`!~', 'ifF(rVLM[liMBy', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(456, 'ike.botsford', '6q2E\'(KsR', 'fsl8~pdzS?Crc#', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(457, 'breitenberg.ida', '1,hX:Z\">FTD<xuL}cU`', 'W0Chj+AOcRDv', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(458, 'vking', '[+_8Gw8+/F[9D}', '@0V0kjedz', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(459, 'mauricio68', '{(}~0cee8KFpR', 'cgB&%-&Z-B', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(460, 'fritsch.adelia', 'mw_+oi90[zt.}I=\\?U(o', '4`7:e-/v<?iTrV\"g>!:', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(461, 'terrill73', 'MmAT^<', ':u*E2z6R7<B', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(462, 'marian03', '4(/hm]Z3#\'U2TjQ|L', 'FBGF>v_xKcuu[', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(463, 'damon27', '+9r[PiZ}8\'x|', 'ML7YUz}+o', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(464, 'cali.schoen', 'R9&gZ\"^4\'[|GpP;{<4tA', '*L.X!;\\$gv(kjGkLDV', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(465, 'carmen.shanahan', 'KYPJsrEN8hj`0WO-oH', 'r64ccnUsHS', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(466, 'derrick42', 'EJwGs`_pqUi37tO`xEX', '`R>1vC=W3lz2~`P0h5', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(467, 'kiara.hickle', '1=&y2H]f4', '-28XM/', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(468, 'alysson.barton', 'y^n)rf6c,=i', 'Nb\'uk0OO4yut8U;', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(469, 'zmckenzie', '%}u6;~KNe', 'jBA9Luw\'u\"O3G$G{', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(470, 'bbalistreri', 'IJMoIXZ(9u3cY_{1r', ',!qD:Ngh%Sw~&>!', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(471, 'tkunde', '\\hKJL\"lg\\je', '*K\'%hq', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(472, 'eric78', 'MjB]oT4>R%64Ua&g<gE2', '<3ALnR(]\"a0$Oe5wk', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(473, 'ericka29', '=^x?g_=Tmkt#F2$Mlpd{', '!Bct,B]FqyD4.v', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(474, 'jeremie54', 'lGNVB\\7vju(}=^gu', 'mqPG5=q', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(475, 'toconnell', '}Y^WjlN}Xy@X:=w5rPh5', 'f@H.Iw$~b6@Hj+a;S', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(476, 'granville.walsh', 'IF+i;~M', 'N_K.hn``H%]o=Y', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(477, 'maxwell50', 'ZY;)ydCB+>8t]2Bb[8', '3,+;2Xuwr', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(478, 'smarquardt', 'k\'Dgk$ZGtXhuPA{E[^', 'z=SZ+4rKZ6\"-`{Y', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(479, 'eldora96', 'L.72];<_', 'dA*8wE:A4lc]8`Td]uK', NULL, 1, 0, '2024-06-25 14:31:07', NULL, NULL),
(480, 'nya30', '4Nc>?RaJ]F.dB', 'G4_]r^x~#H|\'K>-V\'4.', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(481, 'grady.jaron', ',)dYXI\'f{]C@R', '[z33{5Dy', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(482, 'mollie67', '|A6owC2^f`M)Rg|', '?^\"t)lRc3XdRx<X@,', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(483, 'treichel', '=J~]r2`r=jL`@f!', 'TpkgDJLM2PMFo]$*w]', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(484, 'jerome.cormier', 'r*1GJ!yd', '\\|YXaD,i', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(485, 'rosemary01', 'zT_y9}@%h-^;B', ']@VR_`.CKAPuzIYbADex', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(486, 'alba.grady', ')FHpvDC=WU`OkeVC', 'y3ej2,mvt', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(487, 'jmosciski', 'f@LPG&~GFp0|Y@N@]A\'i', 'zFHe5cH>', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(488, 'jacobs.colton', 't)mB\'O/o~u0$*Zwo', 'YU5R]_;G6x0Ip.6;O', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `avatar`, `role`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(489, 'ferry.nicolas', '?fG2p_t', '``JqK}\"f^_', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(490, 'damaris.cummings', 'nJC*:[r', 'r[k$FSpd?z', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(491, 'uwiegand', ';ltNPE?', 'xC5nZS&', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(492, 'ckemmer', 'EuGVt;Tx', 'rf8)I-]!6n_LFg', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(493, 'stephania71', '.(9=+/7|', 'gro0Ptq>W)_U`\'', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(494, 'emilio.reichert', 'z]\\Z&!x$vZs6D|OL*rI0', 'Y216\'5', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(495, 'torrance04', 'C6`&`%P!la`_~@cVb_', '80!)@Q={;-6O&w!Iyi', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(496, 'claire72', ')}%/^s', 'vmjp2@M&rUHB0Ow', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(497, 'ugleichner', 'fb`~xZ(/Ob?\\47M,[<', 'q0^nJ),s8d)K?TADS', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(498, 'jermaine40', ';/<^iH2I`', 'B{mQWb63`', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(499, 'toby54', '75<!!hDI`5B(3', 'YS&hGf/[;bs!<peGSudB', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(500, 'audie.botsford', 'z=jHVri[n', 'BzyD-\'', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(501, 'anabel.bosco', 'qO3ZD?2^2&$&vMMMO', '*oK^7=wleSd+Y5r:Ewbh', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL),
(502, 'xreichert', '0QkE\\bBEg>Pf=HgT', 'n\'~LU}R0`+#+x.G', NULL, 1, 0, '2024-06-25 14:31:08', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `komentar_id_user_foreign` (`id_user`),
  ADD KEY `komentar_id_barang_foreign` (`id_barang`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id_pembeli_foreign` (`id_pembeli`),
  ADD KEY `transaksi_id_barang_foreign` (`id_barang`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `komentar_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_id_pembeli_foreign` FOREIGN KEY (`id_pembeli`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
