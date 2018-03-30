Functionality Overview(after refactoring):

The project consists of following main classes: 

  . CSVManager: Initializes a file name with particular pattern and then calls 'latest_file_path()' method to find the path to the latest file with respective to date. It's responsible for read and write operations on data from text files in CSV format


  . Combiner: to combine data values by key


  . ModifierCode: Builds an instance and uses CSVManager instance to start data modification process using modify() method . The modifier object uses CSVManager instance to read the file in CSV format and sorts the data in descending order by the number of clicks and write the sorted data into a to new file with the same file name but with an extension 'sorted'.
 
     ModifierCode is having some major methods like

     get_combiner : uses Combiner class to combine data values with respective to key    

     get_merger : uses combine_hashes to generate a hashmap of values by row headers as keys and uses those values to process each array of data values based on business rules specific to each column type.

     	

Refactoring Approach:

Modifier class was Modularized into different modules/classes
Created new class related to CSV operations (i.e CSVManager)
Complex methods are broken into small methods according to coding standards of Ruby
Created application level constant file which can manage easily in future
Created different files to extend core class functionalities (Float, String)
