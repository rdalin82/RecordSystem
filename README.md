# Record System 

Ruby application that reads a csv or text file that is comma or pipe delimited and can sort them by last name in descending order, date of birth by ascending, or by gender ascending then by last name ascending order.  New entries are written to a csv file located at ./data/records.csv by default.

### Example inputs 

``` LastName | FirstName | Gender | Color | DateofBirth #mm/dd/yyyy format ```

``` LastName, FirstName, Gender, Color, DateofBirth #mm/dd/yyyy format ```

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

``` RecordSystem::RecordReader.load.sort(&:by_last_name) #reads file and sorts an array by last name descending ```

``` RecordSystem::RecordReader.load.sort(&:by_gender) #reads file and sorts an array by gender then last name ascending ```

``` RecordSystem::RecordReader.load.sort(&:by_date) #reads file and sorts by an array by date of birth ```

Optionally you can pass a hash of arguments ``` {:source=>file_source, :record=>recordClass} ``` to #load


## Writing to file

``` RecordSystem::RecordWriter.append(input) #takes input as described above and adds to csv file ``` 

Optionally you can pass a hash of arguments ``` {:source=>file_source, :parser=>parserClass, :record=>recordClass} ``` to #append

## To run tests:
 
```$ rake ```