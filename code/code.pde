//(c) Loe Feijs and TU/e 2019-2020 Digital Craftmanship 
//Translate your name in a series of zeros and ones
 
//The code is like ASCII but now 'A' begins at 1
//Using the function, we can make a punched-tape
//We use five bits and exceptionally take ' 'to be 00000
//Lower case is converted to upper case
import processing.pdf.*;  
 
void setup() { 
     size(800, 800);
     beginRecord(PDF,"CODE.pdf");
     stroke(255,200,200); 
     strokeWeight(.15); 
     background(255); 
} 

int  bit(int i, char c){
    //for example ASCII 'A' is 65 so we take its code 65 - 64 = 1
    // which is binary 00001 so bit(0,'A') is 1, bit (1,'A') is 0  
    if (c == ' ') return 0;//special case
    int ic = (int)c - 64; //shift down so 'A' (ASCII 65) becomes 1
    if (ic > 34) ic = ic - 32;//reduce lowercase to uppercase
    if (i == 0) return ic % 2; //bit 0 is the least significant bit
    if (i == 1) return ic/2 % 2; 
    if (i == 2) return ic/4 % 2; 
    if (i == 3) return ic/8 % 2; 
    if (i == 4) return ic/16 % 2;//bit 4 is the most significant bit
        else    return 0;
}
  
String myName = "LAURENTIUS LAB";
int pos = 0;
int y = 50;

void draw(){
     if (pos < myName.length()){
         //output the code for first letter of my name
         char c = myName.charAt(pos++);
         for (int i = 4; i >= 0; i--){
              //work through the bits from right to left
              print(bit(i,c));
              if (bit(i,c) == 0)
                 fill(255);//0 is printed white
                 else fill(0); //1 becomes black
              ellipse (150-20*i,y,15,15);
         }
         y = y + 20;
         println();
     } else {endRecord(); exit();}
}

