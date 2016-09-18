--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-06-10 13:36:01 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16394)
-- Name: Carriere_Studenti; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Carriere_Studenti";


ALTER SCHEMA "Carriere_Studenti" OWNER TO postgres;

SET search_path = "Carriere_Studenti", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 16395)
-- Name: anno_accademico; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE anno_accademico (
    k_anno_accademico integer NOT NULL,
    nome_anno_accademico text,
    "anno_inizio_annoAccademico" numeric,
    "anno_fine_annoAccademico" numeric
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16401)
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE SEQUENCE anno_accademico_k_anno_accademico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anno_accademico_k_anno_accademico_seq OWNER TO postgres;

--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 183
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE OWNED BY; Schema: Carriere_Studenti; Owner: postgres
--

ALTER SEQUENCE anno_accademico_k_anno_accademico_seq OWNED BY anno_accademico.k_anno_accademico;


--
-- TOC entry 210 (class 1259 OID 16929)
-- Name: carriera; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE carriera (
    k_data_preimmatricolazione integer NOT NULL,
    k_data_test_ammissione integer NOT NULL,
    k_data_iscrizione integer NOT NULL,
    k_data_laurea integer NOT NULL,
    k_data_uscita integer NOT NULL,
    k_tipo_immatricolazione integer NOT NULL,
    k_aa_immatricolazione integer NOT NULL,
    k_aa_uscita integer NOT NULL,
    k_stato_iscrizione integer NOT NULL,
    k_tipo_uscita integer NOT NULL,
    k_corso_studi integer NOT NULL,
    k_studente integer NOT NULL,
    cfu_acquisiti integer,
    media_voto_esami double precision,
    numero_esami integer,
    punteggio_ammissione integer
);


ALTER TABLE carriera OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16403)
-- Name: corso; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE corso (
    k_corso integer NOT NULL,
    nome_corso text,
    ssd text,
    codice_corso text,
    crediti_corso numeric
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16409)
-- Name: corso_k_corso_seq; Type: SEQUENCE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE SEQUENCE corso_k_corso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_k_corso_seq OWNER TO postgres;

--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 185
-- Name: corso_k_corso_seq; Type: SEQUENCE OWNED BY; Schema: Carriere_Studenti; Owner: postgres
--

ALTER SEQUENCE corso_k_corso_seq OWNED BY corso.k_corso;


--
-- TOC entry 186 (class 1259 OID 16411)
-- Name: corso_studi; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE corso_studi (
    k_corso_studi integer NOT NULL,
    durata_legale numeric,
    codice_ateneo text,
    codice_dipartimento text,
    nome_dipartimento text,
    numero_programmato numeric,
    ha_numero_prog boolean,
    tipo_corso_studi text,
    nome_corso_studi text,
    data_inizio_validita text,
    data_fine_validita text,
    codice_corso_studi integer
);


ALTER TABLE corso_studi OWNER TO postgres;

--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN corso_studi.nome_dipartimento; Type: COMMENT; Schema: Carriere_Studenti; Owner: postgres
--

COMMENT ON COLUMN corso_studi.nome_dipartimento IS '

';


--
-- TOC entry 187 (class 1259 OID 16417)
-- Name: corso_studi_k_corso_studi_seq; Type: SEQUENCE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE SEQUENCE corso_studi_k_corso_studi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_studi_k_corso_studi_seq OWNER TO postgres;

--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 187
-- Name: corso_studi_k_corso_studi_seq; Type: SEQUENCE OWNED BY; Schema: Carriere_Studenti; Owner: postgres
--

ALTER SEQUENCE corso_studi_k_corso_studi_seq OWNED BY corso_studi.k_corso_studi;


--
-- TOC entry 188 (class 1259 OID 16419)
-- Name: docente; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE docente (
    k_docente integer NOT NULL,
    nome_docente text,
    ruolo text,
    ssd_docente text,
    codice_docente text,
    cognome_docente text,
    dipartimento_docente text
);


