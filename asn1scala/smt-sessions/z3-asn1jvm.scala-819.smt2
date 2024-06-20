; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24178 () Bool)

(assert start!24178)

(declare-fun b!122659 () Bool)

(declare-fun e!80402 () Bool)

(declare-datatypes ((array!5428 0))(
  ( (array!5429 (arr!3049 (Array (_ BitVec 32) (_ BitVec 8))) (size!2456 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4386 0))(
  ( (BitStream!4387 (buf!2896 array!5428) (currentByte!5593 (_ BitVec 32)) (currentBit!5588 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10368 0))(
  ( (tuple2!10369 (_1!5449 BitStream!4386) (_2!5449 Bool)) )
))
(declare-fun lt!193053 () tuple2!10368)

(declare-fun lt!193050 () tuple2!10368)

(assert (=> b!122659 (= e!80402 (= (_2!5449 lt!193053) (_2!5449 lt!193050)))))

(declare-fun b!122660 () Bool)

(declare-fun res!101676 () Bool)

(declare-fun e!80397 () Bool)

(assert (=> b!122660 (=> (not res!101676) (not e!80397))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122660 (= res!101676 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun lt!193044 () (_ BitVec 64))

(declare-datatypes ((tuple2!10370 0))(
  ( (tuple2!10371 (_1!5450 BitStream!4386) (_2!5450 BitStream!4386)) )
))
(declare-fun lt!193052 () tuple2!10370)

(declare-fun lt!193035 () tuple2!10370)

(declare-fun e!80405 () Bool)

(declare-fun lt!193043 () (_ BitVec 64))

(declare-datatypes ((tuple2!10372 0))(
  ( (tuple2!10373 (_1!5451 BitStream!4386) (_2!5451 (_ BitVec 64))) )
))
(declare-fun lt!193060 () tuple2!10372)

(declare-fun lt!193048 () BitStream!4386)

(declare-fun lt!193041 () tuple2!10372)

(declare-fun b!122661 () Bool)

(assert (=> b!122661 (= e!80405 (and (= lt!193043 (bvsub lt!193044 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5450 lt!193052) lt!193048)) (and (= (_2!5451 lt!193060) (_2!5451 lt!193041)) (= (_1!5451 lt!193060) (_2!5450 lt!193035))))))))

(declare-fun b!122662 () Bool)

(declare-fun e!80396 () Bool)

(assert (=> b!122662 (= e!80396 e!80397)))

(declare-fun res!101670 () Bool)

(assert (=> b!122662 (=> (not res!101670) (not e!80397))))

(declare-fun thiss!1305 () BitStream!4386)

(declare-fun lt!193036 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122662 (= res!101670 (validate_offset_bits!1 ((_ sign_extend 32) (size!2456 (buf!2896 thiss!1305))) ((_ sign_extend 32) (currentByte!5593 thiss!1305)) ((_ sign_extend 32) (currentBit!5588 thiss!1305)) lt!193036))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!122662 (= lt!193036 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122663 () Bool)

(declare-fun e!80400 () Bool)

(declare-fun e!80398 () Bool)

(assert (=> b!122663 (= e!80400 e!80398)))

(declare-fun res!101669 () Bool)

(assert (=> b!122663 (=> (not res!101669) (not e!80398))))

(declare-fun lt!193046 () (_ BitVec 64))

(declare-fun lt!193037 () (_ BitVec 64))

(assert (=> b!122663 (= res!101669 (= lt!193046 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!193037)))))

(declare-datatypes ((Unit!7551 0))(
  ( (Unit!7552) )
))
(declare-datatypes ((tuple2!10374 0))(
  ( (tuple2!10375 (_1!5452 Unit!7551) (_2!5452 BitStream!4386)) )
))
(declare-fun lt!193051 () tuple2!10374)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122663 (= lt!193046 (bitIndex!0 (size!2456 (buf!2896 (_2!5452 lt!193051))) (currentByte!5593 (_2!5452 lt!193051)) (currentBit!5588 (_2!5452 lt!193051))))))

(assert (=> b!122663 (= lt!193037 (bitIndex!0 (size!2456 (buf!2896 thiss!1305)) (currentByte!5593 thiss!1305) (currentBit!5588 thiss!1305)))))

(declare-fun b!122664 () Bool)

(declare-fun e!80401 () Bool)

(assert (=> b!122664 (= e!80401 true)))

(assert (=> b!122664 e!80405))

(declare-fun res!101674 () Bool)

(assert (=> b!122664 (=> (not res!101674) (not e!80405))))

(declare-fun lt!193049 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4386 (_ BitVec 64)) BitStream!4386)

(assert (=> b!122664 (= res!101674 (= (_1!5450 lt!193052) (withMovedBitIndex!0 (_2!5450 lt!193052) (bvsub lt!193044 lt!193049))))))

(assert (=> b!122664 (= lt!193044 (bitIndex!0 (size!2456 (buf!2896 (_2!5452 lt!193051))) (currentByte!5593 (_2!5452 lt!193051)) (currentBit!5588 (_2!5452 lt!193051))))))

(assert (=> b!122664 (= (_1!5450 lt!193035) (withMovedBitIndex!0 (_2!5450 lt!193035) (bvsub lt!193043 lt!193049)))))

(declare-fun lt!193047 () tuple2!10374)

(assert (=> b!122664 (= lt!193049 (bitIndex!0 (size!2456 (buf!2896 (_2!5452 lt!193047))) (currentByte!5593 (_2!5452 lt!193047)) (currentBit!5588 (_2!5452 lt!193047))))))

(assert (=> b!122664 (= lt!193043 (bitIndex!0 (size!2456 (buf!2896 thiss!1305)) (currentByte!5593 thiss!1305) (currentBit!5588 thiss!1305)))))

(declare-fun lt!193055 () tuple2!10372)

(assert (=> b!122664 (and (= (_2!5451 lt!193060) (_2!5451 lt!193055)) (= (_1!5451 lt!193060) (_1!5451 lt!193055)))))

(declare-fun lt!193045 () Unit!7551)

(declare-fun lt!193057 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7551)

(assert (=> b!122664 (= lt!193045 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5450 lt!193035) nBits!396 i!615 lt!193057))))

