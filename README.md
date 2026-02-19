# HackQuest SUI Blockchain Tutorial

1. [Publishing a Coin](./hackquest)
2. [Publishing a NFT](./hackquest_nft)
3. [Staking](./locked_stake)

## 1. Publishing a Coin

### Getting Started

Initialize the SUI project

```
sui client switch --env testnet
sui move new hackquest
cd hackquest
```

Build and Publish to Testnet

```
sui move build
sui client publish --gas-budget 5000000000
```

Transaction Link: https://suiscan.xyz/testnet/tx/Gi94eUwkGpMudwtx9BZUh1ytuVEd4SDaverBa9u38z1m

### Minting Tokens

Find the published transaction in Testnet.

> - Package ID: `0x03da33646d23b50afd5365e2f861156b521a84111f17a21d27a1ec4c1b7f0472`
> - Treasury Cap ID: `0xbd290799fa7598be21351753e42abc1fc0680d2354084e0d8ae421e31f400ba1` (Account Address)
> - Recipient Address: `0x848f974492fcc0482429a47a80e6b9ae4c80299b11685639915c6f1e97f8aee8`


Run the following to Mint some tokens

```
sui client call --package [recorded package ID] --module hackquestdemo  --function mint --args  [recorded Obj ID] [minting amount] [recipient's address]  --gas-budget=100000000 
```

> ```
> sui client call \
>   --package <YOUR_PACKAGE_ID> \
>   --module hackquestdemo \
>   --function mint \
>   --args <TREASURY_CAP_ID> 100 <RECIPIENT_ADDRESS> \
>   --gas-budget 100000000
> ```

```
sui client call --package 0x03da33646d23b50afd5365e2f861156b521a84111f17a21d27a1ec4c1b7f0472 --module hackquestdemo --function burn --args 0xbd290799fa7598be21351753e42abc1fc0680d2354084e0d8ae421e31f400ba1 <SPLIT_COIN_ID>
```

Refer: https://suiscan.xyz/testnet/tx/41jjJnPAtL7wJekRHNfzucY6hN97VDb8FfwLqUKUF9n9

### Burning Tokens

Firstly, split the tokens (e.g. 50 tokens),

```
sui client split-coin --coin-id <YOUR_HACKQUESTDEMO_OBJECT_ID> --amounts 50 --gas-budget 10000000
```

In which becomes (use object ID of a transaction),

```
sui client split-coin --coin-id 0xd2923fd271dba2a1826df032e11b8f9a035c5f9107d234da056d7bcdfa2020a5 --amounts 50 --gas-budget 10000000
```

Then burn the splited coin,

```
sui client call --package 0xd51732128687125b406d8f0a28bbd8e18cf5f513f9c4940f47532bfb93cadfac --module hackquestdemo --function burn --args 0xbd290799fa7598be21351753e42abc1fc0680d2354084e0d8ae421e31f400ba1 0xcb4f5ab2d144d3c8c434d39a32cae311027df4b353e97ebe917d681528eb436a --gas-budget 10000000
```

Refer: https://suiscan.xyz/testnet/tx/7zgThBGJ4eHGNoTRS12XJiHLoexQvrdmtmaaH8rse5Ty

### Updating Packages

```
sui client upgrade --upgrade-capability 0x5451b60c48247d2031f5341b9ad83eabe66c71a0c8db7a5e44602bdd06a7d7e1 --gas-budget 100000000
```

### Increasing SUI Tokens

> Switch to TestNet environment: `sui client switch --env testnet` for all client interactions

Go to `https://faucet.sui.io/?address=<your address>` to click for more SUI tokens.

## 2. Publishing a NFT

### Viewing the NFT Transaction History

Obtain the SUI address,

```
sui client active-address
```

Then go to https://suiscan.xyz/testnet/ to search for the address and relevant NFT object created.

> - Transaction Link: https://suiscan.xyz/testnet/tx/DKta5W88iNnSfo9ZEgdHiaaTkK3M9hiA5R6HDXHQCxyS
> - Package ID: `0x54f4051ce2493ae5966f6158874901400310a4b16fb3cbf4833049d024f50921`
> - Publisher: `0x0d51ae37ad3fe24b65d403c0797f5322cf149e1e2e936c226db5d3ad05048a31`
> - Upgrade Cap: `0x240851a2816ebd0c46e4f9a8010ee2fc0672d6714bad6e7d41e840ee66fbc940`
> - Display: `0xcf24a9a17ae60e770beebaec0e71b52dac7bde01cb1e2833521d06233ea490bd`
> - MintRecord: `0xd9c92790a50a406abf1dfc5266346376c7b1cf556571d917d74979c27b18e1b1`

### Minting NFT

