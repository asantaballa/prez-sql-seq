If Object_Id(N'Seq3', N'TF') Is Not Null
Drop Function Seq3
Go

Create Function Seq3 (@From Int, @To Int)
Returns @SeqTable Table (Seq Int) 
As
Begin
	Insert Into @SeqTable
	Select * 
	From 
	(	Select  
			Seq = t4.i * 10000 + t3.i * 1000 + t2.i * 100 + t1.i * 10 + t0.i  
		From
		(Select 0 i Union Select 1 Union Select 2 Union Select 3 Union Select 4 Union Select 5 Union Select 6 Union Select 7 Union Select 8 Union Select 9) t0,
		(Select 0 i Union Select 1 Union Select 2 Union Select 3 Union Select 4 Union Select 5 Union Select 6 Union Select 7 Union Select 8 Union Select 9) t1,
		(Select 0 i Union Select 1 Union Select 2 Union Select 3 Union Select 4 Union Select 5 Union Select 6 Union Select 7 Union Select 8 Union Select 9) t2,
		(Select 0 i Union Select 1 Union Select 2 Union Select 3 Union Select 4 Union Select 5 Union Select 6 Union Select 7 Union Select 8 Union Select 9) t3,
		(Select 0 i Union Select 1 Union Select 2 Union Select 3 Union Select 4 Union Select 5 Union Select 6 Union Select 7 Union Select 8 Union Select 9) t4
	) vt01
	Where vt01.Seq Between @From And @To
	Return
End
Go
 