#include <iostream>
using namespace std;
int main()
{
	string name = "Mostafa Tarek Khalil";
	
	int sec = 24;
	
		cout<<name[0]<<" : "<<(int)name[0]<<"\n";
		cout<<name[8]<<" : "<<(int)name[8]<<"\n";
		cout<<name[14]<<" : "<<(int)name[14]<<"\n";
	
		cout<<"Section : "<<sec<<"\n";
	
	int num1;
	int num2;
	int num3;
	int choice;
	
		cout<<"Enter The First Number : ";
		cin>>num1;
	
		cout<<"Enter The Second Number : ";
		cin>>num2;
	
		cout<<"Enter The Third Number : ";
		cin>>num3;
	
		cout << "Enter 1 for sum or 2 for sub: "; 
		cin >> choice;      

	if (choice == 1)         
			cout << "sum (N1+N2+N3) = " << num1+num2+num3;     
    else         
			cout << "sub (N1-N2-N3) = " << num1-num2-num3;

	return 0;
}
