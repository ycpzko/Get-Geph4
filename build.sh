#!/bin/sh
rustup default nightly
cargo install cross
export PATH=~/.cargo/bin:$PATH
git clone https://github.com/geph-official/geph4
cd geph4

sh osx_build.sh
cross build --release --locked --target aarch64-unknown-linux-gnu --manifest-path=geph4-client/Cargo.toml
mkdir OUTPUT
mv target/aarch64-unknown-linux-gnu/release/geph4-client OUTPUT/geph4-client-linux-aarch64
exit 0
