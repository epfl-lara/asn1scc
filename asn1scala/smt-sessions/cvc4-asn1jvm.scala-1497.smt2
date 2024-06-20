; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41316 () Bool)

(assert start!41316)

(declare-fun res!162019 () Bool)

(declare-fun e!133392 () Bool)

(assert (=> start!41316 (=> (not res!162019) (not e!133392))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41316 (= res!162019 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41316 e!133392))

(assert (=> start!41316 true))

(declare-datatypes ((array!9990 0))(
  ( (array!9991 (arr!5337 (Array (_ BitVec 32) (_ BitVec 8))) (size!4407 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7922 0))(
  ( (BitStream!7923 (buf!4887 array!9990) (currentByte!9171 (_ BitVec 32)) (currentBit!9166 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7922)

(declare-fun e!133393 () Bool)

(declare-fun inv!12 (BitStream!7922) Bool)

(assert (=> start!41316 (and (inv!12 thiss!1204) e!133393)))

(declare-fun b!193787 () Bool)

(declare-fun res!162027 () Bool)

(declare-fun e!133399 () Bool)

(assert (=> b!193787 (=> (not res!162027) (not e!133399))))

(declare-fun lt!300725 () (_ BitVec 64))

(declare-fun lt!300738 () (_ BitVec 64))

(declare-datatypes ((tuple2!16788 0))(
  ( (tuple2!16789 (_1!9039 BitStream!7922) (_2!9039 BitStream!7922)) )
))
(declare-fun lt!300720 () tuple2!16788)

(declare-fun withMovedBitIndex!0 (BitStream!7922 (_ BitVec 64)) BitStream!7922)

(assert (=> b!193787 (= res!162027 (= (_1!9039 lt!300720) (withMovedBitIndex!0 (_2!9039 lt!300720) (bvsub lt!300725 lt!300738))))))

(declare-fun b!193788 () Bool)

(declare-fun res!162018 () Bool)

(declare-fun e!133403 () Bool)

(assert (=> b!193788 (=> res!162018 e!133403)))

(declare-datatypes ((Unit!13691 0))(
  ( (Unit!13692) )
))
(declare-datatypes ((tuple2!16790 0))(
  ( (tuple2!16791 (_1!9040 Unit!13691) (_2!9040 BitStream!7922)) )
))
(declare-fun lt!300739 () tuple2!16790)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193788 (= res!162018 (not (invariant!0 (currentBit!9166 (_2!9040 lt!300739)) (currentByte!9171 (_2!9040 lt!300739)) (size!4407 (buf!4887 (_2!9040 lt!300739))))))))

(declare-fun b!193789 () Bool)

(declare-fun e!133406 () Bool)

(assert (=> b!193789 (= e!133403 e!133406)))

(declare-fun res!162014 () Bool)

(assert (=> b!193789 (=> res!162014 e!133406)))

(declare-datatypes ((tuple2!16792 0))(
  ( (tuple2!16793 (_1!9041 BitStream!7922) (_2!9041 (_ BitVec 64))) )
))
(declare-fun lt!300735 () tuple2!16792)

(assert (=> b!193789 (= res!162014 (not (= (_1!9041 lt!300735) (_2!9039 lt!300720))))))

(declare-fun lt!300716 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16792)

(assert (=> b!193789 (= lt!300735 (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!300720) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300716))))

(declare-fun lt!300729 () tuple2!16790)

(declare-fun lt!300722 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!193789 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729))) lt!300722)))

(declare-fun lt!300723 () Unit!13691)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7922 array!9990 (_ BitVec 64)) Unit!13691)

(assert (=> b!193789 (= lt!300723 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9040 lt!300729) (buf!4887 (_2!9040 lt!300739)) lt!300722))))

(assert (=> b!193789 (= lt!300722 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!300714 () (_ BitVec 64))

(declare-fun lt!300721 () (_ BitVec 64))

(declare-datatypes ((tuple2!16794 0))(
  ( (tuple2!16795 (_1!9042 BitStream!7922) (_2!9042 Bool)) )
))
(declare-fun lt!300719 () tuple2!16794)

(assert (=> b!193789 (= lt!300716 (bvor lt!300714 (ite (_2!9042 lt!300719) lt!300721 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!300715 () tuple2!16788)

(declare-fun lt!300732 () tuple2!16792)

(assert (=> b!193789 (= lt!300732 (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!300715) nBits!348 i!590 lt!300714))))

(declare-fun lt!300717 () (_ BitVec 64))

(assert (=> b!193789 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))) ((_ sign_extend 32) (currentByte!9171 thiss!1204)) ((_ sign_extend 32) (currentBit!9166 thiss!1204)) lt!300717)))

(declare-fun lt!300711 () Unit!13691)

(assert (=> b!193789 (= lt!300711 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4887 (_2!9040 lt!300739)) lt!300717))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193789 (= lt!300714 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!300724 () Bool)

(assert (=> b!193789 (= (_2!9042 lt!300719) lt!300724)))

(declare-fun readBitPure!0 (BitStream!7922) tuple2!16794)

(assert (=> b!193789 (= lt!300719 (readBitPure!0 (_1!9039 lt!300715)))))

(declare-fun reader!0 (BitStream!7922 BitStream!7922) tuple2!16788)

(assert (=> b!193789 (= lt!300720 (reader!0 (_2!9040 lt!300729) (_2!9040 lt!300739)))))

(assert (=> b!193789 (= lt!300715 (reader!0 thiss!1204 (_2!9040 lt!300739)))))

(declare-fun e!133404 () Bool)

(assert (=> b!193789 e!133404))

(declare-fun res!162012 () Bool)

(assert (=> b!193789 (=> (not res!162012) (not e!133404))))

(declare-fun lt!300727 () tuple2!16794)

(declare-fun lt!300733 () tuple2!16794)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193789 (= res!162012 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!300727))) (currentByte!9171 (_1!9042 lt!300727)) (currentBit!9166 (_1!9042 lt!300727))) (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!300733))) (currentByte!9171 (_1!9042 lt!300733)) (currentBit!9166 (_1!9042 lt!300733)))))))

(declare-fun lt!300731 () Unit!13691)

(declare-fun lt!300737 () BitStream!7922)

(declare-fun readBitPrefixLemma!0 (BitStream!7922 BitStream!7922) Unit!13691)

(assert (=> b!193789 (= lt!300731 (readBitPrefixLemma!0 lt!300737 (_2!9040 lt!300739)))))

(assert (=> b!193789 (= lt!300733 (readBitPure!0 (BitStream!7923 (buf!4887 (_2!9040 lt!300739)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204))))))

(assert (=> b!193789 (= lt!300727 (readBitPure!0 lt!300737))))

(declare-fun e!133405 () Bool)

(assert (=> b!193789 e!133405))

(declare-fun res!162013 () Bool)

(assert (=> b!193789 (=> (not res!162013) (not e!133405))))

(assert (=> b!193789 (= res!162013 (invariant!0 (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204) (size!4407 (buf!4887 (_2!9040 lt!300729)))))))

(assert (=> b!193789 (= lt!300737 (BitStream!7923 (buf!4887 (_2!9040 lt!300729)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)))))

(declare-fun b!193790 () Bool)

(assert (=> b!193790 (= e!133405 (invariant!0 (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204) (size!4407 (buf!4887 (_2!9040 lt!300739)))))))

(declare-fun lt!300734 () (_ BitVec 64))

(declare-fun b!193791 () Bool)

(declare-fun lt!300726 () BitStream!7922)

(assert (=> b!193791 (= e!133399 (and (= lt!300734 (bvsub lt!300725 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9039 lt!300720) lt!300726)) (= (_2!9041 lt!300732) (_2!9041 lt!300735)))))))

(declare-fun b!193792 () Bool)

(declare-fun e!133396 () Bool)

(declare-fun e!133401 () Bool)

(assert (=> b!193792 (= e!133396 e!133401)))

(declare-fun res!162026 () Bool)

(assert (=> b!193792 (=> (not res!162026) (not e!133401))))

(declare-fun lt!300712 () (_ BitVec 64))

(declare-fun lt!300728 () (_ BitVec 64))

(assert (=> b!193792 (= res!162026 (= lt!300712 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300728)))))

(assert (=> b!193792 (= lt!300712 (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))))))

(assert (=> b!193792 (= lt!300728 (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)))))

(declare-fun b!193793 () Bool)

(declare-fun res!162015 () Bool)

(declare-fun e!133397 () Bool)

(assert (=> b!193793 (=> (not res!162015) (not e!133397))))

(assert (=> b!193793 (= res!162015 (not (= i!590 nBits!348)))))

(declare-fun b!193794 () Bool)

(declare-fun e!133395 () Bool)

(assert (=> b!193794 (= e!133395 (= (_1!9041 lt!300732) (_2!9039 lt!300715)))))

(declare-fun b!193795 () Bool)

(assert (=> b!193795 (= e!133404 (= (_2!9042 lt!300727) (_2!9042 lt!300733)))))

(declare-fun b!193796 () Bool)

(declare-fun e!133400 () Bool)

(assert (=> b!193796 (= e!133400 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9039 lt!300715)))) ((_ sign_extend 32) (currentByte!9171 (_1!9039 lt!300715))) ((_ sign_extend 32) (currentBit!9166 (_1!9039 lt!300715))) lt!300717))))

(assert (=> b!193796 e!133395))

(declare-fun res!162024 () Bool)

(assert (=> b!193796 (=> (not res!162024) (not e!133395))))

(assert (=> b!193796 (= res!162024 (= (size!4407 (buf!4887 thiss!1204)) (size!4407 (buf!4887 (_2!9040 lt!300739)))))))

(declare-fun b!193797 () Bool)

(declare-fun e!133394 () Bool)

(assert (=> b!193797 (= e!133401 e!133394)))

(declare-fun res!162030 () Bool)

(assert (=> b!193797 (=> (not res!162030) (not e!133394))))

(declare-fun lt!300730 () tuple2!16794)

(assert (=> b!193797 (= res!162030 (and (= (_2!9042 lt!300730) lt!300724) (= (_1!9042 lt!300730) (_2!9040 lt!300729))))))

(declare-fun readerFrom!0 (BitStream!7922 (_ BitVec 32) (_ BitVec 32)) BitStream!7922)

(assert (=> b!193797 (= lt!300730 (readBitPure!0 (readerFrom!0 (_2!9040 lt!300729) (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204))))))

(declare-fun b!193798 () Bool)

(assert (=> b!193798 (= e!133392 e!133397)))

(declare-fun res!162022 () Bool)

(assert (=> b!193798 (=> (not res!162022) (not e!133397))))

(assert (=> b!193798 (= res!162022 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 thiss!1204))) ((_ sign_extend 32) (currentByte!9171 thiss!1204)) ((_ sign_extend 32) (currentBit!9166 thiss!1204)) lt!300717))))

(assert (=> b!193798 (= lt!300717 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!193799 () Bool)

(assert (=> b!193799 (= e!133406 e!133400)))

(declare-fun res!162010 () Bool)

(assert (=> b!193799 (=> res!162010 e!133400)))

(assert (=> b!193799 (= res!162010 (not (= (_1!9039 lt!300720) lt!300726)))))

(assert (=> b!193799 e!133399))

(declare-fun res!162017 () Bool)

(assert (=> b!193799 (=> (not res!162017) (not e!133399))))

(declare-fun lt!300736 () tuple2!16792)

(assert (=> b!193799 (= res!162017 (and (= (_2!9041 lt!300732) (_2!9041 lt!300736)) (= (_1!9041 lt!300732) (_1!9041 lt!300736))))))

(declare-fun lt!300718 () Unit!13691)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13691)

(assert (=> b!193799 (= lt!300718 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9039 lt!300715) nBits!348 i!590 lt!300714))))

(assert (=> b!193799 (= lt!300736 (readNBitsLSBFirstsLoopPure!0 lt!300726 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300716))))

(assert (=> b!193799 (= lt!300726 (withMovedBitIndex!0 (_1!9039 lt!300715) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!193800 () Bool)

(declare-fun e!133398 () Bool)

(assert (=> b!193800 (= e!133397 (not e!133398))))

(declare-fun res!162009 () Bool)

(assert (=> b!193800 (=> res!162009 e!133398)))

(assert (=> b!193800 (= res!162009 (not (= lt!300725 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300734))))))

(assert (=> b!193800 (= lt!300725 (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))))))

(assert (=> b!193800 (= lt!300734 (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)))))

(assert (=> b!193800 e!133396))

(declare-fun res!162007 () Bool)

(assert (=> b!193800 (=> (not res!162007) (not e!133396))))

(assert (=> b!193800 (= res!162007 (= (size!4407 (buf!4887 thiss!1204)) (size!4407 (buf!4887 (_2!9040 lt!300729)))))))

(declare-fun appendBit!0 (BitStream!7922 Bool) tuple2!16790)

(assert (=> b!193800 (= lt!300729 (appendBit!0 thiss!1204 lt!300724))))

