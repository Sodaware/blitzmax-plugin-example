SuperStrict

Framework brl.basic

Function process_string:String(in:String)
	Local reversed:String

	For Local i:Int = in.Length - 1 To 0 Step -1
		reversed :+ Chr(in[i])
	Next

	Return reversed
End Function
