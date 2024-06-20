; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21626 () Bool)

(assert start!21626)

(declare-fun b!109388 () Bool)

(declare-fun res!90272 () Bool)

(declare-fun e!71695 () Bool)

(assert (=> b!109388 (=> (not res!90272) (not e!71695))))

(declare-datatypes ((array!4989 0))(
  ( (array!4990 (arr!2864 (Array (_ BitVec 32) (_ BitVec 8))) (size!2271 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4016 0))(
  ( (BitStream!4017 (buf!2662 array!4989) (currentByte!5198 (_ BitVec 32)) (currentBit!5193 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4016)

(declare-datatypes ((Unit!6683 0))(
  ( (Unit!6684) )
))
(declare-datatypes ((tuple2!9100 0))(
  ( (tuple2!9101 (_1!4807 Unit!6683) (_2!4807 BitStream!4016)) )
))
(declare-fun lt!165344 () tuple2!9100)

(declare-fun isPrefixOf!0 (BitStream!4016 BitStream!4016) Bool)

(assert (=> b!109388 (= res!90272 (isPrefixOf!0 thiss!1305 (_2!4807 lt!165344)))))

(declare-fun b!109389 () Bool)

(declare-fun e!71700 () Bool)

(declare-datatypes ((tuple2!9102 0))(
  ( (tuple2!9103 (_1!4808 BitStream!4016) (_2!4808 Bool)) )
))
(declare-fun lt!165347 () tuple2!9102)

(declare-fun lt!165350 () tuple2!9102)

(assert (=> b!109389 (= e!71700 (= (_2!4808 lt!165347) (_2!4808 lt!165350)))))

(declare-fun lt!165367 () (_ BitVec 64))

(declare-datatypes ((tuple2!9104 0))(
  ( (tuple2!9105 (_1!4809 BitStream!4016) (_2!4809 BitStream!4016)) )
))
(declare-fun lt!165357 () tuple2!9104)

(declare-fun lt!165340 () (_ BitVec 64))

(declare-fun b!109390 () Bool)

(declare-datatypes ((tuple2!9106 0))(
  ( (tuple2!9107 (_1!4810 BitStream!4016) (_2!4810 (_ BitVec 64))) )
))
(declare-fun lt!165359 () tuple2!9106)

(declare-fun lt!165346 () BitStream!4016)

(declare-fun lt!165353 () tuple2!9104)

(declare-fun e!71696 () Bool)

(declare-fun lt!165352 () tuple2!9106)

(assert (=> b!109390 (= e!71696 (and (= lt!165340 (bvsub lt!165367 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4809 lt!165357) lt!165346)) (and (= (_2!4810 lt!165359) (_2!4810 lt!165352)) (= (_1!4810 lt!165359) (_2!4809 lt!165353))))))))

(declare-fun b!109392 () Bool)

(declare-fun res!90274 () Bool)

(declare-fun e!71699 () Bool)

(assert (=> b!109392 (=> (not res!90274) (not e!71699))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!109392 (= res!90274 (bvslt i!615 nBits!396))))

(declare-fun b!109393 () Bool)

(declare-fun res!90266 () Bool)

(declare-fun e!71703 () Bool)

(assert (=> b!109393 (=> (not res!90266) (not e!71703))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109393 (= res!90266 (invariant!0 (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305) (size!2271 (buf!2662 (_2!4807 lt!165344)))))))

(declare-fun b!109394 () Bool)

(declare-fun res!90262 () Bool)

(assert (=> b!109394 (=> (not res!90262) (not e!71699))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109394 (= res!90262 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109395 () Bool)

(declare-fun e!71702 () Bool)

(declare-fun lt!165349 () tuple2!9102)

(declare-fun lt!165348 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109395 (= e!71702 (= (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!165349))) (currentByte!5198 (_1!4808 lt!165349)) (currentBit!5193 (_1!4808 lt!165349))) lt!165348))))

(declare-fun b!109396 () Bool)

(declare-fun e!71694 () Bool)

(declare-fun lt!165342 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109396 (= e!71694 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4809 lt!165353)))) ((_ sign_extend 32) (currentByte!5198 (_1!4809 lt!165353))) ((_ sign_extend 32) (currentBit!5193 (_1!4809 lt!165353))) lt!165342))))

(declare-fun b!109391 () Bool)

(assert (=> b!109391 (= e!71695 e!71702)))

(declare-fun res!90273 () Bool)

(assert (=> b!109391 (=> (not res!90273) (not e!71702))))

(declare-fun lt!165341 () Bool)

(assert (=> b!109391 (= res!90273 (and (= (_2!4808 lt!165349) lt!165341) (= (_1!4808 lt!165349) (_2!4807 lt!165344))))))

(declare-fun readBitPure!0 (BitStream!4016) tuple2!9102)

(declare-fun readerFrom!0 (BitStream!4016 (_ BitVec 32) (_ BitVec 32)) BitStream!4016)

(assert (=> b!109391 (= lt!165349 (readBitPure!0 (readerFrom!0 (_2!4807 lt!165344) (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305))))))

(declare-fun res!90269 () Bool)

(declare-fun e!71698 () Bool)

(assert (=> start!21626 (=> (not res!90269) (not e!71698))))

(assert (=> start!21626 (= res!90269 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21626 e!71698))

(assert (=> start!21626 true))

(declare-fun e!71705 () Bool)

(declare-fun inv!12 (BitStream!4016) Bool)

(assert (=> start!21626 (and (inv!12 thiss!1305) e!71705)))

(declare-fun b!109397 () Bool)

(declare-fun e!71701 () Bool)

(assert (=> b!109397 (= e!71699 (not e!71701))))

(declare-fun res!90267 () Bool)

(assert (=> b!109397 (=> res!90267 e!71701)))

(assert (=> b!109397 (= res!90267 (not (= (_1!4810 lt!165352) (_2!4809 lt!165357))))))

(declare-fun lt!165364 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9106)

(assert (=> b!109397 (= lt!165352 (readNLeastSignificantBitsLoopPure!0 (_1!4809 lt!165357) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165364))))

(declare-fun lt!165363 () tuple2!9100)

(declare-fun lt!165362 () (_ BitVec 64))

(assert (=> b!109397 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165344))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165344))) lt!165362)))

(declare-fun lt!165361 () Unit!6683)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4016 array!4989 (_ BitVec 64)) Unit!6683)

(assert (=> b!109397 (= lt!165361 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4807 lt!165344) (buf!2662 (_2!4807 lt!165363)) lt!165362))))

(assert (=> b!109397 (= lt!165362 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!165356 () (_ BitVec 64))

(declare-fun lt!165360 () tuple2!9102)

(declare-fun lt!165365 () (_ BitVec 64))

(assert (=> b!109397 (= lt!165364 (bvor lt!165356 (ite (_2!4808 lt!165360) lt!165365 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109397 (= lt!165359 (readNLeastSignificantBitsLoopPure!0 (_1!4809 lt!165353) nBits!396 i!615 lt!165356))))

(assert (=> b!109397 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))) ((_ sign_extend 32) (currentByte!5198 thiss!1305)) ((_ sign_extend 32) (currentBit!5193 thiss!1305)) lt!165342)))

(declare-fun lt!165343 () Unit!6683)

(assert (=> b!109397 (= lt!165343 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2662 (_2!4807 lt!165363)) lt!165342))))

(assert (=> b!109397 (= lt!165356 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!109397 (= (_2!4808 lt!165360) lt!165341)))

(assert (=> b!109397 (= lt!165360 (readBitPure!0 (_1!4809 lt!165353)))))

(declare-fun reader!0 (BitStream!4016 BitStream!4016) tuple2!9104)

(assert (=> b!109397 (= lt!165357 (reader!0 (_2!4807 lt!165344) (_2!4807 lt!165363)))))

(assert (=> b!109397 (= lt!165353 (reader!0 thiss!1305 (_2!4807 lt!165363)))))

(assert (=> b!109397 e!71700))

(declare-fun res!90268 () Bool)

(assert (=> b!109397 (=> (not res!90268) (not e!71700))))

(assert (=> b!109397 (= res!90268 (= (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!165347))) (currentByte!5198 (_1!4808 lt!165347)) (currentBit!5193 (_1!4808 lt!165347))) (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!165350))) (currentByte!5198 (_1!4808 lt!165350)) (currentBit!5193 (_1!4808 lt!165350)))))))

(declare-fun lt!165351 () Unit!6683)

(declare-fun lt!165355 () BitStream!4016)

(declare-fun readBitPrefixLemma!0 (BitStream!4016 BitStream!4016) Unit!6683)

(assert (=> b!109397 (= lt!165351 (readBitPrefixLemma!0 lt!165355 (_2!4807 lt!165363)))))

(assert (=> b!109397 (= lt!165350 (readBitPure!0 (BitStream!4017 (buf!2662 (_2!4807 lt!165363)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305))))))

(assert (=> b!109397 (= lt!165347 (readBitPure!0 lt!165355))))

(assert (=> b!109397 (= lt!165355 (BitStream!4017 (buf!2662 (_2!4807 lt!165344)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)))))

(assert (=> b!109397 e!71703))

(declare-fun res!90263 () Bool)

(assert (=> b!109397 (=> (not res!90263) (not e!71703))))

(assert (=> b!109397 (= res!90263 (isPrefixOf!0 thiss!1305 (_2!4807 lt!165363)))))

(declare-fun lt!165368 () Unit!6683)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4016 BitStream!4016 BitStream!4016) Unit!6683)

(assert (=> b!109397 (= lt!165368 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4807 lt!165344) (_2!4807 lt!165363)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4016 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9100)

(assert (=> b!109397 (= lt!165363 (appendNLeastSignificantBitsLoop!0 (_2!4807 lt!165344) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71697 () Bool)

(assert (=> b!109397 e!71697))

(declare-fun res!90270 () Bool)

(assert (=> b!109397 (=> (not res!90270) (not e!71697))))

(assert (=> b!109397 (= res!90270 (= (size!2271 (buf!2662 thiss!1305)) (size!2271 (buf!2662 (_2!4807 lt!165344)))))))

(declare-fun appendBit!0 (BitStream!4016 Bool) tuple2!9100)

(assert (=> b!109397 (= lt!165344 (appendBit!0 thiss!1305 lt!165341))))

(assert (=> b!109397 (= lt!165341 (not (= (bvand v!199 lt!165365) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109397 (= lt!165365 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109398 () Bool)

(assert (=> b!109398 (= e!71697 e!71695)))

(declare-fun res!90261 () Bool)

(assert (=> b!109398 (=> (not res!90261) (not e!71695))))

(declare-fun lt!165345 () (_ BitVec 64))

(assert (=> b!109398 (= res!90261 (= lt!165348 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!165345)))))

(assert (=> b!109398 (= lt!165348 (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))))))

(assert (=> b!109398 (= lt!165345 (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)))))

(declare-fun b!109399 () Bool)

(assert (=> b!109399 (= e!71703 (invariant!0 (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305) (size!2271 (buf!2662 (_2!4807 lt!165363)))))))

(declare-fun b!109400 () Bool)

(assert (=> b!109400 (= e!71698 e!71699)))

(declare-fun res!90265 () Bool)

(assert (=> b!109400 (=> (not res!90265) (not e!71699))))

(assert (=> b!109400 (= res!90265 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 thiss!1305))) ((_ sign_extend 32) (currentByte!5198 thiss!1305)) ((_ sign_extend 32) (currentBit!5193 thiss!1305)) lt!165342))))

(assert (=> b!109400 (= lt!165342 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109401 () Bool)

(declare-fun array_inv!2073 (array!4989) Bool)

(assert (=> b!109401 (= e!71705 (array_inv!2073 (buf!2662 thiss!1305)))))

(declare-fun b!109402 () Bool)

(assert (=> b!109402 (= e!71701 e!71694)))

(declare-fun res!90264 () Bool)

(assert (=> b!109402 (=> res!90264 e!71694)))

(declare-fun lt!165354 () (_ BitVec 64))

(assert (=> b!109402 (= res!90264 (or (not (= (_1!4809 lt!165357) lt!165346)) (not (= (size!2271 (buf!2662 thiss!1305)) (size!2271 (buf!2662 (_2!4807 lt!165363))))) (not (= lt!165354 (bvadd lt!165340 lt!165342)))))))

(assert (=> b!109402 e!71696))

(declare-fun res!90271 () Bool)

(assert (=> b!109402 (=> (not res!90271) (not e!71696))))

(declare-fun withMovedBitIndex!0 (BitStream!4016 (_ BitVec 64)) BitStream!4016)

(assert (=> b!109402 (= res!90271 (= (_1!4809 lt!165357) (withMovedBitIndex!0 (_2!4809 lt!165357) (bvsub lt!165367 lt!165354))))))

(assert (=> b!109402 (= lt!165367 (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))))))

(assert (=> b!109402 (= (_1!4809 lt!165353) (withMovedBitIndex!0 (_2!4809 lt!165353) (bvsub lt!165340 lt!165354)))))

(assert (=> b!109402 (= lt!165354 (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165363))) (currentByte!5198 (_2!4807 lt!165363)) (currentBit!5193 (_2!4807 lt!165363))))))

