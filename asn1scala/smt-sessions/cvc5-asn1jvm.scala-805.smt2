; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23336 () Bool)

(assert start!23336)

(declare-fun b!118585 () Bool)

(declare-fun res!98148 () Bool)

(declare-fun e!77740 () Bool)

(assert (=> b!118585 (=> (not res!98148) (not e!77740))))

(declare-datatypes ((array!5321 0))(
  ( (array!5322 (arr!3006 (Array (_ BitVec 32) (_ BitVec 8))) (size!2413 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4300 0))(
  ( (BitStream!4301 (buf!2832 array!5321) (currentByte!5487 (_ BitVec 32)) (currentBit!5482 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4300)

(declare-datatypes ((Unit!7297 0))(
  ( (Unit!7298) )
))
(declare-datatypes ((tuple2!9940 0))(
  ( (tuple2!9941 (_1!5235 Unit!7297) (_2!5235 BitStream!4300)) )
))
(declare-fun lt!182448 () tuple2!9940)

(declare-fun isPrefixOf!0 (BitStream!4300 BitStream!4300) Bool)

(assert (=> b!118585 (= res!98148 (isPrefixOf!0 thiss!1305 (_2!5235 lt!182448)))))

(declare-fun b!118586 () Bool)

(declare-fun res!98150 () Bool)

(declare-fun e!77741 () Bool)

(assert (=> b!118586 (=> (not res!98150) (not e!77741))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!118586 (= res!98150 (bvslt i!615 nBits!396))))

(declare-fun b!118587 () Bool)

(declare-fun e!77739 () Bool)

(assert (=> b!118587 (= e!77739 e!77740)))

(declare-fun res!98142 () Bool)

(assert (=> b!118587 (=> (not res!98142) (not e!77740))))

(declare-fun lt!182464 () (_ BitVec 64))

(declare-fun lt!182462 () (_ BitVec 64))

(assert (=> b!118587 (= res!98142 (= lt!182464 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!182462)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118587 (= lt!182464 (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182448))) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))))))

(assert (=> b!118587 (= lt!182462 (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)))))

(declare-fun b!118588 () Bool)

(declare-fun res!98143 () Bool)

(assert (=> b!118588 (=> (not res!98143) (not e!77741))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118588 (= res!98143 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!118589 () Bool)

(declare-fun e!77742 () Bool)

(assert (=> b!118589 (= e!77741 (not e!77742))))

(declare-fun res!98146 () Bool)

(assert (=> b!118589 (=> res!98146 e!77742)))

(declare-datatypes ((tuple2!9942 0))(
  ( (tuple2!9943 (_1!5236 BitStream!4300) (_2!5236 BitStream!4300)) )
))
(declare-fun lt!182447 () tuple2!9942)

(declare-fun lt!182459 () (_ BitVec 64))

(declare-datatypes ((tuple2!9944 0))(
  ( (tuple2!9945 (_1!5237 BitStream!4300) (_2!5237 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9944)

(assert (=> b!118589 (= res!98146 (not (= (_1!5237 (readNLeastSignificantBitsLoopPure!0 (_1!5236 lt!182447) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182459)) (_2!5236 lt!182447))))))

(declare-fun lt!182446 () tuple2!9940)

(declare-fun lt!182470 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118589 (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182448))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182448))) lt!182470)))

(declare-fun lt!182460 () Unit!7297)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4300 array!5321 (_ BitVec 64)) Unit!7297)

(assert (=> b!118589 (= lt!182460 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5235 lt!182448) (buf!2832 (_2!5235 lt!182446)) lt!182470))))

(assert (=> b!118589 (= lt!182470 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!9946 0))(
  ( (tuple2!9947 (_1!5238 BitStream!4300) (_2!5238 Bool)) )
))
(declare-fun lt!182465 () tuple2!9946)

(declare-fun lt!182457 () (_ BitVec 64))

(declare-fun lt!182472 () (_ BitVec 64))

(assert (=> b!118589 (= lt!182459 (bvor lt!182472 (ite (_2!5238 lt!182465) lt!182457 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!182455 () tuple2!9942)

(declare-fun lt!182467 () tuple2!9944)

(assert (=> b!118589 (= lt!182467 (readNLeastSignificantBitsLoopPure!0 (_1!5236 lt!182455) nBits!396 i!615 lt!182472))))

(declare-fun lt!182469 () (_ BitVec 64))

(assert (=> b!118589 (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))) ((_ sign_extend 32) (currentByte!5487 thiss!1305)) ((_ sign_extend 32) (currentBit!5482 thiss!1305)) lt!182469)))

(declare-fun lt!182468 () Unit!7297)

(assert (=> b!118589 (= lt!182468 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2832 (_2!5235 lt!182446)) lt!182469))))

(assert (=> b!118589 (= lt!182472 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!182471 () Bool)

(assert (=> b!118589 (= (_2!5238 lt!182465) lt!182471)))

(declare-fun readBitPure!0 (BitStream!4300) tuple2!9946)

(assert (=> b!118589 (= lt!182465 (readBitPure!0 (_1!5236 lt!182455)))))

(declare-fun reader!0 (BitStream!4300 BitStream!4300) tuple2!9942)

(assert (=> b!118589 (= lt!182447 (reader!0 (_2!5235 lt!182448) (_2!5235 lt!182446)))))

(assert (=> b!118589 (= lt!182455 (reader!0 thiss!1305 (_2!5235 lt!182446)))))

(declare-fun e!77744 () Bool)

(assert (=> b!118589 e!77744))

(declare-fun res!98151 () Bool)

(assert (=> b!118589 (=> (not res!98151) (not e!77744))))

(declare-fun lt!182449 () tuple2!9946)

(declare-fun lt!182450 () tuple2!9946)

(assert (=> b!118589 (= res!98151 (= (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!182449))) (currentByte!5487 (_1!5238 lt!182449)) (currentBit!5482 (_1!5238 lt!182449))) (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!182450))) (currentByte!5487 (_1!5238 lt!182450)) (currentBit!5482 (_1!5238 lt!182450)))))))

(declare-fun lt!182458 () Unit!7297)

(declare-fun lt!182453 () BitStream!4300)

(declare-fun readBitPrefixLemma!0 (BitStream!4300 BitStream!4300) Unit!7297)

(assert (=> b!118589 (= lt!182458 (readBitPrefixLemma!0 lt!182453 (_2!5235 lt!182446)))))

(assert (=> b!118589 (= lt!182450 (readBitPure!0 (BitStream!4301 (buf!2832 (_2!5235 lt!182446)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305))))))

(assert (=> b!118589 (= lt!182449 (readBitPure!0 lt!182453))))

(assert (=> b!118589 (= lt!182453 (BitStream!4301 (buf!2832 (_2!5235 lt!182448)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)))))

(declare-fun e!77747 () Bool)

(assert (=> b!118589 e!77747))

(declare-fun res!98145 () Bool)

(assert (=> b!118589 (=> (not res!98145) (not e!77747))))

(assert (=> b!118589 (= res!98145 (isPrefixOf!0 thiss!1305 (_2!5235 lt!182446)))))

(declare-fun lt!182452 () Unit!7297)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4300 BitStream!4300 BitStream!4300) Unit!7297)

