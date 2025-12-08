-- CreateIndex
CREATE INDEX `Message_key_idx` ON `Message`(((CAST(`key`->>"$.id" as CHAR(255)) COLLATE utf8mb4_bin))) USING BTREE;
