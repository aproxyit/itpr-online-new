--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: master_barang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_barang (
    id_barang character varying(6) NOT NULL,
    nm_barang character varying(500),
    harga_satuan integer,
    harga_pack integer,
    isi_per_pack integer,
    status_barang character(1),
    id_kategori integer,
    qty_awal integer,
    qty_masuk integer,
    qty_keluar integer,
    qty_adjust integer,
    qty_akhir integer
);


ALTER TABLE public.master_barang OWNER TO postgres;

--
-- Name: master_cabang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_cabang (
    id_cabang character varying(6) NOT NULL,
    nm_cabang character varying(60),
    alamat text,
    area character varying(15),
    id_bm character varying(6),
    status_cabang character(1)
);


ALTER TABLE public.master_cabang OWNER TO postgres;

--
-- Name: COLUMN master_cabang.id_bm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.master_cabang.id_bm IS 'CONNECT TO ID_USER';


--
-- Name: master_department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_department (
    id_department character varying(6) NOT NULL,
    nama_department character varying(60)
);


ALTER TABLE public.master_department OWNER TO postgres;

--
-- Name: master_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_kategori (
    id_kategori integer NOT NULL,
    nm_kategori character varying(50)
);


ALTER TABLE public.master_kategori OWNER TO postgres;

--
-- Name: master_supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_supplier (
    id_supplier character varying(6) NOT NULL,
    nm_supplier character varying(60),
    telp character varying(15),
    alamat text,
    email character varying(100),
    status_supplier character(1)
);


ALTER TABLE public.master_supplier OWNER TO postgres;

--
-- Name: master_support; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_support (
    id_support character varying(6) NOT NULL,
    nm_support character varying(60),
    id_user character varying(6),
    status character(1),
    area character varying(15)
);


ALTER TABLE public.master_support OWNER TO postgres;

--
-- Name: master_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_user (
    id_user character varying(6) NOT NULL,
    username character varying(30),
    real_name character varying(100),
    password character varying(50),
    level character varying(7),
    id_cabang character varying(6),
    ttd character varying(20),
    titel character varying(7),
    email character varying(100),
    id_department character varying(6),
    status_user character(1)
);


ALTER TABLE public.master_user OWNER TO postgres;

--
-- Name: sequence_no_urut; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence_no_urut
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence_no_urut OWNER TO postgres;

--
-- Name: trans_bidding_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_bidding_detail (
    id_bidding_detail character varying(15) NOT NULL,
    id_barang character varying(6),
    id_supplier character varying(6),
    harga integer,
    id_bidding character varying(15),
    id_barang_ganti character varying(6),
    nama_barang_ganti character varying(500)
);


ALTER TABLE public.trans_bidding_detail OWNER TO postgres;

--
-- Name: trans_bidding_header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_bidding_header (
    id_bidding character varying(15) NOT NULL,
    create_time timestamp(0) without time zone,
    expired_time timestamp(0) without time zone
);


ALTER TABLE public.trans_bidding_header OWNER TO postgres;

--
-- Name: trans_bidding_supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_bidding_supplier (
    id_bidding_supplier character varying(15),
    id_supplier character varying(6),
    id_bidding character varying(15),
    email character varying(100),
    send_success character(1),
    link_form character varying(100)
);


ALTER TABLE public.trans_bidding_supplier OWNER TO postgres;

--
-- Name: trans_delivery_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_delivery_detail (
    id_delivery character varying(6) NOT NULL,
    id_pr character varying(6),
    id_barang character varying(6),
    item_po character varying(50),
    qty integer,
    ket text,
    ck character(1)
);


ALTER TABLE public.trans_delivery_detail OWNER TO postgres;

--
-- Name: trans_delivery_header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_delivery_header (
    id_delivery character varying(6) NOT NULL,
    pengirim character varying(60),
    tgl_delivery date,
    keterangan text,
    status character(1),
    sub_department character varying(60),
    ttd_pengirim character varying(20),
    ttd_penerima character varying(20),
    penerima character varying(60),
    tgl_terima date
);


ALTER TABLE public.trans_delivery_header OWNER TO postgres;

--
-- Name: trans_lpb_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_lpb_detail (
    no_po integer NOT NULL,
    id_po character varying(6),
    id_pr character varying(6),
    id_barang character varying(6),
    qty integer,
    harga integer,
    ket text,
    ck character(1),
    no_lpb character varying(6),
    tgl_lpb date
);


ALTER TABLE public.trans_lpb_detail OWNER TO postgres;

--
-- Name: trans_po_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_po_detail (
    id_po_detail character varying(15) NOT NULL,
    id_po character varying(6),
    id_pr character varying(15),
    id_barang character varying(6),
    qty integer,
    harga integer,
    ket text,
    ck character(1),
    no_lpb character varying(6),
    ap integer
);


ALTER TABLE public.trans_po_detail OWNER TO postgres;

--
-- Name: trans_po_header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_po_header (
    id_po character varying(6) NOT NULL,
    id_depart character varying(6),
    nm_depart character varying(60),
    tgl_po date,
    ket_po text,
    id_user character varying(6),
    dept character varying(6),
    id_cabang character varying(6),
    titel character varying(7),
    ttd character varying(12),
    dikirim text,
    syarat_pembayaran character varying(10),
    total integer,
    po_approve_1 character varying(100),
    po_approve_time_1 timestamp without time zone,
    po_ttd_1 character varying(20),
    po_titel_1 character varying(7),
    po_approve_status_1 character(1),
    po_approve_2 character varying(100),
    po_approve_time_2 timestamp without time zone,
    po_ttd_2 character varying(20),
    po_titel_2 character varying(7),
    po_approve_status_2 character(1),
    status character(1),
    no_lpb character varying(6),
    tgl_lpb date,
    penerima character varying(100),
    id_supplier character varying(6),
    po_disapprove_note_1 text,
    po_disapprove_note_2 text
);


ALTER TABLE public.trans_po_header OWNER TO postgres;

--
-- Name: trans_pr_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_pr_detail (
    id_pr_detail character varying(12) NOT NULL,
    id_pr character varying(15),
    tgl_pr date,
    id_barang character varying(6),
    qty integer,
    tgl_penawaran date,
    harga_penawaran integer,
    harga_new integer,
    keterangan text,
    status_approve_pic character(1),
    status_approve_1 character(1),
    status_approve_2 character(1),
    id_bidding_detail character varying(15),
    id_po_detail character varying(15),
    tgl_terima date,
    id_support_pemasang character varying(6),
    tgl_terima_support date,
    tgl_pasang date,
    id_user_approval character varying(6),
    approval_user character(1),
    rating_pemasangan integer,
    rating_pemasangan_note text
);


ALTER TABLE public.trans_pr_detail OWNER TO postgres;

--
-- Name: COLUMN trans_pr_detail.tgl_terima; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.trans_pr_detail.tgl_terima IS 'tanggal barang diterima admin';


--
-- Name: COLUMN trans_pr_detail.id_user_approval; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.trans_pr_detail.id_user_approval IS 'Approval dari outet menandakan barang sudah terpasang';


--
-- Name: trans_pr_header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_pr_header (
    id_pr character varying(15) NOT NULL,
    kepada character varying(100),
    id_depart_kepada character varying(6),
    id_support character varying(6),
    tgl_pr timestamp(0) without time zone,
    id_user character varying(6),
    id_department_user character varying(6),
    id_cabang character varying(6),
    nama_cabang character varying(60),
    ttd character varying(20),
    titel character varying(7),
    pr_approve_1 character varying(100),
    pr_approve_time_1 timestamp(0) without time zone,
    pr_ttd_1 character varying(20),
    pr_titel_1 character varying(7),
    pr_approve_2 character varying(100),
    pr_approve_time_2 timestamp(0) without time zone,
    pr_ttd_2 character varying(20),
    pr_titel_2 character varying(7),
    pic_approve character varying(100),
    pic_approve_time timestamp(0) without time zone,
    pic_approve_ttd character varying(20),
    pic_titel character varying(7),
    note_pr text,
    status character(1),
    cancel_order character(1),
    id_bidding character varying(15),
    tgl_cancel timestamp(0) without time zone,
    pic_disapprove_note text,
    pr_disapprove_note_1 text,
    pr_disapprove_note_2 text
);


ALTER TABLE public.trans_pr_header OWNER TO postgres;

