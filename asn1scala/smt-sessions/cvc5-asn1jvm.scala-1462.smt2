; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40184 () Bool)

(assert start!40184)

(declare-fun res!152514 () Bool)

(declare-fun e!127207 () Bool)

(assert (=> start!40184 (=> (not res!152514) (not e!127207))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!40184 (= res!152514 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40184 e!127207))

(assert (=> start!40184 true))

(declare-datatypes ((array!9752 0))(
  ( (array!9753 (arr!5230 (Array (_ BitVec 32) (_ BitVec 8))) (size!4300 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7708 0))(
  ( (BitStream!7709 (buf!4755 array!9752) (currentByte!8989 (_ BitVec 32)) (currentBit!8984 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7708)

(declare-fun e!127206 () Bool)

(declare-fun inv!12 (BitStream!7708) Bool)

(assert (=> start!40184 (and (inv!12 thiss!1204) e!127206)))

(declare-fun b!183453 () Bool)

(declare-fun res!152510 () Bool)

(declare-fun e!127210 () Bool)

(assert (=> b!183453 (=> res!152510 e!127210)))

(declare-fun lt!282388 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183453 (= res!152510 (not (= (bvand lt!282388 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183454 () Bool)

(declare-fun res!152527 () Bool)

(declare-fun e!127205 () Bool)

(assert (=> b!183454 (=> res!152527 e!127205)))

(declare-datatypes ((Unit!13175 0))(
  ( (Unit!13176) )
))
(declare-datatypes ((tuple2!15836 0))(
  ( (tuple2!15837 (_1!8563 Unit!13175) (_2!8563 BitStream!7708)) )
))
(declare-fun lt!282408 () tuple2!15836)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183454 (= res!152527 (not (invariant!0 (currentBit!8984 (_2!8563 lt!282408)) (currentByte!8989 (_2!8563 lt!282408)) (size!4300 (buf!4755 (_2!8563 lt!282408))))))))

(declare-fun b!183455 () Bool)

(declare-fun e!127200 () Bool)

(declare-fun e!127202 () Bool)

(assert (=> b!183455 (= e!127200 (not e!127202))))

(declare-fun res!152515 () Bool)

(assert (=> b!183455 (=> res!152515 e!127202)))

(declare-fun lt!282391 () (_ BitVec 64))

(declare-fun lt!282406 () (_ BitVec 64))

(assert (=> b!183455 (= res!152515 (not (= lt!282391 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282406))))))

(declare-fun lt!282392 () tuple2!15836)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183455 (= lt!282391 (bitIndex!0 (size!4300 (buf!4755 (_2!8563 lt!282392))) (currentByte!8989 (_2!8563 lt!282392)) (currentBit!8984 (_2!8563 lt!282392))))))

(assert (=> b!183455 (= lt!282406 (bitIndex!0 (size!4300 (buf!4755 thiss!1204)) (currentByte!8989 thiss!1204) (currentBit!8984 thiss!1204)))))

(declare-fun e!127201 () Bool)

(assert (=> b!183455 e!127201))

(declare-fun res!152512 () Bool)

(assert (=> b!183455 (=> (not res!152512) (not e!127201))))

(assert (=> b!183455 (= res!152512 (= (size!4300 (buf!4755 thiss!1204)) (size!4300 (buf!4755 (_2!8563 lt!282392)))))))

(declare-fun lt!282396 () Bool)

(declare-fun appendBit!0 (BitStream!7708 Bool) tuple2!15836)

(assert (=> b!183455 (= lt!282392 (appendBit!0 thiss!1204 lt!282396))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!282394 () (_ BitVec 64))

(assert (=> b!183455 (= lt!282396 (not (= (bvand v!189 lt!282394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183455 (= lt!282394 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183456 () Bool)

(declare-fun res!152524 () Bool)

(assert (=> b!183456 (=> res!152524 e!127205)))

(declare-fun isPrefixOf!0 (BitStream!7708 BitStream!7708) Bool)

(assert (=> b!183456 (= res!152524 (not (isPrefixOf!0 (_2!8563 lt!282392) (_2!8563 lt!282408))))))

(declare-fun b!183457 () Bool)

(declare-fun res!152513 () Bool)

(assert (=> b!183457 (=> res!152513 e!127210)))

(assert (=> b!183457 (= res!152513 (bvsge i!590 nBits!348))))

(declare-fun b!183458 () Bool)

(declare-fun e!127204 () Bool)

(declare-datatypes ((tuple2!15838 0))(
  ( (tuple2!15839 (_1!8564 BitStream!7708) (_2!8564 Bool)) )
))
(declare-fun lt!282399 () tuple2!15838)

(declare-fun lt!282403 () tuple2!15838)

(assert (=> b!183458 (= e!127204 (= (_2!8564 lt!282399) (_2!8564 lt!282403)))))

(declare-fun b!183459 () Bool)

(assert (=> b!183459 (= e!127202 e!127205)))

(declare-fun res!152528 () Bool)

(assert (=> b!183459 (=> res!152528 e!127205)))

(declare-fun lt!282410 () (_ BitVec 64))

(assert (=> b!183459 (= res!152528 (not (= lt!282410 (bvsub (bvsub (bvadd lt!282391 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183459 (= lt!282410 (bitIndex!0 (size!4300 (buf!4755 (_2!8563 lt!282408))) (currentByte!8989 (_2!8563 lt!282408)) (currentBit!8984 (_2!8563 lt!282408))))))

(assert (=> b!183459 (isPrefixOf!0 thiss!1204 (_2!8563 lt!282408))))

(declare-fun lt!282402 () Unit!13175)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7708 BitStream!7708 BitStream!7708) Unit!13175)

(assert (=> b!183459 (= lt!282402 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8563 lt!282392) (_2!8563 lt!282408)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7708 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15836)

(assert (=> b!183459 (= lt!282408 (appendBitsLSBFirstLoopTR!0 (_2!8563 lt!282392) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183460 () Bool)

(declare-fun e!127203 () Bool)

(declare-fun e!127209 () Bool)

(assert (=> b!183460 (= e!127203 e!127209)))

(declare-fun res!152522 () Bool)

(assert (=> b!183460 (=> (not res!152522) (not e!127209))))

(declare-fun lt!282390 () tuple2!15838)

(assert (=> b!183460 (= res!152522 (and (= (_2!8564 lt!282390) lt!282396) (= (_1!8564 lt!282390) (_2!8563 lt!282392))))))

(declare-fun readBitPure!0 (BitStream!7708) tuple2!15838)

(declare-fun readerFrom!0 (BitStream!7708 (_ BitVec 32) (_ BitVec 32)) BitStream!7708)

(assert (=> b!183460 (= lt!282390 (readBitPure!0 (readerFrom!0 (_2!8563 lt!282392) (currentBit!8984 thiss!1204) (currentByte!8989 thiss!1204))))))

(declare-fun b!183461 () Bool)

(declare-fun res!152529 () Bool)

(assert (=> b!183461 (=> (not res!152529) (not e!127200))))

(assert (=> b!183461 (= res!152529 (not (= i!590 nBits!348)))))

(declare-fun b!183462 () Bool)

(assert (=> b!183462 (= e!127201 e!127203)))

(declare-fun res!152516 () Bool)

(assert (=> b!183462 (=> (not res!152516) (not e!127203))))

(declare-fun lt!282387 () (_ BitVec 64))

(declare-fun lt!282397 () (_ BitVec 64))

(assert (=> b!183462 (= res!152516 (= lt!282387 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282397)))))

(assert (=> b!183462 (= lt!282387 (bitIndex!0 (size!4300 (buf!4755 (_2!8563 lt!282392))) (currentByte!8989 (_2!8563 lt!282392)) (currentBit!8984 (_2!8563 lt!282392))))))

(assert (=> b!183462 (= lt!282397 (bitIndex!0 (size!4300 (buf!4755 thiss!1204)) (currentByte!8989 thiss!1204) (currentBit!8984 thiss!1204)))))

(declare-fun b!183463 () Bool)

(assert (=> b!183463 (= e!127209 (= (bitIndex!0 (size!4300 (buf!4755 (_1!8564 lt!282390))) (currentByte!8989 (_1!8564 lt!282390)) (currentBit!8984 (_1!8564 lt!282390))) lt!282387))))

(declare-fun b!183464 () Bool)

(declare-fun res!152518 () Bool)

(assert (=> b!183464 (=> (not res!152518) (not e!127203))))

(assert (=> b!183464 (= res!152518 (isPrefixOf!0 thiss!1204 (_2!8563 lt!282392)))))

(declare-fun b!183465 () Bool)

(declare-fun array_inv!4041 (array!9752) Bool)

(assert (=> b!183465 (= e!127206 (array_inv!4041 (buf!4755 thiss!1204)))))

(declare-fun b!183466 () Bool)

(declare-fun res!152520 () Bool)

(assert (=> b!183466 (=> res!152520 e!127210)))

(assert (=> b!183466 (= res!152520 (not (= (bvand lt!282388 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282388)))))

(declare-fun b!183467 () Bool)

(assert (=> b!183467 (= e!127210 true)))

(declare-datatypes ((tuple2!15840 0))(
  ( (tuple2!15841 (_1!8565 BitStream!7708) (_2!8565 BitStream!7708)) )
))
(declare-fun lt!282407 () tuple2!15840)

(declare-datatypes ((tuple2!15842 0))(
  ( (tuple2!15843 (_1!8566 BitStream!7708) (_2!8566 (_ BitVec 64))) )
))
(declare-fun lt!282386 () tuple2!15842)

(declare-fun lt!282404 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15842)

(declare-fun withMovedBitIndex!0 (BitStream!7708 (_ BitVec 64)) BitStream!7708)

(assert (=> b!183467 (= lt!282386 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8565 lt!282407) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282404))))

(declare-fun b!183468 () Bool)

(declare-fun res!152511 () Bool)

(assert (=> b!183468 (=> res!152511 e!127205)))

(assert (=> b!183468 (= res!152511 (not (isPrefixOf!0 thiss!1204 (_2!8563 lt!282392))))))

(declare-fun b!183469 () Bool)

(declare-fun e!127208 () Bool)

(assert (=> b!183469 (= e!127208 (invariant!0 (currentBit!8984 thiss!1204) (currentByte!8989 thiss!1204) (size!4300 (buf!4755 (_2!8563 lt!282408)))))))

(declare-fun b!183470 () Bool)

(declare-fun res!152509 () Bool)

(assert (=> b!183470 (=> (not res!152509) (not e!127200))))

(assert (=> b!183470 (= res!152509 (invariant!0 (currentBit!8984 thiss!1204) (currentByte!8989 thiss!1204) (size!4300 (buf!4755 thiss!1204))))))

(declare-fun b!183471 () Bool)

(assert (=> b!183471 (= e!127205 e!127210)))

(declare-fun res!152526 () Bool)

(assert (=> b!183471 (=> res!152526 e!127210)))

(declare-fun lt!282395 () tuple2!15840)

(assert (=> b!183471 (= res!152526 (not (= (_1!8566 (readNBitsLSBFirstsLoopPure!0 (_1!8565 lt!282395) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282404)) (_2!8565 lt!282395))))))

(declare-fun lt!282401 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183471 (validate_offset_bits!1 ((_ sign_extend 32) (size!4300 (buf!4755 (_2!8563 lt!282408)))) ((_ sign_extend 32) (currentByte!8989 (_2!8563 lt!282392))) ((_ sign_extend 32) (currentBit!8984 (_2!8563 lt!282392))) lt!282401)))

(declare-fun lt!282409 () Unit!13175)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7708 array!9752 (_ BitVec 64)) Unit!13175)

(assert (=> b!183471 (= lt!282409 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8563 lt!282392) (buf!4755 (_2!8563 lt!282408)) lt!282401))))

(assert (=> b!183471 (= lt!282401 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!282405 () tuple2!15838)

(assert (=> b!183471 (= lt!282404 (bvor lt!282388 (ite (_2!8564 lt!282405) lt!282394 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!282393 () tuple2!15842)

(assert (=> b!183471 (= lt!282393 (readNBitsLSBFirstsLoopPure!0 (_1!8565 lt!282407) nBits!348 i!590 lt!282388))))

(declare-fun lt!282389 () (_ BitVec 64))

(assert (=> b!183471 (validate_offset_bits!1 ((_ sign_extend 32) (size!4300 (buf!4755 (_2!8563 lt!282408)))) ((_ sign_extend 32) (currentByte!8989 thiss!1204)) ((_ sign_extend 32) (currentBit!8984 thiss!1204)) lt!282389)))

(declare-fun lt!282398 () Unit!13175)

(assert (=> b!183471 (= lt!282398 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4755 (_2!8563 lt!282408)) lt!282389))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183471 (= lt!282388 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!183471 (= (_2!8564 lt!282405) lt!282396)))

(assert (=> b!183471 (= lt!282405 (readBitPure!0 (_1!8565 lt!282407)))))

(declare-fun reader!0 (BitStream!7708 BitStream!7708) tuple2!15840)

(assert (=> b!183471 (= lt!282395 (reader!0 (_2!8563 lt!282392) (_2!8563 lt!282408)))))

(assert (=> b!183471 (= lt!282407 (reader!0 thiss!1204 (_2!8563 lt!282408)))))

(assert (=> b!183471 e!127204))

(declare-fun res!152519 () Bool)

(assert (=> b!183471 (=> (not res!152519) (not e!127204))))

(assert (=> b!183471 (= res!152519 (= (bitIndex!0 (size!4300 (buf!4755 (_1!8564 lt!282399))) (currentByte!8989 (_1!8564 lt!282399)) (currentBit!8984 (_1!8564 lt!282399))) (bitIndex!0 (size!4300 (buf!4755 (_1!8564 lt!282403))) (currentByte!8989 (_1!8564 lt!282403)) (currentBit!8984 (_1!8564 lt!282403)))))))

(declare-fun lt!282385 () Unit!13175)

(declare-fun lt!282400 () BitStream!7708)

(declare-fun readBitPrefixLemma!0 (BitStream!7708 BitStream!7708) Unit!13175)

(assert (=> b!183471 (= lt!282385 (readBitPrefixLemma!0 lt!282400 (_2!8563 lt!282408)))))

(assert (=> b!183471 (= lt!282403 (readBitPure!0 (BitStream!7709 (buf!4755 (_2!8563 lt!282408)) (currentByte!8989 thiss!1204) (currentBit!8984 thiss!1204))))))

(assert (=> b!183471 (= lt!282399 (readBitPure!0 lt!282400))))

(assert (=> b!183471 e!127208))

(declare-fun res!152523 () Bool)

(assert (=> b!183471 (=> (not res!152523) (not e!127208))))

(assert (=> b!183471 (= res!152523 (invariant!0 (currentBit!8984 thiss!1204) (currentByte!8989 thiss!1204) (size!4300 (buf!4755 (_2!8563 lt!282392)))))))

(assert (=> b!183471 (= lt!282400 (BitStream!7709 (buf!4755 (_2!8563 lt!282392)) (currentByte!8989 thiss!1204) (currentBit!8984 thiss!1204)))))

(declare-fun b!183472 () Bool)

(declare-fun res!152517 () Bool)

(assert (=> b!183472 (=> res!152517 e!127210)))

(assert (=> b!183472 (= res!152517 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4300 (buf!4755 (_1!8565 lt!282407)))) ((_ sign_extend 32) (currentByte!8989 (_1!8565 lt!282407))) ((_ sign_extend 32) (currentBit!8984 (_1!8565 lt!282407))) lt!282389)))))

(declare-fun b!183473 () Bool)

(assert (=> b!183473 (= e!127207 e!127200)))

(declare-fun res!152525 () Bool)

(assert (=> b!183473 (=> (not res!152525) (not e!127200))))

(assert (=> b!183473 (= res!152525 (validate_offset_bits!1 ((_ sign_extend 32) (size!4300 (buf!4755 thiss!1204))) ((_ sign_extend 32) (currentByte!8989 thiss!1204)) ((_ sign_extend 32) (currentBit!8984 thiss!1204)) lt!282389))))

(assert (=> b!183473 (= lt!282389 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183474 () Bool)

(declare-fun res!152521 () Bool)

(assert (=> b!183474 (=> res!152521 e!127205)))

(assert (=> b!183474 (= res!152521 (or (not (= (size!4300 (buf!4755 (_2!8563 lt!282408))) (size!4300 (buf!4755 thiss!1204)))) (not (= lt!282410 (bvsub (bvadd lt!282406 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(assert (= (and start!40184 res!152514) b!183473))

(assert (= (and b!183473 res!152525) b!183470))

(assert (= (and b!183470 res!152509) b!183461))

(assert (= (and b!183461 res!152529) b!183455))

(assert (= (and b!183455 res!152512) b!183462))

(assert (= (and b!183462 res!152516) b!183464))

(assert (= (and b!183464 res!152518) b!183460))

(assert (= (and b!183460 res!152522) b!183463))

(assert (= (and b!183455 (not res!152515)) b!183459))

(assert (= (and b!183459 (not res!152528)) b!183454))

(assert (= (and b!183454 (not res!152527)) b!183474))

(assert (= (and b!183474 (not res!152521)) b!183456))

(assert (= (and b!183456 (not res!152524)) b!183468))

(assert (= (and b!183468 (not res!152511)) b!183471))

(assert (= (and b!183471 res!152523) b!183469))

(assert (= (and b!183471 res!152519) b!183458))

(assert (= (and b!183471 (not res!152526)) b!183457))

(assert (= (and b!183457 (not res!152513)) b!183472))

(assert (= (and b!183472 (not res!152517)) b!183453))

(assert (= (and b!183453 (not res!152510)) b!183466))

(assert (= (and b!183466 (not res!152520)) b!183467))

(assert (= start!40184 b!183465))

(declare-fun m!285373 () Bool)

(assert (=> b!183468 m!285373))

(assert (=> b!183464 m!285373))

(declare-fun m!285375 () Bool)

(assert (=> b!183456 m!285375))

(declare-fun m!285377 () Bool)

(assert (=> b!183459 m!285377))

(declare-fun m!285379 () Bool)

(assert (=> b!183459 m!285379))

(declare-fun m!285381 () Bool)

(assert (=> b!183459 m!285381))

(declare-fun m!285383 () Bool)

(assert (=> b!183459 m!285383))

(declare-fun m!285385 () Bool)

(assert (=> b!183465 m!285385))

(declare-fun m!285387 () Bool)

(assert (=> b!183471 m!285387))

(declare-fun m!285389 () Bool)

(assert (=> b!183471 m!285389))

(declare-fun m!285391 () Bool)

(assert (=> b!183471 m!285391))

(declare-fun m!285393 () Bool)

(assert (=> b!183471 m!285393))

(declare-fun m!285395 () Bool)

(assert (=> b!183471 m!285395))

(declare-fun m!285397 () Bool)

(assert (=> b!183471 m!285397))

(declare-fun m!285399 () Bool)

(assert (=> b!183471 m!285399))

(declare-fun m!285401 () Bool)

(assert (=> b!183471 m!285401))

(declare-fun m!285403 () Bool)

(assert (=> b!183471 m!285403))

(declare-fun m!285405 () Bool)

(assert (=> b!183471 m!285405))

(declare-fun m!285407 () Bool)

(assert (=> b!183471 m!285407))

(declare-fun m!285409 () Bool)

(assert (=> b!183471 m!285409))

(declare-fun m!285411 () Bool)

(assert (=> b!183471 m!285411))

(declare-fun m!285413 () Bool)

(assert (=> b!183471 m!285413))

(declare-fun m!285415 () Bool)

(assert (=> b!183471 m!285415))

(declare-fun m!285417 () Bool)

(assert (=> b!183471 m!285417))

(declare-fun m!285419 () Bool)

(assert (=> b!183454 m!285419))

(declare-fun m!285421 () Bool)

(assert (=> b!183460 m!285421))

(assert (=> b!183460 m!285421))

(declare-fun m!285423 () Bool)

(assert (=> b!183460 m!285423))

(declare-fun m!285425 () Bool)

(assert (=> start!40184 m!285425))

(declare-fun m!285427 () Bool)

(assert (=> b!183455 m!285427))

(declare-fun m!285429 () Bool)

(assert (=> b!183455 m!285429))

(declare-fun m!285431 () Bool)

(assert (=> b!183455 m!285431))

(declare-fun m!285433 () Bool)

(assert (=> b!183470 m!285433))

(declare-fun m!285435 () Bool)

(assert (=> b!183467 m!285435))

(assert (=> b!183467 m!285435))

(declare-fun m!285437 () Bool)

(assert (=> b!183467 m!285437))

(declare-fun m!285439 () Bool)

(assert (=> b!183463 m!285439))

(declare-fun m!285441 () Bool)

(assert (=> b!183453 m!285441))

(declare-fun m!285443 () Bool)

(assert (=> b!183473 m!285443))

(declare-fun m!285445 () Bool)

(assert (=> b!183472 m!285445))

(declare-fun m!285447 () Bool)

(assert (=> b!183469 m!285447))

(assert (=> b!183462 m!285427))

(assert (=> b!183462 m!285429))

(push 1)

