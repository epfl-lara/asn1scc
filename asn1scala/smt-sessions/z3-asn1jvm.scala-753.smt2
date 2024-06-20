; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21606 () Bool)

(assert start!21606)

(declare-fun b!108960 () Bool)

(declare-fun e!71362 () Bool)

(declare-datatypes ((array!4969 0))(
  ( (array!4970 (arr!2854 (Array (_ BitVec 32) (_ BitVec 8))) (size!2261 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3996 0))(
  ( (BitStream!3997 (buf!2652 array!4969) (currentByte!5188 (_ BitVec 32)) (currentBit!5183 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3996)

(declare-fun array_inv!2063 (array!4969) Bool)

(assert (=> b!108960 (= e!71362 (array_inv!2063 (buf!2652 thiss!1305)))))

(declare-fun b!108961 () Bool)

(declare-fun e!71364 () Bool)

(declare-fun e!71363 () Bool)

(assert (=> b!108961 (= e!71364 e!71363)))

(declare-fun res!89871 () Bool)

(assert (=> b!108961 (=> (not res!89871) (not e!71363))))

(declare-fun lt!164484 () (_ BitVec 64))

(declare-fun lt!164487 () (_ BitVec 64))

(assert (=> b!108961 (= res!89871 (= lt!164484 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164487)))))

(declare-datatypes ((Unit!6663 0))(
  ( (Unit!6664) )
))
(declare-datatypes ((tuple2!9020 0))(
  ( (tuple2!9021 (_1!4767 Unit!6663) (_2!4767 BitStream!3996)) )
))
(declare-fun lt!164483 () tuple2!9020)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108961 (= lt!164484 (bitIndex!0 (size!2261 (buf!2652 (_2!4767 lt!164483))) (currentByte!5188 (_2!4767 lt!164483)) (currentBit!5183 (_2!4767 lt!164483))))))

(assert (=> b!108961 (= lt!164487 (bitIndex!0 (size!2261 (buf!2652 thiss!1305)) (currentByte!5188 thiss!1305) (currentBit!5183 thiss!1305)))))

(declare-fun b!108962 () Bool)

(declare-fun e!71359 () Bool)

(assert (=> b!108962 (= e!71359 true)))

(declare-fun e!71366 () Bool)

(assert (=> b!108962 e!71366))

(declare-fun res!89870 () Bool)

(assert (=> b!108962 (=> (not res!89870) (not e!71366))))

(declare-fun lt!164490 () (_ BitVec 64))

(declare-datatypes ((tuple2!9022 0))(
  ( (tuple2!9023 (_1!4768 BitStream!3996) (_2!4768 BitStream!3996)) )
))
(declare-fun lt!164475 () tuple2!9022)

(declare-fun lt!164491 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3996 (_ BitVec 64)) BitStream!3996)

(assert (=> b!108962 (= res!89870 (= (_1!4768 lt!164475) (withMovedBitIndex!0 (_2!4768 lt!164475) (bvsub lt!164490 lt!164491))))))

(assert (=> b!108962 (= lt!164490 (bitIndex!0 (size!2261 (buf!2652 (_2!4767 lt!164483))) (currentByte!5188 (_2!4767 lt!164483)) (currentBit!5183 (_2!4767 lt!164483))))))

(declare-fun lt!164478 () tuple2!9022)

(declare-fun lt!164479 () (_ BitVec 64))

(assert (=> b!108962 (= (_1!4768 lt!164478) (withMovedBitIndex!0 (_2!4768 lt!164478) (bvsub lt!164479 lt!164491)))))

(declare-fun lt!164486 () tuple2!9020)

(assert (=> b!108962 (= lt!164491 (bitIndex!0 (size!2261 (buf!2652 (_2!4767 lt!164486))) (currentByte!5188 (_2!4767 lt!164486)) (currentBit!5183 (_2!4767 lt!164486))))))

(assert (=> b!108962 (= lt!164479 (bitIndex!0 (size!2261 (buf!2652 thiss!1305)) (currentByte!5188 thiss!1305) (currentBit!5183 thiss!1305)))))

(declare-datatypes ((tuple2!9024 0))(
  ( (tuple2!9025 (_1!4769 BitStream!3996) (_2!4769 (_ BitVec 64))) )
))
(declare-fun lt!164496 () tuple2!9024)

(declare-fun lt!164492 () tuple2!9024)

(assert (=> b!108962 (and (= (_2!4769 lt!164496) (_2!4769 lt!164492)) (= (_1!4769 lt!164496) (_1!4769 lt!164492)))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!164497 () (_ BitVec 64))

(declare-fun lt!164477 () Unit!6663)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6663)

(assert (=> b!108962 (= lt!164477 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4768 lt!164478) nBits!396 i!615 lt!164497))))