(assert (=> b!118589 (= lt!182452 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5235 lt!182448) (_2!5235 lt!182446)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4300 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9940)

(assert (=> b!118589 (= lt!182446 (appendNLeastSignificantBitsLoop!0 (_2!5235 lt!182448) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!118589 e!77739))

(declare-fun res!98149 () Bool)

(assert (=> b!118589 (=> (not res!98149) (not e!77739))))

(assert (=> b!118589 (= res!98149 (= (size!2413 (buf!2832 thiss!1305)) (size!2413 (buf!2832 (_2!5235 lt!182448)))))))

(declare-fun appendBit!0 (BitStream!4300 Bool) tuple2!9940)

(assert (=> b!118589 (= lt!182448 (appendBit!0 thiss!1305 lt!182471))))

(assert (=> b!118589 (= lt!182471 (not (= (bvand v!199 lt!182457) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118589 (= lt!182457 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!118590 () Bool)

(declare-fun e!77746 () Bool)

(declare-fun lt!182461 () tuple2!9946)

(assert (=> b!118590 (= e!77746 (= (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!182461))) (currentByte!5487 (_1!5238 lt!182461)) (currentBit!5482 (_1!5238 lt!182461))) lt!182464))))

(declare-fun b!118591 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!118591 (= e!77747 (invariant!0 (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305) (size!2413 (buf!2832 (_2!5235 lt!182446)))))))

(declare-fun b!118592 () Bool)

(assert (=> b!118592 (= e!77740 e!77746)))

(declare-fun res!98141 () Bool)

(assert (=> b!118592 (=> (not res!98141) (not e!77746))))

(assert (=> b!118592 (= res!98141 (and (= (_2!5238 lt!182461) lt!182471) (= (_1!5238 lt!182461) (_2!5235 lt!182448))))))

(declare-fun readerFrom!0 (BitStream!4300 (_ BitVec 32) (_ BitVec 32)) BitStream!4300)

(assert (=> b!118592 (= lt!182461 (readBitPure!0 (readerFrom!0 (_2!5235 lt!182448) (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305))))))

(declare-fun b!118594 () Bool)

(declare-fun e!77748 () Bool)

(declare-fun array_inv!2215 (array!5321) Bool)

(assert (=> b!118594 (= e!77748 (array_inv!2215 (buf!2832 thiss!1305)))))

(declare-fun b!118595 () Bool)

(assert (=> b!118595 (= e!77744 (= (_2!5238 lt!182449) (_2!5238 lt!182450)))))

(declare-fun b!118596 () Bool)

(declare-fun e!77743 () Bool)

(assert (=> b!118596 (= e!77743 e!77741)))

(declare-fun res!98147 () Bool)

(assert (=> b!118596 (=> (not res!98147) (not e!77741))))

(assert (=> b!118596 (= res!98147 (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 thiss!1305))) ((_ sign_extend 32) (currentByte!5487 thiss!1305)) ((_ sign_extend 32) (currentBit!5482 thiss!1305)) lt!182469))))

(assert (=> b!118596 (= lt!182469 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!118597 () Bool)

(declare-fun res!98140 () Bool)

(assert (=> b!118597 (=> (not res!98140) (not e!77747))))

(assert (=> b!118597 (= res!98140 (invariant!0 (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305) (size!2413 (buf!2832 (_2!5235 lt!182448)))))))

(declare-fun lt!182454 () (_ BitVec 64))

(declare-fun lt!182466 () (_ BitVec 64))

(declare-fun lt!182451 () (_ BitVec 64))

(declare-fun b!118593 () Bool)

(assert (=> b!118593 (= e!77742 (or (= lt!182451 (bvand lt!182454 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!182451 (bvand (bvsub lt!182466 lt!182454) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!118593 (= lt!182451 (bvand lt!182466 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!118593 (= lt!182454 (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182446))) (currentByte!5487 (_2!5235 lt!182446)) (currentBit!5482 (_2!5235 lt!182446))))))

(assert (=> b!118593 (= lt!182466 (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)))))

(declare-fun lt!182456 () tuple2!9944)

(assert (=> b!118593 (and (= (_2!5237 lt!182467) (_2!5237 lt!182456)) (= (_1!5237 lt!182467) (_1!5237 lt!182456)))))

(declare-fun lt!182463 () Unit!7297)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7297)

(assert (=> b!118593 (= lt!182463 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5236 lt!182455) nBits!396 i!615 lt!182472))))

(declare-fun withMovedBitIndex!0 (BitStream!4300 (_ BitVec 64)) BitStream!4300)

(assert (=> b!118593 (= lt!182456 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5236 lt!182455) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182459))))

(declare-fun res!98144 () Bool)

(assert (=> start!23336 (=> (not res!98144) (not e!77743))))

(assert (=> start!23336 (= res!98144 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23336 e!77743))

(assert (=> start!23336 true))

(declare-fun inv!12 (BitStream!4300) Bool)

(assert (=> start!23336 (and (inv!12 thiss!1305) e!77748)))

(assert (= (and start!23336 res!98144) b!118596))

(assert (= (and b!118596 res!98147) b!118588))

(assert (= (and b!118588 res!98143) b!118586))

(assert (= (and b!118586 res!98150) b!118589))

(assert (= (and b!118589 res!98149) b!118587))

(assert (= (and b!118587 res!98142) b!118585))

(assert (= (and b!118585 res!98148) b!118592))

(assert (= (and b!118592 res!98141) b!118590))

(assert (= (and b!118589 res!98145) b!118597))

(assert (= (and b!118597 res!98140) b!118591))

(assert (= (and b!118589 res!98151) b!118595))

(assert (= (and b!118589 (not res!98146)) b!118593))

(assert (= start!23336 b!118594))

(declare-fun m!178157 () Bool)

(assert (=> b!118591 m!178157))

(declare-fun m!178159 () Bool)

(assert (=> b!118597 m!178159))

(declare-fun m!178161 () Bool)

(assert (=> b!118585 m!178161))

(declare-fun m!178163 () Bool)

(assert (=> b!118594 m!178163))

(declare-fun m!178165 () Bool)

(assert (=> b!118596 m!178165))

(declare-fun m!178167 () Bool)

(assert (=> b!118593 m!178167))

(declare-fun m!178169 () Bool)

(assert (=> b!118593 m!178169))

(declare-fun m!178171 () Bool)

(assert (=> b!118593 m!178171))

(declare-fun m!178173 () Bool)

(assert (=> b!118593 m!178173))

(assert (=> b!118593 m!178171))

(declare-fun m!178175 () Bool)

(assert (=> b!118593 m!178175))

(declare-fun m!178177 () Bool)

(assert (=> b!118590 m!178177))

(declare-fun m!178179 () Bool)

(assert (=> b!118592 m!178179))

(assert (=> b!118592 m!178179))

(declare-fun m!178181 () Bool)

(assert (=> b!118592 m!178181))

(declare-fun m!178183 () Bool)

(assert (=> start!23336 m!178183))

(declare-fun m!178185 () Bool)

(assert (=> b!118588 m!178185))

(declare-fun m!178187 () Bool)

(assert (=> b!118589 m!178187))

(declare-fun m!178189 () Bool)

(assert (=> b!118589 m!178189))

(declare-fun m!178191 () Bool)

(assert (=> b!118589 m!178191))

(declare-fun m!178193 () Bool)

(assert (=> b!118589 m!178193))

(declare-fun m!178195 () Bool)

(assert (=> b!118589 m!178195))

(declare-fun m!178197 () Bool)

(assert (=> b!118589 m!178197))

(declare-fun m!178199 () Bool)

(assert (=> b!118589 m!178199))

(declare-fun m!178201 () Bool)

(assert (=> b!118589 m!178201))

(declare-fun m!178203 () Bool)

(assert (=> b!118589 m!178203))

(declare-fun m!178205 () Bool)

(assert (=> b!118589 m!178205))

(declare-fun m!178207 () Bool)

(assert (=> b!118589 m!178207))

(declare-fun m!178209 () Bool)

(assert (=> b!118589 m!178209))

(declare-fun m!178211 () Bool)

(assert (=> b!118589 m!178211))

(declare-fun m!178213 () Bool)

(assert (=> b!118589 m!178213))

(declare-fun m!178215 () Bool)

(assert (=> b!118589 m!178215))

(declare-fun m!178217 () Bool)

(assert (=> b!118589 m!178217))

(declare-fun m!178219 () Bool)

(assert (=> b!118589 m!178219))

(declare-fun m!178221 () Bool)

(assert (=> b!118589 m!178221))

(declare-fun m!178223 () Bool)

(assert (=> b!118589 m!178223))

(declare-fun m!178225 () Bool)

(assert (=> b!118587 m!178225))

(assert (=> b!118587 m!178167))

(push 1)

(assert (not b!118594))

(assert (not b!118591))

(assert (not b!118596))

(assert (not b!118592))

(assert (not b!118590))

(assert (not b!118585))

(assert (not start!23336))

(assert (not b!118593))

(assert (not b!118587))

(assert (not b!118589))

(assert (not b!118597))

(assert (not b!118588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37902 () Bool)

(declare-datatypes ((tuple2!9964 0))(
  ( (tuple2!9965 (_1!5247 Bool) (_2!5247 BitStream!4300)) )
))
(declare-fun lt!182637 () tuple2!9964)

(declare-fun readBit!0 (BitStream!4300) tuple2!9964)

(assert (=> d!37902 (= lt!182637 (readBit!0 (readerFrom!0 (_2!5235 lt!182448) (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305))))))

(assert (=> d!37902 (= (readBitPure!0 (readerFrom!0 (_2!5235 lt!182448) (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305))) (tuple2!9947 (_2!5247 lt!182637) (_1!5247 lt!182637)))))

(declare-fun bs!9176 () Bool)

(assert (= bs!9176 d!37902))

(assert (=> bs!9176 m!178179))

(declare-fun m!178367 () Bool)

(assert (=> bs!9176 m!178367))

(assert (=> b!118592 d!37902))

(declare-fun d!37904 () Bool)

(declare-fun e!77811 () Bool)

(assert (=> d!37904 e!77811))

(declare-fun res!98227 () Bool)

(assert (=> d!37904 (=> (not res!98227) (not e!77811))))

(assert (=> d!37904 (= res!98227 (invariant!0 (currentBit!5482 (_2!5235 lt!182448)) (currentByte!5487 (_2!5235 lt!182448)) (size!2413 (buf!2832 (_2!5235 lt!182448)))))))

(assert (=> d!37904 (= (readerFrom!0 (_2!5235 lt!182448) (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305)) (BitStream!4301 (buf!2832 (_2!5235 lt!182448)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)))))

(declare-fun b!118678 () Bool)

(assert (=> b!118678 (= e!77811 (invariant!0 (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305) (size!2413 (buf!2832 (_2!5235 lt!182448)))))))

(assert (= (and d!37904 res!98227) b!118678))

(declare-fun m!178369 () Bool)

(assert (=> d!37904 m!178369))

(assert (=> b!118678 m!178159))

(assert (=> b!118592 d!37904))

(declare-fun d!37906 () Bool)

(assert (=> d!37906 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305) (size!2413 (buf!2832 thiss!1305))))))

(declare-fun bs!9177 () Bool)

(assert (= bs!9177 d!37906))

(declare-fun m!178371 () Bool)

(assert (=> bs!9177 m!178371))

(assert (=> start!23336 d!37906))

(declare-fun d!37908 () Bool)

(assert (=> d!37908 (= (invariant!0 (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305) (size!2413 (buf!2832 (_2!5235 lt!182446)))) (and (bvsge (currentBit!5482 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5482 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5487 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5487 thiss!1305) (size!2413 (buf!2832 (_2!5235 lt!182446)))) (and (= (currentBit!5482 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5487 thiss!1305) (size!2413 (buf!2832 (_2!5235 lt!182446))))))))))

(assert (=> b!118591 d!37908))

(declare-fun d!37910 () Bool)

(declare-fun e!77814 () Bool)

(assert (=> d!37910 e!77814))

(declare-fun res!98232 () Bool)

(assert (=> d!37910 (=> (not res!98232) (not e!77814))))

(declare-fun lt!182650 () (_ BitVec 64))

(declare-fun lt!182655 () (_ BitVec 64))

(declare-fun lt!182652 () (_ BitVec 64))

(assert (=> d!37910 (= res!98232 (= lt!182655 (bvsub lt!182652 lt!182650)))))

(assert (=> d!37910 (or (= (bvand lt!182652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182652 lt!182650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37910 (= lt!182650 (remainingBits!0 ((_ sign_extend 32) (size!2413 (buf!2832 (_1!5238 lt!182461)))) ((_ sign_extend 32) (currentByte!5487 (_1!5238 lt!182461))) ((_ sign_extend 32) (currentBit!5482 (_1!5238 lt!182461)))))))

(declare-fun lt!182651 () (_ BitVec 64))

(declare-fun lt!182654 () (_ BitVec 64))

(assert (=> d!37910 (= lt!182652 (bvmul lt!182651 lt!182654))))

(assert (=> d!37910 (or (= lt!182651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!182654 (bvsdiv (bvmul lt!182651 lt!182654) lt!182651)))))

(assert (=> d!37910 (= lt!182654 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37910 (= lt!182651 ((_ sign_extend 32) (size!2413 (buf!2832 (_1!5238 lt!182461)))))))

(assert (=> d!37910 (= lt!182655 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5487 (_1!5238 lt!182461))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5482 (_1!5238 lt!182461)))))))

(assert (=> d!37910 (invariant!0 (currentBit!5482 (_1!5238 lt!182461)) (currentByte!5487 (_1!5238 lt!182461)) (size!2413 (buf!2832 (_1!5238 lt!182461))))))

(assert (=> d!37910 (= (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!182461))) (currentByte!5487 (_1!5238 lt!182461)) (currentBit!5482 (_1!5238 lt!182461))) lt!182655)))

(declare-fun b!118683 () Bool)

(declare-fun res!98233 () Bool)

(assert (=> b!118683 (=> (not res!98233) (not e!77814))))

(assert (=> b!118683 (= res!98233 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!182655))))

(declare-fun b!118684 () Bool)

(declare-fun lt!182653 () (_ BitVec 64))

