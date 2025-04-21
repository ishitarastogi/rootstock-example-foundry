# rootstock-example-foundry


# 🌱 RootToken – Simple ERC20 Faucet

A minimal ERC20 faucet token where anyone can claim a fixed amount of tokens to **any address**, once per cooldown period.

---

## 🛠️ How to Run, Deploy & Verify

This project uses **[Foundry](https://book.getfoundry.sh/)** for development and deployment.

<hr/>

<h3>✅ 1. Build the Contract</h3>
<pre><code>forge build</code></pre>

<h3>✅ 2. Run Tests</h3>
<pre><code>forge test</code></pre>

<h3>✅ 3. Deploy to Rootstock Testnet</h3>
<pre><code>export PRIVATE_KEY=&lt;your-private-key&gt;

forge script script/Deploy.s.sol \
  --rpc-url https://public-node.testnet.rsk.co \
  --broadcast \
  --legacy \
  --evm-version london
</code></pre>

<p><strong>Expected Output:</strong><br/>
  <img width="1027" alt="Screenshot 2025-04-21 at 9 08 36 AM" src="https://github.com/user-attachments/assets/e280286e-9fa8-4b9b-9107-6cb93023aa29" />
<code>
[Success] Hash: 0xac00f21b941a5f7ae2a584fd79372eb9910da31201f0316d6c5437486440a177<br/>
Contract Address: 0x9Ad8A78833921EBc0bB4eB79C420020D212c8efF
</code></p>

<h3>🔍 4. Verify on Explorer</h3>
<ol>
  <li>Go to <a href="https://explorer.testnet.rootstock.io/">Rootstock Testnet Explorer</a></li>
  <li>Paste your deployed address <code>0x9Ad8A78833921EBc0bB4eB79C420020D212c8efF</code></li>
  <li>Click <strong>Code</strong> → <strong>Verify &amp; Publish</strong></li>
  <li>Fill in the required info
  </li>
  <li>Click <strong>Verify</strong></li>
</ol>

<p>🔗 <a href="https://explorer.testnet.rootstock.io/address/0x9ad8a78833921ebc0bb4eb79c420020d212c8eff?__ctab=Contract%20Interaction">View Verified Contract</a></p>

<hr/>

<h3>🔧 Interact with the Contract</h3>
<p>Once your contract is verified, you can invoke the <code>claimTo(address)</code> function directly from the Rootstock Testnet Explorer:</p>
<img width="1248" alt="Screenshot 2025-04-21 at 9 29 37 AM" src="https://github.com/user-attachments/assets/4e1c9646-c8c0-43d3-8fe8-18d051491a00" />

<ol>
  <li>Navigate to your contract’s page, e.g.  
      <a href="https://explorer.testnet.rootstock.io/address/0x9ad8a78833921ebc0bb4eb79c420020d212c8eff?__ctab=Contract%20Interaction">
      Explorer &gt; Contract Interaction</a>
  </li>
  <li>In the “Function” dropdown select <code>claimTo</code></li>
  <li>Enter the recipient address you want to fund, e.g. <code>0xYourRecipientAddress</code></li>
  <li>Click **claimTo** and confirm the transaction in your wallet</li>
</ol>

<p>✅ Each address can successfully call <code>claimTo</code> once per 24 hours, minting <strong>100 ROOT</strong> to the specified recipient.</p>

<hr/>



<p>Or in the Explorer’s **Contract Interaction** tab:</p>
<pre><code>claimTo("0xYourRecipientAddress")</code></pre>
<p>ℹ️ Each address can claim once per <strong>24 hours</strong>.</p>
<img width="1087" alt="Screenshot 2025-04-21 at 9 02 39 AM" src="https://github.com/user-attachments/assets/3cbf018b-0119-4fb6-9f37-8aa770d375fa" />
<hr/>

<h3>🦊 Add to MetaMask</h3>
<ol>
  <li>Open MetaMask → <strong>Import Tokens</strong></li>
  <li>Paste <strong>Token Contract Address</strong>:<br/>
      <code>0x9Ad8A78833921EBc0bB4eB79C420020D212c8efF</code>
  </li>
  <li>Token Symbol: <code>ROOT</code></li>
  <li>Decimals: <code>18</code></li>
  <li>Click <strong>Add Custom Token</strong></li>
</ol>

<hr/>

<h3>📂 Project Structure</h3>
<pre><code>.
├── src/
│   └── RootToken.sol        # ERC‑20 faucet contract
├── script/
│   └── Deploy.s.sol         # Foundry deployment script
├── test/
│   └── RootToken.t.sol      # Unit tests
├── foundry.toml             # Foundry config
└── README.md                # This file
</code></pre>

<hr/>

