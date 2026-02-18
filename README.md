# HackQuest SUI Blockchain Tutorial

### Getting Started

Initialize the SUI project

```
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