```
export PACKAGE="0x54f4051ce2493ae5966f6158874901400310a4b16fb3cbf4833049d024f50921"
export MODULE="hackquestdemo_nft"
export MINTRECORD="0xd9c92790a50a406abf1dfc5266346376c7b1cf556571d917d74979c27b18e1b1"
export RECIPIENT="0x848f974492fcc0482429a47a80e6b9ae4c80299b11685639915c6f1e97f8aee8"
sui client call --package $PACKAGE --module $MODULE --function mint --args $MINTRECORD "Github NFT" "https://avatars.githubusercontent.com/u/23555588" $RECIPIENT
```

Completed transaction: https://suiscan.xyz/testnet/tx/9ueqT9QEp32u5tMwzUa3dvJSVpv1kKcEvtfKTaLTvkhm

### Burning NFT

Based on completed transaction:

> - NFT ID: `0x4c70ef4fc8e0077dd8fe9bb6477509f9585c85dfd607b04fd5d52df6bc2d26ed`
> - MintRecord: `0xd9c92790a50a406abf1dfc5266346376c7b1cf556571d917d74979c27b18e1b1`

```
// Local contract function call, remember to change the addresses to your own
export MINTRECORD="0xd9c92790a50a406abf1dfc5266346376c7b1cf556571d917d74979c27b18e1b1"
export NFT="0x4c70ef4fc8e0077dd8fe9bb6477509f9585c85dfd607b04fd5d52df6bc2d26ed"
sui client call --package $PACKAGE --module $MODULE --function burn --args $MINTRECORD $NFT --gas-budget 100000000
```

## 3. Staking

View transaction after publish here: https://suiscan.xyz/testnet/tx/C8hioAFLgWV4zkfYcqu7JxvDQUPuJw7XRVSjDEp6fSJ5

Obtain the package ID and then call,

```
sui client ptb --move-call 0x14161048af697c6bc6c09d34d8044d660252b97e01d1c20916fd59f54827aebe::locked_stake::new 5000
```

_Note that `5000` is a guess. Increase as necessary for the epoch_

Reference: https://suiscan.xyz/testnet/tx/3LDyiVZdY2u5NdA6ubZ1HNE3oak2xbaS2duEx4PVyL3M

### Storing Funds

```
sui client call --package <package ID> --module locked_stake --function deposit_sui --args <LOCKED_STAKE_ID> <GAS_COIN_OBJECT_ID> 
```

```
sui client call --package 0x14161048af697c6bc6c09d34d8044d660252b97e01d1c20916fd59f54827aebe --module locked_stake --function deposit_sui --args 0x2b3a12bdf83a6d98f86d089d9fc14ac8379fa417c55c8bdefd88cbe365dda786 0xc84d9787baa0eba26e34c2836d0c14c8a5751ddc47d0441b4f75144dcdb05fc4 
```
Refer: https://suiscan.xyz/testnet/tx/BV3mAkCoLWjHxvZKzE4xhQ6ofJnGTX3LstcRF77Z9238


### Obtaining Balance

```
sui client call --package 0x14161048af697c6bc6c09d34d8044d660252b97e01d1c20916fd59f54827aebe --module locked_stake --function sui_balance --args 0x2b3a12bdf83a6d98f86d089d9fc14ac8379fa417c55c8bdefd88cbe365dda786
```

### Staking

```
sui client call --package <package id> --module locked_stake --function stake --args <LOCKED_STAKE_ID> 0x5 1000000000 <VALIDATOR_ADDRESS> --gas <GAS_COIN_OBJECT_ID> --gas-budget 50000000
```

```
sui client call --package 0x14161048af697c6bc6c09d34d8044d660252b97e01d1c20916fd59f54827aebe --module locked_stake --function stake --args 0x2b3a12bdf83a6d98f86d089d9fc14ac8379fa417c55c8bdefd88cbe365dda786 0x5 1000000000 0x44b1b319e23495995fc837dafd28fc6af8b645edddff0fc1467f1ad631362c23 --gas 0x43d0c7a61c83bd3c5bcfb5224197d248367578997b07023446f67d05b08471b4 --gas-budget 50000000
```

Refer: https://suiscan.xyz/testnet/tx/8T5Vob7JvdGRuDf1B29m539dfqKM6iR7uWXK3kJT6ETj

### Unstaking

```
sui client call --package 0x14161048af697c6bc6c09d34d8044d660252b97e01d1c20916fd59f54827aebe --module locked_stake  --function unstake --args 0x2b3a12bdf83a6d98f86d089d9fc14ac8379fa417c55c8bdefd88cbe365dda786 0x5 0xd5cd8bc5ce3efe8b27247505f87a019b5405df672773836783841946f009de63
```

Refer: https://suiscan.xyz/testnet/tx/2cHrsZkN9i44YhmzUZQ2f27hx9hn9zXHmVkEqH5aPZHa
