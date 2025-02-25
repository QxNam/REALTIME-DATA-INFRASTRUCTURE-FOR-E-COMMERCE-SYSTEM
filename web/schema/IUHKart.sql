--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Homebrew)

-- Started on 2024-11-15 18:01:53 +07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3579 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 3579
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 45651)
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    address_id integer NOT NULL,
    address_detail character varying(200),
    district_id integer,
    province_id integer,
    ward_id integer
);


--
-- TOC entry 225 (class 1259 OID 45650)
-- Name: addresses_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.addresses ALTER COLUMN address_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.addresses_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 45693)
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bank_accounts (
    bank_account_id integer NOT NULL,
    bank_name character varying(255),
    account_number character varying(255),
    account_holder_name character varying(255),
    branch_name character varying(255),
    vendor_id bigint NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 45692)
-- Name: bank_accounts_bank_account_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bank_accounts ALTER COLUMN bank_account_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bank_accounts_bank_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 45783)
-- Name: cart_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_products (
    cart_product_id integer NOT NULL,
    quantity integer NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT cart_products_quantity_check CHECK ((quantity >= 0))
);


--
-- TOC entry 243 (class 1259 OID 45782)
-- Name: cart_products_cart_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.cart_products ALTER COLUMN cart_product_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cart_products_cart_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 45776)
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    cart_id integer NOT NULL,
    grand_total numeric(10,2) NOT NULL,
    items_total integer NOT NULL,
    CONSTRAINT carts_items_total_check CHECK ((items_total >= 0))
);


--
-- TOC entry 241 (class 1259 OID 45775)
-- Name: carts_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.carts ALTER COLUMN cart_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.carts_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 45733)
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(50) NOT NULL,
    slug character varying(100) NOT NULL,
    category_img_url character varying(100) NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 45732)
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.categories ALTER COLUMN category_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 45701)
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    phone character varying(17),
    fullname character varying(255) NOT NULL,
    date_of_birth date,
    age smallint NOT NULL,
    avatar_url character varying(255),
    date_join date NOT NULL,
    recommend_product_ids integer[] NOT NULL,
    cart_id integer,
    user_id bigint
);


--
-- TOC entry 229 (class 1259 OID 45700)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 256 (class 1259 OID 45905)
-- Name: discounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discounts (
    discount_id integer NOT NULL,
    name character varying(100) NOT NULL,
    discount_percent numeric(5,2) NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 45904)
-- Name: discounts_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.discounts ALTER COLUMN discount_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.discounts_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 45639)
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    district_id integer NOT NULL,
    district_name character varying(50) NOT NULL,
    district_name_en character varying(50) NOT NULL,
    type character varying(30) NOT NULL,
    province_id_id integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 45638)
-- Name: districts_district_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.districts ALTER COLUMN district_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.districts_district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 258 (class 1259 OID 45911)
-- Name: order_product_discounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_product_discounts (
    product_discount_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    discount_id integer NOT NULL,
    product_id integer NOT NULL
);


--
-- TOC entry 257 (class 1259 OID 45910)
-- Name: order_product_discounts_product_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.order_product_discounts ALTER COLUMN product_discount_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_product_discounts_product_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 262 (class 1259 OID 45939)
-- Name: order_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_products (
    order_product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(12,2) NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 45938)
-- Name: order_products_order_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.order_products ALTER COLUMN order_product_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_products_order_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 260 (class 1259 OID 45931)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    order_number character varying(50) NOT NULL,
    shipping_date date NOT NULL,
    order_date date NOT NULL,
    order_status character varying(50) NOT NULL,
    order_total numeric(12,2) NOT NULL,
    address_id integer,
    customer_id bigint NOT NULL
);


--
-- TOC entry 259 (class 1259 OID 45930)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.orders ALTER COLUMN order_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 45748)
-- Name: product_images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_images (
    product_image_id integer NOT NULL,
    image_url character varying(255) NOT NULL,
    is_main boolean NOT NULL,
    product_id_id integer NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 45747)
