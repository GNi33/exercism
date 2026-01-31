const BEERS_MAX_NUM: i32 = 99;

#[derive(PartialEq)]
enum SongLines {
    FirstLine,
    SecondLine,
    NoMoreLine,
    NoMoreSecLine,
    FinalLine,
}

pub fn verse(n: i32) -> String {
    let mut verse_str = String::new();

    if n == 0 {
        verse_str.push_str(get_verse_line(SongLines::NoMoreLine, n).as_str());
        verse_str.push_str("\n");
        verse_str.push_str(get_verse_line(SongLines::FinalLine, n).as_str())
    } else {
        verse_str.push_str(get_verse_line(SongLines::FirstLine, n).as_str());
        verse_str.push_str("\n");
        if n == 1 {
            verse_str.push_str(get_verse_line(SongLines::NoMoreSecLine, n).as_str())
        } else {
            verse_str.push_str(get_verse_line(SongLines::SecondLine, n).as_str())
        }
    }

    verse_str.push_str("\n");

    verse_str
}


pub fn sing(start: i32, end: i32) -> String {
    let range = (end..start + 1).rev();

    let mut song_str = String::new();

    for num in range {
        song_str.push_str(verse(num).as_str());

        if num > end {
            song_str.push_str("\n");
        }
    }

    song_str
}

fn get_verse_line(line: SongLines, n: i32) -> String {
    let mut bottle_wrd = "bottles";

    if (line == SongLines::SecondLine && n == 2) || n == 1 {
        bottle_wrd = "bottle";
    }

    match line {
        SongLines::FirstLine => return format!("{number} {bottle} of beer on the wall, {number} {bottle} of beer.", number = n, bottle = bottle_wrd),
        SongLines::SecondLine => return format!("Take one down and pass it around, {number} {bottle} of beer on the wall.", number = n - 1, bottle = bottle_wrd),
        SongLines::FinalLine => return format!("Go to the store and buy some more, {} bottles of beer on the wall.", BEERS_MAX_NUM),
        SongLines::NoMoreLine => return format!("No more bottles of beer on the wall, no more bottles of beer."),
        SongLines::NoMoreSecLine => return format!("Take it down and pass it around, no more bottles of beer on the wall.")
    }
}