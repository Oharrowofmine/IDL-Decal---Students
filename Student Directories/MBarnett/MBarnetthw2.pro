pro main
 filename = 'one.txt'
 x = gimmedata(filename)
 y = readerinput(x)
 z = mashup(x,y)
 q = output(z)
 print, q
end

 function gimmedata, filename
   filename = 'one.txt'  
  readcol, filename, col1, col2, col3, format='A,A,A', delimit = ',' ;reads the strings of data and puts it into 3 columns, chosen for each column by commas in the original string
 
  col_arr = make_array(3, n_elements(col1), /string) ; creates an empty 3 by n_elements of the first column array that we will then stick column values into
  
  col_arr[0,*] = col1 ;inserts column 1 into place 0 of the array
  col_arr[1,*] = col2 ;inserts column 2 into place 1 of the array
  col_arr[2,*] = col3 ;inserts column 3 into place 2 of the array
  
  return, col_arr               ;returns my array with three columns!
  end  

  
 function readerinput, in_arr
   size = n_elements(in_arr[2,*]) ;finds the size of the third column of the original array
   answers = strarr(size) ;makes an empty string array with the number of rows equal to the number of elements in the original array
i = 0
   while i LT size - 1 do begin ;sets my boundaries for the while loop to run
    response = '' ;asks the user for a response to whatever is in the third row of the original array
      read, 'Please provide a ' + in_arr[2,i], response ;prompts user with question combined with the word in third row of original array
      answers[i] = response ;saves the users response into an array called answers with the correct number of rows (i)
      i+=1 ;increments my while loop properly, doesn't do it automatically 
   endwhile
 save, answers, filename = 'answers.sav' ;saves the answers inputted into a file called answers
 return, answers ;returns my answers
end

 
 
 function mashup, col_arr, answers 
   template = make_array(3, n_elements(answers), /string)
   template[0,*] = col_arr[0,*]
   newanswers = transpose(answers)
   template[1,*] = newanswers[0,*]
   template[2,*] = col_arr[1,*]
   return, template
end

 function output, answers
   size = n_elements(answers[2,*])
   useranswers = strarr(size)
i=0
   while i LT size - 1 do begin
      useranswers[i] = answers[0,i] + answers[1,i] + answers[2,i]
      i+=1
   endwhile
   return, useranswers
end