(assert (=> b!193800 (= lt!300724 (not (= (bvand v!189 lt!300721) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193800 (= lt!300721 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!193801 () Bool)

(declare-fun res!162029 () Bool)

(assert (=> b!193801 (=> res!162029 e!133403)))

(assert (=> b!193801 (= res!162029 (or (not (= (size!4407 (buf!4887 (_2!9040 lt!300739))) (size!4407 (buf!4887 thiss!1204)))) (not (= lt!300738 (bvsub (bvadd lt!300734 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!193802 () Bool)

(declare-fun res!162021 () Bool)

(assert (=> b!193802 (=> res!162021 e!133400)))

(assert (=> b!193802 (= res!162021 (not (= (bitIndex!0 (size!4407 (buf!4887 (_1!9041 lt!300732))) (currentByte!9171 (_1!9041 lt!300732)) (currentBit!9166 (_1!9041 lt!300732))) (bitIndex!0 (size!4407 (buf!4887 (_2!9039 lt!300715))) (currentByte!9171 (_2!9039 lt!300715)) (currentBit!9166 (_2!9039 lt!300715))))))))

(declare-fun b!193803 () Bool)

(declare-fun res!162011 () Bool)

(assert (=> b!193803 (=> (not res!162011) (not e!133399))))

(assert (=> b!193803 (= res!162011 (= (_1!9039 lt!300715) (withMovedBitIndex!0 (_2!9039 lt!300715) (bvsub lt!300734 lt!300738))))))

(declare-fun b!193804 () Bool)

(assert (=> b!193804 (= e!133398 e!133403)))

(declare-fun res!162008 () Bool)

(assert (=> b!193804 (=> res!162008 e!133403)))

(assert (=> b!193804 (= res!162008 (not (= lt!300738 (bvsub (bvsub (bvadd lt!300725 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!193804 (= lt!300738 (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300739))) (currentByte!9171 (_2!9040 lt!300739)) (currentBit!9166 (_2!9040 lt!300739))))))

(declare-fun isPrefixOf!0 (BitStream!7922 BitStream!7922) Bool)

(assert (=> b!193804 (isPrefixOf!0 thiss!1204 (_2!9040 lt!300739))))

(declare-fun lt!300713 () Unit!13691)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7922 BitStream!7922 BitStream!7922) Unit!13691)

(assert (=> b!193804 (= lt!300713 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9040 lt!300729) (_2!9040 lt!300739)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7922 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16790)

(assert (=> b!193804 (= lt!300739 (appendBitsLSBFirstLoopTR!0 (_2!9040 lt!300729) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!193805 () Bool)

(declare-fun res!162025 () Bool)

(assert (=> b!193805 (=> (not res!162025) (not e!133397))))

(assert (=> b!193805 (= res!162025 (invariant!0 (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204) (size!4407 (buf!4887 thiss!1204))))))

(declare-fun b!193806 () Bool)

(declare-fun res!162020 () Bool)

(assert (=> b!193806 (=> res!162020 e!133403)))

(assert (=> b!193806 (= res!162020 (not (isPrefixOf!0 thiss!1204 (_2!9040 lt!300729))))))

(declare-fun b!193807 () Bool)

(declare-fun array_inv!4148 (array!9990) Bool)

(assert (=> b!193807 (= e!133393 (array_inv!4148 (buf!4887 thiss!1204)))))

(declare-fun b!193808 () Bool)

(declare-fun res!162028 () Bool)

(assert (=> b!193808 (=> (not res!162028) (not e!133401))))

(assert (=> b!193808 (= res!162028 (isPrefixOf!0 thiss!1204 (_2!9040 lt!300729)))))

(declare-fun b!193809 () Bool)

(declare-fun res!162016 () Bool)

(assert (=> b!193809 (=> res!162016 e!133403)))

(assert (=> b!193809 (= res!162016 (not (isPrefixOf!0 (_2!9040 lt!300729) (_2!9040 lt!300739))))))

(declare-fun b!193810 () Bool)

(assert (=> b!193810 (= e!133394 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!300730))) (currentByte!9171 (_1!9042 lt!300730)) (currentBit!9166 (_1!9042 lt!300730))) lt!300712))))

(declare-fun b!193811 () Bool)

(declare-fun res!162023 () Bool)

(assert (=> b!193811 (=> (not res!162023) (not e!133395))))

(assert (=> b!193811 (= res!162023 (= (_2!9041 lt!300732) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (= (and start!41316 res!162019) b!193798))

(assert (= (and b!193798 res!162022) b!193805))

(assert (= (and b!193805 res!162025) b!193793))

(assert (= (and b!193793 res!162015) b!193800))

(assert (= (and b!193800 res!162007) b!193792))

(assert (= (and b!193792 res!162026) b!193808))

(assert (= (and b!193808 res!162028) b!193797))

(assert (= (and b!193797 res!162030) b!193810))

(assert (= (and b!193800 (not res!162009)) b!193804))

(assert (= (and b!193804 (not res!162008)) b!193788))

(assert (= (and b!193788 (not res!162018)) b!193801))

(assert (= (and b!193801 (not res!162029)) b!193809))

(assert (= (and b!193809 (not res!162016)) b!193806))

(assert (= (and b!193806 (not res!162020)) b!193789))

(assert (= (and b!193789 res!162013) b!193790))

(assert (= (and b!193789 res!162012) b!193795))

(assert (= (and b!193789 (not res!162014)) b!193799))

(assert (= (and b!193799 res!162017) b!193803))

(assert (= (and b!193803 res!162011) b!193787))

(assert (= (and b!193787 res!162027) b!193791))

(assert (= (and b!193799 (not res!162010)) b!193802))

(assert (= (and b!193802 (not res!162021)) b!193796))

(assert (= (and b!193796 res!162024) b!193811))

(assert (= (and b!193811 res!162023) b!193794))

(assert (= start!41316 b!193807))

(declare-fun m!300123 () Bool)

(assert (=> b!193789 m!300123))

(declare-fun m!300125 () Bool)

(assert (=> b!193789 m!300125))

(declare-fun m!300127 () Bool)

(assert (=> b!193789 m!300127))

(declare-fun m!300129 () Bool)

(assert (=> b!193789 m!300129))

(declare-fun m!300131 () Bool)

(assert (=> b!193789 m!300131))

(declare-fun m!300133 () Bool)

(assert (=> b!193789 m!300133))

(declare-fun m!300135 () Bool)

(assert (=> b!193789 m!300135))

(declare-fun m!300137 () Bool)

(assert (=> b!193789 m!300137))

(declare-fun m!300139 () Bool)

(assert (=> b!193789 m!300139))

(declare-fun m!300141 () Bool)

(assert (=> b!193789 m!300141))

(declare-fun m!300143 () Bool)

(assert (=> b!193789 m!300143))

(declare-fun m!300145 () Bool)

(assert (=> b!193789 m!300145))

(declare-fun m!300147 () Bool)

(assert (=> b!193789 m!300147))

(declare-fun m!300149 () Bool)

(assert (=> b!193789 m!300149))

(declare-fun m!300151 () Bool)

(assert (=> b!193789 m!300151))

(declare-fun m!300153 () Bool)

(assert (=> b!193789 m!300153))

(declare-fun m!300155 () Bool)

(assert (=> b!193808 m!300155))

(declare-fun m!300157 () Bool)

(assert (=> b!193805 m!300157))

(declare-fun m!300159 () Bool)

(assert (=> b!193807 m!300159))

(declare-fun m!300161 () Bool)

(assert (=> b!193811 m!300161))

(declare-fun m!300163 () Bool)

(assert (=> b!193809 m!300163))

(declare-fun m!300165 () Bool)

(assert (=> b!193797 m!300165))

(assert (=> b!193797 m!300165))

(declare-fun m!300167 () Bool)

(assert (=> b!193797 m!300167))

(declare-fun m!300169 () Bool)

(assert (=> b!193799 m!300169))

(declare-fun m!300171 () Bool)

(assert (=> b!193799 m!300171))

(declare-fun m!300173 () Bool)

(assert (=> b!193799 m!300173))

(declare-fun m!300175 () Bool)

(assert (=> b!193788 m!300175))

(declare-fun m!300177 () Bool)

(assert (=> b!193787 m!300177))

(declare-fun m!300179 () Bool)

(assert (=> b!193800 m!300179))

(declare-fun m!300181 () Bool)

(assert (=> b!193800 m!300181))

(declare-fun m!300183 () Bool)

(assert (=> b!193800 m!300183))

(declare-fun m!300185 () Bool)

(assert (=> b!193802 m!300185))

(declare-fun m!300187 () Bool)

(assert (=> b!193802 m!300187))

(declare-fun m!300189 () Bool)

(assert (=> start!41316 m!300189))

(declare-fun m!300191 () Bool)

(assert (=> b!193803 m!300191))

(assert (=> b!193806 m!300155))

(declare-fun m!300193 () Bool)

(assert (=> b!193804 m!300193))

(declare-fun m!300195 () Bool)

(assert (=> b!193804 m!300195))

(declare-fun m!300197 () Bool)

(assert (=> b!193804 m!300197))

(declare-fun m!300199 () Bool)

(assert (=> b!193804 m!300199))

(declare-fun m!300201 () Bool)

(assert (=> b!193796 m!300201))

(declare-fun m!300203 () Bool)

(assert (=> b!193798 m!300203))

(declare-fun m!300205 () Bool)

(assert (=> b!193810 m!300205))

(assert (=> b!193792 m!300179))

(assert (=> b!193792 m!300181))

(declare-fun m!300207 () Bool)

(assert (=> b!193790 m!300207))

(push 1)

(assert (not b!193796))

(assert (not b!193798))

(assert (not b!193802))

(assert (not b!193810))

(assert (not b!193808))

(assert (not b!193807))

(assert (not b!193806))

(assert (not b!193797))

(assert (not b!193788))

(assert (not b!193809))

(assert (not b!193799))

(assert (not b!193800))

(assert (not b!193811))

(assert (not start!41316))

(assert (not b!193792))

(assert (not b!193805))

(assert (not b!193803))

(assert (not b!193804))

(assert (not b!193787))

(assert (not b!193789))

(assert (not b!193790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-datatypes ((tuple2!16804 0))(
  ( (tuple2!16805 (_1!9047 (_ BitVec 64)) (_2!9047 BitStream!7922)) )
))
(declare-fun lt!301082 () tuple2!16804)

(declare-fun d!65825 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16804)

(assert (=> d!65825 (= lt!301082 (readNBitsLSBFirstsLoop!0 (_1!9039 lt!300715) nBits!348 i!590 lt!300714))))

(assert (=> d!65825 (= (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!300715) nBits!348 i!590 lt!300714) (tuple2!16793 (_2!9047 lt!301082) (_1!9047 lt!301082)))))

(declare-fun bs!16371 () Bool)

(assert (= bs!16371 d!65825))

(declare-fun m!300473 () Bool)

(assert (=> bs!16371 m!300473))

(assert (=> b!193789 d!65825))

(declare-fun d!65827 () Bool)

(declare-datatypes ((tuple2!16806 0))(
  ( (tuple2!16807 (_1!9048 Bool) (_2!9048 BitStream!7922)) )
))
(declare-fun lt!301085 () tuple2!16806)

(declare-fun readBit!0 (BitStream!7922) tuple2!16806)

(assert (=> d!65827 (= lt!301085 (readBit!0 (_1!9039 lt!300715)))))

(assert (=> d!65827 (= (readBitPure!0 (_1!9039 lt!300715)) (tuple2!16795 (_2!9048 lt!301085) (_1!9048 lt!301085)))))

(declare-fun bs!16372 () Bool)

(assert (= bs!16372 d!65827))

(declare-fun m!300475 () Bool)

(assert (=> bs!16372 m!300475))

(assert (=> b!193789 d!65827))

(declare-fun d!65829 () Bool)

(assert (=> d!65829 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!193789 d!65829))

(declare-fun d!65831 () Bool)

(declare-fun lt!301086 () tuple2!16804)

(assert (=> d!65831 (= lt!301086 (readNBitsLSBFirstsLoop!0 (_1!9039 lt!300720) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300716))))

(assert (=> d!65831 (= (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!300720) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300716) (tuple2!16793 (_2!9047 lt!301086) (_1!9047 lt!301086)))))

(declare-fun bs!16373 () Bool)

(assert (= bs!16373 d!65831))

(declare-fun m!300477 () Bool)

(assert (=> bs!16373 m!300477))

(assert (=> b!193789 d!65831))

(declare-fun d!65833 () Bool)

(declare-fun e!133480 () Bool)

(assert (=> d!65833 e!133480))

(declare-fun res!162148 () Bool)

(assert (=> d!65833 (=> (not res!162148) (not e!133480))))

(declare-fun lt!301102 () (_ BitVec 64))

(declare-fun lt!301101 () (_ BitVec 64))

(declare-fun lt!301104 () (_ BitVec 64))

(assert (=> d!65833 (= res!162148 (= lt!301101 (bvsub lt!301102 lt!301104)))))

(assert (=> d!65833 (or (= (bvand lt!301102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301104 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301102 lt!301104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65833 (= lt!301104 (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9042 lt!300733)))) ((_ sign_extend 32) (currentByte!9171 (_1!9042 lt!300733))) ((_ sign_extend 32) (currentBit!9166 (_1!9042 lt!300733)))))))

(declare-fun lt!301100 () (_ BitVec 64))

(declare-fun lt!301103 () (_ BitVec 64))

(assert (=> d!65833 (= lt!301102 (bvmul lt!301100 lt!301103))))

(assert (=> d!65833 (or (= lt!301100 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301103 (bvsdiv (bvmul lt!301100 lt!301103) lt!301100)))))

(assert (=> d!65833 (= lt!301103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65833 (= lt!301100 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9042 lt!300733)))))))

(assert (=> d!65833 (= lt!301101 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9171 (_1!9042 lt!300733))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9166 (_1!9042 lt!300733)))))))

(assert (=> d!65833 (invariant!0 (currentBit!9166 (_1!9042 lt!300733)) (currentByte!9171 (_1!9042 lt!300733)) (size!4407 (buf!4887 (_1!9042 lt!300733))))))

(assert (=> d!65833 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!300733))) (currentByte!9171 (_1!9042 lt!300733)) (currentBit!9166 (_1!9042 lt!300733))) lt!301101)))

(declare-fun b!193943 () Bool)

(declare-fun res!162147 () Bool)

(assert (=> b!193943 (=> (not res!162147) (not e!133480))))

(assert (=> b!193943 (= res!162147 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301101))))

(declare-fun b!193944 () Bool)

(declare-fun lt!301099 () (_ BitVec 64))

(assert (=> b!193944 (= e!133480 (bvsle lt!301101 (bvmul lt!301099 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193944 (or (= lt!301099 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301099 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301099)))))

(assert (=> b!193944 (= lt!301099 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9042 lt!300733)))))))

(assert (= (and d!65833 res!162148) b!193943))

(assert (= (and b!193943 res!162147) b!193944))

(declare-fun m!300479 () Bool)

(assert (=> d!65833 m!300479))

(declare-fun m!300481 () Bool)

(assert (=> d!65833 m!300481))

(assert (=> b!193789 d!65833))

(declare-fun d!65835 () Bool)

(assert (=> d!65835 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))) ((_ sign_extend 32) (currentByte!9171 thiss!1204)) ((_ sign_extend 32) (currentBit!9166 thiss!1204)) lt!300717)))

(declare-fun lt!301107 () Unit!13691)

(declare-fun choose!9 (BitStream!7922 array!9990 (_ BitVec 64) BitStream!7922) Unit!13691)

(assert (=> d!65835 (= lt!301107 (choose!9 thiss!1204 (buf!4887 (_2!9040 lt!300739)) lt!300717 (BitStream!7923 (buf!4887 (_2!9040 lt!300739)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204))))))

(assert (=> d!65835 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4887 (_2!9040 lt!300739)) lt!300717) lt!301107)))

(declare-fun bs!16374 () Bool)

(assert (= bs!16374 d!65835))

(assert (=> bs!16374 m!300151))

(declare-fun m!300483 () Bool)

(assert (=> bs!16374 m!300483))

(assert (=> b!193789 d!65835))

(declare-fun d!65837 () Bool)

(assert (=> d!65837 (= (invariant!0 (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204) (size!4407 (buf!4887 (_2!9040 lt!300729)))) (and (bvsge (currentBit!9166 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9166 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9171 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9171 thiss!1204) (size!4407 (buf!4887 (_2!9040 lt!300729)))) (and (= (currentBit!9166 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9171 thiss!1204) (size!4407 (buf!4887 (_2!9040 lt!300729))))))))))

(assert (=> b!193789 d!65837))

(declare-fun d!65839 () Bool)

(declare-fun e!133483 () Bool)

(assert (=> d!65839 e!133483))

(declare-fun res!162151 () Bool)

(assert (=> d!65839 (=> (not res!162151) (not e!133483))))

(declare-fun lt!301118 () tuple2!16794)

(declare-fun lt!301116 () tuple2!16794)

