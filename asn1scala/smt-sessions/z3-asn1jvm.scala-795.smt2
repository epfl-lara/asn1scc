; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22990 () Bool)

(assert start!22990)

(declare-fun b!116558 () Bool)

(declare-fun res!96381 () Bool)

(declare-fun e!76410 () Bool)

(assert (=> b!116558 (=> (not res!96381) (not e!76410))))

(declare-datatypes ((array!5254 0))(
  ( (array!5255 (arr!2977 (Array (_ BitVec 32) (_ BitVec 8))) (size!2384 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4242 0))(
  ( (BitStream!4243 (buf!2794 array!5254) (currentByte!5431 (_ BitVec 32)) (currentBit!5426 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4242)

(declare-datatypes ((Unit!7173 0))(
  ( (Unit!7174) )
))
(declare-datatypes ((tuple2!9672 0))(
  ( (tuple2!9673 (_1!5101 Unit!7173) (_2!5101 BitStream!4242)) )
))
(declare-fun lt!178119 () tuple2!9672)

(declare-fun isPrefixOf!0 (BitStream!4242 BitStream!4242) Bool)

(assert (=> b!116558 (= res!96381 (isPrefixOf!0 thiss!1305 (_2!5101 lt!178119)))))

(declare-fun b!116559 () Bool)

(declare-fun e!76406 () Bool)

(declare-datatypes ((tuple2!9674 0))(
  ( (tuple2!9675 (_1!5102 BitStream!4242) (_2!5102 Bool)) )
))
(declare-fun lt!178120 () tuple2!9674)

(declare-fun lt!178112 () tuple2!9674)

(assert (=> b!116559 (= e!76406 (= (_2!5102 lt!178120) (_2!5102 lt!178112)))))

(declare-fun b!116560 () Bool)

(declare-fun e!76405 () Bool)

(declare-fun lt!178118 () tuple2!9674)

(declare-fun lt!178124 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116560 (= e!76405 (= (bitIndex!0 (size!2384 (buf!2794 (_1!5102 lt!178118))) (currentByte!5431 (_1!5102 lt!178118)) (currentBit!5426 (_1!5102 lt!178118))) lt!178124))))

(declare-fun b!116561 () Bool)

(declare-fun e!76411 () Bool)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116561 (= e!76411 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9676 0))(
  ( (tuple2!9677 (_1!5103 BitStream!4242) (_2!5103 (_ BitVec 64))) )
))
(declare-fun lt!178111 () tuple2!9676)

(declare-datatypes ((tuple2!9678 0))(
  ( (tuple2!9679 (_1!5104 BitStream!4242) (_2!5104 BitStream!4242)) )
))
(declare-fun lt!178114 () tuple2!9678)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9676)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116561 (= lt!178111 (readNLeastSignificantBitsLoopPure!0 (_1!5104 lt!178114) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!178117 () tuple2!9672)

(declare-fun lt!178113 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116561 (validate_offset_bits!1 ((_ sign_extend 32) (size!2384 (buf!2794 (_2!5101 lt!178117)))) ((_ sign_extend 32) (currentByte!5431 thiss!1305)) ((_ sign_extend 32) (currentBit!5426 thiss!1305)) lt!178113)))

(declare-fun lt!178116 () Unit!7173)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4242 array!5254 (_ BitVec 64)) Unit!7173)

(assert (=> b!116561 (= lt!178116 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2794 (_2!5101 lt!178117)) lt!178113))))

(declare-fun lt!178125 () Bool)

(declare-fun readBitPure!0 (BitStream!4242) tuple2!9674)

(assert (=> b!116561 (= (_2!5102 (readBitPure!0 (_1!5104 lt!178114))) lt!178125)))

(declare-fun lt!178110 () tuple2!9678)

(declare-fun reader!0 (BitStream!4242 BitStream!4242) tuple2!9678)

(assert (=> b!116561 (= lt!178110 (reader!0 (_2!5101 lt!178119) (_2!5101 lt!178117)))))

(assert (=> b!116561 (= lt!178114 (reader!0 thiss!1305 (_2!5101 lt!178117)))))

(assert (=> b!116561 e!76406))

(declare-fun res!96380 () Bool)

(assert (=> b!116561 (=> (not res!96380) (not e!76406))))

(assert (=> b!116561 (= res!96380 (= (bitIndex!0 (size!2384 (buf!2794 (_1!5102 lt!178120))) (currentByte!5431 (_1!5102 lt!178120)) (currentBit!5426 (_1!5102 lt!178120))) (bitIndex!0 (size!2384 (buf!2794 (_1!5102 lt!178112))) (currentByte!5431 (_1!5102 lt!178112)) (currentBit!5426 (_1!5102 lt!178112)))))))

