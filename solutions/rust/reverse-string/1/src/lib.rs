pub fn reverse(input: &str) -> String {
    // todo!("Write a function to reverse {input}");
    let mut reversed : String = String::from("");
    for c in input.chars() {
        let mut s1 = String::from(c);
        s1.push_str(reversed.as_str());
        reversed = s1;
    }
    reversed
}
