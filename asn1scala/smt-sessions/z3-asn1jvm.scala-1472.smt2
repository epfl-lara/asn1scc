; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40546 () Bool)

(assert start!40546)

(declare-fun b!186297 () Bool)

(declare-fun res!155102 () Bool)

(declare-fun e!128920 () Bool)

(assert (=> b!186297 (=> res!155102 e!128920)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9822 0))(
  ( (array!9823 (arr!5261 (Array (_ BitVec 32) (_ BitVec 8))) (size!4331 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7770 0))(
  ( (BitStream!7771 (buf!4794 array!9822) (currentByte!9044 (_ BitVec 32)) (currentBit!9039 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7770)

(declare-fun lt!287794 () (_ BitVec 64))

(declare-fun lt!287810 () (_ BitVec 64))

(declare-datatypes ((Unit!13331 0))(
  ( (Unit!13332) )
))
(declare-datatypes ((tuple2!16116 0))(
  ( (tuple2!16117 (_1!8703 Unit!13331) (_2!8703 BitStream!7770)) )
))
(declare-fun lt!287807 () tuple2!16116)

(assert (=> b!186297 (= res!155102 (or (not (= (size!4331 (buf!4794 (_2!8703 lt!287807))) (size!4331 (buf!4794 thiss!1204)))) (not (= lt!287794 (bvsub (bvadd lt!287810 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!186298 () Bool)

(declare-fun e!128914 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186298 (= e!128914 (invariant!0 (currentBit!9039 thiss!1204) (currentByte!9044 thiss!1204) (size!4331 (buf!4794 (_2!8703 lt!287807)))))))

(declare-fun res!155099 () Bool)

(declare-fun e!128926 () Bool)

(assert (=> start!40546 (=> (not res!155099) (not e!128926))))

(assert (=> start!40546 (= res!155099 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40546 e!128926))

(assert (=> start!40546 true))

(declare-fun e!128925 () Bool)

(declare-fun inv!12 (BitStream!7770) Bool)

(assert (=> start!40546 (and (inv!12 thiss!1204) e!128925)))

(declare-fun b!186299 () Bool)

(declare-fun res!155108 () Bool)

(declare-fun e!128923 () Bool)

(assert (=> b!186299 (=> (not res!155108) (not e!128923))))

(declare-fun lt!287805 () tuple2!16116)

(declare-fun isPrefixOf!0 (BitStream!7770 BitStream!7770) Bool)

(assert (=> b!186299 (= res!155108 (isPrefixOf!0 thiss!1204 (_2!8703 lt!287805)))))

(declare-fun b!186300 () Bool)

(declare-fun e!128924 () Bool)

(declare-fun e!128915 () Bool)

(assert (=> b!186300 (= e!128924 (not e!128915))))

(declare-fun res!155110 () Bool)

(assert (=> b!186300 (=> res!155110 e!128915)))

(declare-fun lt!287792 () (_ BitVec 64))

(assert (=> b!186300 (= res!155110 (not (= lt!287792 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!287810))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186300 (= lt!287792 (bitIndex!0 (size!4331 (buf!4794 (_2!8703 lt!287805))) (currentByte!9044 (_2!8703 lt!287805)) (currentBit!9039 (_2!8703 lt!287805))))))

(assert (=> b!186300 (= lt!287810 (bitIndex!0 (size!4331 (buf!4794 thiss!1204)) (currentByte!9044 thiss!1204) (currentBit!9039 thiss!1204)))))

(declare-fun e!128917 () Bool)

(assert (=> b!186300 e!128917))

(declare-fun res!155094 () Bool)

(assert (=> b!186300 (=> (not res!155094) (not e!128917))))

(assert (=> b!186300 (= res!155094 (= (size!4331 (buf!4794 thiss!1204)) (size!4331 (buf!4794 (_2!8703 lt!287805)))))))

(declare-fun lt!287800 () Bool)

(declare-fun appendBit!0 (BitStream!7770 Bool) tuple2!16116)

(assert (=> b!186300 (= lt!287805 (appendBit!0 thiss!1204 lt!287800))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!287804 () (_ BitVec 64))

(assert (=> b!186300 (= lt!287800 (not (= (bvand v!189 lt!287804) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186300 (= lt!287804 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!186301 () Bool)

(declare-fun e!128918 () Bool)

(declare-datatypes ((tuple2!16118 0))(
  ( (tuple2!16119 (_1!8704 BitStream!7770) (_2!8704 Bool)) )
))
(declare-fun lt!287803 () tuple2!16118)

(declare-fun lt!287801 () (_ BitVec 64))

(assert (=> b!186301 (= e!128918 (= (bitIndex!0 (size!4331 (buf!4794 (_1!8704 lt!287803))) (currentByte!9044 (_1!8704 lt!287803)) (currentBit!9039 (_1!8704 lt!287803))) lt!287801))))

(declare-fun b!186302 () Bool)

(declare-fun res!155096 () Bool)

(assert (=> b!186302 (=> res!155096 e!128920)))

(assert (=> b!186302 (= res!155096 (not (isPrefixOf!0 (_2!8703 lt!287805) (_2!8703 lt!287807))))))

(declare-fun b!186303 () Bool)

(declare-fun res!155100 () Bool)

(assert (=> b!186303 (=> (not res!155100) (not e!128924))))

(assert (=> b!186303 (= res!155100 (not (= i!590 nBits!348)))))

(declare-fun b!186304 () Bool)

(declare-fun res!155112 () Bool)

(declare-fun e!128922 () Bool)

(assert (=> b!186304 (=> (not res!155112) (not e!128922))))

(declare-datatypes ((tuple2!16120 0))(
  ( (tuple2!16121 (_1!8705 BitStream!7770) (_2!8705 BitStream!7770)) )
))
(declare-fun lt!287790 () tuple2!16120)

(declare-fun withMovedBitIndex!0 (BitStream!7770 (_ BitVec 64)) BitStream!7770)

(assert (=> b!186304 (= res!155112 (= (_1!8705 lt!287790) (withMovedBitIndex!0 (_2!8705 lt!287790) (bvsub lt!287810 lt!287794))))))

(declare-fun b!186305 () Bool)

(assert (=> b!186305 (= e!128923 e!128918)))

(declare-fun res!155098 () Bool)

(assert (=> b!186305 (=> (not res!155098) (not e!128918))))

(assert (=> b!186305 (= res!155098 (and (= (_2!8704 lt!287803) lt!287800) (= (_1!8704 lt!287803) (_2!8703 lt!287805))))))

(declare-fun readBitPure!0 (BitStream!7770) tuple2!16118)

(declare-fun readerFrom!0 (BitStream!7770 (_ BitVec 32) (_ BitVec 32)) BitStream!7770)

(assert (=> b!186305 (= lt!287803 (readBitPure!0 (readerFrom!0 (_2!8703 lt!287805) (currentBit!9039 thiss!1204) (currentByte!9044 thiss!1204))))))

(declare-fun b!186306 () Bool)

(assert (=> b!186306 (= e!128917 e!128923)))

(declare-fun res!155111 () Bool)

(assert (=> b!186306 (=> (not res!155111) (not e!128923))))

(declare-fun lt!287795 () (_ BitVec 64))

(assert (=> b!186306 (= res!155111 (= lt!287801 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!287795)))))

(assert (=> b!186306 (= lt!287801 (bitIndex!0 (size!4331 (buf!4794 (_2!8703 lt!287805))) (currentByte!9044 (_2!8703 lt!287805)) (currentBit!9039 (_2!8703 lt!287805))))))

(assert (=> b!186306 (= lt!287795 (bitIndex!0 (size!4331 (buf!4794 thiss!1204)) (currentByte!9044 thiss!1204) (currentBit!9039 thiss!1204)))))

(declare-fun b!186307 () Bool)

(declare-fun e!128916 () Bool)

(assert (=> b!186307 (= e!128920 e!128916)))

(declare-fun res!155104 () Bool)

(assert (=> b!186307 (=> res!155104 e!128916)))

(declare-fun lt!287809 () (_ BitVec 64))

(declare-fun lt!287799 () tuple2!16120)

(declare-datatypes ((tuple2!16122 0))(
  ( (tuple2!16123 (_1!8706 BitStream!7770) (_2!8706 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16122)

(assert (=> b!186307 (= res!155104 (not (= (_1!8706 (readNBitsLSBFirstsLoopPure!0 (_1!8705 lt!287799) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287809)) (_2!8705 lt!287799))))))

(declare-fun lt!287811 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186307 (validate_offset_bits!1 ((_ sign_extend 32) (size!4331 (buf!4794 (_2!8703 lt!287807)))) ((_ sign_extend 32) (currentByte!9044 (_2!8703 lt!287805))) ((_ sign_extend 32) (currentBit!9039 (_2!8703 lt!287805))) lt!287811)))

(declare-fun lt!287812 () Unit!13331)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7770 array!9822 (_ BitVec 64)) Unit!13331)

(assert (=> b!186307 (= lt!287812 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8703 lt!287805) (buf!4794 (_2!8703 lt!287807)) lt!287811))))

(assert (=> b!186307 (= lt!287811 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!287796 () (_ BitVec 64))

(declare-fun lt!287789 () tuple2!16118)

(assert (=> b!186307 (= lt!287809 (bvor lt!287796 (ite (_2!8704 lt!287789) lt!287804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!287798 () tuple2!16122)

(assert (=> b!186307 (= lt!287798 (readNBitsLSBFirstsLoopPure!0 (_1!8705 lt!287790) nBits!348 i!590 lt!287796))))

(declare-fun lt!287806 () (_ BitVec 64))

(assert (=> b!186307 (validate_offset_bits!1 ((_ sign_extend 32) (size!4331 (buf!4794 (_2!8703 lt!287807)))) ((_ sign_extend 32) (currentByte!9044 thiss!1204)) ((_ sign_extend 32) (currentBit!9039 thiss!1204)) lt!287806)))

(declare-fun lt!287787 () Unit!13331)

(assert (=> b!186307 (= lt!287787 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4794 (_2!8703 lt!287807)) lt!287806))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186307 (= lt!287796 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!186307 (= (_2!8704 lt!287789) lt!287800)))

(assert (=> b!186307 (= lt!287789 (readBitPure!0 (_1!8705 lt!287790)))))

(declare-fun reader!0 (BitStream!7770 BitStream!7770) tuple2!16120)

(assert (=> b!186307 (= lt!287799 (reader!0 (_2!8703 lt!287805) (_2!8703 lt!287807)))))

(assert (=> b!186307 (= lt!287790 (reader!0 thiss!1204 (_2!8703 lt!287807)))))

(declare-fun e!128919 () Bool)

(assert (=> b!186307 e!128919))

(declare-fun res!155095 () Bool)

(assert (=> b!186307 (=> (not res!155095) (not e!128919))))

(declare-fun lt!287788 () tuple2!16118)

(declare-fun lt!287797 () tuple2!16118)

(assert (=> b!186307 (= res!155095 (= (bitIndex!0 (size!4331 (buf!4794 (_1!8704 lt!287788))) (currentByte!9044 (_1!8704 lt!287788)) (currentBit!9039 (_1!8704 lt!287788))) (bitIndex!0 (size!4331 (buf!4794 (_1!8704 lt!287797))) (currentByte!9044 (_1!8704 lt!287797)) (currentBit!9039 (_1!8704 lt!287797)))))))

(declare-fun lt!287793 () Unit!13331)

(declare-fun lt!287786 () BitStream!7770)

(declare-fun readBitPrefixLemma!0 (BitStream!7770 BitStream!7770) Unit!13331)

(assert (=> b!186307 (= lt!287793 (readBitPrefixLemma!0 lt!287786 (_2!8703 lt!287807)))))

(assert (=> b!186307 (= lt!287797 (readBitPure!0 (BitStream!7771 (buf!4794 (_2!8703 lt!287807)) (currentByte!9044 thiss!1204) (currentBit!9039 thiss!1204))))))

(assert (=> b!186307 (= lt!287788 (readBitPure!0 lt!287786))))

(assert (=> b!186307 e!128914))

(declare-fun res!155097 () Bool)

(assert (=> b!186307 (=> (not res!155097) (not e!128914))))

(assert (=> b!186307 (= res!155097 (invariant!0 (currentBit!9039 thiss!1204) (currentByte!9044 thiss!1204) (size!4331 (buf!4794 (_2!8703 lt!287805)))))))

(assert (=> b!186307 (= lt!287786 (BitStream!7771 (buf!4794 (_2!8703 lt!287805)) (currentByte!9044 thiss!1204) (currentBit!9039 thiss!1204)))))

(declare-fun b!186308 () Bool)

(declare-fun array_inv!4072 (array!9822) Bool)

(assert (=> b!186308 (= e!128925 (array_inv!4072 (buf!4794 thiss!1204)))))

(declare-fun b!186309 () Bool)

(assert (=> b!186309 (= e!128922 (= (_1!8705 lt!287799) (withMovedBitIndex!0 (_2!8705 lt!287799) (bvsub lt!287792 lt!287794))))))

(declare-fun b!186310 () Bool)

(assert (=> b!186310 (= e!128916 true)))

(assert (=> b!186310 e!128922))

(declare-fun res!155103 () Bool)

(assert (=> b!186310 (=> (not res!155103) (not e!128922))))

(declare-fun lt!287791 () tuple2!16122)

(assert (=> b!186310 (= res!155103 (and (= (_2!8706 lt!287798) (_2!8706 lt!287791)) (= (_1!8706 lt!287798) (_1!8706 lt!287791))))))

(declare-fun lt!287802 () Unit!13331)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13331)

(assert (=> b!186310 (= lt!287802 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8705 lt!287790) nBits!348 i!590 lt!287796))))

(assert (=> b!186310 (= lt!287791 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8705 lt!287790) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287809))))

(declare-fun b!186311 () Bool)

(declare-fun res!155107 () Bool)

(assert (=> b!186311 (=> res!155107 e!128920)))

(assert (=> b!186311 (= res!155107 (not (isPrefixOf!0 thiss!1204 (_2!8703 lt!287805))))))

(declare-fun b!186312 () Bool)

(assert (=> b!186312 (= e!128919 (= (_2!8704 lt!287788) (_2!8704 lt!287797)))))

(declare-fun b!186313 () Bool)

(declare-fun res!155105 () Bool)

(assert (=> b!186313 (=> (not res!155105) (not e!128924))))

(assert (=> b!186313 (= res!155105 (invariant!0 (currentBit!9039 thiss!1204) (currentByte!9044 thiss!1204) (size!4331 (buf!4794 thiss!1204))))))

(declare-fun b!186314 () Bool)

(assert (=> b!186314 (= e!128926 e!128924)))

(declare-fun res!155101 () Bool)

(assert (=> b!186314 (=> (not res!155101) (not e!128924))))

(assert (=> b!186314 (= res!155101 (validate_offset_bits!1 ((_ sign_extend 32) (size!4331 (buf!4794 thiss!1204))) ((_ sign_extend 32) (currentByte!9044 thiss!1204)) ((_ sign_extend 32) (currentBit!9039 thiss!1204)) lt!287806))))

(assert (=> b!186314 (= lt!287806 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!186315 () Bool)

(assert (=> b!186315 (= e!128915 e!128920)))

(declare-fun res!155109 () Bool)

(assert (=> b!186315 (=> res!155109 e!128920)))

(assert (=> b!186315 (= res!155109 (not (= lt!287794 (bvsub (bvsub (bvadd lt!287792 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!186315 (= lt!287794 (bitIndex!0 (size!4331 (buf!4794 (_2!8703 lt!287807))) (currentByte!9044 (_2!8703 lt!287807)) (currentBit!9039 (_2!8703 lt!287807))))))

(assert (=> b!186315 (isPrefixOf!0 thiss!1204 (_2!8703 lt!287807))))

(declare-fun lt!287808 () Unit!13331)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7770 BitStream!7770 BitStream!7770) Unit!13331)

(assert (=> b!186315 (= lt!287808 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8703 lt!287805) (_2!8703 lt!287807)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7770 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16116)

(assert (=> b!186315 (= lt!287807 (appendBitsLSBFirstLoopTR!0 (_2!8703 lt!287805) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!186316 () Bool)

(declare-fun res!155106 () Bool)

(assert (=> b!186316 (=> res!155106 e!128920)))

(assert (=> b!186316 (= res!155106 (not (invariant!0 (currentBit!9039 (_2!8703 lt!287807)) (currentByte!9044 (_2!8703 lt!287807)) (size!4331 (buf!4794 (_2!8703 lt!287807))))))))

(assert (= (and start!40546 res!155099) b!186314))

(assert (= (and b!186314 res!155101) b!186313))

(assert (= (and b!186313 res!155105) b!186303))

(assert (= (and b!186303 res!155100) b!186300))

(assert (= (and b!186300 res!155094) b!186306))

(assert (= (and b!186306 res!155111) b!186299))

(assert (= (and b!186299 res!155108) b!186305))

(assert (= (and b!186305 res!155098) b!186301))

(assert (= (and b!186300 (not res!155110)) b!186315))

(assert (= (and b!186315 (not res!155109)) b!186316))

(assert (= (and b!186316 (not res!155106)) b!186297))

(assert (= (and b!186297 (not res!155102)) b!186302))

(assert (= (and b!186302 (not res!155096)) b!186311))

(assert (= (and b!186311 (not res!155107)) b!186307))

(assert (= (and b!186307 res!155097) b!186298))

(assert (= (and b!186307 res!155095) b!186312))

(assert (= (and b!186307 (not res!155104)) b!186310))

(assert (= (and b!186310 res!155103) b!186304))

(assert (= (and b!186304 res!155112) b!186309))

(assert (= start!40546 b!186308))

(declare-fun m!289651 () Bool)

(assert (=> b!186313 m!289651))

(declare-fun m!289653 () Bool)

(assert (=> b!186299 m!289653))

(declare-fun m!289655 () Bool)

(assert (=> b!186305 m!289655))

(assert (=> b!186305 m!289655))

(declare-fun m!289657 () Bool)

(assert (=> b!186305 m!289657))

(declare-fun m!289659 () Bool)

(assert (=> b!186301 m!289659))

(assert (=> b!186311 m!289653))

(declare-fun m!289661 () Bool)

(assert (=> b!186302 m!289661))

(declare-fun m!289663 () Bool)

(assert (=> b!186306 m!289663))

(declare-fun m!289665 () Bool)

(assert (=> b!186306 m!289665))

(declare-fun m!289667 () Bool)

(assert (=> b!186314 m!289667))

(declare-fun m!289669 () Bool)

(assert (=> b!186315 m!289669))

(declare-fun m!289671 () Bool)

(assert (=> b!186315 m!289671))

(declare-fun m!289673 () Bool)

(assert (=> b!186315 m!289673))

(declare-fun m!289675 () Bool)

(assert (=> b!186315 m!289675))

(declare-fun m!289677 () Bool)

(assert (=> b!186304 m!289677))

(declare-fun m!289679 () Bool)

(assert (=> start!40546 m!289679))

(declare-fun m!289681 () Bool)

(assert (=> b!186309 m!289681))

(assert (=> b!186300 m!289663))

(assert (=> b!186300 m!289665))

(declare-fun m!289683 () Bool)

(assert (=> b!186300 m!289683))

(declare-fun m!289685 () Bool)

(assert (=> b!186307 m!289685))

(declare-fun m!289687 () Bool)

(assert (=> b!186307 m!289687))

(declare-fun m!289689 () Bool)

(assert (=> b!186307 m!289689))

(declare-fun m!289691 () Bool)

(assert (=> b!186307 m!289691))

(declare-fun m!289693 () Bool)

(assert (=> b!186307 m!289693))

(declare-fun m!289695 () Bool)

(assert (=> b!186307 m!289695))

(declare-fun m!289697 () Bool)

(assert (=> b!186307 m!289697))

(declare-fun m!289699 () Bool)

(assert (=> b!186307 m!289699))

(declare-fun m!289701 () Bool)

(assert (=> b!186307 m!289701))

(declare-fun m!289703 () Bool)

(assert (=> b!186307 m!289703))

(declare-fun m!289705 () Bool)

(assert (=> b!186307 m!289705))

(declare-fun m!289707 () Bool)

(assert (=> b!186307 m!289707))

(declare-fun m!289709 () Bool)

(assert (=> b!186307 m!289709))

(declare-fun m!289711 () Bool)

(assert (=> b!186307 m!289711))

(declare-fun m!289713 () Bool)

(assert (=> b!186307 m!289713))

(declare-fun m!289715 () Bool)

(assert (=> b!186307 m!289715))

(declare-fun m!289717 () Bool)

(assert (=> b!186310 m!289717))

(declare-fun m!289719 () Bool)

(assert (=> b!186310 m!289719))

(assert (=> b!186310 m!289719))

(declare-fun m!289721 () Bool)

(assert (=> b!186310 m!289721))

(declare-fun m!289723 () Bool)

(assert (=> b!186316 m!289723))

(declare-fun m!289725 () Bool)

(assert (=> b!186308 m!289725))

(declare-fun m!289727 () Bool)

(assert (=> b!186298 m!289727))

(check-sat (not b!186316) (not b!186311) (not b!186305) (not b!186314) (not b!186315) (not b!186310) (not start!40546) (not b!186307) (not b!186309) (not b!186300) (not b!186302) (not b!186308) (not b!186306) (not b!186313) (not b!186304) (not b!186299) (not b!186298) (not b!186301))