(declare-fun lt!178122 () Unit!7173)

(declare-fun lt!178121 () BitStream!4242)

(declare-fun readBitPrefixLemma!0 (BitStream!4242 BitStream!4242) Unit!7173)

(assert (=> b!116561 (= lt!178122 (readBitPrefixLemma!0 lt!178121 (_2!5101 lt!178117)))))

(assert (=> b!116561 (= lt!178112 (readBitPure!0 (BitStream!4243 (buf!2794 (_2!5101 lt!178117)) (currentByte!5431 thiss!1305) (currentBit!5426 thiss!1305))))))

(assert (=> b!116561 (= lt!178120 (readBitPure!0 lt!178121))))

(assert (=> b!116561 (= lt!178121 (BitStream!4243 (buf!2794 (_2!5101 lt!178119)) (currentByte!5431 thiss!1305) (currentBit!5426 thiss!1305)))))

(declare-fun e!76408 () Bool)

(assert (=> b!116561 e!76408))

(declare-fun res!96382 () Bool)

(assert (=> b!116561 (=> (not res!96382) (not e!76408))))

(assert (=> b!116561 (= res!96382 (isPrefixOf!0 thiss!1305 (_2!5101 lt!178117)))))

(declare-fun lt!178123 () Unit!7173)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4242 BitStream!4242 BitStream!4242) Unit!7173)

