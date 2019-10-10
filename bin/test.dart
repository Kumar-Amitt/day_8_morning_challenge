import 'package:test/test.dart';
import 'main.dart';

void main(){
  test('Board Size Test', (){
   List<List<String>> testBoard = createBoard();
   expect(testBoard.length, 3);

   expect(testBoard[0].length, 3);
   expect(testBoard[1].length, 3);
   expect(testBoard[2].length, 3);

   for(int i= 0;i<3;i++)
     {
       for(int j=0; j<3;j++)
         {
           expect(testBoard[i][j], ' ');
         }
     }

  });

}