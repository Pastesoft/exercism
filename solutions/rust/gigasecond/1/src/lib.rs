use time::PrimitiveDateTime as DateTime;
use time::Duration;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    let onegigasec = Duration::seconds(1000 * 1000 * 1000);
    // todo!("What time is a gigasecond later than {start}");
    println!("{:?}", start);
    println!("calendar date {:?}", start.to_calendar_date());

    let end = start.checked_add(onegigasec).unwrap();

    end
}

#[cfg(test)]
mod tests {

    use crate::*;
    use time::macros::datetime;

    #[test]
    fn test01() {
        let datet = datetime!(2019-01-01 0:00);
        let _ = after(datet);

        assert!(true);
    }
}