(declare-fun lt!193034 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10372)

(assert (=> b!122664 (= lt!193055 (readNLeastSignificantBitsLoopPure!0 lt!193048 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193034))))

(assert (=> b!122664 (= lt!193048 (withMovedBitIndex!0 (_1!5450 lt!193035) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122665 () Bool)

(declare-fun e!80406 () Bool)

(declare-fun array_inv!2258 (array!5428) Bool)

(assert (=> b!122665 (= e!80406 (array_inv!2258 (buf!2896 thiss!1305)))))

(declare-fun b!122666 () Bool)

(declare-fun e!80403 () Bool)

(assert (=> b!122666 (= e!80398 e!80403)))

(declare-fun res!101664 () Bool)

(assert (=> b!122666 (=> (not res!101664) (not e!80403))))

(declare-fun lt!193039 () Bool)

(declare-fun lt!193054 () tuple2!10368)

(assert (=> b!122666 (= res!101664 (and (= (_2!5449 lt!193054) lt!193039) (= (_1!5449 lt!193054) (_2!5452 lt!193051))))))

(declare-fun readBitPure!0 (BitStream!4386) tuple2!10368)

(declare-fun readerFrom!0 (BitStream!4386 (_ BitVec 32) (_ BitVec 32)) BitStream!4386)

(assert (=> b!122666 (= lt!193054 (readBitPure!0 (readerFrom!0 (_2!5452 lt!193051) (currentBit!5588 thiss!1305) (currentByte!5593 thiss!1305))))))

(declare-fun b!122667 () Bool)

(declare-fun res!101671 () Bool)

(assert (=> b!122667 (=> (not res!101671) (not e!80398))))

(declare-fun isPrefixOf!0 (BitStream!4386 BitStream!4386) Bool)

(assert (=> b!122667 (= res!101671 (isPrefixOf!0 thiss!1305 (_2!5452 lt!193051)))))

(declare-fun b!122658 () Bool)

(assert (=> b!122658 (= e!80403 (= (bitIndex!0 (size!2456 (buf!2896 (_1!5449 lt!193054))) (currentByte!5593 (_1!5449 lt!193054)) (currentBit!5588 (_1!5449 lt!193054))) lt!193046))))

(declare-fun res!101668 () Bool)

(assert (=> start!24178 (=> (not res!101668) (not e!80396))))

(assert (=> start!24178 (= res!101668 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24178 e!80396))

(assert (=> start!24178 true))

(declare-fun inv!12 (BitStream!4386) Bool)

(assert (=> start!24178 (and (inv!12 thiss!1305) e!80406)))

(declare-fun b!122668 () Bool)

(declare-fun res!101673 () Bool)

(assert (=> b!122668 (=> (not res!101673) (not e!80397))))

(assert (=> b!122668 (= res!101673 (bvslt i!615 nBits!396))))

(declare-fun b!122669 () Bool)

(declare-fun res!101665 () Bool)

(declare-fun e!80404 () Bool)

(assert (=> b!122669 (=> (not res!101665) (not e!80404))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122669 (= res!101665 (invariant!0 (currentBit!5588 thiss!1305) (currentByte!5593 thiss!1305) (size!2456 (buf!2896 (_2!5452 lt!193051)))))))

(declare-fun b!122670 () Bool)

(assert (=> b!122670 (= e!80397 (not e!80401))))

(declare-fun res!101672 () Bool)

(assert (=> b!122670 (=> res!101672 e!80401)))

(assert (=> b!122670 (= res!101672 (not (= (_1!5451 lt!193041) (_2!5450 lt!193052))))))

(assert (=> b!122670 (= lt!193041 (readNLeastSignificantBitsLoopPure!0 (_1!5450 lt!193052) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193034))))

(declare-fun lt!193059 () (_ BitVec 64))

(assert (=> b!122670 (validate_offset_bits!1 ((_ sign_extend 32) (size!2456 (buf!2896 (_2!5452 lt!193047)))) ((_ sign_extend 32) (currentByte!5593 (_2!5452 lt!193051))) ((_ sign_extend 32) (currentBit!5588 (_2!5452 lt!193051))) lt!193059)))

(declare-fun lt!193061 () Unit!7551)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4386 array!5428 (_ BitVec 64)) Unit!7551)

(assert (=> b!122670 (= lt!193061 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5452 lt!193051) (buf!2896 (_2!5452 lt!193047)) lt!193059))))