(assert (=> b!118684 (= e!77814 (bvsle lt!182655 (bvmul lt!182653 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118684 (or (= lt!182653 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!182653 #b0000000000000000000000000000000000000000000000000000000000001000) lt!182653)))))

(assert (=> b!118684 (= lt!182653 ((_ sign_extend 32) (size!2413 (buf!2832 (_1!5238 lt!182461)))))))

(assert (= (and d!37910 res!98232) b!118683))

(assert (= (and b!118683 res!98233) b!118684))

(declare-fun m!178373 () Bool)

(assert (=> d!37910 m!178373))

(declare-fun m!178375 () Bool)

(assert (=> d!37910 m!178375))

(assert (=> b!118590 d!37910))

(declare-fun d!37912 () Bool)

(declare-fun e!77820 () Bool)

(assert (=> d!37912 e!77820))

(declare-fun res!98240 () Bool)

(assert (=> d!37912 (=> (not res!98240) (not e!77820))))

(declare-fun lt!182710 () tuple2!9942)

(assert (=> d!37912 (= res!98240 (isPrefixOf!0 (_1!5236 lt!182710) (_2!5236 lt!182710)))))

(declare-fun lt!182705 () BitStream!4300)

(assert (=> d!37912 (= lt!182710 (tuple2!9943 lt!182705 (_2!5235 lt!182446)))))

(declare-fun lt!182706 () Unit!7297)

(declare-fun lt!182698 () Unit!7297)

(assert (=> d!37912 (= lt!182706 lt!182698)))

(assert (=> d!37912 (isPrefixOf!0 lt!182705 (_2!5235 lt!182446))))

(assert (=> d!37912 (= lt!182698 (lemmaIsPrefixTransitive!0 lt!182705 (_2!5235 lt!182446) (_2!5235 lt!182446)))))

(declare-fun lt!182699 () Unit!7297)

(declare-fun lt!182703 () Unit!7297)

(assert (=> d!37912 (= lt!182699 lt!182703)))

(assert (=> d!37912 (isPrefixOf!0 lt!182705 (_2!5235 lt!182446))))

(assert (=> d!37912 (= lt!182703 (lemmaIsPrefixTransitive!0 lt!182705 thiss!1305 (_2!5235 lt!182446)))))

(declare-fun lt!182709 () Unit!7297)

(declare-fun e!77819 () Unit!7297)

(assert (=> d!37912 (= lt!182709 e!77819)))

(declare-fun c!7123 () Bool)

(assert (=> d!37912 (= c!7123 (not (= (size!2413 (buf!2832 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!182714 () Unit!7297)

(declare-fun lt!182700 () Unit!7297)

(assert (=> d!37912 (= lt!182714 lt!182700)))

(assert (=> d!37912 (isPrefixOf!0 (_2!5235 lt!182446) (_2!5235 lt!182446))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4300) Unit!7297)

(assert (=> d!37912 (= lt!182700 (lemmaIsPrefixRefl!0 (_2!5235 lt!182446)))))

(declare-fun lt!182701 () Unit!7297)

(declare-fun lt!182697 () Unit!7297)

(assert (=> d!37912 (= lt!182701 lt!182697)))

(assert (=> d!37912 (= lt!182697 (lemmaIsPrefixRefl!0 (_2!5235 lt!182446)))))

(declare-fun lt!182711 () Unit!7297)

(declare-fun lt!182702 () Unit!7297)

(assert (=> d!37912 (= lt!182711 lt!182702)))

(assert (=> d!37912 (isPrefixOf!0 lt!182705 lt!182705)))

(assert (=> d!37912 (= lt!182702 (lemmaIsPrefixRefl!0 lt!182705))))

(declare-fun lt!182707 () Unit!7297)

(declare-fun lt!182715 () Unit!7297)

(assert (=> d!37912 (= lt!182707 lt!182715)))

(assert (=> d!37912 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37912 (= lt!182715 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37912 (= lt!182705 (BitStream!4301 (buf!2832 (_2!5235 lt!182446)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)))))

(assert (=> d!37912 (isPrefixOf!0 thiss!1305 (_2!5235 lt!182446))))

(assert (=> d!37912 (= (reader!0 thiss!1305 (_2!5235 lt!182446)) lt!182710)))

(declare-fun b!118695 () Bool)

(declare-fun res!98241 () Bool)

(assert (=> b!118695 (=> (not res!98241) (not e!77820))))

(assert (=> b!118695 (= res!98241 (isPrefixOf!0 (_2!5236 lt!182710) (_2!5235 lt!182446)))))

(declare-fun b!118696 () Bool)

(declare-fun res!98242 () Bool)

(assert (=> b!118696 (=> (not res!98242) (not e!77820))))

(assert (=> b!118696 (= res!98242 (isPrefixOf!0 (_1!5236 lt!182710) thiss!1305))))

(declare-fun b!118697 () Bool)

(declare-fun lt!182696 () Unit!7297)

(assert (=> b!118697 (= e!77819 lt!182696)))

(declare-fun lt!182708 () (_ BitVec 64))

(assert (=> b!118697 (= lt!182708 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182712 () (_ BitVec 64))

(assert (=> b!118697 (= lt!182712 (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5321 array!5321 (_ BitVec 64) (_ BitVec 64)) Unit!7297)

(assert (=> b!118697 (= lt!182696 (arrayBitRangesEqSymmetric!0 (buf!2832 thiss!1305) (buf!2832 (_2!5235 lt!182446)) lt!182708 lt!182712))))

(declare-fun arrayBitRangesEq!0 (array!5321 array!5321 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118697 (arrayBitRangesEq!0 (buf!2832 (_2!5235 lt!182446)) (buf!2832 thiss!1305) lt!182708 lt!182712)))

(declare-fun lt!182704 () (_ BitVec 64))

(declare-fun lt!182713 () (_ BitVec 64))

(declare-fun b!118698 () Bool)

(assert (=> b!118698 (= e!77820 (= (_1!5236 lt!182710) (withMovedBitIndex!0 (_2!5236 lt!182710) (bvsub lt!182713 lt!182704))))))

(assert (=> b!118698 (or (= (bvand lt!182713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182713 lt!182704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118698 (= lt!182704 (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182446))) (currentByte!5487 (_2!5235 lt!182446)) (currentBit!5482 (_2!5235 lt!182446))))))

(assert (=> b!118698 (= lt!182713 (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)))))

(declare-fun b!118699 () Bool)

(declare-fun Unit!7303 () Unit!7297)

(assert (=> b!118699 (= e!77819 Unit!7303)))

(assert (= (and d!37912 c!7123) b!118697))

(assert (= (and d!37912 (not c!7123)) b!118699))

(assert (= (and d!37912 res!98240) b!118696))

(assert (= (and b!118696 res!98242) b!118695))

(assert (= (and b!118695 res!98241) b!118698))

(declare-fun m!178377 () Bool)

(assert (=> b!118695 m!178377))

(declare-fun m!178379 () Bool)

(assert (=> b!118696 m!178379))

(assert (=> d!37912 m!178209))

(declare-fun m!178381 () Bool)

(assert (=> d!37912 m!178381))

(declare-fun m!178383 () Bool)

(assert (=> d!37912 m!178383))

(declare-fun m!178385 () Bool)

(assert (=> d!37912 m!178385))

(declare-fun m!178387 () Bool)

(assert (=> d!37912 m!178387))

(declare-fun m!178389 () Bool)

(assert (=> d!37912 m!178389))

(declare-fun m!178391 () Bool)

(assert (=> d!37912 m!178391))

(declare-fun m!178393 () Bool)

(assert (=> d!37912 m!178393))

(declare-fun m!178395 () Bool)

(assert (=> d!37912 m!178395))

(declare-fun m!178397 () Bool)

(assert (=> d!37912 m!178397))

(declare-fun m!178399 () Bool)

(assert (=> d!37912 m!178399))

(declare-fun m!178401 () Bool)

(assert (=> b!118698 m!178401))

(assert (=> b!118698 m!178169))

(assert (=> b!118698 m!178167))

(assert (=> b!118697 m!178167))

(declare-fun m!178403 () Bool)

(assert (=> b!118697 m!178403))

(declare-fun m!178405 () Bool)

(assert (=> b!118697 m!178405))

(assert (=> b!118589 d!37912))

(declare-fun d!37914 () Bool)

(declare-fun e!77823 () Bool)

(assert (=> d!37914 e!77823))

(declare-fun res!98245 () Bool)

(assert (=> d!37914 (=> (not res!98245) (not e!77823))))

(declare-fun lt!182726 () tuple2!9946)

(declare-fun lt!182727 () tuple2!9946)

(assert (=> d!37914 (= res!98245 (= (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!182726))) (currentByte!5487 (_1!5238 lt!182726)) (currentBit!5482 (_1!5238 lt!182726))) (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!182727))) (currentByte!5487 (_1!5238 lt!182727)) (currentBit!5482 (_1!5238 lt!182727)))))))

(declare-fun lt!182724 () Unit!7297)

(declare-fun lt!182725 () BitStream!4300)

(declare-fun choose!50 (BitStream!4300 BitStream!4300 BitStream!4300 tuple2!9946 tuple2!9946 BitStream!4300 Bool tuple2!9946 tuple2!9946 BitStream!4300 Bool) Unit!7297)

(assert (=> d!37914 (= lt!182724 (choose!50 lt!182453 (_2!5235 lt!182446) lt!182725 lt!182726 (tuple2!9947 (_1!5238 lt!182726) (_2!5238 lt!182726)) (_1!5238 lt!182726) (_2!5238 lt!182726) lt!182727 (tuple2!9947 (_1!5238 lt!182727) (_2!5238 lt!182727)) (_1!5238 lt!182727) (_2!5238 lt!182727)))))

(assert (=> d!37914 (= lt!182727 (readBitPure!0 lt!182725))))

(assert (=> d!37914 (= lt!182726 (readBitPure!0 lt!182453))))

(assert (=> d!37914 (= lt!182725 (BitStream!4301 (buf!2832 (_2!5235 lt!182446)) (currentByte!5487 lt!182453) (currentBit!5482 lt!182453)))))

(assert (=> d!37914 (invariant!0 (currentBit!5482 lt!182453) (currentByte!5487 lt!182453) (size!2413 (buf!2832 (_2!5235 lt!182446))))))

(assert (=> d!37914 (= (readBitPrefixLemma!0 lt!182453 (_2!5235 lt!182446)) lt!182724)))

(declare-fun b!118702 () Bool)

(assert (=> b!118702 (= e!77823 (= (_2!5238 lt!182726) (_2!5238 lt!182727)))))

(assert (= (and d!37914 res!98245) b!118702))

(declare-fun m!178407 () Bool)

(assert (=> d!37914 m!178407))

(declare-fun m!178409 () Bool)

(assert (=> d!37914 m!178409))

(assert (=> d!37914 m!178213))

(declare-fun m!178411 () Bool)

(assert (=> d!37914 m!178411))

(declare-fun m!178413 () Bool)

(assert (=> d!37914 m!178413))

(declare-fun m!178415 () Bool)

(assert (=> d!37914 m!178415))

(assert (=> b!118589 d!37914))

(declare-fun d!37916 () Bool)

(assert (=> d!37916 (isPrefixOf!0 thiss!1305 (_2!5235 lt!182446))))

(declare-fun lt!182730 () Unit!7297)

(declare-fun choose!30 (BitStream!4300 BitStream!4300 BitStream!4300) Unit!7297)

(assert (=> d!37916 (= lt!182730 (choose!30 thiss!1305 (_2!5235 lt!182448) (_2!5235 lt!182446)))))

(assert (=> d!37916 (isPrefixOf!0 thiss!1305 (_2!5235 lt!182448))))

(assert (=> d!37916 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5235 lt!182448) (_2!5235 lt!182446)) lt!182730)))

(declare-fun bs!9178 () Bool)

(assert (= bs!9178 d!37916))

(assert (=> bs!9178 m!178209))

(declare-fun m!178417 () Bool)

(assert (=> bs!9178 m!178417))

(assert (=> bs!9178 m!178161))

(assert (=> b!118589 d!37916))

(declare-fun d!37918 () Bool)

(assert (=> d!37918 (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182448))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182448))) lt!182470)))

(declare-fun lt!182733 () Unit!7297)

(declare-fun choose!9 (BitStream!4300 array!5321 (_ BitVec 64) BitStream!4300) Unit!7297)

(assert (=> d!37918 (= lt!182733 (choose!9 (_2!5235 lt!182448) (buf!2832 (_2!5235 lt!182446)) lt!182470 (BitStream!4301 (buf!2832 (_2!5235 lt!182446)) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448)))))))

(assert (=> d!37918 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5235 lt!182448) (buf!2832 (_2!5235 lt!182446)) lt!182470) lt!182733)))

(declare-fun bs!9179 () Bool)

(assert (= bs!9179 d!37918))

(assert (=> bs!9179 m!178195))

(declare-fun m!178419 () Bool)

(assert (=> bs!9179 m!178419))

(assert (=> b!118589 d!37918))

(declare-fun d!37920 () Bool)

(declare-fun e!77825 () Bool)

(assert (=> d!37920 e!77825))

(declare-fun res!98246 () Bool)

(assert (=> d!37920 (=> (not res!98246) (not e!77825))))

(declare-fun lt!182748 () tuple2!9942)

(assert (=> d!37920 (= res!98246 (isPrefixOf!0 (_1!5236 lt!182748) (_2!5236 lt!182748)))))

(declare-fun lt!182743 () BitStream!4300)

(assert (=> d!37920 (= lt!182748 (tuple2!9943 lt!182743 (_2!5235 lt!182446)))))

(declare-fun lt!182744 () Unit!7297)

(declare-fun lt!182736 () Unit!7297)

(assert (=> d!37920 (= lt!182744 lt!182736)))

(assert (=> d!37920 (isPrefixOf!0 lt!182743 (_2!5235 lt!182446))))

(assert (=> d!37920 (= lt!182736 (lemmaIsPrefixTransitive!0 lt!182743 (_2!5235 lt!182446) (_2!5235 lt!182446)))))

(declare-fun lt!182737 () Unit!7297)

(declare-fun lt!182741 () Unit!7297)

(assert (=> d!37920 (= lt!182737 lt!182741)))

(assert (=> d!37920 (isPrefixOf!0 lt!182743 (_2!5235 lt!182446))))

(assert (=> d!37920 (= lt!182741 (lemmaIsPrefixTransitive!0 lt!182743 (_2!5235 lt!182448) (_2!5235 lt!182446)))))

(declare-fun lt!182747 () Unit!7297)

(declare-fun e!77824 () Unit!7297)

(assert (=> d!37920 (= lt!182747 e!77824)))

(declare-fun c!7124 () Bool)