(assert (=> b!109402 (= lt!165340 (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)))))

(declare-fun lt!165358 () tuple2!9106)

(assert (=> b!109402 (and (= (_2!4810 lt!165359) (_2!4810 lt!165358)) (= (_1!4810 lt!165359) (_1!4810 lt!165358)))))

(declare-fun lt!165366 () Unit!6683)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6683)

(assert (=> b!109402 (= lt!165366 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4809 lt!165353) nBits!396 i!615 lt!165356))))

(assert (=> b!109402 (= lt!165358 (readNLeastSignificantBitsLoopPure!0 lt!165346 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165364))))

(assert (=> b!109402 (= lt!165346 (withMovedBitIndex!0 (_1!4809 lt!165353) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!21626 res!90269) b!109400))

(assert (= (and b!109400 res!90265) b!109394))

(assert (= (and b!109394 res!90262) b!109392))

(assert (= (and b!109392 res!90274) b!109397))

(assert (= (and b!109397 res!90270) b!109398))

(assert (= (and b!109398 res!90261) b!109388))

(assert (= (and b!109388 res!90272) b!109391))

(assert (= (and b!109391 res!90273) b!109395))

(assert (= (and b!109397 res!90263) b!109393))

(assert (= (and b!109393 res!90266) b!109399))

(assert (= (and b!109397 res!90268) b!109389))

(assert (= (and b!109397 (not res!90267)) b!109402))

(assert (= (and b!109402 res!90271) b!109390))

(assert (= (and b!109402 (not res!90264)) b!109396))

(assert (= start!21626 b!109401))

(declare-fun m!162361 () Bool)

(assert (=> b!109393 m!162361))

(declare-fun m!162363 () Bool)

(assert (=> start!21626 m!162363))

(declare-fun m!162365 () Bool)

(assert (=> b!109394 m!162365))

(declare-fun m!162367 () Bool)

(assert (=> b!109399 m!162367))

(declare-fun m!162369 () Bool)

(assert (=> b!109396 m!162369))

(declare-fun m!162371 () Bool)

(assert (=> b!109395 m!162371))

(declare-fun m!162373 () Bool)

(assert (=> b!109391 m!162373))

(assert (=> b!109391 m!162373))

(declare-fun m!162375 () Bool)

(assert (=> b!109391 m!162375))

(declare-fun m!162377 () Bool)

(assert (=> b!109401 m!162377))

(declare-fun m!162379 () Bool)

(assert (=> b!109398 m!162379))

(declare-fun m!162381 () Bool)

(assert (=> b!109398 m!162381))

(declare-fun m!162383 () Bool)

(assert (=> b!109397 m!162383))

(declare-fun m!162385 () Bool)

(assert (=> b!109397 m!162385))

(declare-fun m!162387 () Bool)

(assert (=> b!109397 m!162387))

(declare-fun m!162389 () Bool)

(assert (=> b!109397 m!162389))

(declare-fun m!162391 () Bool)

(assert (=> b!109397 m!162391))

(declare-fun m!162393 () Bool)

(assert (=> b!109397 m!162393))

(declare-fun m!162395 () Bool)

(assert (=> b!109397 m!162395))

(declare-fun m!162397 () Bool)

(assert (=> b!109397 m!162397))

(declare-fun m!162399 () Bool)

(assert (=> b!109397 m!162399))

(declare-fun m!162401 () Bool)

(assert (=> b!109397 m!162401))

(declare-fun m!162403 () Bool)

(assert (=> b!109397 m!162403))

(declare-fun m!162405 () Bool)

(assert (=> b!109397 m!162405))

(declare-fun m!162407 () Bool)

(assert (=> b!109397 m!162407))

(declare-fun m!162409 () Bool)

(assert (=> b!109397 m!162409))

(declare-fun m!162411 () Bool)

(assert (=> b!109397 m!162411))

(declare-fun m!162413 () Bool)

(assert (=> b!109397 m!162413))

(declare-fun m!162415 () Bool)

(assert (=> b!109397 m!162415))

(declare-fun m!162417 () Bool)

(assert (=> b!109397 m!162417))

(declare-fun m!162419 () Bool)

(assert (=> b!109397 m!162419))

(declare-fun m!162421 () Bool)

(assert (=> b!109400 m!162421))

(declare-fun m!162423 () Bool)

(assert (=> b!109388 m!162423))

(declare-fun m!162425 () Bool)

(assert (=> b!109402 m!162425))

(declare-fun m!162427 () Bool)

(assert (=> b!109402 m!162427))

(declare-fun m!162429 () Bool)

(assert (=> b!109402 m!162429))

(assert (=> b!109402 m!162381))

(declare-fun m!162431 () Bool)

(assert (=> b!109402 m!162431))

(declare-fun m!162433 () Bool)

(assert (=> b!109402 m!162433))

(declare-fun m!162435 () Bool)

(assert (=> b!109402 m!162435))

(assert (=> b!109402 m!162379))

(push 1)

(assert (not b!109395))

(assert (not b!109397))

(assert (not b!109393))

(assert (not b!109401))

(assert (not b!109399))

(assert (not b!109388))

(assert (not b!109402))

(assert (not b!109398))

(assert (not b!109396))

(assert (not b!109391))

(assert (not start!21626))

(assert (not b!109400))

(assert (not b!109394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34506 () Bool)

(declare-fun e!71755 () Bool)

(assert (=> d!34506 e!71755))

(declare-fun res!90353 () Bool)

(assert (=> d!34506 (=> (not res!90353) (not e!71755))))

(declare-fun lt!165609 () (_ BitVec 64))

(declare-fun lt!165612 () (_ BitVec 64))

(declare-fun lt!165611 () (_ BitVec 64))

(assert (=> d!34506 (= res!90353 (= lt!165611 (bvsub lt!165609 lt!165612)))))

(assert (=> d!34506 (or (= (bvand lt!165609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165612 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165609 lt!165612) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34506 (= lt!165612 (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4808 lt!165349)))) ((_ sign_extend 32) (currentByte!5198 (_1!4808 lt!165349))) ((_ sign_extend 32) (currentBit!5193 (_1!4808 lt!165349)))))))

(declare-fun lt!165614 () (_ BitVec 64))

(declare-fun lt!165610 () (_ BitVec 64))

(assert (=> d!34506 (= lt!165609 (bvmul lt!165614 lt!165610))))

(assert (=> d!34506 (or (= lt!165614 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165610 (bvsdiv (bvmul lt!165614 lt!165610) lt!165614)))))

(assert (=> d!34506 (= lt!165610 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34506 (= lt!165614 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4808 lt!165349)))))))

(assert (=> d!34506 (= lt!165611 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5198 (_1!4808 lt!165349))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5193 (_1!4808 lt!165349)))))))

(assert (=> d!34506 (invariant!0 (currentBit!5193 (_1!4808 lt!165349)) (currentByte!5198 (_1!4808 lt!165349)) (size!2271 (buf!2662 (_1!4808 lt!165349))))))

(assert (=> d!34506 (= (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!165349))) (currentByte!5198 (_1!4808 lt!165349)) (currentBit!5193 (_1!4808 lt!165349))) lt!165611)))

(declare-fun b!109487 () Bool)

(declare-fun res!90354 () Bool)

(assert (=> b!109487 (=> (not res!90354) (not e!71755))))

(assert (=> b!109487 (= res!90354 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165611))))

(declare-fun b!109488 () Bool)

(declare-fun lt!165613 () (_ BitVec 64))

(assert (=> b!109488 (= e!71755 (bvsle lt!165611 (bvmul lt!165613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109488 (or (= lt!165613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165613)))))

(assert (=> b!109488 (= lt!165613 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4808 lt!165349)))))))

(assert (= (and d!34506 res!90353) b!109487))

(assert (= (and b!109487 res!90354) b!109488))

(declare-fun m!162609 () Bool)

(assert (=> d!34506 m!162609))

(declare-fun m!162611 () Bool)

(assert (=> d!34506 m!162611))

(assert (=> b!109395 d!34506))

(declare-fun d!34508 () Bool)

(assert (=> d!34508 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4809 lt!165353)))) ((_ sign_extend 32) (currentByte!5198 (_1!4809 lt!165353))) ((_ sign_extend 32) (currentBit!5193 (_1!4809 lt!165353))) lt!165342) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4809 lt!165353)))) ((_ sign_extend 32) (currentByte!5198 (_1!4809 lt!165353))) ((_ sign_extend 32) (currentBit!5193 (_1!4809 lt!165353)))) lt!165342))))

(declare-fun bs!8426 () Bool)

(assert (= bs!8426 d!34508))

(declare-fun m!162613 () Bool)

(assert (=> bs!8426 m!162613))

(assert (=> b!109396 d!34508))

(declare-fun d!34510 () Bool)

(assert (=> d!34510 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305) (size!2271 (buf!2662 thiss!1305))))))

(declare-fun bs!8427 () Bool)

(assert (= bs!8427 d!34510))

(declare-fun m!162615 () Bool)

(assert (=> bs!8427 m!162615))

(assert (=> start!21626 d!34510))

(declare-fun d!34512 () Bool)

(assert (=> d!34512 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!109394 d!34512))

(declare-fun d!34514 () Bool)

(declare-fun e!71756 () Bool)

(assert (=> d!34514 e!71756))

(declare-fun res!90355 () Bool)

(assert (=> d!34514 (=> (not res!90355) (not e!71756))))

(declare-fun lt!165615 () (_ BitVec 64))

(declare-fun lt!165618 () (_ BitVec 64))

(declare-fun lt!165617 () (_ BitVec 64))

(assert (=> d!34514 (= res!90355 (= lt!165617 (bvsub lt!165615 lt!165618)))))

(assert (=> d!34514 (or (= (bvand lt!165615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165615 lt!165618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34514 (= lt!165618 (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165344)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165344))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165344)))))))

(declare-fun lt!165620 () (_ BitVec 64))

(declare-fun lt!165616 () (_ BitVec 64))

(assert (=> d!34514 (= lt!165615 (bvmul lt!165620 lt!165616))))

(assert (=> d!34514 (or (= lt!165620 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165616 (bvsdiv (bvmul lt!165620 lt!165616) lt!165620)))))

(assert (=> d!34514 (= lt!165616 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34514 (= lt!165620 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165344)))))))

(assert (=> d!34514 (= lt!165617 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165344))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165344)))))))

(assert (=> d!34514 (invariant!0 (currentBit!5193 (_2!4807 lt!165344)) (currentByte!5198 (_2!4807 lt!165344)) (size!2271 (buf!2662 (_2!4807 lt!165344))))))

(assert (=> d!34514 (= (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))) lt!165617)))

(declare-fun b!109489 () Bool)

(declare-fun res!90356 () Bool)

(assert (=> b!109489 (=> (not res!90356) (not e!71756))))

(assert (=> b!109489 (= res!90356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165617))))

(declare-fun b!109490 () Bool)

(declare-fun lt!165619 () (_ BitVec 64))

(assert (=> b!109490 (= e!71756 (bvsle lt!165617 (bvmul lt!165619 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109490 (or (= lt!165619 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165619 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165619)))))

(assert (=> b!109490 (= lt!165619 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165344)))))))

(assert (= (and d!34514 res!90355) b!109489))

(assert (= (and b!109489 res!90356) b!109490))

(declare-fun m!162617 () Bool)

(assert (=> d!34514 m!162617))

(declare-fun m!162619 () Bool)

(assert (=> d!34514 m!162619))

(assert (=> b!109398 d!34514))

(declare-fun d!34516 () Bool)

(declare-fun e!71757 () Bool)

(assert (=> d!34516 e!71757))

(declare-fun res!90357 () Bool)

(assert (=> d!34516 (=> (not res!90357) (not e!71757))))

(declare-fun lt!165624 () (_ BitVec 64))

(declare-fun lt!165623 () (_ BitVec 64))

(declare-fun lt!165621 () (_ BitVec 64))

(assert (=> d!34516 (= res!90357 (= lt!165623 (bvsub lt!165621 lt!165624)))))

(assert (=> d!34516 (or (= (bvand lt!165621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165624 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165621 lt!165624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34516 (= lt!165624 (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 thiss!1305))) ((_ sign_extend 32) (currentByte!5198 thiss!1305)) ((_ sign_extend 32) (currentBit!5193 thiss!1305))))))

(declare-fun lt!165626 () (_ BitVec 64))

(declare-fun lt!165622 () (_ BitVec 64))

(assert (=> d!34516 (= lt!165621 (bvmul lt!165626 lt!165622))))

(assert (=> d!34516 (or (= lt!165626 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165622 (bvsdiv (bvmul lt!165626 lt!165622) lt!165626)))))

