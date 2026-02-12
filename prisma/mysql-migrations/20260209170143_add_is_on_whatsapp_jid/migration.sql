-- CreateTable
CREATE TABLE `IsOnWhatsappJid` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `jid` VARCHAR(191) NOT NULL,
    `isOnWhatsappId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `IsOnWhatsappJid_jid_key`(`jid`),
    INDEX `IsOnWhatsappJid_jid_idx`(`jid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `IsOnWhatsappJid` ADD CONSTRAINT `IsOnWhatsappJid_isOnWhatsappId_fkey` FOREIGN KEY (`isOnWhatsappId`) REFERENCES `IsOnWhatsapp`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
