CREATE TABLE `article` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `unique_id` varchar(36) NOT NULL COMMENT '게시물 고유 ID',
  `title` varchar(255) NOT NULL COMMENT '제목',
  `body` mediumtext NOT NULL COMMENT '본문',
  `likes` int NOT NULL DEFAULT 0 COMMENT '좋아요',
  `view_counts` int NOT NULL DEFAULT 0 COMMENT '조회수',
  `user_id` bigint NOT NULL COMMENT '사용자 ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `created_by` varchar(45) NOT NULL COMMENT '생성자',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `updated_by` varchar(45) NOT NULL COMMENT '수정자',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_uniqueid` (`unique_id`),
  KEY `ix_title` (`title`),
  KEY `ix_user_id` (`user_id`),
  KEY `ix_created_at` (`created_at`),
  KEY `ix_updated_at` (`updated_at`)
) ENGINE=InnoDB COMMENT='게시물';

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `unique_id` varchar(36) NOT NULL COMMENT '댓글 고유 ID',
  `body` text NOT NULL COMMENT '본문',
  `likes` int NOT NULL DEFAULT 0 COMMENT '좋아요',
  `article_id` varchar(256) NOT NULL COMMENT '게시글 ID',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '사용자 ID',
  `parent_comment id` varchar(256) NOT NULL COMMENT '부모 댓글 ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `created_by` varchar(45) NOT NULL COMMENT '생성자',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `updated_by` varchar(45) NOT NULL COMMENT '수정자',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_uniqueid` (`unique_id`),
  KEY `ix_user_id` (`user_id`),
  KEY `ix_created_at` (`created_at`),
  KEY `ix_updated_at` (`updated_at`)
) ENGINE=InnoDB COMMENT='댓글';

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `login_id` varchar(36) NOT NULL COMMENT '로그인 ID',
  `password` varchar(32) NOT NULL COMMENT '로그인 암호',
  `total_likes` int NOT NULL DEFAULT 0 COMMENT '전체 좋아요',
  `total_view_counts` int NOT NULL DEFAULT 0 COMMENT '전체 조회수',
  `nickname` varchar(80) DEFAULT NULL COMMENT '닉네임',
  `email` varchar(100) DEFAULT NULL COMMENT '이메일',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `created_by` varchar(45) NOT NULL COMMENT '생성자',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `updated_by` varchar(45) NOT NULL COMMENT '수정자',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_loginid` (`login_id`),
  KEY `ix_login_id` (`login_id`),
  KEY `ix_created_at` (`created_at`),
  KEY `ix_updated_at` (`updated_at`)
) ENGINE=InnoDB COMMENT='사용자';