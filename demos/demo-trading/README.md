# Trading System Demo – Secure Item Exchange
=========================================

This project demonstrates a secure player-to-player trading system for Roblox.
It includes full server authority to prevent duping, exploits or unfair trades.
This system connects with the Inventory System (Demo 2).

Features
--------
- Player trade requests
- Add/remove offered items
- Double-lock confirmation system
- Trade cancel and cleanup
- Safe server-side validation
- Inventory integration
- Modular code structure

Architecture
------------
- TradeService manages trade offers and states.
- TradeManager handles active trade sessions.
- TradeController connects remotes and server logic.
- TradeExecutor safely exchanges inventory items.

File Structure
--------------
demos/demo-trading/src
│
├── TradeService.lua       -- Trade logic
├── TradeManager.lua       -- Active trade sessions
├── TradeRemotes.lua       -- Remote events
├── TradeController.lua    -- Remote connections
├── TradeExecutor.lua      -- Final trade exchange
├── TradeClient.lua        -- Client API
└── TradeClientLoader.lua  -- Client initializer

Example Usage
-------------
-- Request trade
TradeClient:Request(targetPlayer)

-- Add offer
TradeClient:AddItem("Apple", 3)

-- Confirm
TradeClient:Lock()
TradeClient:Confirm()

Next Steps
----------
- Add trading UI
- Add trade logs for moderation
- Add trade cooldown or limits
- Anti-scam inspection