-- Name: product_images_product_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_images ALTER COLUMN product_image_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_images_product_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 45739)
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(255) NOT NULL,
    original_price numeric(12,2) NOT NULL,
    stock integer NOT NULL,
    brand character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    product_description text NOT NULL,
    date_created date NOT NULL,
    ratings numeric(10,2) NOT NULL,
    date_add date NOT NULL,
    category_id integer NOT NULL,
    vendor_id bigint NOT NULL,
    CONSTRAINT products_stock_check CHECK ((stock >= 0))
);


--
-- TOC entry 237 (class 1259 OID 45738)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products ALTER COLUMN product_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 45633)
-- Name: provinces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.provinces (
    province_id integer NOT NULL,
    province_name character varying(50) NOT NULL,
    province_name_en character varying(50) NOT NULL,
    type character varying(30) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 45632)
-- Name: provinces_province_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.provinces ALTER COLUMN province_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.provinces_province_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 266 (class 1259 OID 45990)
-- Name: reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    review_rating integer NOT NULL,
    review_date date NOT NULL,
    review_content text NOT NULL,
    customer_id_id bigint NOT NULL,
    product_id_id integer NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 45989)
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.reviews ALTER COLUMN review_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 264 (class 1259 OID 45945)
-- Name: transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transactions (
    transaction_id integer NOT NULL,
    transation_date timestamp with time zone NOT NULL,
    total_money numeric(12,2) NOT NULL,
    status character varying(50) NOT NULL,
    customer_id bigint NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 45944)
-- Name: transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.transactions ALTER COLUMN transaction_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.transactions_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 45717)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(255) NOT NULL,
    is_customer boolean NOT NULL,
    is_vendor boolean NOT NULL,
    address_id integer
);


--
-- TOC entry 233 (class 1259 OID 45716)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 45709)
-- Name: vendors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendors (
    id bigint NOT NULL,
    name character varying(255),
    phone character varying(20),
    description text,
    logo_url character varying(100),
    date_join date NOT NULL,
    user_id bigint NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 45708)
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.vendors ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 45645)
-- Name: wards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wards (
    ward_id integer NOT NULL,
    ward_name character varying(50) NOT NULL,
    ward_name_en character varying(50) NOT NULL,
    type character varying(30) NOT NULL,
    district_id_id integer NOT NULL,
    province_id_id integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 45644)
-- Name: wards_ward_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.wards ALTER COLUMN ward_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.wards_ward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3330 (class 2606 OID 45655)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (address_id);


--
-- TOC entry 3334 (class 2606 OID 45699)
-- Name: bank_accounts bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (bank_account_id);


--
-- TOC entry 3336 (class 2606 OID 45823)
-- Name: bank_accounts bank_accounts_vendor_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_vendor_id_key UNIQUE (vendor_id);


--
-- TOC entry 3371 (class 2606 OID 45788)
-- Name: cart_products cart_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_pkey PRIMARY KEY (cart_product_id);


--
-- TOC entry 3368 (class 2606 OID 45781)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (cart_id);


--
-- TOC entry 3355 (class 2606 OID 45737)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3338 (class 2606 OID 45802)
-- Name: customers customers_cart_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_cart_id_key UNIQUE (cart_id);


--
-- TOC entry 3340 (class 2606 OID 45707)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 45809)
-- Name: customers customers_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_key UNIQUE (user_id);


--
-- TOC entry 3374 (class 2606 OID 45909)
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (discount_id);


--
-- TOC entry 3322 (class 2606 OID 45643)
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (district_id);


--
-- TOC entry 3379 (class 2606 OID 45915)
-- Name: order_product_discounts order_product_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_product_discounts
    ADD CONSTRAINT order_product_discounts_pkey PRIMARY KEY (product_discount_id);


--
-- TOC entry 3392 (class 2606 OID 45943)
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (order_product_id);


--
-- TOC entry 3385 (class 2606 OID 45937)
-- Name: orders orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_number_key UNIQUE (order_number);


--
-- TOC entry 3389 (class 2606 OID 45935)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3365 (class 2606 OID 45752)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (product_image_id);


--
-- TOC entry 3360 (class 2606 OID 45746)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3320 (class 2606 OID 45637)
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (province_id);


