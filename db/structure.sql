--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agreements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE agreements (
    id integer NOT NULL,
    code character varying,
    reg_date date,
    due_date date,
    easement boolean DEFAULT false,
    archived boolean DEFAULT false,
    interest integer,
    comment text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tenant_id integer
);


--
-- Name: agreements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE agreements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: agreements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE agreements_id_seq OWNED BY agreements.id;


--
-- Name: agreements_rent_objects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE agreements_rent_objects (
    agreement_id integer NOT NULL,
    rent_object_id integer NOT NULL
);


--
-- Name: agreements_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE agreements_sessions (
    agreement_id integer NOT NULL,
    session_id integer NOT NULL
);


--
-- Name: extensions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE extensions (
    id integer NOT NULL,
    code character varying,
    reg_date date,
    due_date date,
    interest integer,
    comment text,
    category integer,
    agreement_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: extensions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE extensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: extensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE extensions_id_seq OWNED BY extensions.id;


--
-- Name: extensions_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE extensions_sessions (
    extension_id integer NOT NULL,
    session_id integer NOT NULL
);


--
-- Name: rent_objects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rent_objects (
    id integer NOT NULL,
    code character varying,
    area numeric,
    function text,
    comment text,
    house_number character varying,
    rented boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    settlement_id integer,
    street_id integer
);


--
-- Name: rent_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rent_objects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rent_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rent_objects_id_seq OWNED BY rent_objects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sessions (
    id integer NOT NULL,
    s_date date,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: settlements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE settlements (
    id integer NOT NULL,
    name character varying,
    kind integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: settlements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE settlements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settlements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE settlements_id_seq OWNED BY settlements.id;


--
-- Name: streets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE streets (
    id integer NOT NULL,
    name character varying,
    kind integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: streets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE streets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: streets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE streets_id_seq OWNED BY streets.id;


--
-- Name: tenants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tenants (
    id integer NOT NULL,
    category integer,
    name character varying,
    code character varying,
    house_number character varying,
    apt_number integer,
    comment text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    settlement_id integer,
    street_id integer
);


--
-- Name: tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tenants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tenants_id_seq OWNED BY tenants.id;


--
-- Name: valuations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE valuations (
    id integer NOT NULL,
    code character varying,
    val_date date,
    value numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rent_object_id integer
);


--
-- Name: valuations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valuations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valuations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valuations_id_seq OWNED BY valuations.id;


--
-- Name: agreements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY agreements ALTER COLUMN id SET DEFAULT nextval('agreements_id_seq'::regclass);


--
-- Name: extensions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY extensions ALTER COLUMN id SET DEFAULT nextval('extensions_id_seq'::regclass);


--
-- Name: rent_objects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rent_objects ALTER COLUMN id SET DEFAULT nextval('rent_objects_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: settlements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY settlements ALTER COLUMN id SET DEFAULT nextval('settlements_id_seq'::regclass);


--
-- Name: streets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY streets ALTER COLUMN id SET DEFAULT nextval('streets_id_seq'::regclass);


--
-- Name: tenants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tenants ALTER COLUMN id SET DEFAULT nextval('tenants_id_seq'::regclass);


--
-- Name: valuations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuations ALTER COLUMN id SET DEFAULT nextval('valuations_id_seq'::regclass);


--
-- Name: agreements agreements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY agreements
    ADD CONSTRAINT agreements_pkey PRIMARY KEY (id);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: rent_objects rent_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rent_objects
    ADD CONSTRAINT rent_objects_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: settlements settlements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY settlements
    ADD CONSTRAINT settlements_pkey PRIMARY KEY (id);


--
-- Name: streets streets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY streets
    ADD CONSTRAINT streets_pkey PRIMARY KEY (id);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: valuations valuations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuations
    ADD CONSTRAINT valuations_pkey PRIMARY KEY (id);


--
-- Name: index_agreements_on_tenant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_agreements_on_tenant_id ON agreements USING btree (tenant_id);


--
-- Name: index_extensions_on_agreement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_extensions_on_agreement_id ON extensions USING btree (agreement_id);


--
-- Name: index_rent_objects_on_settlement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rent_objects_on_settlement_id ON rent_objects USING btree (settlement_id);


--
-- Name: index_rent_objects_on_street_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rent_objects_on_street_id ON rent_objects USING btree (street_id);


--
-- Name: index_tenants_on_settlement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tenants_on_settlement_id ON tenants USING btree (settlement_id);


--
-- Name: index_tenants_on_street_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tenants_on_street_id ON tenants USING btree (street_id);


--
-- Name: index_valuations_on_rent_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_valuations_on_rent_object_id ON valuations USING btree (rent_object_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: valuations fk_rails_056cd46d72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuations
    ADD CONSTRAINT fk_rails_056cd46d72 FOREIGN KEY (rent_object_id) REFERENCES rent_objects(id);


--
-- Name: tenants fk_rails_08936cb958; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tenants
    ADD CONSTRAINT fk_rails_08936cb958 FOREIGN KEY (street_id) REFERENCES streets(id);


--
-- Name: rent_objects fk_rails_4a3b9290b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rent_objects
    ADD CONSTRAINT fk_rails_4a3b9290b8 FOREIGN KEY (settlement_id) REFERENCES settlements(id);


--
-- Name: agreements fk_rails_7e490e95a5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY agreements
    ADD CONSTRAINT fk_rails_7e490e95a5 FOREIGN KEY (tenant_id) REFERENCES tenants(id);


--
-- Name: extensions fk_rails_a4623a7b5e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY extensions
    ADD CONSTRAINT fk_rails_a4623a7b5e FOREIGN KEY (agreement_id) REFERENCES agreements(id);


--
-- Name: tenants fk_rails_cb1401eeca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tenants
    ADD CONSTRAINT fk_rails_cb1401eeca FOREIGN KEY (settlement_id) REFERENCES settlements(id);


--
-- Name: rent_objects fk_rails_f4a0b095c6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rent_objects
    ADD CONSTRAINT fk_rails_f4a0b095c6 FOREIGN KEY (street_id) REFERENCES streets(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

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

