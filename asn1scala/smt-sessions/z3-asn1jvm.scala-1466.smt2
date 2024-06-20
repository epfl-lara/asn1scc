; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40210 () Bool)

(assert start!40210)

(declare-fun res!153321 () Bool)

(declare-fun e!127675 () Bool)

(assert (=> start!40210 (=> (not res!153321) (not e!127675))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!40210 (= res!153321 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40210 e!127675))

(assert (=> start!40210 true))

(declare-datatypes ((array!9778 0))(
  ( (array!9779 (arr!5243 (Array (_ BitVec 32) (_ BitVec 8))) (size!4313 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7734 0))(
  ( (BitStream!7735 (buf!4768 array!9778) (currentByte!9002 (_ BitVec 32)) (currentBit!8997 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7734)

(declare-fun e!127676 () Bool)

(declare-fun inv!12 (BitStream!7734) Bool)

(assert (=> start!40210 (and (inv!12 thiss!1204) e!127676)))

(declare-fun b!184291 () Bool)

(declare-fun e!127673 () Bool)

(assert (=> b!184291 (= e!127675 e!127673)))

(declare-fun res!153315 () Bool)

(assert (=> b!184291 (=> (not res!153315) (not e!127673))))

(declare-fun lt!283419 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184291 (= res!153315 (validate_offset_bits!1 ((_ sign_extend 32) (size!4313 (buf!4768 thiss!1204))) ((_ sign_extend 32) (currentByte!9002 thiss!1204)) ((_ sign_extend 32) (currentBit!8997 thiss!1204)) lt!283419))))

(assert (=> b!184291 (= lt!283419 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184292 () Bool)

(declare-fun e!127672 () Bool)

(declare-datatypes ((tuple2!15940 0))(
  ( (tuple2!15941 (_1!8615 BitStream!7734) (_2!8615 Bool)) )
))
(declare-fun lt!283413 () tuple2!15940)

(declare-fun lt!283428 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184292 (= e!127672 (= (bitIndex!0 (size!4313 (buf!4768 (_1!8615 lt!283413))) (currentByte!9002 (_1!8615 lt!283413)) (currentBit!8997 (_1!8615 lt!283413))) lt!283428))))

(declare-fun b!184293 () Bool)

(declare-fun res!153309 () Bool)

(declare-fun e!127678 () Bool)

(assert (=> b!184293 (=> res!153309 e!127678)))

(declare-datatypes ((Unit!13201 0))(
  ( (Unit!13202) )
))
(declare-datatypes ((tuple2!15942 0))(
  ( (tuple2!15943 (_1!8616 Unit!13201) (_2!8616 BitStream!7734)) )
))
(declare-fun lt!283414 () tuple2!15942)

(declare-fun lt!283418 () tuple2!15942)

(declare-fun isPrefixOf!0 (BitStream!7734 BitStream!7734) Bool)

(assert (=> b!184293 (= res!153309 (not (isPrefixOf!0 (_2!8616 lt!283414) (_2!8616 lt!283418))))))

(declare-fun b!184294 () Bool)

(declare-fun e!127669 () Bool)

(declare-fun lt!283417 () tuple2!15940)

(declare-fun lt!283420 () tuple2!15940)

(assert (=> b!184294 (= e!127669 (= (_2!8615 lt!283417) (_2!8615 lt!283420)))))

(declare-fun b!184295 () Bool)

(declare-fun e!127677 () Bool)

(assert (=> b!184295 (= e!127677 true)))

(declare-datatypes ((tuple2!15944 0))(
  ( (tuple2!15945 (_1!8617 BitStream!7734) (_2!8617 (_ BitVec 64))) )
))
(declare-fun lt!283406 () tuple2!15944)

(declare-fun lt!283405 () tuple2!15944)

(assert (=> b!184295 (and (= (_2!8617 lt!283406) (_2!8617 lt!283405)) (= (_1!8617 lt!283406) (_1!8617 lt!283405)))))

(declare-datatypes ((tuple2!15946 0))(
  ( (tuple2!15947 (_1!8618 BitStream!7734) (_2!8618 BitStream!7734)) )
))
(declare-fun lt!283410 () tuple2!15946)

(declare-fun lt!283408 () Unit!13201)

(declare-fun lt!283425 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13201)

(assert (=> b!184295 (= lt!283408 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8618 lt!283410) nBits!348 i!590 lt!283425))))

(declare-fun lt!283409 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15944)

(declare-fun withMovedBitIndex!0 (BitStream!7734 (_ BitVec 64)) BitStream!7734)

(assert (=> b!184295 (= lt!283405 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8618 lt!283410) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283409))))

(declare-fun b!184296 () Bool)

(declare-fun res!153322 () Bool)

(declare-fun e!127674 () Bool)

(assert (=> b!184296 (=> (not res!153322) (not e!127674))))

(assert (=> b!184296 (= res!153322 (isPrefixOf!0 thiss!1204 (_2!8616 lt!283414)))))

(declare-fun b!184297 () Bool)

(declare-fun res!153319 () Bool)

(assert (=> b!184297 (=> res!153319 e!127678)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184297 (= res!153319 (not (invariant!0 (currentBit!8997 (_2!8616 lt!283418)) (currentByte!9002 (_2!8616 lt!283418)) (size!4313 (buf!4768 (_2!8616 lt!283418))))))))

(declare-fun b!184298 () Bool)

(declare-fun e!127671 () Bool)

(assert (=> b!184298 (= e!127671 e!127674)))

(declare-fun res!153320 () Bool)

(assert (=> b!184298 (=> (not res!153320) (not e!127674))))

(declare-fun lt!283421 () (_ BitVec 64))

(assert (=> b!184298 (= res!153320 (= lt!283428 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283421)))))

(assert (=> b!184298 (= lt!283428 (bitIndex!0 (size!4313 (buf!4768 (_2!8616 lt!283414))) (currentByte!9002 (_2!8616 lt!283414)) (currentBit!8997 (_2!8616 lt!283414))))))

(assert (=> b!184298 (= lt!283421 (bitIndex!0 (size!4313 (buf!4768 thiss!1204)) (currentByte!9002 thiss!1204) (currentBit!8997 thiss!1204)))))

(declare-fun b!184299 () Bool)

(declare-fun res!153318 () Bool)

(assert (=> b!184299 (=> (not res!153318) (not e!127673))))

(assert (=> b!184299 (= res!153318 (invariant!0 (currentBit!8997 thiss!1204) (currentByte!9002 thiss!1204) (size!4313 (buf!4768 thiss!1204))))))

(declare-fun b!184300 () Bool)

(declare-fun res!153312 () Bool)

(assert (=> b!184300 (=> (not res!153312) (not e!127673))))

(assert (=> b!184300 (= res!153312 (not (= i!590 nBits!348)))))

(declare-fun b!184301 () Bool)

(declare-fun e!127670 () Bool)

(assert (=> b!184301 (= e!127673 (not e!127670))))

(declare-fun res!153323 () Bool)

(assert (=> b!184301 (=> res!153323 e!127670)))

(declare-fun lt!283429 () (_ BitVec 64))

(declare-fun lt!283430 () (_ BitVec 64))

(assert (=> b!184301 (= res!153323 (not (= lt!283429 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283430))))))

(assert (=> b!184301 (= lt!283429 (bitIndex!0 (size!4313 (buf!4768 (_2!8616 lt!283414))) (currentByte!9002 (_2!8616 lt!283414)) (currentBit!8997 (_2!8616 lt!283414))))))

(assert (=> b!184301 (= lt!283430 (bitIndex!0 (size!4313 (buf!4768 thiss!1204)) (currentByte!9002 thiss!1204) (currentBit!8997 thiss!1204)))))

(assert (=> b!184301 e!127671))

(declare-fun res!153317 () Bool)

(assert (=> b!184301 (=> (not res!153317) (not e!127671))))

(assert (=> b!184301 (= res!153317 (= (size!4313 (buf!4768 thiss!1204)) (size!4313 (buf!4768 (_2!8616 lt!283414)))))))

(declare-fun lt!283407 () Bool)

(declare-fun appendBit!0 (BitStream!7734 Bool) tuple2!15942)

(assert (=> b!184301 (= lt!283414 (appendBit!0 thiss!1204 lt!283407))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!283416 () (_ BitVec 64))

(assert (=> b!184301 (= lt!283407 (not (= (bvand v!189 lt!283416) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184301 (= lt!283416 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184302 () Bool)

(assert (=> b!184302 (= e!127678 e!127677)))

(declare-fun res!153316 () Bool)

(assert (=> b!184302 (=> res!153316 e!127677)))

(declare-fun lt!283424 () tuple2!15946)

(assert (=> b!184302 (= res!153316 (not (= (_1!8617 (readNBitsLSBFirstsLoopPure!0 (_1!8618 lt!283424) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283409)) (_2!8618 lt!283424))))))

(declare-fun lt!283404 () (_ BitVec 64))

(assert (=> b!184302 (validate_offset_bits!1 ((_ sign_extend 32) (size!4313 (buf!4768 (_2!8616 lt!283418)))) ((_ sign_extend 32) (currentByte!9002 (_2!8616 lt!283414))) ((_ sign_extend 32) (currentBit!8997 (_2!8616 lt!283414))) lt!283404)))

(declare-fun lt!283426 () Unit!13201)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7734 array!9778 (_ BitVec 64)) Unit!13201)

(assert (=> b!184302 (= lt!283426 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8616 lt!283414) (buf!4768 (_2!8616 lt!283418)) lt!283404))))

(assert (=> b!184302 (= lt!283404 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283411 () tuple2!15940)

(assert (=> b!184302 (= lt!283409 (bvor lt!283425 (ite (_2!8615 lt!283411) lt!283416 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184302 (= lt!283406 (readNBitsLSBFirstsLoopPure!0 (_1!8618 lt!283410) nBits!348 i!590 lt!283425))))

(assert (=> b!184302 (validate_offset_bits!1 ((_ sign_extend 32) (size!4313 (buf!4768 (_2!8616 lt!283418)))) ((_ sign_extend 32) (currentByte!9002 thiss!1204)) ((_ sign_extend 32) (currentBit!8997 thiss!1204)) lt!283419)))

(declare-fun lt!283427 () Unit!13201)

(assert (=> b!184302 (= lt!283427 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4768 (_2!8616 lt!283418)) lt!283419))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184302 (= lt!283425 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!184302 (= (_2!8615 lt!283411) lt!283407)))

(declare-fun readBitPure!0 (BitStream!7734) tuple2!15940)

(assert (=> b!184302 (= lt!283411 (readBitPure!0 (_1!8618 lt!283410)))))

(declare-fun reader!0 (BitStream!7734 BitStream!7734) tuple2!15946)

(assert (=> b!184302 (= lt!283424 (reader!0 (_2!8616 lt!283414) (_2!8616 lt!283418)))))

(assert (=> b!184302 (= lt!283410 (reader!0 thiss!1204 (_2!8616 lt!283418)))))

(assert (=> b!184302 e!127669))

(declare-fun res!153313 () Bool)

(assert (=> b!184302 (=> (not res!153313) (not e!127669))))

(assert (=> b!184302 (= res!153313 (= (bitIndex!0 (size!4313 (buf!4768 (_1!8615 lt!283417))) (currentByte!9002 (_1!8615 lt!283417)) (currentBit!8997 (_1!8615 lt!283417))) (bitIndex!0 (size!4313 (buf!4768 (_1!8615 lt!283420))) (currentByte!9002 (_1!8615 lt!283420)) (currentBit!8997 (_1!8615 lt!283420)))))))

(declare-fun lt!283415 () Unit!13201)

(declare-fun lt!283412 () BitStream!7734)

(declare-fun readBitPrefixLemma!0 (BitStream!7734 BitStream!7734) Unit!13201)

(assert (=> b!184302 (= lt!283415 (readBitPrefixLemma!0 lt!283412 (_2!8616 lt!283418)))))

(assert (=> b!184302 (= lt!283420 (readBitPure!0 (BitStream!7735 (buf!4768 (_2!8616 lt!283418)) (currentByte!9002 thiss!1204) (currentBit!8997 thiss!1204))))))

(assert (=> b!184302 (= lt!283417 (readBitPure!0 lt!283412))))

(declare-fun e!127667 () Bool)

(assert (=> b!184302 e!127667))

(declare-fun res!153310 () Bool)

(assert (=> b!184302 (=> (not res!153310) (not e!127667))))

(assert (=> b!184302 (= res!153310 (invariant!0 (currentBit!8997 thiss!1204) (currentByte!9002 thiss!1204) (size!4313 (buf!4768 (_2!8616 lt!283414)))))))

(assert (=> b!184302 (= lt!283412 (BitStream!7735 (buf!4768 (_2!8616 lt!283414)) (currentByte!9002 thiss!1204) (currentBit!8997 thiss!1204)))))

(declare-fun b!184303 () Bool)

(assert (=> b!184303 (= e!127670 e!127678)))

(declare-fun res!153314 () Bool)

(assert (=> b!184303 (=> res!153314 e!127678)))

(declare-fun lt!283422 () (_ BitVec 64))

(assert (=> b!184303 (= res!153314 (not (= lt!283422 (bvsub (bvsub (bvadd lt!283429 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!184303 (= lt!283422 (bitIndex!0 (size!4313 (buf!4768 (_2!8616 lt!283418))) (currentByte!9002 (_2!8616 lt!283418)) (currentBit!8997 (_2!8616 lt!283418))))))

(assert (=> b!184303 (isPrefixOf!0 thiss!1204 (_2!8616 lt!283418))))

(declare-fun lt!283423 () Unit!13201)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7734 BitStream!7734 BitStream!7734) Unit!13201)

(assert (=> b!184303 (= lt!283423 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8616 lt!283414) (_2!8616 lt!283418)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7734 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15942)

(assert (=> b!184303 (= lt!283418 (appendBitsLSBFirstLoopTR!0 (_2!8616 lt!283414) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184304 () Bool)

(assert (=> b!184304 (= e!127674 e!127672)))

(declare-fun res!153311 () Bool)

(assert (=> b!184304 (=> (not res!153311) (not e!127672))))

(assert (=> b!184304 (= res!153311 (and (= (_2!8615 lt!283413) lt!283407) (= (_1!8615 lt!283413) (_2!8616 lt!283414))))))

(declare-fun readerFrom!0 (BitStream!7734 (_ BitVec 32) (_ BitVec 32)) BitStream!7734)

(assert (=> b!184304 (= lt!283413 (readBitPure!0 (readerFrom!0 (_2!8616 lt!283414) (currentBit!8997 thiss!1204) (currentByte!9002 thiss!1204))))))

(declare-fun b!184305 () Bool)

(declare-fun array_inv!4054 (array!9778) Bool)

(assert (=> b!184305 (= e!127676 (array_inv!4054 (buf!4768 thiss!1204)))))

(declare-fun b!184306 () Bool)

(declare-fun res!153324 () Bool)

(assert (=> b!184306 (=> res!153324 e!127678)))

(assert (=> b!184306 (= res!153324 (or (not (= (size!4313 (buf!4768 (_2!8616 lt!283418))) (size!4313 (buf!4768 thiss!1204)))) (not (= lt!283422 (bvsub (bvadd lt!283430 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184307 () Bool)

(assert (=> b!184307 (= e!127667 (invariant!0 (currentBit!8997 thiss!1204) (currentByte!9002 thiss!1204) (size!4313 (buf!4768 (_2!8616 lt!283418)))))))

(declare-fun b!184308 () Bool)

(declare-fun res!153308 () Bool)

(assert (=> b!184308 (=> res!153308 e!127678)))

(assert (=> b!184308 (= res!153308 (not (isPrefixOf!0 thiss!1204 (_2!8616 lt!283414))))))

(assert (= (and start!40210 res!153321) b!184291))

(assert (= (and b!184291 res!153315) b!184299))

(assert (= (and b!184299 res!153318) b!184300))

(assert (= (and b!184300 res!153312) b!184301))

(assert (= (and b!184301 res!153317) b!184298))

(assert (= (and b!184298 res!153320) b!184296))

(assert (= (and b!184296 res!153322) b!184304))

(assert (= (and b!184304 res!153311) b!184292))

(assert (= (and b!184301 (not res!153323)) b!184303))

(assert (= (and b!184303 (not res!153314)) b!184297))

(assert (= (and b!184297 (not res!153319)) b!184306))

(assert (= (and b!184306 (not res!153324)) b!184293))

(assert (= (and b!184293 (not res!153309)) b!184308))

(assert (= (and b!184308 (not res!153308)) b!184302))

(assert (= (and b!184302 res!153310) b!184307))

(assert (= (and b!184302 res!153313) b!184294))

(assert (= (and b!184302 (not res!153316)) b!184295))

(assert (= start!40210 b!184305))

(declare-fun m!286359 () Bool)

(assert (=> b!184297 m!286359))

(declare-fun m!286361 () Bool)

(assert (=> b!184293 m!286361))

(declare-fun m!286363 () Bool)

(assert (=> start!40210 m!286363))

(declare-fun m!286365 () Bool)

(assert (=> b!184301 m!286365))

(declare-fun m!286367 () Bool)

(assert (=> b!184301 m!286367))

(declare-fun m!286369 () Bool)

(assert (=> b!184301 m!286369))

(declare-fun m!286371 () Bool)

(assert (=> b!184295 m!286371))

(declare-fun m!286373 () Bool)

(assert (=> b!184295 m!286373))

(assert (=> b!184295 m!286373))

(declare-fun m!286375 () Bool)

(assert (=> b!184295 m!286375))

(declare-fun m!286377 () Bool)

(assert (=> b!184296 m!286377))

(declare-fun m!286379 () Bool)

(assert (=> b!184307 m!286379))

(declare-fun m!286381 () Bool)

(assert (=> b!184302 m!286381))

(declare-fun m!286383 () Bool)

(assert (=> b!184302 m!286383))

(declare-fun m!286385 () Bool)

(assert (=> b!184302 m!286385))

(declare-fun m!286387 () Bool)

(assert (=> b!184302 m!286387))

(declare-fun m!286389 () Bool)

(assert (=> b!184302 m!286389))

(declare-fun m!286391 () Bool)

(assert (=> b!184302 m!286391))

(declare-fun m!286393 () Bool)

(assert (=> b!184302 m!286393))

(declare-fun m!286395 () Bool)

(assert (=> b!184302 m!286395))

(declare-fun m!286397 () Bool)

(assert (=> b!184302 m!286397))

(declare-fun m!286399 () Bool)

(assert (=> b!184302 m!286399))

(declare-fun m!286401 () Bool)

(assert (=> b!184302 m!286401))

(declare-fun m!286403 () Bool)

(assert (=> b!184302 m!286403))

(declare-fun m!286405 () Bool)

(assert (=> b!184302 m!286405))

(declare-fun m!286407 () Bool)

(assert (=> b!184302 m!286407))

(declare-fun m!286409 () Bool)

(assert (=> b!184302 m!286409))

(declare-fun m!286411 () Bool)

(assert (=> b!184302 m!286411))

(declare-fun m!286413 () Bool)

(assert (=> b!184303 m!286413))

(declare-fun m!286415 () Bool)

(assert (=> b!184303 m!286415))

(declare-fun m!286417 () Bool)

(assert (=> b!184303 m!286417))

(declare-fun m!286419 () Bool)

(assert (=> b!184303 m!286419))

(assert (=> b!184308 m!286377))

(assert (=> b!184298 m!286365))

(assert (=> b!184298 m!286367))

(declare-fun m!286421 () Bool)

(assert (=> b!184292 m!286421))

(declare-fun m!286423 () Bool)

(assert (=> b!184305 m!286423))

(declare-fun m!286425 () Bool)

(assert (=> b!184291 m!286425))

(declare-fun m!286427 () Bool)

(assert (=> b!184299 m!286427))

(declare-fun m!286429 () Bool)

(assert (=> b!184304 m!286429))

(assert (=> b!184304 m!286429))

(declare-fun m!286431 () Bool)

(assert (=> b!184304 m!286431))

(check-sat (not b!184303) (not b!184298) (not start!40210) (not b!184292) (not b!184295) (not b!184308) (not b!184297) (not b!184299) (not b!184301) (not b!184291) (not b!184293) (not b!184296) (not b!184302) (not b!184304) (not b!184305) (not b!184307))
