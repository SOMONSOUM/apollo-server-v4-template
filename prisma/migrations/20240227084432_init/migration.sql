-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(50) NOT NULL,
    `email` VARCHAR(191) NULL,
    `password` VARCHAR(191) NULL,
    `name` VARCHAR(191) NULL,
    `display_name` VARCHAR(191) NULL,
    `thumb_url` VARCHAR(191) NULL,
    `photo_url` VARCHAR(191) NULL,
    `birth_day` DATE NULL,
    `gender` ENUM('Male', 'Female') NULL,
    `phone` VARCHAR(191) NULL,
    `locale` VARCHAR(191) NULL,
    `verified_at` DATETIME(3) NULL,
    `last_signed_in` DATETIME(3) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `deleted_at` DATETIME(3) NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `settings` (
    `id` VARCHAR(50) NOT NULL,
    `social_id` VARCHAR(191) NULL,
    `auth_type` ENUM('Apple', 'Email', 'Facebook', 'Google') NULL,
    `refresh_token` VARCHAR(191) NULL,
    `verification_code` VARCHAR(191) NULL,
    `verification_code_sent_at` DATETIME(3) NULL,
    `user_id` VARCHAR(50) NOT NULL,

    UNIQUE INDEX `settings_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `images` (
    `id` VARCHAR(50) NOT NULL,
    `thumb_url` VARCHAR(191) NULL,
    `thumb_url_high` VARCHAR(191) NULL,
    `image_url` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `files` (
    `id` VARCHAR(50) NOT NULL,
    `url` VARCHAR(191) NULL,
    `name` VARCHAR(191) NULL,
    `size` BIGINT NULL,
    `type` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `settings` ADD CONSTRAINT `settings_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