ALTER TABLE docente OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16425)
-- Name: docente_k_docente_seq; Type: SEQUENCE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE SEQUENCE docente_k_docente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE docente_k_docente_seq OWNER TO postgres;

--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 189
-- Name: docente_k_docente_seq; Type: SEQUENCE OWNED BY; Schema: Carriere_Studenti; Owner: postgres
--

ALTER SEQUENCE docente_k_docente_seq OWNED BY docente.k_docente;


--
-- TOC entry 190 (class 1259 OID 16427)
-- Name: esami; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE esami (
    k_studente integer NOT NULL,
    k_corso_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_corso integer NOT NULL,
    k_docente integer NOT NULL,
    k_data integer NOT NULL,
    voto numeric,
    cfu_acquisiti numeric
);


ALTER TABLE esami OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16433)
-- Name: immatricolazioni; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE immatricolazioni (
    k_studente integer NOT NULL,
    k_corso_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_tipo_immatricolazioni integer NOT NULL
);


ALTER TABLE immatricolazioni OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16436)
-- Name: ingressi; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE ingressi (
    k_studente integer NOT NULL,
    k_corso_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_tipo_immatricolazione integer,
    k_data integer,
    punteggio_test numeric,
    immatricolato boolean
);


ALTER TABLE ingressi OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16442)
-- Name: iscrizioni; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE iscrizioni (
    k_studente integer NOT NULL,
    k_corso_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_data integer NOT NULL,
    k_tipo_iscrizione integer NOT NULL
);


ALTER TABLE iscrizioni OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16445)
-- Name: lauree; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE lauree (
    k_studente integer NOT NULL,
    k_corso_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_data integer NOT NULL,
    voto_laurea text
);


ALTER TABLE lauree OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16451)
-- Name: preimmatricolazioni; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE preimmatricolazioni (
    k_studente integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_corso_studi integer NOT NULL
);


ALTER TABLE preimmatricolazioni OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16454)
-- Name: rinunce; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE rinunce (
    k_studente integer NOT NULL,
    k_corso_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_data integer NOT NULL
);


ALTER TABLE rinunce OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16457)
-- Name: studente; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE studente (
    k_studente integer NOT NULL,
    coorte_aa text,
    titolo_di_studio text,
    sesso text,
    comune text,
    codice_fiscale text,
    matricola text,
    provincia text,
    regione text,
    nazione text,
    cittadinanza text,
    nazione_diploma text,
    anno_diploma numeric,
    istituto text,
    tipo_istituto text,
    voto_diploma text,
    data_nascita text
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN studente.regione; Type: COMMENT; Schema: Carriere_Studenti; Owner: postgres
--

COMMENT ON COLUMN studente.regione IS '
';


--
-- TOC entry 198 (class 1259 OID 16463)
-- Name: studente_k_studente_seq; Type: SEQUENCE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE SEQUENCE studente_k_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studente_k_studente_seq OWNER TO postgres;

--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 198
-- Name: studente_k_studente_seq; Type: SEQUENCE OWNED BY; Schema: Carriere_Studenti; Owner: postgres
--

ALTER SEQUENCE studente_k_studente_seq OWNED BY studente.k_studente;


--
-- TOC entry 199 (class 1259 OID 16465)
-- Name: tempo; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE tempo (
    k_tempo integer NOT NULL,
    giorno numeric,
    mese numeric,
    anno numeric
);


ALTER TABLE tempo OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16471)
-- Name: tempo_k_tempo_seq; Type: SEQUENCE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE SEQUENCE tempo_k_tempo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo_k_tempo_seq OWNER TO postgres;

--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 200
-- Name: tempo_k_tempo_seq; Type: SEQUENCE OWNED BY; Schema: Carriere_Studenti; Owner: postgres
--

ALTER SEQUENCE tempo_k_tempo_seq OWNED BY tempo.k_tempo;


--
-- TOC entry 201 (class 1259 OID 16473)
-- Name: test_ammissione; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE test_ammissione (
    k_studente integer NOT NULL,
    k_corso_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    punteggio numeric
);


