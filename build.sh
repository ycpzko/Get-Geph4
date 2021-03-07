#!/bin/sh
rustup default nightly
cargo install cross
export PATH=~/.cargo/bin:$PATH
git clone https://github.com/geph-official/geph4
cd geph4

sh osx_build.sh

cross build --release --locked --target x86_64-pc-linux-gnu --manifest-path=geph4-vpn-helper/Cargo.toml
cross build --release --locked --target aarch64-linux-android --manifest-path=geph4-client/Cargo.toml
cross build --release --locked --target aarch64-unknown-linux-gnu --manifest-path=geph4-client/Cargo.toml
mkdir OUTPUT
mv target/x86_64-pc-linux-gnu/release/geph4-client OUTPUT/geph4-client-linux-amd64
mv target/aarch64-linux-android/release/geph4-client OUTPUT/geph4-client-android-aarch64
mv target/aarch64-unknown-linux-gnu/release/geph4-client OUTPUT/geph4-client-linux-aarch64
exit 0
