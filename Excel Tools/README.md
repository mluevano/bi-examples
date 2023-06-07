# Herramientas de Excel

## Crea Jsons desde un Excel

Para crear un archivo json debes considerar algunos puntos como:

* Agregar un botón (forma) para asginar el macro export_in_json_format
* El nombre del json será el nombre de la hoja por ejemplo "ZipCodes"
* Ajustar en el macro con la ruta que deseamos exportar el archivo **pathsave = "C:\Exported\"**


```vb
Sub export_in_json_format()

    Dim fs As Object
    Dim jsonfile
    Dim rangetoexport As Range
    Dim rowcounter As Long
    Dim columncounter As Long
    Dim linedata As String
    
    ' change range here
    lastrow = Range("A" & Rows.Count).End(xlUp).Row
    lastcol = Cells(1, Columns.Count).End(xlToLeft).Column
    Set rangetoexport = Range("A1", Cells(lastrow, lastcol))
    
    pathsave = "C:\Exported\"
    Filename = ActiveSheet.Name
    
    Set fs = CreateObject("Scripting.FileSystemObject")
    ' change dir here
    
    ' ajustar el primer parametro en true para crear un text file, y el segundo para el formato UTF-8 True, True
    Set jsonfile = fs.CreateTextFile(pathsave & Filename & ".json", True, True)
    
    linedata = "["
    jsonfile.WriteLine linedata
    For rowcounter = 2 To rangetoexport.Rows.Count
        linedata = ""
        For columncounter = 1 To rangetoexport.Columns.Count
            Dim cellValue As Variant
            Dim cellType As Integer
            
            cellValue = rangetoexport.Cells(rowcounter, columncounter).Value
            cellType = VarType(cellValue)
            
            Select Case cellType
                Case vbString
                    linedata = linedata & """" & rangetoexport.Cells(1, columncounter) & """" & ":" & """" & cellValue & """" & ","
                Case vbInteger, vbLong, vbDouble
                    linedata = linedata & """" & rangetoexport.Cells(1, columncounter) & """" & ":" & cellValue & ","
                Case vbBoolean
                    linedata = linedata & """" & rangetoexport.Cells(1, columncounter) & """" & ":" & IIf(cellValue, "true", "false") & ","
                Case Else
                    linedata = linedata & """" & rangetoexport.Cells(1, columncounter) & """" & ":" & """" & cellValue & """" & ","
            End Select
            
        Next
        linedata = Left(linedata, Len(linedata) - 1)
        If rowcounter = rangetoexport.Rows.Count Then
            linedata = "{" & linedata & "}"
        Else
            linedata = "{" & linedata & "},"
        End If
        
        jsonfile.WriteLine linedata
    Next
    
    linedata = "]"
    jsonfile.WriteLine linedata
    jsonfile.Close
    
    Set fs = Nothing
    
End Sub
´´´
