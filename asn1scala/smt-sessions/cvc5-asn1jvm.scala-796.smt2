; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22994 () Bool)

(assert start!22994)

(declare-fun b!116630 () Bool)

(declare-fun e!76466 () Bool)

(declare-fun e!76461 () Bool)

(assert (=> b!116630 (= e!76466 e!76461)))

(declare-fun res!96450 () Bool)

(assert (=> b!116630 (=> (not res!96450) (not e!76461))))

(declare-datatypes ((array!5258 0))(
  ( (array!5259 (arr!2979 (Array (_ BitVec 32) (_ BitVec 8))) (size!2386 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4246 0))(
  ( (BitStream!4247 (buf!2796 array!5258) (currentByte!5433 (_ BitVec 32)) (currentBit!5428 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4246)

(declare-fun lt!178209 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116630 (= res!96450 (validate_offset_bits!1 ((_ sign_extend 32) (size!2386 (buf!2796 thiss!1305))) ((_ sign_extend 32) (currentByte!5433 thiss!1305)) ((_ sign_extend 32) (currentBit!5428 thiss!1305)) lt!178209))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116630 (= lt!178209 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116631 () Bool)

(declare-fun res!96449 () Bool)

(declare-fun e!76463 () Bool)

(assert (=> b!116631 (=> (not res!96449) (not e!76463))))

(declare-datatypes ((Unit!7177 0))(
  ( (Unit!7178) )
))
(declare-datatypes ((tuple2!9688 0))(
  ( (tuple2!9689 (_1!5109 Unit!7177) (_2!5109 BitStream!4246)) )
))
(declare-fun lt!178219 () tuple2!9688)

(declare-fun isPrefixOf!0 (BitStream!4246 BitStream!4246) Bool)

(assert (=> b!116631 (= res!96449 (isPrefixOf!0 thiss!1305 (_2!5109 lt!178219)))))

(declare-fun b!116632 () Bool)

(declare-fun res!96452 () Bool)

(assert (=> b!116632 (=> (not res!96452) (not e!76461))))

(assert (=> b!116632 (= res!96452 (bvslt i!615 nBits!396))))

(declare-fun b!116633 () Bool)

(declare-fun e!76467 () Bool)

(declare-datatypes ((tuple2!9690 0))(
  ( (tuple2!9691 (_1!5110 BitStream!4246) (_2!5110 Bool)) )
))
(declare-fun lt!178215 () tuple2!9690)

(declare-fun lt!178212 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116633 (= e!76467 (= (bitIndex!0 (size!2386 (buf!2796 (_1!5110 lt!178215))) (currentByte!5433 (_1!5110 lt!178215)) (currentBit!5428 (_1!5110 lt!178215))) lt!178212))))

(declare-fun b!116634 () Bool)

(declare-fun e!76459 () Bool)

(declare-fun lt!178223 () tuple2!9688)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116634 (= e!76459 (invariant!0 (currentBit!5428 thiss!1305) (currentByte!5433 thiss!1305) (size!2386 (buf!2796 (_2!5109 lt!178223)))))))

(declare-fun res!96448 () Bool)

(assert (=> start!22994 (=> (not res!96448) (not e!76466))))

(assert (=> start!22994 (= res!96448 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22994 e!76466))

(assert (=> start!22994 true))

(declare-fun e!76465 () Bool)

(declare-fun inv!12 (BitStream!4246) Bool)

(assert (=> start!22994 (and (inv!12 thiss!1305) e!76465)))

(declare-fun b!116635 () Bool)

(assert (=> b!116635 (= e!76463 e!76467)))

(declare-fun res!96446 () Bool)

(assert (=> b!116635 (=> (not res!96446) (not e!76467))))

(declare-fun lt!178210 () Bool)

(assert (=> b!116635 (= res!96446 (and (= (_2!5110 lt!178215) lt!178210) (= (_1!5110 lt!178215) (_2!5109 lt!178219))))))

(declare-fun readBitPure!0 (BitStream!4246) tuple2!9690)

(declare-fun readerFrom!0 (BitStream!4246 (_ BitVec 32) (_ BitVec 32)) BitStream!4246)

(assert (=> b!116635 (= lt!178215 (readBitPure!0 (readerFrom!0 (_2!5109 lt!178219) (currentBit!5428 thiss!1305) (currentByte!5433 thiss!1305))))))

(declare-fun b!116636 () Bool)

(declare-fun e!76460 () Bool)

(assert (=> b!116636 (= e!76460 e!76463)))

(declare-fun res!96456 () Bool)

(assert (=> b!116636 (=> (not res!96456) (not e!76463))))

(declare-fun lt!178213 () (_ BitVec 64))

(assert (=> b!116636 (= res!96456 (= lt!178212 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178213)))))

(assert (=> b!116636 (= lt!178212 (bitIndex!0 (size!2386 (buf!2796 (_2!5109 lt!178219))) (currentByte!5433 (_2!5109 lt!178219)) (currentBit!5428 (_2!5109 lt!178219))))))

(assert (=> b!116636 (= lt!178213 (bitIndex!0 (size!2386 (buf!2796 thiss!1305)) (currentByte!5433 thiss!1305) (currentBit!5428 thiss!1305)))))

(declare-fun b!116637 () Bool)

(declare-fun res!96451 () Bool)

(assert (=> b!116637 (=> (not res!96451) (not e!76461))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116637 (= res!96451 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116638 () Bool)

(declare-fun res!96453 () Bool)

(assert (=> b!116638 (=> (not res!96453) (not e!76459))))

(assert (=> b!116638 (= res!96453 (invariant!0 (currentBit!5428 thiss!1305) (currentByte!5433 thiss!1305) (size!2386 (buf!2796 (_2!5109 lt!178219)))))))

(declare-fun b!116639 () Bool)

(declare-fun array_inv!2188 (array!5258) Bool)

(assert (=> b!116639 (= e!76465 (array_inv!2188 (buf!2796 thiss!1305)))))

(declare-fun b!116640 () Bool)

(declare-fun e!76464 () Bool)

(declare-fun lt!178214 () tuple2!9690)

(declare-fun lt!178222 () tuple2!9690)

(assert (=> b!116640 (= e!76464 (= (_2!5110 lt!178214) (_2!5110 lt!178222)))))

(declare-fun lt!178220 () (_ BitVec 32))

(declare-fun b!116641 () Bool)

(assert (=> b!116641 (= e!76461 (not (or (= lt!178220 #b00000000000000000000000000000000) (= lt!178220 (bvand (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(assert (=> b!116641 (= lt!178220 (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))

(declare-datatypes ((tuple2!9692 0))(
  ( (tuple2!9693 (_1!5111 BitStream!4246) (_2!5111 (_ BitVec 64))) )
))
(declare-fun lt!178211 () tuple2!9692)

(declare-datatypes ((tuple2!9694 0))(
  ( (tuple2!9695 (_1!5112 BitStream!4246) (_2!5112 BitStream!4246)) )
))
(declare-fun lt!178218 () tuple2!9694)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9692)

(assert (=> b!116641 (= lt!178211 (readNLeastSignificantBitsLoopPure!0 (_1!5112 lt!178218) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!116641 (validate_offset_bits!1 ((_ sign_extend 32) (size!2386 (buf!2796 (_2!5109 lt!178223)))) ((_ sign_extend 32) (currentByte!5433 thiss!1305)) ((_ sign_extend 32) (currentBit!5428 thiss!1305)) lt!178209)))

(declare-fun lt!178217 () Unit!7177)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4246 array!5258 (_ BitVec 64)) Unit!7177)

(assert (=> b!116641 (= lt!178217 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2796 (_2!5109 lt!178223)) lt!178209))))

(assert (=> b!116641 (= (_2!5110 (readBitPure!0 (_1!5112 lt!178218))) lt!178210)))

(declare-fun lt!178216 () tuple2!9694)

(declare-fun reader!0 (BitStream!4246 BitStream!4246) tuple2!9694)

(assert (=> b!116641 (= lt!178216 (reader!0 (_2!5109 lt!178219) (_2!5109 lt!178223)))))

(assert (=> b!116641 (= lt!178218 (reader!0 thiss!1305 (_2!5109 lt!178223)))))

(assert (=> b!116641 e!76464))

(declare-fun res!96455 () Bool)

(assert (=> b!116641 (=> (not res!96455) (not e!76464))))

(assert (=> b!116641 (= res!96455 (= (bitIndex!0 (size!2386 (buf!2796 (_1!5110 lt!178214))) (currentByte!5433 (_1!5110 lt!178214)) (currentBit!5428 (_1!5110 lt!178214))) (bitIndex!0 (size!2386 (buf!2796 (_1!5110 lt!178222))) (currentByte!5433 (_1!5110 lt!178222)) (currentBit!5428 (_1!5110 lt!178222)))))))

(declare-fun lt!178224 () Unit!7177)

(declare-fun lt!178221 () BitStream!4246)

(declare-fun readBitPrefixLemma!0 (BitStream!4246 BitStream!4246) Unit!7177)

(assert (=> b!116641 (= lt!178224 (readBitPrefixLemma!0 lt!178221 (_2!5109 lt!178223)))))

(assert (=> b!116641 (= lt!178222 (readBitPure!0 (BitStream!4247 (buf!2796 (_2!5109 lt!178223)) (currentByte!5433 thiss!1305) (currentBit!5428 thiss!1305))))))

(assert (=> b!116641 (= lt!178214 (readBitPure!0 lt!178221))))

(assert (=> b!116641 (= lt!178221 (BitStream!4247 (buf!2796 (_2!5109 lt!178219)) (currentByte!5433 thiss!1305) (currentBit!5428 thiss!1305)))))

(assert (=> b!116641 e!76459))

(declare-fun res!96447 () Bool)

(assert (=> b!116641 (=> (not res!96447) (not e!76459))))

(assert (=> b!116641 (= res!96447 (isPrefixOf!0 thiss!1305 (_2!5109 lt!178223)))))

(declare-fun lt!178208 () Unit!7177)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4246 BitStream!4246 BitStream!4246) Unit!7177)

(assert (=> b!116641 (= lt!178208 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5109 lt!178219) (_2!5109 lt!178223)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4246 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9688)

(assert (=> b!116641 (= lt!178223 (appendNLeastSignificantBitsLoop!0 (_2!5109 lt!178219) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116641 e!76460))

(declare-fun res!96454 () Bool)

(assert (=> b!116641 (=> (not res!96454) (not e!76460))))

(assert (=> b!116641 (= res!96454 (= (size!2386 (buf!2796 thiss!1305)) (size!2386 (buf!2796 (_2!5109 lt!178219)))))))

(declare-fun appendBit!0 (BitStream!4246 Bool) tuple2!9688)

(assert (=> b!116641 (= lt!178219 (appendBit!0 thiss!1305 lt!178210))))

(assert (=> b!116641 (= lt!178210 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!22994 res!96448) b!116630))

(assert (= (and b!116630 res!96450) b!116637))

(assert (= (and b!116637 res!96451) b!116632))

(assert (= (and b!116632 res!96452) b!116641))

(assert (= (and b!116641 res!96454) b!116636))

(assert (= (and b!116636 res!96456) b!116631))

(assert (= (and b!116631 res!96449) b!116635))

(assert (= (and b!116635 res!96446) b!116633))

(assert (= (and b!116641 res!96447) b!116638))

(assert (= (and b!116638 res!96453) b!116634))

(assert (= (and b!116641 res!96455) b!116640))

(assert (= start!22994 b!116639))

(declare-fun m!174659 () Bool)

(assert (=> b!116636 m!174659))

(declare-fun m!174661 () Bool)

(assert (=> b!116636 m!174661))

(declare-fun m!174663 () Bool)

(assert (=> b!116634 m!174663))

(declare-fun m!174665 () Bool)

(assert (=> b!116639 m!174665))

(declare-fun m!174667 () Bool)

(assert (=> b!116637 m!174667))

(declare-fun m!174669 () Bool)

(assert (=> b!116630 m!174669))

(declare-fun m!174671 () Bool)

(assert (=> b!116631 m!174671))

(declare-fun m!174673 () Bool)

(assert (=> b!116638 m!174673))

(declare-fun m!174675 () Bool)

(assert (=> b!116633 m!174675))

(declare-fun m!174677 () Bool)

(assert (=> start!22994 m!174677))

(declare-fun m!174679 () Bool)

(assert (=> b!116641 m!174679))

(declare-fun m!174681 () Bool)

(assert (=> b!116641 m!174681))

(declare-fun m!174683 () Bool)

(assert (=> b!116641 m!174683))

(declare-fun m!174685 () Bool)

(assert (=> b!116641 m!174685))

(declare-fun m!174687 () Bool)

(assert (=> b!116641 m!174687))

(declare-fun m!174689 () Bool)

(assert (=> b!116641 m!174689))

(declare-fun m!174691 () Bool)

(assert (=> b!116641 m!174691))

(declare-fun m!174693 () Bool)

(assert (=> b!116641 m!174693))

(declare-fun m!174695 () Bool)

(assert (=> b!116641 m!174695))

(declare-fun m!174697 () Bool)

(assert (=> b!116641 m!174697))

(declare-fun m!174699 () Bool)

(assert (=> b!116641 m!174699))

(declare-fun m!174701 () Bool)

(assert (=> b!116641 m!174701))

(declare-fun m!174703 () Bool)

(assert (=> b!116641 m!174703))

(declare-fun m!174705 () Bool)

(assert (=> b!116641 m!174705))

(declare-fun m!174707 () Bool)

(assert (=> b!116641 m!174707))

(declare-fun m!174709 () Bool)

(assert (=> b!116641 m!174709))

(declare-fun m!174711 () Bool)

(assert (=> b!116635 m!174711))

(assert (=> b!116635 m!174711))

(declare-fun m!174713 () Bool)

(assert (=> b!116635 m!174713))

(push 1)

(assert (not b!116634))

(assert (not b!116635))

(assert (not b!116639))

(assert (not b!116637))

(assert (not b!116630))

(assert (not b!116638))

(assert (not b!116641))

(assert (not b!116636))

(assert (not start!22994))

(assert (not b!116631))

(assert (not b!116633))

(check-sat)

(pop 1)

(push 1)

(check-sat)