ALTER TABLE test_ammissione OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16479)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE tipo_immatricolazione (
    k_tipo_immatricolazione integer NOT NULL,
    tipo_immatricolazione text,
    id_tipo_immatricolazione text
);


ALTER TABLE tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16482)
-- Name: tipo_immatricolazioni_k_tipo_immatricolazioni_seq; Type: SEQUENCE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE SEQUENCE tipo_immatricolazioni_k_tipo_immatricolazioni_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_immatricolazioni_k_tipo_immatricolazioni_seq OWNER TO postgres;

--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 203
-- Name: tipo_immatricolazioni_k_tipo_immatricolazioni_seq; Type: SEQUENCE OWNED BY; Schema: Carriere_Studenti; Owner: postgres
--

ALTER SEQUENCE tipo_immatricolazioni_k_tipo_immatricolazioni_seq OWNED BY tipo_immatricolazione.k_tipo_immatricolazione;


--
-- TOC entry 204 (class 1259 OID 16484)
-- Name: tipo_iscrizione; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE tipo_iscrizione (
    k_tipo_iscrizione integer NOT NULL,
    in_fuori_corso text,
    anni_fuoricorso numeric,
    anno_corso numeric
);


ALTER TABLE tipo_iscrizione OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16490)
-- Name: tipo_iscrizione_k_tipo_iscrizione_seq; Type: SEQUENCE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE SEQUENCE tipo_iscrizione_k_tipo_iscrizione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_iscrizione_k_tipo_iscrizione_seq OWNER TO postgres;

--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 205
-- Name: tipo_iscrizione_k_tipo_iscrizione_seq; Type: SEQUENCE OWNED BY; Schema: Carriere_Studenti; Owner: postgres
--

ALTER SEQUENCE tipo_iscrizione_k_tipo_iscrizione_seq OWNED BY tipo_iscrizione.k_tipo_iscrizione;


--
-- TOC entry 208 (class 1259 OID 16743)
-- Name: tipo_uscita; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE tipo_uscita (
    k_tipo_uscita integer NOT NULL,
    tipo_uscita text
);


ALTER TABLE tipo_uscita OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16741)
-- Name: tipo_uscita_k_tipo_uscita_seq; Type: SEQUENCE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE SEQUENCE tipo_uscita_k_tipo_uscita_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_uscita_k_tipo_uscita_seq OWNER TO postgres;

--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 207
-- Name: tipo_uscita_k_tipo_uscita_seq; Type: SEQUENCE OWNED BY; Schema: Carriere_Studenti; Owner: postgres
--

ALTER SEQUENCE tipo_uscita_k_tipo_uscita_seq OWNED BY tipo_uscita.k_tipo_uscita;


--
-- TOC entry 206 (class 1259 OID 16492)
-- Name: trasferimenti; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE trasferimenti (
    k_studente integer NOT NULL,
    k_corso_studi integer NOT NULL,
    k_corso_studi_destinazione integer,
    k_anno_accademico integer NOT NULL,
    k_data integer NOT NULL
);


ALTER TABLE trasferimenti OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16752)
-- Name: uscite; Type: TABLE; Schema: Carriere_Studenti; Owner: postgres
--

CREATE TABLE uscite (
    k_studente integer NOT NULL,
    k_cds_destinazione integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_tipo_uscita integer NOT NULL,
    k_data integer NOT NULL,
    k_cds_provenienza integer NOT NULL
);


ALTER TABLE uscite OWNER TO postgres;

