# HackQuest SUI Blockchain Tutorial

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

And find the published transaction in Testnet.

> - Transaction Link: https://suiscan.xyz/testnet/tx/Gi94eUwkGpMudwtx9BZUh1ytuVEd4SDaverBa9u38z1m
> - Package ID: `0x03da33646d23b50afd5365e2f861156b521a84111f17a21d27a1ec4c1b7f0472`
> - Treasury Cap ID: `0xbd290799fa7598be21351753e42abc1fc0680d2354084e0d8ae421e31f400ba1` (Account Address)
> - Recipient Address: `0xb607f8885f16891551e6f3a2105fedf1383f4b1fbb7314f2bf3bb87d21f8539c`

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

### Increasing SUI Tokens

> Switch to TestNet environment: `sui client switch --env testnet` for all client interactions

Go to `https://faucet.sui.io/?address=<your address>` to click for more SUI tokens.

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
