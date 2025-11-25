-- DropForeignKey
ALTER TABLE `Chat` DROP FOREIGN KEY `Chat_instanceId_fkey`;

-- DropIndex
DROP INDEX `Chat_instanceId_remoteJid_key` ON `Chat`;

-- AlterTable
ALTER TABLE `IsOnWhatsapp` ADD COLUMN `lid` VARCHAR(100) NULL;

-- AlterTable
ALTER TABLE `Message` DROP COLUMN `typebotSessionId`;

-- AlterTable
ALTER TABLE `Typebot` ADD COLUMN `splitMessages` BOOLEAN NULL DEFAULT false,
    ADD COLUMN `timePerChar` INTEGER NULL DEFAULT 50;

-- AlterTable
ALTER TABLE `TypebotSetting` ADD COLUMN `splitMessages` BOOLEAN NULL DEFAULT false,
    ADD COLUMN `timePerChar` INTEGER NULL DEFAULT 50;

-- CreateIndex
CREATE UNIQUE INDEX `Label_labelId_instanceId_key` ON `Label`(`labelId`, `instanceId`);

-- DropTable
DROP TABLE `Session`;

-- CreateTable
CREATE TABLE `Session` (
    `id` VARCHAR(191) NOT NULL,
    `sessionId` VARCHAR(191) NOT NULL,
    `creds` TEXT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UNIQUE INDEX `Session_sessionId_key`(`sessionId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Session` ADD CONSTRAINT `Session_sessionId_fkey` FOREIGN KEY (`sessionId`) REFERENCES `Instance`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Chat` ADD CONSTRAINT `Chat_instanceId_fkey` FOREIGN KEY (`instanceId`) REFERENCES `Instance`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