--
-- TOC entry 2127 (class 2604 OID 16495)
-- Name: k_anno_accademico; Type: DEFAULT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN k_anno_accademico SET DEFAULT nextval('anno_accademico_k_anno_accademico_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 16496)
-- Name: k_corso; Type: DEFAULT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY corso ALTER COLUMN k_corso SET DEFAULT nextval('corso_k_corso_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 16497)
-- Name: k_corso_studi; Type: DEFAULT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY corso_studi ALTER COLUMN k_corso_studi SET DEFAULT nextval('corso_studi_k_corso_studi_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 16498)
-- Name: k_docente; Type: DEFAULT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY docente ALTER COLUMN k_docente SET DEFAULT nextval('docente_k_docente_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 16499)
-- Name: k_studente; Type: DEFAULT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY studente ALTER COLUMN k_studente SET DEFAULT nextval('studente_k_studente_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 16500)
-- Name: k_tempo; Type: DEFAULT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY tempo ALTER COLUMN k_tempo SET DEFAULT nextval('tempo_k_tempo_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 16501)
-- Name: k_tipo_immatricolazione; Type: DEFAULT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione ALTER COLUMN k_tipo_immatricolazione SET DEFAULT nextval('tipo_immatricolazioni_k_tipo_immatricolazioni_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 16502)
-- Name: k_tipo_iscrizione; Type: DEFAULT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY tipo_iscrizione ALTER COLUMN k_tipo_iscrizione SET DEFAULT nextval('tipo_iscrizione_k_tipo_iscrizione_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 16746)
-- Name: k_tipo_uscita; Type: DEFAULT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY tipo_uscita ALTER COLUMN k_tipo_uscita SET DEFAULT nextval('tipo_uscita_k_tipo_uscita_seq'::regclass);


--
-- TOC entry 2175 (class 2606 OID 16933)
-- Name: carriera_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_pkey PRIMARY KEY (k_data_preimmatricolazione, k_data_test_ammissione, k_data_iscrizione, k_data_laurea, k_data_uscita, k_tipo_immatricolazione, k_aa_immatricolazione, k_aa_uscita, k_stato_iscrizione, k_tipo_uscita, k_corso_studi, k_studente);


--
-- TOC entry 2139 (class 2606 OID 16504)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (k_corso);


--
-- TOC entry 2143 (class 2606 OID 16506)
-- Name: docente_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (k_docente);


--
-- TOC entry 2145 (class 2606 OID 16508)
-- Name: esami_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_pkey PRIMARY KEY (k_studente, k_corso_studi, k_anno_accademico, k_corso, k_docente, k_data);


--
-- TOC entry 2147 (class 2606 OID 16510)
-- Name: immatricolazioni_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY immatricolazioni
    ADD CONSTRAINT immatricolazioni_pkey PRIMARY KEY (k_studente, k_corso_studi, k_anno_accademico, k_tipo_immatricolazioni);


--
-- TOC entry 2149 (class 2606 OID 16512)
-- Name: ingressi_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_pkey PRIMARY KEY (k_studente, k_corso_studi, k_anno_accademico);


--
-- TOC entry 2151 (class 2606 OID 16514)
-- Name: iscrizioni_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY iscrizioni
    ADD CONSTRAINT iscrizioni_pkey PRIMARY KEY (k_studente, k_corso_studi, k_anno_accademico, k_data, k_tipo_iscrizione);


--
-- TOC entry 2137 (class 2606 OID 16516)
-- Name: k_anno_accademico; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT k_anno_accademico PRIMARY KEY (k_anno_accademico);


--
-- TOC entry 2141 (class 2606 OID 16518)
-- Name: k_corso_studi; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY corso_studi
    ADD CONSTRAINT k_corso_studi PRIMARY KEY (k_corso_studi);


--
-- TOC entry 2159 (class 2606 OID 16520)
-- Name: k_studente; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT k_studente PRIMARY KEY (k_studente);


--
-- TOC entry 2165 (class 2606 OID 16522)
-- Name: k_tipo_immatricolazioni; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT k_tipo_immatricolazioni PRIMARY KEY (k_tipo_immatricolazione);


--
-- TOC entry 2171 (class 2606 OID 16751)
-- Name: k_tipo_uscita; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY tipo_uscita
    ADD CONSTRAINT k_tipo_uscita PRIMARY KEY (k_tipo_uscita);


--
-- TOC entry 2153 (class 2606 OID 19255)
-- Name: lauree_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_pkey PRIMARY KEY (k_studente, k_corso_studi, k_anno_accademico, k_data);


--
-- TOC entry 2155 (class 2606 OID 16526)
-- Name: preimmatricolazioni_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY preimmatricolazioni
    ADD CONSTRAINT preimmatricolazioni_pkey PRIMARY KEY (k_studente, k_anno_accademico, k_corso_studi);


--
-- TOC entry 2157 (class 2606 OID 16528)
-- Name: rinunce_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY rinunce
    ADD CONSTRAINT rinunce_pkey PRIMARY KEY (k_studente, k_corso_studi, k_anno_accademico, k_data);


--
-- TOC entry 2161 (class 2606 OID 16530)
-- Name: tempo_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY tempo
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (k_tempo);


--
-- TOC entry 2163 (class 2606 OID 16532)
-- Name: test_ammissione_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY test_ammissione
    ADD CONSTRAINT test_ammissione_pkey PRIMARY KEY (k_studente, k_corso_studi, k_anno_accademico);


--
-- TOC entry 2167 (class 2606 OID 16534)
-- Name: tipo_iscrizione_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY tipo_iscrizione
    ADD CONSTRAINT tipo_iscrizione_pkey PRIMARY KEY (k_tipo_iscrizione);


--
-- TOC entry 2169 (class 2606 OID 16536)
-- Name: trasferimenti_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY trasferimenti
    ADD CONSTRAINT trasferimenti_pkey PRIMARY KEY (k_studente, k_corso_studi, k_anno_accademico, k_data);


--
-- TOC entry 2173 (class 2606 OID 16788)
-- Name: uscite_pkey; Type: CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY uscite
    ADD CONSTRAINT uscite_pkey PRIMARY KEY (k_studente, k_cds_destinazione, k_anno_accademico, k_tipo_uscita, k_data, k_cds_provenienza);


--
-- TOC entry 2221 (class 2606 OID 16934)
-- Name: carriera_k_aa_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_aa_immatricolazione_fkey FOREIGN KEY (k_aa_immatricolazione) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2222 (class 2606 OID 16939)
-- Name: carriera_k_aa_uscita_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_aa_uscita_fkey FOREIGN KEY (k_aa_uscita) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2223 (class 2606 OID 16944)
-- Name: carriera_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2225 (class 2606 OID 16954)
-- Name: carriera_k_data_iscrizione_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_data_iscrizione_fkey FOREIGN KEY (k_data_iscrizione) REFERENCES tempo(k_tempo);


--
-- TOC entry 2226 (class 2606 OID 16959)
-- Name: carriera_k_data_laurea_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_data_laurea_fkey FOREIGN KEY (k_data_laurea) REFERENCES tempo(k_tempo);


--
-- TOC entry 2224 (class 2606 OID 16949)
-- Name: carriera_k_data_preimmatricolazione_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_data_preimmatricolazione_fkey FOREIGN KEY (k_data_preimmatricolazione) REFERENCES tempo(k_tempo);


--
-- TOC entry 2227 (class 2606 OID 16964)
-- Name: carriera_k_data_test_ammissione_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_data_test_ammissione_fkey FOREIGN KEY (k_data_test_ammissione) REFERENCES tempo(k_tempo);


--
-- TOC entry 2228 (class 2606 OID 16969)
-- Name: carriera_k_data_uscita_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_data_uscita_fkey FOREIGN KEY (k_data_uscita) REFERENCES tempo(k_tempo);


--
-- TOC entry 2229 (class 2606 OID 16974)
-- Name: carriera_k_stato_iscrizione_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_stato_iscrizione_fkey FOREIGN KEY (k_stato_iscrizione) REFERENCES tipo_iscrizione(k_tipo_iscrizione);


--
-- TOC entry 2230 (class 2606 OID 16979)
-- Name: carriera_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2231 (class 2606 OID 16984)
-- Name: carriera_k_tipo_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_tipo_immatricolazione_fkey FOREIGN KEY (k_tipo_immatricolazione) REFERENCES tipo_immatricolazione(k_tipo_immatricolazione);


--
-- TOC entry 2232 (class 2606 OID 16989)
-- Name: carriera_k_tipo_uscita_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY carriera
    ADD CONSTRAINT carriera_k_tipo_uscita_fkey FOREIGN KEY (k_tipo_uscita) REFERENCES tipo_uscita(k_tipo_uscita);


--
-- TOC entry 2176 (class 2606 OID 16537)
-- Name: esami_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2177 (class 2606 OID 16542)
-- Name: esami_k_corso_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_corso_fkey FOREIGN KEY (k_corso) REFERENCES corso(k_corso);


--
-- TOC entry 2178 (class 2606 OID 16547)
-- Name: esami_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2179 (class 2606 OID 16552)
-- Name: esami_k_data_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_data_fkey FOREIGN KEY (k_data) REFERENCES tempo(k_tempo);


--
-- TOC entry 2180 (class 2606 OID 16557)
-- Name: esami_k_docente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_docente_fkey FOREIGN KEY (k_docente) REFERENCES docente(k_docente);


--
-- TOC entry 2181 (class 2606 OID 16562)
-- Name: esami_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2182 (class 2606 OID 16567)
-- Name: immatricolazioni_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY immatricolazioni
    ADD CONSTRAINT immatricolazioni_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2183 (class 2606 OID 16572)
-- Name: immatricolazioni_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY immatricolazioni
    ADD CONSTRAINT immatricolazioni_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2184 (class 2606 OID 16577)
-- Name: immatricolazioni_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY immatricolazioni
    ADD CONSTRAINT immatricolazioni_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2185 (class 2606 OID 16582)
-- Name: immatricolazioni_k_tipo_immatricolazioni_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY immatricolazioni
    ADD CONSTRAINT immatricolazioni_k_tipo_immatricolazioni_fkey FOREIGN KEY (k_tipo_immatricolazioni) REFERENCES tipo_immatricolazione(k_tipo_immatricolazione);


--
-- TOC entry 2186 (class 2606 OID 16587)
-- Name: ingressi_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2187 (class 2606 OID 16592)
-- Name: ingressi_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2188 (class 2606 OID 16597)
-- Name: ingressi_k_data_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_data_fkey FOREIGN KEY (k_data) REFERENCES tempo(k_tempo);


--
-- TOC entry 2189 (class 2606 OID 16602)
-- Name: ingressi_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2190 (class 2606 OID 16607)
-- Name: ingressi_k_tipo_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_tipo_immatricolazione_fkey FOREIGN KEY (k_tipo_immatricolazione) REFERENCES tipo_immatricolazione(k_tipo_immatricolazione);


--
-- TOC entry 2191 (class 2606 OID 16612)
-- Name: iscrizioni_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY iscrizioni
    ADD CONSTRAINT iscrizioni_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2192 (class 2606 OID 16617)
-- Name: iscrizioni_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY iscrizioni
    ADD CONSTRAINT iscrizioni_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2193 (class 2606 OID 16622)
-- Name: iscrizioni_k_data_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY iscrizioni
    ADD CONSTRAINT iscrizioni_k_data_fkey FOREIGN KEY (k_data) REFERENCES tempo(k_tempo);


--
-- TOC entry 2194 (class 2606 OID 16627)
-- Name: iscrizioni_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY iscrizioni
    ADD CONSTRAINT iscrizioni_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2195 (class 2606 OID 16632)
-- Name: iscrizioni_k_tipo_iscrizione_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY iscrizioni
    ADD CONSTRAINT iscrizioni_k_tipo_iscrizione_fkey FOREIGN KEY (k_tipo_iscrizione) REFERENCES tipo_iscrizione(k_tipo_iscrizione);


--
-- TOC entry 2196 (class 2606 OID 16637)
-- Name: lauree_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2197 (class 2606 OID 16642)
-- Name: lauree_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2198 (class 2606 OID 16647)
-- Name: lauree_k_data_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_data_fkey FOREIGN KEY (k_data) REFERENCES tempo(k_tempo);


--
-- TOC entry 2199 (class 2606 OID 16657)
-- Name: lauree_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2200 (class 2606 OID 16662)
-- Name: preimmatricolazioni_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY preimmatricolazioni
    ADD CONSTRAINT preimmatricolazioni_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2201 (class 2606 OID 16667)
-- Name: preimmatricolazioni_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY preimmatricolazioni
    ADD CONSTRAINT preimmatricolazioni_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2202 (class 2606 OID 16672)
-- Name: preimmatricolazioni_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY preimmatricolazioni
    ADD CONSTRAINT preimmatricolazioni_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2203 (class 2606 OID 16677)
-- Name: rinunce_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY rinunce
    ADD CONSTRAINT rinunce_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2204 (class 2606 OID 16682)
-- Name: rinunce_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY rinunce
    ADD CONSTRAINT rinunce_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2205 (class 2606 OID 16687)
-- Name: rinunce_k_data_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY rinunce
    ADD CONSTRAINT rinunce_k_data_fkey FOREIGN KEY (k_data) REFERENCES tempo(k_tempo);


--
-- TOC entry 2206 (class 2606 OID 16692)
-- Name: rinunce_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY rinunce
    ADD CONSTRAINT rinunce_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2207 (class 2606 OID 16697)
-- Name: test_ammissione_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY test_ammissione
    ADD CONSTRAINT test_ammissione_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2208 (class 2606 OID 16702)
-- Name: test_ammissione_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY test_ammissione
    ADD CONSTRAINT test_ammissione_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2209 (class 2606 OID 16707)
-- Name: test_ammissione_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY test_ammissione
    ADD CONSTRAINT test_ammissione_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2210 (class 2606 OID 16712)
-- Name: trasferimenti_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY trasferimenti
    ADD CONSTRAINT trasferimenti_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2211 (class 2606 OID 16717)
-- Name: trasferimenti_k_corso_studi_dest_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY trasferimenti
    ADD CONSTRAINT trasferimenti_k_corso_studi_dest_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2212 (class 2606 OID 16722)
-- Name: trasferimenti_k_corso_studi_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY trasferimenti
    ADD CONSTRAINT trasferimenti_k_corso_studi_fkey FOREIGN KEY (k_corso_studi) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2213 (class 2606 OID 16727)
-- Name: trasferimenti_k_data_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY trasferimenti
    ADD CONSTRAINT trasferimenti_k_data_fkey FOREIGN KEY (k_data) REFERENCES tempo(k_tempo);


--
-- TOC entry 2214 (class 2606 OID 16732)
-- Name: trasferimenti_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY trasferimenti
    ADD CONSTRAINT trasferimenti_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2215 (class 2606 OID 16757)
-- Name: uscite_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY uscite
    ADD CONSTRAINT uscite_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2220 (class 2606 OID 16794)
-- Name: uscite_k_cds_destinazione_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY uscite
    ADD CONSTRAINT uscite_k_cds_destinazione_fkey FOREIGN KEY (k_cds_destinazione) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2219 (class 2606 OID 16789)
-- Name: uscite_k_cds_provenienza_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY uscite
    ADD CONSTRAINT uscite_k_cds_provenienza_fkey FOREIGN KEY (k_cds_provenienza) REFERENCES corso_studi(k_corso_studi);


--
-- TOC entry 2216 (class 2606 OID 16767)
-- Name: uscite_k_data_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY uscite
    ADD CONSTRAINT uscite_k_data_fkey FOREIGN KEY (k_data) REFERENCES tempo(k_tempo);


--
-- TOC entry 2217 (class 2606 OID 16777)
-- Name: uscite_k_studente_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY uscite
    ADD CONSTRAINT uscite_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2218 (class 2606 OID 16782)
-- Name: uscite_k_tipo_uscita_fkey; Type: FK CONSTRAINT; Schema: Carriere_Studenti; Owner: postgres
--

ALTER TABLE ONLY uscite
    ADD CONSTRAINT uscite_k_tipo_uscita_fkey FOREIGN KEY (k_tipo_uscita) REFERENCES tipo_uscita(k_tipo_uscita);


-- Completed on 2016-06-10 13:36:01 CEST

--
-- PostgreSQL database dump complete
--

