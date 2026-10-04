# PEJADIN (prototype) - FastAPI + PostgreSQL (Supabase)

## 1. Siapkan Supabase
1. Buat project di supabase.com, simpan password database.
2. Klik **Connect** > tab **Connection string** > pilih **Session pooler** (port 5432), salin URI-nya.
   (Direct connection hanya IPv6; kalau koneksimu IPv4 pakai Session pooler.)
3. Password dengan karakter khusus harus di-URL-encode (@ jadi %40, # jadi %23, dst).

## 2. Jalankan di VS Code (Python 3.10+)
    cd backend
    copy .env.example .env      (Mac/Linux: cp .env.example .env)   lalu isi DATABASE_URL & SECRET
    pip install -r requirements.txt
    uvicorn main:app --reload

Buka http://localhost:8000. Saat pertama jalan, tabel (database/schema.sql) dan data contoh dibuat otomatis di Supabase.
Login demo (password = username + 123): admin, operator, ppk, bendahara, pegawai. Segera ganti sebelum dipakai nyata.

## Catatan
- Semua tabel memakai Row Level Security tanpa policy, jadi tidak bisa diakses lewat Data API/anon key Supabase. Hanya backend (role postgres) yang bisa membaca/menulis.
- Jangan commit file .env. Data pegawai/tarif/pejabat adalah CONTOH; ganti dengan data klien.
- backend/main.py = API, mesin hitung, validasi V1-V9, alur status, audit, cetak. frontend/index.html = antarmuka. design/ = acuan Stitch.
