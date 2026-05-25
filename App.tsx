import {
  StatusBar,
  StyleSheet,
  View,
  TouchableOpacity,
  Text,
  NativeModules,
  Alert,
} from 'react-native';

function App() {
  const handlePress = () => {
    try {
      const { FaceRNModule } = NativeModules;
      if (FaceRNModule?.openMYViewController) {
        FaceRNModule.openMYViewController();
      } else {
        Alert.alert('提示', 'Native Module 尚未创建');
      }
    } catch (_e) {
      Alert.alert('提示', 'Native Module 尚未创建');
    }
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="dark-content" />
      <TouchableOpacity style={styles.button} onPress={handlePress}>
        <Text style={styles.buttonText}>跳转到 MYViewController</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  button: {
    backgroundColor: '#FF3B30',
    paddingHorizontal: 24,
    paddingVertical: 14,
    borderRadius: 8,
  },
  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
});

export default App;
