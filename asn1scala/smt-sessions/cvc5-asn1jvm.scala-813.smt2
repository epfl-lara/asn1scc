; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24032 () Bool)

(assert start!24032)

(declare-fun b!121527 () Bool)

(declare-fun e!79584 () Bool)

(declare-fun e!79593 () Bool)

(assert (=> b!121527 (= e!79584 e!79593)))

(declare-fun res!100662 () Bool)

(assert (=> b!121527 (=> (not res!100662) (not e!79593))))

(declare-datatypes ((array!5387 0))(
  ( (array!5388 (arr!3030 (Array (_ BitVec 32) (_ BitVec 8))) (size!2437 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4348 0))(
  ( (BitStream!4349 (buf!2874 array!5387) (currentByte!5565 (_ BitVec 32)) (currentBit!5560 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4348)

(declare-fun lt!190395 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121527 (= res!100662 (validate_offset_bits!1 ((_ sign_extend 32) (size!2437 (buf!2874 thiss!1305))) ((_ sign_extend 32) (currentByte!5565 thiss!1305)) ((_ sign_extend 32) (currentBit!5560 thiss!1305)) lt!190395))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!121527 (= lt!190395 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!121528 () Bool)

(declare-fun e!79589 () Bool)

(assert (=> b!121528 (= e!79593 (not e!79589))))

(declare-fun res!100652 () Bool)

(assert (=> b!121528 (=> res!100652 e!79589)))

(declare-datatypes ((tuple2!10204 0))(
  ( (tuple2!10205 (_1!5367 BitStream!4348) (_2!5367 (_ BitVec 64))) )
))
(declare-fun lt!190387 () tuple2!10204)

(declare-datatypes ((tuple2!10206 0))(
  ( (tuple2!10207 (_1!5368 BitStream!4348) (_2!5368 BitStream!4348)) )
))
(declare-fun lt!190386 () tuple2!10206)

(assert (=> b!121528 (= res!100652 (not (= (_1!5367 lt!190387) (_2!5368 lt!190386))))))

(declare-fun lt!190392 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10204)

(assert (=> b!121528 (= lt!190387 (readNLeastSignificantBitsLoopPure!0 (_1!5368 lt!190386) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190392))))

(declare-datatypes ((Unit!7489 0))(
  ( (Unit!7490) )
))
(declare-datatypes ((tuple2!10208 0))(
  ( (tuple2!10209 (_1!5369 Unit!7489) (_2!5369 BitStream!4348)) )
))
(declare-fun lt!190396 () tuple2!10208)

(declare-fun lt!190382 () tuple2!10208)

(declare-fun lt!190403 () (_ BitVec 64))

(assert (=> b!121528 (validate_offset_bits!1 ((_ sign_extend 32) (size!2437 (buf!2874 (_2!5369 lt!190396)))) ((_ sign_extend 32) (currentByte!5565 (_2!5369 lt!190382))) ((_ sign_extend 32) (currentBit!5560 (_2!5369 lt!190382))) lt!190403)))

(declare-fun lt!190391 () Unit!7489)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4348 array!5387 (_ BitVec 64)) Unit!7489)

(assert (=> b!121528 (= lt!190391 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5369 lt!190382) (buf!2874 (_2!5369 lt!190396)) lt!190403))))

(assert (=> b!121528 (= lt!190403 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10210 0))(
  ( (tuple2!10211 (_1!5370 BitStream!4348) (_2!5370 Bool)) )
))
(declare-fun lt!190383 () tuple2!10210)

(declare-fun lt!190397 () (_ BitVec 64))

(declare-fun lt!190402 () (_ BitVec 64))

(assert (=> b!121528 (= lt!190392 (bvor lt!190397 (ite (_2!5370 lt!190383) lt!190402 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!190388 () tuple2!10206)

(declare-fun lt!190384 () tuple2!10204)

(assert (=> b!121528 (= lt!190384 (readNLeastSignificantBitsLoopPure!0 (_1!5368 lt!190388) nBits!396 i!615 lt!190397))))

(assert (=> b!121528 (validate_offset_bits!1 ((_ sign_extend 32) (size!2437 (buf!2874 (_2!5369 lt!190396)))) ((_ sign_extend 32) (currentByte!5565 thiss!1305)) ((_ sign_extend 32) (currentBit!5560 thiss!1305)) lt!190395)))

(declare-fun lt!190398 () Unit!7489)

(assert (=> b!121528 (= lt!190398 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2874 (_2!5369 lt!190396)) lt!190395))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121528 (= lt!190397 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!190401 () Bool)

(assert (=> b!121528 (= (_2!5370 lt!190383) lt!190401)))

(declare-fun readBitPure!0 (BitStream!4348) tuple2!10210)

(assert (=> b!121528 (= lt!190383 (readBitPure!0 (_1!5368 lt!190388)))))

(declare-fun reader!0 (BitStream!4348 BitStream!4348) tuple2!10206)

(assert (=> b!121528 (= lt!190386 (reader!0 (_2!5369 lt!190382) (_2!5369 lt!190396)))))

(assert (=> b!121528 (= lt!190388 (reader!0 thiss!1305 (_2!5369 lt!190396)))))

(declare-fun e!79588 () Bool)

(assert (=> b!121528 e!79588))

(declare-fun res!100656 () Bool)

(assert (=> b!121528 (=> (not res!100656) (not e!79588))))

(declare-fun lt!190400 () tuple2!10210)

(declare-fun lt!190393 () tuple2!10210)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121528 (= res!100656 (= (bitIndex!0 (size!2437 (buf!2874 (_1!5370 lt!190400))) (currentByte!5565 (_1!5370 lt!190400)) (currentBit!5560 (_1!5370 lt!190400))) (bitIndex!0 (size!2437 (buf!2874 (_1!5370 lt!190393))) (currentByte!5565 (_1!5370 lt!190393)) (currentBit!5560 (_1!5370 lt!190393)))))))

(declare-fun lt!190408 () Unit!7489)

(declare-fun lt!190410 () BitStream!4348)

(declare-fun readBitPrefixLemma!0 (BitStream!4348 BitStream!4348) Unit!7489)

(assert (=> b!121528 (= lt!190408 (readBitPrefixLemma!0 lt!190410 (_2!5369 lt!190396)))))

(assert (=> b!121528 (= lt!190393 (readBitPure!0 (BitStream!4349 (buf!2874 (_2!5369 lt!190396)) (currentByte!5565 thiss!1305) (currentBit!5560 thiss!1305))))))

(assert (=> b!121528 (= lt!190400 (readBitPure!0 lt!190410))))

(assert (=> b!121528 (= lt!190410 (BitStream!4349 (buf!2874 (_2!5369 lt!190382)) (currentByte!5565 thiss!1305) (currentBit!5560 thiss!1305)))))

(declare-fun e!79583 () Bool)

(assert (=> b!121528 e!79583))

(declare-fun res!100661 () Bool)

(assert (=> b!121528 (=> (not res!100661) (not e!79583))))

(declare-fun isPrefixOf!0 (BitStream!4348 BitStream!4348) Bool)

(assert (=> b!121528 (= res!100661 (isPrefixOf!0 thiss!1305 (_2!5369 lt!190396)))))

(declare-fun lt!190394 () Unit!7489)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4348 BitStream!4348 BitStream!4348) Unit!7489)

(assert (=> b!121528 (= lt!190394 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5369 lt!190382) (_2!5369 lt!190396)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4348 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10208)

(assert (=> b!121528 (= lt!190396 (appendNLeastSignificantBitsLoop!0 (_2!5369 lt!190382) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!79586 () Bool)

(assert (=> b!121528 e!79586))

(declare-fun res!100655 () Bool)

(assert (=> b!121528 (=> (not res!100655) (not e!79586))))

(assert (=> b!121528 (= res!100655 (= (size!2437 (buf!2874 thiss!1305)) (size!2437 (buf!2874 (_2!5369 lt!190382)))))))

(declare-fun appendBit!0 (BitStream!4348 Bool) tuple2!10208)

(assert (=> b!121528 (= lt!190382 (appendBit!0 thiss!1305 lt!190401))))

(assert (=> b!121528 (= lt!190401 (not (= (bvand v!199 lt!190402) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121528 (= lt!190402 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121529 () Bool)

(declare-fun res!100660 () Bool)

(declare-fun e!79592 () Bool)

(assert (=> b!121529 (=> (not res!100660) (not e!79592))))

(assert (=> b!121529 (= res!100660 (isPrefixOf!0 thiss!1305 (_2!5369 lt!190382)))))

(declare-fun b!121530 () Bool)

(declare-fun e!79591 () Bool)

(declare-fun lt!190406 () tuple2!10210)

(declare-fun lt!190390 () (_ BitVec 64))

(assert (=> b!121530 (= e!79591 (= (bitIndex!0 (size!2437 (buf!2874 (_1!5370 lt!190406))) (currentByte!5565 (_1!5370 lt!190406)) (currentBit!5560 (_1!5370 lt!190406))) lt!190390))))

(declare-fun b!121531 () Bool)

(declare-fun res!100651 () Bool)

(assert (=> b!121531 (=> (not res!100651) (not e!79593))))

(assert (=> b!121531 (= res!100651 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun lt!190385 () BitStream!4348)

(declare-fun lt!190407 () (_ BitVec 64))

(declare-fun e!79587 () Bool)

(declare-fun lt!190405 () (_ BitVec 64))

(declare-fun b!121532 () Bool)

(assert (=> b!121532 (= e!79587 (and (= lt!190407 (bvsub lt!190405 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5368 lt!190386) lt!190385)) (and (= (_2!5367 lt!190384) (_2!5367 lt!190387)) (= (_1!5367 lt!190384) (_2!5368 lt!190388))))))))

(declare-fun b!121533 () Bool)

(assert (=> b!121533 (= e!79592 e!79591)))

(declare-fun res!100658 () Bool)

(assert (=> b!121533 (=> (not res!100658) (not e!79591))))

(assert (=> b!121533 (= res!100658 (and (= (_2!5370 lt!190406) lt!190401) (= (_1!5370 lt!190406) (_2!5369 lt!190382))))))

(declare-fun readerFrom!0 (BitStream!4348 (_ BitVec 32) (_ BitVec 32)) BitStream!4348)

(assert (=> b!121533 (= lt!190406 (readBitPure!0 (readerFrom!0 (_2!5369 lt!190382) (currentBit!5560 thiss!1305) (currentByte!5565 thiss!1305))))))

(declare-fun b!121534 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121534 (= e!79583 (invariant!0 (currentBit!5560 thiss!1305) (currentByte!5565 thiss!1305) (size!2437 (buf!2874 (_2!5369 lt!190396)))))))

(declare-fun b!121535 () Bool)

(assert (=> b!121535 (= e!79588 (= (_2!5370 lt!190400) (_2!5370 lt!190393)))))

(declare-fun b!121536 () Bool)

(assert (=> b!121536 (= e!79586 e!79592)))

(declare-fun res!100659 () Bool)

(assert (=> b!121536 (=> (not res!100659) (not e!79592))))

(declare-fun lt!190404 () (_ BitVec 64))

(assert (=> b!121536 (= res!100659 (= lt!190390 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!190404)))))

(assert (=> b!121536 (= lt!190390 (bitIndex!0 (size!2437 (buf!2874 (_2!5369 lt!190382))) (currentByte!5565 (_2!5369 lt!190382)) (currentBit!5560 (_2!5369 lt!190382))))))

(assert (=> b!121536 (= lt!190404 (bitIndex!0 (size!2437 (buf!2874 thiss!1305)) (currentByte!5565 thiss!1305) (currentBit!5560 thiss!1305)))))

(declare-fun res!100653 () Bool)

(assert (=> start!24032 (=> (not res!100653) (not e!79584))))

(assert (=> start!24032 (= res!100653 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24032 e!79584))

(assert (=> start!24032 true))

(declare-fun e!79590 () Bool)

(declare-fun inv!12 (BitStream!4348) Bool)

(assert (=> start!24032 (and (inv!12 thiss!1305) e!79590)))

(declare-fun b!121537 () Bool)

(declare-fun array_inv!2239 (array!5387) Bool)

(assert (=> b!121537 (= e!79590 (array_inv!2239 (buf!2874 thiss!1305)))))

(declare-fun b!121538 () Bool)

(declare-fun res!100657 () Bool)

(assert (=> b!121538 (=> (not res!100657) (not e!79593))))

(assert (=> b!121538 (= res!100657 (bvslt i!615 nBits!396))))

(declare-fun b!121539 () Bool)

(declare-fun res!100654 () Bool)

(assert (=> b!121539 (=> (not res!100654) (not e!79583))))

(assert (=> b!121539 (= res!100654 (invariant!0 (currentBit!5560 thiss!1305) (currentByte!5565 thiss!1305) (size!2437 (buf!2874 (_2!5369 lt!190382)))))))

(declare-fun b!121540 () Bool)

(assert (=> b!121540 (= e!79589 (or (not (= (_1!5368 lt!190386) lt!190385)) (not (= (size!2437 (buf!2874 thiss!1305)) (size!2437 (buf!2874 (_2!5369 lt!190396))))) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(assert (=> b!121540 e!79587))

(declare-fun res!100650 () Bool)

(assert (=> b!121540 (=> (not res!100650) (not e!79587))))

(declare-fun lt!190389 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4348 (_ BitVec 64)) BitStream!4348)

(assert (=> b!121540 (= res!100650 (= (_1!5368 lt!190386) (withMovedBitIndex!0 (_2!5368 lt!190386) (bvsub lt!190405 lt!190389))))))

(assert (=> b!121540 (= lt!190405 (bitIndex!0 (size!2437 (buf!2874 (_2!5369 lt!190382))) (currentByte!5565 (_2!5369 lt!190382)) (currentBit!5560 (_2!5369 lt!190382))))))

(assert (=> b!121540 (= (_1!5368 lt!190388) (withMovedBitIndex!0 (_2!5368 lt!190388) (bvsub lt!190407 lt!190389)))))

(assert (=> b!121540 (= lt!190389 (bitIndex!0 (size!2437 (buf!2874 (_2!5369 lt!190396))) (currentByte!5565 (_2!5369 lt!190396)) (currentBit!5560 (_2!5369 lt!190396))))))

(assert (=> b!121540 (= lt!190407 (bitIndex!0 (size!2437 (buf!2874 thiss!1305)) (currentByte!5565 thiss!1305) (currentBit!5560 thiss!1305)))))

(declare-fun lt!190399 () tuple2!10204)

(assert (=> b!121540 (and (= (_2!5367 lt!190384) (_2!5367 lt!190399)) (= (_1!5367 lt!190384) (_1!5367 lt!190399)))))

(declare-fun lt!190409 () Unit!7489)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7489)

(assert (=> b!121540 (= lt!190409 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5368 lt!190388) nBits!396 i!615 lt!190397))))

(assert (=> b!121540 (= lt!190399 (readNLeastSignificantBitsLoopPure!0 lt!190385 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190392))))

(assert (=> b!121540 (= lt!190385 (withMovedBitIndex!0 (_1!5368 lt!190388) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!24032 res!100653) b!121527))

(assert (= (and b!121527 res!100662) b!121531))

(assert (= (and b!121531 res!100651) b!121538))

(assert (= (and b!121538 res!100657) b!121528))

(assert (= (and b!121528 res!100655) b!121536))

(assert (= (and b!121536 res!100659) b!121529))

(assert (= (and b!121529 res!100660) b!121533))

(assert (= (and b!121533 res!100658) b!121530))

(assert (= (and b!121528 res!100661) b!121539))

(assert (= (and b!121539 res!100654) b!121534))

(assert (= (and b!121528 res!100656) b!121535))

(assert (= (and b!121528 (not res!100652)) b!121540))

(assert (= (and b!121540 res!100650) b!121532))

(assert (= start!24032 b!121537))

(declare-fun m!184205 () Bool)

(assert (=> b!121534 m!184205))

(declare-fun m!184207 () Bool)

(assert (=> b!121539 m!184207))

(declare-fun m!184209 () Bool)

(assert (=> b!121527 m!184209))

(declare-fun m!184211 () Bool)

(assert (=> b!121533 m!184211))

(assert (=> b!121533 m!184211))

(declare-fun m!184213 () Bool)

(assert (=> b!121533 m!184213))

(declare-fun m!184215 () Bool)

(assert (=> b!121536 m!184215))

(declare-fun m!184217 () Bool)

(assert (=> b!121536 m!184217))

(declare-fun m!184219 () Bool)

(assert (=> b!121537 m!184219))

(declare-fun m!184221 () Bool)

(assert (=> start!24032 m!184221))

(declare-fun m!184223 () Bool)

(assert (=> b!121528 m!184223))

(declare-fun m!184225 () Bool)

(assert (=> b!121528 m!184225))

(declare-fun m!184227 () Bool)

(assert (=> b!121528 m!184227))

(declare-fun m!184229 () Bool)

(assert (=> b!121528 m!184229))

(declare-fun m!184231 () Bool)

(assert (=> b!121528 m!184231))

(declare-fun m!184233 () Bool)

(assert (=> b!121528 m!184233))

(declare-fun m!184235 () Bool)

(assert (=> b!121528 m!184235))

(declare-fun m!184237 () Bool)

(assert (=> b!121528 m!184237))

(declare-fun m!184239 () Bool)

(assert (=> b!121528 m!184239))

(declare-fun m!184241 () Bool)

(assert (=> b!121528 m!184241))

(declare-fun m!184243 () Bool)

(assert (=> b!121528 m!184243))

(declare-fun m!184245 () Bool)

(assert (=> b!121528 m!184245))

(declare-fun m!184247 () Bool)

(assert (=> b!121528 m!184247))

(declare-fun m!184249 () Bool)

(assert (=> b!121528 m!184249))

(declare-fun m!184251 () Bool)

(assert (=> b!121528 m!184251))

(declare-fun m!184253 () Bool)

(assert (=> b!121528 m!184253))

(declare-fun m!184255 () Bool)

(assert (=> b!121528 m!184255))

(declare-fun m!184257 () Bool)

(assert (=> b!121528 m!184257))

(declare-fun m!184259 () Bool)

(assert (=> b!121528 m!184259))

(declare-fun m!184261 () Bool)

(assert (=> b!121529 m!184261))

(declare-fun m!184263 () Bool)

(assert (=> b!121531 m!184263))

(declare-fun m!184265 () Bool)

(assert (=> b!121530 m!184265))

(declare-fun m!184267 () Bool)

(assert (=> b!121540 m!184267))

(declare-fun m!184269 () Bool)

(assert (=> b!121540 m!184269))

(declare-fun m!184271 () Bool)

(assert (=> b!121540 m!184271))

(declare-fun m!184273 () Bool)

(assert (=> b!121540 m!184273))

(assert (=> b!121540 m!184215))

(declare-fun m!184275 () Bool)

(assert (=> b!121540 m!184275))

(declare-fun m!184277 () Bool)

(assert (=> b!121540 m!184277))

(assert (=> b!121540 m!184217))

(push 1)

(assert (not start!24032))

(assert (not b!121540))

(assert (not b!121536))

(assert (not b!121533))

(assert (not b!121528))

(assert (not b!121530))

(assert (not b!121527))

(assert (not b!121537))

(assert (not b!121534))

(assert (not b!121539))

(assert (not b!121529))

(assert (not b!121531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

