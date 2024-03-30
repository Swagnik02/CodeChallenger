class LoggedInUser {
  static String uid = '1';
  static String userName = 'swagnik';
  static String fullName = 'Swagnik Saha';
  static String emailId = 'swagnik1234@gmail.com';
  static double rating = 4.5;
}

class GlobalUtils {}

class FrequentStrings {
  static String defaultCode = '''
#include <iostream>
#include <string>
using namespace std;

int main()
{
  cout << "Hello World ";
  return 0;
}
''';
}

class Solutions {
  static String qId1 = '''
#include <iostream>
#include <sstream>
#include <vector>
#include <string>

using namespace std;

// Function to perform addition of two numbers
int performAddition(int num1, int num2) {
    return num1 + num2;
}

int main() {
    // Input variables
    int num1, num2;
    
    // Sample input format: "3 5"
    cout << "Enter two numbers separated by space: ";
    cin >> num1 >> num2;
    
    // Call performAddition function and get the result
    int result = performAddition(num1, num2);
    
    // Output the result
    cout << "The sum of " << num1 << " and " << num2 << " is: " << result << endl;

    return 0;
}
''';
}