--
-- TOC entry 3400 (class 2606 OID 45996)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- TOC entry 3397 (class 2606 OID 45949)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3348 (class 2606 OID 45725)
-- Name: users users_address_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_address_id_key UNIQUE (address_id);


--
-- TOC entry 3351 (class 2606 OID 45723)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3353 (class 2606 OID 45721)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 45715)
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- TOC entry 3346 (class 2606 OID 45816)
-- Name: vendors vendors_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_user_id_key UNIQUE (user_id);


--
-- TOC entry 3326 (class 2606 OID 45649)
-- Name: wards wards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_pkey PRIMARY KEY (ward_id);


--
-- TOC entry 3328 (class 1259 OID 45689)
-- Name: addresses_district_id_4c53b6fc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_district_id_4c53b6fc ON public.addresses USING btree (district_id);


--
-- TOC entry 3331 (class 1259 OID 45690)
-- Name: addresses_province_id_fd59f22d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_province_id_fd59f22d ON public.addresses USING btree (province_id);


--
-- TOC entry 3332 (class 1259 OID 45691)
-- Name: addresses_ward_id_6b490b94; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_ward_id_6b490b94 ON public.addresses USING btree (ward_id);


--
-- TOC entry 3369 (class 1259 OID 45799)
-- Name: cart_products_cart_id_9e8cbb51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cart_products_cart_id_9e8cbb51 ON public.cart_products USING btree (cart_id);


--
-- TOC entry 3372 (class 1259 OID 45800)
-- Name: cart_products_product_id_cb25c0a2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cart_products_product_id_cb25c0a2 ON public.cart_products USING btree (product_id);


--
-- TOC entry 3356 (class 1259 OID 45753)
-- Name: categories_slug_9bedfe6b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_slug_9bedfe6b ON public.categories USING btree (slug);


--
-- TOC entry 3357 (class 1259 OID 45754)
-- Name: categories_slug_9bedfe6b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_slug_9bedfe6b_like ON public.categories USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3323 (class 1259 OID 45661)
-- Name: districts_province_id_id_f858c356; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX districts_province_id_id_f858c356 ON public.districts USING btree (province_id_id);


--
-- TOC entry 3375 (class 1259 OID 45929)
-- Name: order_produ_end_dat_879853_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_produ_end_dat_879853_idx ON public.order_product_discounts USING btree (end_date);


--
-- TOC entry 3376 (class 1259 OID 45928)
-- Name: order_produ_start_d_5c9ea9_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_produ_start_d_5c9ea9_idx ON public.order_product_discounts USING btree (start_date);


--
-- TOC entry 3377 (class 1259 OID 45926)
-- Name: order_product_discounts_discount_id_0dc2effd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_product_discounts_discount_id_0dc2effd ON public.order_product_discounts USING btree (discount_id);


--
-- TOC entry 3380 (class 1259 OID 45927)
-- Name: order_product_discounts_product_id_1424bce9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_product_discounts_product_id_1424bce9 ON public.order_product_discounts USING btree (product_id);


--
-- TOC entry 3390 (class 1259 OID 45975)
-- Name: order_products_order_id_b5077dc2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_products_order_id_b5077dc2 ON public.order_products USING btree (order_id);


--
-- TOC entry 3393 (class 1259 OID 45976)
-- Name: order_products_product_id_3110c998; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_products_product_id_3110c998 ON public.order_products USING btree (product_id);


--
-- TOC entry 3381 (class 1259 OID 45963)
-- Name: orders_address_id_38f528bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_address_id_38f528bc ON public.orders USING btree (address_id);


--
-- TOC entry 3382 (class 1259 OID 45964)
-- Name: orders_customer_id_b7016332; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_customer_id_b7016332 ON public.orders USING btree (customer_id);


--
-- TOC entry 3383 (class 1259 OID 45960)
-- Name: orders_order_number_fdca857f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_order_number_fdca857f_like ON public.orders USING btree (order_number varchar_pattern_ops);


