CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE IF NOT EXISTS "tenants" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "category" integer, "name" varchar, "code" varchar, "house_number" varchar, "apt_number" integer, "comment" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "settlement_id" integer, "street_id" integer);
CREATE TABLE IF NOT EXISTS "rent_objects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar, "area" decimal, "function" text, "comment" text, "house_number" varchar, "rented" boolean DEFAULT 'f', "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "settlement_id" integer, "street_id" integer);
CREATE TABLE IF NOT EXISTS "valuations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar, "val_date" date, "value" decimal, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "rent_object_id" integer);
CREATE TABLE IF NOT EXISTS "sessions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "s_date" date, "code" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "settlements" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "kind" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "streets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "kind" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_tenants_on_settlement_id" ON "tenants" ("settlement_id");
CREATE INDEX "index_tenants_on_street_id" ON "tenants" ("street_id");
CREATE INDEX "index_rent_objects_on_settlement_id" ON "rent_objects" ("settlement_id");
CREATE INDEX "index_rent_objects_on_street_id" ON "rent_objects" ("street_id");
CREATE INDEX "index_valuations_on_rent_object_id" ON "valuations" ("rent_object_id");
CREATE TABLE IF NOT EXISTS "agreements_sessions" ("agreement_id" integer NOT NULL, "session_id" integer NOT NULL);
CREATE TABLE IF NOT EXISTS "extensions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar, "reg_date" date, "due_date" date, "interest" integer, "comment" text, "category" integer, "agreement_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_extensions_on_agreement_id" ON "extensions" ("agreement_id");
CREATE TABLE IF NOT EXISTS "extensions_sessions" ("extension_id" integer NOT NULL, "session_id" integer NOT NULL);
CREATE TABLE IF NOT EXISTS "agreements_rent_objects" ("agreement_id" integer NOT NULL, "rent_object_id" integer NOT NULL);
CREATE TABLE IF NOT EXISTS "agreements" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar, "reg_date" date, "due_date" date, "easement" boolean DEFAULT 'f', "archived" boolean DEFAULT 'f', "interest" integer, "comment" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "tenant_id" integer);
CREATE INDEX "index_agreements_on_tenant_id" ON "agreements" ("tenant_id");
INSERT INTO schema_migrations (version) VALUES ('20160215142852');

INSERT INTO schema_migrations (version) VALUES ('20160215174702');

INSERT INTO schema_migrations (version) VALUES ('20160215175453');

INSERT INTO schema_migrations (version) VALUES ('20160215182528');

INSERT INTO schema_migrations (version) VALUES ('20160215190228');

INSERT INTO schema_migrations (version) VALUES ('20160215194140');

INSERT INTO schema_migrations (version) VALUES ('20160215194314');

INSERT INTO schema_migrations (version) VALUES ('20160218184332');

INSERT INTO schema_migrations (version) VALUES ('20160229122341');

INSERT INTO schema_migrations (version) VALUES ('20160229122502');

INSERT INTO schema_migrations (version) VALUES ('20160229122644');

INSERT INTO schema_migrations (version) VALUES ('20160229122959');

INSERT INTO schema_migrations (version) VALUES ('20160229123013');

INSERT INTO schema_migrations (version) VALUES ('20160229123036');

INSERT INTO schema_migrations (version) VALUES ('20160229133404');

INSERT INTO schema_migrations (version) VALUES ('20160302072908');

INSERT INTO schema_migrations (version) VALUES ('20160302091945');

INSERT INTO schema_migrations (version) VALUES ('20160327151802');

INSERT INTO schema_migrations (version) VALUES ('20170119134308');

