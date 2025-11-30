pub fn nth(n: u32) -> u32 {
    let mut primes : Vec<u32> = vec![2,3,5,7,11,13,17,19,23,29,31,37,41,43];
    let pl = primes.len();
    if n < pl as u32 {  // already got this prime in my vector
        return *primes.get(n as usize).unwrap()
    } else {
        let mut new_primes = n - pl as u32 + 1; // how many new priems to calculate
        let mut nextprime = *primes.last().unwrap();
        let nthp =
            loop {
                nextprime = nextprime + 2;
                println!("nextprime {nextprime}");
                let halfp = nextprime / 2 + 1;
                println!("halfp {halfp}");
                let mut i = 0;
                let mut isprime = true;
                while primes[i] < halfp && isprime { // only need the prime up to half of nextprime
                    isprime = nextprime % primes[i] > 0; // nextprime divided by all primes
                    i += 1;
                }
                println!("isprime {isprime}");
                if isprime {  // if found a new prime
                    primes.push(nextprime);
                    new_primes =  new_primes - 1;
                }
                println!("new_primes {new_primes}");
                if new_primes == 0 { // no more new primes to calculate
                    break nextprime;
                }
            };
        return nthp
    }
}