(assert (=> d!34516 (= lt!165622 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34516 (= lt!165626 ((_ sign_extend 32) (size!2271 (buf!2662 thiss!1305))))))

(assert (=> d!34516 (= lt!165623 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5198 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5193 thiss!1305))))))

(assert (=> d!34516 (invariant!0 (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305) (size!2271 (buf!2662 thiss!1305)))))

(assert (=> d!34516 (= (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)) lt!165623)))

(declare-fun b!109491 () Bool)

(declare-fun res!90358 () Bool)

(assert (=> b!109491 (=> (not res!90358) (not e!71757))))

(assert (=> b!109491 (= res!90358 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165623))))

(declare-fun b!109492 () Bool)

(declare-fun lt!165625 () (_ BitVec 64))

(assert (=> b!109492 (= e!71757 (bvsle lt!165623 (bvmul lt!165625 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109492 (or (= lt!165625 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165625 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165625)))))

(assert (=> b!109492 (= lt!165625 ((_ sign_extend 32) (size!2271 (buf!2662 thiss!1305))))))

(assert (= (and d!34516 res!90357) b!109491))

(assert (= (and b!109491 res!90358) b!109492))

(declare-fun m!162621 () Bool)

(assert (=> d!34516 m!162621))

(assert (=> d!34516 m!162615))

(assert (=> b!109398 d!34516))

(declare-fun d!34518 () Bool)

(declare-fun res!90367 () Bool)

(declare-fun e!71763 () Bool)

(assert (=> d!34518 (=> (not res!90367) (not e!71763))))

(assert (=> d!34518 (= res!90367 (= (size!2271 (buf!2662 thiss!1305)) (size!2271 (buf!2662 (_2!4807 lt!165344)))))))

(assert (=> d!34518 (= (isPrefixOf!0 thiss!1305 (_2!4807 lt!165344)) e!71763)))

(declare-fun b!109499 () Bool)

(declare-fun res!90366 () Bool)

(assert (=> b!109499 (=> (not res!90366) (not e!71763))))

(assert (=> b!109499 (= res!90366 (bvsle (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)) (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344)))))))

(declare-fun b!109500 () Bool)

(declare-fun e!71762 () Bool)

(assert (=> b!109500 (= e!71763 e!71762)))

(declare-fun res!90365 () Bool)

(assert (=> b!109500 (=> res!90365 e!71762)))

(assert (=> b!109500 (= res!90365 (= (size!2271 (buf!2662 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!109501 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4989 array!4989 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109501 (= e!71762 (arrayBitRangesEq!0 (buf!2662 thiss!1305) (buf!2662 (_2!4807 lt!165344)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305))))))

(assert (= (and d!34518 res!90367) b!109499))

(assert (= (and b!109499 res!90366) b!109500))

(assert (= (and b!109500 (not res!90365)) b!109501))

(assert (=> b!109499 m!162381))

(assert (=> b!109499 m!162379))

(assert (=> b!109501 m!162381))

(assert (=> b!109501 m!162381))

(declare-fun m!162623 () Bool)

(assert (=> b!109501 m!162623))

(assert (=> b!109388 d!34518))

(declare-fun d!34520 () Bool)

(assert (=> d!34520 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!109397 d!34520))

(declare-fun d!34522 () Bool)

(declare-fun e!71764 () Bool)

(assert (=> d!34522 e!71764))

(declare-fun res!90368 () Bool)

(assert (=> d!34522 (=> (not res!90368) (not e!71764))))

(declare-fun lt!165627 () (_ BitVec 64))

(declare-fun lt!165630 () (_ BitVec 64))

(declare-fun lt!165629 () (_ BitVec 64))

(assert (=> d!34522 (= res!90368 (= lt!165629 (bvsub lt!165627 lt!165630)))))

(assert (=> d!34522 (or (= (bvand lt!165627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165627 lt!165630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34522 (= lt!165630 (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4808 lt!165350)))) ((_ sign_extend 32) (currentByte!5198 (_1!4808 lt!165350))) ((_ sign_extend 32) (currentBit!5193 (_1!4808 lt!165350)))))))

(declare-fun lt!165632 () (_ BitVec 64))

(declare-fun lt!165628 () (_ BitVec 64))

(assert (=> d!34522 (= lt!165627 (bvmul lt!165632 lt!165628))))

(assert (=> d!34522 (or (= lt!165632 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165628 (bvsdiv (bvmul lt!165632 lt!165628) lt!165632)))))

(assert (=> d!34522 (= lt!165628 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34522 (= lt!165632 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4808 lt!165350)))))))

(assert (=> d!34522 (= lt!165629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5198 (_1!4808 lt!165350))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5193 (_1!4808 lt!165350)))))))

(assert (=> d!34522 (invariant!0 (currentBit!5193 (_1!4808 lt!165350)) (currentByte!5198 (_1!4808 lt!165350)) (size!2271 (buf!2662 (_1!4808 lt!165350))))))

(assert (=> d!34522 (= (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!165350))) (currentByte!5198 (_1!4808 lt!165350)) (currentBit!5193 (_1!4808 lt!165350))) lt!165629)))

(declare-fun b!109502 () Bool)

(declare-fun res!90369 () Bool)

(assert (=> b!109502 (=> (not res!90369) (not e!71764))))

(assert (=> b!109502 (= res!90369 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165629))))

(declare-fun b!109503 () Bool)

(declare-fun lt!165631 () (_ BitVec 64))

(assert (=> b!109503 (= e!71764 (bvsle lt!165629 (bvmul lt!165631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109503 (or (= lt!165631 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165631 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165631)))))

(assert (=> b!109503 (= lt!165631 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4808 lt!165350)))))))

(assert (= (and d!34522 res!90368) b!109502))

(assert (= (and b!109502 res!90369) b!109503))

(declare-fun m!162625 () Bool)

(assert (=> d!34522 m!162625))

(declare-fun m!162627 () Bool)

(assert (=> d!34522 m!162627))

(assert (=> b!109397 d!34522))

(declare-fun b!109516 () Bool)

(declare-fun e!71770 () Bool)

(declare-fun lt!165644 () tuple2!9102)

(declare-fun lt!165642 () tuple2!9100)

(assert (=> b!109516 (= e!71770 (= (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!165644))) (currentByte!5198 (_1!4808 lt!165644)) (currentBit!5193 (_1!4808 lt!165644))) (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165642))) (currentByte!5198 (_2!4807 lt!165642)) (currentBit!5193 (_2!4807 lt!165642)))))))

(declare-fun b!109515 () Bool)

(declare-fun e!71769 () Bool)

(assert (=> b!109515 (= e!71769 e!71770)))

(declare-fun res!90381 () Bool)

(assert (=> b!109515 (=> (not res!90381) (not e!71770))))

(assert (=> b!109515 (= res!90381 (and (= (_2!4808 lt!165644) lt!165341) (= (_1!4808 lt!165644) (_2!4807 lt!165642))))))

(assert (=> b!109515 (= lt!165644 (readBitPure!0 (readerFrom!0 (_2!4807 lt!165642) (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305))))))

(declare-fun b!109514 () Bool)

(declare-fun res!90380 () Bool)

(assert (=> b!109514 (=> (not res!90380) (not e!71769))))

(assert (=> b!109514 (= res!90380 (isPrefixOf!0 thiss!1305 (_2!4807 lt!165642)))))

(declare-fun b!109513 () Bool)

(declare-fun res!90378 () Bool)

(assert (=> b!109513 (=> (not res!90378) (not e!71769))))

(declare-fun lt!165643 () (_ BitVec 64))

(declare-fun lt!165641 () (_ BitVec 64))

(assert (=> b!109513 (= res!90378 (= (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165642))) (currentByte!5198 (_2!4807 lt!165642)) (currentBit!5193 (_2!4807 lt!165642))) (bvadd lt!165641 lt!165643)))))

(assert (=> b!109513 (or (not (= (bvand lt!165641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165643 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165641 lt!165643) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109513 (= lt!165643 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!109513 (= lt!165641 (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)))))

(declare-fun d!34524 () Bool)

(assert (=> d!34524 e!71769))

(declare-fun res!90379 () Bool)

(assert (=> d!34524 (=> (not res!90379) (not e!71769))))

(assert (=> d!34524 (= res!90379 (= (size!2271 (buf!2662 thiss!1305)) (size!2271 (buf!2662 (_2!4807 lt!165642)))))))

(declare-fun choose!16 (BitStream!4016 Bool) tuple2!9100)

(assert (=> d!34524 (= lt!165642 (choose!16 thiss!1305 lt!165341))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34524 (validate_offset_bit!0 ((_ sign_extend 32) (size!2271 (buf!2662 thiss!1305))) ((_ sign_extend 32) (currentByte!5198 thiss!1305)) ((_ sign_extend 32) (currentBit!5193 thiss!1305)))))

(assert (=> d!34524 (= (appendBit!0 thiss!1305 lt!165341) lt!165642)))

(assert (= (and d!34524 res!90379) b!109513))

(assert (= (and b!109513 res!90378) b!109514))

(assert (= (and b!109514 res!90380) b!109515))

(assert (= (and b!109515 res!90381) b!109516))

(declare-fun m!162629 () Bool)

(assert (=> b!109516 m!162629))

(declare-fun m!162631 () Bool)

(assert (=> b!109516 m!162631))

(declare-fun m!162633 () Bool)

(assert (=> d!34524 m!162633))

(declare-fun m!162635 () Bool)

(assert (=> d!34524 m!162635))

(declare-fun m!162637 () Bool)

(assert (=> b!109515 m!162637))

(assert (=> b!109515 m!162637))

(declare-fun m!162639 () Bool)

(assert (=> b!109515 m!162639))

(assert (=> b!109513 m!162631))

(assert (=> b!109513 m!162381))

(declare-fun m!162641 () Bool)

(assert (=> b!109514 m!162641))

(assert (=> b!109397 d!34524))

(declare-fun d!34526 () Bool)

(declare-datatypes ((tuple2!9116 0))(
  ( (tuple2!9117 (_1!4815 Bool) (_2!4815 BitStream!4016)) )
))
(declare-fun lt!165647 () tuple2!9116)

(declare-fun readBit!0 (BitStream!4016) tuple2!9116)

(assert (=> d!34526 (= lt!165647 (readBit!0 (BitStream!4017 (buf!2662 (_2!4807 lt!165363)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305))))))

(assert (=> d!34526 (= (readBitPure!0 (BitStream!4017 (buf!2662 (_2!4807 lt!165363)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305))) (tuple2!9103 (_2!4815 lt!165647) (_1!4815 lt!165647)))))

(declare-fun bs!8428 () Bool)

(assert (= bs!8428 d!34526))

(declare-fun m!162643 () Bool)

(assert (=> bs!8428 m!162643))

(assert (=> b!109397 d!34526))

(declare-fun d!34528 () Bool)

(declare-fun lt!165648 () tuple2!9116)

(assert (=> d!34528 (= lt!165648 (readBit!0 lt!165355))))

(assert (=> d!34528 (= (readBitPure!0 lt!165355) (tuple2!9103 (_2!4815 lt!165648) (_1!4815 lt!165648)))))

(declare-fun bs!8429 () Bool)

(assert (= bs!8429 d!34528))

(declare-fun m!162645 () Bool)

(assert (=> bs!8429 m!162645))

(assert (=> b!109397 d!34528))

(declare-fun b!109672 () Bool)

(declare-fun res!90501 () Bool)

(declare-fun e!71858 () Bool)

(assert (=> b!109672 (=> (not res!90501) (not e!71858))))

(declare-fun lt!166166 () (_ BitVec 64))

(declare-fun lt!166146 () tuple2!9100)

(declare-fun lt!166147 () (_ BitVec 64))

(assert (=> b!109672 (= res!90501 (= (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!166146))) (currentByte!5198 (_2!4807 lt!166146)) (currentBit!5193 (_2!4807 lt!166146))) (bvadd lt!166166 lt!166147)))))

(assert (=> b!109672 (or (not (= (bvand lt!166166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!166147 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!166166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!166166 lt!166147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109672 (= lt!166147 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!109672 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!109672 (= lt!166166 (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))))))

(declare-fun d!34530 () Bool)

(assert (=> d!34530 e!71858))

(declare-fun res!90506 () Bool)

(assert (=> d!34530 (=> (not res!90506) (not e!71858))))

(assert (=> d!34530 (= res!90506 (= (size!2271 (buf!2662 (_2!4807 lt!165344))) (size!2271 (buf!2662 (_2!4807 lt!166146)))))))

(declare-fun e!71859 () tuple2!9100)

(assert (=> d!34530 (= lt!166146 e!71859)))

(declare-fun c!6712 () Bool)

(assert (=> d!34530 (= c!6712 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34530 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34530 (= (appendNLeastSignificantBitsLoop!0 (_2!4807 lt!165344) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!166146)))

(declare-fun b!109673 () Bool)

(declare-fun lt!166144 () Unit!6683)

(assert (=> b!109673 (= e!71859 (tuple2!9101 lt!166144 (_2!4807 lt!165344)))))

(declare-fun lt!166145 () BitStream!4016)

(assert (=> b!109673 (= lt!166145 (_2!4807 lt!165344))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4016) Unit!6683)

(assert (=> b!109673 (= lt!166144 (lemmaIsPrefixRefl!0 lt!166145))))

(declare-fun call!1386 () Bool)

(assert (=> b!109673 call!1386))

(declare-fun b!109674 () Bool)

(declare-fun e!71861 () Bool)

(declare-fun lt!166169 () tuple2!9102)

(declare-fun lt!166173 () tuple2!9100)

(assert (=> b!109674 (= e!71861 (= (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!166169))) (currentByte!5198 (_1!4808 lt!166169)) (currentBit!5193 (_1!4808 lt!166169))) (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!166173))) (currentByte!5198 (_2!4807 lt!166173)) (currentBit!5193 (_2!4807 lt!166173)))))))