(assert (=> d!37920 (= c!7124 (not (= (size!2413 (buf!2832 (_2!5235 lt!182448))) #b00000000000000000000000000000000)))))

(declare-fun lt!182752 () Unit!7297)

(declare-fun lt!182738 () Unit!7297)

(assert (=> d!37920 (= lt!182752 lt!182738)))

(assert (=> d!37920 (isPrefixOf!0 (_2!5235 lt!182446) (_2!5235 lt!182446))))

(assert (=> d!37920 (= lt!182738 (lemmaIsPrefixRefl!0 (_2!5235 lt!182446)))))

(declare-fun lt!182739 () Unit!7297)

(declare-fun lt!182735 () Unit!7297)

(assert (=> d!37920 (= lt!182739 lt!182735)))

(assert (=> d!37920 (= lt!182735 (lemmaIsPrefixRefl!0 (_2!5235 lt!182446)))))

(declare-fun lt!182749 () Unit!7297)

(declare-fun lt!182740 () Unit!7297)

(assert (=> d!37920 (= lt!182749 lt!182740)))

(assert (=> d!37920 (isPrefixOf!0 lt!182743 lt!182743)))

(assert (=> d!37920 (= lt!182740 (lemmaIsPrefixRefl!0 lt!182743))))

(declare-fun lt!182745 () Unit!7297)

(declare-fun lt!182753 () Unit!7297)

(assert (=> d!37920 (= lt!182745 lt!182753)))

(assert (=> d!37920 (isPrefixOf!0 (_2!5235 lt!182448) (_2!5235 lt!182448))))

(assert (=> d!37920 (= lt!182753 (lemmaIsPrefixRefl!0 (_2!5235 lt!182448)))))

(assert (=> d!37920 (= lt!182743 (BitStream!4301 (buf!2832 (_2!5235 lt!182446)) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))))))

(assert (=> d!37920 (isPrefixOf!0 (_2!5235 lt!182448) (_2!5235 lt!182446))))

(assert (=> d!37920 (= (reader!0 (_2!5235 lt!182448) (_2!5235 lt!182446)) lt!182748)))

(declare-fun b!118703 () Bool)

(declare-fun res!98247 () Bool)

(assert (=> b!118703 (=> (not res!98247) (not e!77825))))

(assert (=> b!118703 (= res!98247 (isPrefixOf!0 (_2!5236 lt!182748) (_2!5235 lt!182446)))))

(declare-fun b!118704 () Bool)

(declare-fun res!98248 () Bool)

(assert (=> b!118704 (=> (not res!98248) (not e!77825))))

(assert (=> b!118704 (= res!98248 (isPrefixOf!0 (_1!5236 lt!182748) (_2!5235 lt!182448)))))

(declare-fun b!118705 () Bool)

(declare-fun lt!182734 () Unit!7297)

(assert (=> b!118705 (= e!77824 lt!182734)))

(declare-fun lt!182746 () (_ BitVec 64))

(assert (=> b!118705 (= lt!182746 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182750 () (_ BitVec 64))

(assert (=> b!118705 (= lt!182750 (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182448))) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))))))

(assert (=> b!118705 (= lt!182734 (arrayBitRangesEqSymmetric!0 (buf!2832 (_2!5235 lt!182448)) (buf!2832 (_2!5235 lt!182446)) lt!182746 lt!182750))))

(assert (=> b!118705 (arrayBitRangesEq!0 (buf!2832 (_2!5235 lt!182446)) (buf!2832 (_2!5235 lt!182448)) lt!182746 lt!182750)))

(declare-fun lt!182742 () (_ BitVec 64))

(declare-fun b!118706 () Bool)

(declare-fun lt!182751 () (_ BitVec 64))

(assert (=> b!118706 (= e!77825 (= (_1!5236 lt!182748) (withMovedBitIndex!0 (_2!5236 lt!182748) (bvsub lt!182751 lt!182742))))))

(assert (=> b!118706 (or (= (bvand lt!182751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182742 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182751 lt!182742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118706 (= lt!182742 (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182446))) (currentByte!5487 (_2!5235 lt!182446)) (currentBit!5482 (_2!5235 lt!182446))))))

(assert (=> b!118706 (= lt!182751 (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182448))) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))))))

(declare-fun b!118707 () Bool)

(declare-fun Unit!7304 () Unit!7297)

(assert (=> b!118707 (= e!77824 Unit!7304)))

(assert (= (and d!37920 c!7124) b!118705))

(assert (= (and d!37920 (not c!7124)) b!118707))

(assert (= (and d!37920 res!98246) b!118704))

(assert (= (and b!118704 res!98248) b!118703))

(assert (= (and b!118703 res!98247) b!118706))

(declare-fun m!178421 () Bool)

(assert (=> b!118703 m!178421))

(declare-fun m!178423 () Bool)

(assert (=> b!118704 m!178423))

(declare-fun m!178425 () Bool)

(assert (=> d!37920 m!178425))

(declare-fun m!178427 () Bool)

(assert (=> d!37920 m!178427))

(assert (=> d!37920 m!178383))

(declare-fun m!178429 () Bool)

(assert (=> d!37920 m!178429))

(declare-fun m!178431 () Bool)

(assert (=> d!37920 m!178431))

(declare-fun m!178433 () Bool)

(assert (=> d!37920 m!178433))

(assert (=> d!37920 m!178391))

(declare-fun m!178435 () Bool)

(assert (=> d!37920 m!178435))

(declare-fun m!178437 () Bool)

(assert (=> d!37920 m!178437))

(declare-fun m!178439 () Bool)

(assert (=> d!37920 m!178439))

(declare-fun m!178441 () Bool)

(assert (=> d!37920 m!178441))

(declare-fun m!178443 () Bool)

(assert (=> b!118706 m!178443))

(assert (=> b!118706 m!178169))

(assert (=> b!118706 m!178225))

(assert (=> b!118705 m!178225))

(declare-fun m!178445 () Bool)

(assert (=> b!118705 m!178445))

(declare-fun m!178447 () Bool)

(assert (=> b!118705 m!178447))

(assert (=> b!118589 d!37920))

(declare-fun d!37922 () Bool)

(assert (=> d!37922 (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))) ((_ sign_extend 32) (currentByte!5487 thiss!1305)) ((_ sign_extend 32) (currentBit!5482 thiss!1305)) lt!182469)))

(declare-fun lt!182754 () Unit!7297)

(assert (=> d!37922 (= lt!182754 (choose!9 thiss!1305 (buf!2832 (_2!5235 lt!182446)) lt!182469 (BitStream!4301 (buf!2832 (_2!5235 lt!182446)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305))))))

(assert (=> d!37922 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2832 (_2!5235 lt!182446)) lt!182469) lt!182754)))

(declare-fun bs!9180 () Bool)

(assert (= bs!9180 d!37922))

(assert (=> bs!9180 m!178217))

(declare-fun m!178449 () Bool)

(assert (=> bs!9180 m!178449))

(assert (=> b!118589 d!37922))

(declare-fun d!37924 () Bool)

(declare-fun e!77836 () Bool)

(assert (=> d!37924 e!77836))

(declare-fun res!98269 () Bool)

(assert (=> d!37924 (=> (not res!98269) (not e!77836))))

(declare-fun lt!182764 () tuple2!9940)

(assert (=> d!37924 (= res!98269 (= (size!2413 (buf!2832 thiss!1305)) (size!2413 (buf!2832 (_2!5235 lt!182764)))))))

(declare-fun choose!16 (BitStream!4300 Bool) tuple2!9940)

(assert (=> d!37924 (= lt!182764 (choose!16 thiss!1305 lt!182471))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37924 (validate_offset_bit!0 ((_ sign_extend 32) (size!2413 (buf!2832 thiss!1305))) ((_ sign_extend 32) (currentByte!5487 thiss!1305)) ((_ sign_extend 32) (currentBit!5482 thiss!1305)))))

(assert (=> d!37924 (= (appendBit!0 thiss!1305 lt!182471) lt!182764)))

(declare-fun b!118729 () Bool)

(declare-fun e!77837 () Bool)

(declare-fun lt!182765 () tuple2!9946)

(assert (=> b!118729 (= e!77837 (= (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!182765))) (currentByte!5487 (_1!5238 lt!182765)) (currentBit!5482 (_1!5238 lt!182765))) (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182764))) (currentByte!5487 (_2!5235 lt!182764)) (currentBit!5482 (_2!5235 lt!182764)))))))

(declare-fun b!118728 () Bool)

(assert (=> b!118728 (= e!77836 e!77837)))

(declare-fun res!98268 () Bool)

(assert (=> b!118728 (=> (not res!98268) (not e!77837))))

(assert (=> b!118728 (= res!98268 (and (= (_2!5238 lt!182765) lt!182471) (= (_1!5238 lt!182765) (_2!5235 lt!182764))))))

(assert (=> b!118728 (= lt!182765 (readBitPure!0 (readerFrom!0 (_2!5235 lt!182764) (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305))))))

(declare-fun b!118727 () Bool)

(declare-fun res!98267 () Bool)

(assert (=> b!118727 (=> (not res!98267) (not e!77836))))

(assert (=> b!118727 (= res!98267 (isPrefixOf!0 thiss!1305 (_2!5235 lt!182764)))))

(declare-fun b!118726 () Bool)

(declare-fun res!98266 () Bool)

(assert (=> b!118726 (=> (not res!98266) (not e!77836))))

(declare-fun lt!182763 () (_ BitVec 64))

(declare-fun lt!182766 () (_ BitVec 64))

(assert (=> b!118726 (= res!98266 (= (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182764))) (currentByte!5487 (_2!5235 lt!182764)) (currentBit!5482 (_2!5235 lt!182764))) (bvadd lt!182766 lt!182763)))))

(assert (=> b!118726 (or (not (= (bvand lt!182766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182763 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!182766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!182766 lt!182763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118726 (= lt!182763 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!118726 (= lt!182766 (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)))))

(assert (= (and d!37924 res!98269) b!118726))

(assert (= (and b!118726 res!98266) b!118727))

(assert (= (and b!118727 res!98267) b!118728))

(assert (= (and b!118728 res!98268) b!118729))

(declare-fun m!178453 () Bool)

(assert (=> b!118727 m!178453))

(declare-fun m!178455 () Bool)

(assert (=> b!118728 m!178455))

(assert (=> b!118728 m!178455))

(declare-fun m!178457 () Bool)

(assert (=> b!118728 m!178457))

(declare-fun m!178459 () Bool)

(assert (=> b!118726 m!178459))

(assert (=> b!118726 m!178167))

(declare-fun m!178461 () Bool)

(assert (=> b!118729 m!178461))

(assert (=> b!118729 m!178459))

(declare-fun m!178463 () Bool)

(assert (=> d!37924 m!178463))

(declare-fun m!178465 () Bool)

(assert (=> d!37924 m!178465))

(assert (=> b!118589 d!37924))

(declare-fun d!37932 () Bool)

(declare-fun e!77840 () Bool)

(assert (=> d!37932 e!77840))

(declare-fun res!98272 () Bool)

(assert (=> d!37932 (=> (not res!98272) (not e!77840))))

(declare-fun lt!182782 () (_ BitVec 64))

(declare-fun lt!182779 () (_ BitVec 64))

(declare-fun lt!182777 () (_ BitVec 64))

(assert (=> d!37932 (= res!98272 (= lt!182782 (bvsub lt!182779 lt!182777)))))

(assert (=> d!37932 (or (= (bvand lt!182779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182777 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182779 lt!182777) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37932 (= lt!182777 (remainingBits!0 ((_ sign_extend 32) (size!2413 (buf!2832 (_1!5238 lt!182449)))) ((_ sign_extend 32) (currentByte!5487 (_1!5238 lt!182449))) ((_ sign_extend 32) (currentBit!5482 (_1!5238 lt!182449)))))))

(declare-fun lt!182778 () (_ BitVec 64))

(declare-fun lt!182781 () (_ BitVec 64))

(assert (=> d!37932 (= lt!182779 (bvmul lt!182778 lt!182781))))

(assert (=> d!37932 (or (= lt!182778 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!182781 (bvsdiv (bvmul lt!182778 lt!182781) lt!182778)))))

(assert (=> d!37932 (= lt!182781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37932 (= lt!182778 ((_ sign_extend 32) (size!2413 (buf!2832 (_1!5238 lt!182449)))))))

(assert (=> d!37932 (= lt!182782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5487 (_1!5238 lt!182449))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5482 (_1!5238 lt!182449)))))))

(assert (=> d!37932 (invariant!0 (currentBit!5482 (_1!5238 lt!182449)) (currentByte!5487 (_1!5238 lt!182449)) (size!2413 (buf!2832 (_1!5238 lt!182449))))))

(assert (=> d!37932 (= (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!182449))) (currentByte!5487 (_1!5238 lt!182449)) (currentBit!5482 (_1!5238 lt!182449))) lt!182782)))

