# 📁 Trip Organizer System - Dart JSON Serialization

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)
![Status](https://img.shields.io/badge/status-Active-brightgreen?style=for-the-badge)

Sebuah implementasi sistem manajemen perjalanan (Trip) menggunakan **Dart**, yang fokus pada pemahaman mendalam tentang **JSON Serialization** dan **Object-Oriented Programming**. Project ini mendemonstrasikan best practices dalam mengubah data antara format Object dan JSON (Map).

---

## 🎯 Tujuan Project

- ✅ Memahami konsep **class dan properti** di Dart
- ✅ Menguasai **serialisasi data** (`toJson()`) - mengubah object menjadi Map/JSON
- ✅ Menguasai **deserialisasi data** (`fromJson()`) - mengubah Map/JSON kembali menjadi object
- ✅ Mempraktikkan **factory constructor** di Dart
- ✅ Memahami pentingnya data modeling untuk aplikasi yang scalable
- ✅ Mengintegrasikan model dengan API dan database (foundation untuk backend/Flutter)

---

## 📋 Deskripsi Tugas

### Class: `Trip` 🛫
Merepresentasikan informasi perjalanan utama dengan properti:
```dart
class Trip {
  String namaTrip;        // Nama perjalanan (contoh: "LIBURAN JEPANG 2026")
  String tanggalMulai;    // Tanggal mulai (contoh: "12 Januari 2026")
  String tanggalAkhir;    // Tanggal akhir (contoh: "28 Januari 2026")
}
```

**Method yang diimplementasikan:**
- `toJson()` → Mengubah object `Trip` menjadi `Map<String, dynamic>`
- `factory fromJson()` → Membuat object `Trip` baru dari `Map<String, dynamic>`

### Class: `ItineraryItem` 📍
Merepresentasikan detail aktivitas/lokasi dalam perjalanan dengan properti:
```dart
class ItineraryItem {
  String lokasi;      // Lokasi kunjungan (contoh: "KYOTO")
  String waktu;       // Waktu aktivitas (contoh: "JAM 8 MALAM")
  String catatan;     // Catatan/rekomendasi (contoh: "Berikan rekomendasi pribadi")
  String idTrip;      // ID referensi ke Trip (untuk relasi 1-to-many)
}
```

**Method yang diimplementasikan:**
- `toJson()` → Mengubah object `ItineraryItem` menjadi `Map<String, dynamic>`
- `factory fromJson()` → Membuat object `ItineraryItem` baru dari `Map<String, dynamic>`

---

## 📂 Struktur Project

```
trip-organizer-system/
├── bin/
│   └── main.dart                 # File utama untuk menjalankan program
├── lib/
│   ├── models/
│   │   ├── trip.dart             # Class Trip dengan toJson() & fromJson()
│   │   └── itinerary_item.dart   # Class ItineraryItem dengan toJson() & fromJson()
│   └── utils/
│       └── constants.dart        # Konstanta / helper functions (opsional)
├── pubspec.yaml                  # Dependencies Dart project
├── README.md                      # File ini
└── .gitignore                     # Git ignore configuration
```

---

## 🚀 Cara Menjalankan

### Prerequisites
- **Dart SDK** sudah terpasang ([Download Dart](https://dart.dev/get-dart))
- Terminal/Command Prompt yang siap digunakan

### Langkah-Langkah

#### 1️⃣ Clone Repository
```bash
git clone https://github.com/YOUR_USERNAME/trip-organizer-system.git
cd trip-organizer-system
```

#### 2️⃣ Install Dependencies (jika ada)
```bash
dart pub get
```

#### 3️⃣ Jalankan Program
```bash
# Cara 1: Menjalankan main.dart langsung
dart run

# Cara 2: Menjalankan file tertentu
dart run bin/main.dart

# Cara 3: Compile dan jalankan (lebih cepat untuk eksekusi berulang)
dart compile exe bin/main.dart -o trip_organizer
./trip_organizer
```

---

## 💡 Contoh Output

Saat menjalankan `main()`, program akan menampilkan hasil serialisasi dan deserialisasi:

### Output Console
```
=== TRIP ORGANIZER SYSTEM ===

📋 Creating Trip Object...
Trip Object Created: Trip(namaTrip: LIBURAN JEPANG 2026, tanggalMulai: 12 Januari 2026, tanggalAkhir: 28 Januari 2026)

🔄 Serializing to JSON...
Trip as JSON: {namaTrip: LIBURAN JEPANG 2026, tanggalMulai: 12 Januari 2026, tanggalAkhir: 28 Januari 2026}

🔄 Deserializing from JSON...
Trip from JSON: Trip(namaTrip: LIBURAN JEPANG 2026, tanggalMulai: 12 Januari 2026, tanggalAkhir: 28 Januari 2026)

✅ Data integrity verified!

📍 Creating ItineraryItem...
Item 1: ItineraryItem(lokasi: KYOTO, waktu: JAM 8 MALAM, catatan: Berikan rekomendasi pribadi, idTrip: TRIP_001)

JSON Format:
{lokasi: KYOTO, waktu: JAM 8 MALAM, catatan: Berikan rekomendasi pribadi, idTrip: TRIP_001}

Deserialized Back:
ItineraryItem(lokasi: KYOTO, waktu: JAM 8 MALAM, catatan: Berikan rekomendasi pribadi, idTrip: TRIP_001)
```

---

## 📚 Konsep Kunci yang Dipelajari

### 1. **Serialisasi (Object → JSON)**
```dart
Map<String, dynamic> tripJson = trip.toJson();
// Mengubah object yang mudah dipakai dalam kode menjadi format
// yang bisa dikirim via API atau disimpan di database
```

**Gunakan Saat:**
- Mengirim data ke REST API (POST/PUT request)
- Menyimpan ke database
- Menulis ke file JSON
- Caching data lokal

### 2. **Deserialisasi (JSON → Object)**
```dart
Trip tripFromJson = Trip.fromJson({
  'namaTrip': 'LIBURAN JEPANG 2026',
  'tanggalMulai': '12 Januari 2026',
  'tanggalAkhir': '28 Januari 2026'
});
// Mengubah data dari format JSON (yang diterima dari API/database)
// menjadi object yang mudah dipakai dalam aplikasi
```

**Gunakan Saat:**
- Menerima data dari REST API (GET/response)
- Membaca dari database
- Membaca file JSON
- Mem-parse response HTTP

### 3. **Factory Constructor**
```dart
factory Trip.fromJson(Map<String, dynamic> json) {
  return Trip(
    namaTrip: json['namaTrip'],
    tanggalMulai: json['tanggalMulai'],
    tanggalAkhir: json['tanggalAkhir'],
  );
}
```

Mengapa `factory`? Karena kita tidak membuat constructor baru dengan cara normal `Trip()`, tapi membuat instance baru dengan "recipe" dari Map JSON yang diterima.

### 4. **Map<String, dynamic>**
```dart
// Map adalah struktur key-value, seperti JSON object
Map<String, dynamic> data = {
  'namaTrip': 'LIBURAN JEPANG 2026',        // String value
  'tanggalMulai': '12 Januari 2026',        // String value
  'beasiswa': 5000000,                      // int value
  'isActive': true,                         // boolean value
  'itineraries': [                          // list value
    {'lokasi': 'KYOTO', 'waktu': 'JAM 8'}
  ]
};
```

`dynamic` memungkinkan value dalam Map bisa tipe apa saja (String, int, bool, list, map, dll).

---

## 🔗 Use Cases di Dunia Real

Konsep yang dipelajari project ini adalah **fondasi** untuk:

### Backend Development
- Membuat REST API yang menerima/mengirim JSON
- Validasi data sebelum simpan ke database
- Parsing request body dari client

### Flutter Mobile Development
- Menangani response dari API
- Menyimpan data ke local database (Hive, SharedPreferences)
- State management dengan data models yang solid

### Web Development (JavaScript/TypeScript)
- Serialisasi data di sisi client dan server
- API integration
- TypeScript interfaces untuk type safety

---

## 🎓 Learning Outcomes

Setelah menyelesaikan project ini, kamu akan bisa:

| Skill | Penjelasan |
|-------|-----------|
| **Object-Oriented Programming** | Membuat dan mengelola class dengan properti dan method |
| **Data Serialization** | Mengubah data antara format object dan JSON dengan aman |
| **API Integration** | Memahami bagaimana data mengalir antara client dan server |
| **Database Ready** | Model data yang sudah siap untuk keperluan CRUD operations |
| **Code Organization** | Struktur folder dan file yang maintainable dan scalable |

---

## 📖 Refensi & Resources

- [Dart Official Documentation - Serialization](https://dart.dev/guides/json)
- [Flutter JSON Serialization Guide](https://docs.flutter.dev/data-and-backend/serialization/json)
- [Dart Map Class Documentation](https://api.dart.dev/stable/3.0.0/dart-core/Map-class.html)
- [Factory Constructor - Dart Docs](https://dart.dev/guides/language/language-tour#factory-constructors)

---

## 💬 Tips untuk Pengembangan Lebih Lanjut

### 1. Tambah `toString()` Method
Untuk debugging yang lebih rapi:
```dart
@override
String toString() => 'Trip(namaTrip: $namaTrip, tanggalMulai: $tanggalMulai, tanggalAkhir: $tanggalAkhir)';
```

### 2. Validasi Data
Tambahkan validasi di factory `fromJson()`:
```dart
factory Trip.fromJson(Map<String, dynamic> json) {
  if (json['namaTrip'] == null || json['namaTrip'].isEmpty) {
    throw FormatException('namaTrip tidak boleh kosong');
  }
  return Trip(...);
}
```

### 3. Gunakan json_serializable Package
Untuk project yang lebih besar, gunakan code generator:
```bash
dart pub add json_serializable
dart pub add dev:build_runner
```

### 4. Tambah Unit Tests
Validasi serialisasi/deserialisasi dengan test:
```dart
test('Trip should serialize and deserialize correctly', () {
  final trip = Trip('JEPANG', '12 Jan', '28 Jan');
  final json = trip.toJson();
  final tripFromJson = Trip.fromJson(json);
  expect(tripFromJson.namaTrip, trip.namaTrip);
});
```

---

## 📝 Catatan Pengumpulan

- **Tanggal Pengumpulan:** 12 Januari 2026
- **Format:** Dart console application atau Flutter project
- **Requirement:** Class Trip + ItineraryItem dengan toJson() & fromJson()
- **Testing:** Minimal ada `main()` yang menunjukkan proses serialisasi → deserialisasi

---

## 👤 Author

- **Nama:** [Isi nama kamu]
- **Kelas:** [Isi kelas/absen kamu]
- **Repository:** https://github.com/YOUR_USERNAME/trip-organizer-system
- **Last Updated:** 16 Januari 2026

---

## 📄 License

Project ini dibuat untuk tujuan pembelajaran dan dibawah lisensi **MIT**.

```
MIT License - Anda bebas menggunakan, memodifikasi, dan mendistribusikan project ini
dengan menyertakan attribut penulis original.
```

---

<div align="center">

**⭐ Jika project ini membantu, jangan lupa beri star!**

Made with ❤️ for learning Dart & Flutter

</div>
