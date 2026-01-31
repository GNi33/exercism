extern crate chrono;
extern crate time;

use chrono::{DateTime, Utc};
use time::Duration;

// Returns a Utc DateTime one billion seconds after start.
pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {

    let base: i64 = 10;
    let exp: u32 = 9;
    let offset: i64 = base.pow(exp);

    let altered_date : DateTime<Utc> = start + Duration::seconds(offset);

    return altered_date;
}