(declare-fun b!109675 () Bool)

(declare-fun res!90503 () Bool)

(assert (=> b!109675 (= res!90503 call!1386)))

(declare-fun e!71857 () Bool)

(assert (=> b!109675 (=> (not res!90503) (not e!71857))))

(declare-fun b!109676 () Bool)

(declare-fun e!71860 () (_ BitVec 64))

(assert (=> b!109676 (= e!71860 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!109677 () Bool)

(declare-fun res!90499 () Bool)

(assert (=> b!109677 (= res!90499 (= (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!166173))) (currentByte!5198 (_2!4807 lt!166173)) (currentBit!5193 (_2!4807 lt!166173))) (bvadd (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!109677 (=> (not res!90499) (not e!71857))))

(declare-fun b!109678 () Bool)

(assert (=> b!109678 (= e!71860 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!109679 () Bool)

(declare-fun e!71855 () Bool)

(declare-fun lt!166153 () (_ BitVec 64))

(assert (=> b!109679 (= e!71855 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165344)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165344))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165344))) lt!166153))))

(declare-fun b!109680 () Bool)

(assert (=> b!109680 (= lt!166169 (readBitPure!0 (readerFrom!0 (_2!4807 lt!166173) (currentBit!5193 (_2!4807 lt!165344)) (currentByte!5198 (_2!4807 lt!165344)))))))

(declare-fun lt!166148 () Bool)

(declare-fun res!90500 () Bool)

(assert (=> b!109680 (= res!90500 (and (= (_2!4808 lt!166169) lt!166148) (= (_1!4808 lt!166169) (_2!4807 lt!166173))))))

(assert (=> b!109680 (=> (not res!90500) (not e!71861))))

(assert (=> b!109680 (= e!71857 e!71861)))

(declare-fun b!109681 () Bool)

(declare-fun e!71856 () Bool)

(declare-fun lt!166162 () tuple2!9102)

(declare-fun lt!166159 () tuple2!9102)

(assert (=> b!109681 (= e!71856 (= (_2!4808 lt!166162) (_2!4808 lt!166159)))))

(declare-fun lt!166135 () tuple2!9106)

(declare-fun b!109682 () Bool)

(declare-fun lt!166157 () tuple2!9104)

(assert (=> b!109682 (= e!71858 (and (= (_2!4810 lt!166135) v!199) (= (_1!4810 lt!166135) (_2!4809 lt!166157))))))

(declare-fun lt!166160 () (_ BitVec 64))

(assert (=> b!109682 (= lt!166135 (readNLeastSignificantBitsLoopPure!0 (_1!4809 lt!166157) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166160))))

(declare-fun lt!166163 () Unit!6683)

(declare-fun lt!166137 () Unit!6683)

(assert (=> b!109682 (= lt!166163 lt!166137)))

(assert (=> b!109682 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!166146)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165344))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165344))) lt!166153)))

(assert (=> b!109682 (= lt!166137 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4807 lt!165344) (buf!2662 (_2!4807 lt!166146)) lt!166153))))

(assert (=> b!109682 e!71855))

(declare-fun res!90504 () Bool)

(assert (=> b!109682 (=> (not res!90504) (not e!71855))))

(assert (=> b!109682 (= res!90504 (and (= (size!2271 (buf!2662 (_2!4807 lt!165344))) (size!2271 (buf!2662 (_2!4807 lt!166146)))) (bvsge lt!166153 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109682 (= lt!166153 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!109682 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!109682 (= lt!166160 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!109682 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!109682 (= lt!166157 (reader!0 (_2!4807 lt!165344) (_2!4807 lt!166146)))))

(declare-fun b!109683 () Bool)

(declare-fun lt!166139 () tuple2!9100)

(declare-fun Unit!6701 () Unit!6683)

(assert (=> b!109683 (= e!71859 (tuple2!9101 Unit!6701 (_2!4807 lt!166139)))))

(assert (=> b!109683 (= lt!166148 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109683 (= lt!166173 (appendBit!0 (_2!4807 lt!165344) lt!166148))))

(declare-fun res!90498 () Bool)

(assert (=> b!109683 (= res!90498 (= (size!2271 (buf!2662 (_2!4807 lt!165344))) (size!2271 (buf!2662 (_2!4807 lt!166173)))))))

(assert (=> b!109683 (=> (not res!90498) (not e!71857))))

(assert (=> b!109683 e!71857))

(declare-fun lt!166141 () tuple2!9100)

(assert (=> b!109683 (= lt!166141 lt!166173)))

(assert (=> b!109683 (= lt!166139 (appendNLeastSignificantBitsLoop!0 (_2!4807 lt!166141) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!166140 () Unit!6683)

(assert (=> b!109683 (= lt!166140 (lemmaIsPrefixTransitive!0 (_2!4807 lt!165344) (_2!4807 lt!166141) (_2!4807 lt!166139)))))

(assert (=> b!109683 (isPrefixOf!0 (_2!4807 lt!165344) (_2!4807 lt!166139))))

(declare-fun lt!166150 () Unit!6683)

(assert (=> b!109683 (= lt!166150 lt!166140)))

(assert (=> b!109683 (invariant!0 (currentBit!5193 (_2!4807 lt!165344)) (currentByte!5198 (_2!4807 lt!165344)) (size!2271 (buf!2662 (_2!4807 lt!166141))))))

(declare-fun lt!166149 () BitStream!4016)

(assert (=> b!109683 (= lt!166149 (BitStream!4017 (buf!2662 (_2!4807 lt!166141)) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))))))

(assert (=> b!109683 (invariant!0 (currentBit!5193 lt!166149) (currentByte!5198 lt!166149) (size!2271 (buf!2662 (_2!4807 lt!166139))))))

(declare-fun lt!166133 () BitStream!4016)

(assert (=> b!109683 (= lt!166133 (BitStream!4017 (buf!2662 (_2!4807 lt!166139)) (currentByte!5198 lt!166149) (currentBit!5193 lt!166149)))))

(assert (=> b!109683 (= lt!166162 (readBitPure!0 lt!166149))))

(assert (=> b!109683 (= lt!166159 (readBitPure!0 lt!166133))))

(declare-fun lt!166175 () Unit!6683)

(assert (=> b!109683 (= lt!166175 (readBitPrefixLemma!0 lt!166149 (_2!4807 lt!166139)))))

(declare-fun res!90502 () Bool)

(assert (=> b!109683 (= res!90502 (= (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!166162))) (currentByte!5198 (_1!4808 lt!166162)) (currentBit!5193 (_1!4808 lt!166162))) (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!166159))) (currentByte!5198 (_1!4808 lt!166159)) (currentBit!5193 (_1!4808 lt!166159)))))))

(assert (=> b!109683 (=> (not res!90502) (not e!71856))))

(assert (=> b!109683 e!71856))

(declare-fun lt!166167 () Unit!6683)

(assert (=> b!109683 (= lt!166167 lt!166175)))

(declare-fun lt!166168 () tuple2!9104)

(assert (=> b!109683 (= lt!166168 (reader!0 (_2!4807 lt!165344) (_2!4807 lt!166139)))))

(declare-fun lt!166143 () tuple2!9104)

(assert (=> b!109683 (= lt!166143 (reader!0 (_2!4807 lt!166141) (_2!4807 lt!166139)))))

(declare-fun lt!166138 () tuple2!9102)

(assert (=> b!109683 (= lt!166138 (readBitPure!0 (_1!4809 lt!166168)))))

(assert (=> b!109683 (= (_2!4808 lt!166138) lt!166148)))

(declare-fun lt!166171 () Unit!6683)

(declare-fun Unit!6702 () Unit!6683)

(assert (=> b!109683 (= lt!166171 Unit!6702)))

(declare-fun lt!166151 () (_ BitVec 64))

(assert (=> b!109683 (= lt!166151 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!166172 () (_ BitVec 64))

(assert (=> b!109683 (= lt!166172 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!166179 () Unit!6683)

(assert (=> b!109683 (= lt!166179 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4807 lt!165344) (buf!2662 (_2!4807 lt!166139)) lt!166172))))

(assert (=> b!109683 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!166139)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165344))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165344))) lt!166172)))

(declare-fun lt!166181 () Unit!6683)

(assert (=> b!109683 (= lt!166181 lt!166179)))

(declare-fun lt!166134 () tuple2!9106)

(assert (=> b!109683 (= lt!166134 (readNLeastSignificantBitsLoopPure!0 (_1!4809 lt!166168) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166151))))

(declare-fun lt!166170 () (_ BitVec 64))

(assert (=> b!109683 (= lt!166170 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!166161 () Unit!6683)

(assert (=> b!109683 (= lt!166161 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4807 lt!166141) (buf!2662 (_2!4807 lt!166139)) lt!166170))))

(assert (=> b!109683 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!166139)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!166141))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!166141))) lt!166170)))

(declare-fun lt!166156 () Unit!6683)

(assert (=> b!109683 (= lt!166156 lt!166161)))

(declare-fun lt!166158 () tuple2!9106)

(assert (=> b!109683 (= lt!166158 (readNLeastSignificantBitsLoopPure!0 (_1!4809 lt!166143) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!166151 (ite (_2!4808 lt!166138) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!166155 () tuple2!9106)

(assert (=> b!109683 (= lt!166155 (readNLeastSignificantBitsLoopPure!0 (_1!4809 lt!166168) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166151))))

(declare-fun c!6713 () Bool)

(assert (=> b!109683 (= c!6713 (_2!4808 (readBitPure!0 (_1!4809 lt!166168))))))

(declare-fun lt!166136 () tuple2!9106)

(assert (=> b!109683 (= lt!166136 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4809 lt!166168) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!166151 e!71860)))))

(declare-fun lt!166152 () Unit!6683)

(assert (=> b!109683 (= lt!166152 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4809 lt!166168) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166151))))

(assert (=> b!109683 (and (= (_2!4810 lt!166155) (_2!4810 lt!166136)) (= (_1!4810 lt!166155) (_1!4810 lt!166136)))))

(declare-fun lt!166154 () Unit!6683)

(assert (=> b!109683 (= lt!166154 lt!166152)))

(assert (=> b!109683 (= (_1!4809 lt!166168) (withMovedBitIndex!0 (_2!4809 lt!166168) (bvsub (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))) (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!166139))) (currentByte!5198 (_2!4807 lt!166139)) (currentBit!5193 (_2!4807 lt!166139))))))))

(declare-fun lt!166164 () Unit!6683)

(declare-fun Unit!6703 () Unit!6683)

(assert (=> b!109683 (= lt!166164 Unit!6703)))

(assert (=> b!109683 (= (_1!4809 lt!166143) (withMovedBitIndex!0 (_2!4809 lt!166143) (bvsub (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!166141))) (currentByte!5198 (_2!4807 lt!166141)) (currentBit!5193 (_2!4807 lt!166141))) (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!166139))) (currentByte!5198 (_2!4807 lt!166139)) (currentBit!5193 (_2!4807 lt!166139))))))))

(declare-fun lt!166142 () Unit!6683)

(declare-fun Unit!6704 () Unit!6683)

(assert (=> b!109683 (= lt!166142 Unit!6704)))

(assert (=> b!109683 (= (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))) (bvsub (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!166141))) (currentByte!5198 (_2!4807 lt!166141)) (currentBit!5193 (_2!4807 lt!166141))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!166165 () Unit!6683)

(declare-fun Unit!6705 () Unit!6683)

(assert (=> b!109683 (= lt!166165 Unit!6705)))

(assert (=> b!109683 (= (_2!4810 lt!166134) (_2!4810 lt!166158))))

(declare-fun lt!166174 () Unit!6683)

(declare-fun Unit!6706 () Unit!6683)

(assert (=> b!109683 (= lt!166174 Unit!6706)))

(assert (=> b!109683 (= (_1!4810 lt!166134) (_2!4809 lt!166168))))

(declare-fun b!109684 () Bool)

(declare-fun res!90505 () Bool)