(assert (=> d!65839 (= res!162151 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!301118))) (currentByte!9171 (_1!9042 lt!301118)) (currentBit!9166 (_1!9042 lt!301118))) (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!301116))) (currentByte!9171 (_1!9042 lt!301116)) (currentBit!9166 (_1!9042 lt!301116)))))))

(declare-fun lt!301117 () BitStream!7922)

(declare-fun lt!301119 () Unit!13691)

(declare-fun choose!50 (BitStream!7922 BitStream!7922 BitStream!7922 tuple2!16794 tuple2!16794 BitStream!7922 Bool tuple2!16794 tuple2!16794 BitStream!7922 Bool) Unit!13691)

(assert (=> d!65839 (= lt!301119 (choose!50 lt!300737 (_2!9040 lt!300739) lt!301117 lt!301118 (tuple2!16795 (_1!9042 lt!301118) (_2!9042 lt!301118)) (_1!9042 lt!301118) (_2!9042 lt!301118) lt!301116 (tuple2!16795 (_1!9042 lt!301116) (_2!9042 lt!301116)) (_1!9042 lt!301116) (_2!9042 lt!301116)))))

(assert (=> d!65839 (= lt!301116 (readBitPure!0 lt!301117))))

(assert (=> d!65839 (= lt!301118 (readBitPure!0 lt!300737))))

(assert (=> d!65839 (= lt!301117 (BitStream!7923 (buf!4887 (_2!9040 lt!300739)) (currentByte!9171 lt!300737) (currentBit!9166 lt!300737)))))

(assert (=> d!65839 (invariant!0 (currentBit!9166 lt!300737) (currentByte!9171 lt!300737) (size!4407 (buf!4887 (_2!9040 lt!300739))))))

(assert (=> d!65839 (= (readBitPrefixLemma!0 lt!300737 (_2!9040 lt!300739)) lt!301119)))

(declare-fun b!193947 () Bool)

(assert (=> b!193947 (= e!133483 (= (_2!9042 lt!301118) (_2!9042 lt!301116)))))

(assert (= (and d!65839 res!162151) b!193947))

(declare-fun m!300485 () Bool)

(assert (=> d!65839 m!300485))

(declare-fun m!300487 () Bool)

(assert (=> d!65839 m!300487))

(assert (=> d!65839 m!300141))

(declare-fun m!300489 () Bool)

(assert (=> d!65839 m!300489))

(declare-fun m!300491 () Bool)

(assert (=> d!65839 m!300491))

(declare-fun m!300493 () Bool)

(assert (=> d!65839 m!300493))

(assert (=> b!193789 d!65839))

(declare-fun d!65841 () Bool)

(declare-fun lt!301120 () tuple2!16806)

(assert (=> d!65841 (= lt!301120 (readBit!0 (BitStream!7923 (buf!4887 (_2!9040 lt!300739)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204))))))

(assert (=> d!65841 (= (readBitPure!0 (BitStream!7923 (buf!4887 (_2!9040 lt!300739)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204))) (tuple2!16795 (_2!9048 lt!301120) (_1!9048 lt!301120)))))

(declare-fun bs!16375 () Bool)

(assert (= bs!16375 d!65841))

(declare-fun m!300495 () Bool)

(assert (=> bs!16375 m!300495))

(assert (=> b!193789 d!65841))

(declare-fun b!193958 () Bool)

(declare-fun e!133488 () Unit!13691)

(declare-fun Unit!13719 () Unit!13691)

(assert (=> b!193958 (= e!133488 Unit!13719)))

(declare-fun b!193959 () Bool)

(declare-fun res!162160 () Bool)

(declare-fun e!133489 () Bool)

(assert (=> b!193959 (=> (not res!162160) (not e!133489))))

(declare-fun lt!301165 () tuple2!16788)

(assert (=> b!193959 (= res!162160 (isPrefixOf!0 (_1!9039 lt!301165) thiss!1204))))

(declare-fun lt!301171 () (_ BitVec 64))

(declare-fun b!193960 () Bool)

(declare-fun lt!301164 () (_ BitVec 64))

(assert (=> b!193960 (= e!133489 (= (_1!9039 lt!301165) (withMovedBitIndex!0 (_2!9039 lt!301165) (bvsub lt!301171 lt!301164))))))

(assert (=> b!193960 (or (= (bvand lt!301171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301164 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301171 lt!301164) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193960 (= lt!301164 (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300739))) (currentByte!9171 (_2!9040 lt!300739)) (currentBit!9166 (_2!9040 lt!300739))))))

(assert (=> b!193960 (= lt!301171 (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)))))

(declare-fun b!193961 () Bool)

(declare-fun res!162158 () Bool)

(assert (=> b!193961 (=> (not res!162158) (not e!133489))))

(assert (=> b!193961 (= res!162158 (isPrefixOf!0 (_2!9039 lt!301165) (_2!9040 lt!300739)))))

(declare-fun d!65843 () Bool)

(assert (=> d!65843 e!133489))

(declare-fun res!162159 () Bool)

(assert (=> d!65843 (=> (not res!162159) (not e!133489))))

(assert (=> d!65843 (= res!162159 (isPrefixOf!0 (_1!9039 lt!301165) (_2!9039 lt!301165)))))

(declare-fun lt!301174 () BitStream!7922)

(assert (=> d!65843 (= lt!301165 (tuple2!16789 lt!301174 (_2!9040 lt!300739)))))

(declare-fun lt!301170 () Unit!13691)

(declare-fun lt!301173 () Unit!13691)

(assert (=> d!65843 (= lt!301170 lt!301173)))

(assert (=> d!65843 (isPrefixOf!0 lt!301174 (_2!9040 lt!300739))))

(assert (=> d!65843 (= lt!301173 (lemmaIsPrefixTransitive!0 lt!301174 (_2!9040 lt!300739) (_2!9040 lt!300739)))))

(declare-fun lt!301177 () Unit!13691)

(declare-fun lt!301175 () Unit!13691)

(assert (=> d!65843 (= lt!301177 lt!301175)))

(assert (=> d!65843 (isPrefixOf!0 lt!301174 (_2!9040 lt!300739))))

(assert (=> d!65843 (= lt!301175 (lemmaIsPrefixTransitive!0 lt!301174 thiss!1204 (_2!9040 lt!300739)))))

(declare-fun lt!301168 () Unit!13691)

(assert (=> d!65843 (= lt!301168 e!133488)))

(declare-fun c!9690 () Bool)

(assert (=> d!65843 (= c!9690 (not (= (size!4407 (buf!4887 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!301169 () Unit!13691)

(declare-fun lt!301163 () Unit!13691)

(assert (=> d!65843 (= lt!301169 lt!301163)))

(assert (=> d!65843 (isPrefixOf!0 (_2!9040 lt!300739) (_2!9040 lt!300739))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7922) Unit!13691)

(assert (=> d!65843 (= lt!301163 (lemmaIsPrefixRefl!0 (_2!9040 lt!300739)))))

(declare-fun lt!301178 () Unit!13691)

(declare-fun lt!301180 () Unit!13691)

(assert (=> d!65843 (= lt!301178 lt!301180)))

(assert (=> d!65843 (= lt!301180 (lemmaIsPrefixRefl!0 (_2!9040 lt!300739)))))

(declare-fun lt!301161 () Unit!13691)

(declare-fun lt!301167 () Unit!13691)

(assert (=> d!65843 (= lt!301161 lt!301167)))

(assert (=> d!65843 (isPrefixOf!0 lt!301174 lt!301174)))

(assert (=> d!65843 (= lt!301167 (lemmaIsPrefixRefl!0 lt!301174))))

(declare-fun lt!301166 () Unit!13691)

(declare-fun lt!301179 () Unit!13691)

(assert (=> d!65843 (= lt!301166 lt!301179)))

(assert (=> d!65843 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65843 (= lt!301179 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65843 (= lt!301174 (BitStream!7923 (buf!4887 (_2!9040 lt!300739)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)))))

(assert (=> d!65843 (isPrefixOf!0 thiss!1204 (_2!9040 lt!300739))))

(assert (=> d!65843 (= (reader!0 thiss!1204 (_2!9040 lt!300739)) lt!301165)))

(declare-fun b!193962 () Bool)

(declare-fun lt!301176 () Unit!13691)

(assert (=> b!193962 (= e!133488 lt!301176)))

(declare-fun lt!301172 () (_ BitVec 64))

(assert (=> b!193962 (= lt!301172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!301162 () (_ BitVec 64))

(assert (=> b!193962 (= lt!301162 (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9990 array!9990 (_ BitVec 64) (_ BitVec 64)) Unit!13691)

(assert (=> b!193962 (= lt!301176 (arrayBitRangesEqSymmetric!0 (buf!4887 thiss!1204) (buf!4887 (_2!9040 lt!300739)) lt!301172 lt!301162))))

(declare-fun arrayBitRangesEq!0 (array!9990 array!9990 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!193962 (arrayBitRangesEq!0 (buf!4887 (_2!9040 lt!300739)) (buf!4887 thiss!1204) lt!301172 lt!301162)))

(assert (= (and d!65843 c!9690) b!193962))

(assert (= (and d!65843 (not c!9690)) b!193958))

(assert (= (and d!65843 res!162159) b!193959))

(assert (= (and b!193959 res!162160) b!193961))

(assert (= (and b!193961 res!162158) b!193960))

(declare-fun m!300497 () Bool)

(assert (=> b!193960 m!300497))

(assert (=> b!193960 m!300193))

(assert (=> b!193960 m!300181))

(declare-fun m!300499 () Bool)

(assert (=> b!193959 m!300499))

(declare-fun m!300501 () Bool)

(assert (=> d!65843 m!300501))

(declare-fun m!300503 () Bool)

(assert (=> d!65843 m!300503))

(assert (=> d!65843 m!300195))

(declare-fun m!300505 () Bool)

(assert (=> d!65843 m!300505))

(declare-fun m!300507 () Bool)

(assert (=> d!65843 m!300507))

(declare-fun m!300509 () Bool)

(assert (=> d!65843 m!300509))

(declare-fun m!300511 () Bool)

(assert (=> d!65843 m!300511))

(declare-fun m!300513 () Bool)

(assert (=> d!65843 m!300513))

(declare-fun m!300515 () Bool)

(assert (=> d!65843 m!300515))

(declare-fun m!300517 () Bool)

(assert (=> d!65843 m!300517))

(declare-fun m!300519 () Bool)

(assert (=> d!65843 m!300519))

(assert (=> b!193962 m!300181))

(declare-fun m!300521 () Bool)

(assert (=> b!193962 m!300521))

(declare-fun m!300523 () Bool)

(assert (=> b!193962 m!300523))

(declare-fun m!300525 () Bool)

(assert (=> b!193961 m!300525))

(assert (=> b!193789 d!65843))

(declare-fun d!65845 () Bool)

(declare-fun lt!301181 () tuple2!16806)

(assert (=> d!65845 (= lt!301181 (readBit!0 lt!300737))))

(assert (=> d!65845 (= (readBitPure!0 lt!300737) (tuple2!16795 (_2!9048 lt!301181) (_1!9048 lt!301181)))))

(declare-fun bs!16376 () Bool)

(assert (= bs!16376 d!65845))

(declare-fun m!300527 () Bool)

(assert (=> bs!16376 m!300527))

(assert (=> b!193789 d!65845))

(declare-fun d!65847 () Bool)

(assert (=> d!65847 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729))) lt!300722)))

(declare-fun lt!301182 () Unit!13691)

(assert (=> d!65847 (= lt!301182 (choose!9 (_2!9040 lt!300729) (buf!4887 (_2!9040 lt!300739)) lt!300722 (BitStream!7923 (buf!4887 (_2!9040 lt!300739)) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729)))))))

(assert (=> d!65847 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9040 lt!300729) (buf!4887 (_2!9040 lt!300739)) lt!300722) lt!301182)))

(declare-fun bs!16377 () Bool)

(assert (= bs!16377 d!65847))

(assert (=> bs!16377 m!300147))

(declare-fun m!300529 () Bool)

(assert (=> bs!16377 m!300529))

(assert (=> b!193789 d!65847))

(declare-fun d!65849 () Bool)

(assert (=> d!65849 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))) ((_ sign_extend 32) (currentByte!9171 thiss!1204)) ((_ sign_extend 32) (currentBit!9166 thiss!1204)) lt!300717) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))) ((_ sign_extend 32) (currentByte!9171 thiss!1204)) ((_ sign_extend 32) (currentBit!9166 thiss!1204))) lt!300717))))

(declare-fun bs!16378 () Bool)

(assert (= bs!16378 d!65849))

(declare-fun m!300531 () Bool)

(assert (=> bs!16378 m!300531))

(assert (=> b!193789 d!65849))

(declare-fun b!193963 () Bool)

(declare-fun e!133490 () Unit!13691)

(declare-fun Unit!13720 () Unit!13691)

(assert (=> b!193963 (= e!133490 Unit!13720)))

(declare-fun b!193964 () Bool)

(declare-fun res!162163 () Bool)

(declare-fun e!133491 () Bool)

(assert (=> b!193964 (=> (not res!162163) (not e!133491))))

(declare-fun lt!301187 () tuple2!16788)

(assert (=> b!193964 (= res!162163 (isPrefixOf!0 (_1!9039 lt!301187) (_2!9040 lt!300729)))))

(declare-fun lt!301186 () (_ BitVec 64))

(declare-fun lt!301193 () (_ BitVec 64))

(declare-fun b!193965 () Bool)

(assert (=> b!193965 (= e!133491 (= (_1!9039 lt!301187) (withMovedBitIndex!0 (_2!9039 lt!301187) (bvsub lt!301193 lt!301186))))))

(assert (=> b!193965 (or (= (bvand lt!301193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301186 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301193 lt!301186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193965 (= lt!301186 (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300739))) (currentByte!9171 (_2!9040 lt!300739)) (currentBit!9166 (_2!9040 lt!300739))))))

(assert (=> b!193965 (= lt!301193 (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))))))

(declare-fun b!193966 () Bool)

(declare-fun res!162161 () Bool)

(assert (=> b!193966 (=> (not res!162161) (not e!133491))))

(assert (=> b!193966 (= res!162161 (isPrefixOf!0 (_2!9039 lt!301187) (_2!9040 lt!300739)))))

(declare-fun d!65851 () Bool)

(assert (=> d!65851 e!133491))

(declare-fun res!162162 () Bool)

(assert (=> d!65851 (=> (not res!162162) (not e!133491))))

(assert (=> d!65851 (= res!162162 (isPrefixOf!0 (_1!9039 lt!301187) (_2!9039 lt!301187)))))

(declare-fun lt!301196 () BitStream!7922)

(assert (=> d!65851 (= lt!301187 (tuple2!16789 lt!301196 (_2!9040 lt!300739)))))

(declare-fun lt!301192 () Unit!13691)

(declare-fun lt!301195 () Unit!13691)

(assert (=> d!65851 (= lt!301192 lt!301195)))