(declare-fun lt!164472 () (_ BitVec 64))

(declare-fun lt!164471 () BitStream!3996)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9024)

(assert (=> b!108962 (= lt!164492 (readNLeastSignificantBitsLoopPure!0 lt!164471 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164472))))

(assert (=> b!108962 (= lt!164471 (withMovedBitIndex!0 (_1!4768 lt!164478) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!89863 () Bool)

(declare-fun e!71360 () Bool)

(assert (=> start!21606 (=> (not res!89863) (not e!71360))))

(assert (=> start!21606 (= res!89863 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21606 e!71360))

(assert (=> start!21606 true))

(declare-fun inv!12 (BitStream!3996) Bool)

(assert (=> start!21606 (and (inv!12 thiss!1305) e!71362)))

(declare-fun b!108963 () Bool)

(declare-fun e!71358 () Bool)

(declare-datatypes ((tuple2!9026 0))(
  ( (tuple2!9027 (_1!4770 BitStream!3996) (_2!4770 Bool)) )
))
(declare-fun lt!164495 () tuple2!9026)

(assert (=> b!108963 (= e!71358 (= (bitIndex!0 (size!2261 (buf!2652 (_1!4770 lt!164495))) (currentByte!5188 (_1!4770 lt!164495)) (currentBit!5183 (_1!4770 lt!164495))) lt!164484))))

(declare-fun b!108964 () Bool)

(assert (=> b!108964 (= e!71363 e!71358)))

(declare-fun res!89874 () Bool)

(assert (=> b!108964 (=> (not res!89874) (not e!71358))))

(declare-fun lt!164493 () Bool)

(assert (=> b!108964 (= res!89874 (and (= (_2!4770 lt!164495) lt!164493) (= (_1!4770 lt!164495) (_2!4767 lt!164483))))))

(declare-fun readBitPure!0 (BitStream!3996) tuple2!9026)

(declare-fun readerFrom!0 (BitStream!3996 (_ BitVec 32) (_ BitVec 32)) BitStream!3996)

(assert (=> b!108964 (= lt!164495 (readBitPure!0 (readerFrom!0 (_2!4767 lt!164483) (currentBit!5183 thiss!1305) (currentByte!5188 thiss!1305))))))

(declare-fun b!108965 () Bool)

(declare-fun e!71365 () Bool)

(assert (=> b!108965 (= e!71360 e!71365)))

(declare-fun res!89865 () Bool)

(assert (=> b!108965 (=> (not res!89865) (not e!71365))))

(declare-fun lt!164481 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108965 (= res!89865 (validate_offset_bits!1 ((_ sign_extend 32) (size!2261 (buf!2652 thiss!1305))) ((_ sign_extend 32) (currentByte!5188 thiss!1305)) ((_ sign_extend 32) (currentBit!5183 thiss!1305)) lt!164481))))

(assert (=> b!108965 (= lt!164481 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun lt!164482 () tuple2!9024)

(declare-fun b!108966 () Bool)

(assert (=> b!108966 (= e!71366 (and (= lt!164479 (bvsub lt!164490 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4768 lt!164475) lt!164471)) (and (= (_2!4769 lt!164496) (_2!4769 lt!164482)) (= (_1!4769 lt!164496) (_2!4768 lt!164478))))))))

(declare-fun b!108967 () Bool)

(declare-fun res!89867 () Bool)

(assert (=> b!108967 (=> (not res!89867) (not e!71365))))

(assert (=> b!108967 (= res!89867 (bvslt i!615 nBits!396))))

(declare-fun b!108968 () Bool)

(declare-fun res!89869 () Bool)

(declare-fun e!71357 () Bool)

(assert (=> b!108968 (=> (not res!89869) (not e!71357))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108968 (= res!89869 (invariant!0 (currentBit!5183 thiss!1305) (currentByte!5188 thiss!1305) (size!2261 (buf!2652 (_2!4767 lt!164483)))))))

(declare-fun b!108969 () Bool)

(declare-fun res!89864 () Bool)

(assert (=> b!108969 (=> (not res!89864) (not e!71363))))

(declare-fun isPrefixOf!0 (BitStream!3996 BitStream!3996) Bool)

(assert (=> b!108969 (= res!89864 (isPrefixOf!0 thiss!1305 (_2!4767 lt!164483)))))

(declare-fun b!108970 () Bool)

(assert (=> b!108970 (= e!71365 (not e!71359))))

(declare-fun res!89866 () Bool)

(assert (=> b!108970 (=> res!89866 e!71359)))

(assert (=> b!108970 (= res!89866 (not (= (_1!4769 lt!164482) (_2!4768 lt!164475))))))

(assert (=> b!108970 (= lt!164482 (readNLeastSignificantBitsLoopPure!0 (_1!4768 lt!164475) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164472))))

(declare-fun lt!164485 () (_ BitVec 64))

(assert (=> b!108970 (validate_offset_bits!1 ((_ sign_extend 32) (size!2261 (buf!2652 (_2!4767 lt!164486)))) ((_ sign_extend 32) (currentByte!5188 (_2!4767 lt!164483))) ((_ sign_extend 32) (currentBit!5183 (_2!4767 lt!164483))) lt!164485)))

(declare-fun lt!164470 () Unit!6663)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3996 array!4969 (_ BitVec 64)) Unit!6663)

(assert (=> b!108970 (= lt!164470 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4767 lt!164483) (buf!2652 (_2!4767 lt!164486)) lt!164485))))

