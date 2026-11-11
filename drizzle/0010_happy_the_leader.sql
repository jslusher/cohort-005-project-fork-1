ALTER TABLE `coupons` RENAME TO `seats`;--> statement-breakpoint
PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_seats` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`team_id` integer NOT NULL,
	`course_id` integer NOT NULL,
	`code` text NOT NULL,
	`purchase_id` integer NOT NULL,
	`redeemed_by_user_id` integer,
	`redeemed_at` text,
	`created_at` text NOT NULL,
	FOREIGN KEY (`team_id`) REFERENCES `teams`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`purchase_id`) REFERENCES `purchases`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`redeemed_by_user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
INSERT INTO `__new_seats`("id", "team_id", "course_id", "code", "purchase_id", "redeemed_by_user_id", "redeemed_at", "created_at") SELECT "id", "team_id", "course_id", "code", "purchase_id", "redeemed_by_user_id", "redeemed_at", "created_at" FROM `seats`;--> statement-breakpoint
DROP TABLE `seats`;--> statement-breakpoint
ALTER TABLE `__new_seats` RENAME TO `seats`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
CREATE UNIQUE INDEX `seats_code_unique` ON `seats` (`code`);