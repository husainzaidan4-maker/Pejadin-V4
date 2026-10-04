-- Skema PEJADIN untuk PostgreSQL / Supabase (dijalankan otomatis oleh backend saat tabel belum ada)
create table users(id bigserial primary key,username text unique not null,password_hash text not null,nama text,pegawai_id bigint,role text not null,aktif int not null default 1);
create table pegawai(id bigserial primary key,nama text not null,nip text unique not null,golongan text,jabatan text,eselon text,unit_kerja text,aktif int not null default 1);
create table tarif(id bigserial primary key,tahun int not null,provinsi text not null,harian bigint,inap1 bigint,inap2 bigint,inap3 bigint,inap4 bigint,taksi bigint,unique(tahun,provinsi));
create table pejabat(id bigserial primary key,peran text,nama text,nip text,jabatan text,aktif int not null default 1);
create table dasar_hukum(id bigserial primary key,urutan int,teks text,aktif int not null default 1);
create table satker(k text primary key,v text);
create table st(id bigserial primary key,nomor text,tahun int,maksud text,asal text,tujuan text,provinsi text,tgl_berangkat text,tgl_kembali text,tgl_tiba text,alat text,akun text,jenis text,status text not null default 'DRAFT',alasan text,dibuat_oleh text,diterbitkan_oleh text);
create table spd(id bigserial primary key,st_id bigint not null references st(id) on delete cascade,urutan int,pegawai_id bigint,nama text,nip text,golongan text,jabatan text,eselon text,hari int,malam int,tarif_inap bigint,tiket bigint,lain bigint,tarif_harian bigint,uang_harian bigint,uang_inap bigint,taksi bigint,tarif_rep bigint,rep bigint,jumlah bigint,batas bigint,flag int);
create table audit(id bigserial primary key,pengguna text,aksi text,entitas text,eid bigint,detail text,waktu text);
create unique index ux_nomor on st(tahun,nomor) where nomor is not null;
create index ix_spd_st on spd(st_id);
create index ix_st_status on st(status);
-- Keamanan Supabase: matikan akses lewat Data API (anon/authenticated). Backend memakai role postgres yang melewati RLS.
alter table users enable row level security;alter table pegawai enable row level security;alter table tarif enable row level security;alter table pejabat enable row level security;
alter table dasar_hukum enable row level security;alter table satker enable row level security;alter table st enable row level security;alter table spd enable row level security;alter table audit enable row level security;
