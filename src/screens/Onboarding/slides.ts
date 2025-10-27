// Onboarding slide data
export interface OnboardingSlide {
  id: string;
  titleKey: string;
  subtitleKey: string;
  backgroundColor: string;
  icon: string; // Emoji or icon name
}

export const slides: OnboardingSlide[] = [
  {
    id: '1',
    titleKey: 'onboard.slide1.title',
    subtitleKey: 'onboard.slide1.subtitle',
    backgroundColor: '#F9F6F2',
    icon: '💬',
  },
  {
    id: '2',
    titleKey: 'onboard.slide2.title',
    subtitleKey: 'onboard.slide2.subtitle',
    backgroundColor: '#E8F5E9',
    icon: '🚩',
  },
  {
    id: '3',
    titleKey: 'onboard.slide3.title',
    subtitleKey: 'onboard.slide3.subtitle',
    backgroundColor: '#FFF3E0',
    icon: '🎟️',
  },
];
