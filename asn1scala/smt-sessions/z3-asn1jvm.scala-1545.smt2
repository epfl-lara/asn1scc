; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43340 () Bool)

(assert start!43340)

(declare-fun b!204520 () Bool)

(declare-fun e!140046 () Bool)

(declare-fun e!140039 () Bool)

(assert (=> b!204520 (= e!140046 (not e!140039))))

(declare-fun res!171396 () Bool)

(assert (=> b!204520 (=> res!171396 e!140039)))

(declare-fun lt!319472 () (_ BitVec 64))

(declare-fun lt!319473 () (_ BitVec 64))

(assert (=> b!204520 (= res!171396 (not (= lt!319472 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319473))))))

(declare-datatypes ((array!10342 0))(
  ( (array!10343 (arr!5477 (Array (_ BitVec 32) (_ BitVec 8))) (size!4547 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8202 0))(
  ( (BitStream!8203 (buf!5052 array!10342) (currentByte!9537 (_ BitVec 32)) (currentBit!9532 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14585 0))(
  ( (Unit!14586) )
))
(declare-datatypes ((tuple2!17496 0))(
  ( (tuple2!17497 (_1!9400 Unit!14585) (_2!9400 BitStream!8202)) )
))
(declare-fun lt!319478 () tuple2!17496)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204520 (= lt!319472 (bitIndex!0 (size!4547 (buf!5052 (_2!9400 lt!319478))) (currentByte!9537 (_2!9400 lt!319478)) (currentBit!9532 (_2!9400 lt!319478))))))

(declare-fun thiss!1204 () BitStream!8202)

(assert (=> b!204520 (= lt!319473 (bitIndex!0 (size!4547 (buf!5052 thiss!1204)) (currentByte!9537 thiss!1204) (currentBit!9532 thiss!1204)))))

(declare-fun e!140042 () Bool)

(assert (=> b!204520 e!140042))

(declare-fun res!171388 () Bool)

(assert (=> b!204520 (=> (not res!171388) (not e!140042))))

(assert (=> b!204520 (= res!171388 (= (size!4547 (buf!5052 thiss!1204)) (size!4547 (buf!5052 (_2!9400 lt!319478)))))))

(declare-fun lt!319469 () Bool)

(declare-fun appendBit!0 (BitStream!8202 Bool) tuple2!17496)

(assert (=> b!204520 (= lt!319478 (appendBit!0 thiss!1204 lt!319469))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!204520 (= lt!319469 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!204521 () Bool)

(declare-fun res!171389 () Bool)

(declare-fun e!140044 () Bool)

(assert (=> b!204521 (=> res!171389 e!140044)))

(declare-fun lt!319476 () tuple2!17496)

(declare-fun isPrefixOf!0 (BitStream!8202 BitStream!8202) Bool)

(assert (=> b!204521 (= res!171389 (not (isPrefixOf!0 (_2!9400 lt!319478) (_2!9400 lt!319476))))))

(declare-fun b!204522 () Bool)

(declare-fun res!171385 () Bool)

(assert (=> b!204522 (=> res!171385 e!140044)))

(declare-fun lt!319477 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!204522 (= res!171385 (or (not (= (size!4547 (buf!5052 (_2!9400 lt!319476))) (size!4547 (buf!5052 thiss!1204)))) (not (= lt!319477 (bvsub (bvadd lt!319473 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!204523 () Bool)

(declare-fun e!140045 () Bool)

(declare-fun array_inv!4288 (array!10342) Bool)

(assert (=> b!204523 (= e!140045 (array_inv!4288 (buf!5052 thiss!1204)))))

(declare-fun b!204524 () Bool)

(declare-fun e!140041 () Bool)

(declare-fun e!140040 () Bool)

(assert (=> b!204524 (= e!140041 e!140040)))

(declare-fun res!171392 () Bool)

(assert (=> b!204524 (=> (not res!171392) (not e!140040))))

(declare-datatypes ((tuple2!17498 0))(
  ( (tuple2!17499 (_1!9401 BitStream!8202) (_2!9401 Bool)) )
))
(declare-fun lt!319475 () tuple2!17498)

(assert (=> b!204524 (= res!171392 (and (= (_2!9401 lt!319475) lt!319469) (= (_1!9401 lt!319475) (_2!9400 lt!319478))))))

(declare-fun readBitPure!0 (BitStream!8202) tuple2!17498)

(declare-fun readerFrom!0 (BitStream!8202 (_ BitVec 32) (_ BitVec 32)) BitStream!8202)

(assert (=> b!204524 (= lt!319475 (readBitPure!0 (readerFrom!0 (_2!9400 lt!319478) (currentBit!9532 thiss!1204) (currentByte!9537 thiss!1204))))))

(declare-fun b!204525 () Bool)

(declare-fun res!171394 () Bool)

(assert (=> b!204525 (=> (not res!171394) (not e!140046))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204525 (= res!171394 (validate_offset_bits!1 ((_ sign_extend 32) (size!4547 (buf!5052 thiss!1204))) ((_ sign_extend 32) (currentByte!9537 thiss!1204)) ((_ sign_extend 32) (currentBit!9532 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204527 () Bool)

(declare-fun res!171386 () Bool)

(assert (=> b!204527 (=> res!171386 e!140044)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204527 (= res!171386 (not (invariant!0 (currentBit!9532 (_2!9400 lt!319476)) (currentByte!9537 (_2!9400 lt!319476)) (size!4547 (buf!5052 (_2!9400 lt!319476))))))))

(declare-fun b!204528 () Bool)

(assert (=> b!204528 (= e!140039 e!140044)))

(declare-fun res!171393 () Bool)

(assert (=> b!204528 (=> res!171393 e!140044)))

(assert (=> b!204528 (= res!171393 (not (= lt!319477 (bvsub (bvsub (bvadd lt!319472 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!204528 (= lt!319477 (bitIndex!0 (size!4547 (buf!5052 (_2!9400 lt!319476))) (currentByte!9537 (_2!9400 lt!319476)) (currentBit!9532 (_2!9400 lt!319476))))))

(assert (=> b!204528 (isPrefixOf!0 thiss!1204 (_2!9400 lt!319476))))

(declare-fun lt!319470 () Unit!14585)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8202 BitStream!8202 BitStream!8202) Unit!14585)

(assert (=> b!204528 (= lt!319470 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9400 lt!319478) (_2!9400 lt!319476)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8202 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17496)

(assert (=> b!204528 (= lt!319476 (appendBitsLSBFirstLoopTR!0 (_2!9400 lt!319478) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204529 () Bool)

(declare-fun res!171387 () Bool)

(assert (=> b!204529 (=> (not res!171387) (not e!140046))))

(assert (=> b!204529 (= res!171387 (not (= i!590 nBits!348)))))

(declare-fun b!204530 () Bool)

(declare-fun res!171397 () Bool)

(assert (=> b!204530 (=> res!171397 e!140044)))

(assert (=> b!204530 (= res!171397 (not (isPrefixOf!0 thiss!1204 (_2!9400 lt!319478))))))

(declare-fun b!204531 () Bool)

(declare-fun lt!319471 () (_ BitVec 64))

(assert (=> b!204531 (= e!140040 (= (bitIndex!0 (size!4547 (buf!5052 (_1!9401 lt!319475))) (currentByte!9537 (_1!9401 lt!319475)) (currentBit!9532 (_1!9401 lt!319475))) lt!319471))))

(declare-fun b!204532 () Bool)

(assert (=> b!204532 (= e!140044 (= (size!4547 (buf!5052 (_2!9400 lt!319478))) (size!4547 (buf!5052 (_2!9400 lt!319476)))))))

(assert (=> b!204532 (invariant!0 (currentBit!9532 thiss!1204) (currentByte!9537 thiss!1204) (size!4547 (buf!5052 (_2!9400 lt!319478))))))

(declare-fun res!171391 () Bool)

(assert (=> start!43340 (=> (not res!171391) (not e!140046))))

(assert (=> start!43340 (= res!171391 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43340 e!140046))

(assert (=> start!43340 true))

(declare-fun inv!12 (BitStream!8202) Bool)

(assert (=> start!43340 (and (inv!12 thiss!1204) e!140045)))

(declare-fun b!204526 () Bool)

(assert (=> b!204526 (= e!140042 e!140041)))

(declare-fun res!171395 () Bool)

(assert (=> b!204526 (=> (not res!171395) (not e!140041))))

(declare-fun lt!319474 () (_ BitVec 64))

(assert (=> b!204526 (= res!171395 (= lt!319471 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319474)))))

(assert (=> b!204526 (= lt!319471 (bitIndex!0 (size!4547 (buf!5052 (_2!9400 lt!319478))) (currentByte!9537 (_2!9400 lt!319478)) (currentBit!9532 (_2!9400 lt!319478))))))

(assert (=> b!204526 (= lt!319474 (bitIndex!0 (size!4547 (buf!5052 thiss!1204)) (currentByte!9537 thiss!1204) (currentBit!9532 thiss!1204)))))

(declare-fun b!204533 () Bool)

(declare-fun res!171398 () Bool)

(assert (=> b!204533 (=> (not res!171398) (not e!140046))))

(assert (=> b!204533 (= res!171398 (invariant!0 (currentBit!9532 thiss!1204) (currentByte!9537 thiss!1204) (size!4547 (buf!5052 thiss!1204))))))

(declare-fun b!204534 () Bool)

(declare-fun res!171390 () Bool)

(assert (=> b!204534 (=> (not res!171390) (not e!140041))))

(assert (=> b!204534 (= res!171390 (isPrefixOf!0 thiss!1204 (_2!9400 lt!319478)))))

(assert (= (and start!43340 res!171391) b!204525))

(assert (= (and b!204525 res!171394) b!204533))

(assert (= (and b!204533 res!171398) b!204529))

(assert (= (and b!204529 res!171387) b!204520))

(assert (= (and b!204520 res!171388) b!204526))

(assert (= (and b!204526 res!171395) b!204534))

(assert (= (and b!204534 res!171390) b!204524))

(assert (= (and b!204524 res!171392) b!204531))

(assert (= (and b!204520 (not res!171396)) b!204528))

(assert (= (and b!204528 (not res!171393)) b!204527))

(assert (= (and b!204527 (not res!171386)) b!204522))

(assert (= (and b!204522 (not res!171385)) b!204521))

(assert (= (and b!204521 (not res!171389)) b!204530))

(assert (= (and b!204530 (not res!171397)) b!204532))

(assert (= start!43340 b!204523))

(declare-fun m!315633 () Bool)

(assert (=> b!204520 m!315633))

(declare-fun m!315635 () Bool)

(assert (=> b!204520 m!315635))

(declare-fun m!315637 () Bool)

(assert (=> b!204520 m!315637))

(assert (=> b!204526 m!315633))

(assert (=> b!204526 m!315635))

(declare-fun m!315639 () Bool)

(assert (=> b!204521 m!315639))

(declare-fun m!315641 () Bool)

(assert (=> b!204530 m!315641))

(declare-fun m!315643 () Bool)

(assert (=> b!204531 m!315643))

(declare-fun m!315645 () Bool)

(assert (=> b!204525 m!315645))

(declare-fun m!315647 () Bool)

(assert (=> b!204532 m!315647))

(declare-fun m!315649 () Bool)

(assert (=> start!43340 m!315649))

(declare-fun m!315651 () Bool)

(assert (=> b!204528 m!315651))

(declare-fun m!315653 () Bool)

(assert (=> b!204528 m!315653))

(declare-fun m!315655 () Bool)

(assert (=> b!204528 m!315655))

(declare-fun m!315657 () Bool)

(assert (=> b!204528 m!315657))

(declare-fun m!315659 () Bool)

(assert (=> b!204533 m!315659))

(declare-fun m!315661 () Bool)

(assert (=> b!204524 m!315661))

(assert (=> b!204524 m!315661))

(declare-fun m!315663 () Bool)

(assert (=> b!204524 m!315663))

(assert (=> b!204534 m!315641))

(declare-fun m!315665 () Bool)

(assert (=> b!204527 m!315665))

(declare-fun m!315667 () Bool)

(assert (=> b!204523 m!315667))

(check-sat (not b!204533) (not b!204520) (not b!204524) (not b!204527) (not b!204531) (not b!204526) (not b!204532) (not b!204525) (not b!204521) (not b!204528) (not b!204523) (not b!204534) (not start!43340) (not b!204530))
