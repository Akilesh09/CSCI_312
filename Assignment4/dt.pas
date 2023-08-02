program dt (input,output);

uses sysutils;

type
	day_range = 1..31;
	month_range = 1..12;
	
	date_t = record
		day: day_range;
		month: month_range;
		year: integer
	end;

procedure init_date (var dt : date_t; day : day_range; month : month_range; year : integer);
begin
  dt.day := day;
  dt.month := month;
  dt.year := year;
end;

procedure init_date1 (var dt : date_t);

var
	month,day,year : word;
begin
	DecodeDate(Date, year, month, day);
	init_date(dt, day, month, year);
end;

function date_equal(date1: date_t; date2: date_t): boolean;
begin
	date_equal := ((date1.year = date2.year) and (date1.month = date2.month) and (date1.day = date2.day));
end;

function date_less_than(date1: date_t; date2: date_t): boolean;
{In this function, first I set date_less_than to false. Then I check if year,month, and day of d1 are less than d2 in that order.}
begin
  	date_less_than := false;

  	if date1.year < date2.year then
    		date_less_than := true
  	else if date1.year = date2.year then
  	begin
    		if date1.month < date2.month then
      			date_less_than := true
    		else if date1.month = date2.month then
    		begin
      			if date1.day < date2.day then
        			date_less_than := true;
		end;
  	end;
end;

function month_str (month : month_range) : string;
begin
	case month of
	1: month_str := 'January';
	2: month_str := 'February';
	3: month_str := 'March';
	4: month_str := 'April';
	5: month_str := 'May';
	6: month_str := 'June';
	7: month_str := 'July';
	8: month_str := 'August';
	9: month_str := 'September';
	10: month_str := 'October';
	11: month_str := 'November';
	12: month_str := 'December';

	else
		month_str := '';
	end;
end;

procedure format_date (dt : date_t; var output_str : string);
begin
	output_str := month_str(dt.month) + ' ' + IntToStr(dt.day) + ', ' + IntToStr(dt.year);
end;

procedure next_day (var dt : date_t);	
{If year is divisible by 4, then it is a leap year except in special cases: it is not a leap year when the year is divisible by 100 but not divisible by 400}
	function leap_year(year: integer): boolean;
	begin
		if (year mod 4 = 0) then
			if(year mod 100 = 0) then
				if( year mod 400 = 0) then
					leap_year := true
				else
					leap_year := false
			else
				leap_year := true
		else
			leap_year := false;
	end;
	
	function month_length (month : month_range; leap: boolean): day_range;
	begin
    		case month of
      			1, 3, 5, 7, 8, 10, 12: month_length := 31;
      			4, 6, 9, 11: month_length := 30;
      			2:
        			if leap then
          				month_length := 29
        			else
          				month_length := 28;
    		end;
  	end;
begin
	{First checks if the current day is at the end of the month. If it is, then goes on to check if current month is the end of the year. Year and Month are incremented accordingly.}
	if (dt.day = month_length(dt.month, leap_year(dt.year))) then
  	begin
    		dt.day := 1;
    		if dt.month = 12 then
    			begin
      				dt.month := 1;
      				dt.year := dt.year + 1;
    			end
    		else
      			dt.month := dt.month + 1;
  	end
  else
    dt.day := dt.day + 1;
end;

var
	d1, d2, d3: date_t;
	format_str: string;

begin
	init_date1(d1);
	init_date(d2, 30, 12, 1999);
  	init_date(d3, 1, 1, 2000);

  	format_date(d1, format_str);
  	writeln('d1: ', format_str);

  	format_date(d2, format_str);
  	writeln('d2: ', format_str);

  	format_date(d3, format_str);
  	writeln('d3: ', format_str);
	writeln();

  	writeln('d1 < d2? ', date_less_than(d1, d2));
  	writeln('d2 < d3? ', date_less_than(d2, d3));
	writeln();

  	next_day(d2);
  	format_date(d2, format_str);
  	writeln('next day d2: ', format_str);

  	writeln('d2 < d3? ', date_less_than(d2, d3));
  	writeln('d2 = d3? ', date_equal(d2, d3));
  	writeln('d2 > d3? ', not date_less_than(d2, d3));
	writeln();

  	next_day(d2);
  	format_date(d2, format_str);
  	writeln('next day d2: ', format_str);

  	writeln('d2 = d3? ', date_equal(d2, d3));
	writeln();

  	init_date(d1, 28, 2, 1529);
  	format_date(d1, format_str);
  	writeln('initialized d1 to ', format_str);
  	next_day(d1);
  	format_date(d1, format_str);
  	writeln('next day d1: ', format_str);
	writeln();

  	init_date(d1, 28, 2, 1460);
  	format_date(d1, format_str);
  	writeln('initialized d1 to ', format_str);
  	next_day(d1);
  	format_date(d1, format_str);
  	writeln('next day d1: ', format_str);
	writeln();

  	init_date(d1, 28, 2, 1700);
  	format_date(d1, format_str);
  	writeln('initialized d1 to ', format_str);
  	next_day(d1);
  	format_date(d1, format_str);
  	writeln('next day d1: ', format_str);
	writeln();

  	init_date(d1, 28, 2, 1600);
  	format_date(d1, format_str);
  	writeln('initialized d1 to ', format_str);
  	next_day(d1);
  	format_date(d1, format_str);
  	writeln('next day d1: ', format_str);
end.
