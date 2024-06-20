; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20224 () Bool)

(assert start!20224)

(declare-fun b!101313 () Bool)

(declare-fun e!66246 () Bool)

(declare-fun e!66242 () Bool)

(assert (=> b!101313 (= e!66246 e!66242)))

(declare-fun res!83243 () Bool)

(assert (=> b!101313 (=> (not res!83243) (not e!66242))))

(declare-fun lt!147078 () (_ BitVec 64))

(declare-fun lt!147067 () (_ BitVec 64))

(assert (=> b!101313 (= res!83243 (= lt!147078 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147067)))))

(declare-datatypes ((array!4755 0))(
  ( (array!4756 (arr!2763 (Array (_ BitVec 32) (_ BitVec 8))) (size!2170 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3814 0))(
  ( (BitStream!3815 (buf!2527 array!4755) (currentByte!4994 (_ BitVec 32)) (currentBit!4989 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6212 0))(
  ( (Unit!6213) )
))
(declare-datatypes ((tuple2!8200 0))(
  ( (tuple2!8201 (_1!4355 Unit!6212) (_2!4355 BitStream!3814)) )
))
(declare-fun lt!147072 () tuple2!8200)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101313 (= lt!147078 (bitIndex!0 (size!2170 (buf!2527 (_2!4355 lt!147072))) (currentByte!4994 (_2!4355 lt!147072)) (currentBit!4989 (_2!4355 lt!147072))))))

(declare-fun thiss!1305 () BitStream!3814)

(assert (=> b!101313 (= lt!147067 (bitIndex!0 (size!2170 (buf!2527 thiss!1305)) (currentByte!4994 thiss!1305) (currentBit!4989 thiss!1305)))))

(declare-fun b!101314 () Bool)

(declare-fun e!66243 () Bool)

(declare-fun lt!147077 () tuple2!8200)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101314 (= e!66243 (invariant!0 (currentBit!4989 thiss!1305) (currentByte!4994 thiss!1305) (size!2170 (buf!2527 (_2!4355 lt!147077)))))))

(declare-fun b!101315 () Bool)

(declare-fun e!66245 () Bool)

(declare-fun array_inv!1972 (array!4755) Bool)

(assert (=> b!101315 (= e!66245 (array_inv!1972 (buf!2527 thiss!1305)))))

(declare-fun res!83241 () Bool)

(declare-fun e!66239 () Bool)

