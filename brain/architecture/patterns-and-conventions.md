---
patterns: tea-app
status: defined
priority: high
owner: cursor
last_updated: 2025-01-27
tags: [react-native, patterns, conventions, architecture]
---

# Tea App - Patterns and Conventions

## Component Architecture

### Component Structure
```typescript
// Standard component structure
interface ComponentProps {
  // Props interface
}

export function ComponentName({ prop1, prop2 }: ComponentProps) {
  // Hooks
  // State
  // Effects
  // Handlers
  // Render
}
```

### File Organization
```
src/
├── components/
│   ├── ui/              # Reusable UI components
│   ├── forms/           # Form components
│   └── feature/         # Feature-specific components
├── screens/
│   ├── Home/
│   ├── Feed/
│   └── Forum/
├── hooks/               # Custom hooks
├── utils/               # Utility functions
├── api/                 # API client and endpoints
├── store/               # State management
└── navigation/          # Navigation configuration
```

## State Management Patterns

### React Query for Server State
```typescript
// API hooks pattern
export function useMenPosts() {
  return useQuery({
    queryKey: ['men-posts'],
    queryFn: fetchMenPosts,
    staleTime: 5 * 60 * 1000, // 5 minutes
  });
}
```

### Context for Global State
```typescript
// Theme context example
const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export function useTheme() {
  const context = useContext(ThemeContext);
  if (!context) {
    throw new Error('useTheme must be used within ThemeProvider');
  }
  return context;
}
```

## Navigation Patterns

### Tab Navigation Structure
```typescript
// Bottom tabs configuration
const TabNavigator = () => (
  <Tab.Navigator>
    <Tab.Screen name="Home" component={HomeScreen} />
    <Tab.Screen name="Feed" component={FeedScreen} />
    <Tab.Screen name="Forum" component={ForumScreen} />
    <Tab.Screen name="Events" component={EventsScreen} />
  </Tab.Navigator>
);
```

### Screen Props Pattern
```typescript
// Screen component with navigation props
interface HomeScreenProps {
  navigation: NavigationProp<RootStackParamList>;
  route: RouteProp<RootStackParamList, 'Home'>;
}
```

## API Integration Patterns

### API Client Structure
```typescript
// Centralized API client
class ApiClient {
  private baseURL: string;
  private token: string | null = null;

  async get<T>(endpoint: string): Promise<T> {
    // Implementation
  }

  async post<T>(endpoint: string, data: any): Promise<T> {
    // Implementation
  }
}
```

### Error Handling Pattern
```typescript
// Consistent error handling
export function useApiError() {
  const [error, setError] = useState<string | null>(null);
  
  const handleError = (error: any) => {
    // Log error
    // Show user-friendly message
    setError(error.message);
  };

  return { error, handleError, clearError: () => setError(null) };
}
```

## UI/UX Patterns

### Safe Area Management
```typescript
// Consistent safe area usage
import { SafeAreaView } from 'react-native-safe-area-context';

export function ScreenWrapper({ children }: { children: React.ReactNode }) {
  return (
    <SafeAreaView style={styles.container}>
      {children}
    </SafeAreaView>
  );
}
```

### Responsive Design
```typescript
// Screen size adaptation
import { useWindowDimensions } from 'react-native';

export function ResponsiveComponent() {
  const { width, height } = useWindowDimensions();
  const isTablet = width > 768;
  
  return (
    <View style={[styles.container, isTablet && styles.tabletContainer]}>
      {/* Content */}
    </View>
  );
}
```

## Performance Patterns

### Memoization
```typescript
// Component memoization
export const MemoizedComponent = memo(({ data }: Props) => {
  const processedData = useMemo(() => {
    return data.map(item => processItem(item));
  }, [data]);

  return <View>{/* Render */}</View>;
});
```

### Lazy Loading
```typescript
// Component lazy loading
const LazyScreen = lazy(() => import('./LazyScreen'));

export function App() {
  return (
    <Suspense fallback={<LoadingSpinner />}>
      <LazyScreen />
    </Suspense>
  );
}
```

## Testing Patterns

### Component Testing
```typescript
// Component test structure
describe('ComponentName', () => {
  it('renders correctly', () => {
    render(<ComponentName />);
    expect(screen.getByText('Expected Text')).toBeTruthy();
  });

  it('handles user interaction', () => {
    render(<ComponentName />);
    fireEvent.press(screen.getByRole('button'));
    // Assert expected behavior
  });
});
```

### API Testing
```typescript
// API mock pattern
jest.mock('../api/client', () => ({
  fetchMenPosts: jest.fn(() => Promise.resolve(mockData)),
}));
```

## Internationalization Patterns

### Translation Hook
```typescript
// Translation usage
export function useTranslation() {
  const { t, i18n } = useTranslation();
  
  const changeLanguage = (lang: 'en' | 'ar') => {
    i18n.changeLanguage(lang);
  };

  return { t, changeLanguage, currentLanguage: i18n.language };
}
```

### RTL Support
```typescript
// RTL-aware styling
import { I18nManager } from 'react-native';

const styles = StyleSheet.create({
  container: {
    flexDirection: I18nManager.isRTL ? 'row-reverse' : 'row',
  },
});
```

## Security Patterns

### Secure Storage
```typescript
// Secure data storage
import * as SecureStore from 'expo-secure-store';

export async function storeSecureData(key: string, value: string) {
  await SecureStore.setItemAsync(key, value);
}

export async function getSecureData(key: string) {
  return await SecureStore.getItemAsync(key);
}
```

### Image Protection
```typescript
// Image processing for privacy
export function processImageForPrivacy(imageUri: string) {
  // Strip EXIF data
  // Add watermark
  // Apply blur effect
  return processedImageUri;
}
```

## Error Boundaries

### Global Error Handling
```typescript
// Error boundary component
export class ErrorBoundary extends Component<Props, State> {
  constructor(props: Props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error: Error): State {
    return { hasError: true };
  }

  componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    // Log error to crash reporting service
    console.error('Error caught by boundary:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return <ErrorFallback />;
    }

    return this.props.children;
  }
}
```


