module hackquest::hackquestdemo {
    use std::string;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::coin_registry;

    const NAME: vector<u8> = b"Hackquest Demo";
    const SYMBOL: vector<u8> = b"hackquestdemo";
    const DESCRIPTION: vector<u8> = b"Hackquest Demo Token as Part of Learning Track";

    public struct HACKQUESTDEMO has drop {}

    fun init(witness: HACKQUESTDEMO, ctx: &mut sui::tx_context::TxContext) {
        let (builder, treasury) = coin_registry::new_currency_with_otw(
            witness,
            6,
            string::utf8(SYMBOL),
            string::utf8(NAME),
            string::utf8(DESCRIPTION),
            string::utf8(b""),
            ctx,
        );
        let metadata_cap = coin_registry::finalize(builder, ctx);
        sui::transfer::public_transfer(metadata_cap, sui::tx_context::sender(ctx));
        sui::transfer::public_transfer(treasury, sui::tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<HACKQUESTDEMO>,
        amount: u64,
        recipient: address,
        ctx: &mut sui::tx_context::TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        sui::transfer::public_transfer(coin, recipient);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<HACKQUESTDEMO>,
        burn_coin: Coin<HACKQUESTDEMO>,
    ): u64 {
        coin::burn(treasury_cap, burn_coin)
    }
}
