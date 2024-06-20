; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20588 () Bool)

(assert start!20588)

(declare-fun b!103813 () Bool)

(declare-fun res!85441 () Bool)

(declare-fun e!67967 () Bool)

(assert (=> b!103813 (=> res!85441 e!67967)))

(declare-fun lt!152012 () (_ BitVec 64))

(declare-fun lt!151999 () (_ BitVec 64))

(declare-fun lt!152003 () (_ BitVec 64))

(assert (=> b!103813 (= res!85441 (or (not (= (bvand lt!152003 lt!151999) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!152003 lt!152012) lt!152003))))))

(declare-fun b!103815 () Bool)

(assert (=> b!103815 (= e!67967 true)))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!152009 () (_ BitVec 64))

(declare-datatypes ((array!4846 0))(
  ( (array!4847 (arr!2804 (Array (_ BitVec 32) (_ BitVec 8))) (size!2211 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3896 0))(
  ( (BitStream!3897 (buf!2577 array!4846) (currentByte!5062 (_ BitVec 32)) (currentBit!5057 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8534 0))(
  ( (tuple2!8535 (_1!4522 BitStream!3896) (_2!4522 BitStream!3896)) )
))
(declare-fun lt!151998 () tuple2!8534)

(declare-datatypes ((tuple2!8536 0))(
  ( (tuple2!8537 (_1!4523 BitStream!3896) (_2!4523 (_ BitVec 64))) )
))
(declare-fun lt!151990 () tuple2!8536)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8536)

(declare-fun withMovedBitIndex!0 (BitStream!3896 (_ BitVec 64)) BitStream!3896)

(assert (=> b!103815 (= lt!151990 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4522 lt!151998) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152009))))

(declare-fun b!103816 () Bool)

(declare-fun res!85433 () Bool)

(declare-fun e!67958 () Bool)

(assert (=> b!103816 (=> (not res!85433) (not e!67958))))

(declare-fun thiss!1305 () BitStream!3896)

(declare-datatypes ((Unit!6366 0))(
  ( (Unit!6367) )
))
(declare-datatypes ((tuple2!8538 0))(
  ( (tuple2!8539 (_1!4524 Unit!6366) (_2!4524 BitStream!3896)) )
))
(declare-fun lt!152006 () tuple2!8538)

(declare-fun isPrefixOf!0 (BitStream!3896 BitStream!3896) Bool)

(assert (=> b!103816 (= res!85433 (isPrefixOf!0 thiss!1305 (_2!4524 lt!152006)))))

(declare-fun b!103817 () Bool)

(declare-fun e!67965 () Bool)

(assert (=> b!103817 (= e!67958 e!67965)))

(declare-fun res!85432 () Bool)

(assert (=> b!103817 (=> (not res!85432) (not e!67965))))

(declare-datatypes ((tuple2!8540 0))(
  ( (tuple2!8541 (_1!4525 BitStream!3896) (_2!4525 Bool)) )
))
(declare-fun lt!151995 () tuple2!8540)

(declare-fun lt!152001 () Bool)

(assert (=> b!103817 (= res!85432 (and (= (_2!4525 lt!151995) lt!152001) (= (_1!4525 lt!151995) (_2!4524 lt!152006))))))

(declare-fun readBitPure!0 (BitStream!3896) tuple2!8540)

(declare-fun readerFrom!0 (BitStream!3896 (_ BitVec 32) (_ BitVec 32)) BitStream!3896)

(assert (=> b!103817 (= lt!151995 (readBitPure!0 (readerFrom!0 (_2!4524 lt!152006) (currentBit!5057 thiss!1305) (currentByte!5062 thiss!1305))))))

(declare-fun b!103818 () Bool)

(declare-fun e!67962 () Bool)

(declare-fun array_inv!2013 (array!4846) Bool)

(assert (=> b!103818 (= e!67962 (array_inv!2013 (buf!2577 thiss!1305)))))

(declare-fun b!103814 () Bool)

(declare-fun res!85442 () Bool)

(assert (=> b!103814 (=> res!85442 e!67967)))

(declare-fun lt!152000 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103814 (= res!85442 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2211 (buf!2577 (_1!4522 lt!151998)))) ((_ sign_extend 32) (currentByte!5062 (_1!4522 lt!151998))) ((_ sign_extend 32) (currentBit!5057 (_1!4522 lt!151998))) lt!152000)))))

(declare-fun res!85435 () Bool)

(declare-fun e!67963 () Bool)

