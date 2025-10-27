import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';
import * as Localization from 'expo-localization';
import { I18nManager } from 'react-native';

// Import translation files
import en from './resources/en.json';
import ar from './resources/ar.json';

// Get device locale
const deviceLocale = Localization.locale;

// Configure i18n
i18n
  .use(initReactI18next)
  .init({
    resources: {
      en: { translation: en },
      ar: { translation: ar },
    },
    lng: deviceLocale.startsWith('ar') ? 'ar' : 'en',
    fallbackLng: 'en',
    interpolation: {
      escapeValue: false,
    },
  });

// Set RTL for Arabic
I18nManager.allowRTL(true);
I18nManager.forceRTL(deviceLocale.startsWith('ar'));

export default i18n;
