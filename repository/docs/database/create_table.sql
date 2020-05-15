CREATE TABLE `pola_eksemplar` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `pola_eksemplar` ADD PRIMARY KEY (`id`);
ALTER TABLE `pola_eksemplar` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
