; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21608 () Bool)

(assert start!21608)

(declare-fun b!109002 () Bool)

(declare-fun res!89914 () Bool)

(declare-fun e!71392 () Bool)

(assert (=> b!109002 (=> (not res!89914) (not e!71392))))

(declare-datatypes ((array!4971 0))(
  ( (array!4972 (arr!2855 (Array (_ BitVec 32) (_ BitVec 8))) (size!2262 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3998 0))(
  ( (BitStream!3999 (buf!2653 array!4971) (currentByte!5189 (_ BitVec 32)) (currentBit!5184 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3998)

(declare-datatypes ((Unit!6665 0))(
  ( (Unit!6666) )
))
(declare-datatypes ((tuple2!9028 0))(
  ( (tuple2!9029 (_1!4771 Unit!6665) (_2!4771 BitStream!3998)) )
))
(declare-fun lt!164565 () tuple2!9028)

(declare-fun isPrefixOf!0 (BitStream!3998 BitStream!3998) Bool)

(assert (=> b!109002 (= res!89914 (isPrefixOf!0 thiss!1305 (_2!4771 lt!164565)))))

(declare-fun b!109003 () Bool)

(declare-fun e!71394 () Bool)

(declare-datatypes ((tuple2!9030 0))(
  ( (tuple2!9031 (_1!4772 BitStream!3998) (_2!4772 Bool)) )
))
(declare-fun lt!164579 () tuple2!9030)

(declare-fun lt!164563 () tuple2!9030)

(assert (=> b!109003 (= e!71394 (= (_2!4772 lt!164579) (_2!4772 lt!164563)))))

(declare-fun b!109004 () Bool)

(declare-fun res!89912 () Bool)

(declare-fun e!71390 () Bool)

(assert (=> b!109004 (=> (not res!89912) (not e!71390))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109004 (= res!89912 (invariant!0 (currentBit!5184 thiss!1305) (currentByte!5189 thiss!1305) (size!2262 (buf!2653 (_2!4771 lt!164565)))))))

(declare-fun b!109005 () Bool)

(declare-fun e!71399 () Bool)

(assert (=> b!109005 (= e!71392 e!71399)))

(declare-fun res!89904 () Bool)

(assert (=> b!109005 (=> (not res!89904) (not e!71399))))

(declare-fun lt!164572 () tuple2!9030)

(declare-fun lt!164578 () Bool)

(assert (=> b!109005 (= res!89904 (and (= (_2!4772 lt!164572) lt!164578) (= (_1!4772 lt!164572) (_2!4771 lt!164565))))))

(declare-fun readBitPure!0 (BitStream!3998) tuple2!9030)

(declare-fun readerFrom!0 (BitStream!3998 (_ BitVec 32) (_ BitVec 32)) BitStream!3998)

(assert (=> b!109005 (= lt!164572 (readBitPure!0 (readerFrom!0 (_2!4771 lt!164565) (currentBit!5184 thiss!1305) (currentByte!5189 thiss!1305))))))

(declare-fun b!109006 () Bool)

(declare-fun e!71398 () Bool)

(declare-fun array_inv!2064 (array!4971) Bool)

(assert (=> b!109006 (= e!71398 (array_inv!2064 (buf!2653 thiss!1305)))))

(declare-fun b!109007 () Bool)

(declare-fun e!71396 () Bool)

(assert (=> b!109007 (= e!71396 e!71392)))

(declare-fun res!89906 () Bool)

(assert (=> b!109007 (=> (not res!89906) (not e!71392))))

(declare-fun lt!164580 () (_ BitVec 64))

(declare-fun lt!164571 () (_ BitVec 64))

(assert (=> b!109007 (= res!89906 (= lt!164580 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164571)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109007 (= lt!164580 (bitIndex!0 (size!2262 (buf!2653 (_2!4771 lt!164565))) (currentByte!5189 (_2!4771 lt!164565)) (currentBit!5184 (_2!4771 lt!164565))))))

(assert (=> b!109007 (= lt!164571 (bitIndex!0 (size!2262 (buf!2653 thiss!1305)) (currentByte!5189 thiss!1305) (currentBit!5184 thiss!1305)))))

(declare-fun b!109008 () Bool)

(declare-fun lt!164583 () tuple2!9028)

(assert (=> b!109008 (= e!71390 (invariant!0 (currentBit!5184 thiss!1305) (currentByte!5189 thiss!1305) (size!2262 (buf!2653 (_2!4771 lt!164583)))))))

(declare-fun res!89907 () Bool)

(declare-fun e!71395 () Bool)

(assert (=> start!21608 (=> (not res!89907) (not e!71395))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21608 (= res!89907 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21608 e!71395))

(assert (=> start!21608 true))

(declare-fun inv!12 (BitStream!3998) Bool)

(assert (=> start!21608 (and (inv!12 thiss!1305) e!71398)))

(declare-fun b!109009 () Bool)

(declare-fun res!89910 () Bool)

(declare-fun e!71397 () Bool)

(assert (=> b!109009 (=> (not res!89910) (not e!71397))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109009 (= res!89910 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109010 () Bool)

(assert (=> b!109010 (= e!71399 (= (bitIndex!0 (size!2262 (buf!2653 (_1!4772 lt!164572))) (currentByte!5189 (_1!4772 lt!164572)) (currentBit!5184 (_1!4772 lt!164572))) lt!164580))))

(declare-fun b!109011 () Bool)

(declare-fun e!71393 () Bool)

(assert (=> b!109011 (= e!71393 true)))

(declare-fun e!71389 () Bool)

(assert (=> b!109011 e!71389))

(declare-fun res!89913 () Bool)

(assert (=> b!109011 (=> (not res!89913) (not e!71389))))

(declare-datatypes ((tuple2!9032 0))(
  ( (tuple2!9033 (_1!4773 BitStream!3998) (_2!4773 BitStream!3998)) )
))
(declare-fun lt!164577 () tuple2!9032)

(declare-fun lt!164566 () (_ BitVec 64))

(declare-fun lt!164561 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3998 (_ BitVec 64)) BitStream!3998)

(assert (=> b!109011 (= res!89913 (= (_1!4773 lt!164577) (withMovedBitIndex!0 (_2!4773 lt!164577) (bvsub lt!164561 lt!164566))))))

(assert (=> b!109011 (= lt!164561 (bitIndex!0 (size!2262 (buf!2653 (_2!4771 lt!164565))) (currentByte!5189 (_2!4771 lt!164565)) (currentBit!5184 (_2!4771 lt!164565))))))

(declare-fun lt!164570 () tuple2!9032)

(declare-fun lt!164559 () (_ BitVec 64))

(assert (=> b!109011 (= (_1!4773 lt!164570) (withMovedBitIndex!0 (_2!4773 lt!164570) (bvsub lt!164559 lt!164566)))))

(assert (=> b!109011 (= lt!164566 (bitIndex!0 (size!2262 (buf!2653 (_2!4771 lt!164583))) (currentByte!5189 (_2!4771 lt!164583)) (currentBit!5184 (_2!4771 lt!164583))))))

(assert (=> b!109011 (= lt!164559 (bitIndex!0 (size!2262 (buf!2653 thiss!1305)) (currentByte!5189 thiss!1305) (currentBit!5184 thiss!1305)))))

(declare-datatypes ((tuple2!9034 0))(
  ( (tuple2!9035 (_1!4774 BitStream!3998) (_2!4774 (_ BitVec 64))) )
))
(declare-fun lt!164575 () tuple2!9034)

(declare-fun lt!164557 () tuple2!9034)

(assert (=> b!109011 (and (= (_2!4774 lt!164575) (_2!4774 lt!164557)) (= (_1!4774 lt!164575) (_1!4774 lt!164557)))))

(declare-fun lt!164568 () (_ BitVec 64))

(declare-fun lt!164576 () Unit!6665)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6665)

(assert (=> b!109011 (= lt!164576 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4773 lt!164570) nBits!396 i!615 lt!164568))))

(declare-fun lt!164582 () BitStream!3998)

(declare-fun lt!164564 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9034)

(assert (=> b!109011 (= lt!164557 (readNLeastSignificantBitsLoopPure!0 lt!164582 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164564))))

(assert (=> b!109011 (= lt!164582 (withMovedBitIndex!0 (_1!4773 lt!164570) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109012 () Bool)

(declare-fun res!89911 () Bool)

(assert (=> b!109012 (=> (not res!89911) (not e!71397))))

(assert (=> b!109012 (= res!89911 (bvslt i!615 nBits!396))))

(declare-fun b!109013 () Bool)

(assert (=> b!109013 (= e!71397 (not e!71393))))

(declare-fun res!89903 () Bool)

(assert (=> b!109013 (=> res!89903 e!71393)))

(declare-fun lt!164585 () tuple2!9034)

(assert (=> b!109013 (= res!89903 (not (= (_1!4774 lt!164585) (_2!4773 lt!164577))))))

(assert (=> b!109013 (= lt!164585 (readNLeastSignificantBitsLoopPure!0 (_1!4773 lt!164577) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164564))))

(declare-fun lt!164567 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109013 (validate_offset_bits!1 ((_ sign_extend 32) (size!2262 (buf!2653 (_2!4771 lt!164583)))) ((_ sign_extend 32) (currentByte!5189 (_2!4771 lt!164565))) ((_ sign_extend 32) (currentBit!5184 (_2!4771 lt!164565))) lt!164567)))

(declare-fun lt!164560 () Unit!6665)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3998 array!4971 (_ BitVec 64)) Unit!6665)

(assert (=> b!109013 (= lt!164560 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4771 lt!164565) (buf!2653 (_2!4771 lt!164583)) lt!164567))))

(assert (=> b!109013 (= lt!164567 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164573 () (_ BitVec 64))

(declare-fun lt!164558 () tuple2!9030)

(assert (=> b!109013 (= lt!164564 (bvor lt!164568 (ite (_2!4772 lt!164558) lt!164573 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109013 (= lt!164575 (readNLeastSignificantBitsLoopPure!0 (_1!4773 lt!164570) nBits!396 i!615 lt!164568))))

(declare-fun lt!164569 () (_ BitVec 64))

(assert (=> b!109013 (validate_offset_bits!1 ((_ sign_extend 32) (size!2262 (buf!2653 (_2!4771 lt!164583)))) ((_ sign_extend 32) (currentByte!5189 thiss!1305)) ((_ sign_extend 32) (currentBit!5184 thiss!1305)) lt!164569)))

(declare-fun lt!164574 () Unit!6665)

(assert (=> b!109013 (= lt!164574 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2653 (_2!4771 lt!164583)) lt!164569))))

(assert (=> b!109013 (= lt!164568 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!109013 (= (_2!4772 lt!164558) lt!164578)))

(assert (=> b!109013 (= lt!164558 (readBitPure!0 (_1!4773 lt!164570)))))

(declare-fun reader!0 (BitStream!3998 BitStream!3998) tuple2!9032)

(assert (=> b!109013 (= lt!164577 (reader!0 (_2!4771 lt!164565) (_2!4771 lt!164583)))))

(assert (=> b!109013 (= lt!164570 (reader!0 thiss!1305 (_2!4771 lt!164583)))))

(assert (=> b!109013 e!71394))

(declare-fun res!89902 () Bool)

(assert (=> b!109013 (=> (not res!89902) (not e!71394))))

(assert (=> b!109013 (= res!89902 (= (bitIndex!0 (size!2262 (buf!2653 (_1!4772 lt!164579))) (currentByte!5189 (_1!4772 lt!164579)) (currentBit!5184 (_1!4772 lt!164579))) (bitIndex!0 (size!2262 (buf!2653 (_1!4772 lt!164563))) (currentByte!5189 (_1!4772 lt!164563)) (currentBit!5184 (_1!4772 lt!164563)))))))

(declare-fun lt!164581 () Unit!6665)

(declare-fun lt!164562 () BitStream!3998)

(declare-fun readBitPrefixLemma!0 (BitStream!3998 BitStream!3998) Unit!6665)

(assert (=> b!109013 (= lt!164581 (readBitPrefixLemma!0 lt!164562 (_2!4771 lt!164583)))))

(assert (=> b!109013 (= lt!164563 (readBitPure!0 (BitStream!3999 (buf!2653 (_2!4771 lt!164583)) (currentByte!5189 thiss!1305) (currentBit!5184 thiss!1305))))))

(assert (=> b!109013 (= lt!164579 (readBitPure!0 lt!164562))))

(assert (=> b!109013 (= lt!164562 (BitStream!3999 (buf!2653 (_2!4771 lt!164565)) (currentByte!5189 thiss!1305) (currentBit!5184 thiss!1305)))))

(assert (=> b!109013 e!71390))

(declare-fun res!89908 () Bool)

(assert (=> b!109013 (=> (not res!89908) (not e!71390))))

(assert (=> b!109013 (= res!89908 (isPrefixOf!0 thiss!1305 (_2!4771 lt!164583)))))

(declare-fun lt!164584 () Unit!6665)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3998 BitStream!3998 BitStream!3998) Unit!6665)

(assert (=> b!109013 (= lt!164584 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4771 lt!164565) (_2!4771 lt!164583)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3998 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9028)

(assert (=> b!109013 (= lt!164583 (appendNLeastSignificantBitsLoop!0 (_2!4771 lt!164565) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!109013 e!71396))

(declare-fun res!89909 () Bool)

(assert (=> b!109013 (=> (not res!89909) (not e!71396))))

(assert (=> b!109013 (= res!89909 (= (size!2262 (buf!2653 thiss!1305)) (size!2262 (buf!2653 (_2!4771 lt!164565)))))))

(declare-fun appendBit!0 (BitStream!3998 Bool) tuple2!9028)

(assert (=> b!109013 (= lt!164565 (appendBit!0 thiss!1305 lt!164578))))

(assert (=> b!109013 (= lt!164578 (not (= (bvand v!199 lt!164573) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109013 (= lt!164573 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109014 () Bool)

(assert (=> b!109014 (= e!71395 e!71397)))

(declare-fun res!89905 () Bool)

(assert (=> b!109014 (=> (not res!89905) (not e!71397))))

(assert (=> b!109014 (= res!89905 (validate_offset_bits!1 ((_ sign_extend 32) (size!2262 (buf!2653 thiss!1305))) ((_ sign_extend 32) (currentByte!5189 thiss!1305)) ((_ sign_extend 32) (currentBit!5184 thiss!1305)) lt!164569))))

(assert (=> b!109014 (= lt!164569 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109015 () Bool)

(assert (=> b!109015 (= e!71389 (and (= lt!164559 (bvsub lt!164561 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4773 lt!164577) lt!164582)) (and (= (_2!4774 lt!164575) (_2!4774 lt!164585)) (= (_1!4774 lt!164575) (_2!4773 lt!164570))))))))

(assert (= (and start!21608 res!89907) b!109014))

(assert (= (and b!109014 res!89905) b!109009))

(assert (= (and b!109009 res!89910) b!109012))

(assert (= (and b!109012 res!89911) b!109013))

(assert (= (and b!109013 res!89909) b!109007))

(assert (= (and b!109007 res!89906) b!109002))

(assert (= (and b!109002 res!89914) b!109005))

(assert (= (and b!109005 res!89904) b!109010))

(assert (= (and b!109013 res!89908) b!109004))

(assert (= (and b!109004 res!89912) b!109008))

(assert (= (and b!109013 res!89902) b!109003))

(assert (= (and b!109013 (not res!89903)) b!109011))

(assert (= (and b!109011 res!89913) b!109015))

(assert (= start!21608 b!109006))

(declare-fun m!161691 () Bool)

(assert (=> b!109006 m!161691))

(declare-fun m!161693 () Bool)

(assert (=> b!109010 m!161693))

(declare-fun m!161695 () Bool)

(assert (=> start!21608 m!161695))

(declare-fun m!161697 () Bool)

(assert (=> b!109004 m!161697))

(declare-fun m!161699 () Bool)

(assert (=> b!109009 m!161699))

(declare-fun m!161701 () Bool)

(assert (=> b!109007 m!161701))

(declare-fun m!161703 () Bool)

(assert (=> b!109007 m!161703))

(declare-fun m!161705 () Bool)

(assert (=> b!109013 m!161705))

(declare-fun m!161707 () Bool)

(assert (=> b!109013 m!161707))

(declare-fun m!161709 () Bool)

(assert (=> b!109013 m!161709))

(declare-fun m!161711 () Bool)

(assert (=> b!109013 m!161711))

(declare-fun m!161713 () Bool)

(assert (=> b!109013 m!161713))

(declare-fun m!161715 () Bool)

(assert (=> b!109013 m!161715))

(declare-fun m!161717 () Bool)

(assert (=> b!109013 m!161717))

(declare-fun m!161719 () Bool)

(assert (=> b!109013 m!161719))

(declare-fun m!161721 () Bool)

(assert (=> b!109013 m!161721))

(declare-fun m!161723 () Bool)

(assert (=> b!109013 m!161723))

(declare-fun m!161725 () Bool)

(assert (=> b!109013 m!161725))

(declare-fun m!161727 () Bool)

(assert (=> b!109013 m!161727))

(declare-fun m!161729 () Bool)

(assert (=> b!109013 m!161729))

(declare-fun m!161731 () Bool)

(assert (=> b!109013 m!161731))

(declare-fun m!161733 () Bool)

(assert (=> b!109013 m!161733))

(declare-fun m!161735 () Bool)

(assert (=> b!109013 m!161735))

(declare-fun m!161737 () Bool)

(assert (=> b!109013 m!161737))

(declare-fun m!161739 () Bool)

(assert (=> b!109013 m!161739))

(declare-fun m!161741 () Bool)

(assert (=> b!109013 m!161741))

(declare-fun m!161743 () Bool)

(assert (=> b!109008 m!161743))

(declare-fun m!161745 () Bool)

(assert (=> b!109011 m!161745))

(declare-fun m!161747 () Bool)

(assert (=> b!109011 m!161747))

(declare-fun m!161749 () Bool)

(assert (=> b!109011 m!161749))

(assert (=> b!109011 m!161703))

(declare-fun m!161751 () Bool)

(assert (=> b!109011 m!161751))

(declare-fun m!161753 () Bool)

(assert (=> b!109011 m!161753))

(assert (=> b!109011 m!161701))

(declare-fun m!161755 () Bool)

(assert (=> b!109011 m!161755))

(declare-fun m!161757 () Bool)

(assert (=> b!109005 m!161757))

(assert (=> b!109005 m!161757))

(declare-fun m!161759 () Bool)

(assert (=> b!109005 m!161759))

(declare-fun m!161761 () Bool)

(assert (=> b!109002 m!161761))

(declare-fun m!161763 () Bool)

(assert (=> b!109014 m!161763))

(push 1)

