import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, View, ScrollView } from 'react-native';
import { Button, Card, List, WhiteSpace, WingBlank } from '@ant-design/react-native';

export default function App() {
  return (
    <ScrollView style={styles.container}>
      <WingBlank size="lg">
        <WhiteSpace size="lg" />
        
        <Card>
          <Card.Header title="Welcome to Ant Design Mobile!" />
          <Card.Body>
            <Button type="primary" size="large">
              Primary Button
            </Button>
            <WhiteSpace />
            <Button type="ghost" size="large">
              Ghost Button
            </Button>
            <WhiteSpace />
            <Button type="warning" size="large">
              Warning Button
            </Button>
          </Card.Body>
        </Card>

        <WhiteSpace size="lg" />

        <Card>
          <Card.Header title="List Example" />
          <Card.Body>
            <List>
              <List.Item arrow="horizontal">List Item 1</List.Item>
              <List.Item arrow="horizontal">List Item 2</List.Item>
              <List.Item arrow="horizontal">List Item 3</List.Item>
            </List>
          </Card.Body>
        </Card>

        <WhiteSpace size="lg" />

        <Card>
          <Card.Header title="More Buttons" />
          <Card.Body>
            <Button type="primary" size="small">Small</Button>
            <WhiteSpace />
            <Button type="primary" size="middle">Middle</Button>
            <WhiteSpace />
            <Button type="primary" size="large">Large</Button>
          </Card.Body>
        </Card>

        <WhiteSpace size="xl" />
      </WingBlank>
      <StatusBar style="auto" />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
});
