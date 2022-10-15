#![no_main]

use libfuzzer_sys::fuzz_target;
use wasm_ensure::deku_read;
use wasm_ensure::deku_write;

fn main() {
    fuzz_target!(|data: &[u8]| {
        let deku_test = deku_read(data);
        let deku_test_bytes = deku_write(&deku_test);
        assert_eq!(deku_test_bytes, data);
    });
}