(assert (=> d!65851 (isPrefixOf!0 lt!301196 (_2!9040 lt!300739))))

(assert (=> d!65851 (= lt!301195 (lemmaIsPrefixTransitive!0 lt!301196 (_2!9040 lt!300739) (_2!9040 lt!300739)))))

(declare-fun lt!301199 () Unit!13691)

(declare-fun lt!301197 () Unit!13691)

(assert (=> d!65851 (= lt!301199 lt!301197)))

(assert (=> d!65851 (isPrefixOf!0 lt!301196 (_2!9040 lt!300739))))

(assert (=> d!65851 (= lt!301197 (lemmaIsPrefixTransitive!0 lt!301196 (_2!9040 lt!300729) (_2!9040 lt!300739)))))

(declare-fun lt!301190 () Unit!13691)

(assert (=> d!65851 (= lt!301190 e!133490)))

(declare-fun c!9691 () Bool)

(assert (=> d!65851 (= c!9691 (not (= (size!4407 (buf!4887 (_2!9040 lt!300729))) #b00000000000000000000000000000000)))))

(declare-fun lt!301191 () Unit!13691)

(declare-fun lt!301185 () Unit!13691)

(assert (=> d!65851 (= lt!301191 lt!301185)))

(assert (=> d!65851 (isPrefixOf!0 (_2!9040 lt!300739) (_2!9040 lt!300739))))

(assert (=> d!65851 (= lt!301185 (lemmaIsPrefixRefl!0 (_2!9040 lt!300739)))))

(declare-fun lt!301200 () Unit!13691)

(declare-fun lt!301202 () Unit!13691)

(assert (=> d!65851 (= lt!301200 lt!301202)))

(assert (=> d!65851 (= lt!301202 (lemmaIsPrefixRefl!0 (_2!9040 lt!300739)))))

(declare-fun lt!301183 () Unit!13691)

(declare-fun lt!301189 () Unit!13691)

(assert (=> d!65851 (= lt!301183 lt!301189)))

(assert (=> d!65851 (isPrefixOf!0 lt!301196 lt!301196)))

(assert (=> d!65851 (= lt!301189 (lemmaIsPrefixRefl!0 lt!301196))))

(declare-fun lt!301188 () Unit!13691)

(declare-fun lt!301201 () Unit!13691)

(assert (=> d!65851 (= lt!301188 lt!301201)))

(assert (=> d!65851 (isPrefixOf!0 (_2!9040 lt!300729) (_2!9040 lt!300729))))

(assert (=> d!65851 (= lt!301201 (lemmaIsPrefixRefl!0 (_2!9040 lt!300729)))))

(assert (=> d!65851 (= lt!301196 (BitStream!7923 (buf!4887 (_2!9040 lt!300739)) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))))))

(assert (=> d!65851 (isPrefixOf!0 (_2!9040 lt!300729) (_2!9040 lt!300739))))

(assert (=> d!65851 (= (reader!0 (_2!9040 lt!300729) (_2!9040 lt!300739)) lt!301187)))

(declare-fun b!193967 () Bool)

(declare-fun lt!301198 () Unit!13691)

(assert (=> b!193967 (= e!133490 lt!301198)))

(declare-fun lt!301194 () (_ BitVec 64))

(assert (=> b!193967 (= lt!301194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!301184 () (_ BitVec 64))

(assert (=> b!193967 (= lt!301184 (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))))))

(assert (=> b!193967 (= lt!301198 (arrayBitRangesEqSymmetric!0 (buf!4887 (_2!9040 lt!300729)) (buf!4887 (_2!9040 lt!300739)) lt!301194 lt!301184))))

(assert (=> b!193967 (arrayBitRangesEq!0 (buf!4887 (_2!9040 lt!300739)) (buf!4887 (_2!9040 lt!300729)) lt!301194 lt!301184)))

(assert (= (and d!65851 c!9691) b!193967))

(assert (= (and d!65851 (not c!9691)) b!193963))

(assert (= (and d!65851 res!162162) b!193964))

(assert (= (and b!193964 res!162163) b!193966))

(assert (= (and b!193966 res!162161) b!193965))

(declare-fun m!300533 () Bool)

(assert (=> b!193965 m!300533))

(assert (=> b!193965 m!300193))

(assert (=> b!193965 m!300179))

(declare-fun m!300535 () Bool)

(assert (=> b!193964 m!300535))

(declare-fun m!300537 () Bool)

(assert (=> d!65851 m!300537))

(declare-fun m!300539 () Bool)

(assert (=> d!65851 m!300539))

(assert (=> d!65851 m!300163))

(declare-fun m!300541 () Bool)

(assert (=> d!65851 m!300541))

(assert (=> d!65851 m!300507))

(declare-fun m!300543 () Bool)

(assert (=> d!65851 m!300543))

(declare-fun m!300545 () Bool)

(assert (=> d!65851 m!300545))

(assert (=> d!65851 m!300513))

(declare-fun m!300547 () Bool)

(assert (=> d!65851 m!300547))

(declare-fun m!300549 () Bool)

(assert (=> d!65851 m!300549))

(declare-fun m!300551 () Bool)

(assert (=> d!65851 m!300551))

(assert (=> b!193967 m!300179))

(declare-fun m!300553 () Bool)

(assert (=> b!193967 m!300553))

(declare-fun m!300555 () Bool)

(assert (=> b!193967 m!300555))

(declare-fun m!300557 () Bool)

(assert (=> b!193966 m!300557))

(assert (=> b!193789 d!65851))

(declare-fun d!65853 () Bool)

(assert (=> d!65853 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729))) lt!300722) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729)))) lt!300722))))

(declare-fun bs!16379 () Bool)

(assert (= bs!16379 d!65853))

(declare-fun m!300559 () Bool)

(assert (=> bs!16379 m!300559))

(assert (=> b!193789 d!65853))

(declare-fun d!65855 () Bool)

(declare-fun e!133492 () Bool)

(assert (=> d!65855 e!133492))

(declare-fun res!162165 () Bool)

(assert (=> d!65855 (=> (not res!162165) (not e!133492))))

(declare-fun lt!301206 () (_ BitVec 64))

(declare-fun lt!301205 () (_ BitVec 64))

(declare-fun lt!301208 () (_ BitVec 64))

(assert (=> d!65855 (= res!162165 (= lt!301205 (bvsub lt!301206 lt!301208)))))

(assert (=> d!65855 (or (= (bvand lt!301206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301208 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301206 lt!301208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65855 (= lt!301208 (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9042 lt!300727)))) ((_ sign_extend 32) (currentByte!9171 (_1!9042 lt!300727))) ((_ sign_extend 32) (currentBit!9166 (_1!9042 lt!300727)))))))

(declare-fun lt!301204 () (_ BitVec 64))

(declare-fun lt!301207 () (_ BitVec 64))

(assert (=> d!65855 (= lt!301206 (bvmul lt!301204 lt!301207))))

(assert (=> d!65855 (or (= lt!301204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301207 (bvsdiv (bvmul lt!301204 lt!301207) lt!301204)))))

(assert (=> d!65855 (= lt!301207 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65855 (= lt!301204 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9042 lt!300727)))))))

(assert (=> d!65855 (= lt!301205 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9171 (_1!9042 lt!300727))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9166 (_1!9042 lt!300727)))))))

(assert (=> d!65855 (invariant!0 (currentBit!9166 (_1!9042 lt!300727)) (currentByte!9171 (_1!9042 lt!300727)) (size!4407 (buf!4887 (_1!9042 lt!300727))))))

(assert (=> d!65855 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!300727))) (currentByte!9171 (_1!9042 lt!300727)) (currentBit!9166 (_1!9042 lt!300727))) lt!301205)))

(declare-fun b!193968 () Bool)

(declare-fun res!162164 () Bool)

(assert (=> b!193968 (=> (not res!162164) (not e!133492))))

(assert (=> b!193968 (= res!162164 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301205))))

(declare-fun b!193969 () Bool)

(declare-fun lt!301203 () (_ BitVec 64))

(assert (=> b!193969 (= e!133492 (bvsle lt!301205 (bvmul lt!301203 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193969 (or (= lt!301203 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301203 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301203)))))

(assert (=> b!193969 (= lt!301203 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9042 lt!300727)))))))

(assert (= (and d!65855 res!162165) b!193968))

(assert (= (and b!193968 res!162164) b!193969))

(declare-fun m!300561 () Bool)

(assert (=> d!65855 m!300561))

(declare-fun m!300563 () Bool)

(assert (=> d!65855 m!300563))

(assert (=> b!193789 d!65855))

(declare-fun d!65857 () Bool)

(declare-fun e!133493 () Bool)

(assert (=> d!65857 e!133493))

(declare-fun res!162167 () Bool)

(assert (=> d!65857 (=> (not res!162167) (not e!133493))))

(declare-fun lt!301214 () (_ BitVec 64))

(declare-fun lt!301212 () (_ BitVec 64))

(declare-fun lt!301211 () (_ BitVec 64))

(assert (=> d!65857 (= res!162167 (= lt!301211 (bvsub lt!301212 lt!301214)))))

(assert (=> d!65857 (or (= (bvand lt!301212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301214 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301212 lt!301214) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65857 (= lt!301214 (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9042 lt!300730)))) ((_ sign_extend 32) (currentByte!9171 (_1!9042 lt!300730))) ((_ sign_extend 32) (currentBit!9166 (_1!9042 lt!300730)))))))

(declare-fun lt!301210 () (_ BitVec 64))

(declare-fun lt!301213 () (_ BitVec 64))

(assert (=> d!65857 (= lt!301212 (bvmul lt!301210 lt!301213))))

(assert (=> d!65857 (or (= lt!301210 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301213 (bvsdiv (bvmul lt!301210 lt!301213) lt!301210)))))

(assert (=> d!65857 (= lt!301213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65857 (= lt!301210 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9042 lt!300730)))))))

(assert (=> d!65857 (= lt!301211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9171 (_1!9042 lt!300730))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9166 (_1!9042 lt!300730)))))))

(assert (=> d!65857 (invariant!0 (currentBit!9166 (_1!9042 lt!300730)) (currentByte!9171 (_1!9042 lt!300730)) (size!4407 (buf!4887 (_1!9042 lt!300730))))))

(assert (=> d!65857 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!300730))) (currentByte!9171 (_1!9042 lt!300730)) (currentBit!9166 (_1!9042 lt!300730))) lt!301211)))

(declare-fun b!193970 () Bool)

(declare-fun res!162166 () Bool)

(assert (=> b!193970 (=> (not res!162166) (not e!133493))))

(assert (=> b!193970 (= res!162166 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301211))))

(declare-fun b!193971 () Bool)

(declare-fun lt!301209 () (_ BitVec 64))

(assert (=> b!193971 (= e!133493 (bvsle lt!301211 (bvmul lt!301209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193971 (or (= lt!301209 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301209 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301209)))))

(assert (=> b!193971 (= lt!301209 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9042 lt!300730)))))))

(assert (= (and d!65857 res!162167) b!193970))

(assert (= (and b!193970 res!162166) b!193971))

(declare-fun m!300565 () Bool)

(assert (=> d!65857 m!300565))

(declare-fun m!300567 () Bool)

(assert (=> d!65857 m!300567))

(assert (=> b!193810 d!65857))

(declare-fun d!65859 () Bool)

(declare-fun lt!301229 () tuple2!16792)

(declare-fun lt!301230 () tuple2!16792)

(assert (=> d!65859 (and (= (_2!9041 lt!301229) (_2!9041 lt!301230)) (= (_1!9041 lt!301229) (_1!9041 lt!301230)))))

(declare-fun lt!301231 () Unit!13691)

(declare-fun lt!301227 () BitStream!7922)

(declare-fun lt!301232 () Bool)

(declare-fun lt!301228 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16792 tuple2!16792 BitStream!7922 (_ BitVec 64) Bool BitStream!7922 (_ BitVec 64) tuple2!16792 tuple2!16792 BitStream!7922 (_ BitVec 64)) Unit!13691)

(assert (=> d!65859 (= lt!301231 (choose!56 (_1!9039 lt!300715) nBits!348 i!590 lt!300714 lt!301229 (tuple2!16793 (_1!9041 lt!301229) (_2!9041 lt!301229)) (_1!9041 lt!301229) (_2!9041 lt!301229) lt!301232 lt!301227 lt!301228 lt!301230 (tuple2!16793 (_1!9041 lt!301230) (_2!9041 lt!301230)) (_1!9041 lt!301230) (_2!9041 lt!301230)))))

(assert (=> d!65859 (= lt!301230 (readNBitsLSBFirstsLoopPure!0 lt!301227 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!301228))))

(assert (=> d!65859 (= lt!301228 (bvor lt!300714 (ite lt!301232 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65859 (= lt!301227 (withMovedBitIndex!0 (_1!9039 lt!300715) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65859 (= lt!301232 (_2!9042 (readBitPure!0 (_1!9039 lt!300715))))))

(assert (=> d!65859 (= lt!301229 (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!300715) nBits!348 i!590 lt!300714))))

(assert (=> d!65859 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9039 lt!300715) nBits!348 i!590 lt!300714) lt!301231)))

(declare-fun bs!16381 () Bool)

(assert (= bs!16381 d!65859))

(declare-fun m!300569 () Bool)

(assert (=> bs!16381 m!300569))

(assert (=> bs!16381 m!300145))

(assert (=> bs!16381 m!300125))

(declare-fun m!300571 () Bool)

(assert (=> bs!16381 m!300571))

(assert (=> bs!16381 m!300173))

(assert (=> b!193799 d!65859))

(declare-fun lt!301233 () tuple2!16804)

(declare-fun d!65861 () Bool)

(assert (=> d!65861 (= lt!301233 (readNBitsLSBFirstsLoop!0 lt!300726 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300716))))

(assert (=> d!65861 (= (readNBitsLSBFirstsLoopPure!0 lt!300726 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300716) (tuple2!16793 (_2!9047 lt!301233) (_1!9047 lt!301233)))))

(declare-fun bs!16382 () Bool)

(assert (= bs!16382 d!65861))

(declare-fun m!300573 () Bool)

(assert (=> bs!16382 m!300573))

(assert (=> b!193799 d!65861))

(declare-fun d!65863 () Bool)

(declare-fun e!133496 () Bool)

(assert (=> d!65863 e!133496))

(declare-fun res!162170 () Bool)

(assert (=> d!65863 (=> (not res!162170) (not e!133496))))

(declare-fun lt!301239 () (_ BitVec 64))

(declare-fun lt!301238 () BitStream!7922)

(assert (=> d!65863 (= res!162170 (= (bvadd lt!301239 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4407 (buf!4887 lt!301238)) (currentByte!9171 lt!301238) (currentBit!9166 lt!301238))))))

