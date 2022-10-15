# Build Stage
FROM ghcr.io/evanrichter/cargo-fuzz:latest AS builder

# Add source code
ADD . /src
WORKDIR /src

# Build fuzzers
RUN cd ensure_wasm/fuzz && cargo fuzz build

# Package Stage
FROM ubuntu:latest
COPY --from=builder src/ensure_wasm/fuzz/target/x86_64-unknown-linux-gnu/release/fuzz_* /fuzzers/