--
-- Data for Name: master_barang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_barang (id_barang, nm_barang, harga_satuan, harga_pack, isi_per_pack, status_barang, id_kategori, qty_awal, qty_masuk, qty_keluar, qty_adjust, qty_akhir) FROM stdin;
001	PROCESSOR AMD (RICHLAND) 6-6400 3.9 GHZ SOCKET FM2	0	\N	\N	a	3	\N	\N	\N	\N	\N
002	PROCESSOR AMD A8 5600K (RADEON HO 7560D) 3.6 GHZ CACHE 4MB F	0	\N	\N	a	3	\N	\N	\N	\N	\N
005	KAMERA CCTV (INDOR)	300000	\N	\N	a	2	\N	\N	\N	\N	\N
006	CASH DRAWER POSIFLEX CR 4000	1150000	\N	\N	a	3	\N	\N	\N	\N	\N
007	CASING POWER LOGIC 450W	0	\N	\N	a	3	\N	\N	\N	\N	\N
009	CORSAIR CMD8GX3M2A1600C8(2X4GB) DDR3	0	\N	\N	a	3	\N	\N	\N	\N	\N
010	CORSAIR CSSD-F128GBGS-BK-128 GB SATE III 2.5 * SSD	0	\N	\N	a	3	\N	\N	\N	\N	\N
011	CORSAIR VS450(CP-9020049-EU) 450W VS SERIES	0	\N	\N	a	3	\N	\N	\N	\N	\N
012	CUTTER EPSON TMU 220	0	\N	\N	a	4	\N	\N	\N	\N	\N
013	DVD  RW EXTERNAL SLIM USB SAMSUNG	0	\N	\N	a	3	\N	\N	\N	\N	\N
014	DVR CCTV 	2200000	\N	\N	a	2	\N	\N	\N	\N	\N
015	DVR H264 16 CHANEL	4000000	\N	\N	a	2	\N	\N	\N	\N	\N
016	DVR H264 8 CHANEL	0	\N	\N	a	2	\N	\N	\N	\N	\N
017	FAN PROCESSOR 478	0	\N	\N	a	3	\N	\N	\N	\N	\N
018	FAN PROCESSOR LGA 775	60000	\N	\N	a	3	\N	\N	\N	\N	\N
019	FINGER SPOT	0	\N	\N	a	3	\N	\N	\N	\N	\N
021	FINGER VISTA	0	\N	\N	a	3	\N	\N	\N	\N	\N
022	FLASH DISK 8 GB	75000	\N	\N	a	3	\N	\N	\N	\N	\N
023	FRAME GEAR EPSON L200	0	\N	\N	a	4	\N	\N	\N	\N	\N
024	FRAME GEAR EPSON L210	0	\N	\N	a	4	\N	\N	\N	\N	\N
025	GIGABYTE GA - F2A58M-DS2 AMD SOCKET FM2	825000	\N	\N	a	3	\N	\N	\N	\N	\N
026	HARDDISK SEAGATE 500 GB SATA	700000	\N	\N	a	3	\N	\N	\N	\N	\N
027	HARDDISK SEAGATE 250 GB SATA	0	\N	\N	a	3	\N	\N	\N	\N	\N
028	HARD DISK SEAGATE Barracuda SATA III 500 GB 7200RPM 3,5 INCH	550000	\N	\N	a	3	\N	\N	\N	\N	\N
029	HEAD EPSON L200	0	\N	\N	a	4	\N	\N	\N	\N	\N
030	HEAD EPSON L210	0	\N	\N	a	4	\N	\N	\N	\N	\N
031	HEAD EPSON TMU 220	450000	\N	\N	a	4	\N	\N	\N	\N	\N
032	SWITCH SUB 8 PORT  (HP)	0	\N	\N	a	5	\N	\N	\N	\N	\N
033	SWITCH SUB 16 PORT (HP)	0	\N	\N	a	5	\N	\N	\N	\N	\N
034	SWITCH SUB 24 PORT (HP)	0	\N	\N	a	5	\N	\N	\N	\N	\N
035	INTEL G2030 BOX (3	0	\N	\N	a	3	\N	\N	\N	\N	\N
036	INTEL G2030 LGA 1155	0	\N	\N	a	3	\N	\N	\N	\N	\N
037	KABEL POWER PRINTER EPSON L200	0	\N	\N	a	4	\N	\N	\N	\N	\N
038	KABEL SCAN PRINTER EPSON L200	0	\N	\N	a	4	\N	\N	\N	\N	\N
039	TESTER RG45 +RG11	0	\N	\N	a	7	\N	\N	\N	\N	\N
040	KAMERA CCTV (OUTDOR)	350000	\N	\N	a	3	\N	\N	\N	\N	\N
041	KEYBOARD LOGITECH	87000	\N	\N	a	3	\N	\N	\N	\N	\N
042	LCD LAPTOP ACER 473Z	0	\N	\N	a	3	\N	\N	\N	\N	\N
043	LICENSE WINDOWS 7  PROFESSIONAL 32 BIT	1000000	\N	\N	a	6	\N	\N	\N	\N	\N
044	LICENSE WINDOWS 8.1 PROFESIONAL 64 Bit	0	\N	\N	a	6	\N	\N	\N	\N	\N
045	LICENSE WINDOWS  XP	0	\N	\N	a	6	\N	\N	\N	\N	\N
046	MAINBOARD GIGABYTE H61M-S2PR3  	0	\N	\N	a	3	\N	\N	\N	\N	\N
047	MAINBOARD GIGABYTE GA -78 LMT-S2P AMD SOCKET AM3	0	\N	\N	a	3	\N	\N	\N	\N	\N
048	MAINBOARD EPSON L210	0	\N	\N	a	4	\N	\N	\N	\N	\N
049	MAINBOARD EPOSN TMU 220 AUTO CUTTER	0	\N	\N	a	4	\N	\N	\N	\N	\N
050	MEMORY KINGSTON 2 GB 12800 DDR3	270000	\N	\N	a	3	\N	\N	\N	\N	\N
051	MEMORY VGEN 2 GB DDR3	0	\N	\N	a	3	\N	\N	\N	\N	\N
052	MEMORY VGEN 1 GB DDR3	0	\N	\N	a	3	\N	\N	\N	\N	\N
053	MEMORY VGEN 4 GB DDR3 PC 12800	475000	\N	\N	a	3	\N	\N	\N	\N	\N
054	MEMORY KINGSTON 1 GB 12800 DDR3	0	\N	\N	a	3	\N	\N	\N	\N	\N
055	MEMORY KINGSTON 4 GB 12800 DDR3	540000	\N	\N	a	3	\N	\N	\N	\N	\N
056	MICROTIK RB 750 GL	500000	\N	\N	a	5	\N	\N	\N	\N	\N
057	MODEM PCI	0	\N	\N	a	6	\N	\N	\N	\N	\N
058	MONITOR BENQ 16 LED	815000	\N	\N	a	3	\N	\N	\N	\N	\N
059	MS SQL SERVER 5 CALL	0	\N	\N	a	6	\N	\N	\N	\N	\N
060	PICK ASSY EPSON L200	150000	\N	\N	a	4	\N	\N	\N	\N	\N
061	POWER LOGIC AZZURA 1000 450W	0	\N	\N	a	3	\N	\N	\N	\N	\N
062	POWER LOGIC MODENA GT200 500W	0	\N	\N	a	3	\N	\N	\N	\N	\N
063	POWER SUPPLY STANDAR OEM 380 WATT	125000	\N	\N	a	3	\N	\N	\N	\N	\N
064	POWER SUPPLY CORSAIR VS 450	680000	\N	\N	a	3	\N	\N	\N	\N	\N
065	POWER SUPPLY VENOM RX 500	900000	\N	\N	a	3	\N	\N	\N	\N	\N
066	PRINTER EPSON L210	0	\N	\N	a	4	\N	\N	\N	\N	\N
067	PRINTER EPSON TMU 220 USB PORT	2570000	\N	\N	a	4	\N	\N	\N	\N	\N
068	PROCESSOR AMD X2 250 BOX ATHLON II  (3200MHZ:2X1024KLB) AMD 	2	\N	\N	a	3	\N	\N	\N	\N	\N
069	UPS ICA 1200 VA	1100000	\N	\N	a	7	\N	\N	\N	\N	\N
070	UPS PROLINK 700 VA	0	\N	\N	a	7	\N	\N	\N	\N	\N
071	UPS ICA 700 VA	730000	\N	\N	a	7	\N	\N	\N	\N	\N
072	UPS PROLINK 1200 VA	0	\N	\N	a	7	\N	\N	\N	\N	\N
073	UPS ICA 1300 VA	0	\N	\N	a	7	\N	\N	\N	\N	\N
074	TV 32 INCH	0	\N	\N	a	2	\N	\N	\N	\N	\N
075	TANG KLIMPING TOOL	0	\N	\N	a	7	\N	\N	\N	\N	\N
077	PROCESSOR AMD (RICHLAND) A6-6400 RADEON HD8470D 3.9 GHZ 65W	0	\N	\N	a	3	\N	\N	\N	\N	\N
078	MAINBOARD GIGABYTE GA - F2A78M-HD2 AMD SOCKET FM2 	0	\N	\N	a	3	\N	\N	\N	\N	\N
079	CORSAIR CML4GX3M2A1600C9(2X2GB) 4G DDR3 	0	\N	\N	a	3	\N	\N	\N	\N	\N
080	POWER LOGIC AZZURA M2000 	0	\N	\N	a	3	\N	\N	\N	\N	\N
081	MOUSE LOGITECT USB	60000	\N	\N	a	3	\N	\N	\N	\N	\N
082	PRINTER EPSON L3110	2100000	\N	\N	a	4	\N	\N	\N	\N	\N
083	HARDDISK SEAGATE 1 TB SATA	0	\N	\N	a	3	\N	\N	\N	\N	\N
084	STABILLIZER 2000 V	815000	\N	\N	a	3	\N	\N	\N	\N	\N
085	PARAREL PORT TMU 220	0	\N	\N	a	4	\N	\N	\N	\N	\N
086	LCD LAPTOP COMPAQ PRESARIO CQ42	0	\N	\N	a	3	\N	\N	\N	\N	\N
087	MEMORY LAPTOP DDR3 PC 13333	0	\N	\N	a	3	\N	\N	\N	\N	\N
088	OFFICE HOME  AND BUSSINES 2013	0	\N	\N	a	6	\N	\N	\N	\N	\N
089	PRINTER VALIDASI STAR SP 298	0	\N	\N	a	4	\N	\N	\N	\N	\N
090	TANG AMPER	0	\N	\N	a	7	\N	\N	\N	\N	\N
091	KABEL RG 59 (CCTV)	0	\N	\N	a	2	\N	\N	\N	\N	\N
092	PICK ASSY L210	120000	\N	\N	a	4	\N	\N	\N	\N	\N
093	MAINBOARD  GIGABYTE GA - F2A68M-HD2 AMD SOCKET FM2	820000	\N	\N	a	3	\N	\N	\N	\N	\N
094	MEMORY VGEN 2 GB DDR3 PC12800	260000	\N	\N	a	3	\N	\N	\N	\N	\N
095	POWER UP ATOM MICRO 400W	0	\N	\N	a	3	\N	\N	\N	\N	\N
096	PASTA PROCESSOR	0	\N	\N	a	3	\N	\N	\N	\N	\N
097	FAST PRINT GEAER MEKANIK POMPA	0	\N	\N	a	4	\N	\N	\N	\N	\N
098	QUAD 4 CHANEL	0	\N	\N	a	3	\N	\N	\N	\N	\N
099	KONEKTOR 1 BNC	0	\N	\N	a	2	\N	\N	\N	\N	\N
100	KONEKTOR BNC	10000	\N	\N	a	2	\N	\N	\N	\N	\N
008	CONNECTOR RJ 45 AMP	110000	\N	\N	a	5	\N	\N	\N	\N	\N
020	FINGER SPOT  SMARTTRAX	300000	\N	\N	a	3	\N	\N	\N	\N	\N
003	BATERAI UPS PANASONIC	210000	\N	\N	a	7	\N	\N	\N	\N	\N
101	KONEKTOR RCA	0	\N	\N	a	2	\N	\N	\N	\N	\N
102	KABEL COAXIAL WITH POWER	0	\N	\N	a	2	\N	\N	\N	\N	\N
103	PAKET CCTV 11 KAMERA	0	\N	\N	a	2	\N	\N	\N	\N	\N
104	FLASH DISK 16 GB	70000	\N	\N	a	3	\N	\N	\N	\N	\N
105	STABILLIZER 1000 V	0	\N	\N	a	3	\N	\N	\N	\N	\N
106	MONITOR LG 16 LED	950000	\N	\N	a	3	\N	\N	\N	\N	\N
107	PROCESSOR AMD A10 5800K (RADEON HO 7660D) 3.8 GHZ 	0	\N	\N	a	3	\N	\N	\N	\N	\N
108	DVD RW VERBATIM	0	\N	\N	a	3	\N	\N	\N	\N	\N
109	MODEM WIFI SMARTFREN	0	\N	\N	a	5	\N	\N	\N	\N	\N
110	LAPTOP  ASUS  X 453MA INTEL N2840 2.16GHz Hardisd 500 GB Mem	3390000	\N	\N	a	3	\N	\N	\N	\N	\N
111	DVR H264 24  CHANEL	4000000	\N	\N	a	2	\N	\N	\N	\N	\N
112	POWER SUPPLY E-PRO	115000	\N	\N	a	3	\N	\N	\N	\N	\N
113	MEMORY VGEN 2 GB DDR2	0	\N	\N	a	3	\N	\N	\N	\N	\N
114	PRINTER EPSON L220	2060000	\N	\N	a	4	\N	\N	\N	\N	\N
115	LCD MONITOR 22 inch	0	\N	\N	a	3	\N	\N	\N	\N	\N
116	FLEXIBLE FLAT EPSON TMU-220	0	\N	\N	a	4	\N	\N	\N	\N	\N
117	HARDDISK SATTA  2 TB	985000	\N	\N	a	3	\N	\N	\N	\N	\N
118	LAPTOP ASUS X453	0	\N	\N	a	3	\N	\N	\N	\N	\N
119	HARDISK LAPTOP 500Gb	530000	\N	\N	a	3	\N	\N	\N	\N	\N
120	KAMERA CCTV CEEPER - Indor	350000	\N	\N	a	2	\N	\N	\N	\N	\N
121	KAMERA CCTV CEEPER - Outdor	0	\N	\N	a	2	\N	\N	\N	\N	\N
122	FLEXIBLE FLAT EPSON  L-200	0	\N	\N	a	4	\N	\N	\N	\N	\N
124	ROUTER TP LINK WIRELES	475000	\N	\N	a	5	\N	\N	\N	\N	\N
125	FINGER SOLUTION	1800000	\N	\N	a	3	\N	\N	\N	\N	\N
126	PROCESSOR LGA SOKET 1150	0	\N	\N	a	3	\N	\N	\N	\N	\N
127	MOTHERBOARD GIGABYTE GA H61M-DS2 SOSKET1150	0	\N	\N	a	3	\N	\N	\N	\N	\N
128	CORSAIR CML8GX3M2A 1600 C9 4GB	0	\N	\N	a	3	\N	\N	\N	\N	\N
129	CASING POWER LOGIC AZURA GTS 600 WATT	0	\N	\N	a	3	\N	\N	\N	\N	\N
131	STABILLIZER 500 VA	0	\N	\N	a	3	\N	\N	\N	\N	\N
132	CORSAIR CML8GX3M2A1600C9(2X4GB) VENGEANCE BLACK PC12800 8GB	630000	\N	\N	a	3	\N	\N	\N	\N	\N
133	PRINTER EPSON LX 310	0	\N	\N	a	4	\N	\N	\N	\N	\N
134	PRINTER EPSON A3L1300	0	\N	\N	a	4	\N	\N	\N	\N	\N
135	UPS ICA 1400 VA	1250000	\N	\N	a	7	\N	\N	\N	\N	\N
136	MAINBOARD GIGABYTE GA - F2A68M-HD2 AMD SOCKET FM2 	0	\N	\N	a	3	\N	\N	\N	\N	\N
137	HARDDISK SEAGATE 2 TB SATA	950000	\N	\N	a	3	\N	\N	\N	\N	\N
138	MICROTIK RB 951 UL-2ND	850000	\N	\N	a	5	\N	\N	\N	\N	\N
139	PRINTER  EPSON TM-U295P Validasi	0	\N	\N	a	4	\N	\N	\N	\N	\N
140	MEMORY KINGSTON KVR 1GN1158 4 GB PC 12800 DDR3	0	\N	\N	a	3	\N	\N	\N	\N	\N
141	PROCESSOR AMD KAVERI A6 7470K 	0	\N	\N	a	3	\N	\N	\N	\N	\N
143	INTEL G870 TRAY+FAN INTEL LGA 1155	0	\N	\N	a	3	\N	\N	\N	\N	\N
144	KINGSTON KVR16N11S8/4 4GB PC 12800 DDR3	0	\N	\N	a	3	\N	\N	\N	\N	\N
145	GIGABYTE GA -H61M-SP2 R3 INTEL SOCKET 1155	0	\N	\N	a	3	\N	\N	\N	\N	\N
146	MAGNETIC CARD READER MR1400	800000	\N	\N	a	3	\N	\N	\N	\N	\N
147	KABEL HEAD FLEXIBLE	15000	\N	\N	a	4	\N	\N	\N	\N	\N
148	KABEL HEAD PRINTER L200	50000	\N	\N	a	4	\N	\N	\N	\N	\N
149	GEAR SET PRINTER EPSON L200	0	\N	\N	a	4	\N	\N	\N	\N	\N
150	MODEM ANDROMAX M25	350000	\N	\N	a	3	\N	\N	\N	\N	\N
151	GPS	0	\N	\N	a	5	\N	\N	\N	\N	\N
152	KAMERA CCTV MOBIL	0	\N	\N	a	2	\N	\N	\N	\N	\N
153	BRACKET CCTV (OUTDOOR)	0	\N	\N	a	2	\N	\N	\N	\N	\N
154	HARD DISDK WDC PURPLE 4 TB SATA	0	\N	\N	a	3	\N	\N	\N	\N	\N
156	POWER SUPPLY Acbel CE2 400 OEM (pure 350 w Max 400	0	\N	\N	a	3	\N	\N	\N	\N	\N
157	MONITOR LCD LG15,6 Inch 16M38A /16M37A LED Size 15	0	\N	\N	a	3	\N	\N	\N	\N	\N
158	MAINBOARD GIGABYTE GA - F2A68HM-DS2 AMD SOCKET FM2	0	\N	\N	a	3	\N	\N	\N	\N	\N
159	IC MAINBORD EPSON	0	\N	\N	a	4	\N	\N	\N	\N	\N
160	TRANSISTOR EPSON L220 / L210	0	\N	\N	a	4	\N	\N	\N	\N	\N
161	MOUSE LOGITECH BLUETOOTH	0	\N	\N	a	3	\N	\N	\N	\N	\N
162	LAPTOP LENOVO IdeaPad G40-45 -14-QUAD CORE A8 6410	0	\N	\N	a	3	\N	\N	\N	\N	\N
163	KOMPUTER SERVER (AMD)	0	\N	\N	a	3	\N	\N	\N	\N	\N
164	AMD Kaveri A6-7400 FM2 + (Radeon R5 Series) AMD FM	0	\N	\N	a	3	\N	\N	\N	\N	\N
165	GIGABYTE GA-F2A68HM-H AMD Socket FM2	0	\N	\N	a	3	\N	\N	\N	\N	\N
166	KOMPUTER SET	0	\N	\N	a	3	\N	\N	\N	\N	\N
167	INTEL i5-6400 Box (2.7 Ghz,C6MB, Skylake Series) I	0	\N	\N	a	3	\N	\N	\N	\N	\N
168	GIGABYTE GA-H170-Gaming 3 Intel Socket 1151	0	\N	\N	a	3	\N	\N	\N	\N	\N
169	MEMORY DDR4 A-DATA AX4U2400W8G16-DRZ (2X8Gb) CL-16	0	\N	\N	a	3	\N	\N	\N	\N	\N
170	Casing Mini ATX Power Logic Allegra 200 (Slim) 450	0	\N	\N	a	3	\N	\N	\N	\N	\N
171	CORSAIR CX 600 (CP-9020048-EU) 600 W	0	\N	\N	a	3	\N	\N	\N	\N	\N
172	COOLER FAN DEEPCOOL Gammaxx 400 LGA 775/1156 /AMD 	0	\N	\N	a	3	\N	\N	\N	\N	\N
173	HARD DISK Corsair CSSD- F240GBGS-BK 240Gb Sata III	0	\N	\N	a	3	\N	\N	\N	\N	\N
174	KOMPUTER SERVER (INTEL I 5)	0	\N	\N	a	3	\N	\N	\N	\N	\N
175	USB to LPT	0	\N	\N	a	3	\N	\N	\N	\N	\N
177	CORSAIR CMZ16GX3M2A1600C10 (2X8Gb) Vengeance Black PC12800 1	0	\N	\N	a	3	\N	\N	\N	\N	\N
178	POWER LOGIC AZZURA M2000 / M3000 (Mini Case) 450W	0	\N	\N	a	3	\N	\N	\N	\N	\N
179	Samsung 860 EVO Sata 250 GB SSD	0	\N	\N	a	3	\N	\N	\N	\N	\N
180	CPU SERVER ( AMD GODAVARI A10 )	0	\N	\N	a	3	\N	\N	\N	\N	\N
181	CORSAIR CX 500 (CP-9020047-EU) 500 W CX Series	0	\N	\N	a	3	\N	\N	\N	\N	\N
182	HP JG540 V1910-10 PORT 10/100, 2 GIGABIT WEBSMART	0	\N	\N	a	5	\N	\N	\N	\N	\N
183	PARALEL MONITOR u/4 PC	0	\N	\N	a	3	\N	\N	\N	\N	\N
184	CPU SERVER ( AMD GODAVARI A8 )	0	\N	\N	a	3	\N	\N	\N	\N	\N
185	AMD Kaveri A6-7470K FM2 + (Radeon R5 Series) AMD FM2 3,9Ghz 	0	\N	\N	a	3	\N	\N	\N	\N	\N
186	CPU ADMIN & BACKOFFICE (AMD KAVERI A6)	0	\N	\N	a	3	\N	\N	\N	\N	\N
187	INTEL i3 3.1Ghz (1155)	0	\N	\N	a	3	\N	\N	\N	\N	\N
188	Corsair Memory 16 Gb 	0	\N	\N	a	3	\N	\N	\N	\N	\N
189	SSD 256 SAMSUNG	0	\N	\N	a	3	\N	\N	\N	\N	\N
190	COOLER MASTER FAN PROSESOR	0	\N	\N	a	3	\N	\N	\N	\N	\N
191	POWER LOGIC FUTURA	0	\N	\N	a	3	\N	\N	\N	\N	\N
192	CPU SERVER ( INTEL i3 )	0	\N	\N	a	3	\N	\N	\N	\N	\N
193	SWITCH SUB 32 PORT  (HP)	0	\N	\N	a	5	\N	\N	\N	\N	\N
176	AMD GODAVARI A8 -7670K FM2 +WITH 95W QUIET COOLER ( Radeon R7 Series ) 3,6 Ghz Chace 2x2 MB 95W AMD FM2	0	\N	\N	a	3	\N	\N	\N	\N	\N
130	LICENSE  Windows 10 64 Bit	350000	\N	\N	a	6	\N	\N	\N	\N	\N
123	ADAPTOR CCTV	225000	\N	\N	a	2	\N	\N	\N	\N	\N
155	AMD Kaveri A8-7600 FM2 + (Radeon R7 Series) (3,1 G	1650000	\N	\N	a	3	\N	\N	\N	\N	\N
194	LENOVO IDEAPAD 300 7CID	0	\N	\N	a	3	\N	\N	\N	\N	\N
195	HDD External 1 TB Seagate	0	\N	\N	a	3	\N	\N	\N	\N	\N
196	KABEL FLEXIBEL POWER	0	\N	\N	a	4	\N	\N	\N	\N	\N
197	KABEL HEAD TMU 220	0	\N	\N	a	4	\N	\N	\N	\N	\N
198	MEMORY LAPTOP DDR3 2GB Module  (PC3 13333)	0	\N	\N	a	3	\N	\N	\N	\N	\N
199	Charger Laptop Acer Aspire 4743Z	0	\N	\N	a	3	\N	\N	\N	\N	\N
200	Mainbord Epson L200	0	\N	\N	a	4	\N	\N	\N	\N	\N
201	POWER SUPPLAY EPSON L200	0	\N	\N	a	4	\N	\N	\N	\N	\N
202	SWITCH HUB 8 PORT  (HP) 10/100 J9793A	0	\N	\N	a	5	\N	\N	\N	\N	\N
203	POWER SUPPLAY SIMBADDA 500 W	0	\N	\N	a	3	\N	\N	\N	\N	\N
204	Sandisk OTG 2 MOD 32GB	0	\N	\N	a	3	\N	\N	\N	\N	\N
205	MONITOR LG 19,5 LED LG 20M38A	0	\N	\N	a	3	\N	\N	\N	\N	\N
206	PARALEL MONITOR u/2 PC	0	\N	\N	a	3	\N	\N	\N	\N	\N
207	TANG POTONG	0	\N	\N	a	7	\N	\N	\N	\N	\N
208	HP JG540 V1910-48 PORT 48/100, 2 GIGABIT WEBSMART	0	\N	\N	a	5	\N	\N	\N	\N	\N
209	COOLER MINI V2.0 FAN	0	\N	\N	a	3	\N	\N	\N	\N	\N
210	FLASH DISK 32 GB	0	\N	\N	a	3	\N	\N	\N	\N	\N
211	Mouse Pad	0	\N	\N	a	3	\N	\N	\N	\N	\N
212	FLASH DISK OTG 32 GB	0	\N	\N	a	3	\N	\N	\N	\N	\N
213	FLASH DISK 32 GB SANDISK	0	\N	\N	a	3	\N	\N	\N	\N	\N
214	LAPTOP LENOVO IdeaPad G41-35 -14-QUAD CORE A8 6410	0	\N	\N	a	3	\N	\N	\N	\N	\N
215	ASUS VivoBook Max X441SA  Untuk harga, ASUS membanderol Note	0	\N	\N	a	3	\N	\N	\N	\N	\N
216	deep cool mini v2	0	\N	\N	a	3	\N	\N	\N	\N	\N
217	Xiaomi mi mix	0	\N	\N	a	3	\N	\N	\N	\N	\N
219	Lenovo Tab S8 	0	\N	\N	a	3	\N	\N	\N	\N	\N
220	Samsung Galaxy Tab A With S-Pen	0	\N	\N	a	3	\N	\N	\N	\N	\N
221	LICENSE WINDOWS 8.1 PROFESIONAL 32 Bit	0	\N	\N	a	6	\N	\N	\N	\N	\N
222	LICENSE  Windows 10 32 Bit	0	\N	\N	a	6	\N	\N	\N	\N	\N
223	DVR 32 Chanel	0	\N	\N	a	2	\N	\N	\N	\N	\N
224	Mikrotik RB951UI-2HND	0	\N	\N	a	1	\N	\N	\N	\N	\N
225	Mikrotik RB941Ui-2N	0	\N	\N	a	1	\N	\N	\N	\N	\N
226	blower komputer	0	\N	\N	a	1	\N	\N	\N	\N	\N
227	Tester Accu	0	\N	\N	a	1	\N	\N	\N	\N	\N
228	TAS Kamera Thunder	0	\N	\N	a	1	\N	\N	\N	\N	\N
229	PSU FSP HEXA+ 500W	0	\N	\N	a	1	\N	\N	\N	\N	\N
230	Printer Canon iP110	0	\N	\N	a	1	\N	\N	\N	\N	\N
231	SSD Spark 256 GB	0	\N	\N	a	1	\N	\N	\N	\N	\N
232	TV 43 Inc	0	\N	\N	a	1	\N	\N	\N	\N	\N
233	Printer Epson TM-T82-304/ Antrian	0	\N	\N	a	1	\N	\N	\N	\N	\N
234	converter LPT to USB	0	\N	\N	a	1	\N	\N	\N	\N	\N
235	SODIMM DDR 2 PC 6400	0	\N	\N	a	1	\N	\N	\N	\N	\N
236	DVR 32CH HIKVISION DS-7216HQHI-K2 HYBRID	0	\N	\N	a	1	\N	\N	\N	\N	\N
237	DVR 16CH HIKVISION DS-7216HQHI-K2 HYBRID	0	\N	\N	a	1	\N	\N	\N	\N	\N
238	CPU SERVER ( AMD GODAVARI A8 ) + SSD NO HARDISK	0	\N	\N	a	1	\N	\N	\N	\N	\N
240	LAPTOP IBM (Intel Core i7 6700HQ, 16GB DDR3, 1 TB HDD, VGA N	0	\N	\N	a	1	\N	\N	\N	\N	\N
241	LAPTOP HP (Intel Core i7 6700HQ, 16GB DDR3, 1 TB HDD, VGA Nv	0	\N	\N	a	1	\N	\N	\N	\N	\N
242	LAPTOP DELL (Intel Core i7 6700HQ, 16GB DDR3, 1 TB HDD, VGA 	0	\N	\N	a	1	\N	\N	\N	\N	\N
243	Asus x454	0	\N	\N	a	1	\N	\N	\N	\N	\N
244	License Microsoft Office 2016	0	\N	\N	a	1	\N	\N	\N	\N	\N
245	Printer Epson L120	0	\N	\N	a	1	\N	\N	\N	\N	\N
246	UPS ICA 2000 VA	0	\N	\N	a	1	\N	\N	\N	\N	\N
247	SWITCH HUB 48 PORT (HP)	0	\N	\N	a	1	\N	\N	\N	\N	\N
248	MAINBOARD L120	0	\N	\N	a	1	\N	\N	\N	\N	\N
249	alat soldier	0	\N	\N	a	1	\N	\N	\N	\N	\N
250	Jack Power CCTV	0	\N	\N	a	1	\N	\N	\N	\N	\N
251	V-Gen 4GB DDR3 PC 10600	0	\N	\N	a	1	\N	\N	\N	\N	\N
252	Cpu backoffice	0	\N	\N	a	1	\N	\N	\N	\N	\N
253	Keyboard Laptop Asus X453SA	0	\N	\N	a	1	\N	\N	\N	\N	\N
254	Mini PC Gigabyte Brix SSD 4GB DDR3 + Lisensi win10	0	\N	\N	a	3	\N	\N	\N	\N	\N
255	Mikrotik RB 750 GR3	0	\N	\N	a	1	\N	\N	\N	\N	\N
256	BATERAI LAPTOP	0	\N	\N	a	1	\N	\N	\N	\N	\N
258	Mainboard Epson L220	0	\N	\N	a	1	\N	\N	\N	\N	\N
259	Kingston 4GB DDR3 SODIMM 	0	\N	\N	a	1	\N	\N	\N	\N	\N
260	Port usb printer Epson Tmu 220 	0	\N	\N	a	1	\N	\N	\N	\N	\N
261	Port lpt printer Epson Tmu 220 	0	\N	\N	a	1	\N	\N	\N	\N	\N
262	HARDDISK SEAGATE 4 TB SATA	0	\N	\N	a	1	\N	\N	\N	\N	\N
263	Visual Basic 6 Enterprise	0	\N	\N	a	1	\N	\N	\N	\N	\N
264	MEMORY KINGSTON 4 GB 12800 DDR3	0	\N	\N	a	1	\N	\N	\N	\N	\N
265	Card Wireless	0	\N	\N	a	1	\N	\N	\N	\N	\N
266	Secugen hamster plus	0	\N	\N	a	1	\N	\N	\N	\N	\N
267	Converter HDMI to VGA	0	\N	\N	a	1	\N	\N	\N	\N	\N
268	Gir Epson tmu220	0	\N	\N	a	1	\N	\N	\N	\N	\N
269	AMD Bristol Ridge A10-9700	0	\N	\N	a	1	\N	\N	\N	\N	\N
270	Gigabyte GA-A320M-HD2 AMD Socket AM4 	0	\N	\N	a	1	\N	\N	\N	\N	\N
271	Kingston KVR24N17S6/4 1x4Gb PC 2400 DDR4	0	\N	\N	a	1	\N	\N	\N	\N	\N
272	Power Logic Armageddon M1Z Black 	0	\N	\N	a	1	\N	\N	\N	\N	\N
273	Seagate SATA III 500Gb 7200RPM 3.5Inch (Garansi 2 Tahun) Int	0	\N	\N	a	1	\N	\N	\N	\N	\N
274	CPU BACKOFFICE DDR4	0	\N	\N	a	1	\N	\N	\N	\N	\N
275	Team TLRED48G3000HC16CDC01 (4GBx2) DDR4 	0	\N	\N	a	1	\N	\N	\N	\N	\N
276	CPU SERVER A10 DDR4	0	\N	\N	a	1	\N	\N	\N	\N	\N
278	Gigabyte GA-AB350N-Gaming WIFI AMD Socket AM4	0	\N	\N	a	1	\N	\N	\N	\N	\N
279	Corsair CMK16GX4M2B3200C16R (2x8Gb) Vengeance LPX PC25600 16	0	\N	\N	a	1	\N	\N	\N	\N	\N
282	Samsung 850 EVO M.2 SATA 500GB SSD	0	\N	\N	a	1	\N	\N	\N	\N	\N
283	cpu design	0	\N	\N	a	1	\N	\N	\N	\N	\N
284	Tas Eiger	0	\N	\N	a	1	\N	\N	\N	\N	\N
285	Scanner QR Wirelles	0	\N	\N	a	1	\N	\N	\N	\N	\N
286	Asf Roller Epson L220	0	\N	\N	a	1	\N	\N	\N	\N	\N
287	Kabel Belden	0	\N	\N	a	1	\N	\N	\N	\N	\N
288	Projector INFOCUS IN1 16X WXGA (1280 X 800) Native	0	\N	\N	a	1	\N	\N	\N	\N	\N
289	Scanner Canon CanoScan LiDe 120	0	\N	\N	a	1	\N	\N	\N	\N	\N
290	Rb 850 gx2 Router Mikrotik	0	\N	\N	a	1	\N	\N	\N	\N	\N
257	Barcode Scanner PSCVS800	2542100	\N	\N	a	1	\N	\N	\N	\N	\N
281	Corsair CX750M (9020061-EU) 750W CXM Series (Modular)	250000	\N	\N	a	1	\N	\N	\N	\N	\N
218	Advance I7	850000	\N	\N	a	3	\N	\N	\N	\N	\N
239	autocutter TMU 220	320000	\N	\N	a	1	\N	\N	\N	\N	\N
277	AMD Bristol Ridge A12-9800 	1200000	\N	\N	a	1	\N	\N	\N	\N	\N
291	Microsoft visio Standard 2016	0	\N	\N	a	1	\N	\N	\N	\N	\N
292	Surge Arrester Ubitiqui	0	\N	\N	a	1	\N	\N	\N	\N	\N
293	Laptop Asus X441UA Core i3 Custom RAM 8GB	0	\N	\N	a	1	\N	\N	\N	\N	\N
294	Laptop Asus X441UA Core i3 Custom RAM 8GB	0	\N	\N	a	1	\N	\N	\N	\N	\N
295	Mini PC Gigabyte Brix SSD 4GB DDR3 (hanya mini PC)	0	\N	\N	a	1	\N	\N	\N	\N	\N
296	LED TV 32 inch	0	\N	\N	a	1	\N	\N	\N	\N	\N
297	Cooler Fan Laptop	0	\N	\N	a	1	\N	\N	\N	\N	\N
298	Screen Protector	0	\N	\N	a	1	\N	\N	\N	\N	\N
299	Ethernet Surge Protector	0	\N	\N	a	1	\N	\N	\N	\N	\N
300	Toto Link N300RH	0	\N	\N	a	1	\N	\N	\N	\N	\N
301	Toto Link CP300	0	\N	\N	a	1	\N	\N	\N	\N	\N
302	TP-Link WR-841HP	0	\N	\N	a	1	\N	\N	\N	\N	\N
304	CASING HARDISK EKSTERNAL SATA	0	\N	\N	a	1	\N	\N	\N	\N	\N
306	Tang Krimping Tekiro	0	\N	\N	a	1	\N	\N	\N	\N	\N
307	TESPEN TEKIRO	0	\N	\N	a	1	\N	\N	\N	\N	\N
308	MAINBOARD EPSON L360	0	\N	\N	a	1	\N	\N	\N	\N	\N
309	MIKROTIK RB-1100	0	\N	\N	a	1	\N	\N	\N	\N	\N
310	PC Server HP Proliant ML350 G9-263 (intel Xeon E5 2620v4, 16	0	\N	\N	a	1	\N	\N	\N	\N	\N
311	Tang Lancip	0	\N	\N	a	1	\N	\N	\N	\N	\N
312	Obeng Plus Tekiro	0	\N	\N	a	1	\N	\N	\N	\N	\N
313	Lan Tester Nankai	0	\N	\N	a	1	\N	\N	\N	\N	\N
314	Penyambung Kabel VGA Female - Female (Konektor VGA F-F)	0	\N	\N	a	1	\N	\N	\N	\N	\N
315	KABEL VGA 1 MALE - 2 FEMALE / KABEL VGA SPLITTER	0	\N	\N	a	1	\N	\N	\N	\N	\N
316	Bor Beton Ryu	0	\N	\N	a	1	\N	\N	\N	\N	\N
317	LED Touch Screen 16 Inch	0	\N	\N	a	1	\N	\N	\N	\N	\N
318	TANG KOMBINASI	0	\N	\N	a	1	\N	\N	\N	\N	\N
319	STABILLIZER 10000 V	0	\N	\N	a	1	\N	\N	\N	\N	\N
320	VGA HIS R7 250	0	\N	\N	a	1	\N	\N	\N	\N	\N
321	UPS ICA 3000 VA	0	\N	\N	a	1	\N	\N	\N	\N	\N
322	Lan card Intel server dell	0	\N	\N	a	1	\N	\N	\N	\N	\N
323	Memory vgen 8GB Ddr3	0	\N	\N	a	1	\N	\N	\N	\N	\N
324	LAPTOP ASUS X454YA AMD A8-7410	0	\N	\N	a	1	\N	\N	\N	\N	\N
325	Monitor Touchscreen Pioneer 15.6 inch	0	\N	\N	a	1	\N	\N	\N	\N	\N
326	MONITOR FORSA LS 1701 TOUCHSCREEN	0	\N	\N	a	1	\N	\N	\N	\N	\N
327	Scanner QR Code	0	\N	\N	a	1	\N	\N	\N	\N	\N
328	MEMORY KINGSTON 8GB DDR4	0	\N	\N	a	1	\N	\N	\N	\N	\N
329	Hdd server 1 TB	0	\N	\N	a	1	\N	\N	\N	\N	\N
330	KEYBOARD USB LOGITECH K120	0	\N	\N	a	1	\N	\N	\N	\N	\N
331	Samsung 860 EVO M.2 Sata 250 GB SSD	0	\N	\N	a	1	\N	\N	\N	\N	\N
332	FLASDISK KINGSTON 64GB USB 3	0	\N	\N	a	1	\N	\N	\N	\N	\N
333	MINI PC Zotac Ram 4GB DDR 3 + Licensi windows 10 64 Bit	0	\N	\N	a	1	\N	\N	\N	\N	\N
334	PEMASANGAN INTERNET BANDWITH	0	\N	\N	a	1	\N	\N	\N	\N	\N
335	BARANG IT UNTUK PEMBUKAAN APOTEK BARU	0	\N	\N	a	1	\N	\N	\N	\N	\N
336	KONEKTOR RJ45	0	\N	\N	a	1	\N	\N	\N	\N	\N
337	PCI INTEL GIGABIT	0	\N	\N	a	1	\N	\N	\N	\N	\N
338	POWER SUPPLY CCTV	0	\N	\N	a	1	\N	\N	\N	\N	\N
339	MEMORY KINGSTON 8 GB  DDR3	0	\N	\N	a	1	\N	\N	\N	\N	\N
340	PCI LAN CARD D-LINK 10/100/1000 MB	0	\N	\N	a	1	\N	\N	\N	\N	\N
341	SSD 120 GB 	0	\N	\N	a	1	\N	\N	\N	\N	\N
342	VGA PCI EXPRESS	0	\N	\N	a	1	\N	\N	\N	\N	\N
343	buku tutorial	0	\N	\N	a	1	\N	\N	\N	\N	\N
344	BUKU TUTORIAL SERVER LINUX	0	\N	\N	a	1	\N	\N	\N	\N	\N
345	BUKU PAKET TUTORIAL MIKROTIK	0	\N	\N	a	1	\N	\N	\N	\N	\N
346	SSD 500GB	0	\N	\N	a	1	\N	\N	\N	\N	\N
347	POWER SUPPLY CORSAIR 550	0	\N	\N	a	1	\N	\N	\N	\N	\N
348	ASUS ROG STRIX GL503GE-EN129T i7 8750H/8GB/1TB+128GB/GTX1050	0	\N	\N	a	1	\N	\N	\N	\N	\N
349	LAPTOP ACER ASPIRE E5-475G, PROCESSOR INTEL CORE i7-7500U (r	0	\N	\N	a	1	\N	\N	\N	\N	\N
350	PSU 400 VA Pure	0	\N	\N	a	1	\N	\N	\N	\N	\N
351	BUKU FRAMEWORK CODE IGNITER 3	0	\N	\N	a	1	\N	\N	\N	\N	\N
352	BUKU PEMROGRAMAN WEB DENGAN PHP 7	0	\N	\N	a	1	\N	\N	\N	\N	\N
353	Mini PC Gigabyte Brix SSD 4GB DDR3	0	\N	\N	a	1	\N	\N	\N	\N	\N
354	Linksys VoIP pp2tp	0	\N	\N	a	1	\N	\N	\N	\N	\N
355	Notebook 11.6 inchi quad core ram 4 GB HDD 500 GB	0	\N	\N	a	1	\N	\N	\N	\N	\N
356	linksys voip router	0	\N	\N	a	1	\N	\N	\N	\N	\N
357	alcatel telephony	0	\N	\N	a	1	\N	\N	\N	\N	\N
358	BUKU PEMROGRAMAN ANDROID STUDIO IDE	0	\N	\N	a	1	\N	\N	\N	\N	\N
359	Tp link wireless adapter 150 Mbps	0	\N	\N	a	1	\N	\N	\N	\N	\N
360	USB NIC Wireless	0	\N	\N	a	1	\N	\N	\N	\N	\N
361	DVR AHD 32 CHANNEL 	0	\N	\N	a	1	\N	\N	\N	\N	\N
362	Switch HUB 16 Port D-Link	0	\N	\N	a	1	\N	\N	\N	\N	\N
363	MONITOR FORSA 12" inch TOUCHSCREEN	0	\N	\N	a	1	\N	\N	\N	\N	\N
364	Laptop Asus A455LA core i3 5005U 4GB hardisk 500GB	0	\N	\N	a	1	\N	\N	\N	\N	\N
365	Ink Pads Epson L110/L210	0	\N	\N	a	1	\N	\N	\N	\N	\N
366	cpu server core i3	0	\N	\N	a	1	\N	\N	\N	\N	\N
367	Camera Hiviksion Indoor 5Mp	0	\N	\N	a	1	\N	\N	\N	\N	\N
368	Camera Hikvision Outdoor 5Mp	0	\N	\N	a	1	\N	\N	\N	\N	\N
369	CPU Server Non SSD	0	\N	\N	a	1	\N	\N	\N	\N	\N
370	Gigabyte H81M	0	\N	\N	a	1	\N	\N	\N	\N	\N
371	Camera hikvision 3 MP (Indoor)	0	\N	\N	a	1	\N	\N	\N	\N	\N
372	Camera hikvision 3 MP (Outdoor)	0	\N	\N	a	1	\N	\N	\N	\N	\N
373	Baterai HP Notebook 14-an004AU	0	\N	\N	a	1	\N	\N	\N	\N	\N
374	Logitech MK215 wireless keyboard mouse	0	\N	\N	a	1	\N	\N	\N	\N	\N
375	Baterai Laptop ASUS x453s	0	\N	\N	a	1	\N	\N	\N	\N	\N
376	RAM 4GB DDR3 Laptop ASUS x453s	0	\N	\N	a	1	\N	\N	\N	\N	\N
377	Gear rda Epson tmu 220	0	\N	\N	a	1	\N	\N	\N	\N	\N
378	LAPTOP HP Pavilion (X36 11 AD107TU i3 8130 8GB 1TB, Win 10 T	0	\N	\N	a	1	\N	\N	\N	\N	\N
379	LAPTOP HP Pavilion (X36 11 AD107TU i3 8130 8GB 1TB, Win 10 T	0	\N	\N	a	1	\N	\N	\N	\N	\N
380	Printer L1800	0	\N	\N	a	1	\N	\N	\N	\N	\N
381	port lan epson tmu	0	\N	\N	a	1	\N	\N	\N	\N	\N
382	Intel i3-9100F 3.6 Ghz chache 6Mb	0	\N	\N	a	1	\N	\N	\N	\N	\N
383	Gigabyte GA-H110M-S2PH DDR4	0	\N	\N	a	1	\N	\N	\N	\N	\N
384	CORSAIR CMK4GX4M1A2400C14R (1X4GB)	0	\N	\N	a	1	\N	\N	\N	\N	\N
385	KOMPUTER RAKITAN CORE I3 DDR4	0	\N	\N	a	1	\N	\N	\N	\N	\N
386	computer server core i3	0	\N	\N	a	1	\N	\N	\N	\N	\N
387	Repeater Wifi (TP-LINK)	0	\N	\N	a	1	\N	\N	\N	\N	\N
388	Battery ASUS A41-X550A	0	\N	\N	a	1	\N	\N	\N	\N	\N
389	Mini PC for office	0	\N	\N	a	1	\N	\N	\N	\N	\N
390	TV samsung 45"	0	\N	\N	a	1	\N	\N	\N	\N	\N
391	TV samsung 54"	0	\N	\N	a	1	\N	\N	\N	\N	\N
392	Kabel HDMI 15 Meter	0	\N	\N	a	1	\N	\N	\N	\N	\N
393	Mini pc Antrian New	0	\N	\N	a	1	\N	\N	\N	\N	\N
394	Lenovo IP 130 i3 7020U ram 8gb 256ssd	0	\N	\N	a	1	\N	\N	\N	\N	\N
395	ASUS Vivobook S330FA - i5 8265U 4GB 256GB Win 10 (p.mujib)	0	\N	\N	a	1	\N	\N	\N	\N	\N
396	Corsair 8 GB DDR3	0	\N	\N	a	1	\N	\N	\N	\N	\N
397	MIkrotik RB450 Gigabit	0	\N	\N	a	1	\N	\N	\N	\N	\N
398	Charger Laptop ASUS X454Y	0	\N	\N	a	1	\N	\N	\N	\N	\N
399	Batray laptop ASUS X454Y	0	\N	\N	a	1	\N	\N	\N	\N	\N
400	SSD Samsung 860 250GB	0	\N	\N	a	1	\N	\N	\N	\N	\N
401	Mikrotik RB450G	0	\N	\N	a	1	\N	\N	\N	\N	\N
402	Intel core i5 4460 3.2 GHz 1150 socket	0	\N	\N	a	1	\N	\N	\N	\N	\N
403	CPU server core i5	0	\N	\N	a	1	\N	\N	\N	\N	\N
404	Main Motherboard UPS APC SURT10000XLI (10KVA), S/N : QS14081	0	\N	\N	a	1	\N	\N	\N	\N	\N
142	AMD GODAVARI A10 -7860K FM2 +WITH 65W QUIET COOLER (Radeon R7 Series) 3,6 Ghz Cache 2x2MB 65W AMD FM2	1250000	\N	\N	a	3	\N	\N	\N	\N	\N
280	Gigabyte R7 370 2Gb 256Bit DDR5 (GV-R737WF2OC-2GD) Ati Radeon PCI Exp.	0	\N	\N	a	1	\N	\N	\N	\N	\N
405	Control Motherboard UPS APC SURT10000XLI (10  KVA), S/N:QS14	320000	\N	\N	a	1	\N	\N	\N	\N	\N
406	ACER PREDATOR NITRO 5 AN515 RYZEN5-3550H/8GB/512GB SSD/RX 560X 4GB	9699000	\N	\N	\N	3	\N	\N	\N	\N	\N
076	BARCODE SCANNER SYMBOL LS2208	229000	\N	\N	a	3	\N	\N	\N	\N	\N
305	Adaptor Laptop Asus 	210000	\N	\N	a	1	\N	\N	\N	\N	\N
407	UPS LAPLACE TRIDENT 850 LINE INTERACTIVE UPS WITH AVR	400000	\N	\N	\N	1	\N	\N	\N	\N	\N
004	BATERAI UPS NON PANASONIC	400000	\N	\N	a	7	\N	\N	\N	\N	\N
303	BATERAI LAPTOP A450L	200000	\N	\N	a	1	\N	\N	\N	\N	\N
\.


--
-- Data for Name: master_cabang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_cabang (id_cabang, nm_cabang, alamat, area, id_bm, status_cabang) FROM stdin;
00	PUSAT DISTRIBUSI	\N	001	\N	a
01	AP.ROXY BIAK	\N	001	\N	a
02	AP.ROXY PADEMANGAN	\N	001	\N	a
03	AP.ROXY TNH.PASIR	\N	001	\N	a
04	AP.ROXY JATIBARU	\N	001	\N	a
05	AP.ROXY TJ.DUREN	\N	001	\N	a
06	AP.ROXY JAKASAMPURNA	\N	003	\N	a
07	AP.ROXY POLTANGAN	\N	002	\N	a
08	AP.ROXY KLENDER	\N	003	\N	a
09	AP.ROXY DEPOK	\N	002	\N	a
10	AP.ROXY PD.CABE	\N	002	\N	a
11	AP.ROXY KEAMANAN	\N	001	\N	a
12	AP.ROXY BERINGIN	\N	004	\N	a
14	AP.ROXY MANGGA BESAR	\N	001	\N	a
16	AP.ROXY MAUK	\N	004	\N	a
17	AP.ROXY CINANGKA	\N	002	\N	a
19	AP.ROXY JAGAKARSA	\N	002	\N	a
20	AP.ROXY PD.LABU	\N	002	\N	a
21	AP.ROXY PD.UNGU	\N	003	\N	a
22	AP.ROXY TELUK GONG	\N	001	\N	a
23	AP.ROXY CONDET	\N	002	\N	a
24	AP.ROXY MENDUT	\N	004	\N	a
25	AP.ROXY CILEDUG	\N	004	\N	a
26	AP.ROXY JATI KRAMAT	\N	003	\N	a
27	AP.ROXY RAWA KALONG	\N	003	\N	a
28	AP.ROXY SEROJA	\N	003	\N	a
29	AP.ROXY PAHLAWAN	\N	003	\N	a
30	AP.ROXY MEKAR SARI	\N	003	\N	a
31	AP.ROXY PAMULANG	\N	002	\N	a
32	AP.ROXY KALI ABANG	\N	003	\N	a
33	AP.ROXY UJUNG HARAPAN	\N	003	\N	a
34	AP.ROXY PERWIRA	\N	003	\N	a
35	AP.ROXY SAWANGAN	\N	002	\N	a
37	AP.ROXY PUP	\N	003	\N	a
38	AP.ROXY PITARA	\N	002	\N	a
39	AP.ROXY KEBALEN	\N	003	\N	a
15	AP.ROXY HASYIM ASHARI	Jl. Hashim Ashari no. 48A, RT.3/RW.1, Duri Pulo, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10140	001	\N	a
18	AP.ROXY GALAXY		003	\N	a
99	AP.ROXY TEST		003	\N	n
36	AP.ROXY BABELAN		003	\N	a
13	AP.ROXY AAN-MAAK		001	\N	a
\.


--
-- Data for Name: master_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_department (id_department, nama_department) FROM stdin;
Dept01	Accounting
Dept02	Building
Dept03	Finance
Dept04	HRD & GA
Dept05	IT
Dept06	Operasional
Dept08	Tax
Dept09	Audit
Dept10	Legal
Dept11	Director
Dept12	Secretary
Dept07	Pusdis
\.


--
-- Data for Name: master_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_kategori (id_kategori, nm_kategori) FROM stdin;
1	-
2	CCTV
3	Komputer
4	Printer
5	LAN
6	License
7	Tools
\.


--
-- Data for Name: master_supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_supplier (id_supplier, nm_supplier, telp, alamat, email, status_supplier) FROM stdin;
SUP002	PT. United Jaya Komputindo		Mangga Dua	\N	a
SUP003	PT. Global Tekno		Mangga Dua	\N	a
SUP004	Toko Komputer		Harco mangga dua	\N	a
SUP005	Immaco Electronic		Jakarta	\N	a
SUP008	SSC Computer	085775123807	Mangga Dua Mall	\N	a
SUP009	Yuri computer		Jakarta	\N	a
SUP010	Aneka Elektronik	021-6019410	Komplek harco mangga dua Plaza	\N	a
SUP011	Eiger	0210000	Margonda Raya Depok	\N	a
SUP013	Sinar Abadi Print	0	Jakarta	\N	a
SUP015	Asaba Computer Center	0	Jakarta	\N	a
SUP016	Sofkey	021 22634771	JAKARTA	\N	a
SUP017	Buka Lapak		Jakarta	\N	a
SUP019	Maru Maru Com	021-5490826	Jl. K.H. Syahdan No.78	\N	a
SUP020	Mandiri Teknik		LTC Glodok Lt.GC - Jakarta Pusat	\N	a
SUP021	Borneo Print	6003655	Harco mangga dua	\N	a
SUP022	PT. REMALA	021 83709136	Jl. Raya Komsen No.73A Jati Asih, Bekasi	\N	a
SUP023	S Mangga Dua Mall	02193091733	Jalan Arteri, Jl. Mangga Dua Raya No.1, RT.1/RW.12, Mangga Dua Sel., Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota	\N	a
SUP024	Infosys Technology	(021) 62303858	Mangga Dua Mall, Lt. 5, Blok C, No. 191-192, Jl. Mangga Dua Raya, RT.1/RW.12, Mangga Dua Sel., Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10730	\N	a
SUP025	Aneka jaya Komputindo	021-6014340-601	Plaza Harco Mangga Dua Blok B1 LT.1 No.38	\N	a
SUP026	Gudang Power tools	11111	Tokopedia	\N	a
SUP027	Jaya PC	275481927	Unicorn	\N	a
SUP028	cilsy.id	1111	Market place	\N	a
SUP001	PT. ADF	082141948	Jl. Gunung sahari	\N	a
SUP007	PT. Solusi Corporindo Teknologi		Jakarta	\N	a
SUP018	ACC Komputer.com		Jakarta	victoryal.amoe@gmail.com	a
SUP012	Aneka Citra Service Computer	 0216129375	Mangga Dua Plaza (Electronic Super Store)\r\nLt. 2 Blok B 2 N0. 36\r\nJakarta Pusat	me@fitrahramadhan.web.id	a
SUP014	Abadi Electric	0	Jakarta	fitrah.amo@gmail.com	a
SUP006	PT. HPS		Jakarta	\N	a
\.


--
-- Data for Name: master_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_support (id_support, nm_support, id_user, status, area) FROM stdin;
SPT001	Moch khalimnudin	US0113	a	001
SPT002	Sutarno    	US0036	a	003
SPT003	Ardian Widiansyah 	US0043	a	002
SPT004	Frans L  	US0067	a	004
SPT005	Suhendar    	US0049	a	001
SPT006	AAN	US0112	a	003
SPT007	Iwan   	US0056	a	001
SPT008	Lia Ristiyanti	US0090	d	001
\.


--
-- Data for Name: master_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_user (id_user, username, real_name, password, level, id_cabang, ttd, titel, email, id_department, status_user) FROM stdin;
US0059	Outlet026	Yuni Gunayantri	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	26	1583304747.jpeg	Manager	\N	Dept06	a
US0002	mujib	abdul mujib  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	15	US0002.png	Manager	\N	Dept05	a
US0001	admin	administator              	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-3	15	\N	Manager	\N	Dept05	a
US0004	yeni	Yeni Handayani 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept06	a
US0016	febrit	Febrit E 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	15	\N	Manager	\N	Dept07	a
US0019	cosmas	Cosmas W 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept04	a
US0024	rizal	Rizal Primana 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept08	a
US0025	riskidesain	Riski P 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept06	a
US0026	rudi	Syahrudianto 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept08	a
US0029	jojo	Jojo 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	Staff	\N	Dept07	a
US0031	Outlet030	Essy Ratna    	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	30	\N	Manager	\N	Dept06	a
US0033	santy	Santy 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	SPV	\N	Dept07	a
US0037	Outlet029	Diana Sari  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	29	\N	Manager	\N	Dept06	a
US0038	sarahs	Sarah Noer Zain 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Manager	\N	Dept03	a
US0042	amir	Amir Khoerudin  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	SPV	\N	Dept09	a
US0046	iman_s	Iman Setiawan 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Directo	\N	Dept06	a
US0048	yanti_finance	Yanti 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept03	a
US0050	yani	Sumaryani 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	Staff	\N	Dept07	a
US0051	outlet015	Imam Kusaeri	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	Manager	\N	Dept06	a
US0052	outlet016	Adida pakpahan	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	16	\N	Manager	\N	Dept06	a
US0053	irwangudang	irwan e  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	SPV	\N	Dept07	a
US0054	Apriana	Apriana 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept03	a
US0056	iwan	Iwan   	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	1580183868.png	Staff	\N	Dept05	a
US0057	imampusdis	IMAM S 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	Staff	\N	Dept07	a
US0058	Outlet012	FERI FADLIN,S.FARM.,APT	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	12	\N	Manager	\N	Dept06	a
US0060	usnahdini	usnahdini 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	04	\N	Staff	\N	Dept06	a
US0045	deniel	Deniel Septian Akbar    	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	US0045.png	Manager	\N	Dept04	a
US0005	Outlet015	Yuniar Kurniasih S.Si,Apt           	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	US0005.png	Manager	\N	Dept06	a
US0006	meli	Riyati Meliani  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	US0006.png	Staff	\N	Dept04	a
US0007	Outlet014	Siti Nuraisyah	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	14	US0007.png	Manager	\N	Dept06	a
US0008	Outlet005	Wenny Rajati Latif  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	05	US0008.png	Manager	\N	Dept06	a
US0009	Outlet023	Deni Wardani    	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	23	US0009.png	Manager	\N	Dept06	a
US0011	Outlet002	Wiwiek P 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	02	US0011.png	Manager	\N	Dept06	a
US0013	Outlet003	Lumora Sitorus	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	03	US0013.png	Manager	\N	Dept06	a
US0010	Outlet001	Sugeng Hariyono               	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	US0010.png	Manager	\N	Dept06	a
US0014	Outlet025	Widia Kirana	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	25	US0014.png	Manager	\N	Dept06	a
US0015	Outlet018	Imam Kusaeri	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	18	US0015.png	Manager	\N	Dept06	a
US0017	Outlet028	sam lidya	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	28	US0017.png	Manager	\N	Dept06	a
US0018	Outlet004	Lina 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	04	US0018.png	Manager	\N	Dept06	a
US0021	Outlet020	Sirojudin	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	20	US0021.png	Manager	\N	Dept06	a
US0022	outlet022	Widya Ayu Lestari	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	22	US0022.png	Manager	\N	Dept06	a
US0023	Outlet010	RENDY RADITIYA	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	10	US0023.png	Manager	\N	Dept06	a
US0027	Outlet019	Yuniar Kurniasih	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	19	US0027.png	Manager	\N	Dept06	a
US0032	Outlet032	Nita Bonita	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	32	US0032.png	Manager	\N	Dept06	a
US0034	Outlet031	Hanifah 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	31	US0034.png	Manager	\N	Dept06	a
US0035	Outlet027	Camelia Puspa	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	27	US0035.png	Manager	\N	Dept06	a
US0039	Outlet007	Imamsyah  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	07	US0039.png	Manager	\N	Dept06	a
US0041	outlet017	Izzurani Abdullah	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	17	US0041.png	Manager	\N	Dept06	a
US0044	Outlet006	Amalia Olivia	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	06	US0044.png	Manager	\N	Dept06	a
US0047	Outlet034	Lidia	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	34	US0047.png	Manager	\N	Dept06	a
US0062	franst	Frans Timotius     	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Kadiv	\N	Dept04	a
US0063	outlet024	ikhwani 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	24	\N	Staff	\N	Dept06	a
US0064	eka_finance	Eka Widyaningsih	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	SPV	\N	Dept03	a
US0065	bernard	bernat angga wisesa    	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	Staff	\N	Dept05	a
US0066	Hidayatullah	Hidayatullah  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	15	\N	Manager	\N	Dept07	a
US0067	frans	Frans L  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	16	\N	SPV	\N	Dept05	a
US0068	wawang	Wawang Setiawan  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Manager	\N	Dept06	a
US0069	siti	Siti Mafiyah	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept04	a
US0070	sari	Apriyanti Apsari 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept02	a
US0003	ena	Ena Rosmawati   	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	US0003.png	Staff	\N	Dept12	a
US0040	Outlet009	Fatmawati Fuji Astutiningsih	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	09	US0040.png	Manager	\N	Dept06	a
US0036	sutarno	Sutarno    	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	36	1581297373.jpeg	Staff	\N	Dept05	a
US0061	Outlet008	Windayani	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	08	1579486585.png	Manager	\N	Dept06	a
US0043	dian	Ardian Widiansyah 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	09	1581756689.jpeg	Staff	\N	Dept05	a
US0071	esta	Esta Dina 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept01	a
US0074	lufi	Lufiansyah  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	SPV	\N	Dept02	a
US0075	filsa	Filsafah Triharyanti 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	SPV	\N	Dept04	a
US0076	irma	Irma Koerniasih 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept04	a
US0077	outlet033	Sakti Prakasa Dwi Putra 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	33	\N	Manager	\N	Dept06	a
US0078	tito	Tito 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept10	a
US0079	wiharto	wiharto	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept10	a
US0080	Outlet035	Novita Fitri	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	35	\N	Manager	\N	Dept06	a
US0081	Jony	Jony Haryanto 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept03	a
US0083	Herni	Herni Puji Lestari  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept03	a
US0084	Rahmah	Rahmah Daniar 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept03	a
US0085	Sopian	Sopian Hadi   	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept03	a
US0086	andik	Andik Ardianto   	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	15	\N	Manager	\N	Dept09	a
US0087	Sinta	Sinta Fitri Puji Rahayu	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept01	a
US0088	teguh	Teguh Kurnia Sandi	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	Staff	\N	Dept05	a
US0089	Zainal	Zainal Muttaqin	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept02	a
US0090	lia	Lia Ristiyanti	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-3	15	\N	Staff	\N	Dept05	a
US0091	fajar	Fajar Mulya	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Staff	\N	Dept01	a
US0092	wilton	Wilton Huwanusa	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept01	a
US0093	yanti	yanti	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Staff	\N	Dept03	a
US0094	virgo	Virgo Akbar   	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept03	a
US0095	subhan	Subhan Muklis    	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-3	15	\N	Staff	\N	Dept05	a
US0096	amir1	Amir 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	SPV	\N	Dept09	a
US0097	test	test baru	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	\N	\N	Staff	\N	Dept07	a
US0098	dewi	Tri Dewi     	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-3	15	\N	Staff	\N	Dept05	a
US0099	outlet011	Ridwan Arifin   	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	11	\N	Manager	\N	Dept06	a
US0100	outlet036	achmad agus bayhaqie	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	36	\N	Manager	\N	Dept06	a
US0101	outlet038	Willy Andriady	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	38	\N	Manager	\N	Dept06	a
US0102	outlet037	Bratha Dwijayanto   	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	21	\N	Manager	\N	Dept06	a
US0103	Irwan	Irwan Dwi Priambudi     	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept02	a
US0105	outlet039	Hendro Sri Ramadhan	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	39	\N	Manager	\N	Dept06	a
US0106	Tia	Ristianingsih 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	01	\N	Manager	\N	Dept06	a
US0107	andre	Andre Rayadi	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept04	a
US0109	coslab	Epita edy w	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	\N	Manager	\N	Dept10	a
US0110	herman	Suherman 	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	Staff	\N	Dept07	a
US0112	aan	AAN	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	26	1580187774.jpeg	Staff	\N	Dept05	a
US0049	hendar	Suhendar    	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	1580369365.jpeg	Staff	\N	Dept05	a
US0113	Alim	Moch khalimnudin	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	1581756833.jpeg	Staff	\N	Dept05	a
US0111	andika	Andika	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	1582181471.jpeg	Manager	\N	Dept04	a
US0108	ERIYANTI	ERIYANTI DEPARI   	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	\N	Admin	\N	Dept05	a
US0104	Rudolf	Rudolf Gultom  	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-2	01	1580191932.jpeg	Manager	\N	Dept06	a
US0072	outlet013	AAN-MAAK	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	13	1583978195.jpeg	Manager	\N	Dept06	a
US0114	fitrah	Fitrah Ramadhan	7c4a8d09ca3762af61e59520943dc26494f8941b	Level-1	15	1583067020.jpeg	Staff	\N	Dept05	a
\.


--
-- Data for Name: trans_bidding_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_bidding_detail (id_bidding_detail, id_barang, id_supplier, harga, id_bidding, id_barang_ganti, nama_barang_ganti) FROM stdin;
15860728421	123	SUP014	250000	BID-202004-001	\N	\N
15860728422	277	SUP014	1200000	BID-202004-001	\N	\N
15860728423	303	SUP014	200000	BID-202004-001	\N	\N
15860728860	004	SUP018	380000	BID-202004-001	\N	\N
15860728861	123	SUP018	225000	BID-202004-001	\N	\N
15860728862	277	SUP018	1210000	BID-202004-001	\N	\N
15860728863	303	SUP018	210000	BID-202004-001	\N	\N
15864256360	076	SUP014	230000	BID-202004-002	\N	\N
15864256361	305	SUP014	200000	BID-202004-002	\N	\N
15864256580	076	SUP018	229000	BID-202004-002	\N	\N
15864256581	305	SUP018	210000	BID-202004-002	\N	\N
15864256920	076	SUP012	230050	BID-202004-002	\N	\N
15864256921	305	SUP012	200000	BID-202004-002	\N	\N
15860728420	004	SUP014	400000	BID-202004-001	407	UPS LAPLACE TRIDENT 850 LINE INTERACTIVE UPS WITH AVR
15867532210	003	SUP014	200000	BID-202004-003	\N	\N
15867533290	003	SUP018	210000	BID-202004-003	\N	\N
\.


--
-- Data for Name: trans_bidding_header; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_bidding_header (id_bidding, create_time, expired_time) FROM stdin;
BID-202004-001	2020-04-05 14:45:59	2020-04-05 14:48:00
BID-202004-002	2020-04-09 16:34:24	2020-04-10 16:34:00
BID-202004-003	2020-04-13 11:45:17	2020-04-13 11:00:00
\.


--
-- Data for Name: trans_bidding_supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_bidding_supplier (id_bidding_supplier, id_supplier, id_bidding, email, send_success, link_form) FROM stdin;
15860727590	SUP014	BID-202004-001	fitrah.amo@gmail.com	n	6a9fcc49cc0b8a9c812c32667f66f08c502b5135
15860727591	SUP018	BID-202004-001	victoryal.amoe@gmail.com	n	b7084b6a72184f22326127f8bf726ce982600409
15864248680	SUP014	BID-202004-002	fitrah.amo@gmail.com	y	4119d25f676ab2623a9bcb1ba85b902e2fbde6d2
15864248711	SUP018	BID-202004-002	victoryal.amoe@gmail.com	y	b3e0f5412c908fe30ad08ba0d7a28c23c75aca44
15864248752	SUP012	BID-202004-002	me@fitrahramadhan.web.id	y	b8ee40d9be8c6d9d16a85646cae86bc82cf1d433
15864248793	SUP006	BID-202004-002	test@gmail.com	y	3904ba963dd3f417146a0de82f8943f1e5194ab6
15867531230	SUP014	BID-202004-003	fitrah.amo@gmail.com	y	bcb80d03acae85abfcfdeca07184d62a1cdee59b
15867531271	SUP018	BID-202004-003	victoryal.amoe@gmail.com	y	9ce2283deddce5c217c769edc262d3b9072c3de0
\.


--
-- Data for Name: trans_delivery_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_delivery_detail (id_delivery, id_pr, id_barang, item_po, qty, ket, ck) FROM stdin;
\.


--
-- Data for Name: trans_delivery_header; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_delivery_header (id_delivery, pengirim, tgl_delivery, keterangan, status, sub_department, ttd_pengirim, ttd_penerima, penerima, tgl_terima) FROM stdin;
\.


--
-- Data for Name: trans_lpb_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_lpb_detail (no_po, id_po, id_pr, id_barang, qty, harga, ket, ck, no_lpb, tgl_lpb) FROM stdin;
\.


--
-- Data for Name: trans_po_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_po_detail (id_po_detail, id_po, id_pr, id_barang, qty, harga, ket, ck, no_lpb, ap) FROM stdin;
15866962860	005547	\N	407	4	400000	\N	\N	\N	\N
15866962861	005547	\N	277	3	1200000	\N	\N	\N	\N
15866962862	005547	\N	303	1	200000	\N	\N	\N	\N
15867535470	005548	\N	003	2	210000	\N	\N	\N	\N
\.


--
-- Data for Name: trans_po_header; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_po_header (id_po, id_depart, nm_depart, tgl_po, ket_po, id_user, dept, id_cabang, titel, ttd, dikirim, syarat_pembayaran, total, po_approve_1, po_approve_time_1, po_ttd_1, po_titel_1, po_approve_status_1, po_approve_2, po_approve_time_2, po_ttd_2, po_titel_2, po_approve_status_2, status, no_lpb, tgl_lpb, penerima, id_supplier, po_disapprove_note_1, po_disapprove_note_2) FROM stdin;
005547	Dept06	Operasional	2020-04-12		US0003	Dept12	01	Staff	US0003.png	AP.ROXY BIAK	Cash	\N	abdul mujib  	2020-04-12 20:05:18	US0002.png	Manager	a	Rudolf Gultom  	2020-04-12 20:05:49	1580191932.jpeg	Manager	a	2	\N	\N	\N	SUP014	\N	\N
005548	Dept06	Operasional	2020-04-13		US0003	Dept12	01	Staff	US0003.png	AP.ROXY BIAK	Cash	\N	abdul mujib  	2020-04-13 11:56:31	US0002.png	Manager	a	Rudolf Gultom  	2020-04-13 11:59:06	1580191932.jpeg	Manager	a	2	\N	\N	\N	SUP018	\N	\N
\.


--
-- Data for Name: trans_pr_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_pr_detail (id_pr_detail, id_pr, tgl_pr, id_barang, qty, tgl_penawaran, harga_penawaran, harga_new, keterangan, status_approve_pic, status_approve_1, status_approve_2, id_bidding_detail, id_po_detail, tgl_terima, id_support_pemasang, tgl_terima_support, tgl_pasang, id_user_approval, approval_user, rating_pemasangan, rating_pemasangan_note) FROM stdin;
2004-004-001	PR-202004-004	2020-04-05	123	4	\N	\N	0		a	a	a	15860728861	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004-002-001	PR-202004-002	2020-04-05	256	2	\N	\N	0		0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004-007-001	PR-202004-007	2020-04-13	003	2	\N	\N	400000		a	a	a	15867533290	15867535470	2020-04-13	SPT003	2020-04-13	2020-04-13	US0040	a	2	ADA AS A
2004-008-001	PR-202004-008	2020-04-24	097	3	\N	\N	0		0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004-001-003	PR-202004-001	2020-04-05	123	10	\N	\N	0		a	a	a	15860728861	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004-001-002	PR-202004-001	2020-04-05	277	3	\N	\N	0		a	a	a	15860728422	15866962861	2020-04-12	\N	\N	\N	\N	\N	\N	\N
2004-001-001	PR-202004-001	2020-04-05	004	2	\N	\N	200000		a	a	a	15860728420	15866962860	2020-04-12	\N	\N	\N	\N	\N	\N	\N
2004-005-002	PR-202004-005	2020-04-09	303	3	\N	\N	200000		d	d	d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004-006-001	PR-202004-006	2020-04-09	076	1	\N	\N	998500		a	a	a	15864256580	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004-004-002	PR-202004-004	2020-04-05	004	5	\N	\N	200000		d	d	d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004-003-002	PR-202004-003	2020-04-05	303	1	\N	\N	0		a	a	a	15860728423	15866962862	2020-04-12	SPT003	2020-04-12	2020-04-12	US0040	a	2	asdawf aw
2004-001-004	PR-202004-001	2020-04-05	316	1	\N	\N	0	 asda wda	a	d	d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004-003-001	PR-202004-003	2020-04-05	004	2	\N	\N	200000		a	a	a	15860728420	15866962860	2020-04-12	SPT003	2020-04-13	2020-04-13	US0040	a	4	
2004-005-001	PR-202004-005	2020-04-09	305	1	\N	\N	230000		a	a	a	15864256581	\N	\N	\N	\N	\N	\N	\N	\N	\N
2004-007-002	PR-202004-007	2020-04-13	257	1	\N	\N	2542100		d	d	d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: trans_pr_header; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_pr_header (id_pr, kepada, id_depart_kepada, id_support, tgl_pr, id_user, id_department_user, id_cabang, nama_cabang, ttd, titel, pr_approve_1, pr_approve_time_1, pr_ttd_1, pr_titel_1, pr_approve_2, pr_approve_time_2, pr_ttd_2, pr_titel_2, pic_approve, pic_approve_time, pic_approve_ttd, pic_titel, note_pr, status, cancel_order, id_bidding, tgl_cancel, pic_disapprove_note, pr_disapprove_note_1, pr_disapprove_note_2) FROM stdin;
PR-202004-001	Ena Rosmawati   	Dept12	SPT002	2020-04-05 11:22:34	US0061	Dept06	08	AP.ROXY KLENDER	1579486585.png	Manager	abdul mujib  	2020-04-05 14:43:02	US0002.png	Manager	Rudolf Gultom  	2020-04-05 14:44:11	1580191932.jpeg	Manager	Sutarno    	2020-04-05 14:41:51	1581297373.jpeg	Staff	ea a afsdv	5	\N	BID-202004-001	\N		asca wd	
PR-202004-004	Ena Rosmawati   	Dept12	SPT003	2020-04-05 14:39:40	US0043	Dept05	09	AP.ROXY DEPOK	1581756689.jpeg	Staff	abdul mujib  	2020-04-05 14:43:22	US0002.png	Manager	abdul mujib  	2020-04-05 14:43:43	US0002.png	Manager	Ardian Widiansyah 	2020-04-05 14:40:15	1581756689.jpeg	Staff		5	\N	BID-202004-001	\N	casc awdac		
PR-202004-005	Ena Rosmawati   	Dept12	SPT003	2020-04-09 14:33:59	US0040	Dept06	09	AP.ROXY DEPOK	US0040.png	Manager	abdul mujib  	2020-04-09 14:52:41	US0002.png	Manager	Rudolf Gultom  	2020-04-09 15:02:50	1580191932.jpeg	Manager	Ardian Widiansyah 	2020-04-09 14:49:13	1581756689.jpeg	Staff		5	\N	BID-202004-002	\N	mahal		
PR-202004-007	Ena Rosmawati   	Dept12	SPT003	2020-04-13 11:38:01	US0040	Dept06	09	AP.ROXY DEPOK	US0040.png	Manager	abdul mujib  	2020-04-13 11:40:56	US0002.png	Manager	Rudolf Gultom  	2020-04-13 11:42:47	1580191932.jpeg	Manager	Ardian Widiansyah 	2020-04-13 11:39:54	1581756689.jpeg	Staff		5	\N	BID-202004-003	\N	tes		
PR-202004-008	Ena Rosmawati   	Dept12	SPT003	2020-04-24 10:35:11	US0040	Dept06	09	AP.ROXY DEPOK	US0040.png	Manager	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	\N	\N	\N	\N	\N	\N
PR-202004-002	Ena Rosmawati   	Dept12	SPT002	2020-04-05 11:50:00	US0061	Dept06	08	AP.ROXY KLENDER	1579486585.png	Manager	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	y	\N	2020-04-05 11:50:13	\N	\N	\N
PR-202004-006	Ena Rosmawati   	Dept12	SPT002	2020-04-09 15:22:44	US0061	Dept06	08	AP.ROXY KLENDER	1579486585.png	Manager	abdul mujib  	2020-04-09 15:23:27	US0002.png	Manager	Rudolf Gultom  	2020-04-09 15:23:44	1580191932.jpeg	Manager	Sutarno    	2020-04-09 15:23:12	1581297373.jpeg	Staff		5	\N	BID-202004-002	\N			
PR-202004-003	Ena Rosmawati   	Dept12	SPT003	2020-04-05 14:38:47	US0040	Dept06	09	AP.ROXY DEPOK	US0040.png	Manager	abdul mujib  	2020-04-05 14:43:18	US0002.png	Manager	Rudolf Gultom  	2020-04-05 14:44:15	1580191932.jpeg	Manager	Ardian Widiansyah 	2020-04-05 14:40:59	1581756689.jpeg	Staff		5	\N	BID-202004-001	\N			
\.


--
-- Name: sequence_no_urut; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence_no_urut', 1, false);


--
-- Name: master_barang master_barang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_barang
    ADD CONSTRAINT master_barang_pkey PRIMARY KEY (id_barang);


--
-- Name: master_cabang master_cabang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_cabang
    ADD CONSTRAINT master_cabang_pkey PRIMARY KEY (id_cabang);


--
-- Name: master_department master_department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_department
    ADD CONSTRAINT master_department_pkey PRIMARY KEY (id_department);


--
-- Name: master_kategori master_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_kategori
    ADD CONSTRAINT master_kategori_pkey PRIMARY KEY (id_kategori);


--
-- Name: master_supplier master_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_supplier
    ADD CONSTRAINT master_supplier_pkey PRIMARY KEY (id_supplier);


--
-- Name: master_support master_support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_support
    ADD CONSTRAINT master_support_pkey PRIMARY KEY (id_support);


--
-- Name: master_user master_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_user
    ADD CONSTRAINT master_user_pkey PRIMARY KEY (id_user);


--
-- Name: trans_bidding_detail trans_bidding_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_bidding_detail
    ADD CONSTRAINT trans_bidding_detail_pkey PRIMARY KEY (id_bidding_detail);


--
-- Name: trans_bidding_header trans_bidding_header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_bidding_header
    ADD CONSTRAINT trans_bidding_header_pkey PRIMARY KEY (id_bidding);


--
-- Name: trans_delivery_header trans_delivery_header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_delivery_header
    ADD CONSTRAINT trans_delivery_header_pkey PRIMARY KEY (id_delivery);


--
-- Name: trans_lpb_detail trans_lpb_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_lpb_detail
    ADD CONSTRAINT trans_lpb_detail_pkey PRIMARY KEY (no_po);


--
-- Name: trans_po_detail trans_po_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_po_detail
    ADD CONSTRAINT trans_po_detail_pkey PRIMARY KEY (id_po_detail);


--
-- Name: trans_po_header trans_po_header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_po_header
    ADD CONSTRAINT trans_po_header_pkey PRIMARY KEY (id_po);


--
-- Name: trans_pr_detail trans_pr_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_detail
    ADD CONSTRAINT trans_pr_detail_pkey PRIMARY KEY (id_pr_detail);


--
-- Name: trans_pr_header trans_pr_header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_header
    ADD CONSTRAINT trans_pr_header_pkey PRIMARY KEY (id_pr);


--
-- Name: master_barang master_barang_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_barang
    ADD CONSTRAINT master_barang_ibfk_1 FOREIGN KEY (id_kategori) REFERENCES public.master_kategori(id_kategori) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: master_cabang master_cabang_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_cabang
    ADD CONSTRAINT master_cabang_ibfk_1 FOREIGN KEY (id_bm) REFERENCES public.master_user(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: master_support master_support_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_support
    ADD CONSTRAINT master_support_ibfk_1 FOREIGN KEY (id_user) REFERENCES public.master_user(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: master_user master_user_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_user
    ADD CONSTRAINT master_user_ibfk_1 FOREIGN KEY (id_department) REFERENCES public.master_department(id_department) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: master_user master_user_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_user
    ADD CONSTRAINT master_user_ibfk_2 FOREIGN KEY (id_cabang) REFERENCES public.master_cabang(id_cabang) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_bidding_detail trans_bidding_detail_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_bidding_detail
    ADD CONSTRAINT trans_bidding_detail_ibfk_1 FOREIGN KEY (id_bidding) REFERENCES public.trans_bidding_header(id_bidding) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_bidding_detail trans_bidding_detail_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_bidding_detail
    ADD CONSTRAINT trans_bidding_detail_ibfk_2 FOREIGN KEY (id_barang) REFERENCES public.master_barang(id_barang) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_bidding_detail trans_bidding_detail_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_bidding_detail
    ADD CONSTRAINT trans_bidding_detail_ibfk_3 FOREIGN KEY (id_supplier) REFERENCES public.master_supplier(id_supplier) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_bidding_supplier trans_bidding_supplier_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_bidding_supplier
    ADD CONSTRAINT trans_bidding_supplier_ibfk_1 FOREIGN KEY (id_supplier) REFERENCES public.master_supplier(id_supplier) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_bidding_supplier trans_bidding_supplier_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_bidding_supplier
    ADD CONSTRAINT trans_bidding_supplier_ibfk_2 FOREIGN KEY (id_bidding) REFERENCES public.trans_bidding_header(id_bidding) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_delivery_detail trans_delivery_detail_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_delivery_detail
    ADD CONSTRAINT trans_delivery_detail_ibfk_1 FOREIGN KEY (id_delivery) REFERENCES public.trans_delivery_header(id_delivery) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_delivery_detail trans_delivery_detail_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_delivery_detail
    ADD CONSTRAINT trans_delivery_detail_ibfk_2 FOREIGN KEY (id_pr) REFERENCES public.trans_pr_header(id_pr) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_delivery_detail trans_delivery_detail_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_delivery_detail
    ADD CONSTRAINT trans_delivery_detail_ibfk_3 FOREIGN KEY (id_barang) REFERENCES public.master_barang(id_barang) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_lpb_detail trans_lpb_detail_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_lpb_detail
    ADD CONSTRAINT trans_lpb_detail_ibfk_2 FOREIGN KEY (id_pr) REFERENCES public.trans_pr_header(id_pr) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_lpb_detail trans_lpb_detail_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_lpb_detail
    ADD CONSTRAINT trans_lpb_detail_ibfk_3 FOREIGN KEY (id_barang) REFERENCES public.master_barang(id_barang) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_po_detail trans_po_detail_id_barang_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_po_detail
    ADD CONSTRAINT trans_po_detail_id_barang_fkey FOREIGN KEY (id_barang) REFERENCES public.master_barang(id_barang) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_po_detail trans_po_detail_id_po_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_po_detail
    ADD CONSTRAINT trans_po_detail_id_po_fkey FOREIGN KEY (id_po) REFERENCES public.trans_po_header(id_po) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_po_detail trans_po_detail_id_pr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_po_detail
    ADD CONSTRAINT trans_po_detail_id_pr_fkey FOREIGN KEY (id_pr) REFERENCES public.trans_pr_header(id_pr) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_po_header trans_po_header_id_supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_po_header
    ADD CONSTRAINT trans_po_header_id_supplier_fkey FOREIGN KEY (id_supplier) REFERENCES public.master_supplier(id_supplier) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_po_header trans_po_header_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_po_header
    ADD CONSTRAINT trans_po_header_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.master_user(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_pr_detail trans_pr_detail_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_detail
    ADD CONSTRAINT trans_pr_detail_ibfk_1 FOREIGN KEY (id_pr) REFERENCES public.trans_pr_header(id_pr) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_pr_detail trans_pr_detail_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_detail
    ADD CONSTRAINT trans_pr_detail_ibfk_2 FOREIGN KEY (id_barang) REFERENCES public.master_barang(id_barang) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_pr_detail trans_pr_detail_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_detail
    ADD CONSTRAINT trans_pr_detail_ibfk_3 FOREIGN KEY (id_bidding_detail) REFERENCES public.trans_bidding_detail(id_bidding_detail) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_pr_detail trans_pr_detail_ibfk_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_detail
    ADD CONSTRAINT trans_pr_detail_ibfk_4 FOREIGN KEY (id_po_detail) REFERENCES public.trans_po_detail(id_po_detail) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_pr_header trans_pr_header_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_header
    ADD CONSTRAINT trans_pr_header_ibfk_1 FOREIGN KEY (id_support) REFERENCES public.master_support(id_support) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_pr_header trans_pr_header_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_header
    ADD CONSTRAINT trans_pr_header_ibfk_2 FOREIGN KEY (id_user) REFERENCES public.master_user(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_pr_header trans_pr_header_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_header
    ADD CONSTRAINT trans_pr_header_ibfk_3 FOREIGN KEY (id_department_user) REFERENCES public.master_department(id_department) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_pr_header trans_pr_header_ibfk_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_header
    ADD CONSTRAINT trans_pr_header_ibfk_4 FOREIGN KEY (id_cabang) REFERENCES public.master_cabang(id_cabang) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: trans_pr_header trans_pr_header_ibfk_5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_pr_header
    ADD CONSTRAINT trans_pr_header_ibfk_5 FOREIGN KEY (id_bidding) REFERENCES public.trans_bidding_header(id_bidding) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

