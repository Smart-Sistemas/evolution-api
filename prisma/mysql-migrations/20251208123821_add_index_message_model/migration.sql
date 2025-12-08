-- CreateIndex
CREATE INDEX `Message_status_idx` ON `Message`(`status`);

CREATE INDEX `Message_remoteJid_idx` ON `Message`(((CAST(`key`->>"$.remoteJid" as CHAR(255)) COLLATE utf8mb4_bin))) USING BTREE;
