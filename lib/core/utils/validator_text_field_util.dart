class ValidatorTextFieldUtil {
  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kolom ini tidak boleh kosong';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kolom ini tidak boleh kosong';
    } else if (value.length <= 5) {
      return 'Buat karakter lebih dari 5 karakter';
    } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Nama pengguna hanya boleh berisi huruf, angka, dan _';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kolom ini tidak boleh kosong';
    } else if (value.length < 10) {
      return 'Nomor ponsel tidak sesuai';
    }
    return null;
  }

  String? validateEmail(String? value) {
    const emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';

    if (value == null || value.isEmpty) {
      return 'Kolom ini tidak boleh kosong';
    }

    if (!RegExp(emailPattern).hasMatch(value)) {
      return 'Email tidak valid';
    }

    return null;
  }

  String? validateNumber(String? value) {
    const numberPattern = r'^[0-9]+(\.[0-9]+)?$';

    if (value == null || value.isEmpty) {
      return 'Kolom ini tidak boleh kosong';
    }

    if (!RegExp(numberPattern).hasMatch(value)) {
      return 'Harap masukkan angka yang valid';
    }

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    // Validasi panjang nama minimal 2 karakter
    if (value.length < 2) {
      return 'Nama harus terdiri dari minimal 2 karakter';
    }
    // Validasi hanya huruf dan spasi yang diperbolehkan dalam nama
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Nama hanya boleh mengandung huruf dan spasi';
    }

    return null;
  }
}