(assert (=> d!65863 (or (not (= (bvand lt!301239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301239 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65863 (= lt!301239 (bitIndex!0 (size!4407 (buf!4887 (_1!9039 lt!300715))) (currentByte!9171 (_1!9039 lt!300715)) (currentBit!9166 (_1!9039 lt!300715))))))

(declare-fun moveBitIndex!0 (BitStream!7922 (_ BitVec 64)) tuple2!16790)

(assert (=> d!65863 (= lt!301238 (_2!9040 (moveBitIndex!0 (_1!9039 lt!300715) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7922 (_ BitVec 64)) Bool)

(assert (=> d!65863 (moveBitIndexPrecond!0 (_1!9039 lt!300715) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65863 (= (withMovedBitIndex!0 (_1!9039 lt!300715) #b0000000000000000000000000000000000000000000000000000000000000001) lt!301238)))

(declare-fun b!193974 () Bool)

(assert (=> b!193974 (= e!133496 (= (size!4407 (buf!4887 (_1!9039 lt!300715))) (size!4407 (buf!4887 lt!301238))))))

(assert (= (and d!65863 res!162170) b!193974))

(declare-fun m!300575 () Bool)

(assert (=> d!65863 m!300575))

(declare-fun m!300577 () Bool)

(assert (=> d!65863 m!300577))

(declare-fun m!300579 () Bool)

(assert (=> d!65863 m!300579))

(declare-fun m!300581 () Bool)

(assert (=> d!65863 m!300581))

(assert (=> b!193799 d!65863))

(declare-fun d!65865 () Bool)

(assert (=> d!65865 (= (invariant!0 (currentBit!9166 (_2!9040 lt!300739)) (currentByte!9171 (_2!9040 lt!300739)) (size!4407 (buf!4887 (_2!9040 lt!300739)))) (and (bvsge (currentBit!9166 (_2!9040 lt!300739)) #b00000000000000000000000000000000) (bvslt (currentBit!9166 (_2!9040 lt!300739)) #b00000000000000000000000000001000) (bvsge (currentByte!9171 (_2!9040 lt!300739)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9171 (_2!9040 lt!300739)) (size!4407 (buf!4887 (_2!9040 lt!300739)))) (and (= (currentBit!9166 (_2!9040 lt!300739)) #b00000000000000000000000000000000) (= (currentByte!9171 (_2!9040 lt!300739)) (size!4407 (buf!4887 (_2!9040 lt!300739))))))))))

(assert (=> b!193788 d!65865))

(declare-fun d!65867 () Bool)

(assert (=> d!65867 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204) (size!4407 (buf!4887 thiss!1204))))))

(declare-fun bs!16383 () Bool)

(assert (= bs!16383 d!65867))

(assert (=> bs!16383 m!300157))

(assert (=> start!41316 d!65867))

(declare-fun d!65869 () Bool)

(declare-fun res!162177 () Bool)

(declare-fun e!133502 () Bool)

(assert (=> d!65869 (=> (not res!162177) (not e!133502))))

(assert (=> d!65869 (= res!162177 (= (size!4407 (buf!4887 (_2!9040 lt!300729))) (size!4407 (buf!4887 (_2!9040 lt!300739)))))))

(assert (=> d!65869 (= (isPrefixOf!0 (_2!9040 lt!300729) (_2!9040 lt!300739)) e!133502)))

(declare-fun b!193981 () Bool)

(declare-fun res!162178 () Bool)

(assert (=> b!193981 (=> (not res!162178) (not e!133502))))

(assert (=> b!193981 (= res!162178 (bvsle (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))) (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300739))) (currentByte!9171 (_2!9040 lt!300739)) (currentBit!9166 (_2!9040 lt!300739)))))))

(declare-fun b!193982 () Bool)

(declare-fun e!133501 () Bool)

(assert (=> b!193982 (= e!133502 e!133501)))

(declare-fun res!162179 () Bool)

(assert (=> b!193982 (=> res!162179 e!133501)))

(assert (=> b!193982 (= res!162179 (= (size!4407 (buf!4887 (_2!9040 lt!300729))) #b00000000000000000000000000000000))))

(declare-fun b!193983 () Bool)

(assert (=> b!193983 (= e!133501 (arrayBitRangesEq!0 (buf!4887 (_2!9040 lt!300729)) (buf!4887 (_2!9040 lt!300739)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729)))))))

(assert (= (and d!65869 res!162177) b!193981))

(assert (= (and b!193981 res!162178) b!193982))

(assert (= (and b!193982 (not res!162179)) b!193983))

(assert (=> b!193981 m!300179))

(assert (=> b!193981 m!300193))

(assert (=> b!193983 m!300179))

(assert (=> b!193983 m!300179))

(declare-fun m!300583 () Bool)

(assert (=> b!193983 m!300583))

(assert (=> b!193809 d!65869))

(declare-fun d!65871 () Bool)

(assert (=> d!65871 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 thiss!1204))) ((_ sign_extend 32) (currentByte!9171 thiss!1204)) ((_ sign_extend 32) (currentBit!9166 thiss!1204)) lt!300717) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 thiss!1204))) ((_ sign_extend 32) (currentByte!9171 thiss!1204)) ((_ sign_extend 32) (currentBit!9166 thiss!1204))) lt!300717))))

(declare-fun bs!16384 () Bool)

(assert (= bs!16384 d!65871))

(declare-fun m!300585 () Bool)

(assert (=> bs!16384 m!300585))

(assert (=> b!193798 d!65871))

(declare-fun d!65873 () Bool)

(declare-fun e!133503 () Bool)

(assert (=> d!65873 e!133503))

(declare-fun res!162180 () Bool)

(assert (=> d!65873 (=> (not res!162180) (not e!133503))))

(declare-fun lt!301241 () (_ BitVec 64))

(declare-fun lt!301240 () BitStream!7922)

(assert (=> d!65873 (= res!162180 (= (bvadd lt!301241 (bvsub lt!300725 lt!300738)) (bitIndex!0 (size!4407 (buf!4887 lt!301240)) (currentByte!9171 lt!301240) (currentBit!9166 lt!301240))))))

(assert (=> d!65873 (or (not (= (bvand lt!301241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300725 lt!300738) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301241 (bvsub lt!300725 lt!300738)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65873 (= lt!301241 (bitIndex!0 (size!4407 (buf!4887 (_2!9039 lt!300720))) (currentByte!9171 (_2!9039 lt!300720)) (currentBit!9166 (_2!9039 lt!300720))))))

(assert (=> d!65873 (= lt!301240 (_2!9040 (moveBitIndex!0 (_2!9039 lt!300720) (bvsub lt!300725 lt!300738))))))

(assert (=> d!65873 (moveBitIndexPrecond!0 (_2!9039 lt!300720) (bvsub lt!300725 lt!300738))))

(assert (=> d!65873 (= (withMovedBitIndex!0 (_2!9039 lt!300720) (bvsub lt!300725 lt!300738)) lt!301240)))

(declare-fun b!193984 () Bool)

(assert (=> b!193984 (= e!133503 (= (size!4407 (buf!4887 (_2!9039 lt!300720))) (size!4407 (buf!4887 lt!301240))))))

(assert (= (and d!65873 res!162180) b!193984))

(declare-fun m!300587 () Bool)

(assert (=> d!65873 m!300587))

(declare-fun m!300589 () Bool)

(assert (=> d!65873 m!300589))

(declare-fun m!300591 () Bool)

(assert (=> d!65873 m!300591))

(declare-fun m!300593 () Bool)

(assert (=> d!65873 m!300593))

(assert (=> b!193787 d!65873))

(declare-fun d!65875 () Bool)

(declare-fun res!162181 () Bool)

(declare-fun e!133505 () Bool)

(assert (=> d!65875 (=> (not res!162181) (not e!133505))))

(assert (=> d!65875 (= res!162181 (= (size!4407 (buf!4887 thiss!1204)) (size!4407 (buf!4887 (_2!9040 lt!300729)))))))

(assert (=> d!65875 (= (isPrefixOf!0 thiss!1204 (_2!9040 lt!300729)) e!133505)))

(declare-fun b!193985 () Bool)

(declare-fun res!162182 () Bool)

(assert (=> b!193985 (=> (not res!162182) (not e!133505))))

(assert (=> b!193985 (= res!162182 (bvsle (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)) (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729)))))))

(declare-fun b!193986 () Bool)

(declare-fun e!133504 () Bool)

(assert (=> b!193986 (= e!133505 e!133504)))

(declare-fun res!162183 () Bool)

(assert (=> b!193986 (=> res!162183 e!133504)))

(assert (=> b!193986 (= res!162183 (= (size!4407 (buf!4887 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!193987 () Bool)

(assert (=> b!193987 (= e!133504 (arrayBitRangesEq!0 (buf!4887 thiss!1204) (buf!4887 (_2!9040 lt!300729)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204))))))

(assert (= (and d!65875 res!162181) b!193985))

(assert (= (and b!193985 res!162182) b!193986))

(assert (= (and b!193986 (not res!162183)) b!193987))

(assert (=> b!193985 m!300181))

(assert (=> b!193985 m!300179))

(assert (=> b!193987 m!300181))

(assert (=> b!193987 m!300181))

(declare-fun m!300595 () Bool)

(assert (=> b!193987 m!300595))

(assert (=> b!193808 d!65875))

(declare-fun d!65877 () Bool)

(declare-fun e!133506 () Bool)

(assert (=> d!65877 e!133506))

(declare-fun res!162185 () Bool)

(assert (=> d!65877 (=> (not res!162185) (not e!133506))))

(declare-fun lt!301245 () (_ BitVec 64))

(declare-fun lt!301244 () (_ BitVec 64))

(declare-fun lt!301247 () (_ BitVec 64))

(assert (=> d!65877 (= res!162185 (= lt!301244 (bvsub lt!301245 lt!301247)))))

(assert (=> d!65877 (or (= (bvand lt!301245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301247 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301245 lt!301247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65877 (= lt!301247 (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9041 lt!300732)))) ((_ sign_extend 32) (currentByte!9171 (_1!9041 lt!300732))) ((_ sign_extend 32) (currentBit!9166 (_1!9041 lt!300732)))))))

(declare-fun lt!301243 () (_ BitVec 64))

(declare-fun lt!301246 () (_ BitVec 64))

(assert (=> d!65877 (= lt!301245 (bvmul lt!301243 lt!301246))))

(assert (=> d!65877 (or (= lt!301243 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301246 (bvsdiv (bvmul lt!301243 lt!301246) lt!301243)))))

(assert (=> d!65877 (= lt!301246 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65877 (= lt!301243 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9041 lt!300732)))))))

(assert (=> d!65877 (= lt!301244 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9171 (_1!9041 lt!300732))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9166 (_1!9041 lt!300732)))))))

(assert (=> d!65877 (invariant!0 (currentBit!9166 (_1!9041 lt!300732)) (currentByte!9171 (_1!9041 lt!300732)) (size!4407 (buf!4887 (_1!9041 lt!300732))))))

(assert (=> d!65877 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9041 lt!300732))) (currentByte!9171 (_1!9041 lt!300732)) (currentBit!9166 (_1!9041 lt!300732))) lt!301244)))

(declare-fun b!193988 () Bool)

(declare-fun res!162184 () Bool)

(assert (=> b!193988 (=> (not res!162184) (not e!133506))))

(assert (=> b!193988 (= res!162184 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301244))))

(declare-fun b!193989 () Bool)

(declare-fun lt!301242 () (_ BitVec 64))

(assert (=> b!193989 (= e!133506 (bvsle lt!301244 (bvmul lt!301242 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193989 (or (= lt!301242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301242)))))

(assert (=> b!193989 (= lt!301242 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9041 lt!300732)))))))

(assert (= (and d!65877 res!162185) b!193988))

(assert (= (and b!193988 res!162184) b!193989))

(declare-fun m!300597 () Bool)

(assert (=> d!65877 m!300597))

(declare-fun m!300599 () Bool)

(assert (=> d!65877 m!300599))

(assert (=> b!193802 d!65877))

(declare-fun d!65879 () Bool)

(declare-fun e!133507 () Bool)

(assert (=> d!65879 e!133507))

(declare-fun res!162187 () Bool)

(assert (=> d!65879 (=> (not res!162187) (not e!133507))))

(declare-fun lt!301251 () (_ BitVec 64))

(declare-fun lt!301250 () (_ BitVec 64))

(declare-fun lt!301253 () (_ BitVec 64))

(assert (=> d!65879 (= res!162187 (= lt!301250 (bvsub lt!301251 lt!301253)))))

(assert (=> d!65879 (or (= (bvand lt!301251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301251 lt!301253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65879 (= lt!301253 (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9039 lt!300715)))) ((_ sign_extend 32) (currentByte!9171 (_2!9039 lt!300715))) ((_ sign_extend 32) (currentBit!9166 (_2!9039 lt!300715)))))))

(declare-fun lt!301249 () (_ BitVec 64))

(declare-fun lt!301252 () (_ BitVec 64))

(assert (=> d!65879 (= lt!301251 (bvmul lt!301249 lt!301252))))

(assert (=> d!65879 (or (= lt!301249 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301252 (bvsdiv (bvmul lt!301249 lt!301252) lt!301249)))))

(assert (=> d!65879 (= lt!301252 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65879 (= lt!301249 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9039 lt!300715)))))))

(assert (=> d!65879 (= lt!301250 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9171 (_2!9039 lt!300715))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9166 (_2!9039 lt!300715)))))))

(assert (=> d!65879 (invariant!0 (currentBit!9166 (_2!9039 lt!300715)) (currentByte!9171 (_2!9039 lt!300715)) (size!4407 (buf!4887 (_2!9039 lt!300715))))))

(assert (=> d!65879 (= (bitIndex!0 (size!4407 (buf!4887 (_2!9039 lt!300715))) (currentByte!9171 (_2!9039 lt!300715)) (currentBit!9166 (_2!9039 lt!300715))) lt!301250)))

(declare-fun b!193990 () Bool)

(declare-fun res!162186 () Bool)

(assert (=> b!193990 (=> (not res!162186) (not e!133507))))

(assert (=> b!193990 (= res!162186 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301250))))

(declare-fun b!193991 () Bool)

(declare-fun lt!301248 () (_ BitVec 64))

(assert (=> b!193991 (= e!133507 (bvsle lt!301250 (bvmul lt!301248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193991 (or (= lt!301248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301248)))))

(assert (=> b!193991 (= lt!301248 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9039 lt!300715)))))))

(assert (= (and d!65879 res!162187) b!193990))

(assert (= (and b!193990 res!162186) b!193991))

(declare-fun m!300601 () Bool)

(assert (=> d!65879 m!300601))

(declare-fun m!300603 () Bool)

(assert (=> d!65879 m!300603))

(assert (=> b!193802 d!65879))

(declare-fun d!65881 () Bool)

(assert (=> d!65881 (= (invariant!0 (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204) (size!4407 (buf!4887 (_2!9040 lt!300739)))) (and (bvsge (currentBit!9166 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9166 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9171 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9171 thiss!1204) (size!4407 (buf!4887 (_2!9040 lt!300739)))) (and (= (currentBit!9166 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9171 thiss!1204) (size!4407 (buf!4887 (_2!9040 lt!300739))))))))))

(assert (=> b!193790 d!65881))

