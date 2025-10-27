// i18n type definitions
export interface TranslationResources {
  common: {
    loading: string;
    error: string;
    success: string;
    cancel: string;
    confirm: string;
    save: string;
    edit: string;
    delete: string;
    back: string;
    next: string;
    done: string;
  };
  auth: {
    login: string;
    signup: string;
    email: string;
    password: string;
    confirmPassword: string;
    forgotPassword: string;
    dontHaveAccount: string;
    alreadyHaveAccount: string;
    agreeToTerms: string;
  };
  onboard: {
    slide1: {
      title: string;
      subtitle: string;
    };
  };
}
