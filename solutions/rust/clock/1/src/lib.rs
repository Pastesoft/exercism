use std::fmt;
use std::str::FromStr;

#[derive(Debug, PartialEq)]
pub struct Clock {
    minutes: i32,
    hours  : i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        calc_clock(minutes, hours)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let newmin = self.minutes + minutes;
        calc_clock(newmin, self.hours)
    }

}

fn calc_clock(min: i32, hours: i32) -> Clock {
    let mut newhours = hours;
    if min > 59 {
        let nhours = min / 60;
        newhours += nhours;
    }
    Clock {
        minutes: min % 60,
        hours  : newhours % 24,
    }
}


impl fmt::Display for Clock {
    fn fmt (&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:0>2}:{:0>2}", self.hours, self.minutes)
    }
}

impl FromStr for Clock {
    type Err = std::num::ParseIntError;

    fn from_str(code: &str) -> Result<Self, Self::Err> {
        let cs : Vec<&str> = code.split(':').collect();
        let h = i32::from_str_radix(cs[0],10).unwrap();
        let m = i32::from_str_radix(cs[1],10).unwrap();

        Ok(Clock {
            minutes : m,
            hours   : h,
        })
    }
}
