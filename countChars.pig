lines = load './in/*.txt' as (line:chararray);
letters = foreach lines generate flatten(TOKENIZE(REPLACE(LOWER(line),'','_'), '_')) as letter;
grouped_letters = group letters by letter;
letter_count = foreach grouped_letters generate group, COUNT(letters);
store letter_count into './charcount/';