(declare-fun b!118730 () Bool)

(declare-fun res!98273 () Bool)

(assert (=> b!118730 (=> (not res!98273) (not e!77840))))

(assert (=> b!118730 (= res!98273 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!182782))))

(declare-fun b!118731 () Bool)

(declare-fun lt!182780 () (_ BitVec 64))

(assert (=> b!118731 (= e!77840 (bvsle lt!182782 (bvmul lt!182780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118731 (or (= lt!182780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!182780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!182780)))))

(assert (=> b!118731 (= lt!182780 ((_ sign_extend 32) (size!2413 (buf!2832 (_1!5238 lt!182449)))))))

(assert (= (and d!37932 res!98272) b!118730))

(assert (= (and b!118730 res!98273) b!118731))

(declare-fun m!178467 () Bool)

(assert (=> d!37932 m!178467))

(declare-fun m!178469 () Bool)

(assert (=> d!37932 m!178469))

(assert (=> b!118589 d!37932))

(declare-fun d!37934 () Bool)

(declare-fun e!77841 () Bool)

(assert (=> d!37934 e!77841))

(declare-fun res!98276 () Bool)

(assert (=> d!37934 (=> (not res!98276) (not e!77841))))

(declare-fun lt!182790 () (_ BitVec 64))

(declare-fun lt!182785 () (_ BitVec 64))

(declare-fun lt!182787 () (_ BitVec 64))

(assert (=> d!37934 (= res!98276 (= lt!182790 (bvsub lt!182787 lt!182785)))))

(assert (=> d!37934 (or (= (bvand lt!182787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182787 lt!182785) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37934 (= lt!182785 (remainingBits!0 ((_ sign_extend 32) (size!2413 (buf!2832 (_1!5238 lt!182450)))) ((_ sign_extend 32) (currentByte!5487 (_1!5238 lt!182450))) ((_ sign_extend 32) (currentBit!5482 (_1!5238 lt!182450)))))))

(declare-fun lt!182786 () (_ BitVec 64))

(declare-fun lt!182789 () (_ BitVec 64))

(assert (=> d!37934 (= lt!182787 (bvmul lt!182786 lt!182789))))

(assert (=> d!37934 (or (= lt!182786 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!182789 (bvsdiv (bvmul lt!182786 lt!182789) lt!182786)))))

(assert (=> d!37934 (= lt!182789 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37934 (= lt!182786 ((_ sign_extend 32) (size!2413 (buf!2832 (_1!5238 lt!182450)))))))

(assert (=> d!37934 (= lt!182790 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5487 (_1!5238 lt!182450))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5482 (_1!5238 lt!182450)))))))

(assert (=> d!37934 (invariant!0 (currentBit!5482 (_1!5238 lt!182450)) (currentByte!5487 (_1!5238 lt!182450)) (size!2413 (buf!2832 (_1!5238 lt!182450))))))

(assert (=> d!37934 (= (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!182450))) (currentByte!5487 (_1!5238 lt!182450)) (currentBit!5482 (_1!5238 lt!182450))) lt!182790)))

(declare-fun b!118736 () Bool)

(declare-fun res!98277 () Bool)

(assert (=> b!118736 (=> (not res!98277) (not e!77841))))

(assert (=> b!118736 (= res!98277 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!182790))))

(declare-fun b!118737 () Bool)

(declare-fun lt!182788 () (_ BitVec 64))

(assert (=> b!118737 (= e!77841 (bvsle lt!182790 (bvmul lt!182788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118737 (or (= lt!182788 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!182788 #b0000000000000000000000000000000000000000000000000000000000001000) lt!182788)))))

(assert (=> b!118737 (= lt!182788 ((_ sign_extend 32) (size!2413 (buf!2832 (_1!5238 lt!182450)))))))

(assert (= (and d!37934 res!98276) b!118736))

(assert (= (and b!118736 res!98277) b!118737))

(declare-fun m!178471 () Bool)

(assert (=> d!37934 m!178471))

(declare-fun m!178473 () Bool)

(assert (=> d!37934 m!178473))

(assert (=> b!118589 d!37934))

(declare-fun b!118805 () Bool)

(declare-fun e!77878 () Bool)

(declare-fun lt!183076 () tuple2!9944)

(declare-fun lt!183059 () tuple2!9942)

(assert (=> b!118805 (= e!77878 (and (= (_2!5237 lt!183076) v!199) (= (_1!5237 lt!183076) (_2!5236 lt!183059))))))

(declare-fun lt!183074 () (_ BitVec 64))

(assert (=> b!118805 (= lt!183076 (readNLeastSignificantBitsLoopPure!0 (_1!5236 lt!183059) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183074))))

(declare-fun lt!183092 () Unit!7297)

(declare-fun lt!183080 () Unit!7297)

(assert (=> b!118805 (= lt!183092 lt!183080)))

(declare-fun lt!183072 () tuple2!9940)

(declare-fun lt!183070 () (_ BitVec 64))

(assert (=> b!118805 (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!183072)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182448))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182448))) lt!183070)))

(assert (=> b!118805 (= lt!183080 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5235 lt!182448) (buf!2832 (_2!5235 lt!183072)) lt!183070))))

(declare-fun e!77884 () Bool)

(assert (=> b!118805 e!77884))

(declare-fun res!98331 () Bool)

(assert (=> b!118805 (=> (not res!98331) (not e!77884))))

(assert (=> b!118805 (= res!98331 (and (= (size!2413 (buf!2832 (_2!5235 lt!182448))) (size!2413 (buf!2832 (_2!5235 lt!183072)))) (bvsge lt!183070 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118805 (= lt!183070 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118805 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118805 (= lt!183074 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!118805 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118805 (= lt!183059 (reader!0 (_2!5235 lt!182448) (_2!5235 lt!183072)))))

(declare-fun b!118806 () Bool)

(declare-fun res!98337 () Bool)

(assert (=> b!118806 (=> (not res!98337) (not e!77878))))

(declare-fun lt!183090 () (_ BitVec 64))

(declare-fun lt!183068 () (_ BitVec 64))

(assert (=> b!118806 (= res!98337 (= (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!183072))) (currentByte!5487 (_2!5235 lt!183072)) (currentBit!5482 (_2!5235 lt!183072))) (bvadd lt!183090 lt!183068)))))

(assert (=> b!118806 (or (not (= (bvand lt!183090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183068 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!183090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!183090 lt!183068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118806 (= lt!183068 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118806 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118806 (= lt!183090 (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182448))) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))))))

(declare-fun b!118807 () Bool)

(declare-fun e!77881 () (_ BitVec 64))

(assert (=> b!118807 (= e!77881 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!118809 () Bool)

(declare-fun res!98330 () Bool)

(declare-fun lt!183083 () tuple2!9940)

(assert (=> b!118809 (= res!98330 (= (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!183083))) (currentByte!5487 (_2!5235 lt!183083)) (currentBit!5482 (_2!5235 lt!183083))) (bvadd (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182448))) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!77879 () Bool)

(assert (=> b!118809 (=> (not res!98330) (not e!77879))))

(declare-fun b!118810 () Bool)

(declare-fun e!77880 () tuple2!9940)

(declare-fun lt!183071 () tuple2!9940)

(declare-fun Unit!7305 () Unit!7297)

(assert (=> b!118810 (= e!77880 (tuple2!9941 Unit!7305 (_2!5235 lt!183071)))))

(declare-fun lt!183065 () Bool)

(assert (=> b!118810 (= lt!183065 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118810 (= lt!183083 (appendBit!0 (_2!5235 lt!182448) lt!183065))))

(declare-fun res!98333 () Bool)

(assert (=> b!118810 (= res!98333 (= (size!2413 (buf!2832 (_2!5235 lt!182448))) (size!2413 (buf!2832 (_2!5235 lt!183083)))))))

(assert (=> b!118810 (=> (not res!98333) (not e!77879))))

(assert (=> b!118810 e!77879))

(declare-fun lt!183055 () tuple2!9940)

(assert (=> b!118810 (= lt!183055 lt!183083)))

(assert (=> b!118810 (= lt!183071 (appendNLeastSignificantBitsLoop!0 (_2!5235 lt!183055) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!183075 () Unit!7297)

(assert (=> b!118810 (= lt!183075 (lemmaIsPrefixTransitive!0 (_2!5235 lt!182448) (_2!5235 lt!183055) (_2!5235 lt!183071)))))

(assert (=> b!118810 (isPrefixOf!0 (_2!5235 lt!182448) (_2!5235 lt!183071))))

(declare-fun lt!183089 () Unit!7297)

(assert (=> b!118810 (= lt!183089 lt!183075)))

(assert (=> b!118810 (invariant!0 (currentBit!5482 (_2!5235 lt!182448)) (currentByte!5487 (_2!5235 lt!182448)) (size!2413 (buf!2832 (_2!5235 lt!183055))))))

(declare-fun lt!183094 () BitStream!4300)

(assert (=> b!118810 (= lt!183094 (BitStream!4301 (buf!2832 (_2!5235 lt!183055)) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))))))

(assert (=> b!118810 (invariant!0 (currentBit!5482 lt!183094) (currentByte!5487 lt!183094) (size!2413 (buf!2832 (_2!5235 lt!183071))))))

(declare-fun lt!183077 () BitStream!4300)

(assert (=> b!118810 (= lt!183077 (BitStream!4301 (buf!2832 (_2!5235 lt!183071)) (currentByte!5487 lt!183094) (currentBit!5482 lt!183094)))))

(declare-fun lt!183087 () tuple2!9946)

(assert (=> b!118810 (= lt!183087 (readBitPure!0 lt!183094))))

(declare-fun lt!183093 () tuple2!9946)

(assert (=> b!118810 (= lt!183093 (readBitPure!0 lt!183077))))

(declare-fun lt!183067 () Unit!7297)

(assert (=> b!118810 (= lt!183067 (readBitPrefixLemma!0 lt!183094 (_2!5235 lt!183071)))))

(declare-fun res!98335 () Bool)

(assert (=> b!118810 (= res!98335 (= (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!183087))) (currentByte!5487 (_1!5238 lt!183087)) (currentBit!5482 (_1!5238 lt!183087))) (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!183093))) (currentByte!5487 (_1!5238 lt!183093)) (currentBit!5482 (_1!5238 lt!183093)))))))

(declare-fun e!77882 () Bool)

(assert (=> b!118810 (=> (not res!98335) (not e!77882))))

(assert (=> b!118810 e!77882))

(declare-fun lt!183079 () Unit!7297)

(assert (=> b!118810 (= lt!183079 lt!183067)))

(declare-fun lt!183078 () tuple2!9942)

(assert (=> b!118810 (= lt!183078 (reader!0 (_2!5235 lt!182448) (_2!5235 lt!183071)))))

(declare-fun lt!183060 () tuple2!9942)

(assert (=> b!118810 (= lt!183060 (reader!0 (_2!5235 lt!183055) (_2!5235 lt!183071)))))

(declare-fun lt!183063 () tuple2!9946)

(assert (=> b!118810 (= lt!183063 (readBitPure!0 (_1!5236 lt!183078)))))

(assert (=> b!118810 (= (_2!5238 lt!183063) lt!183065)))

(declare-fun lt!183050 () Unit!7297)

(declare-fun Unit!7306 () Unit!7297)

(assert (=> b!118810 (= lt!183050 Unit!7306)))

(declare-fun lt!183053 () (_ BitVec 64))

