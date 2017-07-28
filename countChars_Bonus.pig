lines = load './in/*.txt' as (line:chararray);
letters = foreach lines generate flatten(TOKENIZE(REPLACE(LOWER(line),'','_'), '_')) as letter;
filter_letters=filter letters by (letter=='a') or (letter=='e') or (letter=='i') or (letter=='o') or (letter=='u');
grouped_letters = group filter_letters by letter;
letter_count = foreach grouped_letters generate group, COUNT(filter_letters);
store letter_count into './charcount/';