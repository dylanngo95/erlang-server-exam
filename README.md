Erlang Server TCP Socket Example
=====

An OTP application

Build and Start
-----

```bash
rebar3 compile
rebar3 shell
tr_server:start_link(1055).
```

Connect to server

```bash
telnet localhost 1055
```