--
-- TOC entry 3386 (class 1259 OID 45961)
-- Name: orders_order_status_d7884992; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_order_status_d7884992 ON public.orders USING btree (order_status);


--
-- TOC entry 3387 (class 1259 OID 45962)
-- Name: orders_order_status_d7884992_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_order_status_d7884992_like ON public.orders USING btree (order_status varchar_pattern_ops);


--
-- TOC entry 3366 (class 1259 OID 45774)
-- Name: product_images_product_id_id_ccaefabd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX product_images_product_id_id_ccaefabd ON public.product_images USING btree (product_id_id);


--
-- TOC entry 3358 (class 1259 OID 45767)
-- Name: products_category_id_a7a3a156; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_id_a7a3a156 ON public.products USING btree (category_id);


--
-- TOC entry 3361 (class 1259 OID 45765)
-- Name: products_slug_8f20884e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_slug_8f20884e ON public.products USING btree (slug);


--
-- TOC entry 3362 (class 1259 OID 45766)
-- Name: products_slug_8f20884e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_slug_8f20884e_like ON public.products USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3363 (class 1259 OID 45768)
-- Name: products_vendor_id_7527517c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_vendor_id_7527517c ON public.products USING btree (vendor_id);


--
-- TOC entry 3398 (class 1259 OID 46007)
-- Name: reviews_customer_id_id_a952a4e9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reviews_customer_id_id_a952a4e9 ON public.reviews USING btree (customer_id_id);


--
-- TOC entry 3401 (class 1259 OID 46008)
-- Name: reviews_product_id_id_4e23beeb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reviews_product_id_id_4e23beeb ON public.reviews USING btree (product_id_id);


--
-- TOC entry 3394 (class 1259 OID 45987)
-- Name: transactions_customer_id_ae580f75; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX transactions_customer_id_ae580f75 ON public.transactions USING btree (customer_id);


--
-- TOC entry 3395 (class 1259 OID 45988)
-- Name: transactions_order_id_f6e6e374; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX transactions_order_id_f6e6e374 ON public.transactions USING btree (order_id);


--
-- TOC entry 3349 (class 1259 OID 45731)
-- Name: users_email_0ea73cca_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_email_0ea73cca_like ON public.users USING btree (email varchar_pattern_ops);


--
-- TOC entry 3324 (class 1259 OID 45672)
-- Name: wards_district_id_id_55ac6366; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wards_district_id_id_55ac6366 ON public.wards USING btree (district_id_id);


--
-- TOC entry 3327 (class 1259 OID 45673)
-- Name: wards_province_id_id_917147e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wards_province_id_id_917147e6 ON public.wards USING btree (province_id_id);


