; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20364 () Bool)

(assert start!20364)

(declare-fun b!102534 () Bool)

(declare-fun e!67110 () Bool)

(declare-fun e!67106 () Bool)

(assert (=> b!102534 (= e!67110 e!67106)))

(declare-fun res!84325 () Bool)

(assert (=> b!102534 (=> (not res!84325) (not e!67106))))

(declare-fun lt!149136 () Bool)

(declare-datatypes ((array!4808 0))(
  ( (array!4809 (arr!2788 (Array (_ BitVec 32) (_ BitVec 8))) (size!2195 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3864 0))(
  ( (BitStream!3865 (buf!2555 array!4808) (currentByte!5028 (_ BitVec 32)) (currentBit!5023 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8382 0))(
  ( (tuple2!8383 (_1!4446 BitStream!3864) (_2!4446 Bool)) )
))
(declare-fun lt!149152 () tuple2!8382)

(declare-datatypes ((Unit!6286 0))(
  ( (Unit!6287) )
))
(declare-datatypes ((tuple2!8384 0))(
  ( (tuple2!8385 (_1!4447 Unit!6286) (_2!4447 BitStream!3864)) )
))
(declare-fun lt!149135 () tuple2!8384)

(assert (=> b!102534 (= res!84325 (and (= (_2!4446 lt!149152) lt!149136) (= (_1!4446 lt!149152) (_2!4447 lt!149135))))))

(declare-fun thiss!1305 () BitStream!3864)

(declare-fun readBitPure!0 (BitStream!3864) tuple2!8382)

(declare-fun readerFrom!0 (BitStream!3864 (_ BitVec 32) (_ BitVec 32)) BitStream!3864)

(assert (=> b!102534 (= lt!149152 (readBitPure!0 (readerFrom!0 (_2!4447 lt!149135) (currentBit!5023 thiss!1305) (currentByte!5028 thiss!1305))))))

(declare-fun b!102535 () Bool)

(declare-fun res!84320 () Bool)

(declare-fun e!67109 () Bool)

(assert (=> b!102535 (=> (not res!84320) (not e!67109))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!102535 (= res!84320 (bvslt i!615 nBits!396))))

(declare-fun res!84326 () Bool)

(declare-fun e!67104 () Bool)

(assert (=> start!20364 (=> (not res!84326) (not e!67104))))

(assert (=> start!20364 (= res!84326 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20364 e!67104))

(assert (=> start!20364 true))

(declare-fun e!67107 () Bool)

(declare-fun inv!12 (BitStream!3864) Bool)

(assert (=> start!20364 (and (inv!12 thiss!1305) e!67107)))

(declare-fun b!102536 () Bool)

(declare-fun res!84323 () Bool)

(assert (=> b!102536 (=> (not res!84323) (not e!67109))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102536 (= res!84323 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102537 () Bool)

(declare-fun e!67102 () Bool)

(declare-fun lt!149143 () tuple2!8382)

(declare-fun lt!149140 () tuple2!8382)

(assert (=> b!102537 (= e!67102 (= (_2!4446 lt!149143) (_2!4446 lt!149140)))))

(declare-fun b!102538 () Bool)

(assert (=> b!102538 (= e!67104 e!67109)))

(declare-fun res!84329 () Bool)

(assert (=> b!102538 (=> (not res!84329) (not e!67109))))

(declare-fun lt!149151 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102538 (= res!84329 (validate_offset_bits!1 ((_ sign_extend 32) (size!2195 (buf!2555 thiss!1305))) ((_ sign_extend 32) (currentByte!5028 thiss!1305)) ((_ sign_extend 32) (currentBit!5023 thiss!1305)) lt!149151))))

(assert (=> b!102538 (= lt!149151 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102539 () Bool)

(assert (=> b!102539 (= e!67109 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!149146 () tuple2!8384)

(declare-fun lt!149141 () (_ BitVec 64))

(assert (=> b!102539 (validate_offset_bits!1 ((_ sign_extend 32) (size!2195 (buf!2555 (_2!4447 lt!149146)))) ((_ sign_extend 32) (currentByte!5028 (_2!4447 lt!149135))) ((_ sign_extend 32) (currentBit!5023 (_2!4447 lt!149135))) lt!149141)))

(declare-fun lt!149148 () Unit!6286)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3864 array!4808 (_ BitVec 64)) Unit!6286)

(assert (=> b!102539 (= lt!149148 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4447 lt!149135) (buf!2555 (_2!4447 lt!149146)) lt!149141))))

(assert (=> b!102539 (= lt!149141 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!8386 0))(
  ( (tuple2!8387 (_1!4448 BitStream!3864) (_2!4448 (_ BitVec 64))) )
))
(declare-fun lt!149142 () tuple2!8386)

(declare-datatypes ((tuple2!8388 0))(
  ( (tuple2!8389 (_1!4449 BitStream!3864) (_2!4449 BitStream!3864)) )
))
(declare-fun lt!149149 () tuple2!8388)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8386)

(assert (=> b!102539 (= lt!149142 (readNLeastSignificantBitsLoopPure!0 (_1!4449 lt!149149) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!102539 (validate_offset_bits!1 ((_ sign_extend 32) (size!2195 (buf!2555 (_2!4447 lt!149146)))) ((_ sign_extend 32) (currentByte!5028 thiss!1305)) ((_ sign_extend 32) (currentBit!5023 thiss!1305)) lt!149151)))

(declare-fun lt!149139 () Unit!6286)

(assert (=> b!102539 (= lt!149139 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2555 (_2!4447 lt!149146)) lt!149151))))

(assert (=> b!102539 (= (_2!4446 (readBitPure!0 (_1!4449 lt!149149))) lt!149136)))

(declare-fun lt!149137 () tuple2!8388)

(declare-fun reader!0 (BitStream!3864 BitStream!3864) tuple2!8388)

(assert (=> b!102539 (= lt!149137 (reader!0 (_2!4447 lt!149135) (_2!4447 lt!149146)))))

(assert (=> b!102539 (= lt!149149 (reader!0 thiss!1305 (_2!4447 lt!149146)))))

(assert (=> b!102539 e!67102))

(declare-fun res!84324 () Bool)

(assert (=> b!102539 (=> (not res!84324) (not e!67102))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102539 (= res!84324 (= (bitIndex!0 (size!2195 (buf!2555 (_1!4446 lt!149143))) (currentByte!5028 (_1!4446 lt!149143)) (currentBit!5023 (_1!4446 lt!149143))) (bitIndex!0 (size!2195 (buf!2555 (_1!4446 lt!149140))) (currentByte!5028 (_1!4446 lt!149140)) (currentBit!5023 (_1!4446 lt!149140)))))))

(declare-fun lt!149145 () Unit!6286)

(declare-fun lt!149150 () BitStream!3864)

(declare-fun readBitPrefixLemma!0 (BitStream!3864 BitStream!3864) Unit!6286)

(assert (=> b!102539 (= lt!149145 (readBitPrefixLemma!0 lt!149150 (_2!4447 lt!149146)))))

(assert (=> b!102539 (= lt!149140 (readBitPure!0 (BitStream!3865 (buf!2555 (_2!4447 lt!149146)) (currentByte!5028 thiss!1305) (currentBit!5023 thiss!1305))))))

(assert (=> b!102539 (= lt!149143 (readBitPure!0 lt!149150))))

(assert (=> b!102539 (= lt!149150 (BitStream!3865 (buf!2555 (_2!4447 lt!149135)) (currentByte!5028 thiss!1305) (currentBit!5023 thiss!1305)))))

(declare-fun e!67103 () Bool)

(assert (=> b!102539 e!67103))

(declare-fun res!84321 () Bool)

(assert (=> b!102539 (=> (not res!84321) (not e!67103))))

(declare-fun isPrefixOf!0 (BitStream!3864 BitStream!3864) Bool)

(assert (=> b!102539 (= res!84321 (isPrefixOf!0 thiss!1305 (_2!4447 lt!149146)))))

(declare-fun lt!149144 () Unit!6286)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3864 BitStream!3864 BitStream!3864) Unit!6286)

(assert (=> b!102539 (= lt!149144 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4447 lt!149135) (_2!4447 lt!149146)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3864 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8384)

(assert (=> b!102539 (= lt!149146 (appendNLeastSignificantBitsLoop!0 (_2!4447 lt!149135) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!67108 () Bool)

(assert (=> b!102539 e!67108))

(declare-fun res!84322 () Bool)

(assert (=> b!102539 (=> (not res!84322) (not e!67108))))

(assert (=> b!102539 (= res!84322 (= (size!2195 (buf!2555 thiss!1305)) (size!2195 (buf!2555 (_2!4447 lt!149135)))))))

(declare-fun appendBit!0 (BitStream!3864 Bool) tuple2!8384)

(assert (=> b!102539 (= lt!149135 (appendBit!0 thiss!1305 lt!149136))))

(assert (=> b!102539 (= lt!149136 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102540 () Bool)

(declare-fun lt!149147 () (_ BitVec 64))

(assert (=> b!102540 (= e!67106 (= (bitIndex!0 (size!2195 (buf!2555 (_1!4446 lt!149152))) (currentByte!5028 (_1!4446 lt!149152)) (currentBit!5023 (_1!4446 lt!149152))) lt!149147))))

(declare-fun b!102541 () Bool)

(declare-fun res!84328 () Bool)

(assert (=> b!102541 (=> (not res!84328) (not e!67103))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102541 (= res!84328 (invariant!0 (currentBit!5023 thiss!1305) (currentByte!5028 thiss!1305) (size!2195 (buf!2555 (_2!4447 lt!149135)))))))

(declare-fun b!102542 () Bool)

(declare-fun res!84319 () Bool)

(assert (=> b!102542 (=> (not res!84319) (not e!67110))))

(assert (=> b!102542 (= res!84319 (isPrefixOf!0 thiss!1305 (_2!4447 lt!149135)))))

(declare-fun b!102543 () Bool)

(assert (=> b!102543 (= e!67103 (invariant!0 (currentBit!5023 thiss!1305) (currentByte!5028 thiss!1305) (size!2195 (buf!2555 (_2!4447 lt!149146)))))))

(declare-fun b!102544 () Bool)

(declare-fun array_inv!1997 (array!4808) Bool)

(assert (=> b!102544 (= e!67107 (array_inv!1997 (buf!2555 thiss!1305)))))

(declare-fun b!102545 () Bool)

(assert (=> b!102545 (= e!67108 e!67110)))

(declare-fun res!84327 () Bool)

(assert (=> b!102545 (=> (not res!84327) (not e!67110))))

(declare-fun lt!149138 () (_ BitVec 64))

(assert (=> b!102545 (= res!84327 (= lt!149147 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!149138)))))

(assert (=> b!102545 (= lt!149147 (bitIndex!0 (size!2195 (buf!2555 (_2!4447 lt!149135))) (currentByte!5028 (_2!4447 lt!149135)) (currentBit!5023 (_2!4447 lt!149135))))))

(assert (=> b!102545 (= lt!149138 (bitIndex!0 (size!2195 (buf!2555 thiss!1305)) (currentByte!5028 thiss!1305) (currentBit!5023 thiss!1305)))))

(assert (= (and start!20364 res!84326) b!102538))

(assert (= (and b!102538 res!84329) b!102536))

(assert (= (and b!102536 res!84323) b!102535))

(assert (= (and b!102535 res!84320) b!102539))

(assert (= (and b!102539 res!84322) b!102545))

(assert (= (and b!102545 res!84327) b!102542))

(assert (= (and b!102542 res!84319) b!102534))

(assert (= (and b!102534 res!84325) b!102540))

(assert (= (and b!102539 res!84321) b!102541))

(assert (= (and b!102541 res!84328) b!102543))

(assert (= (and b!102539 res!84324) b!102537))

(assert (= start!20364 b!102544))

(declare-fun m!149335 () Bool)

(assert (=> b!102544 m!149335))

(declare-fun m!149337 () Bool)

(assert (=> b!102545 m!149337))

(declare-fun m!149339 () Bool)

(assert (=> b!102545 m!149339))

(declare-fun m!149341 () Bool)

(assert (=> b!102541 m!149341))

(declare-fun m!149343 () Bool)

(assert (=> b!102543 m!149343))

(declare-fun m!149345 () Bool)

(assert (=> b!102539 m!149345))

(declare-fun m!149347 () Bool)

(assert (=> b!102539 m!149347))

(declare-fun m!149349 () Bool)

(assert (=> b!102539 m!149349))

(declare-fun m!149351 () Bool)

(assert (=> b!102539 m!149351))

(declare-fun m!149353 () Bool)

(assert (=> b!102539 m!149353))

(declare-fun m!149355 () Bool)

(assert (=> b!102539 m!149355))

(declare-fun m!149357 () Bool)

(assert (=> b!102539 m!149357))

(declare-fun m!149359 () Bool)

(assert (=> b!102539 m!149359))

(declare-fun m!149361 () Bool)

(assert (=> b!102539 m!149361))

(declare-fun m!149363 () Bool)

(assert (=> b!102539 m!149363))

(declare-fun m!149365 () Bool)

(assert (=> b!102539 m!149365))

(declare-fun m!149367 () Bool)

(assert (=> b!102539 m!149367))

(declare-fun m!149369 () Bool)

(assert (=> b!102539 m!149369))

(declare-fun m!149371 () Bool)

(assert (=> b!102539 m!149371))

(declare-fun m!149373 () Bool)

(assert (=> b!102539 m!149373))

(declare-fun m!149375 () Bool)

(assert (=> b!102539 m!149375))

(declare-fun m!149377 () Bool)

(assert (=> b!102539 m!149377))

(declare-fun m!149379 () Bool)

(assert (=> b!102539 m!149379))

(declare-fun m!149381 () Bool)

(assert (=> b!102536 m!149381))

(declare-fun m!149383 () Bool)

(assert (=> b!102534 m!149383))

(assert (=> b!102534 m!149383))

(declare-fun m!149385 () Bool)

(assert (=> b!102534 m!149385))

(declare-fun m!149387 () Bool)

(assert (=> b!102540 m!149387))

(declare-fun m!149389 () Bool)

(assert (=> b!102538 m!149389))

(declare-fun m!149391 () Bool)

(assert (=> b!102542 m!149391))

(declare-fun m!149393 () Bool)

(assert (=> start!20364 m!149393))

(check-sat (not start!20364) (not b!102536) (not b!102539) (not b!102542) (not b!102540) (not b!102534) (not b!102541) (not b!102543) (not b!102538) (not b!102545) (not b!102544))
(check-sat)