(assert (=> b!108970 (= lt!164485 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164473 () (_ BitVec 64))

(declare-fun lt!164489 () tuple2!9026)

(assert (=> b!108970 (= lt!164472 (bvor lt!164497 (ite (_2!4770 lt!164489) lt!164473 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108970 (= lt!164496 (readNLeastSignificantBitsLoopPure!0 (_1!4768 lt!164478) nBits!396 i!615 lt!164497))))

(assert (=> b!108970 (validate_offset_bits!1 ((_ sign_extend 32) (size!2261 (buf!2652 (_2!4767 lt!164486)))) ((_ sign_extend 32) (currentByte!5188 thiss!1305)) ((_ sign_extend 32) (currentBit!5183 thiss!1305)) lt!164481)))

(declare-fun lt!164480 () Unit!6663)

(assert (=> b!108970 (= lt!164480 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2652 (_2!4767 lt!164486)) lt!164481))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108970 (= lt!164497 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!108970 (= (_2!4770 lt!164489) lt!164493)))

(assert (=> b!108970 (= lt!164489 (readBitPure!0 (_1!4768 lt!164478)))))

(declare-fun reader!0 (BitStream!3996 BitStream!3996) tuple2!9022)

(assert (=> b!108970 (= lt!164475 (reader!0 (_2!4767 lt!164483) (_2!4767 lt!164486)))))

(assert (=> b!108970 (= lt!164478 (reader!0 thiss!1305 (_2!4767 lt!164486)))))

(declare-fun e!71356 () Bool)

(assert (=> b!108970 e!71356))

(declare-fun res!89875 () Bool)

(assert (=> b!108970 (=> (not res!89875) (not e!71356))))

(declare-fun lt!164498 () tuple2!9026)

(declare-fun lt!164494 () tuple2!9026)

(assert (=> b!108970 (= res!89875 (= (bitIndex!0 (size!2261 (buf!2652 (_1!4770 lt!164498))) (currentByte!5188 (_1!4770 lt!164498)) (currentBit!5183 (_1!4770 lt!164498))) (bitIndex!0 (size!2261 (buf!2652 (_1!4770 lt!164494))) (currentByte!5188 (_1!4770 lt!164494)) (currentBit!5183 (_1!4770 lt!164494)))))))

(declare-fun lt!164488 () Unit!6663)

(declare-fun lt!164474 () BitStream!3996)

(declare-fun readBitPrefixLemma!0 (BitStream!3996 BitStream!3996) Unit!6663)

(assert (=> b!108970 (= lt!164488 (readBitPrefixLemma!0 lt!164474 (_2!4767 lt!164486)))))

(assert (=> b!108970 (= lt!164494 (readBitPure!0 (BitStream!3997 (buf!2652 (_2!4767 lt!164486)) (currentByte!5188 thiss!1305) (currentBit!5183 thiss!1305))))))

(assert (=> b!108970 (= lt!164498 (readBitPure!0 lt!164474))))

(assert (=> b!108970 (= lt!164474 (BitStream!3997 (buf!2652 (_2!4767 lt!164483)) (currentByte!5188 thiss!1305) (currentBit!5183 thiss!1305)))))

(assert (=> b!108970 e!71357))

(declare-fun res!89873 () Bool)

(assert (=> b!108970 (=> (not res!89873) (not e!71357))))

(assert (=> b!108970 (= res!89873 (isPrefixOf!0 thiss!1305 (_2!4767 lt!164486)))))

(declare-fun lt!164476 () Unit!6663)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3996 BitStream!3996 BitStream!3996) Unit!6663)

(assert (=> b!108970 (= lt!164476 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4767 lt!164483) (_2!4767 lt!164486)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3996 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9020)

(assert (=> b!108970 (= lt!164486 (appendNLeastSignificantBitsLoop!0 (_2!4767 lt!164483) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!108970 e!71364))

(declare-fun res!89868 () Bool)

(assert (=> b!108970 (=> (not res!89868) (not e!71364))))

(assert (=> b!108970 (= res!89868 (= (size!2261 (buf!2652 thiss!1305)) (size!2261 (buf!2652 (_2!4767 lt!164483)))))))

(declare-fun appendBit!0 (BitStream!3996 Bool) tuple2!9020)

(assert (=> b!108970 (= lt!164483 (appendBit!0 thiss!1305 lt!164493))))

(assert (=> b!108970 (= lt!164493 (not (= (bvand v!199 lt!164473) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108970 (= lt!164473 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108971 () Bool)

(assert (=> b!108971 (= e!71357 (invariant!0 (currentBit!5183 thiss!1305) (currentByte!5188 thiss!1305) (size!2261 (buf!2652 (_2!4767 lt!164486)))))))

(declare-fun b!108972 () Bool)

(declare-fun res!89872 () Bool)

(assert (=> b!108972 (=> (not res!89872) (not e!71365))))

(assert (=> b!108972 (= res!89872 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108973 () Bool)

(assert (=> b!108973 (= e!71356 (= (_2!4770 lt!164498) (_2!4770 lt!164494)))))

(assert (= (and start!21606 res!89863) b!108965))

(assert (= (and b!108965 res!89865) b!108972))

(assert (= (and b!108972 res!89872) b!108967))

(assert (= (and b!108967 res!89867) b!108970))

(assert (= (and b!108970 res!89868) b!108961))

(assert (= (and b!108961 res!89871) b!108969))

(assert (= (and b!108969 res!89864) b!108964))

(assert (= (and b!108964 res!89874) b!108963))

(assert (= (and b!108970 res!89873) b!108968))

(assert (= (and b!108968 res!89869) b!108971))

(assert (= (and b!108970 res!89875) b!108973))

(assert (= (and b!108970 (not res!89866)) b!108962))

(assert (= (and b!108962 res!89870) b!108966))

(assert (= start!21606 b!108960))

(declare-fun m!161617 () Bool)

(assert (=> b!108969 m!161617))

(declare-fun m!161619 () Bool)

(assert (=> b!108970 m!161619))

(declare-fun m!161621 () Bool)

(assert (=> b!108970 m!161621))

(declare-fun m!161623 () Bool)

(assert (=> b!108970 m!161623))

(declare-fun m!161625 () Bool)

(assert (=> b!108970 m!161625))

(declare-fun m!161627 () Bool)

(assert (=> b!108970 m!161627))

(declare-fun m!161629 () Bool)

(assert (=> b!108970 m!161629))

(declare-fun m!161631 () Bool)

(assert (=> b!108970 m!161631))

(declare-fun m!161633 () Bool)

(assert (=> b!108970 m!161633))

(declare-fun m!161635 () Bool)

(assert (=> b!108970 m!161635))

(declare-fun m!161637 () Bool)

(assert (=> b!108970 m!161637))

(declare-fun m!161639 () Bool)

(assert (=> b!108970 m!161639))

(declare-fun m!161641 () Bool)

(assert (=> b!108970 m!161641))

(declare-fun m!161643 () Bool)

(assert (=> b!108970 m!161643))

(declare-fun m!161645 () Bool)

(assert (=> b!108970 m!161645))

(declare-fun m!161647 () Bool)

(assert (=> b!108970 m!161647))

(declare-fun m!161649 () Bool)

(assert (=> b!108970 m!161649))

(declare-fun m!161651 () Bool)

(assert (=> b!108970 m!161651))

(declare-fun m!161653 () Bool)

(assert (=> b!108970 m!161653))

(declare-fun m!161655 () Bool)

(assert (=> b!108970 m!161655))

(declare-fun m!161657 () Bool)

(assert (=> b!108972 m!161657))

(declare-fun m!161659 () Bool)

(assert (=> b!108964 m!161659))

(assert (=> b!108964 m!161659))

(declare-fun m!161661 () Bool)

(assert (=> b!108964 m!161661))

(declare-fun m!161663 () Bool)

(assert (=> b!108971 m!161663))

(declare-fun m!161665 () Bool)

(assert (=> b!108963 m!161665))

(declare-fun m!161667 () Bool)

(assert (=> b!108962 m!161667))

(declare-fun m!161669 () Bool)

(assert (=> b!108962 m!161669))

(declare-fun m!161671 () Bool)

(assert (=> b!108962 m!161671))

(declare-fun m!161673 () Bool)

(assert (=> b!108962 m!161673))

(declare-fun m!161675 () Bool)

(assert (=> b!108962 m!161675))

(declare-fun m!161677 () Bool)

(assert (=> b!108962 m!161677))

(declare-fun m!161679 () Bool)

(assert (=> b!108962 m!161679))

(declare-fun m!161681 () Bool)

(assert (=> b!108962 m!161681))

(declare-fun m!161683 () Bool)

(assert (=> start!21606 m!161683))

(declare-fun m!161685 () Bool)

(assert (=> b!108960 m!161685))

(assert (=> b!108961 m!161671))

(assert (=> b!108961 m!161681))

(declare-fun m!161687 () Bool)

(assert (=> b!108968 m!161687))

(declare-fun m!161689 () Bool)

(assert (=> b!108965 m!161689))

(check-sat (not b!108962) (not b!108971) (not start!21606) (not b!108969) (not b!108960) (not b!108964) (not b!108968) (not b!108970) (not b!108963) (not b!108972) (not b!108965) (not b!108961))