(assert (=> b!109684 (=> (not res!90505) (not e!71858))))

(assert (=> b!109684 (= res!90505 (isPrefixOf!0 (_2!4807 lt!165344) (_2!4807 lt!166146)))))

(declare-fun bm!1383 () Bool)

(assert (=> bm!1383 (= call!1386 (isPrefixOf!0 (ite c!6712 (_2!4807 lt!165344) lt!166145) (ite c!6712 (_2!4807 lt!166173) lt!166145)))))

(assert (= (and d!34530 c!6712) b!109683))

(assert (= (and d!34530 (not c!6712)) b!109673))

(assert (= (and b!109683 res!90498) b!109677))

(assert (= (and b!109677 res!90499) b!109675))

(assert (= (and b!109675 res!90503) b!109680))

(assert (= (and b!109680 res!90500) b!109674))

(assert (= (and b!109683 res!90502) b!109681))

(assert (= (and b!109683 c!6713) b!109676))

(assert (= (and b!109683 (not c!6713)) b!109678))

(assert (= (or b!109675 b!109673) bm!1383))

(assert (= (and d!34530 res!90506) b!109672))

(assert (= (and b!109672 res!90501) b!109684))

(assert (= (and b!109684 res!90505) b!109682))

(assert (= (and b!109682 res!90504) b!109679))

(declare-fun m!162961 () Bool)

(assert (=> b!109673 m!162961))

(declare-fun m!162965 () Bool)

(assert (=> b!109683 m!162965))

(declare-fun m!162967 () Bool)

(assert (=> b!109683 m!162967))

(assert (=> b!109683 m!162965))

(declare-fun m!162969 () Bool)

(assert (=> b!109683 m!162969))

(assert (=> b!109683 m!162379))

(declare-fun m!162971 () Bool)

(assert (=> b!109683 m!162971))

(declare-fun m!162973 () Bool)

(assert (=> b!109683 m!162973))

(declare-fun m!162975 () Bool)

(assert (=> b!109683 m!162975))

(declare-fun m!162979 () Bool)

(assert (=> b!109683 m!162979))

(declare-fun m!162981 () Bool)

(assert (=> b!109683 m!162981))

(declare-fun m!162983 () Bool)

(assert (=> b!109683 m!162983))

(declare-fun m!162985 () Bool)

(assert (=> b!109683 m!162985))

(declare-fun m!162987 () Bool)

(assert (=> b!109683 m!162987))

(declare-fun m!162989 () Bool)

(assert (=> b!109683 m!162989))

(declare-fun m!162991 () Bool)

(assert (=> b!109683 m!162991))

(declare-fun m!162993 () Bool)

(assert (=> b!109683 m!162993))

(declare-fun m!162995 () Bool)

(assert (=> b!109683 m!162995))

(declare-fun m!162997 () Bool)

(assert (=> b!109683 m!162997))

(declare-fun m!162999 () Bool)

(assert (=> b!109683 m!162999))

(declare-fun m!163001 () Bool)

(assert (=> b!109683 m!163001))

(declare-fun m!163003 () Bool)

(assert (=> b!109683 m!163003))

(declare-fun m!163005 () Bool)

(assert (=> b!109683 m!163005))

(declare-fun m!163007 () Bool)

(assert (=> b!109683 m!163007))

(declare-fun m!163009 () Bool)

(assert (=> b!109683 m!163009))

(declare-fun m!163011 () Bool)

(assert (=> b!109683 m!163011))

(declare-fun m!163013 () Bool)

(assert (=> b!109683 m!163013))

(declare-fun m!163015 () Bool)

(assert (=> b!109683 m!163015))

(declare-fun m!163017 () Bool)

(assert (=> b!109683 m!163017))

(declare-fun m!163019 () Bool)

(assert (=> b!109683 m!163019))

(declare-fun m!163021 () Bool)

(assert (=> b!109683 m!163021))

(declare-fun m!163023 () Bool)

(assert (=> b!109677 m!163023))

(assert (=> b!109677 m!162379))

(declare-fun m!163025 () Bool)

(assert (=> b!109682 m!163025))

(assert (=> b!109682 m!163009))

(declare-fun m!163027 () Bool)

(assert (=> b!109682 m!163027))

(declare-fun m!163029 () Bool)

(assert (=> b!109682 m!163029))

(declare-fun m!163031 () Bool)

(assert (=> b!109682 m!163031))

(declare-fun m!163033 () Bool)

(assert (=> b!109680 m!163033))

(assert (=> b!109680 m!163033))

(declare-fun m!163035 () Bool)

(assert (=> b!109680 m!163035))

(declare-fun m!163037 () Bool)

(assert (=> b!109674 m!163037))

(assert (=> b!109674 m!163023))

(declare-fun m!163039 () Bool)

(assert (=> b!109684 m!163039))

(declare-fun m!163041 () Bool)

(assert (=> b!109672 m!163041))

(assert (=> b!109672 m!162379))

(declare-fun m!163045 () Bool)

(assert (=> bm!1383 m!163045))

(declare-fun m!163047 () Bool)

(assert (=> b!109679 m!163047))

(assert (=> b!109397 d!34530))

(declare-fun d!34592 () Bool)

(assert (=> d!34592 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))) ((_ sign_extend 32) (currentByte!5198 thiss!1305)) ((_ sign_extend 32) (currentBit!5193 thiss!1305)) lt!165342) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))) ((_ sign_extend 32) (currentByte!5198 thiss!1305)) ((_ sign_extend 32) (currentBit!5193 thiss!1305))) lt!165342))))

(declare-fun bs!8443 () Bool)

(assert (= bs!8443 d!34592))

(declare-fun m!163049 () Bool)

(assert (=> bs!8443 m!163049))

(assert (=> b!109397 d!34592))

(declare-fun d!34594 () Bool)

(assert (=> d!34594 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))) ((_ sign_extend 32) (currentByte!5198 thiss!1305)) ((_ sign_extend 32) (currentBit!5193 thiss!1305)) lt!165342)))

(declare-fun lt!166224 () Unit!6683)

(declare-fun choose!9 (BitStream!4016 array!4989 (_ BitVec 64) BitStream!4016) Unit!6683)

(assert (=> d!34594 (= lt!166224 (choose!9 thiss!1305 (buf!2662 (_2!4807 lt!165363)) lt!165342 (BitStream!4017 (buf!2662 (_2!4807 lt!165363)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305))))))

(assert (=> d!34594 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2662 (_2!4807 lt!165363)) lt!165342) lt!166224)))

(declare-fun bs!8444 () Bool)

(assert (= bs!8444 d!34594))

(assert (=> bs!8444 m!162389))

(declare-fun m!163051 () Bool)

(assert (=> bs!8444 m!163051))

(assert (=> b!109397 d!34594))

(declare-fun d!34598 () Bool)

(declare-fun e!71873 () Bool)

(assert (=> d!34598 e!71873))

(declare-fun res!90524 () Bool)

(assert (=> d!34598 (=> (not res!90524) (not e!71873))))

(declare-fun lt!166280 () tuple2!9104)

(assert (=> d!34598 (= res!90524 (isPrefixOf!0 (_1!4809 lt!166280) (_2!4809 lt!166280)))))

(declare-fun lt!166283 () BitStream!4016)

(assert (=> d!34598 (= lt!166280 (tuple2!9105 lt!166283 (_2!4807 lt!165363)))))

(declare-fun lt!166272 () Unit!6683)

(declare-fun lt!166276 () Unit!6683)

(assert (=> d!34598 (= lt!166272 lt!166276)))

(assert (=> d!34598 (isPrefixOf!0 lt!166283 (_2!4807 lt!165363))))

(assert (=> d!34598 (= lt!166276 (lemmaIsPrefixTransitive!0 lt!166283 (_2!4807 lt!165363) (_2!4807 lt!165363)))))

(declare-fun lt!166271 () Unit!6683)

(declare-fun lt!166267 () Unit!6683)

(assert (=> d!34598 (= lt!166271 lt!166267)))

(assert (=> d!34598 (isPrefixOf!0 lt!166283 (_2!4807 lt!165363))))

(assert (=> d!34598 (= lt!166267 (lemmaIsPrefixTransitive!0 lt!166283 thiss!1305 (_2!4807 lt!165363)))))

(declare-fun lt!166279 () Unit!6683)

(declare-fun e!71874 () Unit!6683)

(assert (=> d!34598 (= lt!166279 e!71874)))

(declare-fun c!6718 () Bool)

(assert (=> d!34598 (= c!6718 (not (= (size!2271 (buf!2662 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!166277 () Unit!6683)

(declare-fun lt!166270 () Unit!6683)

(assert (=> d!34598 (= lt!166277 lt!166270)))

(assert (=> d!34598 (isPrefixOf!0 (_2!4807 lt!165363) (_2!4807 lt!165363))))

(assert (=> d!34598 (= lt!166270 (lemmaIsPrefixRefl!0 (_2!4807 lt!165363)))))

(declare-fun lt!166281 () Unit!6683)

(declare-fun lt!166265 () Unit!6683)

(assert (=> d!34598 (= lt!166281 lt!166265)))

(assert (=> d!34598 (= lt!166265 (lemmaIsPrefixRefl!0 (_2!4807 lt!165363)))))

(declare-fun lt!166275 () Unit!6683)

(declare-fun lt!166268 () Unit!6683)

(assert (=> d!34598 (= lt!166275 lt!166268)))

(assert (=> d!34598 (isPrefixOf!0 lt!166283 lt!166283)))

(assert (=> d!34598 (= lt!166268 (lemmaIsPrefixRefl!0 lt!166283))))

(declare-fun lt!166266 () Unit!6683)

(declare-fun lt!166273 () Unit!6683)

(assert (=> d!34598 (= lt!166266 lt!166273)))

(assert (=> d!34598 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34598 (= lt!166273 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34598 (= lt!166283 (BitStream!4017 (buf!2662 (_2!4807 lt!165363)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)))))

(assert (=> d!34598 (isPrefixOf!0 thiss!1305 (_2!4807 lt!165363))))

(assert (=> d!34598 (= (reader!0 thiss!1305 (_2!4807 lt!165363)) lt!166280)))

(declare-fun b!109708 () Bool)

(declare-fun lt!166269 () (_ BitVec 64))

(declare-fun lt!166282 () (_ BitVec 64))

(assert (=> b!109708 (= e!71873 (= (_1!4809 lt!166280) (withMovedBitIndex!0 (_2!4809 lt!166280) (bvsub lt!166269 lt!166282))))))

(assert (=> b!109708 (or (= (bvand lt!166269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!166282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!166269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!166269 lt!166282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109708 (= lt!166282 (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165363))) (currentByte!5198 (_2!4807 lt!165363)) (currentBit!5193 (_2!4807 lt!165363))))))

(assert (=> b!109708 (= lt!166269 (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)))))

(declare-fun b!109709 () Bool)

(declare-fun res!90523 () Bool)

(assert (=> b!109709 (=> (not res!90523) (not e!71873))))

(assert (=> b!109709 (= res!90523 (isPrefixOf!0 (_2!4809 lt!166280) (_2!4807 lt!165363)))))

(declare-fun b!109710 () Bool)

(declare-fun Unit!6707 () Unit!6683)

(assert (=> b!109710 (= e!71874 Unit!6707)))

(declare-fun b!109711 () Bool)

(declare-fun res!90525 () Bool)

(assert (=> b!109711 (=> (not res!90525) (not e!71873))))

(assert (=> b!109711 (= res!90525 (isPrefixOf!0 (_1!4809 lt!166280) thiss!1305))))

(declare-fun b!109712 () Bool)

(declare-fun lt!166274 () Unit!6683)

(assert (=> b!109712 (= e!71874 lt!166274)))

(declare-fun lt!166278 () (_ BitVec 64))

(assert (=> b!109712 (= lt!166278 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!166284 () (_ BitVec 64))

(assert (=> b!109712 (= lt!166284 (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4989 array!4989 (_ BitVec 64) (_ BitVec 64)) Unit!6683)

(assert (=> b!109712 (= lt!166274 (arrayBitRangesEqSymmetric!0 (buf!2662 thiss!1305) (buf!2662 (_2!4807 lt!165363)) lt!166278 lt!166284))))

(assert (=> b!109712 (arrayBitRangesEq!0 (buf!2662 (_2!4807 lt!165363)) (buf!2662 thiss!1305) lt!166278 lt!166284)))

(assert (= (and d!34598 c!6718) b!109712))

(assert (= (and d!34598 (not c!6718)) b!109710))

(assert (= (and d!34598 res!90524) b!109711))

(assert (= (and b!109711 res!90525) b!109709))

(assert (= (and b!109709 res!90523) b!109708))

(declare-fun m!163053 () Bool)

(assert (=> b!109711 m!163053))

(declare-fun m!163055 () Bool)

(assert (=> d!34598 m!163055))

(assert (=> d!34598 m!162411))

(declare-fun m!163057 () Bool)

(assert (=> d!34598 m!163057))

(declare-fun m!163059 () Bool)

(assert (=> d!34598 m!163059))

(declare-fun m!163061 () Bool)

(assert (=> d!34598 m!163061))

(declare-fun m!163063 () Bool)

(assert (=> d!34598 m!163063))

(declare-fun m!163065 () Bool)

(assert (=> d!34598 m!163065))

(declare-fun m!163067 () Bool)

(assert (=> d!34598 m!163067))

(declare-fun m!163069 () Bool)

(assert (=> d!34598 m!163069))

(declare-fun m!163071 () Bool)

(assert (=> d!34598 m!163071))

(declare-fun m!163073 () Bool)

(assert (=> d!34598 m!163073))

(assert (=> b!109712 m!162381))

(declare-fun m!163075 () Bool)

(assert (=> b!109712 m!163075))

(declare-fun m!163077 () Bool)

(assert (=> b!109712 m!163077))

(declare-fun m!163079 () Bool)

(assert (=> b!109708 m!163079))

(assert (=> b!109708 m!162427))

(assert (=> b!109708 m!162381))

(declare-fun m!163081 () Bool)

(assert (=> b!109709 m!163081))

(assert (=> b!109397 d!34598))

(declare-fun d!34600 () Bool)

(declare-fun e!71875 () Bool)

(assert (=> d!34600 e!71875))

(declare-fun res!90526 () Bool)

(assert (=> d!34600 (=> (not res!90526) (not e!71875))))

(declare-fun lt!166285 () (_ BitVec 64))

(declare-fun lt!166288 () (_ BitVec 64))

(declare-fun lt!166287 () (_ BitVec 64))

(assert (=> d!34600 (= res!90526 (= lt!166287 (bvsub lt!166285 lt!166288)))))

(assert (=> d!34600 (or (= (bvand lt!166285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!166288 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!166285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!166285 lt!166288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34600 (= lt!166288 (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4808 lt!165347)))) ((_ sign_extend 32) (currentByte!5198 (_1!4808 lt!165347))) ((_ sign_extend 32) (currentBit!5193 (_1!4808 lt!165347)))))))

(declare-fun lt!166290 () (_ BitVec 64))

(declare-fun lt!166286 () (_ BitVec 64))

(assert (=> d!34600 (= lt!166285 (bvmul lt!166290 lt!166286))))

(assert (=> d!34600 (or (= lt!166290 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!166286 (bvsdiv (bvmul lt!166290 lt!166286) lt!166290)))))

(assert (=> d!34600 (= lt!166286 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34600 (= lt!166290 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4808 lt!165347)))))))

(assert (=> d!34600 (= lt!166287 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5198 (_1!4808 lt!165347))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5193 (_1!4808 lt!165347)))))))

(assert (=> d!34600 (invariant!0 (currentBit!5193 (_1!4808 lt!165347)) (currentByte!5198 (_1!4808 lt!165347)) (size!2271 (buf!2662 (_1!4808 lt!165347))))))

(assert (=> d!34600 (= (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!165347))) (currentByte!5198 (_1!4808 lt!165347)) (currentBit!5193 (_1!4808 lt!165347))) lt!166287)))