(declare-fun d!65883 () Bool)

(assert (=> d!65883 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!193811 d!65883))

(declare-fun d!65885 () Bool)

(declare-fun e!133508 () Bool)

(assert (=> d!65885 e!133508))

(declare-fun res!162189 () Bool)

(assert (=> d!65885 (=> (not res!162189) (not e!133508))))

(declare-fun lt!301259 () (_ BitVec 64))

(declare-fun lt!301257 () (_ BitVec 64))

(declare-fun lt!301256 () (_ BitVec 64))

(assert (=> d!65885 (= res!162189 (= lt!301256 (bvsub lt!301257 lt!301259)))))

(assert (=> d!65885 (or (= (bvand lt!301257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301259 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301257 lt!301259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65885 (= lt!301259 (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300729)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729)))))))

(declare-fun lt!301255 () (_ BitVec 64))

(declare-fun lt!301258 () (_ BitVec 64))

(assert (=> d!65885 (= lt!301257 (bvmul lt!301255 lt!301258))))

(assert (=> d!65885 (or (= lt!301255 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301258 (bvsdiv (bvmul lt!301255 lt!301258) lt!301255)))))

(assert (=> d!65885 (= lt!301258 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65885 (= lt!301255 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300729)))))))

(assert (=> d!65885 (= lt!301256 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729)))))))

(assert (=> d!65885 (invariant!0 (currentBit!9166 (_2!9040 lt!300729)) (currentByte!9171 (_2!9040 lt!300729)) (size!4407 (buf!4887 (_2!9040 lt!300729))))))

(assert (=> d!65885 (= (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))) lt!301256)))

(declare-fun b!193992 () Bool)

(declare-fun res!162188 () Bool)

(assert (=> b!193992 (=> (not res!162188) (not e!133508))))

(assert (=> b!193992 (= res!162188 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301256))))

(declare-fun b!193993 () Bool)

(declare-fun lt!301254 () (_ BitVec 64))

(assert (=> b!193993 (= e!133508 (bvsle lt!301256 (bvmul lt!301254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193993 (or (= lt!301254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301254)))))

(assert (=> b!193993 (= lt!301254 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300729)))))))

(assert (= (and d!65885 res!162189) b!193992))

(assert (= (and b!193992 res!162188) b!193993))

(declare-fun m!300605 () Bool)

(assert (=> d!65885 m!300605))

(declare-fun m!300607 () Bool)

(assert (=> d!65885 m!300607))

(assert (=> b!193800 d!65885))

(declare-fun d!65887 () Bool)

(declare-fun e!133509 () Bool)

(assert (=> d!65887 e!133509))

(declare-fun res!162191 () Bool)

(assert (=> d!65887 (=> (not res!162191) (not e!133509))))

(declare-fun lt!301265 () (_ BitVec 64))

(declare-fun lt!301262 () (_ BitVec 64))

(declare-fun lt!301263 () (_ BitVec 64))

(assert (=> d!65887 (= res!162191 (= lt!301262 (bvsub lt!301263 lt!301265)))))

(assert (=> d!65887 (or (= (bvand lt!301263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301263 lt!301265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65887 (= lt!301265 (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 thiss!1204))) ((_ sign_extend 32) (currentByte!9171 thiss!1204)) ((_ sign_extend 32) (currentBit!9166 thiss!1204))))))

(declare-fun lt!301261 () (_ BitVec 64))

(declare-fun lt!301264 () (_ BitVec 64))

(assert (=> d!65887 (= lt!301263 (bvmul lt!301261 lt!301264))))

(assert (=> d!65887 (or (= lt!301261 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301264 (bvsdiv (bvmul lt!301261 lt!301264) lt!301261)))))

(assert (=> d!65887 (= lt!301264 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65887 (= lt!301261 ((_ sign_extend 32) (size!4407 (buf!4887 thiss!1204))))))

(assert (=> d!65887 (= lt!301262 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9171 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9166 thiss!1204))))))

(assert (=> d!65887 (invariant!0 (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204) (size!4407 (buf!4887 thiss!1204)))))

(assert (=> d!65887 (= (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)) lt!301262)))

(declare-fun b!193994 () Bool)

(declare-fun res!162190 () Bool)

(assert (=> b!193994 (=> (not res!162190) (not e!133509))))

(assert (=> b!193994 (= res!162190 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301262))))

(declare-fun b!193995 () Bool)

(declare-fun lt!301260 () (_ BitVec 64))

(assert (=> b!193995 (= e!133509 (bvsle lt!301262 (bvmul lt!301260 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193995 (or (= lt!301260 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301260 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301260)))))

(assert (=> b!193995 (= lt!301260 ((_ sign_extend 32) (size!4407 (buf!4887 thiss!1204))))))

(assert (= (and d!65887 res!162191) b!193994))

(assert (= (and b!193994 res!162190) b!193995))

(assert (=> d!65887 m!300585))

(assert (=> d!65887 m!300157))

(assert (=> b!193800 d!65887))

(declare-fun d!65889 () Bool)

(declare-fun e!133515 () Bool)

(assert (=> d!65889 e!133515))

(declare-fun res!162200 () Bool)

(assert (=> d!65889 (=> (not res!162200) (not e!133515))))

(declare-fun lt!301274 () tuple2!16790)

(assert (=> d!65889 (= res!162200 (= (size!4407 (buf!4887 thiss!1204)) (size!4407 (buf!4887 (_2!9040 lt!301274)))))))

(declare-fun choose!16 (BitStream!7922 Bool) tuple2!16790)

(assert (=> d!65889 (= lt!301274 (choose!16 thiss!1204 lt!300724))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65889 (validate_offset_bit!0 ((_ sign_extend 32) (size!4407 (buf!4887 thiss!1204))) ((_ sign_extend 32) (currentByte!9171 thiss!1204)) ((_ sign_extend 32) (currentBit!9166 thiss!1204)))))

(assert (=> d!65889 (= (appendBit!0 thiss!1204 lt!300724) lt!301274)))

(declare-fun b!194006 () Bool)

(declare-fun res!162203 () Bool)

(assert (=> b!194006 (=> (not res!162203) (not e!133515))))

(assert (=> b!194006 (= res!162203 (isPrefixOf!0 thiss!1204 (_2!9040 lt!301274)))))

(declare-fun b!194005 () Bool)

(declare-fun res!162201 () Bool)

(assert (=> b!194005 (=> (not res!162201) (not e!133515))))

(declare-fun lt!301276 () (_ BitVec 64))

(declare-fun lt!301277 () (_ BitVec 64))

(assert (=> b!194005 (= res!162201 (= (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301274))) (currentByte!9171 (_2!9040 lt!301274)) (currentBit!9166 (_2!9040 lt!301274))) (bvadd lt!301277 lt!301276)))))

(assert (=> b!194005 (or (not (= (bvand lt!301277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301276 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301277 lt!301276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194005 (= lt!301276 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!194005 (= lt!301277 (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)))))

(declare-fun b!194007 () Bool)

(declare-fun e!133514 () Bool)

(assert (=> b!194007 (= e!133515 e!133514)))

(declare-fun res!162202 () Bool)

(assert (=> b!194007 (=> (not res!162202) (not e!133514))))

(declare-fun lt!301275 () tuple2!16794)

(assert (=> b!194007 (= res!162202 (and (= (_2!9042 lt!301275) lt!300724) (= (_1!9042 lt!301275) (_2!9040 lt!301274))))))

(assert (=> b!194007 (= lt!301275 (readBitPure!0 (readerFrom!0 (_2!9040 lt!301274) (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204))))))

(declare-fun b!194008 () Bool)

(assert (=> b!194008 (= e!133514 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!301275))) (currentByte!9171 (_1!9042 lt!301275)) (currentBit!9166 (_1!9042 lt!301275))) (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301274))) (currentByte!9171 (_2!9040 lt!301274)) (currentBit!9166 (_2!9040 lt!301274)))))))

(assert (= (and d!65889 res!162200) b!194005))

(assert (= (and b!194005 res!162201) b!194006))

(assert (= (and b!194006 res!162203) b!194007))

(assert (= (and b!194007 res!162202) b!194008))

(declare-fun m!300609 () Bool)

(assert (=> b!194008 m!300609))

(declare-fun m!300611 () Bool)

(assert (=> b!194008 m!300611))

(declare-fun m!300613 () Bool)

(assert (=> b!194007 m!300613))

(assert (=> b!194007 m!300613))

(declare-fun m!300615 () Bool)

(assert (=> b!194007 m!300615))

(assert (=> b!194005 m!300611))

(assert (=> b!194005 m!300181))

(declare-fun m!300617 () Bool)

(assert (=> b!194006 m!300617))

(declare-fun m!300619 () Bool)

(assert (=> d!65889 m!300619))

(declare-fun m!300621 () Bool)

(assert (=> d!65889 m!300621))

(assert (=> b!193800 d!65889))

(declare-fun d!65891 () Bool)

(assert (=> d!65891 (= (invariant!0 (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204) (size!4407 (buf!4887 thiss!1204))) (and (bvsge (currentBit!9166 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9166 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9171 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9171 thiss!1204) (size!4407 (buf!4887 thiss!1204))) (and (= (currentBit!9166 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9171 thiss!1204) (size!4407 (buf!4887 thiss!1204)))))))))

(assert (=> b!193805 d!65891))

(declare-fun d!65893 () Bool)

(declare-fun e!133516 () Bool)

(assert (=> d!65893 e!133516))

(declare-fun res!162205 () Bool)

(assert (=> d!65893 (=> (not res!162205) (not e!133516))))

(declare-fun lt!301283 () (_ BitVec 64))

(declare-fun lt!301281 () (_ BitVec 64))

(declare-fun lt!301280 () (_ BitVec 64))

(assert (=> d!65893 (= res!162205 (= lt!301280 (bvsub lt!301281 lt!301283)))))

(assert (=> d!65893 (or (= (bvand lt!301281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301283 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301281 lt!301283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65893 (= lt!301283 (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300739))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300739)))))))

(declare-fun lt!301279 () (_ BitVec 64))

(declare-fun lt!301282 () (_ BitVec 64))

(assert (=> d!65893 (= lt!301281 (bvmul lt!301279 lt!301282))))

(assert (=> d!65893 (or (= lt!301279 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301282 (bvsdiv (bvmul lt!301279 lt!301282) lt!301279)))))

(assert (=> d!65893 (= lt!301282 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65893 (= lt!301279 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))))))

(assert (=> d!65893 (= lt!301280 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300739))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300739)))))))

(assert (=> d!65893 (invariant!0 (currentBit!9166 (_2!9040 lt!300739)) (currentByte!9171 (_2!9040 lt!300739)) (size!4407 (buf!4887 (_2!9040 lt!300739))))))

(assert (=> d!65893 (= (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300739))) (currentByte!9171 (_2!9040 lt!300739)) (currentBit!9166 (_2!9040 lt!300739))) lt!301280)))

(declare-fun b!194009 () Bool)

(declare-fun res!162204 () Bool)

(assert (=> b!194009 (=> (not res!162204) (not e!133516))))

(assert (=> b!194009 (= res!162204 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301280))))

(declare-fun b!194010 () Bool)

(declare-fun lt!301278 () (_ BitVec 64))

(assert (=> b!194010 (= e!133516 (bvsle lt!301280 (bvmul lt!301278 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194010 (or (= lt!301278 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301278 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301278)))))

(assert (=> b!194010 (= lt!301278 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300739)))))))

(assert (= (and d!65893 res!162205) b!194009))

(assert (= (and b!194009 res!162204) b!194010))

(declare-fun m!300623 () Bool)

(assert (=> d!65893 m!300623))

(assert (=> d!65893 m!300175))

(assert (=> b!193804 d!65893))

(declare-fun d!65895 () Bool)

(declare-fun res!162206 () Bool)

(declare-fun e!133518 () Bool)

(assert (=> d!65895 (=> (not res!162206) (not e!133518))))

(assert (=> d!65895 (= res!162206 (= (size!4407 (buf!4887 thiss!1204)) (size!4407 (buf!4887 (_2!9040 lt!300739)))))))

(assert (=> d!65895 (= (isPrefixOf!0 thiss!1204 (_2!9040 lt!300739)) e!133518)))

(declare-fun b!194011 () Bool)

(declare-fun res!162207 () Bool)

(assert (=> b!194011 (=> (not res!162207) (not e!133518))))

(assert (=> b!194011 (= res!162207 (bvsle (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)) (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300739))) (currentByte!9171 (_2!9040 lt!300739)) (currentBit!9166 (_2!9040 lt!300739)))))))

(declare-fun b!194012 () Bool)

(declare-fun e!133517 () Bool)

(assert (=> b!194012 (= e!133518 e!133517)))

(declare-fun res!162208 () Bool)

(assert (=> b!194012 (=> res!162208 e!133517)))

(assert (=> b!194012 (= res!162208 (= (size!4407 (buf!4887 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!194013 () Bool)

(assert (=> b!194013 (= e!133517 (arrayBitRangesEq!0 (buf!4887 thiss!1204) (buf!4887 (_2!9040 lt!300739)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4407 (buf!4887 thiss!1204)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204))))))

(assert (= (and d!65895 res!162206) b!194011))

(assert (= (and b!194011 res!162207) b!194012))

(assert (= (and b!194012 (not res!162208)) b!194013))

(assert (=> b!194011 m!300181))

(assert (=> b!194011 m!300193))

(assert (=> b!194013 m!300181))

(assert (=> b!194013 m!300181))

(declare-fun m!300625 () Bool)

(assert (=> b!194013 m!300625))

(assert (=> b!193804 d!65895))

(declare-fun d!65897 () Bool)

(assert (=> d!65897 (isPrefixOf!0 thiss!1204 (_2!9040 lt!300739))))

(declare-fun lt!301286 () Unit!13691)

(declare-fun choose!30 (BitStream!7922 BitStream!7922 BitStream!7922) Unit!13691)

(assert (=> d!65897 (= lt!301286 (choose!30 thiss!1204 (_2!9040 lt!300729) (_2!9040 lt!300739)))))

(assert (=> d!65897 (isPrefixOf!0 thiss!1204 (_2!9040 lt!300729))))

(assert (=> d!65897 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9040 lt!300729) (_2!9040 lt!300739)) lt!301286)))

(declare-fun bs!16385 () Bool)

(assert (= bs!16385 d!65897))

(assert (=> bs!16385 m!300195))

(declare-fun m!300627 () Bool)

(assert (=> bs!16385 m!300627))

(assert (=> bs!16385 m!300155))

(assert (=> b!193804 d!65897))

(declare-fun b!194173 () Bool)

(declare-fun e!133618 () (_ BitVec 64))

(assert (=> b!194173 (= e!133618 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!194174 () Bool)

(declare-fun e!133612 () Bool)

(declare-fun lt!301829 () (_ BitVec 64))

(assert (=> b!194174 (= e!133612 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!300729)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729))) lt!301829))))

(declare-fun bm!3053 () Bool)

(declare-fun call!3056 () Bool)