(assert (=> b!118810 (= lt!183053 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!183064 () (_ BitVec 64))

(assert (=> b!118810 (= lt!183064 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!183091 () Unit!7297)

(assert (=> b!118810 (= lt!183091 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5235 lt!182448) (buf!2832 (_2!5235 lt!183071)) lt!183064))))

(assert (=> b!118810 (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!183071)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182448))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182448))) lt!183064)))

(declare-fun lt!183081 () Unit!7297)

(assert (=> b!118810 (= lt!183081 lt!183091)))

(declare-fun lt!183056 () tuple2!9944)

(assert (=> b!118810 (= lt!183056 (readNLeastSignificantBitsLoopPure!0 (_1!5236 lt!183078) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183053))))

(declare-fun lt!183057 () (_ BitVec 64))

(assert (=> b!118810 (= lt!183057 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!183054 () Unit!7297)

(assert (=> b!118810 (= lt!183054 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5235 lt!183055) (buf!2832 (_2!5235 lt!183071)) lt!183057))))

(assert (=> b!118810 (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!183071)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!183055))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!183055))) lt!183057)))

(declare-fun lt!183069 () Unit!7297)

(assert (=> b!118810 (= lt!183069 lt!183054)))

(declare-fun lt!183073 () tuple2!9944)

(assert (=> b!118810 (= lt!183073 (readNLeastSignificantBitsLoopPure!0 (_1!5236 lt!183060) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!183053 (ite (_2!5238 lt!183063) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!183052 () tuple2!9944)

(assert (=> b!118810 (= lt!183052 (readNLeastSignificantBitsLoopPure!0 (_1!5236 lt!183078) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183053))))

(declare-fun c!7133 () Bool)

(assert (=> b!118810 (= c!7133 (_2!5238 (readBitPure!0 (_1!5236 lt!183078))))))

(declare-fun lt!183058 () tuple2!9944)

(assert (=> b!118810 (= lt!183058 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5236 lt!183078) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!183053 e!77881)))))

(declare-fun lt!183084 () Unit!7297)

(assert (=> b!118810 (= lt!183084 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5236 lt!183078) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183053))))

(assert (=> b!118810 (and (= (_2!5237 lt!183052) (_2!5237 lt!183058)) (= (_1!5237 lt!183052) (_1!5237 lt!183058)))))

(declare-fun lt!183061 () Unit!7297)

(assert (=> b!118810 (= lt!183061 lt!183084)))

(assert (=> b!118810 (= (_1!5236 lt!183078) (withMovedBitIndex!0 (_2!5236 lt!183078) (bvsub (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182448))) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))) (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!183071))) (currentByte!5487 (_2!5235 lt!183071)) (currentBit!5482 (_2!5235 lt!183071))))))))

(declare-fun lt!183062 () Unit!7297)

(declare-fun Unit!7307 () Unit!7297)

(assert (=> b!118810 (= lt!183062 Unit!7307)))

(assert (=> b!118810 (= (_1!5236 lt!183060) (withMovedBitIndex!0 (_2!5236 lt!183060) (bvsub (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!183055))) (currentByte!5487 (_2!5235 lt!183055)) (currentBit!5482 (_2!5235 lt!183055))) (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!183071))) (currentByte!5487 (_2!5235 lt!183071)) (currentBit!5482 (_2!5235 lt!183071))))))))

(declare-fun lt!183082 () Unit!7297)

(declare-fun Unit!7308 () Unit!7297)

(assert (=> b!118810 (= lt!183082 Unit!7308)))

(assert (=> b!118810 (= (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182448))) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))) (bvsub (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!183055))) (currentByte!5487 (_2!5235 lt!183055)) (currentBit!5482 (_2!5235 lt!183055))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!183086 () Unit!7297)

(declare-fun Unit!7309 () Unit!7297)

(assert (=> b!118810 (= lt!183086 Unit!7309)))

(assert (=> b!118810 (= (_2!5237 lt!183056) (_2!5237 lt!183073))))

(declare-fun lt!183085 () Unit!7297)

(declare-fun Unit!7310 () Unit!7297)

(assert (=> b!118810 (= lt!183085 Unit!7310)))

(assert (=> b!118810 (= (_1!5237 lt!183056) (_2!5236 lt!183078))))

(declare-fun call!1538 () Bool)

(declare-fun lt!183066 () BitStream!4300)

(declare-fun bm!1535 () Bool)

(declare-fun c!7134 () Bool)

(assert (=> bm!1535 (= call!1538 (isPrefixOf!0 (ite c!7134 (_2!5235 lt!182448) lt!183066) (ite c!7134 (_2!5235 lt!183083) lt!183066)))))

(declare-fun b!118811 () Bool)

(declare-fun res!98336 () Bool)

(assert (=> b!118811 (=> (not res!98336) (not e!77878))))

(assert (=> b!118811 (= res!98336 (isPrefixOf!0 (_2!5235 lt!182448) (_2!5235 lt!183072)))))

(declare-fun b!118812 () Bool)

(assert (=> b!118812 (= e!77881 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!118813 () Bool)

(declare-fun lt!183051 () tuple2!9946)

(assert (=> b!118813 (= lt!183051 (readBitPure!0 (readerFrom!0 (_2!5235 lt!183083) (currentBit!5482 (_2!5235 lt!182448)) (currentByte!5487 (_2!5235 lt!182448)))))))

(declare-fun res!98329 () Bool)

(assert (=> b!118813 (= res!98329 (and (= (_2!5238 lt!183051) lt!183065) (= (_1!5238 lt!183051) (_2!5235 lt!183083))))))

(declare-fun e!77883 () Bool)

(assert (=> b!118813 (=> (not res!98329) (not e!77883))))

(assert (=> b!118813 (= e!77879 e!77883)))

(declare-fun b!118814 () Bool)

(declare-fun lt!183088 () Unit!7297)

(assert (=> b!118814 (= e!77880 (tuple2!9941 lt!183088 (_2!5235 lt!182448)))))

(assert (=> b!118814 (= lt!183066 (_2!5235 lt!182448))))

(assert (=> b!118814 (= lt!183088 (lemmaIsPrefixRefl!0 lt!183066))))

(assert (=> b!118814 call!1538))

(declare-fun b!118815 () Bool)

(assert (=> b!118815 (= e!77883 (= (bitIndex!0 (size!2413 (buf!2832 (_1!5238 lt!183051))) (currentByte!5487 (_1!5238 lt!183051)) (currentBit!5482 (_1!5238 lt!183051))) (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!183083))) (currentByte!5487 (_2!5235 lt!183083)) (currentBit!5482 (_2!5235 lt!183083)))))))

(declare-fun d!37936 () Bool)

(assert (=> d!37936 e!77878))

(declare-fun res!98332 () Bool)

(assert (=> d!37936 (=> (not res!98332) (not e!77878))))

(assert (=> d!37936 (= res!98332 (= (size!2413 (buf!2832 (_2!5235 lt!182448))) (size!2413 (buf!2832 (_2!5235 lt!183072)))))))

(assert (=> d!37936 (= lt!183072 e!77880)))

(assert (=> d!37936 (= c!7134 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37936 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37936 (= (appendNLeastSignificantBitsLoop!0 (_2!5235 lt!182448) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!183072)))

(declare-fun b!118808 () Bool)

(assert (=> b!118808 (= e!77884 (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182448)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182448))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182448))) lt!183070))))

(declare-fun b!118816 () Bool)

(declare-fun res!98334 () Bool)

(assert (=> b!118816 (= res!98334 call!1538)))

(assert (=> b!118816 (=> (not res!98334) (not e!77879))))

(declare-fun b!118817 () Bool)

(assert (=> b!118817 (= e!77882 (= (_2!5238 lt!183087) (_2!5238 lt!183093)))))

(assert (= (and d!37936 c!7134) b!118810))

(assert (= (and d!37936 (not c!7134)) b!118814))

(assert (= (and b!118810 res!98333) b!118809))

(assert (= (and b!118809 res!98330) b!118816))

(assert (= (and b!118816 res!98334) b!118813))

(assert (= (and b!118813 res!98329) b!118815))

(assert (= (and b!118810 res!98335) b!118817))

(assert (= (and b!118810 c!7133) b!118807))

(assert (= (and b!118810 (not c!7133)) b!118812))

(assert (= (or b!118816 b!118814) bm!1535))

(assert (= (and d!37936 res!98332) b!118806))

(assert (= (and b!118806 res!98337) b!118811))

(assert (= (and b!118811 res!98336) b!118805))

(assert (= (and b!118805 res!98331) b!118808))

(declare-fun m!178603 () Bool)

(assert (=> b!118810 m!178603))

(declare-fun m!178605 () Bool)

(assert (=> b!118810 m!178605))

(declare-fun m!178607 () Bool)

(assert (=> b!118810 m!178607))

(declare-fun m!178609 () Bool)

(assert (=> b!118810 m!178609))

(declare-fun m!178611 () Bool)

(assert (=> b!118810 m!178611))

(declare-fun m!178613 () Bool)

(assert (=> b!118810 m!178613))

(declare-fun m!178615 () Bool)

(assert (=> b!118810 m!178615))

(declare-fun m!178617 () Bool)

(assert (=> b!118810 m!178617))

(declare-fun m!178619 () Bool)

(assert (=> b!118810 m!178619))

(declare-fun m!178621 () Bool)

(assert (=> b!118810 m!178621))

(declare-fun m!178623 () Bool)

(assert (=> b!118810 m!178623))

(declare-fun m!178625 () Bool)

(assert (=> b!118810 m!178625))

(declare-fun m!178627 () Bool)

(assert (=> b!118810 m!178627))

(declare-fun m!178629 () Bool)

(assert (=> b!118810 m!178629))

(declare-fun m!178631 () Bool)

(assert (=> b!118810 m!178631))

(declare-fun m!178633 () Bool)

(assert (=> b!118810 m!178633))

(declare-fun m!178635 () Bool)

(assert (=> b!118810 m!178635))

(declare-fun m!178637 () Bool)

(assert (=> b!118810 m!178637))

(declare-fun m!178639 () Bool)

(assert (=> b!118810 m!178639))

(assert (=> b!118810 m!178225))

(declare-fun m!178641 () Bool)

(assert (=> b!118810 m!178641))

(declare-fun m!178643 () Bool)

(assert (=> b!118810 m!178643))

(declare-fun m!178645 () Bool)

(assert (=> b!118810 m!178645))

(declare-fun m!178647 () Bool)

(assert (=> b!118810 m!178647))

(declare-fun m!178649 () Bool)

(assert (=> b!118810 m!178649))

(assert (=> b!118810 m!178619))

(declare-fun m!178651 () Bool)

(assert (=> b!118810 m!178651))

(declare-fun m!178653 () Bool)

(assert (=> b!118810 m!178653))

(declare-fun m!178655 () Bool)

(assert (=> b!118810 m!178655))

(declare-fun m!178657 () Bool)

(assert (=> b!118810 m!178657))

(declare-fun m!178659 () Bool)

(assert (=> b!118808 m!178659))

(declare-fun m!178661 () Bool)

(assert (=> b!118813 m!178661))

(assert (=> b!118813 m!178661))

(declare-fun m!178663 () Bool)

(assert (=> b!118813 m!178663))

(declare-fun m!178665 () Bool)

(assert (=> b!118815 m!178665))

(declare-fun m!178667 () Bool)

(assert (=> b!118815 m!178667))

(declare-fun m!178669 () Bool)

(assert (=> b!118805 m!178669))

(declare-fun m!178671 () Bool)

(assert (=> b!118805 m!178671))

(assert (=> b!118805 m!178639))

(declare-fun m!178673 () Bool)

(assert (=> b!118805 m!178673))

(declare-fun m!178675 () Bool)

(assert (=> b!118805 m!178675))

(declare-fun m!178677 () Bool)

(assert (=> b!118814 m!178677))

(declare-fun m!178679 () Bool)

(assert (=> b!118811 m!178679))

(declare-fun m!178681 () Bool)

(assert (=> b!118806 m!178681))

(assert (=> b!118806 m!178225))

(assert (=> b!118809 m!178667))

(assert (=> b!118809 m!178225))

(declare-fun m!178683 () Bool)

(assert (=> bm!1535 m!178683))

(assert (=> b!118589 d!37936))

