class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    // Check for mixed case, numbers, and symbols
    final hasUpperCase = RegExp(r'[A-Z]').hasMatch(value);
    final hasLowerCase = RegExp(r'[a-z]').hasMatch(value);
    final hasNumbers = RegExp(r'[0-9]').hasMatch(value);
    final hasSymbols = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
    
    if (!hasUpperCase || !hasLowerCase || !hasNumbers || !hasSymbols) {
      return 'Password must contain uppercase, lowercase, numbers, and symbols';
    }
    return null;
  }
  
  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
  
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (value.length > 100) {
      return 'Name must not exceed 100 characters';
    }
    return null;
  }
  
  static String? required(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
  
  static String? minLength(String? value, int length, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (value.length < length) {
      return '$fieldName must be at least $length characters';
    }
    return null;
  }
  
  static String? maxLength(String? value, int length, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (value.length > length) {
      return '$fieldName must not exceed $length characters';
    }
    return null;
  }
  
  // Phone number validation (optional)
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Optional field
    }
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // Men Post validation
  static String? validateMenPostName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    if (value.length < 2 || value.length > 150) {
      return 'Full name must be between 2 and 150 characters';
    }
    return null;
  }

  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'City is required';
    }
    if (value.length < 2 || value.length > 100) {
      return 'City must be between 2 and 100 characters';
    }
    return null;
  }

  static String? validateCaption(String? value) {
    if (value == null || value.isEmpty) {
      return 'Caption is required';
    }
    if (value.length < 10 || value.length > 2000) {
      return 'Caption must be between 10 and 2000 characters';
    }
    return null;
  }
}