(declare-fun b!109713 () Bool)

(declare-fun res!90527 () Bool)

(assert (=> b!109713 (=> (not res!90527) (not e!71875))))

(assert (=> b!109713 (= res!90527 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!166287))))

(declare-fun b!109714 () Bool)

(declare-fun lt!166289 () (_ BitVec 64))

(assert (=> b!109714 (= e!71875 (bvsle lt!166287 (bvmul lt!166289 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109714 (or (= lt!166289 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!166289 #b0000000000000000000000000000000000000000000000000000000000001000) lt!166289)))))

(assert (=> b!109714 (= lt!166289 ((_ sign_extend 32) (size!2271 (buf!2662 (_1!4808 lt!165347)))))))

(assert (= (and d!34600 res!90526) b!109713))

(assert (= (and b!109713 res!90527) b!109714))

(declare-fun m!163083 () Bool)

(assert (=> d!34600 m!163083))

(declare-fun m!163085 () Bool)

(assert (=> d!34600 m!163085))

(assert (=> b!109397 d!34600))

(declare-fun d!34602 () Bool)

(declare-datatypes ((tuple2!9118 0))(
  ( (tuple2!9119 (_1!4816 (_ BitVec 64)) (_2!4816 BitStream!4016)) )
))
(declare-fun lt!166293 () tuple2!9118)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9118)

(assert (=> d!34602 (= lt!166293 (readNLeastSignificantBitsLoop!0 (_1!4809 lt!165357) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165364))))

(assert (=> d!34602 (= (readNLeastSignificantBitsLoopPure!0 (_1!4809 lt!165357) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165364) (tuple2!9107 (_2!4816 lt!166293) (_1!4816 lt!166293)))))

(declare-fun bs!8445 () Bool)

(assert (= bs!8445 d!34602))

(declare-fun m!163087 () Bool)

(assert (=> bs!8445 m!163087))

(assert (=> b!109397 d!34602))

(declare-fun d!34604 () Bool)

(assert (=> d!34604 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165344))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165344))) lt!165362) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165344))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165344)))) lt!165362))))

(declare-fun bs!8446 () Bool)

(assert (= bs!8446 d!34604))

(declare-fun m!163089 () Bool)

(assert (=> bs!8446 m!163089))

(assert (=> b!109397 d!34604))

(declare-fun d!34606 () Bool)

(assert (=> d!34606 (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165344))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165344))) lt!165362)))

(declare-fun lt!166294 () Unit!6683)

(assert (=> d!34606 (= lt!166294 (choose!9 (_2!4807 lt!165344) (buf!2662 (_2!4807 lt!165363)) lt!165362 (BitStream!4017 (buf!2662 (_2!4807 lt!165363)) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344)))))))

(assert (=> d!34606 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4807 lt!165344) (buf!2662 (_2!4807 lt!165363)) lt!165362) lt!166294)))

(declare-fun bs!8447 () Bool)

(assert (= bs!8447 d!34606))

(assert (=> bs!8447 m!162405))

(declare-fun m!163091 () Bool)

(assert (=> bs!8447 m!163091))

(assert (=> b!109397 d!34606))

(declare-fun lt!166295 () tuple2!9118)

(declare-fun d!34608 () Bool)

(assert (=> d!34608 (= lt!166295 (readNLeastSignificantBitsLoop!0 (_1!4809 lt!165353) nBits!396 i!615 lt!165356))))

(assert (=> d!34608 (= (readNLeastSignificantBitsLoopPure!0 (_1!4809 lt!165353) nBits!396 i!615 lt!165356) (tuple2!9107 (_2!4816 lt!166295) (_1!4816 lt!166295)))))

(declare-fun bs!8448 () Bool)

(assert (= bs!8448 d!34608))

(declare-fun m!163093 () Bool)

(assert (=> bs!8448 m!163093))

(assert (=> b!109397 d!34608))

(declare-fun d!34610 () Bool)

(declare-fun lt!166296 () tuple2!9116)

(assert (=> d!34610 (= lt!166296 (readBit!0 (_1!4809 lt!165353)))))

(assert (=> d!34610 (= (readBitPure!0 (_1!4809 lt!165353)) (tuple2!9103 (_2!4815 lt!166296) (_1!4815 lt!166296)))))

(declare-fun bs!8449 () Bool)

(assert (= bs!8449 d!34610))

(declare-fun m!163095 () Bool)

(assert (=> bs!8449 m!163095))

(assert (=> b!109397 d!34610))

(declare-fun d!34612 () Bool)

(declare-fun e!71878 () Bool)

(assert (=> d!34612 e!71878))

(declare-fun res!90530 () Bool)

(assert (=> d!34612 (=> (not res!90530) (not e!71878))))

(declare-fun lt!166308 () tuple2!9102)

(declare-fun lt!166306 () tuple2!9102)

(assert (=> d!34612 (= res!90530 (= (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!166308))) (currentByte!5198 (_1!4808 lt!166308)) (currentBit!5193 (_1!4808 lt!166308))) (bitIndex!0 (size!2271 (buf!2662 (_1!4808 lt!166306))) (currentByte!5198 (_1!4808 lt!166306)) (currentBit!5193 (_1!4808 lt!166306)))))))

(declare-fun lt!166307 () Unit!6683)

(declare-fun lt!166305 () BitStream!4016)

(declare-fun choose!50 (BitStream!4016 BitStream!4016 BitStream!4016 tuple2!9102 tuple2!9102 BitStream!4016 Bool tuple2!9102 tuple2!9102 BitStream!4016 Bool) Unit!6683)

(assert (=> d!34612 (= lt!166307 (choose!50 lt!165355 (_2!4807 lt!165363) lt!166305 lt!166308 (tuple2!9103 (_1!4808 lt!166308) (_2!4808 lt!166308)) (_1!4808 lt!166308) (_2!4808 lt!166308) lt!166306 (tuple2!9103 (_1!4808 lt!166306) (_2!4808 lt!166306)) (_1!4808 lt!166306) (_2!4808 lt!166306)))))

(assert (=> d!34612 (= lt!166306 (readBitPure!0 lt!166305))))

(assert (=> d!34612 (= lt!166308 (readBitPure!0 lt!165355))))

(assert (=> d!34612 (= lt!166305 (BitStream!4017 (buf!2662 (_2!4807 lt!165363)) (currentByte!5198 lt!165355) (currentBit!5193 lt!165355)))))

(assert (=> d!34612 (invariant!0 (currentBit!5193 lt!165355) (currentByte!5198 lt!165355) (size!2271 (buf!2662 (_2!4807 lt!165363))))))

(assert (=> d!34612 (= (readBitPrefixLemma!0 lt!165355 (_2!4807 lt!165363)) lt!166307)))

(declare-fun b!109717 () Bool)

(assert (=> b!109717 (= e!71878 (= (_2!4808 lt!166308) (_2!4808 lt!166306)))))

(assert (= (and d!34612 res!90530) b!109717))

(declare-fun m!163097 () Bool)

(assert (=> d!34612 m!163097))

(declare-fun m!163099 () Bool)

(assert (=> d!34612 m!163099))

(declare-fun m!163101 () Bool)

(assert (=> d!34612 m!163101))

(declare-fun m!163103 () Bool)

(assert (=> d!34612 m!163103))

(declare-fun m!163105 () Bool)

(assert (=> d!34612 m!163105))

(assert (=> d!34612 m!162401))

(assert (=> b!109397 d!34612))

(declare-fun d!34614 () Bool)

(declare-fun res!90533 () Bool)

(declare-fun e!71880 () Bool)

(assert (=> d!34614 (=> (not res!90533) (not e!71880))))

(assert (=> d!34614 (= res!90533 (= (size!2271 (buf!2662 thiss!1305)) (size!2271 (buf!2662 (_2!4807 lt!165363)))))))

(assert (=> d!34614 (= (isPrefixOf!0 thiss!1305 (_2!4807 lt!165363)) e!71880)))

(declare-fun b!109718 () Bool)

(declare-fun res!90532 () Bool)

(assert (=> b!109718 (=> (not res!90532) (not e!71880))))

(assert (=> b!109718 (= res!90532 (bvsle (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)) (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165363))) (currentByte!5198 (_2!4807 lt!165363)) (currentBit!5193 (_2!4807 lt!165363)))))))

(declare-fun b!109719 () Bool)

(declare-fun e!71879 () Bool)

(assert (=> b!109719 (= e!71880 e!71879)))

(declare-fun res!90531 () Bool)

(assert (=> b!109719 (=> res!90531 e!71879)))