(declare-fun d!37994 () Bool)

(declare-datatypes ((tuple2!9966 0))(
  ( (tuple2!9967 (_1!5248 (_ BitVec 64)) (_2!5248 BitStream!4300)) )
))
(declare-fun lt!183097 () tuple2!9966)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9966)

(assert (=> d!37994 (= lt!183097 (readNLeastSignificantBitsLoop!0 (_1!5236 lt!182455) nBits!396 i!615 lt!182472))))

(assert (=> d!37994 (= (readNLeastSignificantBitsLoopPure!0 (_1!5236 lt!182455) nBits!396 i!615 lt!182472) (tuple2!9945 (_2!5248 lt!183097) (_1!5248 lt!183097)))))

(declare-fun bs!9196 () Bool)

(assert (= bs!9196 d!37994))

(declare-fun m!178685 () Bool)

(assert (=> bs!9196 m!178685))

(assert (=> b!118589 d!37994))

(declare-fun lt!183098 () tuple2!9966)

(declare-fun d!37996 () Bool)

(assert (=> d!37996 (= lt!183098 (readNLeastSignificantBitsLoop!0 (_1!5236 lt!182447) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182459))))

(assert (=> d!37996 (= (readNLeastSignificantBitsLoopPure!0 (_1!5236 lt!182447) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182459) (tuple2!9945 (_2!5248 lt!183098) (_1!5248 lt!183098)))))

(declare-fun bs!9197 () Bool)

(assert (= bs!9197 d!37996))

(declare-fun m!178687 () Bool)

(assert (=> bs!9197 m!178687))

(assert (=> b!118589 d!37996))

(declare-fun d!37998 () Bool)

(declare-fun res!98345 () Bool)

(declare-fun e!77890 () Bool)

(assert (=> d!37998 (=> (not res!98345) (not e!77890))))

(assert (=> d!37998 (= res!98345 (= (size!2413 (buf!2832 thiss!1305)) (size!2413 (buf!2832 (_2!5235 lt!182446)))))))

(assert (=> d!37998 (= (isPrefixOf!0 thiss!1305 (_2!5235 lt!182446)) e!77890)))

(declare-fun b!118824 () Bool)

(declare-fun res!98346 () Bool)

(assert (=> b!118824 (=> (not res!98346) (not e!77890))))

(assert (=> b!118824 (= res!98346 (bvsle (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)) (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182446))) (currentByte!5487 (_2!5235 lt!182446)) (currentBit!5482 (_2!5235 lt!182446)))))))

(declare-fun b!118825 () Bool)

(declare-fun e!77889 () Bool)

(assert (=> b!118825 (= e!77890 e!77889)))

(declare-fun res!98344 () Bool)

(assert (=> b!118825 (=> res!98344 e!77889)))

(assert (=> b!118825 (= res!98344 (= (size!2413 (buf!2832 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118826 () Bool)

(assert (=> b!118826 (= e!77889 (arrayBitRangesEq!0 (buf!2832 thiss!1305) (buf!2832 (_2!5235 lt!182446)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305))))))

(assert (= (and d!37998 res!98345) b!118824))

(assert (= (and b!118824 res!98346) b!118825))

(assert (= (and b!118825 (not res!98344)) b!118826))

(assert (=> b!118824 m!178167))

(assert (=> b!118824 m!178169))

(assert (=> b!118826 m!178167))

(assert (=> b!118826 m!178167))

(declare-fun m!178689 () Bool)

(assert (=> b!118826 m!178689))

(assert (=> b!118589 d!37998))

(declare-fun d!38000 () Bool)

(declare-fun lt!183099 () tuple2!9964)

(assert (=> d!38000 (= lt!183099 (readBit!0 lt!182453))))

(assert (=> d!38000 (= (readBitPure!0 lt!182453) (tuple2!9947 (_2!5247 lt!183099) (_1!5247 lt!183099)))))

(declare-fun bs!9198 () Bool)

(assert (= bs!9198 d!38000))

(declare-fun m!178691 () Bool)

(assert (=> bs!9198 m!178691))

(assert (=> b!118589 d!38000))

(declare-fun d!38002 () Bool)

(assert (=> d!38002 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!118589 d!38002))

(declare-fun d!38004 () Bool)

(declare-fun lt!183100 () tuple2!9964)

(assert (=> d!38004 (= lt!183100 (readBit!0 (_1!5236 lt!182455)))))

(assert (=> d!38004 (= (readBitPure!0 (_1!5236 lt!182455)) (tuple2!9947 (_2!5247 lt!183100) (_1!5247 lt!183100)))))

(declare-fun bs!9199 () Bool)

(assert (= bs!9199 d!38004))

(declare-fun m!178693 () Bool)

(assert (=> bs!9199 m!178693))

(assert (=> b!118589 d!38004))

(declare-fun d!38006 () Bool)

(assert (=> d!38006 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182448))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182448))) lt!182470) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182448))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182448)))) lt!182470))))

(declare-fun bs!9200 () Bool)

(assert (= bs!9200 d!38006))

(declare-fun m!178695 () Bool)

(assert (=> bs!9200 m!178695))

(assert (=> b!118589 d!38006))

(declare-fun d!38008 () Bool)

(assert (=> d!38008 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))) ((_ sign_extend 32) (currentByte!5487 thiss!1305)) ((_ sign_extend 32) (currentBit!5482 thiss!1305)) lt!182469) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))) ((_ sign_extend 32) (currentByte!5487 thiss!1305)) ((_ sign_extend 32) (currentBit!5482 thiss!1305))) lt!182469))))

(declare-fun bs!9201 () Bool)

(assert (= bs!9201 d!38008))

(declare-fun m!178697 () Bool)

(assert (=> bs!9201 m!178697))

(assert (=> b!118589 d!38008))

(declare-fun d!38010 () Bool)

(declare-fun lt!183101 () tuple2!9964)

(assert (=> d!38010 (= lt!183101 (readBit!0 (BitStream!4301 (buf!2832 (_2!5235 lt!182446)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305))))))

(assert (=> d!38010 (= (readBitPure!0 (BitStream!4301 (buf!2832 (_2!5235 lt!182446)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305))) (tuple2!9947 (_2!5247 lt!183101) (_1!5247 lt!183101)))))

(declare-fun bs!9202 () Bool)

(assert (= bs!9202 d!38010))

(declare-fun m!178699 () Bool)

(assert (=> bs!9202 m!178699))

(assert (=> b!118589 d!38010))

(declare-fun d!38012 () Bool)

(assert (=> d!38012 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!118588 d!38012))

(declare-fun d!38014 () Bool)

(declare-fun e!77891 () Bool)

(assert (=> d!38014 e!77891))

(declare-fun res!98347 () Bool)

(assert (=> d!38014 (=> (not res!98347) (not e!77891))))

(declare-fun lt!183107 () (_ BitVec 64))

(declare-fun lt!183104 () (_ BitVec 64))

(declare-fun lt!183102 () (_ BitVec 64))

(assert (=> d!38014 (= res!98347 (= lt!183107 (bvsub lt!183104 lt!183102)))))

(assert (=> d!38014 (or (= (bvand lt!183104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183102 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183104 lt!183102) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38014 (= lt!183102 (remainingBits!0 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182448)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182448))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182448)))))))

(declare-fun lt!183103 () (_ BitVec 64))

(declare-fun lt!183106 () (_ BitVec 64))

(assert (=> d!38014 (= lt!183104 (bvmul lt!183103 lt!183106))))

(assert (=> d!38014 (or (= lt!183103 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183106 (bvsdiv (bvmul lt!183103 lt!183106) lt!183103)))))

(assert (=> d!38014 (= lt!183106 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38014 (= lt!183103 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182448)))))))

(assert (=> d!38014 (= lt!183107 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182448))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182448)))))))

(assert (=> d!38014 (invariant!0 (currentBit!5482 (_2!5235 lt!182448)) (currentByte!5487 (_2!5235 lt!182448)) (size!2413 (buf!2832 (_2!5235 lt!182448))))))

(assert (=> d!38014 (= (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182448))) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448))) lt!183107)))

(declare-fun b!118827 () Bool)

(declare-fun res!98348 () Bool)

(assert (=> b!118827 (=> (not res!98348) (not e!77891))))

(assert (=> b!118827 (= res!98348 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183107))))

(declare-fun b!118828 () Bool)

(declare-fun lt!183105 () (_ BitVec 64))

(assert (=> b!118828 (= e!77891 (bvsle lt!183107 (bvmul lt!183105 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118828 (or (= lt!183105 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183105 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183105)))))

(assert (=> b!118828 (= lt!183105 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182448)))))))

(assert (= (and d!38014 res!98347) b!118827))

(assert (= (and b!118827 res!98348) b!118828))

(declare-fun m!178701 () Bool)

(assert (=> d!38014 m!178701))

(assert (=> d!38014 m!178369))

(assert (=> b!118587 d!38014))

(declare-fun d!38016 () Bool)

(declare-fun e!77892 () Bool)

(assert (=> d!38016 e!77892))

(declare-fun res!98349 () Bool)

(assert (=> d!38016 (=> (not res!98349) (not e!77892))))

(declare-fun lt!183108 () (_ BitVec 64))

(declare-fun lt!183110 () (_ BitVec 64))

(declare-fun lt!183113 () (_ BitVec 64))

(assert (=> d!38016 (= res!98349 (= lt!183113 (bvsub lt!183110 lt!183108)))))

(assert (=> d!38016 (or (= (bvand lt!183110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183108 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183110 lt!183108) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38016 (= lt!183108 (remainingBits!0 ((_ sign_extend 32) (size!2413 (buf!2832 thiss!1305))) ((_ sign_extend 32) (currentByte!5487 thiss!1305)) ((_ sign_extend 32) (currentBit!5482 thiss!1305))))))

(declare-fun lt!183109 () (_ BitVec 64))

(declare-fun lt!183112 () (_ BitVec 64))

(assert (=> d!38016 (= lt!183110 (bvmul lt!183109 lt!183112))))

(assert (=> d!38016 (or (= lt!183109 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183112 (bvsdiv (bvmul lt!183109 lt!183112) lt!183109)))))

(assert (=> d!38016 (= lt!183112 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38016 (= lt!183109 ((_ sign_extend 32) (size!2413 (buf!2832 thiss!1305))))))

(assert (=> d!38016 (= lt!183113 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5487 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5482 thiss!1305))))))

(assert (=> d!38016 (invariant!0 (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305) (size!2413 (buf!2832 thiss!1305)))))

(assert (=> d!38016 (= (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)) lt!183113)))

(declare-fun b!118829 () Bool)

(declare-fun res!98350 () Bool)

(assert (=> b!118829 (=> (not res!98350) (not e!77892))))

(assert (=> b!118829 (= res!98350 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183113))))

(declare-fun b!118830 () Bool)

(declare-fun lt!183111 () (_ BitVec 64))

(assert (=> b!118830 (= e!77892 (bvsle lt!183113 (bvmul lt!183111 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118830 (or (= lt!183111 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183111 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183111)))))

(assert (=> b!118830 (= lt!183111 ((_ sign_extend 32) (size!2413 (buf!2832 thiss!1305))))))

(assert (= (and d!38016 res!98349) b!118829))

(assert (= (and b!118829 res!98350) b!118830))

(declare-fun m!178703 () Bool)

(assert (=> d!38016 m!178703))

(assert (=> d!38016 m!178371))

(assert (=> b!118587 d!38016))

(declare-fun d!38018 () Bool)

(assert (=> d!38018 (= (invariant!0 (currentBit!5482 thiss!1305) (currentByte!5487 thiss!1305) (size!2413 (buf!2832 (_2!5235 lt!182448)))) (and (bvsge (currentBit!5482 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5482 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5487 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5487 thiss!1305) (size!2413 (buf!2832 (_2!5235 lt!182448)))) (and (= (currentBit!5482 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5487 thiss!1305) (size!2413 (buf!2832 (_2!5235 lt!182448))))))))))

(assert (=> b!118597 d!38018))

(declare-fun d!38020 () Bool)

(assert (=> d!38020 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2413 (buf!2832 thiss!1305))) ((_ sign_extend 32) (currentByte!5487 thiss!1305)) ((_ sign_extend 32) (currentBit!5482 thiss!1305)) lt!182469) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2413 (buf!2832 thiss!1305))) ((_ sign_extend 32) (currentByte!5487 thiss!1305)) ((_ sign_extend 32) (currentBit!5482 thiss!1305))) lt!182469))))

