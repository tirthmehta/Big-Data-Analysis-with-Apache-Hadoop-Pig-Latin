customers = load './kids.txt' AS (line:chararray);
customers = foreach customers generate flatten(STRSPLIT(line,' '));
purchases = load './purchases.txt' AS (line:chararray);
purchases = foreach purchases generate flatten(STRSPLIT(line,' '));
customers = filter customers by ($1==10) or ($1==11) or ($1==12);
join_table = join customers by $0, purchases by $0;
join_table = group join_table by $3;
count = foreach join_table generate group, COUNT(join_table);
count = order count by $1 desc;
count = limit count 1;
store count into './popularFlavor/';