(assert (=> b!109719 (= res!90531 (= (size!2271 (buf!2662 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!109720 () Bool)

(assert (=> b!109720 (= e!71879 (arrayBitRangesEq!0 (buf!2662 thiss!1305) (buf!2662 (_2!4807 lt!165363)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2271 (buf!2662 thiss!1305)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305))))))

(assert (= (and d!34614 res!90533) b!109718))

(assert (= (and b!109718 res!90532) b!109719))

(assert (= (and b!109719 (not res!90531)) b!109720))

(assert (=> b!109718 m!162381))

(assert (=> b!109718 m!162427))

(assert (=> b!109720 m!162381))

(assert (=> b!109720 m!162381))

(declare-fun m!163107 () Bool)

(assert (=> b!109720 m!163107))

(assert (=> b!109397 d!34614))

(declare-fun d!34616 () Bool)

(declare-fun e!71881 () Bool)

(assert (=> d!34616 e!71881))

(declare-fun res!90535 () Bool)

(assert (=> d!34616 (=> (not res!90535) (not e!71881))))

(declare-fun lt!166324 () tuple2!9104)

(assert (=> d!34616 (= res!90535 (isPrefixOf!0 (_1!4809 lt!166324) (_2!4809 lt!166324)))))

(declare-fun lt!166327 () BitStream!4016)

(assert (=> d!34616 (= lt!166324 (tuple2!9105 lt!166327 (_2!4807 lt!165363)))))

(declare-fun lt!166316 () Unit!6683)

(declare-fun lt!166320 () Unit!6683)

(assert (=> d!34616 (= lt!166316 lt!166320)))

(assert (=> d!34616 (isPrefixOf!0 lt!166327 (_2!4807 lt!165363))))

(assert (=> d!34616 (= lt!166320 (lemmaIsPrefixTransitive!0 lt!166327 (_2!4807 lt!165363) (_2!4807 lt!165363)))))

(declare-fun lt!166315 () Unit!6683)

(declare-fun lt!166311 () Unit!6683)

(assert (=> d!34616 (= lt!166315 lt!166311)))

(assert (=> d!34616 (isPrefixOf!0 lt!166327 (_2!4807 lt!165363))))

(assert (=> d!34616 (= lt!166311 (lemmaIsPrefixTransitive!0 lt!166327 (_2!4807 lt!165344) (_2!4807 lt!165363)))))

(declare-fun lt!166323 () Unit!6683)

(declare-fun e!71882 () Unit!6683)

(assert (=> d!34616 (= lt!166323 e!71882)))

(declare-fun c!6719 () Bool)

(assert (=> d!34616 (= c!6719 (not (= (size!2271 (buf!2662 (_2!4807 lt!165344))) #b00000000000000000000000000000000)))))

(declare-fun lt!166321 () Unit!6683)

(declare-fun lt!166314 () Unit!6683)

(assert (=> d!34616 (= lt!166321 lt!166314)))

(assert (=> d!34616 (isPrefixOf!0 (_2!4807 lt!165363) (_2!4807 lt!165363))))

(assert (=> d!34616 (= lt!166314 (lemmaIsPrefixRefl!0 (_2!4807 lt!165363)))))

(declare-fun lt!166325 () Unit!6683)

(declare-fun lt!166309 () Unit!6683)

(assert (=> d!34616 (= lt!166325 lt!166309)))

(assert (=> d!34616 (= lt!166309 (lemmaIsPrefixRefl!0 (_2!4807 lt!165363)))))

(declare-fun lt!166319 () Unit!6683)

(declare-fun lt!166312 () Unit!6683)

(assert (=> d!34616 (= lt!166319 lt!166312)))

(assert (=> d!34616 (isPrefixOf!0 lt!166327 lt!166327)))

(assert (=> d!34616 (= lt!166312 (lemmaIsPrefixRefl!0 lt!166327))))

(declare-fun lt!166310 () Unit!6683)

(declare-fun lt!166317 () Unit!6683)

(assert (=> d!34616 (= lt!166310 lt!166317)))

(assert (=> d!34616 (isPrefixOf!0 (_2!4807 lt!165344) (_2!4807 lt!165344))))

(assert (=> d!34616 (= lt!166317 (lemmaIsPrefixRefl!0 (_2!4807 lt!165344)))))

(assert (=> d!34616 (= lt!166327 (BitStream!4017 (buf!2662 (_2!4807 lt!165363)) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))))))

(assert (=> d!34616 (isPrefixOf!0 (_2!4807 lt!165344) (_2!4807 lt!165363))))

(assert (=> d!34616 (= (reader!0 (_2!4807 lt!165344) (_2!4807 lt!165363)) lt!166324)))

(declare-fun lt!166313 () (_ BitVec 64))

(declare-fun lt!166326 () (_ BitVec 64))

(declare-fun b!109721 () Bool)

(assert (=> b!109721 (= e!71881 (= (_1!4809 lt!166324) (withMovedBitIndex!0 (_2!4809 lt!166324) (bvsub lt!166313 lt!166326))))))

(assert (=> b!109721 (or (= (bvand lt!166313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!166326 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!166313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!166313 lt!166326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109721 (= lt!166326 (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165363))) (currentByte!5198 (_2!4807 lt!165363)) (currentBit!5193 (_2!4807 lt!165363))))))

(assert (=> b!109721 (= lt!166313 (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))))))

(declare-fun b!109722 () Bool)

(declare-fun res!90534 () Bool)

(assert (=> b!109722 (=> (not res!90534) (not e!71881))))

(assert (=> b!109722 (= res!90534 (isPrefixOf!0 (_2!4809 lt!166324) (_2!4807 lt!165363)))))

(declare-fun b!109723 () Bool)

(declare-fun Unit!6708 () Unit!6683)

(assert (=> b!109723 (= e!71882 Unit!6708)))

(declare-fun b!109724 () Bool)

(declare-fun res!90536 () Bool)

(assert (=> b!109724 (=> (not res!90536) (not e!71881))))

(assert (=> b!109724 (= res!90536 (isPrefixOf!0 (_1!4809 lt!166324) (_2!4807 lt!165344)))))

(declare-fun b!109725 () Bool)

(declare-fun lt!166318 () Unit!6683)

(assert (=> b!109725 (= e!71882 lt!166318)))

(declare-fun lt!166322 () (_ BitVec 64))

(assert (=> b!109725 (= lt!166322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!166328 () (_ BitVec 64))

(assert (=> b!109725 (= lt!166328 (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165344))) (currentByte!5198 (_2!4807 lt!165344)) (currentBit!5193 (_2!4807 lt!165344))))))

(assert (=> b!109725 (= lt!166318 (arrayBitRangesEqSymmetric!0 (buf!2662 (_2!4807 lt!165344)) (buf!2662 (_2!4807 lt!165363)) lt!166322 lt!166328))))

(assert (=> b!109725 (arrayBitRangesEq!0 (buf!2662 (_2!4807 lt!165363)) (buf!2662 (_2!4807 lt!165344)) lt!166322 lt!166328)))

(assert (= (and d!34616 c!6719) b!109725))

(assert (= (and d!34616 (not c!6719)) b!109723))

(assert (= (and d!34616 res!90535) b!109724))

(assert (= (and b!109724 res!90536) b!109722))

(assert (= (and b!109722 res!90534) b!109721))

(declare-fun m!163109 () Bool)

(assert (=> b!109724 m!163109))

(declare-fun m!163111 () Bool)

(assert (=> d!34616 m!163111))

(declare-fun m!163113 () Bool)

(assert (=> d!34616 m!163113))

(declare-fun m!163115 () Bool)

(assert (=> d!34616 m!163115))

(declare-fun m!163117 () Bool)

(assert (=> d!34616 m!163117))

(declare-fun m!163119 () Bool)

(assert (=> d!34616 m!163119))

(assert (=> d!34616 m!163063))

(declare-fun m!163121 () Bool)

(assert (=> d!34616 m!163121))

(declare-fun m!163123 () Bool)

(assert (=> d!34616 m!163123))

(assert (=> d!34616 m!163069))

(declare-fun m!163125 () Bool)

(assert (=> d!34616 m!163125))

(declare-fun m!163127 () Bool)

(assert (=> d!34616 m!163127))

(assert (=> b!109725 m!162379))

(declare-fun m!163129 () Bool)

(assert (=> b!109725 m!163129))

(declare-fun m!163131 () Bool)

(assert (=> b!109725 m!163131))

(declare-fun m!163133 () Bool)

(assert (=> b!109721 m!163133))

(assert (=> b!109721 m!162427))

(assert (=> b!109721 m!162379))

(declare-fun m!163135 () Bool)

(assert (=> b!109722 m!163135))

(assert (=> b!109397 d!34616))

(declare-fun d!34618 () Bool)

(assert (=> d!34618 (isPrefixOf!0 thiss!1305 (_2!4807 lt!165363))))

(declare-fun lt!166331 () Unit!6683)

(declare-fun choose!30 (BitStream!4016 BitStream!4016 BitStream!4016) Unit!6683)

(assert (=> d!34618 (= lt!166331 (choose!30 thiss!1305 (_2!4807 lt!165344) (_2!4807 lt!165363)))))

(assert (=> d!34618 (isPrefixOf!0 thiss!1305 (_2!4807 lt!165344))))

(assert (=> d!34618 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4807 lt!165344) (_2!4807 lt!165363)) lt!166331)))

(declare-fun bs!8450 () Bool)

(assert (= bs!8450 d!34618))

(assert (=> bs!8450 m!162411))

(declare-fun m!163137 () Bool)

(assert (=> bs!8450 m!163137))

(assert (=> bs!8450 m!162423))

(assert (=> b!109397 d!34618))

(declare-fun d!34620 () Bool)

(assert (=> d!34620 (= (array_inv!2073 (buf!2662 thiss!1305)) (bvsge (size!2271 (buf!2662 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!109401 d!34620))

(declare-fun d!34622 () Bool)

(assert (=> d!34622 (= (invariant!0 (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305) (size!2271 (buf!2662 (_2!4807 lt!165363)))) (and (bvsge (currentBit!5193 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5193 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5198 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5198 thiss!1305) (size!2271 (buf!2662 (_2!4807 lt!165363)))) (and (= (currentBit!5193 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5198 thiss!1305) (size!2271 (buf!2662 (_2!4807 lt!165363))))))))))

(assert (=> b!109399 d!34622))

(declare-fun d!34624 () Bool)

(assert (=> d!34624 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2271 (buf!2662 thiss!1305))) ((_ sign_extend 32) (currentByte!5198 thiss!1305)) ((_ sign_extend 32) (currentBit!5193 thiss!1305)) lt!165342) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 thiss!1305))) ((_ sign_extend 32) (currentByte!5198 thiss!1305)) ((_ sign_extend 32) (currentBit!5193 thiss!1305))) lt!165342))))

(declare-fun bs!8451 () Bool)

(assert (= bs!8451 d!34624))

(assert (=> bs!8451 m!162621))

(assert (=> b!109400 d!34624))

(declare-fun d!34626 () Bool)

(assert (=> d!34626 (= (invariant!0 (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305) (size!2271 (buf!2662 (_2!4807 lt!165344)))) (and (bvsge (currentBit!5193 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5193 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5198 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5198 thiss!1305) (size!2271 (buf!2662 (_2!4807 lt!165344)))) (and (= (currentBit!5193 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5198 thiss!1305) (size!2271 (buf!2662 (_2!4807 lt!165344))))))))))

(assert (=> b!109393 d!34626))

(declare-fun d!34628 () Bool)

(declare-fun lt!166332 () tuple2!9116)

(assert (=> d!34628 (= lt!166332 (readBit!0 (readerFrom!0 (_2!4807 lt!165344) (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305))))))

(assert (=> d!34628 (= (readBitPure!0 (readerFrom!0 (_2!4807 lt!165344) (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305))) (tuple2!9103 (_2!4815 lt!166332) (_1!4815 lt!166332)))))

(declare-fun bs!8452 () Bool)

(assert (= bs!8452 d!34628))

(assert (=> bs!8452 m!162373))

(declare-fun m!163139 () Bool)

(assert (=> bs!8452 m!163139))

(assert (=> b!109391 d!34628))

(declare-fun d!34630 () Bool)

(declare-fun e!71885 () Bool)

(assert (=> d!34630 e!71885))

(declare-fun res!90540 () Bool)

(assert (=> d!34630 (=> (not res!90540) (not e!71885))))

(assert (=> d!34630 (= res!90540 (invariant!0 (currentBit!5193 (_2!4807 lt!165344)) (currentByte!5198 (_2!4807 lt!165344)) (size!2271 (buf!2662 (_2!4807 lt!165344)))))))

(assert (=> d!34630 (= (readerFrom!0 (_2!4807 lt!165344) (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305)) (BitStream!4017 (buf!2662 (_2!4807 lt!165344)) (currentByte!5198 thiss!1305) (currentBit!5193 thiss!1305)))))

(declare-fun b!109728 () Bool)

(assert (=> b!109728 (= e!71885 (invariant!0 (currentBit!5193 thiss!1305) (currentByte!5198 thiss!1305) (size!2271 (buf!2662 (_2!4807 lt!165344)))))))

(assert (= (and d!34630 res!90540) b!109728))

(assert (=> d!34630 m!162619))

(assert (=> b!109728 m!162361))

(assert (=> b!109391 d!34630))

(declare-fun d!34632 () Bool)

(declare-fun e!71886 () Bool)

(assert (=> d!34632 e!71886))

(declare-fun res!90541 () Bool)

(assert (=> d!34632 (=> (not res!90541) (not e!71886))))

(declare-fun lt!166335 () (_ BitVec 64))

(declare-fun lt!166333 () (_ BitVec 64))

(declare-fun lt!166336 () (_ BitVec 64))

(assert (=> d!34632 (= res!90541 (= lt!166335 (bvsub lt!166333 lt!166336)))))

(assert (=> d!34632 (or (= (bvand lt!166333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!166336 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!166333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!166333 lt!166336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34632 (= lt!166336 (remainingBits!0 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))) ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165363))) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165363)))))))

(declare-fun lt!166338 () (_ BitVec 64))

(declare-fun lt!166334 () (_ BitVec 64))

(assert (=> d!34632 (= lt!166333 (bvmul lt!166338 lt!166334))))

