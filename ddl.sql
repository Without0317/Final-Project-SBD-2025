--DDL
-- table



create table staff (
    id_staff char(6) primary key,
    nama_staff varchar(30),
    no_telp varchar(15)
);

create table tempat_parkir (
    id_tempat_parkir char(6) primary key,
    jenis_tempat_parkir char(2),
    jenis_k_tempat_parkir char(5),
    nama_tempat_parkir varchar(20),
    total_slot_tempat_parkir int,
    staff_id_staff char(6)
);

create table internal_its (
    id_internal char(10) primary key,
    nama_internal varchar(30),
    status_internal char(2),
    no_telp varchar(15)
);

create table eksternal_its (
    id_eksternal char(16) primary key,
    nama varchar(30),
    no_telp varchar(15),
    stnk char(7)
);


create table dosen (
    nidn_dosen char(10) primary key,
    nama_dosen varchar(30),
    internal_its_id char(10)
);

create table mahasiswa (
    nrp char(10) primary key,
    nama_mahasis varchar(30),
    internal_its_id char(10)
);

create table kendaraan (
    id_kendaraan char(6) primary key,
    jenis_kendaraan char(5),
    nomor_polisi varchar(9),
    internal_its_id_internal char(10)
);

create table slot_parkir (
    id_slot char(6) primary key,
    kode_slot varchar(5),
    tempat_parkir_id char(6)
);

create table parkir_log (
    id_log char(6) primary key,
    waktu_masuk timestamp,
    waktu_keluar timestamp,
    slot_parkir_id_slot char(6),
    kendaraan_id_kendaraan char(6)
);

create table karcis (
    id_karcis char(6) primary key,
    status_karcis boolean,
    parkir_log_id_log char(6),
    eksternal_its_id_ek char(16),
	jenis_kendaraan char(5)
);


-- fk


alter table tempat_parkir
add constraint fk_tempat_staff
foreign key (staff_id_staff) references staff(id_staff);

alter table dosen
add constraint fk_dosen_internal
foreign key (internal_its_id) references internal_its(id_internal);

alter table mahasiswa
add constraint fk_mahasiswa_internal
foreign key (internal_its_id) references internal_its(id_internal);

alter table kendaraan
add constraint fk_kendaraan_internal
foreign key (internal_its_id_internal) references internal_its(id_internal);

alter table slot_parkir
add constraint fk_slot_tempat
foreign key (tempat_parkir_id) references tempat_parkir(id_tempat_parkir);

alter table parkir_log
add constraint fk_log_slot
foreign key (slot_parkir_id_slot) references slot_parkir(id_slot);

alter table parkir_log
add constraint fk_log_kendaraan
foreign key (kendaraan_id_kendaraan) references kendaraan(id_kendaraan);

alter table karcis
add constraint fk_karcis_log
foreign key (parkir_log_id_log) references parkir_log(id_log);

alter table karcis
add constraint fk_karcis_eksternal
foreign key (eksternal_its_id_ek) references eksternal_its(id_eksternal);
