---
section: engineering
last_updated: 2025-01-27
---

# Engineering Best Practices

## Flutter Best Practices

### Widgets
- Use const widgets where possible
- Extract widgets to reduce rebuilds
- Use stateless widgets when possible
- Optimize widget trees

### Performance
- Avoid unnecessary rebuilds
- Use keys appropriately
- Optimize images
- Lazy load lists (ListView.builder)
- Profile with DevTools

### State Management
- Choose appropriate solution for complexity
- Keep state local when possible
- Use providers efficiently
- Avoid deep nesting

### Memory Management
- Dispose resources properly
- Cancel streams and subscriptions
- Avoid memory leaks

## Code Quality
- Write tests
- Review code
- Refactor regularly
- Document complex logic

## Testing
- Unit tests for business logic
- Widget tests for UI
- Integration tests for flows
- Aim for >80% coverage

