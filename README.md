# DexxLauncher

A permissionless launcher for deploying tokens on Base using the Clanker Factory.

## Features

- Deploy tokens through Clanker Factory
- Built with Foundry
- GitHub Actions CI/CD
- Automatic BaseScan verification
- Open source

## Contract

Network: Base Mainnet

DexxLauncher:
`0xED13c8788e3Dd52bfFD7B4aeA36eC90a3a01ceC1`

## Tech Stack

- Solidity
- Foundry
- GitHub Actions
- Base
- Clanker Factory

## Development

Clone the repository:

```bash
git clone https://github.com/Dexxcuyy/DexxLauncher.git
cd DexxLauncher
forge install
forge build
forge test
```

## Deploy

```bash
forge script script/Deploy.s.sol \
  --rpc-url <BASE_RPC> \
  --private-key <PRIVATE_KEY> \
  --broadcast \
  --verify
```

## License

MIT