(declare-fun c!9708 () Bool)

(declare-fun lt!301815 () tuple2!16790)

(assert (=> bm!3053 (= call!3056 (isPrefixOf!0 (_2!9040 lt!300729) (ite c!9708 (_2!9040 lt!300729) (_2!9040 lt!301815))))))

(declare-fun b!194175 () Bool)

(declare-fun e!133614 () Bool)

(declare-fun lt!301840 () tuple2!16794)

(assert (=> b!194175 (= e!133614 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!301840))) (currentByte!9171 (_1!9042 lt!301840)) (currentBit!9166 (_1!9042 lt!301840))) (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301815))) (currentByte!9171 (_2!9040 lt!301815)) (currentBit!9166 (_2!9040 lt!301815)))))))

(declare-fun b!194176 () Bool)

(assert (=> b!194176 (= lt!301840 (readBitPure!0 (readerFrom!0 (_2!9040 lt!301815) (currentBit!9166 (_2!9040 lt!300729)) (currentByte!9171 (_2!9040 lt!300729)))))))

(declare-fun res!162343 () Bool)

(declare-fun lt!301867 () Bool)

(assert (=> b!194176 (= res!162343 (and (= (_2!9042 lt!301840) lt!301867) (= (_1!9042 lt!301840) (_2!9040 lt!301815))))))

(assert (=> b!194176 (=> (not res!162343) (not e!133614))))

(declare-fun e!133617 () Bool)

(assert (=> b!194176 (= e!133617 e!133614)))

(declare-fun b!194177 () Bool)

(declare-fun e!133616 () Bool)

(declare-fun lt!301860 () tuple2!16794)

(declare-fun lt!301848 () tuple2!16794)

(assert (=> b!194177 (= e!133616 (= (_2!9042 lt!301860) (_2!9042 lt!301848)))))

(declare-fun b!194178 () Bool)

(declare-fun res!162346 () Bool)

(assert (=> b!194178 (= res!162346 (= (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301815))) (currentByte!9171 (_2!9040 lt!301815)) (currentBit!9166 (_2!9040 lt!301815))) (bvadd (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!194178 (=> (not res!162346) (not e!133617))))

(declare-fun b!194179 () Bool)

(declare-fun res!162335 () Bool)

(declare-fun e!133613 () Bool)

(assert (=> b!194179 (=> (not res!162335) (not e!133613))))

(declare-fun lt!301868 () tuple2!16790)

(assert (=> b!194179 (= res!162335 (isPrefixOf!0 (_2!9040 lt!300729) (_2!9040 lt!301868)))))

(declare-fun b!194181 () Bool)

(declare-fun e!133610 () tuple2!16790)

(declare-fun Unit!13721 () Unit!13691)

(assert (=> b!194181 (= e!133610 (tuple2!16791 Unit!13721 (_2!9040 lt!300729)))))

(declare-fun lt!301855 () Unit!13691)

(assert (=> b!194181 (= lt!301855 (lemmaIsPrefixRefl!0 (_2!9040 lt!300729)))))

(assert (=> b!194181 call!3056))

(declare-fun lt!301834 () Unit!13691)

(assert (=> b!194181 (= lt!301834 lt!301855)))

(declare-fun b!194182 () Bool)

(declare-fun e!133611 () Bool)

(declare-fun lt!301849 () tuple2!16792)

(declare-fun lt!301866 () tuple2!16788)

(assert (=> b!194182 (= e!133611 (= (_1!9041 lt!301849) (_2!9039 lt!301866)))))

(declare-fun b!194183 () Bool)

(declare-fun lt!301832 () tuple2!16790)

(assert (=> b!194183 (= e!133610 (tuple2!16791 (_1!9040 lt!301832) (_2!9040 lt!301832)))))

(assert (=> b!194183 (= lt!301867 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194183 (= lt!301815 (appendBit!0 (_2!9040 lt!300729) lt!301867))))

(declare-fun res!162340 () Bool)

(assert (=> b!194183 (= res!162340 (= (size!4407 (buf!4887 (_2!9040 lt!300729))) (size!4407 (buf!4887 (_2!9040 lt!301815)))))))

(assert (=> b!194183 (=> (not res!162340) (not e!133617))))

(assert (=> b!194183 e!133617))

(declare-fun lt!301861 () tuple2!16790)

(assert (=> b!194183 (= lt!301861 lt!301815)))

(assert (=> b!194183 (= lt!301832 (appendBitsLSBFirstLoopTR!0 (_2!9040 lt!301861) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!301856 () Unit!13691)

(assert (=> b!194183 (= lt!301856 (lemmaIsPrefixTransitive!0 (_2!9040 lt!300729) (_2!9040 lt!301861) (_2!9040 lt!301832)))))

(assert (=> b!194183 (isPrefixOf!0 (_2!9040 lt!300729) (_2!9040 lt!301832))))

(declare-fun lt!301830 () Unit!13691)

(assert (=> b!194183 (= lt!301830 lt!301856)))

(assert (=> b!194183 (invariant!0 (currentBit!9166 (_2!9040 lt!300729)) (currentByte!9171 (_2!9040 lt!300729)) (size!4407 (buf!4887 (_2!9040 lt!301861))))))

(declare-fun lt!301821 () BitStream!7922)

(assert (=> b!194183 (= lt!301821 (BitStream!7923 (buf!4887 (_2!9040 lt!301861)) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))))))

(assert (=> b!194183 (invariant!0 (currentBit!9166 lt!301821) (currentByte!9171 lt!301821) (size!4407 (buf!4887 (_2!9040 lt!301832))))))

(declare-fun lt!301863 () BitStream!7922)

(assert (=> b!194183 (= lt!301863 (BitStream!7923 (buf!4887 (_2!9040 lt!301832)) (currentByte!9171 lt!301821) (currentBit!9166 lt!301821)))))

(assert (=> b!194183 (= lt!301860 (readBitPure!0 lt!301821))))

(assert (=> b!194183 (= lt!301848 (readBitPure!0 lt!301863))))

(declare-fun lt!301839 () Unit!13691)

(assert (=> b!194183 (= lt!301839 (readBitPrefixLemma!0 lt!301821 (_2!9040 lt!301832)))))

(declare-fun res!162336 () Bool)

(assert (=> b!194183 (= res!162336 (= (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!301860))) (currentByte!9171 (_1!9042 lt!301860)) (currentBit!9166 (_1!9042 lt!301860))) (bitIndex!0 (size!4407 (buf!4887 (_1!9042 lt!301848))) (currentByte!9171 (_1!9042 lt!301848)) (currentBit!9166 (_1!9042 lt!301848)))))))

(assert (=> b!194183 (=> (not res!162336) (not e!133616))))

(assert (=> b!194183 e!133616))

(declare-fun lt!301851 () Unit!13691)

(assert (=> b!194183 (= lt!301851 lt!301839)))

(declare-fun lt!301846 () tuple2!16788)

(assert (=> b!194183 (= lt!301846 (reader!0 (_2!9040 lt!300729) (_2!9040 lt!301832)))))

(declare-fun lt!301865 () tuple2!16788)

(assert (=> b!194183 (= lt!301865 (reader!0 (_2!9040 lt!301861) (_2!9040 lt!301832)))))

(declare-fun lt!301847 () tuple2!16794)

(assert (=> b!194183 (= lt!301847 (readBitPure!0 (_1!9039 lt!301846)))))

(assert (=> b!194183 (= (_2!9042 lt!301847) lt!301867)))

(declare-fun lt!301852 () Unit!13691)

(declare-fun Unit!13722 () Unit!13691)

(assert (=> b!194183 (= lt!301852 Unit!13722)))

(declare-fun lt!301823 () (_ BitVec 64))

(assert (=> b!194183 (= lt!301823 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301869 () (_ BitVec 64))

(assert (=> b!194183 (= lt!301869 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301831 () Unit!13691)

(assert (=> b!194183 (= lt!301831 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9040 lt!300729) (buf!4887 (_2!9040 lt!301832)) lt!301869))))

(assert (=> b!194183 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!301832)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729))) lt!301869)))

(declare-fun lt!301838 () Unit!13691)

(assert (=> b!194183 (= lt!301838 lt!301831)))

(declare-fun lt!301857 () tuple2!16792)

(assert (=> b!194183 (= lt!301857 (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!301846) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301823))))

(declare-fun lt!301825 () (_ BitVec 64))

(assert (=> b!194183 (= lt!301825 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!301843 () Unit!13691)

(assert (=> b!194183 (= lt!301843 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9040 lt!301861) (buf!4887 (_2!9040 lt!301832)) lt!301825))))

(assert (=> b!194183 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!301832)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!301861))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!301861))) lt!301825)))

(declare-fun lt!301833 () Unit!13691)

(assert (=> b!194183 (= lt!301833 lt!301843)))

(declare-fun lt!301870 () tuple2!16792)

(assert (=> b!194183 (= lt!301870 (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!301865) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!301823 (ite (_2!9042 lt!301847) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!301853 () tuple2!16792)

(assert (=> b!194183 (= lt!301853 (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!301846) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301823))))

(declare-fun c!9709 () Bool)

(assert (=> b!194183 (= c!9709 (_2!9042 (readBitPure!0 (_1!9039 lt!301846))))))

(declare-fun lt!301817 () tuple2!16792)

(assert (=> b!194183 (= lt!301817 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9039 lt!301846) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!301823 e!133618)))))

(declare-fun lt!301835 () Unit!13691)

(assert (=> b!194183 (= lt!301835 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9039 lt!301846) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301823))))

(assert (=> b!194183 (and (= (_2!9041 lt!301853) (_2!9041 lt!301817)) (= (_1!9041 lt!301853) (_1!9041 lt!301817)))))

(declare-fun lt!301818 () Unit!13691)

(assert (=> b!194183 (= lt!301818 lt!301835)))

(assert (=> b!194183 (= (_1!9039 lt!301846) (withMovedBitIndex!0 (_2!9039 lt!301846) (bvsub (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))) (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301832))) (currentByte!9171 (_2!9040 lt!301832)) (currentBit!9166 (_2!9040 lt!301832))))))))

(declare-fun lt!301828 () Unit!13691)

(declare-fun Unit!13723 () Unit!13691)

(assert (=> b!194183 (= lt!301828 Unit!13723)))

(assert (=> b!194183 (= (_1!9039 lt!301865) (withMovedBitIndex!0 (_2!9039 lt!301865) (bvsub (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301861))) (currentByte!9171 (_2!9040 lt!301861)) (currentBit!9166 (_2!9040 lt!301861))) (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301832))) (currentByte!9171 (_2!9040 lt!301832)) (currentBit!9166 (_2!9040 lt!301832))))))))

(declare-fun lt!301859 () Unit!13691)

(declare-fun Unit!13724 () Unit!13691)

(assert (=> b!194183 (= lt!301859 Unit!13724)))

(assert (=> b!194183 (= (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))) (bvsub (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301861))) (currentByte!9171 (_2!9040 lt!301861)) (currentBit!9166 (_2!9040 lt!301861))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!301827 () Unit!13691)

(declare-fun Unit!13725 () Unit!13691)

(assert (=> b!194183 (= lt!301827 Unit!13725)))

(assert (=> b!194183 (= (_2!9041 lt!301857) (_2!9041 lt!301870))))

(declare-fun lt!301842 () Unit!13691)

(declare-fun Unit!13726 () Unit!13691)

(assert (=> b!194183 (= lt!301842 Unit!13726)))

(assert (=> b!194183 (invariant!0 (currentBit!9166 (_2!9040 lt!301832)) (currentByte!9171 (_2!9040 lt!301832)) (size!4407 (buf!4887 (_2!9040 lt!301832))))))

(declare-fun lt!301826 () Unit!13691)

(declare-fun Unit!13727 () Unit!13691)

(assert (=> b!194183 (= lt!301826 Unit!13727)))

(assert (=> b!194183 (= (size!4407 (buf!4887 (_2!9040 lt!300729))) (size!4407 (buf!4887 (_2!9040 lt!301832))))))

(declare-fun lt!301824 () Unit!13691)

(declare-fun Unit!13728 () Unit!13691)

(assert (=> b!194183 (= lt!301824 Unit!13728)))

(assert (=> b!194183 (= (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301832))) (currentByte!9171 (_2!9040 lt!301832)) (currentBit!9166 (_2!9040 lt!301832))) (bvsub (bvadd (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301820 () Unit!13691)

(declare-fun Unit!13729 () Unit!13691)

(assert (=> b!194183 (= lt!301820 Unit!13729)))

(declare-fun lt!301845 () Unit!13691)

(declare-fun Unit!13730 () Unit!13691)

(assert (=> b!194183 (= lt!301845 Unit!13730)))

(declare-fun lt!301819 () tuple2!16788)

(assert (=> b!194183 (= lt!301819 (reader!0 (_2!9040 lt!300729) (_2!9040 lt!301832)))))

(declare-fun lt!301841 () (_ BitVec 64))

(assert (=> b!194183 (= lt!301841 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301862 () Unit!13691)

(assert (=> b!194183 (= lt!301862 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9040 lt!300729) (buf!4887 (_2!9040 lt!301832)) lt!301841))))

(assert (=> b!194183 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!301832)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729))) lt!301841)))

(declare-fun lt!301844 () Unit!13691)

(assert (=> b!194183 (= lt!301844 lt!301862)))

(declare-fun lt!301837 () tuple2!16792)

