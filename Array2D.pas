//function new_Array2D_double(M, N: integer): T2DDoubleArray;
//procedure Array2D_double_delete(M, N: integer; var A: T2DDoubleArray);
//procedure Array2D_double_copy(M, N: integer; var B, A: T2DDoubleArray);

type
  TDoubleArray   = Array of Double;
  T2DDoubleArray = Array of TDoubleArray;

function new_Array2D_double(M, N: integer): T2DDoubleArray;
Begin
  SetLength(Result,M,N);
End;

procedure Array2D_double_delete(M, N: integer; var A: T2DDoubleArray);
begin
  SetLength(A,0);
end;

procedure Array2D_double_copy(M, N: integer; var B, A: T2DDoubleArray);
Var
 remainder,i, j: integer;
 Ai, Bi: TDoubleArray;
        
Begin
  remainder := N and 3; // N mod 4

  for i := 0 to M-1 do
  Begin
    Bi := B[i];
    Ai := A[i];
      
    for j:=0 to remainder-1 do
        Bi[j] := Ai[j];
          
    j := remainder;
    while (j < N) do
    Begin
        Bi[j]   := Ai[j];
        Bi[j+1] := Ai[j+1];
        Bi[j+2] := Ai[j+2];
        Bi[j+3] := Ai[j+3];

        inc(j, 4);
    End;
  End;
End;