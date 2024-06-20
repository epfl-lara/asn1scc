; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22996 () Bool)

(assert start!22996)

(declare-fun b!116666 () Bool)

(declare-fun e!76487 () Bool)

(declare-fun e!76486 () Bool)

(assert (=> b!116666 (= e!76487 e!76486)))

(declare-fun res!96483 () Bool)

(assert (=> b!116666 (=> (not res!96483) (not e!76486))))

(declare-datatypes ((array!5260 0))(
  ( (array!5261 (arr!2980 (Array (_ BitVec 32) (_ BitVec 8))) (size!2387 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4248 0))(
  ( (BitStream!4249 (buf!2797 array!5260) (currentByte!5434 (_ BitVec 32)) (currentBit!5429 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4248)

(declare-fun lt!178262 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116666 (= res!96483 (validate_offset_bits!1 ((_ sign_extend 32) (size!2387 (buf!2797 thiss!1305))) ((_ sign_extend 32) (currentByte!5434 thiss!1305)) ((_ sign_extend 32) (currentBit!5429 thiss!1305)) lt!178262))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116666 (= lt!178262 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!96489 () Bool)

(assert (=> start!22996 (=> (not res!96489) (not e!76487))))

(assert (=> start!22996 (= res!96489 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22996 e!76487))

(assert (=> start!22996 true))

(declare-fun e!76492 () Bool)

(declare-fun inv!12 (BitStream!4248) Bool)

(assert (=> start!22996 (and (inv!12 thiss!1305) e!76492)))

(declare-fun b!116667 () Bool)

(declare-fun e!76491 () Bool)

(declare-datatypes ((tuple2!9696 0))(
  ( (tuple2!9697 (_1!5113 BitStream!4248) (_2!5113 Bool)) )
))
(declare-fun lt!178267 () tuple2!9696)

(declare-fun lt!178269 () tuple2!9696)

(assert (=> b!116667 (= e!76491 (= (_2!5113 lt!178267) (_2!5113 lt!178269)))))

(declare-fun lt!178264 () (_ BitVec 32))

(declare-fun b!116668 () Bool)

(assert (=> b!116668 (= e!76486 (not (or (= lt!178264 #b00000000000000000000000000000000) (= lt!178264 (bvand (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(assert (=> b!116668 (= lt!178264 (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9698 0))(
  ( (tuple2!9699 (_1!5114 BitStream!4248) (_2!5114 BitStream!4248)) )
))
(declare-fun lt!178270 () tuple2!9698)

(declare-datatypes ((tuple2!9700 0))(
  ( (tuple2!9701 (_1!5115 BitStream!4248) (_2!5115 (_ BitVec 64))) )
))
(declare-fun lt!178274 () tuple2!9700)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9700)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116668 (= lt!178274 (readNLeastSignificantBitsLoopPure!0 (_1!5114 lt!178270) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-datatypes ((Unit!7179 0))(
  ( (Unit!7180) )
))
(declare-datatypes ((tuple2!9702 0))(
  ( (tuple2!9703 (_1!5116 Unit!7179) (_2!5116 BitStream!4248)) )
))
(declare-fun lt!178263 () tuple2!9702)

(assert (=> b!116668 (validate_offset_bits!1 ((_ sign_extend 32) (size!2387 (buf!2797 (_2!5116 lt!178263)))) ((_ sign_extend 32) (currentByte!5434 thiss!1305)) ((_ sign_extend 32) (currentBit!5429 thiss!1305)) lt!178262)))

(declare-fun lt!178272 () Unit!7179)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4248 array!5260 (_ BitVec 64)) Unit!7179)

(assert (=> b!116668 (= lt!178272 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2797 (_2!5116 lt!178263)) lt!178262))))

(declare-fun lt!178266 () Bool)

(declare-fun readBitPure!0 (BitStream!4248) tuple2!9696)

(assert (=> b!116668 (= (_2!5113 (readBitPure!0 (_1!5114 lt!178270))) lt!178266)))

(declare-fun lt!178268 () tuple2!9698)

(declare-fun lt!178273 () tuple2!9702)

(declare-fun reader!0 (BitStream!4248 BitStream!4248) tuple2!9698)

(assert (=> b!116668 (= lt!178268 (reader!0 (_2!5116 lt!178273) (_2!5116 lt!178263)))))

(assert (=> b!116668 (= lt!178270 (reader!0 thiss!1305 (_2!5116 lt!178263)))))

(assert (=> b!116668 e!76491))

(declare-fun res!96479 () Bool)

(assert (=> b!116668 (=> (not res!96479) (not e!76491))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116668 (= res!96479 (= (bitIndex!0 (size!2387 (buf!2797 (_1!5113 lt!178267))) (currentByte!5434 (_1!5113 lt!178267)) (currentBit!5429 (_1!5113 lt!178267))) (bitIndex!0 (size!2387 (buf!2797 (_1!5113 lt!178269))) (currentByte!5434 (_1!5113 lt!178269)) (currentBit!5429 (_1!5113 lt!178269)))))))

(declare-fun lt!178271 () Unit!7179)

(declare-fun lt!178259 () BitStream!4248)

(declare-fun readBitPrefixLemma!0 (BitStream!4248 BitStream!4248) Unit!7179)

(assert (=> b!116668 (= lt!178271 (readBitPrefixLemma!0 lt!178259 (_2!5116 lt!178263)))))

(assert (=> b!116668 (= lt!178269 (readBitPure!0 (BitStream!4249 (buf!2797 (_2!5116 lt!178263)) (currentByte!5434 thiss!1305) (currentBit!5429 thiss!1305))))))

(assert (=> b!116668 (= lt!178267 (readBitPure!0 lt!178259))))

(assert (=> b!116668 (= lt!178259 (BitStream!4249 (buf!2797 (_2!5116 lt!178273)) (currentByte!5434 thiss!1305) (currentBit!5429 thiss!1305)))))

(declare-fun e!76488 () Bool)

(assert (=> b!116668 e!76488))

(declare-fun res!96488 () Bool)

(assert (=> b!116668 (=> (not res!96488) (not e!76488))))

(declare-fun isPrefixOf!0 (BitStream!4248 BitStream!4248) Bool)

(assert (=> b!116668 (= res!96488 (isPrefixOf!0 thiss!1305 (_2!5116 lt!178263)))))

(declare-fun lt!178265 () Unit!7179)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4248 BitStream!4248 BitStream!4248) Unit!7179)

(assert (=> b!116668 (= lt!178265 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5116 lt!178273) (_2!5116 lt!178263)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9702)

(assert (=> b!116668 (= lt!178263 (appendNLeastSignificantBitsLoop!0 (_2!5116 lt!178273) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76493 () Bool)

(assert (=> b!116668 e!76493))

(declare-fun res!96482 () Bool)

(assert (=> b!116668 (=> (not res!96482) (not e!76493))))

(assert (=> b!116668 (= res!96482 (= (size!2387 (buf!2797 thiss!1305)) (size!2387 (buf!2797 (_2!5116 lt!178273)))))))

(declare-fun appendBit!0 (BitStream!4248 Bool) tuple2!9702)

(assert (=> b!116668 (= lt!178273 (appendBit!0 thiss!1305 lt!178266))))

(assert (=> b!116668 (= lt!178266 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116669 () Bool)

(declare-fun res!96485 () Bool)

(assert (=> b!116669 (=> (not res!96485) (not e!76488))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116669 (= res!96485 (invariant!0 (currentBit!5429 thiss!1305) (currentByte!5434 thiss!1305) (size!2387 (buf!2797 (_2!5116 lt!178273)))))))

(declare-fun b!116670 () Bool)

(declare-fun res!96486 () Bool)

(assert (=> b!116670 (=> (not res!96486) (not e!76486))))

(assert (=> b!116670 (= res!96486 (bvslt i!615 nBits!396))))

(declare-fun b!116671 () Bool)

(declare-fun e!76494 () Bool)

(declare-fun e!76489 () Bool)

(assert (=> b!116671 (= e!76494 e!76489)))

(declare-fun res!96480 () Bool)

(assert (=> b!116671 (=> (not res!96480) (not e!76489))))

(declare-fun lt!178261 () tuple2!9696)

(assert (=> b!116671 (= res!96480 (and (= (_2!5113 lt!178261) lt!178266) (= (_1!5113 lt!178261) (_2!5116 lt!178273))))))

(declare-fun readerFrom!0 (BitStream!4248 (_ BitVec 32) (_ BitVec 32)) BitStream!4248)

(assert (=> b!116671 (= lt!178261 (readBitPure!0 (readerFrom!0 (_2!5116 lt!178273) (currentBit!5429 thiss!1305) (currentByte!5434 thiss!1305))))))

(declare-fun b!116672 () Bool)

(declare-fun res!96481 () Bool)

(assert (=> b!116672 (=> (not res!96481) (not e!76486))))

(assert (=> b!116672 (= res!96481 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116673 () Bool)

(declare-fun array_inv!2189 (array!5260) Bool)

(assert (=> b!116673 (= e!76492 (array_inv!2189 (buf!2797 thiss!1305)))))

(declare-fun b!116674 () Bool)

(assert (=> b!116674 (= e!76488 (invariant!0 (currentBit!5429 thiss!1305) (currentByte!5434 thiss!1305) (size!2387 (buf!2797 (_2!5116 lt!178263)))))))

(declare-fun b!116675 () Bool)

(declare-fun res!96484 () Bool)

(assert (=> b!116675 (=> (not res!96484) (not e!76494))))

(assert (=> b!116675 (= res!96484 (isPrefixOf!0 thiss!1305 (_2!5116 lt!178273)))))

(declare-fun b!116676 () Bool)

(declare-fun lt!178275 () (_ BitVec 64))

(assert (=> b!116676 (= e!76489 (= (bitIndex!0 (size!2387 (buf!2797 (_1!5113 lt!178261))) (currentByte!5434 (_1!5113 lt!178261)) (currentBit!5429 (_1!5113 lt!178261))) lt!178275))))

(declare-fun b!116677 () Bool)

(assert (=> b!116677 (= e!76493 e!76494)))

(declare-fun res!96487 () Bool)

(assert (=> b!116677 (=> (not res!96487) (not e!76494))))

(declare-fun lt!178260 () (_ BitVec 64))

(assert (=> b!116677 (= res!96487 (= lt!178275 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178260)))))

(assert (=> b!116677 (= lt!178275 (bitIndex!0 (size!2387 (buf!2797 (_2!5116 lt!178273))) (currentByte!5434 (_2!5116 lt!178273)) (currentBit!5429 (_2!5116 lt!178273))))))

(assert (=> b!116677 (= lt!178260 (bitIndex!0 (size!2387 (buf!2797 thiss!1305)) (currentByte!5434 thiss!1305) (currentBit!5429 thiss!1305)))))

(assert (= (and start!22996 res!96489) b!116666))

(assert (= (and b!116666 res!96483) b!116672))

(assert (= (and b!116672 res!96481) b!116670))

(assert (= (and b!116670 res!96486) b!116668))

(assert (= (and b!116668 res!96482) b!116677))

(assert (= (and b!116677 res!96487) b!116675))

(assert (= (and b!116675 res!96484) b!116671))

(assert (= (and b!116671 res!96480) b!116676))

(assert (= (and b!116668 res!96488) b!116669))

(assert (= (and b!116669 res!96485) b!116674))

(assert (= (and b!116668 res!96479) b!116667))

(assert (= start!22996 b!116673))

(declare-fun m!174715 () Bool)

(assert (=> b!116673 m!174715))

(declare-fun m!174717 () Bool)

(assert (=> b!116669 m!174717))

(declare-fun m!174719 () Bool)

(assert (=> b!116675 m!174719))

(declare-fun m!174721 () Bool)

(assert (=> start!22996 m!174721))

(declare-fun m!174723 () Bool)

(assert (=> b!116666 m!174723))

(declare-fun m!174725 () Bool)

(assert (=> b!116674 m!174725))

(declare-fun m!174727 () Bool)

(assert (=> b!116672 m!174727))

(declare-fun m!174729 () Bool)

(assert (=> b!116671 m!174729))

(assert (=> b!116671 m!174729))

(declare-fun m!174731 () Bool)

(assert (=> b!116671 m!174731))

(declare-fun m!174733 () Bool)

(assert (=> b!116668 m!174733))

(declare-fun m!174735 () Bool)

(assert (=> b!116668 m!174735))

(declare-fun m!174737 () Bool)

(assert (=> b!116668 m!174737))

(declare-fun m!174739 () Bool)

(assert (=> b!116668 m!174739))

(declare-fun m!174741 () Bool)

(assert (=> b!116668 m!174741))

(declare-fun m!174743 () Bool)

(assert (=> b!116668 m!174743))

(declare-fun m!174745 () Bool)

(assert (=> b!116668 m!174745))

(declare-fun m!174747 () Bool)

(assert (=> b!116668 m!174747))

(declare-fun m!174749 () Bool)

(assert (=> b!116668 m!174749))

(declare-fun m!174751 () Bool)

(assert (=> b!116668 m!174751))

(declare-fun m!174753 () Bool)

(assert (=> b!116668 m!174753))

(declare-fun m!174755 () Bool)

(assert (=> b!116668 m!174755))

(declare-fun m!174757 () Bool)

(assert (=> b!116668 m!174757))

(declare-fun m!174759 () Bool)

(assert (=> b!116668 m!174759))

(declare-fun m!174761 () Bool)

(assert (=> b!116668 m!174761))

(declare-fun m!174763 () Bool)

(assert (=> b!116668 m!174763))

(declare-fun m!174765 () Bool)

(assert (=> b!116677 m!174765))

(declare-fun m!174767 () Bool)

(assert (=> b!116677 m!174767))

(declare-fun m!174769 () Bool)

(assert (=> b!116676 m!174769))

(check-sat (not b!116675) (not b!116673) (not b!116671) (not b!116669) (not b!116666) (not b!116668) (not b!116674) (not b!116677) (not b!116672) (not b!116676) (not start!22996))
(check-sat)