(assert (=> b!194183 (= lt!301837 (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!301819) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!162344 () Bool)

(assert (=> b!194183 (= res!162344 (= (_2!9041 lt!301837) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!133615 () Bool)

(assert (=> b!194183 (=> (not res!162344) (not e!133615))))

(assert (=> b!194183 e!133615))

(declare-fun lt!301836 () Unit!13691)

(declare-fun Unit!13731 () Unit!13691)

(assert (=> b!194183 (= lt!301836 Unit!13731)))

(declare-fun b!194184 () Bool)

(declare-fun res!162337 () Bool)

(assert (=> b!194184 (=> (not res!162337) (not e!133613))))

(declare-fun lt!301816 () (_ BitVec 64))

(declare-fun lt!301854 () (_ BitVec 64))

(assert (=> b!194184 (= res!162337 (= (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!301868))) (currentByte!9171 (_2!9040 lt!301868)) (currentBit!9166 (_2!9040 lt!301868))) (bvsub lt!301854 lt!301816)))))

(assert (=> b!194184 (or (= (bvand lt!301854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301816 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301854 lt!301816) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194184 (= lt!301816 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!301822 () (_ BitVec 64))

(declare-fun lt!301858 () (_ BitVec 64))

(assert (=> b!194184 (= lt!301854 (bvadd lt!301822 lt!301858))))

(assert (=> b!194184 (or (not (= (bvand lt!301822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301858 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301822 lt!301858) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194184 (= lt!301858 ((_ sign_extend 32) nBits!348))))

(assert (=> b!194184 (= lt!301822 (bitIndex!0 (size!4407 (buf!4887 (_2!9040 lt!300729))) (currentByte!9171 (_2!9040 lt!300729)) (currentBit!9166 (_2!9040 lt!300729))))))

(declare-fun b!194185 () Bool)

(assert (=> b!194185 (= e!133615 (= (_1!9041 lt!301837) (_2!9039 lt!301819)))))

(declare-fun b!194186 () Bool)

(declare-fun res!162345 () Bool)

(assert (=> b!194186 (=> (not res!162345) (not e!133613))))

(assert (=> b!194186 (= res!162345 (= (size!4407 (buf!4887 (_2!9040 lt!300729))) (size!4407 (buf!4887 (_2!9040 lt!301868)))))))

(declare-fun b!194180 () Bool)

(declare-fun res!162339 () Bool)

(assert (=> b!194180 (= res!162339 call!3056)))

(assert (=> b!194180 (=> (not res!162339) (not e!133617))))

(declare-fun d!65899 () Bool)

(assert (=> d!65899 e!133613))

(declare-fun res!162341 () Bool)

(assert (=> d!65899 (=> (not res!162341) (not e!133613))))

(assert (=> d!65899 (= res!162341 (invariant!0 (currentBit!9166 (_2!9040 lt!301868)) (currentByte!9171 (_2!9040 lt!301868)) (size!4407 (buf!4887 (_2!9040 lt!301868)))))))

(assert (=> d!65899 (= lt!301868 e!133610)))

(assert (=> d!65899 (= c!9708 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65899 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65899 (= (appendBitsLSBFirstLoopTR!0 (_2!9040 lt!300729) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!301868)))

(declare-fun b!194187 () Bool)

(assert (=> b!194187 (= e!133618 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!194188 () Bool)

(assert (=> b!194188 (= e!133613 e!133611)))

(declare-fun res!162342 () Bool)

(assert (=> b!194188 (=> (not res!162342) (not e!133611))))

(assert (=> b!194188 (= res!162342 (= (_2!9041 lt!301849) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!194188 (= lt!301849 (readNBitsLSBFirstsLoopPure!0 (_1!9039 lt!301866) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!301864 () Unit!13691)

(declare-fun lt!301850 () Unit!13691)

(assert (=> b!194188 (= lt!301864 lt!301850)))

(assert (=> b!194188 (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_2!9040 lt!301868)))) ((_ sign_extend 32) (currentByte!9171 (_2!9040 lt!300729))) ((_ sign_extend 32) (currentBit!9166 (_2!9040 lt!300729))) lt!301829)))

(assert (=> b!194188 (= lt!301850 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9040 lt!300729) (buf!4887 (_2!9040 lt!301868)) lt!301829))))

(assert (=> b!194188 e!133612))

(declare-fun res!162338 () Bool)

(assert (=> b!194188 (=> (not res!162338) (not e!133612))))

(assert (=> b!194188 (= res!162338 (and (= (size!4407 (buf!4887 (_2!9040 lt!300729))) (size!4407 (buf!4887 (_2!9040 lt!301868)))) (bvsge lt!301829 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194188 (= lt!301829 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!194188 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!194188 (= lt!301866 (reader!0 (_2!9040 lt!300729) (_2!9040 lt!301868)))))

(assert (= (and d!65899 c!9708) b!194181))

(assert (= (and d!65899 (not c!9708)) b!194183))

(assert (= (and b!194183 res!162340) b!194178))

(assert (= (and b!194178 res!162346) b!194180))

(assert (= (and b!194180 res!162339) b!194176))

(assert (= (and b!194176 res!162343) b!194175))

(assert (= (and b!194183 res!162336) b!194177))

(assert (= (and b!194183 c!9709) b!194173))

(assert (= (and b!194183 (not c!9709)) b!194187))

(assert (= (and b!194183 res!162344) b!194185))

(assert (= (or b!194181 b!194180) bm!3053))

(assert (= (and d!65899 res!162341) b!194186))

(assert (= (and b!194186 res!162345) b!194184))

(assert (= (and b!194184 res!162337) b!194179))

(assert (= (and b!194179 res!162335) b!194188))

(assert (= (and b!194188 res!162338) b!194174))

(assert (= (and b!194188 res!162342) b!194182))

(declare-fun m!300877 () Bool)

(assert (=> b!194183 m!300877))

(declare-fun m!300879 () Bool)

(assert (=> b!194183 m!300879))

(declare-fun m!300881 () Bool)

(assert (=> b!194183 m!300881))

(declare-fun m!300883 () Bool)

(assert (=> b!194183 m!300883))

(assert (=> b!194183 m!300161))

(declare-fun m!300885 () Bool)

(assert (=> b!194183 m!300885))

(declare-fun m!300887 () Bool)

(assert (=> b!194183 m!300887))

(declare-fun m!300889 () Bool)

(assert (=> b!194183 m!300889))

(declare-fun m!300891 () Bool)

(assert (=> b!194183 m!300891))

(declare-fun m!300893 () Bool)

(assert (=> b!194183 m!300893))

(declare-fun m!300895 () Bool)

(assert (=> b!194183 m!300895))

(declare-fun m!300897 () Bool)

(assert (=> b!194183 m!300897))

(declare-fun m!300899 () Bool)

(assert (=> b!194183 m!300899))

(declare-fun m!300901 () Bool)

(assert (=> b!194183 m!300901))

(declare-fun m!300903 () Bool)

(assert (=> b!194183 m!300903))

(declare-fun m!300905 () Bool)

(assert (=> b!194183 m!300905))

(declare-fun m!300907 () Bool)

(assert (=> b!194183 m!300907))

(declare-fun m!300909 () Bool)

(assert (=> b!194183 m!300909))

(declare-fun m!300911 () Bool)

(assert (=> b!194183 m!300911))

(declare-fun m!300913 () Bool)

(assert (=> b!194183 m!300913))

(declare-fun m!300915 () Bool)

(assert (=> b!194183 m!300915))

(declare-fun m!300917 () Bool)

(assert (=> b!194183 m!300917))

(declare-fun m!300919 () Bool)

(assert (=> b!194183 m!300919))

(declare-fun m!300921 () Bool)

(assert (=> b!194183 m!300921))

(declare-fun m!300923 () Bool)

(assert (=> b!194183 m!300923))

(assert (=> b!194183 m!300179))

(declare-fun m!300925 () Bool)

(assert (=> b!194183 m!300925))

(declare-fun m!300927 () Bool)

(assert (=> b!194183 m!300927))

(declare-fun m!300929 () Bool)

(assert (=> b!194183 m!300929))

(declare-fun m!300931 () Bool)

(assert (=> b!194183 m!300931))

(declare-fun m!300933 () Bool)

(assert (=> b!194183 m!300933))

(assert (=> b!194183 m!300905))

(declare-fun m!300935 () Bool)

(assert (=> b!194183 m!300935))

(declare-fun m!300937 () Bool)

(assert (=> b!194183 m!300937))

(declare-fun m!300939 () Bool)

(assert (=> b!194183 m!300939))

(declare-fun m!300941 () Bool)

(assert (=> b!194175 m!300941))

(declare-fun m!300943 () Bool)

(assert (=> b!194175 m!300943))

(declare-fun m!300945 () Bool)

(assert (=> b!194179 m!300945))

(declare-fun m!300947 () Bool)

(assert (=> bm!3053 m!300947))

(declare-fun m!300949 () Bool)

(assert (=> b!194184 m!300949))

(assert (=> b!194184 m!300179))

(assert (=> b!194178 m!300943))

(assert (=> b!194178 m!300179))

(declare-fun m!300951 () Bool)

(assert (=> b!194176 m!300951))

(assert (=> b!194176 m!300951))

(declare-fun m!300953 () Bool)

(assert (=> b!194176 m!300953))

(declare-fun m!300955 () Bool)

(assert (=> d!65899 m!300955))

(assert (=> b!194181 m!300545))

(declare-fun m!300957 () Bool)

(assert (=> b!194174 m!300957))

(declare-fun m!300959 () Bool)

(assert (=> b!194188 m!300959))

(declare-fun m!300961 () Bool)

(assert (=> b!194188 m!300961))

(assert (=> b!194188 m!300931))

(declare-fun m!300963 () Bool)

(assert (=> b!194188 m!300963))

(assert (=> b!194188 m!300161))

(declare-fun m!300965 () Bool)

(assert (=> b!194188 m!300965))

(assert (=> b!193804 d!65899))

(declare-fun d!65937 () Bool)

(declare-fun e!133619 () Bool)

(assert (=> d!65937 e!133619))

(declare-fun res!162347 () Bool)

(assert (=> d!65937 (=> (not res!162347) (not e!133619))))

(declare-fun lt!301872 () (_ BitVec 64))

(declare-fun lt!301871 () BitStream!7922)

(assert (=> d!65937 (= res!162347 (= (bvadd lt!301872 (bvsub lt!300734 lt!300738)) (bitIndex!0 (size!4407 (buf!4887 lt!301871)) (currentByte!9171 lt!301871) (currentBit!9166 lt!301871))))))

(assert (=> d!65937 (or (not (= (bvand lt!301872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300734 lt!300738) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301872 (bvsub lt!300734 lt!300738)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65937 (= lt!301872 (bitIndex!0 (size!4407 (buf!4887 (_2!9039 lt!300715))) (currentByte!9171 (_2!9039 lt!300715)) (currentBit!9166 (_2!9039 lt!300715))))))

(assert (=> d!65937 (= lt!301871 (_2!9040 (moveBitIndex!0 (_2!9039 lt!300715) (bvsub lt!300734 lt!300738))))))

(assert (=> d!65937 (moveBitIndexPrecond!0 (_2!9039 lt!300715) (bvsub lt!300734 lt!300738))))

(assert (=> d!65937 (= (withMovedBitIndex!0 (_2!9039 lt!300715) (bvsub lt!300734 lt!300738)) lt!301871)))

(declare-fun b!194189 () Bool)

(assert (=> b!194189 (= e!133619 (= (size!4407 (buf!4887 (_2!9039 lt!300715))) (size!4407 (buf!4887 lt!301871))))))

(assert (= (and d!65937 res!162347) b!194189))

(declare-fun m!300967 () Bool)

(assert (=> d!65937 m!300967))

(assert (=> d!65937 m!300187))

(declare-fun m!300969 () Bool)

(assert (=> d!65937 m!300969))

(declare-fun m!300971 () Bool)

(assert (=> d!65937 m!300971))

(assert (=> b!193803 d!65937))

(assert (=> b!193792 d!65885))

(assert (=> b!193792 d!65887))

(declare-fun d!65939 () Bool)

(declare-fun lt!301873 () tuple2!16806)

(assert (=> d!65939 (= lt!301873 (readBit!0 (readerFrom!0 (_2!9040 lt!300729) (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204))))))

(assert (=> d!65939 (= (readBitPure!0 (readerFrom!0 (_2!9040 lt!300729) (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204))) (tuple2!16795 (_2!9048 lt!301873) (_1!9048 lt!301873)))))

(declare-fun bs!16393 () Bool)

(assert (= bs!16393 d!65939))

(assert (=> bs!16393 m!300165))

(declare-fun m!300973 () Bool)

(assert (=> bs!16393 m!300973))

(assert (=> b!193797 d!65939))

(declare-fun d!65941 () Bool)

(declare-fun e!133622 () Bool)

(assert (=> d!65941 e!133622))

(declare-fun res!162351 () Bool)

(assert (=> d!65941 (=> (not res!162351) (not e!133622))))

(assert (=> d!65941 (= res!162351 (invariant!0 (currentBit!9166 (_2!9040 lt!300729)) (currentByte!9171 (_2!9040 lt!300729)) (size!4407 (buf!4887 (_2!9040 lt!300729)))))))

(assert (=> d!65941 (= (readerFrom!0 (_2!9040 lt!300729) (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204)) (BitStream!7923 (buf!4887 (_2!9040 lt!300729)) (currentByte!9171 thiss!1204) (currentBit!9166 thiss!1204)))))

(declare-fun b!194192 () Bool)

(assert (=> b!194192 (= e!133622 (invariant!0 (currentBit!9166 thiss!1204) (currentByte!9171 thiss!1204) (size!4407 (buf!4887 (_2!9040 lt!300729)))))))

(assert (= (and d!65941 res!162351) b!194192))

(assert (=> d!65941 m!300607))

(assert (=> b!194192 m!300149))

(assert (=> b!193797 d!65941))

(declare-fun d!65943 () Bool)

(assert (=> d!65943 (= (array_inv!4148 (buf!4887 thiss!1204)) (bvsge (size!4407 (buf!4887 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!193807 d!65943))

(declare-fun d!65945 () Bool)

(assert (=> d!65945 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9039 lt!300715)))) ((_ sign_extend 32) (currentByte!9171 (_1!9039 lt!300715))) ((_ sign_extend 32) (currentBit!9166 (_1!9039 lt!300715))) lt!300717) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4407 (buf!4887 (_1!9039 lt!300715)))) ((_ sign_extend 32) (currentByte!9171 (_1!9039 lt!300715))) ((_ sign_extend 32) (currentBit!9166 (_1!9039 lt!300715)))) lt!300717))))

(declare-fun bs!16394 () Bool)

(assert (= bs!16394 d!65945))

(declare-fun m!300975 () Bool)

(assert (=> bs!16394 m!300975))

(assert (=> b!193796 d!65945))

(assert (=> b!193806 d!65875))

(push 1)

(assert (not b!193987))

(assert (not d!65885))

(assert (not b!193961))

(assert (not b!194181))

(assert (not b!193960))

(assert (not d!65827))

(assert (not d!65899))

(assert (not b!193966))

(assert (not b!194174))

(assert (not b!194013))

(assert (not d!65825))

(assert (not b!194183))

(assert (not b!193959))

(assert (not b!194188))

(assert (not d!65871))

(assert (not d!65889))

(assert (not d!65861))

(assert (not b!194006))

(assert (not b!194184))

(assert (not bm!3053))

(assert (not b!193964))

(assert (not b!194178))

(assert (not b!193985))

(assert (not d!65941))

(assert (not d!65877))

(assert (not d!65847))

(assert (not d!65833))

(assert (not b!194011))

(assert (not d!65897))

(assert (not d!65887))

(assert (not d!65831))

(assert (not d!65867))

(assert (not d!65863))

(assert (not b!193962))

(assert (not d!65851))

(assert (not b!194005))

(assert (not b!193983))

(assert (not b!193981))

(assert (not d!65945))

(assert (not d!65845))

(assert (not b!193967))

(assert (not d!65841))

(assert (not b!194179))

(assert (not d!65879))

(assert (not b!194008))

(assert (not b!194176))

(assert (not b!194007))

(assert (not d!65937))

(assert (not d!65855))

(assert (not b!193965))

(assert (not b!194192))

(assert (not d!65839))

(assert (not d!65835))

(assert (not d!65873))

(assert (not d!65853))

(assert (not d!65893))

(assert (not d!65859))

(assert (not d!65843))

(assert (not d!65939))

(assert (not d!65857))

(assert (not d!65849))

(assert (not b!194175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