(assert (=> start!20224 (=> (not res!83241) (not e!66239))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20224 (= res!83241 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20224 e!66239))

(assert (=> start!20224 true))

(declare-fun inv!12 (BitStream!3814) Bool)

(assert (=> start!20224 (and (inv!12 thiss!1305) e!66245)))

(declare-fun b!101316 () Bool)

(assert (=> b!101316 (= e!66239 (not true))))

(declare-datatypes ((tuple2!8202 0))(
  ( (tuple2!8203 (_1!4356 BitStream!3814) (_2!4356 BitStream!3814)) )
))
(declare-fun lt!147073 () tuple2!8202)

(declare-fun lt!147079 () Bool)

(declare-datatypes ((tuple2!8204 0))(
  ( (tuple2!8205 (_1!4357 BitStream!3814) (_2!4357 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3814) tuple2!8204)

(assert (=> b!101316 (= (_2!4357 (readBitPure!0 (_1!4356 lt!147073))) lt!147079)))

(declare-fun lt!147075 () tuple2!8202)

(declare-fun reader!0 (BitStream!3814 BitStream!3814) tuple2!8202)

(assert (=> b!101316 (= lt!147075 (reader!0 (_2!4355 lt!147072) (_2!4355 lt!147077)))))

(assert (=> b!101316 (= lt!147073 (reader!0 thiss!1305 (_2!4355 lt!147077)))))

(declare-fun e!66240 () Bool)

(assert (=> b!101316 e!66240))

(declare-fun res!83233 () Bool)

(assert (=> b!101316 (=> (not res!83233) (not e!66240))))

(declare-fun lt!147069 () tuple2!8204)

(declare-fun lt!147070 () tuple2!8204)

(assert (=> b!101316 (= res!83233 (= (bitIndex!0 (size!2170 (buf!2527 (_1!4357 lt!147069))) (currentByte!4994 (_1!4357 lt!147069)) (currentBit!4989 (_1!4357 lt!147069))) (bitIndex!0 (size!2170 (buf!2527 (_1!4357 lt!147070))) (currentByte!4994 (_1!4357 lt!147070)) (currentBit!4989 (_1!4357 lt!147070)))))))

(declare-fun lt!147071 () Unit!6212)

(declare-fun lt!147076 () BitStream!3814)

(declare-fun readBitPrefixLemma!0 (BitStream!3814 BitStream!3814) Unit!6212)

(assert (=> b!101316 (= lt!147071 (readBitPrefixLemma!0 lt!147076 (_2!4355 lt!147077)))))

(assert (=> b!101316 (= lt!147070 (readBitPure!0 (BitStream!3815 (buf!2527 (_2!4355 lt!147077)) (currentByte!4994 thiss!1305) (currentBit!4989 thiss!1305))))))

(assert (=> b!101316 (= lt!147069 (readBitPure!0 lt!147076))))

(assert (=> b!101316 (= lt!147076 (BitStream!3815 (buf!2527 (_2!4355 lt!147072)) (currentByte!4994 thiss!1305) (currentBit!4989 thiss!1305)))))

(assert (=> b!101316 e!66243))

(declare-fun res!83238 () Bool)

(assert (=> b!101316 (=> (not res!83238) (not e!66243))))

(declare-fun isPrefixOf!0 (BitStream!3814 BitStream!3814) Bool)

(assert (=> b!101316 (= res!83238 (isPrefixOf!0 thiss!1305 (_2!4355 lt!147077)))))

(declare-fun lt!147068 () Unit!6212)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3814 BitStream!3814 BitStream!3814) Unit!6212)

(assert (=> b!101316 (= lt!147068 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4355 lt!147072) (_2!4355 lt!147077)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3814 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8200)

(assert (=> b!101316 (= lt!147077 (appendNLeastSignificantBitsLoop!0 (_2!4355 lt!147072) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101316 e!66246))

(declare-fun res!83236 () Bool)

(assert (=> b!101316 (=> (not res!83236) (not e!66246))))

(assert (=> b!101316 (= res!83236 (= (size!2170 (buf!2527 thiss!1305)) (size!2170 (buf!2527 (_2!4355 lt!147072)))))))

(declare-fun appendBit!0 (BitStream!3814 Bool) tuple2!8200)

(assert (=> b!101316 (= lt!147072 (appendBit!0 thiss!1305 lt!147079))))

(assert (=> b!101316 (= lt!147079 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101317 () Bool)

(assert (=> b!101317 (= e!66240 (= (_2!4357 lt!147069) (_2!4357 lt!147070)))))

(declare-fun b!101318 () Bool)

(declare-fun res!83240 () Bool)

(assert (=> b!101318 (=> (not res!83240) (not e!66239))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101318 (= res!83240 (validate_offset_bits!1 ((_ sign_extend 32) (size!2170 (buf!2527 thiss!1305))) ((_ sign_extend 32) (currentByte!4994 thiss!1305)) ((_ sign_extend 32) (currentBit!4989 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!101319 () Bool)

(declare-fun res!83239 () Bool)

(assert (=> b!101319 (=> (not res!83239) (not e!66239))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101319 (= res!83239 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101320 () Bool)

(declare-fun res!83234 () Bool)

(assert (=> b!101320 (=> (not res!83234) (not e!66242))))

(assert (=> b!101320 (= res!83234 (isPrefixOf!0 thiss!1305 (_2!4355 lt!147072)))))

(declare-fun b!101321 () Bool)

(declare-fun e!66241 () Bool)

(declare-fun lt!147074 () tuple2!8204)

(assert (=> b!101321 (= e!66241 (= (bitIndex!0 (size!2170 (buf!2527 (_1!4357 lt!147074))) (currentByte!4994 (_1!4357 lt!147074)) (currentBit!4989 (_1!4357 lt!147074))) lt!147078))))

(declare-fun b!101322 () Bool)

(declare-fun res!83242 () Bool)

(assert (=> b!101322 (=> (not res!83242) (not e!66243))))

(assert (=> b!101322 (= res!83242 (invariant!0 (currentBit!4989 thiss!1305) (currentByte!4994 thiss!1305) (size!2170 (buf!2527 (_2!4355 lt!147072)))))))

(declare-fun b!101323 () Bool)

(declare-fun res!83235 () Bool)

(assert (=> b!101323 (=> (not res!83235) (not e!66239))))

(assert (=> b!101323 (= res!83235 (bvslt i!615 nBits!396))))

(declare-fun b!101324 () Bool)

(assert (=> b!101324 (= e!66242 e!66241)))

(declare-fun res!83237 () Bool)

(assert (=> b!101324 (=> (not res!83237) (not e!66241))))

(assert (=> b!101324 (= res!83237 (and (= (_2!4357 lt!147074) lt!147079) (= (_1!4357 lt!147074) (_2!4355 lt!147072))))))

(declare-fun readerFrom!0 (BitStream!3814 (_ BitVec 32) (_ BitVec 32)) BitStream!3814)

(assert (=> b!101324 (= lt!147074 (readBitPure!0 (readerFrom!0 (_2!4355 lt!147072) (currentBit!4989 thiss!1305) (currentByte!4994 thiss!1305))))))

(assert (= (and start!20224 res!83241) b!101318))

(assert (= (and b!101318 res!83240) b!101319))

(assert (= (and b!101319 res!83239) b!101323))

(assert (= (and b!101323 res!83235) b!101316))

(assert (= (and b!101316 res!83236) b!101313))

(assert (= (and b!101313 res!83243) b!101320))

(assert (= (and b!101320 res!83234) b!101324))

(assert (= (and b!101324 res!83237) b!101321))

(assert (= (and b!101316 res!83238) b!101322))

(assert (= (and b!101322 res!83242) b!101314))

(assert (= (and b!101316 res!83233) b!101317))

(assert (= start!20224 b!101315))

(declare-fun m!147355 () Bool)

(assert (=> b!101322 m!147355))

(declare-fun m!147357 () Bool)

(assert (=> b!101324 m!147357))

(assert (=> b!101324 m!147357))

(declare-fun m!147359 () Bool)

(assert (=> b!101324 m!147359))

(declare-fun m!147361 () Bool)

(assert (=> b!101320 m!147361))

(declare-fun m!147363 () Bool)

(assert (=> b!101318 m!147363))

(declare-fun m!147365 () Bool)

(assert (=> b!101313 m!147365))

(declare-fun m!147367 () Bool)

(assert (=> b!101313 m!147367))

(declare-fun m!147369 () Bool)

(assert (=> b!101315 m!147369))

(declare-fun m!147371 () Bool)

(assert (=> b!101316 m!147371))

(declare-fun m!147373 () Bool)

(assert (=> b!101316 m!147373))

(declare-fun m!147375 () Bool)

(assert (=> b!101316 m!147375))

(declare-fun m!147377 () Bool)

(assert (=> b!101316 m!147377))

(declare-fun m!147379 () Bool)

(assert (=> b!101316 m!147379))

(declare-fun m!147381 () Bool)

(assert (=> b!101316 m!147381))

(declare-fun m!147383 () Bool)

(assert (=> b!101316 m!147383))

(declare-fun m!147385 () Bool)

(assert (=> b!101316 m!147385))

(declare-fun m!147387 () Bool)

(assert (=> b!101316 m!147387))

(declare-fun m!147389 () Bool)

(assert (=> b!101316 m!147389))

(declare-fun m!147391 () Bool)

(assert (=> b!101316 m!147391))

(declare-fun m!147393 () Bool)

(assert (=> b!101316 m!147393))

(declare-fun m!147395 () Bool)

(assert (=> start!20224 m!147395))

(declare-fun m!147397 () Bool)

(assert (=> b!101319 m!147397))

(declare-fun m!147399 () Bool)

(assert (=> b!101321 m!147399))

(declare-fun m!147401 () Bool)

(assert (=> b!101314 m!147401))

(push 1)

(assert (not b!101321))

(assert (not start!20224))

(assert (not b!101319))

(assert (not b!101318))

(assert (not b!101324))

(assert (not b!101313))

(assert (not b!101314))

(assert (not b!101316))

(assert (not b!101322))

(assert (not b!101315))

(assert (not b!101320))

(check-sat)