(assert (=> b!116561 (= lt!178123 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5101 lt!178119) (_2!5101 lt!178117)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4242 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9672)

(assert (=> b!116561 (= lt!178117 (appendNLeastSignificantBitsLoop!0 (_2!5101 lt!178119) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76413 () Bool)

(assert (=> b!116561 e!76413))

(declare-fun res!96389 () Bool)

(assert (=> b!116561 (=> (not res!96389) (not e!76413))))

(assert (=> b!116561 (= res!96389 (= (size!2384 (buf!2794 thiss!1305)) (size!2384 (buf!2794 (_2!5101 lt!178119)))))))

(declare-fun appendBit!0 (BitStream!4242 Bool) tuple2!9672)

(assert (=> b!116561 (= lt!178119 (appendBit!0 thiss!1305 lt!178125))))

(assert (=> b!116561 (= lt!178125 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116562 () Bool)

(assert (=> b!116562 (= e!76410 e!76405)))

(declare-fun res!96385 () Bool)

(assert (=> b!116562 (=> (not res!96385) (not e!76405))))

(assert (=> b!116562 (= res!96385 (and (= (_2!5102 lt!178118) lt!178125) (= (_1!5102 lt!178118) (_2!5101 lt!178119))))))

(declare-fun readerFrom!0 (BitStream!4242 (_ BitVec 32) (_ BitVec 32)) BitStream!4242)

(assert (=> b!116562 (= lt!178118 (readBitPure!0 (readerFrom!0 (_2!5101 lt!178119) (currentBit!5426 thiss!1305) (currentByte!5431 thiss!1305))))))

(declare-fun b!116563 () Bool)

(declare-fun res!96388 () Bool)

(assert (=> b!116563 (=> (not res!96388) (not e!76411))))

(assert (=> b!116563 (= res!96388 (bvslt i!615 nBits!396))))

(declare-fun b!116564 () Bool)

(declare-fun e!76409 () Bool)

(declare-fun array_inv!2186 (array!5254) Bool)

(assert (=> b!116564 (= e!76409 (array_inv!2186 (buf!2794 thiss!1305)))))

(declare-fun b!116565 () Bool)

(declare-fun res!96390 () Bool)

(assert (=> b!116565 (=> (not res!96390) (not e!76411))))

(assert (=> b!116565 (= res!96390 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116567 () Bool)

(declare-fun res!96386 () Bool)

(assert (=> b!116567 (=> (not res!96386) (not e!76408))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116567 (= res!96386 (invariant!0 (currentBit!5426 thiss!1305) (currentByte!5431 thiss!1305) (size!2384 (buf!2794 (_2!5101 lt!178119)))))))

(declare-fun res!96383 () Bool)

(declare-fun e!76407 () Bool)

(assert (=> start!22990 (=> (not res!96383) (not e!76407))))

(assert (=> start!22990 (= res!96383 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22990 e!76407))

(assert (=> start!22990 true))

(declare-fun inv!12 (BitStream!4242) Bool)

(assert (=> start!22990 (and (inv!12 thiss!1305) e!76409)))

(declare-fun b!116566 () Bool)

(assert (=> b!116566 (= e!76407 e!76411)))

(declare-fun res!96387 () Bool)

(assert (=> b!116566 (=> (not res!96387) (not e!76411))))

(assert (=> b!116566 (= res!96387 (validate_offset_bits!1 ((_ sign_extend 32) (size!2384 (buf!2794 thiss!1305))) ((_ sign_extend 32) (currentByte!5431 thiss!1305)) ((_ sign_extend 32) (currentBit!5426 thiss!1305)) lt!178113))))

(assert (=> b!116566 (= lt!178113 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116568 () Bool)

(assert (=> b!116568 (= e!76413 e!76410)))

(declare-fun res!96384 () Bool)

(assert (=> b!116568 (=> (not res!96384) (not e!76410))))

(declare-fun lt!178115 () (_ BitVec 64))

(assert (=> b!116568 (= res!96384 (= lt!178124 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178115)))))

(assert (=> b!116568 (= lt!178124 (bitIndex!0 (size!2384 (buf!2794 (_2!5101 lt!178119))) (currentByte!5431 (_2!5101 lt!178119)) (currentBit!5426 (_2!5101 lt!178119))))))

(assert (=> b!116568 (= lt!178115 (bitIndex!0 (size!2384 (buf!2794 thiss!1305)) (currentByte!5431 thiss!1305) (currentBit!5426 thiss!1305)))))

(declare-fun b!116569 () Bool)

(assert (=> b!116569 (= e!76408 (invariant!0 (currentBit!5426 thiss!1305) (currentByte!5431 thiss!1305) (size!2384 (buf!2794 (_2!5101 lt!178117)))))))

(assert (= (and start!22990 res!96383) b!116566))

(assert (= (and b!116566 res!96387) b!116565))

(assert (= (and b!116565 res!96390) b!116563))

(assert (= (and b!116563 res!96388) b!116561))

(assert (= (and b!116561 res!96389) b!116568))

(assert (= (and b!116568 res!96384) b!116558))

(assert (= (and b!116558 res!96381) b!116562))

(assert (= (and b!116562 res!96385) b!116560))

(assert (= (and b!116561 res!96382) b!116567))

(assert (= (and b!116567 res!96386) b!116569))

(assert (= (and b!116561 res!96380) b!116559))

(assert (= start!22990 b!116564))

(declare-fun m!174547 () Bool)

(assert (=> b!116567 m!174547))

(declare-fun m!174549 () Bool)

(assert (=> b!116565 m!174549))

(declare-fun m!174551 () Bool)

(assert (=> b!116564 m!174551))

(declare-fun m!174553 () Bool)

(assert (=> b!116558 m!174553))

(declare-fun m!174555 () Bool)

(assert (=> b!116561 m!174555))

(declare-fun m!174557 () Bool)

(assert (=> b!116561 m!174557))

(declare-fun m!174559 () Bool)

(assert (=> b!116561 m!174559))

(declare-fun m!174561 () Bool)

(assert (=> b!116561 m!174561))

(declare-fun m!174563 () Bool)

(assert (=> b!116561 m!174563))

(declare-fun m!174565 () Bool)

(assert (=> b!116561 m!174565))

(declare-fun m!174567 () Bool)

(assert (=> b!116561 m!174567))

(declare-fun m!174569 () Bool)

(assert (=> b!116561 m!174569))

(declare-fun m!174571 () Bool)

(assert (=> b!116561 m!174571))

(declare-fun m!174573 () Bool)

(assert (=> b!116561 m!174573))

(declare-fun m!174575 () Bool)

(assert (=> b!116561 m!174575))

(declare-fun m!174577 () Bool)

(assert (=> b!116561 m!174577))

(declare-fun m!174579 () Bool)

(assert (=> b!116561 m!174579))

(declare-fun m!174581 () Bool)

(assert (=> b!116561 m!174581))

(declare-fun m!174583 () Bool)

(assert (=> b!116561 m!174583))

(declare-fun m!174585 () Bool)

(assert (=> b!116561 m!174585))

(declare-fun m!174587 () Bool)

(assert (=> b!116560 m!174587))

(declare-fun m!174589 () Bool)

(assert (=> b!116569 m!174589))

(declare-fun m!174591 () Bool)

(assert (=> start!22990 m!174591))

(declare-fun m!174593 () Bool)

(assert (=> b!116566 m!174593))

(declare-fun m!174595 () Bool)

(assert (=> b!116562 m!174595))

(assert (=> b!116562 m!174595))

(declare-fun m!174597 () Bool)

(assert (=> b!116562 m!174597))

(declare-fun m!174599 () Bool)

(assert (=> b!116568 m!174599))

(declare-fun m!174601 () Bool)

(assert (=> b!116568 m!174601))

(check-sat (not b!116564) (not start!22990) (not b!116560) (not b!116569) (not b!116567) (not b!116568) (not b!116566) (not b!116558) (not b!116565) (not b!116562) (not b!116561))
(check-sat)