(declare-fun bs!9203 () Bool)

(assert (= bs!9203 d!38020))

(assert (=> bs!9203 m!178703))

(assert (=> b!118596 d!38020))

(declare-fun d!38022 () Bool)

(declare-fun res!98352 () Bool)

(declare-fun e!77894 () Bool)

(assert (=> d!38022 (=> (not res!98352) (not e!77894))))

(assert (=> d!38022 (= res!98352 (= (size!2413 (buf!2832 thiss!1305)) (size!2413 (buf!2832 (_2!5235 lt!182448)))))))

(assert (=> d!38022 (= (isPrefixOf!0 thiss!1305 (_2!5235 lt!182448)) e!77894)))

(declare-fun b!118831 () Bool)

(declare-fun res!98353 () Bool)

(assert (=> b!118831 (=> (not res!98353) (not e!77894))))

(assert (=> b!118831 (= res!98353 (bvsle (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305)) (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182448))) (currentByte!5487 (_2!5235 lt!182448)) (currentBit!5482 (_2!5235 lt!182448)))))))

(declare-fun b!118832 () Bool)

(declare-fun e!77893 () Bool)

(assert (=> b!118832 (= e!77894 e!77893)))

(declare-fun res!98351 () Bool)

(assert (=> b!118832 (=> res!98351 e!77893)))

(assert (=> b!118832 (= res!98351 (= (size!2413 (buf!2832 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118833 () Bool)

(assert (=> b!118833 (= e!77893 (arrayBitRangesEq!0 (buf!2832 thiss!1305) (buf!2832 (_2!5235 lt!182448)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2413 (buf!2832 thiss!1305)) (currentByte!5487 thiss!1305) (currentBit!5482 thiss!1305))))))

(assert (= (and d!38022 res!98352) b!118831))

(assert (= (and b!118831 res!98353) b!118832))

(assert (= (and b!118832 (not res!98351)) b!118833))

(assert (=> b!118831 m!178167))

(assert (=> b!118831 m!178225))

(assert (=> b!118833 m!178167))

(assert (=> b!118833 m!178167))

(declare-fun m!178705 () Bool)

(assert (=> b!118833 m!178705))

(assert (=> b!118585 d!38022))

(declare-fun d!38024 () Bool)

(assert (=> d!38024 (= (array_inv!2215 (buf!2832 thiss!1305)) (bvsge (size!2413 (buf!2832 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!118594 d!38024))

(declare-fun d!38026 () Bool)

(declare-fun e!77895 () Bool)

(assert (=> d!38026 e!77895))

(declare-fun res!98354 () Bool)

(assert (=> d!38026 (=> (not res!98354) (not e!77895))))

(declare-fun lt!183116 () (_ BitVec 64))

(declare-fun lt!183114 () (_ BitVec 64))

(declare-fun lt!183119 () (_ BitVec 64))

(assert (=> d!38026 (= res!98354 (= lt!183119 (bvsub lt!183116 lt!183114)))))

(assert (=> d!38026 (or (= (bvand lt!183116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183114 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183116 lt!183114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38026 (= lt!183114 (remainingBits!0 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))) ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182446))) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182446)))))))

(declare-fun lt!183115 () (_ BitVec 64))

(declare-fun lt!183118 () (_ BitVec 64))

(assert (=> d!38026 (= lt!183116 (bvmul lt!183115 lt!183118))))

(assert (=> d!38026 (or (= lt!183115 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183118 (bvsdiv (bvmul lt!183115 lt!183118) lt!183115)))))

(assert (=> d!38026 (= lt!183118 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38026 (= lt!183115 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))))))

(assert (=> d!38026 (= lt!183119 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5487 (_2!5235 lt!182446))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5482 (_2!5235 lt!182446)))))))

(assert (=> d!38026 (invariant!0 (currentBit!5482 (_2!5235 lt!182446)) (currentByte!5487 (_2!5235 lt!182446)) (size!2413 (buf!2832 (_2!5235 lt!182446))))))

(assert (=> d!38026 (= (bitIndex!0 (size!2413 (buf!2832 (_2!5235 lt!182446))) (currentByte!5487 (_2!5235 lt!182446)) (currentBit!5482 (_2!5235 lt!182446))) lt!183119)))

(declare-fun b!118834 () Bool)

(declare-fun res!98355 () Bool)

(assert (=> b!118834 (=> (not res!98355) (not e!77895))))

(assert (=> b!118834 (= res!98355 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183119))))

(declare-fun b!118835 () Bool)

(declare-fun lt!183117 () (_ BitVec 64))

(assert (=> b!118835 (= e!77895 (bvsle lt!183119 (bvmul lt!183117 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118835 (or (= lt!183117 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183117 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183117)))))

(assert (=> b!118835 (= lt!183117 ((_ sign_extend 32) (size!2413 (buf!2832 (_2!5235 lt!182446)))))))

(assert (= (and d!38026 res!98354) b!118834))

(assert (= (and b!118834 res!98355) b!118835))

(declare-fun m!178707 () Bool)

(assert (=> d!38026 m!178707))

(declare-fun m!178709 () Bool)

(assert (=> d!38026 m!178709))

(assert (=> b!118593 d!38026))

(declare-fun d!38028 () Bool)

(declare-fun lt!183133 () tuple2!9944)

(declare-fun lt!183136 () tuple2!9944)

(assert (=> d!38028 (and (= (_2!5237 lt!183133) (_2!5237 lt!183136)) (= (_1!5237 lt!183133) (_1!5237 lt!183136)))))

(declare-fun lt!183137 () (_ BitVec 64))

(declare-fun lt!183135 () BitStream!4300)

(declare-fun lt!183134 () Unit!7297)

(declare-fun lt!183132 () Bool)

(declare-fun choose!45 (BitStream!4300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9944 tuple2!9944 BitStream!4300 (_ BitVec 64) Bool BitStream!4300 (_ BitVec 64) tuple2!9944 tuple2!9944 BitStream!4300 (_ BitVec 64)) Unit!7297)

(assert (=> d!38028 (= lt!183134 (choose!45 (_1!5236 lt!182455) nBits!396 i!615 lt!182472 lt!183133 (tuple2!9945 (_1!5237 lt!183133) (_2!5237 lt!183133)) (_1!5237 lt!183133) (_2!5237 lt!183133) lt!183132 lt!183135 lt!183137 lt!183136 (tuple2!9945 (_1!5237 lt!183136) (_2!5237 lt!183136)) (_1!5237 lt!183136) (_2!5237 lt!183136)))))

(assert (=> d!38028 (= lt!183136 (readNLeastSignificantBitsLoopPure!0 lt!183135 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!183137))))

(assert (=> d!38028 (= lt!183137 (bvor lt!182472 (ite lt!183132 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38028 (= lt!183135 (withMovedBitIndex!0 (_1!5236 lt!182455) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38028 (= lt!183132 (_2!5238 (readBitPure!0 (_1!5236 lt!182455))))))

(assert (=> d!38028 (= lt!183133 (readNLeastSignificantBitsLoopPure!0 (_1!5236 lt!182455) nBits!396 i!615 lt!182472))))

(assert (=> d!38028 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5236 lt!182455) nBits!396 i!615 lt!182472) lt!183134)))

(declare-fun bs!9205 () Bool)

(assert (= bs!9205 d!38028))

(declare-fun m!178711 () Bool)

(assert (=> bs!9205 m!178711))

(assert (=> bs!9205 m!178193))

(assert (=> bs!9205 m!178201))

(assert (=> bs!9205 m!178171))

(declare-fun m!178713 () Bool)

(assert (=> bs!9205 m!178713))

(assert (=> b!118593 d!38028))

(declare-fun d!38030 () Bool)

(declare-fun e!77898 () Bool)

(assert (=> d!38030 e!77898))

(declare-fun res!98358 () Bool)

(assert (=> d!38030 (=> (not res!98358) (not e!77898))))

(declare-fun lt!183143 () (_ BitVec 64))

(declare-fun lt!183142 () BitStream!4300)

(assert (=> d!38030 (= res!98358 (= (bvadd lt!183143 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2413 (buf!2832 lt!183142)) (currentByte!5487 lt!183142) (currentBit!5482 lt!183142))))))

(assert (=> d!38030 (or (not (= (bvand lt!183143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!183143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!183143 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38030 (= lt!183143 (bitIndex!0 (size!2413 (buf!2832 (_1!5236 lt!182455))) (currentByte!5487 (_1!5236 lt!182455)) (currentBit!5482 (_1!5236 lt!182455))))))

(declare-fun moveBitIndex!0 (BitStream!4300 (_ BitVec 64)) tuple2!9940)

(assert (=> d!38030 (= lt!183142 (_2!5235 (moveBitIndex!0 (_1!5236 lt!182455) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4300 (_ BitVec 64)) Bool)

(assert (=> d!38030 (moveBitIndexPrecond!0 (_1!5236 lt!182455) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38030 (= (withMovedBitIndex!0 (_1!5236 lt!182455) #b0000000000000000000000000000000000000000000000000000000000000001) lt!183142)))

(declare-fun b!118838 () Bool)

(assert (=> b!118838 (= e!77898 (= (size!2413 (buf!2832 (_1!5236 lt!182455))) (size!2413 (buf!2832 lt!183142))))))

(assert (= (and d!38030 res!98358) b!118838))

(declare-fun m!178715 () Bool)

(assert (=> d!38030 m!178715))

(declare-fun m!178717 () Bool)

(assert (=> d!38030 m!178717))

(declare-fun m!178719 () Bool)

(assert (=> d!38030 m!178719))

(declare-fun m!178721 () Bool)

(assert (=> d!38030 m!178721))

(assert (=> b!118593 d!38030))

(declare-fun d!38032 () Bool)

(declare-fun lt!183144 () tuple2!9966)

(assert (=> d!38032 (= lt!183144 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5236 lt!182455) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182459))))

(assert (=> d!38032 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5236 lt!182455) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182459) (tuple2!9945 (_2!5248 lt!183144) (_1!5248 lt!183144)))))

(declare-fun bs!9206 () Bool)

(assert (= bs!9206 d!38032))

(assert (=> bs!9206 m!178171))

(declare-fun m!178723 () Bool)

(assert (=> bs!9206 m!178723))

(assert (=> b!118593 d!38032))

(assert (=> b!118593 d!38016))

(push 1)

(assert (not d!37912))

(assert (not d!37996))

(assert (not d!37906))

(assert (not d!37904))

(assert (not b!118831))

(assert (not b!118809))

(assert (not d!38026))

(assert (not d!37932))

(assert (not d!37922))

(assert (not d!38008))

(assert (not d!37910))

(assert (not b!118815))

(assert (not d!38000))

(assert (not b!118729))

(assert (not b!118696))

(assert (not b!118811))

(assert (not b!118727))

(assert (not d!38010))

(assert (not d!38032))

(assert (not b!118695))

(assert (not d!38016))

(assert (not b!118805))

(assert (not b!118726))

(assert (not b!118728))

(assert (not b!118814))

(assert (not d!38020))

(assert (not b!118678))

(assert (not d!38028))

(assert (not b!118704))

(assert (not b!118705))

(assert (not b!118806))

(assert (not b!118697))

(assert (not b!118824))

(assert (not d!37918))

(assert (not d!37924))

(assert (not b!118808))

(assert (not b!118813))

(assert (not d!37914))

(assert (not d!37994))

(assert (not d!37916))

(assert (not d!37934))

(assert (not d!38006))

(assert (not bm!1535))

(assert (not d!38030))

(assert (not d!37902))

(assert (not d!38004))

(assert (not d!37920))

(assert (not b!118833))

(assert (not d!38014))

(assert (not b!118826))

(assert (not b!118706))

(assert (not b!118703))

(assert (not b!118810))

(assert (not b!118698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

