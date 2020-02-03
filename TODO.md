* Prove formally that [Alice received (openChannel, Alice, Bob, init, tid) from E && Alice
  sent (news, {..}.has(tid), \_, \_) to E && for all i in |out|, [Alice received (pay,
  Bob, out\_i, \_, \_) to E && Alice sent (news, \_, \_, {..}.has(receipt of out\_i)) to
  E] && for all i in |in|, [Alice received (TODO) from TODO && Alice sent (news, \_, \_,
  {..}.has(receipt of in\_i)) to E]] -> [blockchain will eventually have a tx from which
  Alice will be able to unilaterally spend at least init - sum(out\_i) + sum(in\_i)]
