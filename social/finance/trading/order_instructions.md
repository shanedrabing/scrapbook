# Order Instructions

## Basics

|Order Instruction|Description
|-|-
|Market Order|An order to buy or sell a security at the best available price in the market. Market orders are typically executed quickly, but the price at which they are filled may be different from the current market price.
|Limit Order|An order to buy or sell a security at a specific price or better. Limit orders allow investors to specify the maximum price they are willing to pay for a security (buy limit order) or the minimum price at which they are willing to sell a security (sell limit order).
|Stop Order|An order to buy or sell a security when a certain price is reached (stop price). A stop order becomes a market order once the stop price is reached. Stop orders can be used to limit losses (sell stop order) or protect profits (buy stop order).
|Stop-Limit Order|A combination of a stop order and a limit order. A stop-limit order becomes a limit order once the stop price is reached. The limit price specifies the maximum (buy stop-limit order) or minimum (sell stop-limit order) price at which the order can be filled.
|Trail Stop Order|An order to buy or sell a security at a specific trailing price relative to the market price. A trail stop order allows an investor to specify a percentage or dollar amount by which the stop price will trail the market price. As the market price moves in favor of the investor, the stop price will also move in the same direction, preserving the investor's profits.
|Market on Close Order (MOC)|An order to buy or sell a security at the closing price of the market. MOC orders are typically used to execute trades at the end of the trading day.
|Limit on Close Order (LOC)|An order to buy or sell a security at the closing price of the market, but only if the closing price is at or better than the specified limit price. LOC orders allow investors to specify the maximum price they are willing to pay for a security (buy LOC order) or the minimum price at which they are willing to sell a security (sell LOC order).

## Stop Instructions

|Order Type|Description
|-|-
|Standard (STD)|A stop order that becomes a market order when the stop price is reached. This means that the order will be filled at the best available price at the time the stop price is triggered.
|Ask|A stop order that becomes a limit order when the stop price is reached. This means that the order will be filled at a specified price or better. If the ask price is not available, the order will not be filled.
|Market (MARK)|A stop order that becomes a market order when the stop price is reached. This means that the order will be filled at the best available price at the time the stop price is triggered. MARK stop orders are often used to protect profits in a long position or to limit losses in a short position.

## Time in Force

|Order Instruction|Description
|-|-
|Day|An order instruction indicating that the order will only be valid for the current trading day and will be automatically cancelled if not filled by the end of the trading day.
|Good Till Cancelled (GTC)|An order instruction indicating that the order will remain in effect until it is either filled or explicitly cancelled by the investor. GTC orders are typically used when an investor wants to place an order that will remain active for an extended period of time.
|Extend (EXT)|An order instruction indicating that the order will remain in effect until a specified expiration date. If the order is not filled by the expiration date, it will be automatically cancelled.
|Good Till Cancelled with Extension (GTC_EXT)|An order instruction combining GTC and EXT. This means that the order will remain in effect until it is either filled or explicitly cancelled by the investor, or until a specified expiration date. If the order is not filled or cancelled by the expiration date, it will be automatically cancelled.
|At the Market (AM)|An order instruction indicating that the order should be executed at the current market price. AM orders are typically used when an investor wants to buy or sell a security as quickly as possible.
|Priority Market (PM)|An order instruction indicating that the order should be executed at the current market price, but with priority over other orders. PM orders are typically used when an investor wants to ensure that their order is filled before orders placed at the same price by other investors.

## Additional Instructions

|Order Instruction|Description
|-|-
|All or None (AON)|An order instruction indicating that the order should be filled in its entirety or not at all. If there are not enough shares available to fill the order, the order will not be executed.
|Do Not Reduce (DNR)|An order instruction indicating that the order should not be filled at a price that is lower than the specified limit price. If the market price falls below the limit price, the order will not be executed.
|All or None/Do Not Reduce (AON/DNR)|An order instruction that combines both AON and DNR. This means that the order should be filled in its entirety at the specified limit price or better, or not at all. If there are not enough shares available at the limit price or better, the order will not be executed.