(assert (=> start!20588 (=> (not res!85435) (not e!67963))))

(assert (=> start!20588 (= res!85435 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20588 e!67963))

(assert (=> start!20588 true))

(declare-fun inv!12 (BitStream!3896) Bool)

(assert (=> start!20588 (and (inv!12 thiss!1305) e!67962)))

(declare-fun b!103819 () Bool)

(declare-fun e!67960 () Bool)

(declare-fun e!67961 () Bool)

(assert (=> b!103819 (= e!67960 e!67961)))

(declare-fun res!85431 () Bool)

(assert (=> b!103819 (=> (not res!85431) (not e!67961))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!103819 (= res!85431 (and (= (bvand v!199 lt!152012) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103819 (= lt!152012 (onesLSBLong!0 nBits!396))))

(declare-fun b!103820 () Bool)

(declare-fun e!67966 () Bool)

(declare-fun lt!151991 () tuple2!8538)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103820 (= e!67966 (invariant!0 (currentBit!5057 thiss!1305) (currentByte!5062 thiss!1305) (size!2211 (buf!2577 (_2!4524 lt!151991)))))))

(declare-fun b!103821 () Bool)

(assert (=> b!103821 (= e!67963 e!67960)))

(declare-fun res!85430 () Bool)

(assert (=> b!103821 (=> (not res!85430) (not e!67960))))

(assert (=> b!103821 (= res!85430 (validate_offset_bits!1 ((_ sign_extend 32) (size!2211 (buf!2577 thiss!1305))) ((_ sign_extend 32) (currentByte!5062 thiss!1305)) ((_ sign_extend 32) (currentBit!5057 thiss!1305)) lt!152000))))

(assert (=> b!103821 (= lt!152000 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103822 () Bool)

(declare-fun e!67968 () Bool)

(declare-fun lt!152010 () tuple2!8540)

(declare-fun lt!152013 () tuple2!8540)

(assert (=> b!103822 (= e!67968 (= (_2!4525 lt!152010) (_2!4525 lt!152013)))))

(declare-fun b!103823 () Bool)

(declare-fun e!67959 () Bool)

(assert (=> b!103823 (= e!67959 e!67958)))

(declare-fun res!85434 () Bool)

(assert (=> b!103823 (=> (not res!85434) (not e!67958))))

(declare-fun lt!151994 () (_ BitVec 64))

(declare-fun lt!151996 () (_ BitVec 64))

(assert (=> b!103823 (= res!85434 (= lt!151994 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!151996)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103823 (= lt!151994 (bitIndex!0 (size!2211 (buf!2577 (_2!4524 lt!152006))) (currentByte!5062 (_2!4524 lt!152006)) (currentBit!5057 (_2!4524 lt!152006))))))

(assert (=> b!103823 (= lt!151996 (bitIndex!0 (size!2211 (buf!2577 thiss!1305)) (currentByte!5062 thiss!1305) (currentBit!5057 thiss!1305)))))

(declare-fun b!103824 () Bool)

(assert (=> b!103824 (= e!67965 (= (bitIndex!0 (size!2211 (buf!2577 (_1!4525 lt!151995))) (currentByte!5062 (_1!4525 lt!151995)) (currentBit!5057 (_1!4525 lt!151995))) lt!151994))))

(declare-fun b!103825 () Bool)

(declare-fun res!85438 () Bool)

(assert (=> b!103825 (=> (not res!85438) (not e!67966))))

(assert (=> b!103825 (= res!85438 (invariant!0 (currentBit!5057 thiss!1305) (currentByte!5062 thiss!1305) (size!2211 (buf!2577 (_2!4524 lt!152006)))))))

(declare-fun b!103826 () Bool)

(assert (=> b!103826 (= e!67961 (not e!67967))))

(declare-fun res!85436 () Bool)

(assert (=> b!103826 (=> res!85436 e!67967)))

(declare-fun lt!152014 () tuple2!8534)

(assert (=> b!103826 (= res!85436 (not (= (_1!4523 (readNLeastSignificantBitsLoopPure!0 (_1!4522 lt!152014) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152009)) (_2!4522 lt!152014))))))

(declare-fun lt!151997 () (_ BitVec 64))

(assert (=> b!103826 (validate_offset_bits!1 ((_ sign_extend 32) (size!2211 (buf!2577 (_2!4524 lt!151991)))) ((_ sign_extend 32) (currentByte!5062 (_2!4524 lt!152006))) ((_ sign_extend 32) (currentBit!5057 (_2!4524 lt!152006))) lt!151997)))

(declare-fun lt!152011 () Unit!6366)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3896 array!4846 (_ BitVec 64)) Unit!6366)

(assert (=> b!103826 (= lt!152011 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4524 lt!152006) (buf!2577 (_2!4524 lt!151991)) lt!151997))))

(assert (=> b!103826 (= lt!151997 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152008 () tuple2!8540)

(declare-fun lt!152005 () (_ BitVec 64))

(assert (=> b!103826 (= lt!152009 (bvor lt!152003 (ite (_2!4525 lt!152008) lt!152005 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152007 () tuple2!8536)

(assert (=> b!103826 (= lt!152007 (readNLeastSignificantBitsLoopPure!0 (_1!4522 lt!151998) nBits!396 i!615 lt!152003))))

(assert (=> b!103826 (validate_offset_bits!1 ((_ sign_extend 32) (size!2211 (buf!2577 (_2!4524 lt!151991)))) ((_ sign_extend 32) (currentByte!5062 thiss!1305)) ((_ sign_extend 32) (currentBit!5057 thiss!1305)) lt!152000)))

(declare-fun lt!151993 () Unit!6366)

(assert (=> b!103826 (= lt!151993 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2577 (_2!4524 lt!151991)) lt!152000))))

(assert (=> b!103826 (= lt!152003 (bvand v!199 (bvnot lt!151999)))))

(assert (=> b!103826 (= lt!151999 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!103826 (= (_2!4525 lt!152008) lt!152001)))

(assert (=> b!103826 (= lt!152008 (readBitPure!0 (_1!4522 lt!151998)))))

(declare-fun reader!0 (BitStream!3896 BitStream!3896) tuple2!8534)

(assert (=> b!103826 (= lt!152014 (reader!0 (_2!4524 lt!152006) (_2!4524 lt!151991)))))

(assert (=> b!103826 (= lt!151998 (reader!0 thiss!1305 (_2!4524 lt!151991)))))

(assert (=> b!103826 e!67968))

(declare-fun res!85440 () Bool)

(assert (=> b!103826 (=> (not res!85440) (not e!67968))))

(assert (=> b!103826 (= res!85440 (= (bitIndex!0 (size!2211 (buf!2577 (_1!4525 lt!152010))) (currentByte!5062 (_1!4525 lt!152010)) (currentBit!5057 (_1!4525 lt!152010))) (bitIndex!0 (size!2211 (buf!2577 (_1!4525 lt!152013))) (currentByte!5062 (_1!4525 lt!152013)) (currentBit!5057 (_1!4525 lt!152013)))))))

(declare-fun lt!152004 () Unit!6366)

(declare-fun lt!152002 () BitStream!3896)

(declare-fun readBitPrefixLemma!0 (BitStream!3896 BitStream!3896) Unit!6366)

(assert (=> b!103826 (= lt!152004 (readBitPrefixLemma!0 lt!152002 (_2!4524 lt!151991)))))

(assert (=> b!103826 (= lt!152013 (readBitPure!0 (BitStream!3897 (buf!2577 (_2!4524 lt!151991)) (currentByte!5062 thiss!1305) (currentBit!5057 thiss!1305))))))

(assert (=> b!103826 (= lt!152010 (readBitPure!0 lt!152002))))

(assert (=> b!103826 (= lt!152002 (BitStream!3897 (buf!2577 (_2!4524 lt!152006)) (currentByte!5062 thiss!1305) (currentBit!5057 thiss!1305)))))

(assert (=> b!103826 e!67966))

(declare-fun res!85439 () Bool)

(assert (=> b!103826 (=> (not res!85439) (not e!67966))))

(assert (=> b!103826 (= res!85439 (isPrefixOf!0 thiss!1305 (_2!4524 lt!151991)))))

(declare-fun lt!151992 () Unit!6366)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3896 BitStream!3896 BitStream!3896) Unit!6366)

(assert (=> b!103826 (= lt!151992 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4524 lt!152006) (_2!4524 lt!151991)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3896 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8538)

(assert (=> b!103826 (= lt!151991 (appendNLeastSignificantBitsLoop!0 (_2!4524 lt!152006) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103826 e!67959))

(declare-fun res!85437 () Bool)

(assert (=> b!103826 (=> (not res!85437) (not e!67959))))

(assert (=> b!103826 (= res!85437 (= (size!2211 (buf!2577 thiss!1305)) (size!2211 (buf!2577 (_2!4524 lt!152006)))))))

(declare-fun appendBit!0 (BitStream!3896 Bool) tuple2!8538)

(assert (=> b!103826 (= lt!152006 (appendBit!0 thiss!1305 lt!152001))))

(assert (=> b!103826 (= lt!152001 (not (= (bvand v!199 lt!152005) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103826 (= lt!152005 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!20588 res!85435) b!103821))

(assert (= (and b!103821 res!85430) b!103819))

(assert (= (and b!103819 res!85431) b!103826))

(assert (= (and b!103826 res!85437) b!103823))

(assert (= (and b!103823 res!85434) b!103816))

(assert (= (and b!103816 res!85433) b!103817))

(assert (= (and b!103817 res!85432) b!103824))

(assert (= (and b!103826 res!85439) b!103825))

(assert (= (and b!103825 res!85438) b!103820))

(assert (= (and b!103826 res!85440) b!103822))

(assert (= (and b!103826 (not res!85436)) b!103814))

(assert (= (and b!103814 (not res!85442)) b!103813))

(assert (= (and b!103813 (not res!85441)) b!103815))

(assert (= start!20588 b!103818))

(declare-fun m!151637 () Bool)

(assert (=> b!103819 m!151637))

(declare-fun m!151639 () Bool)

(assert (=> b!103814 m!151639))

(declare-fun m!151641 () Bool)

(assert (=> b!103817 m!151641))

(assert (=> b!103817 m!151641))

(declare-fun m!151643 () Bool)

(assert (=> b!103817 m!151643))

(declare-fun m!151645 () Bool)

(assert (=> b!103820 m!151645))

(declare-fun m!151647 () Bool)

(assert (=> b!103821 m!151647))

(declare-fun m!151649 () Bool)

(assert (=> b!103815 m!151649))

(assert (=> b!103815 m!151649))

(declare-fun m!151651 () Bool)

(assert (=> b!103815 m!151651))

(declare-fun m!151653 () Bool)

(assert (=> b!103818 m!151653))

(declare-fun m!151655 () Bool)

(assert (=> b!103816 m!151655))

(declare-fun m!151657 () Bool)

(assert (=> b!103823 m!151657))

(declare-fun m!151659 () Bool)

(assert (=> b!103823 m!151659))

(declare-fun m!151661 () Bool)

(assert (=> b!103824 m!151661))

(declare-fun m!151663 () Bool)

(assert (=> start!20588 m!151663))

(declare-fun m!151665 () Bool)

(assert (=> b!103826 m!151665))

(declare-fun m!151667 () Bool)

(assert (=> b!103826 m!151667))

(declare-fun m!151669 () Bool)

(assert (=> b!103826 m!151669))

(declare-fun m!151671 () Bool)

(assert (=> b!103826 m!151671))

(declare-fun m!151673 () Bool)

(assert (=> b!103826 m!151673))

(declare-fun m!151675 () Bool)

(assert (=> b!103826 m!151675))

(declare-fun m!151677 () Bool)

(assert (=> b!103826 m!151677))

(declare-fun m!151679 () Bool)

(assert (=> b!103826 m!151679))

(declare-fun m!151681 () Bool)

(assert (=> b!103826 m!151681))

(declare-fun m!151683 () Bool)

(assert (=> b!103826 m!151683))

(declare-fun m!151685 () Bool)

(assert (=> b!103826 m!151685))

(declare-fun m!151687 () Bool)

(assert (=> b!103826 m!151687))

(declare-fun m!151689 () Bool)

(assert (=> b!103826 m!151689))

(declare-fun m!151691 () Bool)

(assert (=> b!103826 m!151691))

(declare-fun m!151693 () Bool)

(assert (=> b!103826 m!151693))

(declare-fun m!151695 () Bool)

(assert (=> b!103826 m!151695))

(declare-fun m!151697 () Bool)

(assert (=> b!103826 m!151697))

(declare-fun m!151699 () Bool)

(assert (=> b!103826 m!151699))

(declare-fun m!151701 () Bool)

(assert (=> b!103826 m!151701))

(declare-fun m!151703 () Bool)

(assert (=> b!103825 m!151703))

(push 1)

(assert (not b!103820))

(assert (not start!20588))

(assert (not b!103825))

(assert (not b!103824))

(assert (not b!103826))

(assert (not b!103821))

(assert (not b!103815))

(assert (not b!103818))

(assert (not b!103823))

(assert (not b!103814))

(assert (not b!103819))

(assert (not b!103816))

(assert (not b!103817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

