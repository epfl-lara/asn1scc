; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20226 () Bool)

(assert start!20226)

(declare-fun b!101349 () Bool)

(declare-fun res!83271 () Bool)

(declare-fun e!66263 () Bool)

(assert (=> b!101349 (=> (not res!83271) (not e!66263))))

(declare-datatypes ((array!4757 0))(
  ( (array!4758 (arr!2764 (Array (_ BitVec 32) (_ BitVec 8))) (size!2171 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3816 0))(
  ( (BitStream!3817 (buf!2528 array!4757) (currentByte!4995 (_ BitVec 32)) (currentBit!4990 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3816)

(declare-datatypes ((Unit!6214 0))(
  ( (Unit!6215) )
))
(declare-datatypes ((tuple2!8206 0))(
  ( (tuple2!8207 (_1!4358 Unit!6214) (_2!4358 BitStream!3816)) )
))
(declare-fun lt!147111 () tuple2!8206)

(declare-fun isPrefixOf!0 (BitStream!3816 BitStream!3816) Bool)

(assert (=> b!101349 (= res!83271 (isPrefixOf!0 thiss!1305 (_2!4358 lt!147111)))))

(declare-fun b!101350 () Bool)

(declare-fun e!66268 () Bool)

(assert (=> b!101350 (= e!66268 e!66263)))

(declare-fun res!83274 () Bool)

(assert (=> b!101350 (=> (not res!83274) (not e!66263))))

(declare-fun lt!147107 () (_ BitVec 64))

(declare-fun lt!147112 () (_ BitVec 64))

(assert (=> b!101350 (= res!83274 (= lt!147107 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147112)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101350 (= lt!147107 (bitIndex!0 (size!2171 (buf!2528 (_2!4358 lt!147111))) (currentByte!4995 (_2!4358 lt!147111)) (currentBit!4990 (_2!4358 lt!147111))))))

(assert (=> b!101350 (= lt!147112 (bitIndex!0 (size!2171 (buf!2528 thiss!1305)) (currentByte!4995 thiss!1305) (currentBit!4990 thiss!1305)))))

(declare-fun b!101351 () Bool)

(declare-fun res!83266 () Bool)

(declare-fun e!66270 () Bool)

(assert (=> b!101351 (=> (not res!83266) (not e!66270))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101351 (= res!83266 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101352 () Bool)

(declare-fun res!83269 () Bool)

(assert (=> b!101352 (=> (not res!83269) (not e!66270))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!101352 (= res!83269 (bvslt i!615 nBits!396))))

(declare-fun res!83270 () Bool)

(assert (=> start!20226 (=> (not res!83270) (not e!66270))))

(assert (=> start!20226 (= res!83270 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20226 e!66270))

(assert (=> start!20226 true))

(declare-fun e!66267 () Bool)

(declare-fun inv!12 (BitStream!3816) Bool)

(assert (=> start!20226 (and (inv!12 thiss!1305) e!66267)))

(declare-fun b!101353 () Bool)

(assert (=> b!101353 (= e!66270 (not true))))

(declare-datatypes ((tuple2!8208 0))(
  ( (tuple2!8209 (_1!4359 BitStream!3816) (_2!4359 BitStream!3816)) )
))
(declare-fun lt!147117 () tuple2!8208)

(declare-fun lt!147109 () Bool)

(declare-datatypes ((tuple2!8210 0))(
  ( (tuple2!8211 (_1!4360 BitStream!3816) (_2!4360 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3816) tuple2!8210)

(assert (=> b!101353 (= (_2!4360 (readBitPure!0 (_1!4359 lt!147117))) lt!147109)))

(declare-fun lt!147118 () tuple2!8208)

(declare-fun lt!147114 () tuple2!8206)

(declare-fun reader!0 (BitStream!3816 BitStream!3816) tuple2!8208)

(assert (=> b!101353 (= lt!147118 (reader!0 (_2!4358 lt!147111) (_2!4358 lt!147114)))))

(assert (=> b!101353 (= lt!147117 (reader!0 thiss!1305 (_2!4358 lt!147114)))))

(declare-fun e!66264 () Bool)

(assert (=> b!101353 e!66264))

(declare-fun res!83275 () Bool)

(assert (=> b!101353 (=> (not res!83275) (not e!66264))))

(declare-fun lt!147110 () tuple2!8210)

(declare-fun lt!147115 () tuple2!8210)

(assert (=> b!101353 (= res!83275 (= (bitIndex!0 (size!2171 (buf!2528 (_1!4360 lt!147110))) (currentByte!4995 (_1!4360 lt!147110)) (currentBit!4990 (_1!4360 lt!147110))) (bitIndex!0 (size!2171 (buf!2528 (_1!4360 lt!147115))) (currentByte!4995 (_1!4360 lt!147115)) (currentBit!4990 (_1!4360 lt!147115)))))))

(declare-fun lt!147113 () Unit!6214)

(declare-fun lt!147108 () BitStream!3816)

(declare-fun readBitPrefixLemma!0 (BitStream!3816 BitStream!3816) Unit!6214)

(assert (=> b!101353 (= lt!147113 (readBitPrefixLemma!0 lt!147108 (_2!4358 lt!147114)))))

(assert (=> b!101353 (= lt!147115 (readBitPure!0 (BitStream!3817 (buf!2528 (_2!4358 lt!147114)) (currentByte!4995 thiss!1305) (currentBit!4990 thiss!1305))))))

(assert (=> b!101353 (= lt!147110 (readBitPure!0 lt!147108))))

(assert (=> b!101353 (= lt!147108 (BitStream!3817 (buf!2528 (_2!4358 lt!147111)) (currentByte!4995 thiss!1305) (currentBit!4990 thiss!1305)))))

(declare-fun e!66265 () Bool)

(assert (=> b!101353 e!66265))

(declare-fun res!83268 () Bool)

(assert (=> b!101353 (=> (not res!83268) (not e!66265))))

(assert (=> b!101353 (= res!83268 (isPrefixOf!0 thiss!1305 (_2!4358 lt!147114)))))

(declare-fun lt!147116 () Unit!6214)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3816 BitStream!3816 BitStream!3816) Unit!6214)

(assert (=> b!101353 (= lt!147116 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4358 lt!147111) (_2!4358 lt!147114)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3816 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8206)

(assert (=> b!101353 (= lt!147114 (appendNLeastSignificantBitsLoop!0 (_2!4358 lt!147111) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101353 e!66268))

(declare-fun res!83273 () Bool)

(assert (=> b!101353 (=> (not res!83273) (not e!66268))))

(assert (=> b!101353 (= res!83273 (= (size!2171 (buf!2528 thiss!1305)) (size!2171 (buf!2528 (_2!4358 lt!147111)))))))

(declare-fun appendBit!0 (BitStream!3816 Bool) tuple2!8206)

(assert (=> b!101353 (= lt!147111 (appendBit!0 thiss!1305 lt!147109))))

(assert (=> b!101353 (= lt!147109 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101354 () Bool)

(declare-fun res!83276 () Bool)

(assert (=> b!101354 (=> (not res!83276) (not e!66270))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101354 (= res!83276 (validate_offset_bits!1 ((_ sign_extend 32) (size!2171 (buf!2528 thiss!1305))) ((_ sign_extend 32) (currentByte!4995 thiss!1305)) ((_ sign_extend 32) (currentBit!4990 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!101355 () Bool)

(assert (=> b!101355 (= e!66264 (= (_2!4360 lt!147110) (_2!4360 lt!147115)))))

(declare-fun b!101356 () Bool)

(declare-fun e!66269 () Bool)

(assert (=> b!101356 (= e!66263 e!66269)))

(declare-fun res!83267 () Bool)

(assert (=> b!101356 (=> (not res!83267) (not e!66269))))

(declare-fun lt!147106 () tuple2!8210)

(assert (=> b!101356 (= res!83267 (and (= (_2!4360 lt!147106) lt!147109) (= (_1!4360 lt!147106) (_2!4358 lt!147111))))))

(declare-fun readerFrom!0 (BitStream!3816 (_ BitVec 32) (_ BitVec 32)) BitStream!3816)

(assert (=> b!101356 (= lt!147106 (readBitPure!0 (readerFrom!0 (_2!4358 lt!147111) (currentBit!4990 thiss!1305) (currentByte!4995 thiss!1305))))))

(declare-fun b!101357 () Bool)

(assert (=> b!101357 (= e!66269 (= (bitIndex!0 (size!2171 (buf!2528 (_1!4360 lt!147106))) (currentByte!4995 (_1!4360 lt!147106)) (currentBit!4990 (_1!4360 lt!147106))) lt!147107))))

(declare-fun b!101358 () Bool)

(declare-fun array_inv!1973 (array!4757) Bool)

(assert (=> b!101358 (= e!66267 (array_inv!1973 (buf!2528 thiss!1305)))))

(declare-fun b!101359 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101359 (= e!66265 (invariant!0 (currentBit!4990 thiss!1305) (currentByte!4995 thiss!1305) (size!2171 (buf!2528 (_2!4358 lt!147114)))))))

(declare-fun b!101360 () Bool)

(declare-fun res!83272 () Bool)

(assert (=> b!101360 (=> (not res!83272) (not e!66265))))

(assert (=> b!101360 (= res!83272 (invariant!0 (currentBit!4990 thiss!1305) (currentByte!4995 thiss!1305) (size!2171 (buf!2528 (_2!4358 lt!147111)))))))

(assert (= (and start!20226 res!83270) b!101354))

(assert (= (and b!101354 res!83276) b!101351))

(assert (= (and b!101351 res!83266) b!101352))

(assert (= (and b!101352 res!83269) b!101353))

(assert (= (and b!101353 res!83273) b!101350))

(assert (= (and b!101350 res!83274) b!101349))

(assert (= (and b!101349 res!83271) b!101356))

(assert (= (and b!101356 res!83267) b!101357))

(assert (= (and b!101353 res!83268) b!101360))

(assert (= (and b!101360 res!83272) b!101359))

(assert (= (and b!101353 res!83275) b!101355))

(assert (= start!20226 b!101358))

(declare-fun m!147403 () Bool)

(assert (=> b!101353 m!147403))

(declare-fun m!147405 () Bool)

(assert (=> b!101353 m!147405))

(declare-fun m!147407 () Bool)

(assert (=> b!101353 m!147407))

(declare-fun m!147409 () Bool)

(assert (=> b!101353 m!147409))

(declare-fun m!147411 () Bool)

(assert (=> b!101353 m!147411))

(declare-fun m!147413 () Bool)

(assert (=> b!101353 m!147413))

(declare-fun m!147415 () Bool)

(assert (=> b!101353 m!147415))

(declare-fun m!147417 () Bool)

(assert (=> b!101353 m!147417))

(declare-fun m!147419 () Bool)

(assert (=> b!101353 m!147419))

(declare-fun m!147421 () Bool)

(assert (=> b!101353 m!147421))

(declare-fun m!147423 () Bool)

(assert (=> b!101353 m!147423))

(declare-fun m!147425 () Bool)

(assert (=> b!101353 m!147425))

(declare-fun m!147427 () Bool)

(assert (=> b!101354 m!147427))

(declare-fun m!147429 () Bool)

(assert (=> b!101349 m!147429))

(declare-fun m!147431 () Bool)

(assert (=> start!20226 m!147431))

(declare-fun m!147433 () Bool)

(assert (=> b!101357 m!147433))

(declare-fun m!147435 () Bool)

(assert (=> b!101358 m!147435))

(declare-fun m!147437 () Bool)

(assert (=> b!101351 m!147437))

(declare-fun m!147439 () Bool)

(assert (=> b!101360 m!147439))

(declare-fun m!147441 () Bool)

(assert (=> b!101356 m!147441))

(assert (=> b!101356 m!147441))

(declare-fun m!147443 () Bool)

(assert (=> b!101356 m!147443))

(declare-fun m!147445 () Bool)

(assert (=> b!101350 m!147445))

(declare-fun m!147447 () Bool)

(assert (=> b!101350 m!147447))

(declare-fun m!147449 () Bool)

(assert (=> b!101359 m!147449))

(check-sat (not b!101351) (not b!101353) (not b!101358) (not b!101357) (not b!101349) (not start!20226) (not b!101354) (not b!101356) (not b!101359) (not b!101360) (not b!101350))