(assert (=> d!34632 (or (= lt!166338 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!166334 (bvsdiv (bvmul lt!166338 lt!166334) lt!166338)))))

(assert (=> d!34632 (= lt!166334 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34632 (= lt!166338 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))))))

(assert (=> d!34632 (= lt!166335 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5198 (_2!4807 lt!165363))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5193 (_2!4807 lt!165363)))))))

(assert (=> d!34632 (invariant!0 (currentBit!5193 (_2!4807 lt!165363)) (currentByte!5198 (_2!4807 lt!165363)) (size!2271 (buf!2662 (_2!4807 lt!165363))))))

(assert (=> d!34632 (= (bitIndex!0 (size!2271 (buf!2662 (_2!4807 lt!165363))) (currentByte!5198 (_2!4807 lt!165363)) (currentBit!5193 (_2!4807 lt!165363))) lt!166335)))

(declare-fun b!109729 () Bool)

(declare-fun res!90542 () Bool)

(assert (=> b!109729 (=> (not res!90542) (not e!71886))))

(assert (=> b!109729 (= res!90542 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!166335))))

(declare-fun b!109730 () Bool)

(declare-fun lt!166337 () (_ BitVec 64))

(assert (=> b!109730 (= e!71886 (bvsle lt!166335 (bvmul lt!166337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109730 (or (= lt!166337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!166337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!166337)))))

(assert (=> b!109730 (= lt!166337 ((_ sign_extend 32) (size!2271 (buf!2662 (_2!4807 lt!165363)))))))

(assert (= (and d!34632 res!90541) b!109729))

(assert (= (and b!109729 res!90542) b!109730))

(declare-fun m!163141 () Bool)

(assert (=> d!34632 m!163141))

(declare-fun m!163143 () Bool)

(assert (=> d!34632 m!163143))

(assert (=> b!109402 d!34632))

(declare-fun d!34634 () Bool)

(declare-fun e!71889 () Bool)

(assert (=> d!34634 e!71889))

(declare-fun res!90545 () Bool)

(assert (=> d!34634 (=> (not res!90545) (not e!71889))))

(declare-fun lt!166344 () (_ BitVec 64))

(declare-fun lt!166343 () BitStream!4016)

(assert (=> d!34634 (= res!90545 (= (bvadd lt!166344 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2271 (buf!2662 lt!166343)) (currentByte!5198 lt!166343) (currentBit!5193 lt!166343))))))

(assert (=> d!34634 (or (not (= (bvand lt!166344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!166344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!166344 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34634 (= lt!166344 (bitIndex!0 (size!2271 (buf!2662 (_1!4809 lt!165353))) (currentByte!5198 (_1!4809 lt!165353)) (currentBit!5193 (_1!4809 lt!165353))))))

(declare-fun moveBitIndex!0 (BitStream!4016 (_ BitVec 64)) tuple2!9100)

(assert (=> d!34634 (= lt!166343 (_2!4807 (moveBitIndex!0 (_1!4809 lt!165353) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4016 (_ BitVec 64)) Bool)

(assert (=> d!34634 (moveBitIndexPrecond!0 (_1!4809 lt!165353) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!34634 (= (withMovedBitIndex!0 (_1!4809 lt!165353) #b0000000000000000000000000000000000000000000000000000000000000001) lt!166343)))

(declare-fun b!109733 () Bool)

(assert (=> b!109733 (= e!71889 (= (size!2271 (buf!2662 (_1!4809 lt!165353))) (size!2271 (buf!2662 lt!166343))))))

(assert (= (and d!34634 res!90545) b!109733))

(declare-fun m!163145 () Bool)

(assert (=> d!34634 m!163145))

(declare-fun m!163147 () Bool)

(assert (=> d!34634 m!163147))

(declare-fun m!163149 () Bool)

(assert (=> d!34634 m!163149))

(declare-fun m!163151 () Bool)

(assert (=> d!34634 m!163151))

(assert (=> b!109402 d!34634))

(declare-fun lt!166345 () tuple2!9118)

(declare-fun d!34636 () Bool)

(assert (=> d!34636 (= lt!166345 (readNLeastSignificantBitsLoop!0 lt!165346 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165364))))

(assert (=> d!34636 (= (readNLeastSignificantBitsLoopPure!0 lt!165346 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165364) (tuple2!9107 (_2!4816 lt!166345) (_1!4816 lt!166345)))))

(declare-fun bs!8453 () Bool)

(assert (= bs!8453 d!34636))

(declare-fun m!163153 () Bool)

(assert (=> bs!8453 m!163153))

(assert (=> b!109402 d!34636))

(declare-fun d!34638 () Bool)

(declare-fun e!71890 () Bool)

(assert (=> d!34638 e!71890))

(declare-fun res!90546 () Bool)

(assert (=> d!34638 (=> (not res!90546) (not e!71890))))

(declare-fun lt!166347 () (_ BitVec 64))

(declare-fun lt!166346 () BitStream!4016)

(assert (=> d!34638 (= res!90546 (= (bvadd lt!166347 (bvsub lt!165367 lt!165354)) (bitIndex!0 (size!2271 (buf!2662 lt!166346)) (currentByte!5198 lt!166346) (currentBit!5193 lt!166346))))))

(assert (=> d!34638 (or (not (= (bvand lt!166347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165367 lt!165354) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!166347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!166347 (bvsub lt!165367 lt!165354)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34638 (= lt!166347 (bitIndex!0 (size!2271 (buf!2662 (_2!4809 lt!165357))) (currentByte!5198 (_2!4809 lt!165357)) (currentBit!5193 (_2!4809 lt!165357))))))

(assert (=> d!34638 (= lt!166346 (_2!4807 (moveBitIndex!0 (_2!4809 lt!165357) (bvsub lt!165367 lt!165354))))))

(assert (=> d!34638 (moveBitIndexPrecond!0 (_2!4809 lt!165357) (bvsub lt!165367 lt!165354))))

(assert (=> d!34638 (= (withMovedBitIndex!0 (_2!4809 lt!165357) (bvsub lt!165367 lt!165354)) lt!166346)))

(declare-fun b!109734 () Bool)

(assert (=> b!109734 (= e!71890 (= (size!2271 (buf!2662 (_2!4809 lt!165357))) (size!2271 (buf!2662 lt!166346))))))

(assert (= (and d!34638 res!90546) b!109734))

(declare-fun m!163155 () Bool)

(assert (=> d!34638 m!163155))

(declare-fun m!163157 () Bool)

(assert (=> d!34638 m!163157))

(declare-fun m!163159 () Bool)

(assert (=> d!34638 m!163159))

(declare-fun m!163161 () Bool)

(assert (=> d!34638 m!163161))

(assert (=> b!109402 d!34638))

(declare-fun d!34640 () Bool)

(declare-fun e!71891 () Bool)

(assert (=> d!34640 e!71891))

(declare-fun res!90547 () Bool)

(assert (=> d!34640 (=> (not res!90547) (not e!71891))))

(declare-fun lt!166348 () BitStream!4016)

(declare-fun lt!166349 () (_ BitVec 64))

(assert (=> d!34640 (= res!90547 (= (bvadd lt!166349 (bvsub lt!165340 lt!165354)) (bitIndex!0 (size!2271 (buf!2662 lt!166348)) (currentByte!5198 lt!166348) (currentBit!5193 lt!166348))))))

(assert (=> d!34640 (or (not (= (bvand lt!166349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165340 lt!165354) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!166349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!166349 (bvsub lt!165340 lt!165354)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34640 (= lt!166349 (bitIndex!0 (size!2271 (buf!2662 (_2!4809 lt!165353))) (currentByte!5198 (_2!4809 lt!165353)) (currentBit!5193 (_2!4809 lt!165353))))))

(assert (=> d!34640 (= lt!166348 (_2!4807 (moveBitIndex!0 (_2!4809 lt!165353) (bvsub lt!165340 lt!165354))))))

(assert (=> d!34640 (moveBitIndexPrecond!0 (_2!4809 lt!165353) (bvsub lt!165340 lt!165354))))

(assert (=> d!34640 (= (withMovedBitIndex!0 (_2!4809 lt!165353) (bvsub lt!165340 lt!165354)) lt!166348)))

(declare-fun b!109735 () Bool)

(assert (=> b!109735 (= e!71891 (= (size!2271 (buf!2662 (_2!4809 lt!165353))) (size!2271 (buf!2662 lt!166348))))))

(assert (= (and d!34640 res!90547) b!109735))

(declare-fun m!163163 () Bool)

(assert (=> d!34640 m!163163))

(declare-fun m!163165 () Bool)

(assert (=> d!34640 m!163165))

(declare-fun m!163167 () Bool)

(assert (=> d!34640 m!163167))

(declare-fun m!163169 () Bool)

(assert (=> d!34640 m!163169))

(assert (=> b!109402 d!34640))

(assert (=> b!109402 d!34516))

(declare-fun d!34642 () Bool)

(declare-fun lt!166362 () tuple2!9106)

(declare-fun lt!166366 () tuple2!9106)

(assert (=> d!34642 (and (= (_2!4810 lt!166362) (_2!4810 lt!166366)) (= (_1!4810 lt!166362) (_1!4810 lt!166366)))))

(declare-fun lt!166365 () Bool)

(declare-fun lt!166363 () (_ BitVec 64))

(declare-fun lt!166367 () Unit!6683)

(declare-fun lt!166364 () BitStream!4016)

(declare-fun choose!45 (BitStream!4016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9106 tuple2!9106 BitStream!4016 (_ BitVec 64) Bool BitStream!4016 (_ BitVec 64) tuple2!9106 tuple2!9106 BitStream!4016 (_ BitVec 64)) Unit!6683)

(assert (=> d!34642 (= lt!166367 (choose!45 (_1!4809 lt!165353) nBits!396 i!615 lt!165356 lt!166362 (tuple2!9107 (_1!4810 lt!166362) (_2!4810 lt!166362)) (_1!4810 lt!166362) (_2!4810 lt!166362) lt!166365 lt!166364 lt!166363 lt!166366 (tuple2!9107 (_1!4810 lt!166366) (_2!4810 lt!166366)) (_1!4810 lt!166366) (_2!4810 lt!166366)))))

(assert (=> d!34642 (= lt!166366 (readNLeastSignificantBitsLoopPure!0 lt!166364 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!166363))))

(assert (=> d!34642 (= lt!166363 (bvor lt!165356 (ite lt!166365 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34642 (= lt!166364 (withMovedBitIndex!0 (_1!4809 lt!165353) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!34642 (= lt!166365 (_2!4808 (readBitPure!0 (_1!4809 lt!165353))))))

(assert (=> d!34642 (= lt!166362 (readNLeastSignificantBitsLoopPure!0 (_1!4809 lt!165353) nBits!396 i!615 lt!165356))))

(assert (=> d!34642 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4809 lt!165353) nBits!396 i!615 lt!165356) lt!166367)))

(declare-fun bs!8455 () Bool)

(assert (= bs!8455 d!34642))

(assert (=> bs!8455 m!162385))

(declare-fun m!163171 () Bool)

(assert (=> bs!8455 m!163171))

(declare-fun m!163173 () Bool)

(assert (=> bs!8455 m!163173))

(assert (=> bs!8455 m!162431))

(assert (=> bs!8455 m!162413))

(assert (=> b!109402 d!34642))

(assert (=> b!109402 d!34514))

(push 1)

(assert (not b!109514))

(assert (not b!109673))

(assert (not d!34640))

(assert (not d!34604))

(assert (not d!34628))

(assert (not d!34610))

(assert (not d!34516))

(assert (not d!34618))

(assert (not b!109679))

(assert (not d!34606))

(assert (not d!34510))

(assert (not b!109515))

(assert (not b!109501))

(assert (not b!109712))

(assert (not b!109680))

(assert (not d!34524))

(assert (not b!109722))

(assert (not b!109683))

(assert (not d!34638))

(assert (not b!109516))

(assert (not d!34522))

(assert (not d!34612))

(assert (not d!34608))

(assert (not d!34514))

(assert (not d!34624))

(assert (not d!34636))

(assert (not d!34630))

(assert (not b!109718))

(assert (not b!109709))

(assert (not d!34594))

(assert (not b!109721))

(assert (not b!109672))

(assert (not b!109708))

(assert (not d!34642))

(assert (not b!109725))

(assert (not d!34592))

(assert (not d!34616))

(assert (not b!109720))

(assert (not d!34634))

(assert (not b!109499))

(assert (not d!34632))

(assert (not b!109724))

(assert (not bm!1383))

(assert (not d!34598))

(assert (not b!109513))

(assert (not d!34600))

(assert (not d!34526))

(assert (not d!34506))

(assert (not b!109677))

(assert (not b!109684))

(assert (not b!109711))

(assert (not d!34508))

(assert (not d!34528))

(assert (not b!109674))

(assert (not d!34602))

(assert (not b!109682))

(assert (not b!109728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

