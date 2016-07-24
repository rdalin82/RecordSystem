# Record System 

Ruby application that reads a csv or text file that is comma or pipe delimited and can sort them by last name in descending order, date of birth by ascending, or by gender ascending then by last name ascending order.  New entries are written to a csv file located at ./data/records.csv by default, however you may pass the append method a hash of :source=>your_file as an option

### Example inputs 
``` LastName | FirstName | Gender | Color | DateofBirth #mm/dd/yyyy formart ```
``` LastName, FirstName, Gender, Color, DateofBirth #mm/dd/yyyy formart ```

# Examples 

## Reading and Sorting 
``` RecordSystem::RecordReader.load.sort(&:by_last_name) #reads file and sorts an array by last name descending ```
``` RecordSystem::RecordReader.load.sort(&:by_gender) #reads file and sorts an array by gender then last name ascending ```
``` RecordSystem::RecordReader.load.sort(&:by_date) #reads file and sorts by an array by date of birth ```

## Writing to file

``` RecordSystem::RecordWriter.append(input) #takes input as described above and adds to csv file ``` 

Optionally you can pass a hash of arguments ``` {:source=>file_source, :parser=>parserClass, :record=>recordClass} ```

## To run tests:
 
``` rspec ```