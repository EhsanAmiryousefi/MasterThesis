
#include <fstream> 
#include <iostream>


int main() {

 std::ofstream ofs ("EhsanFileTest.txt", std::ofstream::out);

  ofs << "Ehsan \n";
  ofs <<"Mamad \n";


  ofs.close();
  std::cout<<"The file has been created successfully!";
return 0;
}