--
-- TOC entry 3405 (class 2606 OID 45674)
-- Name: addresses addresses_district_id_4c53b6fc_fk_districts_district_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_district_id_4c53b6fc_fk_districts_district_id FOREIGN KEY (district_id) REFERENCES public.districts(district_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3406 (class 2606 OID 45679)
-- Name: addresses addresses_province_id_fd59f22d_fk_provinces_province_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_province_id_fd59f22d_fk_provinces_province_id FOREIGN KEY (province_id) REFERENCES public.provinces(province_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3407 (class 2606 OID 45684)
-- Name: addresses addresses_ward_id_6b490b94_fk_wards_ward_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_ward_id_6b490b94_fk_wards_ward_id FOREIGN KEY (ward_id) REFERENCES public.wards(ward_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3408 (class 2606 OID 45824)
-- Name: bank_accounts bank_accounts_vendor_id_8798bbc9_fk_vendors_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_vendor_id_8798bbc9_fk_vendors_id FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3416 (class 2606 OID 45789)
-- Name: cart_products cart_products_cart_id_9e8cbb51_fk_carts_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_cart_id_9e8cbb51_fk_carts_cart_id FOREIGN KEY (cart_id) REFERENCES public.carts(cart_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3417 (class 2606 OID 45794)
-- Name: cart_products cart_products_product_id_cb25c0a2_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_product_id_cb25c0a2_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3409 (class 2606 OID 45803)
-- Name: customers customers_cart_id_3dfffea3_fk_carts_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_cart_id_3dfffea3_fk_carts_cart_id FOREIGN KEY (cart_id) REFERENCES public.carts(cart_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3410 (class 2606 OID 45810)
-- Name: customers customers_user_id_28f6c6eb_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_28f6c6eb_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3402 (class 2606 OID 45656)
-- Name: districts districts_province_id_id_f858c356_fk_provinces_province_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_province_id_id_f858c356_fk_provinces_province_id FOREIGN KEY (province_id_id) REFERENCES public.provinces(province_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3418 (class 2606 OID 45916)
-- Name: order_product_discounts order_product_discou_discount_id_0dc2effd_fk_discounts; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_product_discounts
    ADD CONSTRAINT order_product_discou_discount_id_0dc2effd_fk_discounts FOREIGN KEY (discount_id) REFERENCES public.discounts(discount_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3419 (class 2606 OID 45921)
-- Name: order_product_discounts order_product_discou_product_id_1424bce9_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_product_discounts
    ADD CONSTRAINT order_product_discou_product_id_1424bce9_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3422 (class 2606 OID 45965)
-- Name: order_products order_products_order_id_b5077dc2_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_order_id_b5077dc2_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3423 (class 2606 OID 45970)
-- Name: order_products order_products_product_id_3110c998_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_product_id_3110c998_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3420 (class 2606 OID 45950)
-- Name: orders orders_address_id_38f528bc_fk_addresses_address_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_address_id_38f528bc_fk_addresses_address_id FOREIGN KEY (address_id) REFERENCES public.addresses(address_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3421 (class 2606 OID 45955)
-- Name: orders orders_customer_id_b7016332_fk_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_b7016332_fk_customers_id FOREIGN KEY (customer_id) REFERENCES public.customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3415 (class 2606 OID 45769)
-- Name: product_images product_images_product_id_id_ccaefabd_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_id_ccaefabd_fk_products_product_id FOREIGN KEY (product_id_id) REFERENCES public.products(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3413 (class 2606 OID 45755)
-- Name: products products_category_id_a7a3a156_fk_categories_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_a7a3a156_fk_categories_category_id FOREIGN KEY (category_id) REFERENCES public.categories(category_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3414 (class 2606 OID 45760)
-- Name: products products_vendor_id_7527517c_fk_vendors_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_vendor_id_7527517c_fk_vendors_id FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3426 (class 2606 OID 45997)
-- Name: reviews reviews_customer_id_id_a952a4e9_fk_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_customer_id_id_a952a4e9_fk_customers_id FOREIGN KEY (customer_id_id) REFERENCES public.customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3427 (class 2606 OID 46002)
-- Name: reviews reviews_product_id_id_4e23beeb_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_id_4e23beeb_fk_products_product_id FOREIGN KEY (product_id_id) REFERENCES public.products(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3424 (class 2606 OID 45977)
-- Name: transactions transactions_customer_id_ae580f75_fk_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_customer_id_ae580f75_fk_customers_id FOREIGN KEY (customer_id) REFERENCES public.customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3425 (class 2606 OID 45982)
-- Name: transactions transactions_order_id_f6e6e374_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_order_id_f6e6e374_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3412 (class 2606 OID 45726)
-- Name: users users_address_id_96e92564_fk_addresses_address_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_address_id_96e92564_fk_addresses_address_id FOREIGN KEY (address_id) REFERENCES public.addresses(address_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3411 (class 2606 OID 45817)
-- Name: vendors vendors_user_id_f1608816_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_user_id_f1608816_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3403 (class 2606 OID 45662)
-- Name: wards wards_district_id_id_55ac6366_fk_districts_district_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_district_id_id_55ac6366_fk_districts_district_id FOREIGN KEY (district_id_id) REFERENCES public.districts(district_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3404 (class 2606 OID 45667)
-- Name: wards wards_province_id_id_917147e6_fk_provinces_province_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_province_id_id_917147e6_fk_provinces_province_id FOREIGN KEY (province_id_id) REFERENCES public.provinces(province_id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2024-11-15 18:02:01 +07

--
-- PostgreSQL database dump complete
--

