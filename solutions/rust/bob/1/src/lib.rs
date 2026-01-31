const REPL_QUESTION: &str = "Sure.";
const REPL_YELL: &str = "Whoa, chill out!";
const REPL_YELLQUESTION: &str = "Calm down, I know what I'm doing!";
const REPL_SILENCE: &str = "Fine. Be that way!";
const REPL_ELSE: &str = "Whatever.";

enum MessageType {
    Question,
    YelledQuestion,
    Silence,
    Yelling,
    Else,
}

pub fn reply(message: &str) -> &str {

    let mut msg = message;
    msg = msg.trim();

    let message_type = determine_message_type(msg);

    match message_type {
        MessageType::Question => return REPL_QUESTION,
        MessageType::YelledQuestion => return REPL_YELLQUESTION,
        MessageType::Silence => return REPL_SILENCE,
        MessageType::Yelling => return REPL_YELL,
        MessageType::Else => return REPL_ELSE
    }
}

fn determine_message_type(message: &str) -> MessageType {
    if msg_is_silence(&message) {
        return MessageType::Silence;
    }

    let mut message_tup = (false, false);

    if msg_is_question(&message) {
        message_tup.0 = true;
    }

    if msg_is_yelling(&message) {
        message_tup.1 = true;
    }

    match message_tup {
        (false, false) => return MessageType::Else,
        (true, false) => return MessageType::Question,
        (false, true) => return MessageType::Yelling,
        (true, true) => return MessageType::YelledQuestion
    }
}

fn msg_is_question(message: &str) -> bool {
    let last_char: Vec<char> = message.chars().rev().take(1).collect();
    let question_mark_char: char = '?';

    if last_char.is_empty() {
        return false;
    }

    if last_char[0].eq(&question_mark_char) {
        return true;
    }

    return false;
}

fn msg_is_yelling(message: &str) -> bool {

    if !msg_is_alphabetical(message) {
        return false;
    }

    return message.eq(&message.to_uppercase());
}

fn msg_is_silence(message: &str) -> bool {
    return message.is_empty();
}

fn msg_is_alphabetical(message: &str) -> bool {
    message.chars().any(|c| c.is_alphabetic())
}