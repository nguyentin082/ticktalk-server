CREATE TABLE "topics" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "vocabularies" (
  "id" serial PRIMARY KEY,
  "word" varchar(100),
  "pos" varchar(50),
  "example" text,
  "vn_word_meaning" text,
  "audio_url" text,
  "img_url" text,
  "topic_id" int,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "conversations" (
  "id" serial PRIMARY KEY,
  "sentences" text,
  "vn_sentence_meaning" text,
  "audio_url" text,
  "topic_id" int,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "email" varchar(255) UNIQUE,
  "hash_password" varchar(255),
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "user_data" (
  "id" serial PRIMARY KEY,
  "user_id" int UNIQUE,
  "nickname" varchar(100),
  "avatar_url" text,
  "level" int DEFAULT 1,
  "total_vocab_learned" int DEFAULT 0,
  "total_conversations_done" int DEFAULT 0,
  "last_login" timestamptz
);

CREATE TABLE "bookmarks" (
  "id" serial PRIMARY KEY,
  "vocabulary_id" int,
  "user_id" int
);

CREATE TABLE "user_progress" (
  "id" serial PRIMARY KEY,
  "user_id" int,
  "vocabulary_id" int,
  "conversation_id" int,
  "completed_at" timestamptz DEFAULT (now()),
  "score" int
);

CREATE TABLE "reviews" (
  "id" serial PRIMARY KEY,
  "user_id" int,
  "vocabulary_id" int,
  "reviewed_at" timestamptz DEFAULT (now()),
  "correct" bool
);

CREATE TABLE "quizzes" (
  "id" serial PRIMARY KEY,
  "user_id" int,
  "started_at" timestamptz DEFAULT (now()),
  "ended_at" timestamptz,
  "score" int
);

CREATE TABLE "quiz_items" (
  "id" serial PRIMARY KEY,
  "quiz_id" int,
  "vocabulary_id" int,
  "is_correct" bool
);

CREATE TABLE "learning_sessions" (
  "id" serial PRIMARY KEY,
  "user_id" int,
  "activity_type" varchar(50),
  "started_at" timestamptz DEFAULT (now()),
  "ended_at" timestamptz
);

CREATE UNIQUE INDEX ON "bookmarks" ("vocabulary_id", "user_id");

ALTER TABLE "vocabularies" ADD FOREIGN KEY ("topic_id") REFERENCES "topics" ("id");

ALTER TABLE "conversations" ADD FOREIGN KEY ("topic_id") REFERENCES "topics" ("id");

ALTER TABLE "user_data" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "bookmarks" ADD FOREIGN KEY ("vocabulary_id") REFERENCES "vocabularies" ("id");

ALTER TABLE "bookmarks" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_progress" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_progress" ADD FOREIGN KEY ("vocabulary_id") REFERENCES "vocabularies" ("id");

ALTER TABLE "user_progress" ADD FOREIGN KEY ("conversation_id") REFERENCES "conversations" ("id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("vocabulary_id") REFERENCES "vocabularies" ("id");

ALTER TABLE "quizzes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "quiz_items" ADD FOREIGN KEY ("quiz_id") REFERENCES "quizzes" ("id");

ALTER TABLE "quiz_items" ADD FOREIGN KEY ("vocabulary_id") REFERENCES "vocabularies" ("id");

ALTER TABLE "learning_sessions" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