(assert (=> b!122670 (= lt!193059 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!193042 () tuple2!10368)

(declare-fun lt!193062 () (_ BitVec 64))

(assert (=> b!122670 (= lt!193034 (bvor lt!193057 (ite (_2!5449 lt!193042) lt!193062 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122670 (= lt!193060 (readNLeastSignificantBitsLoopPure!0 (_1!5450 lt!193035) nBits!396 i!615 lt!193057))))

(assert (=> b!122670 (validate_offset_bits!1 ((_ sign_extend 32) (size!2456 (buf!2896 (_2!5452 lt!193047)))) ((_ sign_extend 32) (currentByte!5593 thiss!1305)) ((_ sign_extend 32) (currentBit!5588 thiss!1305)) lt!193036)))

(declare-fun lt!193038 () Unit!7551)

(assert (=> b!122670 (= lt!193038 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2896 (_2!5452 lt!193047)) lt!193036))))

(assert (=> b!122670 (= lt!193057 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!122670 (= (_2!5449 lt!193042) lt!193039)))

(assert (=> b!122670 (= lt!193042 (readBitPure!0 (_1!5450 lt!193035)))))

(declare-fun reader!0 (BitStream!4386 BitStream!4386) tuple2!10370)

(assert (=> b!122670 (= lt!193052 (reader!0 (_2!5452 lt!193051) (_2!5452 lt!193047)))))

(assert (=> b!122670 (= lt!193035 (reader!0 thiss!1305 (_2!5452 lt!193047)))))

(assert (=> b!122670 e!80402))

(declare-fun res!101667 () Bool)

(assert (=> b!122670 (=> (not res!101667) (not e!80402))))

(assert (=> b!122670 (= res!101667 (= (bitIndex!0 (size!2456 (buf!2896 (_1!5449 lt!193053))) (currentByte!5593 (_1!5449 lt!193053)) (currentBit!5588 (_1!5449 lt!193053))) (bitIndex!0 (size!2456 (buf!2896 (_1!5449 lt!193050))) (currentByte!5593 (_1!5449 lt!193050)) (currentBit!5588 (_1!5449 lt!193050)))))))

(declare-fun lt!193040 () Unit!7551)

(declare-fun lt!193058 () BitStream!4386)

(declare-fun readBitPrefixLemma!0 (BitStream!4386 BitStream!4386) Unit!7551)

(assert (=> b!122670 (= lt!193040 (readBitPrefixLemma!0 lt!193058 (_2!5452 lt!193047)))))

(assert (=> b!122670 (= lt!193050 (readBitPure!0 (BitStream!4387 (buf!2896 (_2!5452 lt!193047)) (currentByte!5593 thiss!1305) (currentBit!5588 thiss!1305))))))

(assert (=> b!122670 (= lt!193053 (readBitPure!0 lt!193058))))

(assert (=> b!122670 (= lt!193058 (BitStream!4387 (buf!2896 (_2!5452 lt!193051)) (currentByte!5593 thiss!1305) (currentBit!5588 thiss!1305)))))

(assert (=> b!122670 e!80404))

(declare-fun res!101666 () Bool)

(assert (=> b!122670 (=> (not res!101666) (not e!80404))))

(assert (=> b!122670 (= res!101666 (isPrefixOf!0 thiss!1305 (_2!5452 lt!193047)))))

(declare-fun lt!193056 () Unit!7551)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4386 BitStream!4386 BitStream!4386) Unit!7551)

(assert (=> b!122670 (= lt!193056 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5452 lt!193051) (_2!5452 lt!193047)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4386 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10374)

(assert (=> b!122670 (= lt!193047 (appendNLeastSignificantBitsLoop!0 (_2!5452 lt!193051) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122670 e!80400))

(declare-fun res!101675 () Bool)

(assert (=> b!122670 (=> (not res!101675) (not e!80400))))

(assert (=> b!122670 (= res!101675 (= (size!2456 (buf!2896 thiss!1305)) (size!2456 (buf!2896 (_2!5452 lt!193051)))))))

(declare-fun appendBit!0 (BitStream!4386 Bool) tuple2!10374)

(assert (=> b!122670 (= lt!193051 (appendBit!0 thiss!1305 lt!193039))))

(assert (=> b!122670 (= lt!193039 (not (= (bvand v!199 lt!193062) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122670 (= lt!193062 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122671 () Bool)

(assert (=> b!122671 (= e!80404 (invariant!0 (currentBit!5588 thiss!1305) (currentByte!5593 thiss!1305) (size!2456 (buf!2896 (_2!5452 lt!193047)))))))

(assert (= (and start!24178 res!101668) b!122662))

(assert (= (and b!122662 res!101670) b!122660))

(assert (= (and b!122660 res!101676) b!122668))

(assert (= (and b!122668 res!101673) b!122670))

(assert (= (and b!122670 res!101675) b!122663))

(assert (= (and b!122663 res!101669) b!122667))

(assert (= (and b!122667 res!101671) b!122666))

(assert (= (and b!122666 res!101664) b!122658))

(assert (= (and b!122670 res!101666) b!122669))

(assert (= (and b!122669 res!101665) b!122671))

(assert (= (and b!122670 res!101667) b!122659))

(assert (= (and b!122670 (not res!101672)) b!122664))

(assert (= (and b!122664 res!101674) b!122661))

(assert (= start!24178 b!122665))

(declare-fun m!186343 () Bool)

(assert (=> b!122667 m!186343))

(declare-fun m!186345 () Bool)

(assert (=> b!122666 m!186345))

(assert (=> b!122666 m!186345))

(declare-fun m!186347 () Bool)

(assert (=> b!122666 m!186347))

(declare-fun m!186349 () Bool)

(assert (=> b!122662 m!186349))

(declare-fun m!186351 () Bool)

(assert (=> b!122671 m!186351))

(declare-fun m!186353 () Bool)

(assert (=> b!122660 m!186353))

(declare-fun m!186355 () Bool)

(assert (=> start!24178 m!186355))

(declare-fun m!186357 () Bool)

(assert (=> b!122664 m!186357))

(declare-fun m!186359 () Bool)

(assert (=> b!122664 m!186359))

(declare-fun m!186361 () Bool)

(assert (=> b!122664 m!186361))

(declare-fun m!186363 () Bool)

(assert (=> b!122664 m!186363))

(declare-fun m!186365 () Bool)

(assert (=> b!122664 m!186365))

(declare-fun m!186367 () Bool)

(assert (=> b!122664 m!186367))

(declare-fun m!186369 () Bool)

(assert (=> b!122664 m!186369))

(declare-fun m!186371 () Bool)

(assert (=> b!122664 m!186371))

(declare-fun m!186373 () Bool)

(assert (=> b!122665 m!186373))

(declare-fun m!186375 () Bool)

(assert (=> b!122670 m!186375))

(declare-fun m!186377 () Bool)

(assert (=> b!122670 m!186377))

(declare-fun m!186379 () Bool)

(assert (=> b!122670 m!186379))

(declare-fun m!186381 () Bool)

(assert (=> b!122670 m!186381))

(declare-fun m!186383 () Bool)

(assert (=> b!122670 m!186383))

(declare-fun m!186385 () Bool)

(assert (=> b!122670 m!186385))

(declare-fun m!186387 () Bool)

(assert (=> b!122670 m!186387))

(declare-fun m!186389 () Bool)

(assert (=> b!122670 m!186389))

(declare-fun m!186391 () Bool)

(assert (=> b!122670 m!186391))

(declare-fun m!186393 () Bool)

(assert (=> b!122670 m!186393))

(declare-fun m!186395 () Bool)

(assert (=> b!122670 m!186395))

(declare-fun m!186397 () Bool)

(assert (=> b!122670 m!186397))

(declare-fun m!186399 () Bool)

(assert (=> b!122670 m!186399))

(declare-fun m!186401 () Bool)

(assert (=> b!122670 m!186401))

(declare-fun m!186403 () Bool)

(assert (=> b!122670 m!186403))

(declare-fun m!186405 () Bool)

(assert (=> b!122670 m!186405))

(declare-fun m!186407 () Bool)

(assert (=> b!122670 m!186407))

(declare-fun m!186409 () Bool)

(assert (=> b!122670 m!186409))

(declare-fun m!186411 () Bool)

(assert (=> b!122670 m!186411))

(assert (=> b!122663 m!186357))

(assert (=> b!122663 m!186371))

(declare-fun m!186413 () Bool)

(assert (=> b!122658 m!186413))

(declare-fun m!186415 () Bool)

(assert (=> b!122669 m!186415))

(check-sat (not b!122670) (not b!122666) (not b!122671) (not b!122662) (not b!122667) (not b!122665) (not b!122660) (not b!122664) (not start!24178) (not b!122663) (not b!122669) (not b!122658))
