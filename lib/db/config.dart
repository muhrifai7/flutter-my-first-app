import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
        'CREATE TABLE chart_master (id INTEGER PRIMARY KEY, account_code TEXT,account_name TEXT,account_type TEXT, inactive INTEGER, no_pol TEXT,id_bus INTEGER,no_rek TEXT,id_company INTEGER)');

//     await database.execute(
//         'CREATE TABLE bus_crew (id_crew INTEGER PRIMARY KEY, id_porsenil INTEGER,id_group INTEGER,kode_trayek INTEGER,tgl_aktif date, tgl_non_aktif date, status TEXT)');

//     await database.execute(
//         'CREATE TABLE bus_garansi (id INTEGER PRIMARY KEY, id_bus INTEGER,no_pol INTEGER,id_garasi INTEGER,tgl_registrasi date,status TEXT)');

//     await database.execute(
//         'CREATE TABLE bus_nopol (id_nopol INTEGER PRIMARY KEY, id_bus INTEGER,no_pol TEXT,no_stnk TEXT,tgl_faktur date,tgl_berlaku date,nominal_pajak INTEGER,stnk TEXT,tbpkp TEXT,aktif TEXT)');

//     await database.execute(
//         'CREATE TABLE bus_kps (id INTEGER PRIMARY KEY, id_bus INTEGER,id_nopol TEXT,no_stnk TEXT,kode_trayek TEXT,kode_trayek TEXT,nama_trayek TEXT,rute text,no_uji_kendaraan TEXT,daya_angkut_orang INTEGER,daya_angkut_barang INTEGER,tgl_uji_berkala date,tgl_berlaku_sampai date,trip TEXT,jenis_trayek TEXT,kelas_bus TEXT,nominal INTEGER,foto TEXT,aktif TEXT)');
// // inibelum selesai
//     await database.execute(
//         'CREATE TABLE sys_setting (id INTEGER PRIMARY KEY, id_bus INTEGER,id_nopol TEXT,no_stnk TEXT,kode_trayek TEXT,kode_trayek TEXT,nama_trayek TEXT,rute text,no_uji_kendaraan TEXT,daya_angkut_orang INTEGER,daya_angkut_barang INTEGER,tgl_uji_berkala date,tgl_berlaku_sampai date,trip TEXT,jenis_trayek TEXT,kelas_bus TEXT,nominal INTEGER,foto TEXT,aktif TEXT)');

//     // ini belum selesai
//     await database.execute(
//         'CREATE TABLE resume_transaksi_bus (id INTEGER PRIMARY KEY, id_bus INTEGER,id_nopol TEXT,no_stnk TEXT,kode_trayek TEXT,kode_trayek TEXT,nama_trayek TEXT,rute text,no_uji_kendaraan TEXT,daya_angkut_orang INTEGER,daya_angkut_barang INTEGER,tgl_uji_berkala date,tgl_berlaku_sampai date,trip TEXT,jenis_trayek TEXT,kelas_bus TEXT,nominal INTEGER,foto TEXT,aktif TEXT)');

//     // ini belum selesai
//     await database.execute(
//         'CREATE TABLE harga_tiket_bus (id INTEGER PRIMARY KEY, id_bus INTEGER,id_nopol TEXT,no_stnk TEXT,kode_trayek TEXT,kode_trayek TEXT,nama_trayek TEXT,rute text,no_uji_kendaraan TEXT,daya_angkut_orang INTEGER,daya_angkut_barang INTEGER,tgl_uji_berkala date,tgl_berlaku_sampai date,trip TEXT,jenis_trayek TEXT,kelas_bus TEXT,nominal INTEGER,foto TEXT,aktif TEXT)');

//     // ini belum selesai
//     await database.execute(
//         'CREATE TABLE jarak_antar_kota (id INTEGER PRIMARY KEY, id_bus INTEGER,id_nopol TEXT,no_stnk TEXT,kode_trayek TEXT,kode_trayek TEXT,nama_trayek TEXT,rute text,no_uji_kendaraan TEXT,daya_angkut_orang INTEGER,daya_angkut_barang INTEGER,tgl_uji_berkala date,tgl_berlaku_sampai date,trip TEXT,jenis_trayek TEXT,kelas_bus TEXT,nominal INTEGER,foto TEXT,aktif TEXT)');

//     // ini belum selesai
//     await database.execute(
//         'CREATE TABLE penjualan_tiket_bus (id INTEGER PRIMARY KEY, id_bus INTEGER,id_nopol TEXT,no_stnk TEXT,kode_trayek TEXT,kode_trayek TEXT,nama_trayek TEXT,rute text,no_uji_kendaraan TEXT,daya_angkut_orang INTEGER,daya_angkut_barang INTEGER,tgl_uji_berkala date,tgl_berlaku_sampai date,trip TEXT,jenis_trayek TEXT,kelas_bus TEXT,nominal INTEGER,foto TEXT,aktif TEXT)');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("database", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }
}
