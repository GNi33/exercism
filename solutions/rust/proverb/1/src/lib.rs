pub fn build_proverb(list: Vec<&str>) -> String {
    let mut proverb = String::new();
    let list_len = list.len();

    if list_len > 0 {
        if list_len > 1 {
            for idx in 0..list_len - 1 {
                proverb.push_str(get_line(list[idx], list[idx + 1]).as_str());
                proverb.push_str("\n");
            }
        }

        proverb.push_str(format!("And all for the want of a {}.", first_vec_item(&list).unwrap()).as_str());
    }

    proverb
}

fn get_line(input: &str, next_input: &str) -> String {
    return format!("For want of a {} the {} was lost.", input, next_input);
}

fn first_vec_item<T>(v: &Vec<T>) -> Option<&T> {
    v.first()
}