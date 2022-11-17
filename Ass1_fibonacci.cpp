#include <iostream>

using namespace std;

void fibIter(int n){
    if(n <= 0){
        cout << "Please enter a number greater than 0" << endl;;
        return;
    }
    cout << "Fibonacci sequence: " << endl;
    if(n == 1){
        cout << 1 << endl;
        return;
    }
    int fn = 1;
    int fn1 = 0;
    int fn2 = 1;
    for(int i = 1; i <= n; i++){
        cout << fn1 << " ";
        fn = fn1 + fn2;
        fn2 = fn1;
        fn1 = fn; 
    }
    cout << endl;
}

int fibRec(int n){
    if(n <= 0){
        return 0;
    }
    if(n == 1){
        return 1;
    }
    return fibRec(n - 1) + fibRec(n - 2);
}

int main(){
    int n;
    cin >> n;
    fibIter(n);
    for(int i = 0; i < n; i++){
        cout << fibRec(i) << " ";
    }
    
    return 0;
}