# Record System 

Ruby application that reads a csv or text file that is comma or pipe delimited and can sort them by last name in descending order, date of birth by ascending, or by gender and then by last name ascending order.  New entries are written to a csv file located at ./data/records.csv by default.

### Example inputs 

``` LastName | FirstName | Gender | Color | DateofBirth #mm/dd/yyyy format ```

``` LastName, FirstName, Gender, Color, DateofBirth #mm/dd/yyyy format ```

## File Reader

Takes incoming text files and writes them to an output file in coma separated values.  

Usage: ```$ ruby file_reader.rb [input file] [output destination] ```

example: ```$ ruby file_reader.rb testcoma.txt ./data/test.txt ```

### Sample Output 

By Gender

Dare, Rose, Female, Red, 05/28/1986

Hintz, Vinnie, Female, Gray, 08/11/1982

Orn, Cindy, Female, White, 06/04/1985

Thompson, Althea, Female, Gray, 09/28/1981

Raynor, Cayla, Male, White, 05/17/1988

Waelchi, Alan, Male, Gray, 07/03/1989

Wolf, Diego, Male, White, 01/29/1988


By Last Name

Wolf, Diego, Male, White, 01/29/1988

Waelchi, Alan, Male, Gray, 07/03/1989

Thompson, Althea, Female, Gray, 09/28/1981

Raynor, Cayla, Male, White, 05/17/1988

Orn, Cindy, Female, White, 06/04/1985

Hintz, Vinnie, Female, Gray, 08/11/1982

Dare, Rose, Female, Red, 05/28/1986


By Birthdate

Thompson, Althea, Female, Gray, 09/28/1981

Hintz, Vinnie, Female, Gray, 08/11/1982

Orn, Cindy, Female, White, 06/04/1985

Dare, Rose, Female, Red, 05/28/1986

Wolf, Diego, Male, White, 01/29/1988

Raynor, Cayla, Male, White, 05/17/1988

Waelchi, Alan, Male, Gray, 07/03/1989


## Grape API 

### To Start

```$ rackup ``` 

The API responds to 1 POST call and 3 GET calls that return JSON data. 

``` POST /records ```

``` GET /records/gender ```

``` GET /records/birthdate ```

``` GET /records/name ``` 

### Examples of API calls 

POST new entry: ``` curl -d '{"text": "Thompson, Althea, Female, Gray, 09/28/1981"}' 'http://localhost:9292/records' -H Content-Type:application/json -v ``` 

GET records by gender: ``` curl http://localhost:9292/records/gender ```

GET records by last name descending order: ``` curl http://localhost:9292/records/name ```

GET records by birthdate: ``` curl http://localhost:9292/records/birthdate ```

## Reading and Sorting 
reads file and sorts an array by last name descending

``` RecordSystem::RecordReader.load.sort(&:by_last_name)  ```

reads file and sorts an array by gender then last name ascending

``` RecordSystem::RecordReader.load.sort(&:by_gender) ```

reads file and sorts by an array by date of birth

``` RecordSystem::RecordReader.load.sort(&:by_date)  ```

Optionally you can pass a hash of arguments ``` {:source=>file_source, :record=>recordClass} ``` to #load


## Writing to file

``` RecordSystem::RecordWriter.append(input) #takes input as described above and adds to csv file ``` 

Optionally you can pass a hash of arguments ``` {:source=>file_source, :parser=>parserClass, :record=>recordClass} ``` to #append

## To run tests:
 
```$ rake ```