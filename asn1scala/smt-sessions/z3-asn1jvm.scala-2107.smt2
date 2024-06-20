; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53414 () Bool)

(assert start!53414)

(declare-fun b!248062 () Bool)

(declare-fun e!171878 () Bool)

(declare-datatypes ((array!13539 0))(
  ( (array!13540 (arr!6923 (Array (_ BitVec 32) (_ BitVec 8))) (size!5936 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10794 0))(
  ( (BitStream!10795 (buf!6423 array!13539) (currentByte!11839 (_ BitVec 32)) (currentBit!11834 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10794)

(declare-datatypes ((Unit!17993 0))(
  ( (Unit!17994) )
))
(declare-datatypes ((tuple2!21276 0))(
  ( (tuple2!21277 (_1!11560 Unit!17993) (_2!11560 BitStream!10794)) )
))
(declare-fun lt!386606 () tuple2!21276)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248062 (= e!171878 (invariant!0 (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(declare-fun b!248063 () Bool)

(declare-fun e!171874 () Bool)

(declare-fun e!171876 () Bool)

(assert (=> b!248063 (= e!171874 e!171876)))

(declare-fun res!207620 () Bool)

(assert (=> b!248063 (=> (not res!207620) (not e!171876))))

(declare-fun lt!386589 () (_ BitVec 64))

(declare-fun lt!386591 () tuple2!21276)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!248063 (= res!207620 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606))) (bvadd (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))) lt!386589)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!248063 (= lt!386589 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!248064 () Bool)

(declare-fun e!171870 () Bool)

(declare-fun e!171877 () Bool)

(assert (=> b!248064 (= e!171870 e!171877)))

(declare-fun res!207608 () Bool)

(assert (=> b!248064 (=> (not res!207608) (not e!171877))))

(declare-fun lt!386597 () (_ BitVec 64))

(declare-fun lt!386603 () (_ BitVec 64))

(assert (=> b!248064 (= res!207608 (= lt!386597 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!386603)))))

(assert (=> b!248064 (= lt!386597 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))))))

(assert (=> b!248064 (= lt!386603 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))

(declare-fun b!248065 () Bool)

(declare-fun e!171875 () Bool)

(declare-datatypes ((tuple2!21278 0))(
  ( (tuple2!21279 (_1!11561 BitStream!10794) (_2!11561 Bool)) )
))
(declare-fun lt!386600 () tuple2!21278)

(declare-fun lt!386604 () tuple2!21278)

(assert (=> b!248065 (= e!171875 (= (_2!11561 lt!386600) (_2!11561 lt!386604)))))

(declare-fun b!248066 () Bool)

(declare-fun e!171873 () Bool)

(declare-fun array_inv!5677 (array!13539) Bool)

(assert (=> b!248066 (= e!171873 (array_inv!5677 (buf!6423 thiss!1005)))))

(declare-fun b!248067 () Bool)

(declare-fun e!171872 () Bool)

(declare-fun lt!386607 () tuple2!21278)

(assert (=> b!248067 (= e!171872 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!386607))) (currentByte!11839 (_1!11561 lt!386607)) (currentBit!11834 (_1!11561 lt!386607))) lt!386597))))

(declare-fun b!248068 () Bool)

(assert (=> b!248068 (= e!171877 e!171872)))

(declare-fun res!207616 () Bool)

(assert (=> b!248068 (=> (not res!207616) (not e!171872))))

(declare-fun bit!26 () Bool)

(assert (=> b!248068 (= res!207616 (and (= (_2!11561 lt!386607) bit!26) (= (_1!11561 lt!386607) (_2!11560 lt!386591))))))

(declare-fun readBitPure!0 (BitStream!10794) tuple2!21278)

(declare-fun readerFrom!0 (BitStream!10794 (_ BitVec 32) (_ BitVec 32)) BitStream!10794)

(assert (=> b!248068 (= lt!386607 (readBitPure!0 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))))

(declare-fun b!248069 () Bool)

(declare-fun e!171869 () Bool)

(declare-datatypes ((tuple2!21280 0))(
  ( (tuple2!21281 (_1!11562 BitStream!10794) (_2!11562 BitStream!10794)) )
))
(declare-fun lt!386588 () tuple2!21280)

(declare-fun lt!386601 () tuple2!21280)

(declare-fun withMovedBitIndex!0 (BitStream!10794 (_ BitVec 64)) BitStream!10794)

(assert (=> b!248069 (= e!171869 (= (_1!11562 lt!386588) (withMovedBitIndex!0 (_1!11562 lt!386601) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!248070 () Bool)

(declare-fun res!207614 () Bool)

(declare-fun e!171868 () Bool)

(assert (=> b!248070 (=> (not res!207614) (not e!171868))))

(assert (=> b!248070 (= res!207614 (bvslt from!289 nBits!297))))

(declare-fun b!248071 () Bool)

(declare-fun res!207615 () Bool)

(assert (=> b!248071 (=> (not res!207615) (not e!171877))))

(declare-fun isPrefixOf!0 (BitStream!10794 BitStream!10794) Bool)

(assert (=> b!248071 (= res!207615 (isPrefixOf!0 thiss!1005 (_2!11560 lt!386591)))))

(declare-fun b!248061 () Bool)

(assert (=> b!248061 (= e!171868 (not e!171869))))

(declare-fun res!207612 () Bool)

(assert (=> b!248061 (=> res!207612 e!171869)))

(declare-fun checkBitsLoopPure!0 (BitStream!10794 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21278)

(assert (=> b!248061 (= res!207612 (not (= (_1!11561 (checkBitsLoopPure!0 (_1!11562 lt!386588) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_2!11562 lt!386588))))))

(declare-fun lt!386598 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!248061 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386598)))

(declare-fun lt!386605 () Unit!17993)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10794 array!13539 (_ BitVec 64)) Unit!17993)

(assert (=> b!248061 (= lt!386605 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!386606)) lt!386598))))

(declare-fun lt!386596 () tuple2!21278)

(assert (=> b!248061 (= lt!386596 (checkBitsLoopPure!0 (_1!11562 lt!386601) nBits!297 bit!26 from!289))))

(assert (=> b!248061 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386590 () Unit!17993)

(assert (=> b!248061 (= lt!386590 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6423 (_2!11560 lt!386606)) (bvsub nBits!297 from!289)))))

(assert (=> b!248061 (= (_2!11561 (readBitPure!0 (_1!11562 lt!386601))) bit!26)))

(declare-fun reader!0 (BitStream!10794 BitStream!10794) tuple2!21280)

(assert (=> b!248061 (= lt!386588 (reader!0 (_2!11560 lt!386591) (_2!11560 lt!386606)))))

(assert (=> b!248061 (= lt!386601 (reader!0 thiss!1005 (_2!11560 lt!386606)))))

(assert (=> b!248061 e!171875))

(declare-fun res!207621 () Bool)

(assert (=> b!248061 (=> (not res!207621) (not e!171875))))

(assert (=> b!248061 (= res!207621 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!386600))) (currentByte!11839 (_1!11561 lt!386600)) (currentBit!11834 (_1!11561 lt!386600))) (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!386604))) (currentByte!11839 (_1!11561 lt!386604)) (currentBit!11834 (_1!11561 lt!386604)))))))

(declare-fun lt!386592 () Unit!17993)

(declare-fun lt!386599 () BitStream!10794)

(declare-fun readBitPrefixLemma!0 (BitStream!10794 BitStream!10794) Unit!17993)

(assert (=> b!248061 (= lt!386592 (readBitPrefixLemma!0 lt!386599 (_2!11560 lt!386606)))))

(assert (=> b!248061 (= lt!386604 (readBitPure!0 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(assert (=> b!248061 (= lt!386600 (readBitPure!0 lt!386599))))

(assert (=> b!248061 (= lt!386599 (BitStream!10795 (buf!6423 (_2!11560 lt!386591)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))

(assert (=> b!248061 e!171878))

(declare-fun res!207611 () Bool)

(assert (=> b!248061 (=> (not res!207611) (not e!171878))))

(assert (=> b!248061 (= res!207611 (isPrefixOf!0 thiss!1005 (_2!11560 lt!386606)))))

(declare-fun lt!386594 () Unit!17993)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10794 BitStream!10794 BitStream!10794) Unit!17993)

(assert (=> b!248061 (= lt!386594 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11560 lt!386591) (_2!11560 lt!386606)))))

(assert (=> b!248061 e!171874))

(declare-fun res!207617 () Bool)

(assert (=> b!248061 (=> (not res!207617) (not e!171874))))

(assert (=> b!248061 (= res!207617 (= (size!5936 (buf!6423 (_2!11560 lt!386591))) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10794 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21276)

(assert (=> b!248061 (= lt!386606 (appendNBitsLoop!0 (_2!11560 lt!386591) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248061 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386598)))

(assert (=> b!248061 (= lt!386598 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!386595 () Unit!17993)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10794 BitStream!10794 (_ BitVec 64) (_ BitVec 64)) Unit!17993)

(assert (=> b!248061 (= lt!386595 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11560 lt!386591) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!248061 e!171870))

(declare-fun res!207619 () Bool)

(assert (=> b!248061 (=> (not res!207619) (not e!171870))))

(assert (=> b!248061 (= res!207619 (= (size!5936 (buf!6423 thiss!1005)) (size!5936 (buf!6423 (_2!11560 lt!386591)))))))

(declare-fun appendBit!0 (BitStream!10794 Bool) tuple2!21276)

(assert (=> b!248061 (= lt!386591 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!207610 () Bool)

(assert (=> start!53414 (=> (not res!207610) (not e!171868))))

(assert (=> start!53414 (= res!207610 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53414 e!171868))

(assert (=> start!53414 true))

(declare-fun inv!12 (BitStream!10794) Bool)

(assert (=> start!53414 (and (inv!12 thiss!1005) e!171873)))

(declare-fun b!248072 () Bool)

(declare-fun res!207609 () Bool)

(assert (=> b!248072 (=> (not res!207609) (not e!171868))))

(assert (=> b!248072 (= res!207609 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!248073 () Bool)

(declare-fun lt!386587 () tuple2!21278)

(declare-fun lt!386602 () tuple2!21280)

(assert (=> b!248073 (= e!171876 (not (or (not (_2!11561 lt!386587)) (not (= (_1!11561 lt!386587) (_2!11562 lt!386602))))))))

(assert (=> b!248073 (= lt!386587 (checkBitsLoopPure!0 (_1!11562 lt!386602) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248073 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386589)))

(declare-fun lt!386593 () Unit!17993)

(assert (=> b!248073 (= lt!386593 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!386606)) lt!386589))))

(assert (=> b!248073 (= lt!386602 (reader!0 (_2!11560 lt!386591) (_2!11560 lt!386606)))))

(declare-fun b!248074 () Bool)

(declare-fun res!207613 () Bool)

(assert (=> b!248074 (=> (not res!207613) (not e!171878))))

(assert (=> b!248074 (= res!207613 (invariant!0 (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!386591)))))))

(declare-fun b!248075 () Bool)

(declare-fun res!207618 () Bool)

(assert (=> b!248075 (=> (not res!207618) (not e!171876))))

(assert (=> b!248075 (= res!207618 (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!386606)))))

(assert (= (and start!53414 res!207610) b!248072))

(assert (= (and b!248072 res!207609) b!248070))

(assert (= (and b!248070 res!207614) b!248061))

(assert (= (and b!248061 res!207619) b!248064))

(assert (= (and b!248064 res!207608) b!248071))

(assert (= (and b!248071 res!207615) b!248068))

(assert (= (and b!248068 res!207616) b!248067))

(assert (= (and b!248061 res!207617) b!248063))

(assert (= (and b!248063 res!207620) b!248075))

(assert (= (and b!248075 res!207618) b!248073))

(assert (= (and b!248061 res!207611) b!248074))

(assert (= (and b!248074 res!207613) b!248062))

(assert (= (and b!248061 res!207621) b!248065))

(assert (= (and b!248061 (not res!207612)) b!248069))

(assert (= start!53414 b!248066))

(declare-fun m!373829 () Bool)

(assert (=> b!248072 m!373829))

(declare-fun m!373831 () Bool)

(assert (=> b!248073 m!373831))

(declare-fun m!373833 () Bool)

(assert (=> b!248073 m!373833))

(declare-fun m!373835 () Bool)

(assert (=> b!248073 m!373835))

(declare-fun m!373837 () Bool)

(assert (=> b!248073 m!373837))

(declare-fun m!373839 () Bool)

(assert (=> start!53414 m!373839))

(declare-fun m!373841 () Bool)

(assert (=> b!248062 m!373841))

(declare-fun m!373843 () Bool)

(assert (=> b!248061 m!373843))

(declare-fun m!373845 () Bool)

(assert (=> b!248061 m!373845))

(declare-fun m!373847 () Bool)

(assert (=> b!248061 m!373847))

(declare-fun m!373849 () Bool)

(assert (=> b!248061 m!373849))

(declare-fun m!373851 () Bool)

(assert (=> b!248061 m!373851))

(declare-fun m!373853 () Bool)

(assert (=> b!248061 m!373853))

(declare-fun m!373855 () Bool)

(assert (=> b!248061 m!373855))

(declare-fun m!373857 () Bool)

(assert (=> b!248061 m!373857))

(declare-fun m!373859 () Bool)

(assert (=> b!248061 m!373859))

(declare-fun m!373861 () Bool)

(assert (=> b!248061 m!373861))

(declare-fun m!373863 () Bool)

(assert (=> b!248061 m!373863))

(declare-fun m!373865 () Bool)

(assert (=> b!248061 m!373865))

(declare-fun m!373867 () Bool)

(assert (=> b!248061 m!373867))

(declare-fun m!373869 () Bool)

(assert (=> b!248061 m!373869))

(assert (=> b!248061 m!373837))

(declare-fun m!373871 () Bool)

(assert (=> b!248061 m!373871))

(declare-fun m!373873 () Bool)

(assert (=> b!248061 m!373873))

(declare-fun m!373875 () Bool)

(assert (=> b!248061 m!373875))

(declare-fun m!373877 () Bool)

(assert (=> b!248061 m!373877))

(declare-fun m!373879 () Bool)

(assert (=> b!248061 m!373879))

(declare-fun m!373881 () Bool)

(assert (=> b!248064 m!373881))

(declare-fun m!373883 () Bool)

(assert (=> b!248064 m!373883))

(declare-fun m!373885 () Bool)

(assert (=> b!248068 m!373885))

(assert (=> b!248068 m!373885))

(declare-fun m!373887 () Bool)

(assert (=> b!248068 m!373887))

(declare-fun m!373889 () Bool)

(assert (=> b!248063 m!373889))

(assert (=> b!248063 m!373881))

(declare-fun m!373891 () Bool)

(assert (=> b!248074 m!373891))

(declare-fun m!373893 () Bool)

(assert (=> b!248069 m!373893))

(declare-fun m!373895 () Bool)

(assert (=> b!248075 m!373895))

(declare-fun m!373897 () Bool)

(assert (=> b!248071 m!373897))

(declare-fun m!373899 () Bool)

(assert (=> b!248066 m!373899))

(declare-fun m!373901 () Bool)

(assert (=> b!248067 m!373901))

(check-sat (not b!248075) (not b!248066) (not b!248073) (not b!248072) (not b!248068) (not b!248067) (not b!248074) (not b!248071) (not b!248064) (not start!53414) (not b!248061) (not b!248069) (not b!248062) (not b!248063))
(check-sat)
(get-model)

(declare-fun d!83126 () Bool)

(declare-datatypes ((tuple2!21292 0))(
  ( (tuple2!21293 (_1!11568 Bool) (_2!11568 BitStream!10794)) )
))
(declare-fun lt!387081 () tuple2!21292)

(declare-fun readBit!0 (BitStream!10794) tuple2!21292)

(assert (=> d!83126 (= lt!387081 (readBit!0 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))))

(assert (=> d!83126 (= (readBitPure!0 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))) (tuple2!21279 (_2!11568 lt!387081) (_1!11568 lt!387081)))))

(declare-fun bs!21075 () Bool)

(assert (= bs!21075 d!83126))

(assert (=> bs!21075 m!373885))

(declare-fun m!374305 () Bool)

(assert (=> bs!21075 m!374305))

(assert (=> b!248068 d!83126))

(declare-fun d!83128 () Bool)

(declare-fun e!172014 () Bool)

(assert (=> d!83128 e!172014))

(declare-fun res!207827 () Bool)

(assert (=> d!83128 (=> (not res!207827) (not e!172014))))

(assert (=> d!83128 (= res!207827 (invariant!0 (currentBit!11834 (_2!11560 lt!386591)) (currentByte!11839 (_2!11560 lt!386591)) (size!5936 (buf!6423 (_2!11560 lt!386591)))))))

(assert (=> d!83128 (= (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)) (BitStream!10795 (buf!6423 (_2!11560 lt!386591)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))

(declare-fun b!248299 () Bool)

(assert (=> b!248299 (= e!172014 (invariant!0 (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!386591)))))))

(assert (= (and d!83128 res!207827) b!248299))

(declare-fun m!374307 () Bool)

(assert (=> d!83128 m!374307))

(assert (=> b!248299 m!373891))

(assert (=> b!248068 d!83128))

(declare-fun d!83130 () Bool)

(declare-fun e!172017 () Bool)

(assert (=> d!83130 e!172017))

(declare-fun res!207833 () Bool)

(assert (=> d!83130 (=> (not res!207833) (not e!172017))))

(declare-fun lt!387096 () (_ BitVec 64))

(declare-fun lt!387099 () (_ BitVec 64))

(declare-fun lt!387094 () (_ BitVec 64))

(assert (=> d!83130 (= res!207833 (= lt!387096 (bvsub lt!387094 lt!387099)))))

(assert (=> d!83130 (or (= (bvand lt!387094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387099 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387094 lt!387099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83130 (= lt!387099 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386607)))) ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386607))) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386607)))))))

(declare-fun lt!387098 () (_ BitVec 64))

(declare-fun lt!387097 () (_ BitVec 64))

(assert (=> d!83130 (= lt!387094 (bvmul lt!387098 lt!387097))))

(assert (=> d!83130 (or (= lt!387098 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387097 (bvsdiv (bvmul lt!387098 lt!387097) lt!387098)))))

(assert (=> d!83130 (= lt!387097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83130 (= lt!387098 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386607)))))))

(assert (=> d!83130 (= lt!387096 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386607))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386607)))))))

(assert (=> d!83130 (invariant!0 (currentBit!11834 (_1!11561 lt!386607)) (currentByte!11839 (_1!11561 lt!386607)) (size!5936 (buf!6423 (_1!11561 lt!386607))))))

(assert (=> d!83130 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!386607))) (currentByte!11839 (_1!11561 lt!386607)) (currentBit!11834 (_1!11561 lt!386607))) lt!387096)))

(declare-fun b!248304 () Bool)

(declare-fun res!207832 () Bool)

(assert (=> b!248304 (=> (not res!207832) (not e!172017))))

(assert (=> b!248304 (= res!207832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387096))))

(declare-fun b!248305 () Bool)

(declare-fun lt!387095 () (_ BitVec 64))

(assert (=> b!248305 (= e!172017 (bvsle lt!387096 (bvmul lt!387095 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248305 (or (= lt!387095 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387095 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387095)))))

(assert (=> b!248305 (= lt!387095 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386607)))))))

(assert (= (and d!83130 res!207833) b!248304))

(assert (= (and b!248304 res!207832) b!248305))

(declare-fun m!374309 () Bool)

(assert (=> d!83130 m!374309))

(declare-fun m!374311 () Bool)

(assert (=> d!83130 m!374311))

(assert (=> b!248067 d!83130))

(declare-fun d!83132 () Bool)

(declare-fun res!207840 () Bool)

(declare-fun e!172023 () Bool)

(assert (=> d!83132 (=> (not res!207840) (not e!172023))))

(assert (=> d!83132 (= res!207840 (= (size!5936 (buf!6423 thiss!1005)) (size!5936 (buf!6423 (_2!11560 lt!386591)))))))

(assert (=> d!83132 (= (isPrefixOf!0 thiss!1005 (_2!11560 lt!386591)) e!172023)))

(declare-fun b!248312 () Bool)

(declare-fun res!207841 () Bool)

(assert (=> b!248312 (=> (not res!207841) (not e!172023))))

(assert (=> b!248312 (= res!207841 (bvsle (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(declare-fun b!248313 () Bool)

(declare-fun e!172022 () Bool)

(assert (=> b!248313 (= e!172023 e!172022)))

(declare-fun res!207842 () Bool)

(assert (=> b!248313 (=> res!207842 e!172022)))

(assert (=> b!248313 (= res!207842 (= (size!5936 (buf!6423 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248314 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13539 array!13539 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!248314 (= e!172022 (arrayBitRangesEq!0 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!386591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(assert (= (and d!83132 res!207840) b!248312))

(assert (= (and b!248312 res!207841) b!248313))

(assert (= (and b!248313 (not res!207842)) b!248314))

(assert (=> b!248312 m!373883))

(assert (=> b!248312 m!373881))

(assert (=> b!248314 m!373883))

(assert (=> b!248314 m!373883))

(declare-fun m!374313 () Bool)

(assert (=> b!248314 m!374313))

(assert (=> b!248071 d!83132))

(declare-fun d!83134 () Bool)

(declare-fun e!172026 () Bool)

(assert (=> d!83134 e!172026))

(declare-fun res!207845 () Bool)

(assert (=> d!83134 (=> (not res!207845) (not e!172026))))

(declare-fun lt!387105 () (_ BitVec 64))

(declare-fun lt!387104 () BitStream!10794)

(assert (=> d!83134 (= res!207845 (= (bvadd lt!387105 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5936 (buf!6423 lt!387104)) (currentByte!11839 lt!387104) (currentBit!11834 lt!387104))))))

(assert (=> d!83134 (or (not (= (bvand lt!387105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387105 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83134 (= lt!387105 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)) (currentBit!11834 (_1!11562 lt!386601))))))

(declare-fun moveBitIndex!0 (BitStream!10794 (_ BitVec 64)) tuple2!21276)

(assert (=> d!83134 (= lt!387104 (_2!11560 (moveBitIndex!0 (_1!11562 lt!386601) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10794 (_ BitVec 64)) Bool)

(assert (=> d!83134 (moveBitIndexPrecond!0 (_1!11562 lt!386601) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!83134 (= (withMovedBitIndex!0 (_1!11562 lt!386601) #b0000000000000000000000000000000000000000000000000000000000000001) lt!387104)))

(declare-fun b!248317 () Bool)

(assert (=> b!248317 (= e!172026 (= (size!5936 (buf!6423 (_1!11562 lt!386601))) (size!5936 (buf!6423 lt!387104))))))

(assert (= (and d!83134 res!207845) b!248317))

(declare-fun m!374315 () Bool)

(assert (=> d!83134 m!374315))

(declare-fun m!374317 () Bool)

(assert (=> d!83134 m!374317))

(declare-fun m!374319 () Bool)

(assert (=> d!83134 m!374319))

(declare-fun m!374321 () Bool)

(assert (=> d!83134 m!374321))

(assert (=> b!248069 d!83134))

(declare-fun d!83136 () Bool)

(declare-fun e!172027 () Bool)

(assert (=> d!83136 e!172027))

(declare-fun res!207847 () Bool)

(assert (=> d!83136 (=> (not res!207847) (not e!172027))))

(declare-fun lt!387111 () (_ BitVec 64))

(declare-fun lt!387108 () (_ BitVec 64))

(declare-fun lt!387106 () (_ BitVec 64))

(assert (=> d!83136 (= res!207847 (= lt!387108 (bvsub lt!387106 lt!387111)))))

(assert (=> d!83136 (or (= (bvand lt!387106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387106 lt!387111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83136 (= lt!387111 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386606))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386606)))))))

(declare-fun lt!387110 () (_ BitVec 64))

(declare-fun lt!387109 () (_ BitVec 64))

(assert (=> d!83136 (= lt!387106 (bvmul lt!387110 lt!387109))))

(assert (=> d!83136 (or (= lt!387110 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387109 (bvsdiv (bvmul lt!387110 lt!387109) lt!387110)))))

(assert (=> d!83136 (= lt!387109 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83136 (= lt!387110 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(assert (=> d!83136 (= lt!387108 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386606))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386606)))))))

(assert (=> d!83136 (invariant!0 (currentBit!11834 (_2!11560 lt!386606)) (currentByte!11839 (_2!11560 lt!386606)) (size!5936 (buf!6423 (_2!11560 lt!386606))))))

(assert (=> d!83136 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606))) lt!387108)))

(declare-fun b!248318 () Bool)

(declare-fun res!207846 () Bool)

(assert (=> b!248318 (=> (not res!207846) (not e!172027))))

(assert (=> b!248318 (= res!207846 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387108))))

(declare-fun b!248319 () Bool)

(declare-fun lt!387107 () (_ BitVec 64))

(assert (=> b!248319 (= e!172027 (bvsle lt!387108 (bvmul lt!387107 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248319 (or (= lt!387107 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387107 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387107)))))

(assert (=> b!248319 (= lt!387107 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(assert (= (and d!83136 res!207847) b!248318))

(assert (= (and b!248318 res!207846) b!248319))

(declare-fun m!374323 () Bool)

(assert (=> d!83136 m!374323))

(declare-fun m!374325 () Bool)

(assert (=> d!83136 m!374325))

(assert (=> b!248063 d!83136))

(declare-fun d!83138 () Bool)

(declare-fun e!172028 () Bool)

(assert (=> d!83138 e!172028))

(declare-fun res!207849 () Bool)

(assert (=> d!83138 (=> (not res!207849) (not e!172028))))

(declare-fun lt!387114 () (_ BitVec 64))

(declare-fun lt!387112 () (_ BitVec 64))

(declare-fun lt!387117 () (_ BitVec 64))

(assert (=> d!83138 (= res!207849 (= lt!387114 (bvsub lt!387112 lt!387117)))))

(assert (=> d!83138 (or (= (bvand lt!387112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387117 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387112 lt!387117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83138 (= lt!387117 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))))))

(declare-fun lt!387116 () (_ BitVec 64))

(declare-fun lt!387115 () (_ BitVec 64))

(assert (=> d!83138 (= lt!387112 (bvmul lt!387116 lt!387115))))

(assert (=> d!83138 (or (= lt!387116 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387115 (bvsdiv (bvmul lt!387116 lt!387115) lt!387116)))))

(assert (=> d!83138 (= lt!387115 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83138 (= lt!387116 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))))))

(assert (=> d!83138 (= lt!387114 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))))))

(assert (=> d!83138 (invariant!0 (currentBit!11834 (_2!11560 lt!386591)) (currentByte!11839 (_2!11560 lt!386591)) (size!5936 (buf!6423 (_2!11560 lt!386591))))))

(assert (=> d!83138 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))) lt!387114)))

(declare-fun b!248320 () Bool)

(declare-fun res!207848 () Bool)

(assert (=> b!248320 (=> (not res!207848) (not e!172028))))

(assert (=> b!248320 (= res!207848 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387114))))

(declare-fun b!248321 () Bool)

(declare-fun lt!387113 () (_ BitVec 64))

(assert (=> b!248321 (= e!172028 (bvsle lt!387114 (bvmul lt!387113 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248321 (or (= lt!387113 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387113 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387113)))))

(assert (=> b!248321 (= lt!387113 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))))))

(assert (= (and d!83138 res!207849) b!248320))

(assert (= (and b!248320 res!207848) b!248321))

(declare-fun m!374327 () Bool)

(assert (=> d!83138 m!374327))

(assert (=> d!83138 m!374307))

(assert (=> b!248063 d!83138))

(declare-fun d!83140 () Bool)

(assert (=> d!83140 (= (invariant!0 (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!386591)))) (and (bvsge (currentBit!11834 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11834 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11839 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!386591)))) (and (= (currentBit!11834 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!386591))))))))))

(assert (=> b!248074 d!83140))

(declare-fun lt!387120 () tuple2!21292)

(declare-fun d!83142 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10794 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21292)

(assert (=> d!83142 (= lt!387120 (checkBitsLoop!0 (_1!11562 lt!386602) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83142 (= (checkBitsLoopPure!0 (_1!11562 lt!386602) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21279 (_2!11568 lt!387120) (_1!11568 lt!387120)))))

(declare-fun bs!21076 () Bool)

(assert (= bs!21076 d!83142))

(declare-fun m!374329 () Bool)

(assert (=> bs!21076 m!374329))

(assert (=> b!248073 d!83142))

(declare-fun d!83144 () Bool)

(assert (=> d!83144 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386589) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))) lt!386589))))

(declare-fun bs!21077 () Bool)

(assert (= bs!21077 d!83144))

(declare-fun m!374331 () Bool)

(assert (=> bs!21077 m!374331))

(assert (=> b!248073 d!83144))

(declare-fun d!83146 () Bool)

(assert (=> d!83146 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386589)))

(declare-fun lt!387123 () Unit!17993)

(declare-fun choose!9 (BitStream!10794 array!13539 (_ BitVec 64) BitStream!10794) Unit!17993)

(assert (=> d!83146 (= lt!387123 (choose!9 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!386606)) lt!386589 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(assert (=> d!83146 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!386606)) lt!386589) lt!387123)))

(declare-fun bs!21078 () Bool)

(assert (= bs!21078 d!83146))

(assert (=> bs!21078 m!373833))

(declare-fun m!374333 () Bool)

(assert (=> bs!21078 m!374333))

(assert (=> b!248073 d!83146))

(declare-fun lt!387182 () (_ BitVec 64))

(declare-fun lt!387167 () (_ BitVec 64))

(declare-fun e!172034 () Bool)

(declare-fun lt!387165 () tuple2!21280)

(declare-fun b!248332 () Bool)

(assert (=> b!248332 (= e!172034 (= (_1!11562 lt!387165) (withMovedBitIndex!0 (_2!11562 lt!387165) (bvsub lt!387182 lt!387167))))))

(assert (=> b!248332 (or (= (bvand lt!387182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387167 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387182 lt!387167) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248332 (= lt!387167 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606))))))

(assert (=> b!248332 (= lt!387182 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))))))

(declare-fun b!248334 () Bool)

(declare-fun e!172033 () Unit!17993)

(declare-fun Unit!18001 () Unit!17993)

(assert (=> b!248334 (= e!172033 Unit!18001)))

(declare-fun b!248335 () Bool)

(declare-fun res!207857 () Bool)

(assert (=> b!248335 (=> (not res!207857) (not e!172034))))

(assert (=> b!248335 (= res!207857 (isPrefixOf!0 (_2!11562 lt!387165) (_2!11560 lt!386606)))))

(declare-fun b!248336 () Bool)

(declare-fun res!207856 () Bool)

(assert (=> b!248336 (=> (not res!207856) (not e!172034))))

(assert (=> b!248336 (= res!207856 (isPrefixOf!0 (_1!11562 lt!387165) (_2!11560 lt!386591)))))

(declare-fun b!248333 () Bool)

(declare-fun lt!387181 () Unit!17993)

(assert (=> b!248333 (= e!172033 lt!387181)))

(declare-fun lt!387183 () (_ BitVec 64))

(assert (=> b!248333 (= lt!387183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!387164 () (_ BitVec 64))

(assert (=> b!248333 (= lt!387164 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13539 array!13539 (_ BitVec 64) (_ BitVec 64)) Unit!17993)

(assert (=> b!248333 (= lt!387181 (arrayBitRangesEqSymmetric!0 (buf!6423 (_2!11560 lt!386591)) (buf!6423 (_2!11560 lt!386606)) lt!387183 lt!387164))))

(assert (=> b!248333 (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386606)) (buf!6423 (_2!11560 lt!386591)) lt!387183 lt!387164)))

(declare-fun d!83148 () Bool)

(assert (=> d!83148 e!172034))

(declare-fun res!207858 () Bool)

(assert (=> d!83148 (=> (not res!207858) (not e!172034))))

(assert (=> d!83148 (= res!207858 (isPrefixOf!0 (_1!11562 lt!387165) (_2!11562 lt!387165)))))

(declare-fun lt!387170 () BitStream!10794)

(assert (=> d!83148 (= lt!387165 (tuple2!21281 lt!387170 (_2!11560 lt!386606)))))

(declare-fun lt!387177 () Unit!17993)

(declare-fun lt!387169 () Unit!17993)

(assert (=> d!83148 (= lt!387177 lt!387169)))

(assert (=> d!83148 (isPrefixOf!0 lt!387170 (_2!11560 lt!386606))))

(assert (=> d!83148 (= lt!387169 (lemmaIsPrefixTransitive!0 lt!387170 (_2!11560 lt!386606) (_2!11560 lt!386606)))))

(declare-fun lt!387174 () Unit!17993)

(declare-fun lt!387175 () Unit!17993)

(assert (=> d!83148 (= lt!387174 lt!387175)))

(assert (=> d!83148 (isPrefixOf!0 lt!387170 (_2!11560 lt!386606))))

(assert (=> d!83148 (= lt!387175 (lemmaIsPrefixTransitive!0 lt!387170 (_2!11560 lt!386591) (_2!11560 lt!386606)))))

(declare-fun lt!387168 () Unit!17993)

(assert (=> d!83148 (= lt!387168 e!172033)))

(declare-fun c!11532 () Bool)

(assert (=> d!83148 (= c!11532 (not (= (size!5936 (buf!6423 (_2!11560 lt!386591))) #b00000000000000000000000000000000)))))

(declare-fun lt!387180 () Unit!17993)

(declare-fun lt!387172 () Unit!17993)

(assert (=> d!83148 (= lt!387180 lt!387172)))

(assert (=> d!83148 (isPrefixOf!0 (_2!11560 lt!386606) (_2!11560 lt!386606))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10794) Unit!17993)

(assert (=> d!83148 (= lt!387172 (lemmaIsPrefixRefl!0 (_2!11560 lt!386606)))))

(declare-fun lt!387173 () Unit!17993)

(declare-fun lt!387166 () Unit!17993)

(assert (=> d!83148 (= lt!387173 lt!387166)))

(assert (=> d!83148 (= lt!387166 (lemmaIsPrefixRefl!0 (_2!11560 lt!386606)))))

(declare-fun lt!387178 () Unit!17993)

(declare-fun lt!387171 () Unit!17993)

(assert (=> d!83148 (= lt!387178 lt!387171)))

(assert (=> d!83148 (isPrefixOf!0 lt!387170 lt!387170)))

(assert (=> d!83148 (= lt!387171 (lemmaIsPrefixRefl!0 lt!387170))))

(declare-fun lt!387176 () Unit!17993)

(declare-fun lt!387179 () Unit!17993)

(assert (=> d!83148 (= lt!387176 lt!387179)))

(assert (=> d!83148 (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!386591))))

(assert (=> d!83148 (= lt!387179 (lemmaIsPrefixRefl!0 (_2!11560 lt!386591)))))

(assert (=> d!83148 (= lt!387170 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))))))

(assert (=> d!83148 (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!386606))))

(assert (=> d!83148 (= (reader!0 (_2!11560 lt!386591) (_2!11560 lt!386606)) lt!387165)))

(assert (= (and d!83148 c!11532) b!248333))

(assert (= (and d!83148 (not c!11532)) b!248334))

(assert (= (and d!83148 res!207858) b!248336))

(assert (= (and b!248336 res!207856) b!248335))

(assert (= (and b!248335 res!207857) b!248332))

(declare-fun m!374335 () Bool)

(assert (=> b!248336 m!374335))

(declare-fun m!374337 () Bool)

(assert (=> d!83148 m!374337))

(declare-fun m!374339 () Bool)

(assert (=> d!83148 m!374339))

(declare-fun m!374341 () Bool)

(assert (=> d!83148 m!374341))

(declare-fun m!374343 () Bool)

(assert (=> d!83148 m!374343))

(declare-fun m!374345 () Bool)

(assert (=> d!83148 m!374345))

(assert (=> d!83148 m!373895))

(declare-fun m!374347 () Bool)

(assert (=> d!83148 m!374347))

(declare-fun m!374349 () Bool)

(assert (=> d!83148 m!374349))

(declare-fun m!374351 () Bool)

(assert (=> d!83148 m!374351))

(declare-fun m!374353 () Bool)

(assert (=> d!83148 m!374353))

(declare-fun m!374355 () Bool)

(assert (=> d!83148 m!374355))

(declare-fun m!374357 () Bool)

(assert (=> b!248332 m!374357))

(assert (=> b!248332 m!373889))

(assert (=> b!248332 m!373881))

(declare-fun m!374359 () Bool)

(assert (=> b!248335 m!374359))

(assert (=> b!248333 m!373881))

(declare-fun m!374361 () Bool)

(assert (=> b!248333 m!374361))

(declare-fun m!374363 () Bool)

(assert (=> b!248333 m!374363))

(assert (=> b!248073 d!83148))

(declare-fun d!83150 () Bool)

(assert (=> d!83150 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005) (size!5936 (buf!6423 thiss!1005))))))

(declare-fun bs!21079 () Bool)

(assert (= bs!21079 d!83150))

(declare-fun m!374365 () Bool)

(assert (=> bs!21079 m!374365))

(assert (=> start!53414 d!83150))

(declare-fun d!83152 () Bool)

(assert (=> d!83152 (= (invariant!0 (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!386606)))) (and (bvsge (currentBit!11834 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11834 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11839 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!386606)))) (and (= (currentBit!11834 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!386606))))))))))

(assert (=> b!248062 d!83152))

(declare-fun d!83154 () Bool)

(declare-fun e!172040 () Bool)

(assert (=> d!83154 e!172040))

(declare-fun res!207867 () Bool)

(assert (=> d!83154 (=> (not res!207867) (not e!172040))))

(declare-fun lt!387202 () tuple2!21276)

(assert (=> d!83154 (= res!207867 (= (size!5936 (buf!6423 (_2!11560 lt!386591))) (size!5936 (buf!6423 (_2!11560 lt!387202)))))))

(declare-fun choose!51 (BitStream!10794 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21276)

(assert (=> d!83154 (= lt!387202 (choose!51 (_2!11560 lt!386591) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83154 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83154 (= (appendNBitsLoop!0 (_2!11560 lt!386591) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!387202)))

(declare-fun b!248348 () Bool)

(declare-fun e!172039 () Bool)

(declare-fun lt!387201 () (_ BitVec 64))

(assert (=> b!248348 (= e!172039 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!387201))))

(declare-fun b!248346 () Bool)

(declare-fun res!207869 () Bool)

(assert (=> b!248346 (=> (not res!207869) (not e!172040))))

(assert (=> b!248346 (= res!207869 (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!387202)))))

(declare-fun b!248345 () Bool)

(declare-fun res!207868 () Bool)

(assert (=> b!248345 (=> (not res!207868) (not e!172040))))

(declare-fun lt!387206 () (_ BitVec 64))

(declare-fun lt!387207 () (_ BitVec 64))

(assert (=> b!248345 (= res!207868 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!387202))) (currentByte!11839 (_2!11560 lt!387202)) (currentBit!11834 (_2!11560 lt!387202))) (bvadd lt!387206 lt!387207)))))

(assert (=> b!248345 (or (not (= (bvand lt!387206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387207 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387206 lt!387207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248345 (= lt!387207 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248345 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248345 (= lt!387206 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))))))

(declare-fun b!248347 () Bool)

(declare-fun lt!387200 () tuple2!21278)

(declare-fun lt!387203 () tuple2!21280)

(assert (=> b!248347 (= e!172040 (and (_2!11561 lt!387200) (= (_1!11561 lt!387200) (_2!11562 lt!387203))))))

(assert (=> b!248347 (= lt!387200 (checkBitsLoopPure!0 (_1!11562 lt!387203) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!387205 () Unit!17993)

(declare-fun lt!387204 () Unit!17993)

(assert (=> b!248347 (= lt!387205 lt!387204)))

(assert (=> b!248347 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387202)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!387201)))

(assert (=> b!248347 (= lt!387204 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!387202)) lt!387201))))

(assert (=> b!248347 e!172039))

(declare-fun res!207870 () Bool)

(assert (=> b!248347 (=> (not res!207870) (not e!172039))))

(assert (=> b!248347 (= res!207870 (and (= (size!5936 (buf!6423 (_2!11560 lt!386591))) (size!5936 (buf!6423 (_2!11560 lt!387202)))) (bvsge lt!387201 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248347 (= lt!387201 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248347 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248347 (= lt!387203 (reader!0 (_2!11560 lt!386591) (_2!11560 lt!387202)))))

(assert (= (and d!83154 res!207867) b!248345))

(assert (= (and b!248345 res!207868) b!248346))

(assert (= (and b!248346 res!207869) b!248347))

(assert (= (and b!248347 res!207870) b!248348))

(declare-fun m!374367 () Bool)

(assert (=> b!248345 m!374367))

(assert (=> b!248345 m!373881))

(declare-fun m!374369 () Bool)

(assert (=> b!248347 m!374369))

(declare-fun m!374371 () Bool)

(assert (=> b!248347 m!374371))

(declare-fun m!374373 () Bool)

(assert (=> b!248347 m!374373))

(declare-fun m!374375 () Bool)

(assert (=> b!248347 m!374375))

(declare-fun m!374377 () Bool)

(assert (=> b!248348 m!374377))

(declare-fun m!374379 () Bool)

(assert (=> b!248346 m!374379))

(declare-fun m!374381 () Bool)

(assert (=> d!83154 m!374381))

(assert (=> b!248061 d!83154))

(declare-fun d!83156 () Bool)

(declare-fun lt!387208 () tuple2!21292)

(assert (=> d!83156 (= lt!387208 (readBit!0 lt!386599))))

(assert (=> d!83156 (= (readBitPure!0 lt!386599) (tuple2!21279 (_2!11568 lt!387208) (_1!11568 lt!387208)))))

(declare-fun bs!21080 () Bool)

(assert (= bs!21080 d!83156))

(declare-fun m!374383 () Bool)

(assert (=> bs!21080 m!374383))

(assert (=> b!248061 d!83156))

(assert (=> b!248061 d!83148))

(declare-fun d!83158 () Bool)

(assert (=> d!83158 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386598)))

(declare-fun lt!387209 () Unit!17993)

(assert (=> d!83158 (= lt!387209 (choose!9 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!386606)) lt!386598 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(assert (=> d!83158 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!386606)) lt!386598) lt!387209)))

(declare-fun bs!21081 () Bool)

(assert (= bs!21081 d!83158))

(assert (=> bs!21081 m!373861))

(declare-fun m!374385 () Bool)

(assert (=> bs!21081 m!374385))

(assert (=> b!248061 d!83158))

(declare-fun b!248359 () Bool)

(declare-fun res!207880 () Bool)

(declare-fun e!172045 () Bool)

(assert (=> b!248359 (=> (not res!207880) (not e!172045))))

(declare-fun lt!387219 () tuple2!21276)

(assert (=> b!248359 (= res!207880 (isPrefixOf!0 thiss!1005 (_2!11560 lt!387219)))))

(declare-fun b!248361 () Bool)

(declare-fun e!172046 () Bool)

(declare-fun lt!387218 () tuple2!21278)

(assert (=> b!248361 (= e!172046 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!387218))) (currentByte!11839 (_1!11561 lt!387218)) (currentBit!11834 (_1!11561 lt!387218))) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!387219))) (currentByte!11839 (_2!11560 lt!387219)) (currentBit!11834 (_2!11560 lt!387219)))))))

(declare-fun d!83160 () Bool)

(assert (=> d!83160 e!172045))

(declare-fun res!207881 () Bool)

(assert (=> d!83160 (=> (not res!207881) (not e!172045))))

(assert (=> d!83160 (= res!207881 (= (size!5936 (buf!6423 thiss!1005)) (size!5936 (buf!6423 (_2!11560 lt!387219)))))))

(declare-fun choose!16 (BitStream!10794 Bool) tuple2!21276)

(assert (=> d!83160 (= lt!387219 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!83160 (validate_offset_bit!0 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005)))))

(assert (=> d!83160 (= (appendBit!0 thiss!1005 bit!26) lt!387219)))

(declare-fun b!248358 () Bool)

(declare-fun res!207879 () Bool)

(assert (=> b!248358 (=> (not res!207879) (not e!172045))))

(declare-fun lt!387221 () (_ BitVec 64))

(declare-fun lt!387220 () (_ BitVec 64))

(assert (=> b!248358 (= res!207879 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!387219))) (currentByte!11839 (_2!11560 lt!387219)) (currentBit!11834 (_2!11560 lt!387219))) (bvadd lt!387221 lt!387220)))))

(assert (=> b!248358 (or (not (= (bvand lt!387221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387220 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387221 lt!387220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248358 (= lt!387220 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248358 (= lt!387221 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))

(declare-fun b!248360 () Bool)

(assert (=> b!248360 (= e!172045 e!172046)))

(declare-fun res!207882 () Bool)

(assert (=> b!248360 (=> (not res!207882) (not e!172046))))

(assert (=> b!248360 (= res!207882 (and (= (_2!11561 lt!387218) bit!26) (= (_1!11561 lt!387218) (_2!11560 lt!387219))))))

(assert (=> b!248360 (= lt!387218 (readBitPure!0 (readerFrom!0 (_2!11560 lt!387219) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))))

(assert (= (and d!83160 res!207881) b!248358))

(assert (= (and b!248358 res!207879) b!248359))

(assert (= (and b!248359 res!207880) b!248360))

(assert (= (and b!248360 res!207882) b!248361))

(declare-fun m!374387 () Bool)

(assert (=> b!248358 m!374387))

(assert (=> b!248358 m!373883))

(declare-fun m!374389 () Bool)

(assert (=> b!248360 m!374389))

(assert (=> b!248360 m!374389))

(declare-fun m!374391 () Bool)

(assert (=> b!248360 m!374391))

(declare-fun m!374393 () Bool)

(assert (=> d!83160 m!374393))

(declare-fun m!374395 () Bool)

(assert (=> d!83160 m!374395))

(declare-fun m!374397 () Bool)

(assert (=> b!248361 m!374397))

(assert (=> b!248361 m!374387))

(declare-fun m!374399 () Bool)

(assert (=> b!248359 m!374399))

(assert (=> b!248061 d!83160))

(declare-fun d!83162 () Bool)

(declare-fun e!172049 () Bool)

(assert (=> d!83162 e!172049))

(declare-fun res!207885 () Bool)

(assert (=> d!83162 (=> (not res!207885) (not e!172049))))

(declare-fun lt!387230 () tuple2!21278)

(declare-fun lt!387233 () tuple2!21278)

(assert (=> d!83162 (= res!207885 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!387230))) (currentByte!11839 (_1!11561 lt!387230)) (currentBit!11834 (_1!11561 lt!387230))) (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!387233))) (currentByte!11839 (_1!11561 lt!387233)) (currentBit!11834 (_1!11561 lt!387233)))))))

(declare-fun lt!387232 () Unit!17993)

(declare-fun lt!387231 () BitStream!10794)

(declare-fun choose!50 (BitStream!10794 BitStream!10794 BitStream!10794 tuple2!21278 tuple2!21278 BitStream!10794 Bool tuple2!21278 tuple2!21278 BitStream!10794 Bool) Unit!17993)

(assert (=> d!83162 (= lt!387232 (choose!50 lt!386599 (_2!11560 lt!386606) lt!387231 lt!387230 (tuple2!21279 (_1!11561 lt!387230) (_2!11561 lt!387230)) (_1!11561 lt!387230) (_2!11561 lt!387230) lt!387233 (tuple2!21279 (_1!11561 lt!387233) (_2!11561 lt!387233)) (_1!11561 lt!387233) (_2!11561 lt!387233)))))

(assert (=> d!83162 (= lt!387233 (readBitPure!0 lt!387231))))

(assert (=> d!83162 (= lt!387230 (readBitPure!0 lt!386599))))

(assert (=> d!83162 (= lt!387231 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 lt!386599) (currentBit!11834 lt!386599)))))

(assert (=> d!83162 (invariant!0 (currentBit!11834 lt!386599) (currentByte!11839 lt!386599) (size!5936 (buf!6423 (_2!11560 lt!386606))))))

(assert (=> d!83162 (= (readBitPrefixLemma!0 lt!386599 (_2!11560 lt!386606)) lt!387232)))

(declare-fun b!248364 () Bool)

(assert (=> b!248364 (= e!172049 (= (_2!11561 lt!387230) (_2!11561 lt!387233)))))

(assert (= (and d!83162 res!207885) b!248364))

(declare-fun m!374401 () Bool)

(assert (=> d!83162 m!374401))

(declare-fun m!374403 () Bool)

(assert (=> d!83162 m!374403))

(assert (=> d!83162 m!373865))

(declare-fun m!374405 () Bool)

(assert (=> d!83162 m!374405))

(declare-fun m!374407 () Bool)

(assert (=> d!83162 m!374407))

(declare-fun m!374409 () Bool)

(assert (=> d!83162 m!374409))

(assert (=> b!248061 d!83162))

(declare-fun d!83164 () Bool)

(assert (=> d!83164 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!387234 () Unit!17993)

(assert (=> d!83164 (= lt!387234 (choose!9 thiss!1005 (buf!6423 (_2!11560 lt!386606)) (bvsub nBits!297 from!289) (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(assert (=> d!83164 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6423 (_2!11560 lt!386606)) (bvsub nBits!297 from!289)) lt!387234)))

(declare-fun bs!21082 () Bool)

(assert (= bs!21082 d!83164))

(assert (=> bs!21082 m!373875))

(declare-fun m!374411 () Bool)

(assert (=> bs!21082 m!374411))

(assert (=> b!248061 d!83164))

(declare-fun d!83166 () Bool)

(declare-fun res!207886 () Bool)

(declare-fun e!172051 () Bool)

(assert (=> d!83166 (=> (not res!207886) (not e!172051))))

(assert (=> d!83166 (= res!207886 (= (size!5936 (buf!6423 thiss!1005)) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(assert (=> d!83166 (= (isPrefixOf!0 thiss!1005 (_2!11560 lt!386606)) e!172051)))

(declare-fun b!248365 () Bool)

(declare-fun res!207887 () Bool)

(assert (=> b!248365 (=> (not res!207887) (not e!172051))))

(assert (=> b!248365 (= res!207887 (bvsle (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606)))))))

(declare-fun b!248366 () Bool)

(declare-fun e!172050 () Bool)

(assert (=> b!248366 (= e!172051 e!172050)))

(declare-fun res!207888 () Bool)

(assert (=> b!248366 (=> res!207888 e!172050)))

(assert (=> b!248366 (= res!207888 (= (size!5936 (buf!6423 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248367 () Bool)

(assert (=> b!248367 (= e!172050 (arrayBitRangesEq!0 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!386606)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(assert (= (and d!83166 res!207886) b!248365))

(assert (= (and b!248365 res!207887) b!248366))

(assert (= (and b!248366 (not res!207888)) b!248367))

(assert (=> b!248365 m!373883))

(assert (=> b!248365 m!373889))

(assert (=> b!248367 m!373883))

(assert (=> b!248367 m!373883))

(declare-fun m!374413 () Bool)

(assert (=> b!248367 m!374413))

(assert (=> b!248061 d!83166))

(declare-fun d!83168 () Bool)

(declare-fun lt!387235 () tuple2!21292)

(assert (=> d!83168 (= lt!387235 (readBit!0 (_1!11562 lt!386601)))))

(assert (=> d!83168 (= (readBitPure!0 (_1!11562 lt!386601)) (tuple2!21279 (_2!11568 lt!387235) (_1!11568 lt!387235)))))

(declare-fun bs!21083 () Bool)

(assert (= bs!21083 d!83168))

(declare-fun m!374415 () Bool)

(assert (=> bs!21083 m!374415))

(assert (=> b!248061 d!83168))

(declare-fun d!83170 () Bool)

(assert (=> d!83170 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386598) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))) lt!386598))))

(declare-fun bs!21084 () Bool)

(assert (= bs!21084 d!83170))

(assert (=> bs!21084 m!374327))

(assert (=> b!248061 d!83170))

(declare-fun d!83172 () Bool)

(assert (=> d!83172 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386598) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))) lt!386598))))

(declare-fun bs!21085 () Bool)

(assert (= bs!21085 d!83172))

(assert (=> bs!21085 m!374331))

(assert (=> b!248061 d!83172))

(declare-fun d!83174 () Bool)

(assert (=> d!83174 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21086 () Bool)

(assert (= bs!21086 d!83174))

(declare-fun m!374417 () Bool)

(assert (=> bs!21086 m!374417))

(assert (=> b!248061 d!83174))

(declare-fun lt!387236 () tuple2!21292)

(declare-fun d!83176 () Bool)

(assert (=> d!83176 (= lt!387236 (checkBitsLoop!0 (_1!11562 lt!386588) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83176 (= (checkBitsLoopPure!0 (_1!11562 lt!386588) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21279 (_2!11568 lt!387236) (_1!11568 lt!387236)))))

(declare-fun bs!21087 () Bool)

(assert (= bs!21087 d!83176))

(declare-fun m!374419 () Bool)

(assert (=> bs!21087 m!374419))

(assert (=> b!248061 d!83176))

(declare-fun d!83178 () Bool)

(assert (=> d!83178 (isPrefixOf!0 thiss!1005 (_2!11560 lt!386606))))

(declare-fun lt!387239 () Unit!17993)

(declare-fun choose!30 (BitStream!10794 BitStream!10794 BitStream!10794) Unit!17993)

(assert (=> d!83178 (= lt!387239 (choose!30 thiss!1005 (_2!11560 lt!386591) (_2!11560 lt!386606)))))

(assert (=> d!83178 (isPrefixOf!0 thiss!1005 (_2!11560 lt!386591))))

(assert (=> d!83178 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11560 lt!386591) (_2!11560 lt!386606)) lt!387239)))

(declare-fun bs!21088 () Bool)

(assert (= bs!21088 d!83178))

(assert (=> bs!21088 m!373851))

(declare-fun m!374421 () Bool)

(assert (=> bs!21088 m!374421))

(assert (=> bs!21088 m!373897))

(assert (=> b!248061 d!83178))

(declare-fun d!83180 () Bool)

(declare-fun lt!387240 () tuple2!21292)

(assert (=> d!83180 (= lt!387240 (checkBitsLoop!0 (_1!11562 lt!386601) nBits!297 bit!26 from!289))))

(assert (=> d!83180 (= (checkBitsLoopPure!0 (_1!11562 lt!386601) nBits!297 bit!26 from!289) (tuple2!21279 (_2!11568 lt!387240) (_1!11568 lt!387240)))))

(declare-fun bs!21089 () Bool)

(assert (= bs!21089 d!83180))

(declare-fun m!374423 () Bool)

(assert (=> bs!21089 m!374423))

(assert (=> b!248061 d!83180))

(declare-fun d!83182 () Bool)

(declare-fun e!172054 () Bool)

(assert (=> d!83182 e!172054))

(declare-fun res!207891 () Bool)

(assert (=> d!83182 (=> (not res!207891) (not e!172054))))

(assert (=> d!83182 (= res!207891 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!387243 () Unit!17993)

(declare-fun choose!27 (BitStream!10794 BitStream!10794 (_ BitVec 64) (_ BitVec 64)) Unit!17993)

(assert (=> d!83182 (= lt!387243 (choose!27 thiss!1005 (_2!11560 lt!386591) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83182 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!83182 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11560 lt!386591) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!387243)))

(declare-fun b!248370 () Bool)

(assert (=> b!248370 (= e!172054 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!83182 res!207891) b!248370))

(declare-fun m!374425 () Bool)

(assert (=> d!83182 m!374425))

(declare-fun m!374427 () Bool)

(assert (=> b!248370 m!374427))

(assert (=> b!248061 d!83182))

(declare-fun d!83184 () Bool)

(declare-fun e!172055 () Bool)

(assert (=> d!83184 e!172055))

(declare-fun res!207893 () Bool)

(assert (=> d!83184 (=> (not res!207893) (not e!172055))))

(declare-fun lt!387249 () (_ BitVec 64))

(declare-fun lt!387244 () (_ BitVec 64))

(declare-fun lt!387246 () (_ BitVec 64))

(assert (=> d!83184 (= res!207893 (= lt!387246 (bvsub lt!387244 lt!387249)))))

(assert (=> d!83184 (or (= (bvand lt!387244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387244 lt!387249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83184 (= lt!387249 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386604)))) ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386604))) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386604)))))))

(declare-fun lt!387248 () (_ BitVec 64))

(declare-fun lt!387247 () (_ BitVec 64))

(assert (=> d!83184 (= lt!387244 (bvmul lt!387248 lt!387247))))

(assert (=> d!83184 (or (= lt!387248 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387247 (bvsdiv (bvmul lt!387248 lt!387247) lt!387248)))))

(assert (=> d!83184 (= lt!387247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83184 (= lt!387248 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386604)))))))

(assert (=> d!83184 (= lt!387246 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386604))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386604)))))))

(assert (=> d!83184 (invariant!0 (currentBit!11834 (_1!11561 lt!386604)) (currentByte!11839 (_1!11561 lt!386604)) (size!5936 (buf!6423 (_1!11561 lt!386604))))))

(assert (=> d!83184 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!386604))) (currentByte!11839 (_1!11561 lt!386604)) (currentBit!11834 (_1!11561 lt!386604))) lt!387246)))

(declare-fun b!248371 () Bool)

(declare-fun res!207892 () Bool)

(assert (=> b!248371 (=> (not res!207892) (not e!172055))))

(assert (=> b!248371 (= res!207892 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387246))))

(declare-fun b!248372 () Bool)

(declare-fun lt!387245 () (_ BitVec 64))

(assert (=> b!248372 (= e!172055 (bvsle lt!387246 (bvmul lt!387245 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248372 (or (= lt!387245 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387245 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387245)))))

(assert (=> b!248372 (= lt!387245 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386604)))))))

(assert (= (and d!83184 res!207893) b!248371))

(assert (= (and b!248371 res!207892) b!248372))

(declare-fun m!374429 () Bool)

(assert (=> d!83184 m!374429))

(declare-fun m!374431 () Bool)

(assert (=> d!83184 m!374431))

(assert (=> b!248061 d!83184))

(declare-fun d!83186 () Bool)

(declare-fun lt!387250 () tuple2!21292)

(assert (=> d!83186 (= lt!387250 (readBit!0 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(assert (=> d!83186 (= (readBitPure!0 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))) (tuple2!21279 (_2!11568 lt!387250) (_1!11568 lt!387250)))))

(declare-fun bs!21090 () Bool)

(assert (= bs!21090 d!83186))

(declare-fun m!374433 () Bool)

(assert (=> bs!21090 m!374433))

(assert (=> b!248061 d!83186))

(declare-fun d!83188 () Bool)

(declare-fun e!172056 () Bool)

(assert (=> d!83188 e!172056))

(declare-fun res!207895 () Bool)

(assert (=> d!83188 (=> (not res!207895) (not e!172056))))

(declare-fun lt!387253 () (_ BitVec 64))

(declare-fun lt!387256 () (_ BitVec 64))

(declare-fun lt!387251 () (_ BitVec 64))

(assert (=> d!83188 (= res!207895 (= lt!387253 (bvsub lt!387251 lt!387256)))))

(assert (=> d!83188 (or (= (bvand lt!387251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387251 lt!387256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83188 (= lt!387256 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386600)))) ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386600))) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386600)))))))

(declare-fun lt!387255 () (_ BitVec 64))

(declare-fun lt!387254 () (_ BitVec 64))

(assert (=> d!83188 (= lt!387251 (bvmul lt!387255 lt!387254))))

(assert (=> d!83188 (or (= lt!387255 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387254 (bvsdiv (bvmul lt!387255 lt!387254) lt!387255)))))

(assert (=> d!83188 (= lt!387254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83188 (= lt!387255 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386600)))))))

(assert (=> d!83188 (= lt!387253 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386600))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386600)))))))

(assert (=> d!83188 (invariant!0 (currentBit!11834 (_1!11561 lt!386600)) (currentByte!11839 (_1!11561 lt!386600)) (size!5936 (buf!6423 (_1!11561 lt!386600))))))

(assert (=> d!83188 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!386600))) (currentByte!11839 (_1!11561 lt!386600)) (currentBit!11834 (_1!11561 lt!386600))) lt!387253)))

(declare-fun b!248373 () Bool)

(declare-fun res!207894 () Bool)

(assert (=> b!248373 (=> (not res!207894) (not e!172056))))

(assert (=> b!248373 (= res!207894 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387253))))

(declare-fun b!248374 () Bool)

(declare-fun lt!387252 () (_ BitVec 64))

(assert (=> b!248374 (= e!172056 (bvsle lt!387253 (bvmul lt!387252 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248374 (or (= lt!387252 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387252 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387252)))))

(assert (=> b!248374 (= lt!387252 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386600)))))))

(assert (= (and d!83188 res!207895) b!248373))

(assert (= (and b!248373 res!207894) b!248374))

(declare-fun m!374435 () Bool)

(assert (=> d!83188 m!374435))

(declare-fun m!374437 () Bool)

(assert (=> d!83188 m!374437))

(assert (=> b!248061 d!83188))

(declare-fun b!248375 () Bool)

(declare-fun lt!387260 () (_ BitVec 64))

(declare-fun lt!387258 () tuple2!21280)

(declare-fun e!172058 () Bool)

(declare-fun lt!387275 () (_ BitVec 64))

(assert (=> b!248375 (= e!172058 (= (_1!11562 lt!387258) (withMovedBitIndex!0 (_2!11562 lt!387258) (bvsub lt!387275 lt!387260))))))

(assert (=> b!248375 (or (= (bvand lt!387275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387275 lt!387260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248375 (= lt!387260 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606))))))

(assert (=> b!248375 (= lt!387275 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))

(declare-fun b!248377 () Bool)

(declare-fun e!172057 () Unit!17993)

(declare-fun Unit!18002 () Unit!17993)

(assert (=> b!248377 (= e!172057 Unit!18002)))

(declare-fun b!248378 () Bool)

(declare-fun res!207897 () Bool)

(assert (=> b!248378 (=> (not res!207897) (not e!172058))))

(assert (=> b!248378 (= res!207897 (isPrefixOf!0 (_2!11562 lt!387258) (_2!11560 lt!386606)))))

(declare-fun b!248379 () Bool)

(declare-fun res!207896 () Bool)

(assert (=> b!248379 (=> (not res!207896) (not e!172058))))

(assert (=> b!248379 (= res!207896 (isPrefixOf!0 (_1!11562 lt!387258) thiss!1005))))

(declare-fun b!248376 () Bool)

(declare-fun lt!387274 () Unit!17993)

(assert (=> b!248376 (= e!172057 lt!387274)))

(declare-fun lt!387276 () (_ BitVec 64))

(assert (=> b!248376 (= lt!387276 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!387257 () (_ BitVec 64))

(assert (=> b!248376 (= lt!387257 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))

(assert (=> b!248376 (= lt!387274 (arrayBitRangesEqSymmetric!0 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!386606)) lt!387276 lt!387257))))

(assert (=> b!248376 (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386606)) (buf!6423 thiss!1005) lt!387276 lt!387257)))

(declare-fun d!83190 () Bool)

(assert (=> d!83190 e!172058))

(declare-fun res!207898 () Bool)

(assert (=> d!83190 (=> (not res!207898) (not e!172058))))

(assert (=> d!83190 (= res!207898 (isPrefixOf!0 (_1!11562 lt!387258) (_2!11562 lt!387258)))))

(declare-fun lt!387263 () BitStream!10794)

(assert (=> d!83190 (= lt!387258 (tuple2!21281 lt!387263 (_2!11560 lt!386606)))))

(declare-fun lt!387270 () Unit!17993)

(declare-fun lt!387262 () Unit!17993)

(assert (=> d!83190 (= lt!387270 lt!387262)))

(assert (=> d!83190 (isPrefixOf!0 lt!387263 (_2!11560 lt!386606))))

(assert (=> d!83190 (= lt!387262 (lemmaIsPrefixTransitive!0 lt!387263 (_2!11560 lt!386606) (_2!11560 lt!386606)))))

(declare-fun lt!387267 () Unit!17993)

(declare-fun lt!387268 () Unit!17993)

(assert (=> d!83190 (= lt!387267 lt!387268)))

(assert (=> d!83190 (isPrefixOf!0 lt!387263 (_2!11560 lt!386606))))

(assert (=> d!83190 (= lt!387268 (lemmaIsPrefixTransitive!0 lt!387263 thiss!1005 (_2!11560 lt!386606)))))

(declare-fun lt!387261 () Unit!17993)

(assert (=> d!83190 (= lt!387261 e!172057)))

(declare-fun c!11533 () Bool)

(assert (=> d!83190 (= c!11533 (not (= (size!5936 (buf!6423 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!387273 () Unit!17993)

(declare-fun lt!387265 () Unit!17993)

(assert (=> d!83190 (= lt!387273 lt!387265)))

(assert (=> d!83190 (isPrefixOf!0 (_2!11560 lt!386606) (_2!11560 lt!386606))))

(assert (=> d!83190 (= lt!387265 (lemmaIsPrefixRefl!0 (_2!11560 lt!386606)))))

(declare-fun lt!387266 () Unit!17993)

(declare-fun lt!387259 () Unit!17993)

(assert (=> d!83190 (= lt!387266 lt!387259)))

(assert (=> d!83190 (= lt!387259 (lemmaIsPrefixRefl!0 (_2!11560 lt!386606)))))

(declare-fun lt!387271 () Unit!17993)

(declare-fun lt!387264 () Unit!17993)

(assert (=> d!83190 (= lt!387271 lt!387264)))

(assert (=> d!83190 (isPrefixOf!0 lt!387263 lt!387263)))

(assert (=> d!83190 (= lt!387264 (lemmaIsPrefixRefl!0 lt!387263))))

(declare-fun lt!387269 () Unit!17993)

(declare-fun lt!387272 () Unit!17993)

(assert (=> d!83190 (= lt!387269 lt!387272)))

(assert (=> d!83190 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!83190 (= lt!387272 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!83190 (= lt!387263 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))

(assert (=> d!83190 (isPrefixOf!0 thiss!1005 (_2!11560 lt!386606))))

(assert (=> d!83190 (= (reader!0 thiss!1005 (_2!11560 lt!386606)) lt!387258)))

(assert (= (and d!83190 c!11533) b!248376))

(assert (= (and d!83190 (not c!11533)) b!248377))

(assert (= (and d!83190 res!207898) b!248379))

(assert (= (and b!248379 res!207896) b!248378))

(assert (= (and b!248378 res!207897) b!248375))

(declare-fun m!374439 () Bool)

(assert (=> b!248379 m!374439))

(declare-fun m!374441 () Bool)

(assert (=> d!83190 m!374441))

(declare-fun m!374443 () Bool)

(assert (=> d!83190 m!374443))

(declare-fun m!374445 () Bool)

(assert (=> d!83190 m!374445))

(declare-fun m!374447 () Bool)

(assert (=> d!83190 m!374447))

(declare-fun m!374449 () Bool)

(assert (=> d!83190 m!374449))

(assert (=> d!83190 m!373851))

(declare-fun m!374451 () Bool)

(assert (=> d!83190 m!374451))

(assert (=> d!83190 m!374349))

(declare-fun m!374453 () Bool)

(assert (=> d!83190 m!374453))

(assert (=> d!83190 m!374353))

(declare-fun m!374455 () Bool)

(assert (=> d!83190 m!374455))

(declare-fun m!374457 () Bool)

(assert (=> b!248375 m!374457))

(assert (=> b!248375 m!373889))

(assert (=> b!248375 m!373883))

(declare-fun m!374459 () Bool)

(assert (=> b!248378 m!374459))

(assert (=> b!248376 m!373883))

(declare-fun m!374461 () Bool)

(assert (=> b!248376 m!374461))

(declare-fun m!374463 () Bool)

(assert (=> b!248376 m!374463))

(assert (=> b!248061 d!83190))

(declare-fun d!83192 () Bool)

(assert (=> d!83192 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21091 () Bool)

(assert (= bs!21091 d!83192))

(declare-fun m!374465 () Bool)

(assert (=> bs!21091 m!374465))

(assert (=> b!248072 d!83192))

(declare-fun d!83194 () Bool)

(assert (=> d!83194 (= (array_inv!5677 (buf!6423 thiss!1005)) (bvsge (size!5936 (buf!6423 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!248066 d!83194))

(declare-fun d!83196 () Bool)

(declare-fun res!207899 () Bool)

(declare-fun e!172060 () Bool)

(assert (=> d!83196 (=> (not res!207899) (not e!172060))))

(assert (=> d!83196 (= res!207899 (= (size!5936 (buf!6423 (_2!11560 lt!386591))) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(assert (=> d!83196 (= (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!386606)) e!172060)))

(declare-fun b!248380 () Bool)

(declare-fun res!207900 () Bool)

(assert (=> b!248380 (=> (not res!207900) (not e!172060))))

(assert (=> b!248380 (= res!207900 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606)))))))

(declare-fun b!248381 () Bool)

(declare-fun e!172059 () Bool)

(assert (=> b!248381 (= e!172060 e!172059)))

(declare-fun res!207901 () Bool)

(assert (=> b!248381 (=> res!207901 e!172059)))

(assert (=> b!248381 (= res!207901 (= (size!5936 (buf!6423 (_2!11560 lt!386591))) #b00000000000000000000000000000000))))

(declare-fun b!248382 () Bool)

(assert (=> b!248382 (= e!172059 (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386591)) (buf!6423 (_2!11560 lt!386606)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(assert (= (and d!83196 res!207899) b!248380))

(assert (= (and b!248380 res!207900) b!248381))

(assert (= (and b!248381 (not res!207901)) b!248382))

(assert (=> b!248380 m!373881))

(assert (=> b!248380 m!373889))

(assert (=> b!248382 m!373881))

(assert (=> b!248382 m!373881))

(declare-fun m!374467 () Bool)

(assert (=> b!248382 m!374467))

(assert (=> b!248075 d!83196))

(assert (=> b!248064 d!83138))

(declare-fun d!83198 () Bool)

(declare-fun e!172061 () Bool)

(assert (=> d!83198 e!172061))

(declare-fun res!207903 () Bool)

(assert (=> d!83198 (=> (not res!207903) (not e!172061))))

(declare-fun lt!387282 () (_ BitVec 64))

(declare-fun lt!387279 () (_ BitVec 64))

(declare-fun lt!387277 () (_ BitVec 64))

(assert (=> d!83198 (= res!207903 (= lt!387279 (bvsub lt!387277 lt!387282)))))

(assert (=> d!83198 (or (= (bvand lt!387277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387277 lt!387282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83198 (= lt!387282 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005))))))

(declare-fun lt!387281 () (_ BitVec 64))

(declare-fun lt!387280 () (_ BitVec 64))

(assert (=> d!83198 (= lt!387277 (bvmul lt!387281 lt!387280))))

(assert (=> d!83198 (or (= lt!387281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387280 (bvsdiv (bvmul lt!387281 lt!387280) lt!387281)))))

(assert (=> d!83198 (= lt!387280 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83198 (= lt!387281 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))))))

(assert (=> d!83198 (= lt!387279 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 thiss!1005))))))

(assert (=> d!83198 (invariant!0 (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005) (size!5936 (buf!6423 thiss!1005)))))

(assert (=> d!83198 (= (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)) lt!387279)))

(declare-fun b!248383 () Bool)

(declare-fun res!207902 () Bool)

(assert (=> b!248383 (=> (not res!207902) (not e!172061))))

(assert (=> b!248383 (= res!207902 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387279))))

(declare-fun b!248384 () Bool)

(declare-fun lt!387278 () (_ BitVec 64))

(assert (=> b!248384 (= e!172061 (bvsle lt!387279 (bvmul lt!387278 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248384 (or (= lt!387278 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387278 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387278)))))

(assert (=> b!248384 (= lt!387278 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))))))

(assert (= (and d!83198 res!207903) b!248383))

(assert (= (and b!248383 res!207902) b!248384))

(assert (=> d!83198 m!374465))

(assert (=> d!83198 m!374365))

(assert (=> b!248064 d!83198))

(check-sat (not b!248332) (not d!83174) (not b!248335) (not d!83148) (not b!248346) (not d!83186) (not b!248382) (not d!83178) (not b!248312) (not d!83144) (not b!248333) (not d!83198) (not b!248358) (not b!248365) (not b!248361) (not d!83138) (not d!83170) (not b!248348) (not d!83156) (not b!248345) (not d!83130) (not d!83188) (not b!248360) (not b!248376) (not d!83128) (not d!83160) (not b!248379) (not d!83164) (not d!83158) (not b!248347) (not b!248375) (not d!83136) (not d!83154) (not d!83182) (not b!248370) (not d!83172) (not b!248367) (not b!248299) (not b!248378) (not d!83162) (not b!248314) (not d!83192) (not d!83150) (not b!248380) (not d!83176) (not d!83134) (not b!248359) (not d!83126) (not d!83184) (not d!83142) (not b!248336) (not d!83190) (not d!83168) (not d!83180) (not d!83146))
(check-sat)
(get-model)

(declare-fun b!248399 () Bool)

(declare-fun e!172076 () Bool)

(declare-fun e!172075 () Bool)

(assert (=> b!248399 (= e!172076 e!172075)))

(declare-fun res!207918 () Bool)

(declare-fun call!3939 () Bool)

(assert (=> b!248399 (= res!207918 call!3939)))

(assert (=> b!248399 (=> (not res!207918) (not e!172075))))

(declare-fun d!83200 () Bool)

(declare-fun res!207916 () Bool)

(declare-fun e!172078 () Bool)

(assert (=> d!83200 (=> res!207916 e!172078)))

(assert (=> d!83200 (= res!207916 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(assert (=> d!83200 (= (arrayBitRangesEq!0 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!386606)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))) e!172078)))

(declare-fun b!248400 () Bool)

(declare-fun e!172074 () Bool)

(assert (=> b!248400 (= e!172074 e!172076)))

(declare-fun c!11536 () Bool)

(declare-datatypes ((tuple4!284 0))(
  ( (tuple4!285 (_1!11569 (_ BitVec 32)) (_2!11569 (_ BitVec 32)) (_3!922 (_ BitVec 32)) (_4!142 (_ BitVec 32))) )
))
(declare-fun lt!387290 () tuple4!284)

(assert (=> b!248400 (= c!11536 (= (_3!922 lt!387290) (_4!142 lt!387290)))))

(declare-fun b!248401 () Bool)

(declare-fun e!172079 () Bool)

(declare-fun lt!387291 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248401 (= e!172079 (byteRangesEq!0 (select (arr!6923 (buf!6423 thiss!1005)) (_4!142 lt!387290)) (select (arr!6923 (buf!6423 (_2!11560 lt!386606))) (_4!142 lt!387290)) #b00000000000000000000000000000000 lt!387291))))

(declare-fun e!172077 () Bool)

(declare-fun b!248402 () Bool)

(declare-fun arrayRangesEq!919 (array!13539 array!13539 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248402 (= e!172077 (arrayRangesEq!919 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!386606)) (_1!11569 lt!387290) (_2!11569 lt!387290)))))

(declare-fun b!248403 () Bool)

(assert (=> b!248403 (= e!172076 call!3939)))

(declare-fun b!248404 () Bool)

(assert (=> b!248404 (= e!172078 e!172074)))

(declare-fun res!207914 () Bool)

(assert (=> b!248404 (=> (not res!207914) (not e!172074))))

(assert (=> b!248404 (= res!207914 e!172077)))

(declare-fun res!207915 () Bool)

(assert (=> b!248404 (=> res!207915 e!172077)))

(assert (=> b!248404 (= res!207915 (bvsge (_1!11569 lt!387290) (_2!11569 lt!387290)))))

(assert (=> b!248404 (= lt!387291 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387289 () (_ BitVec 32))

(assert (=> b!248404 (= lt!387289 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!284)

(assert (=> b!248404 (= lt!387290 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(declare-fun bm!3936 () Bool)

(assert (=> bm!3936 (= call!3939 (byteRangesEq!0 (select (arr!6923 (buf!6423 thiss!1005)) (_3!922 lt!387290)) (select (arr!6923 (buf!6423 (_2!11560 lt!386606))) (_3!922 lt!387290)) lt!387289 (ite c!11536 lt!387291 #b00000000000000000000000000001000)))))

(declare-fun b!248405 () Bool)

(declare-fun res!207917 () Bool)

(assert (=> b!248405 (= res!207917 (= lt!387291 #b00000000000000000000000000000000))))

(assert (=> b!248405 (=> res!207917 e!172079)))

(assert (=> b!248405 (= e!172075 e!172079)))

(assert (= (and d!83200 (not res!207916)) b!248404))

(assert (= (and b!248404 (not res!207915)) b!248402))

(assert (= (and b!248404 res!207914) b!248400))

(assert (= (and b!248400 c!11536) b!248403))

(assert (= (and b!248400 (not c!11536)) b!248399))

(assert (= (and b!248399 res!207918) b!248405))

(assert (= (and b!248405 (not res!207917)) b!248401))

(assert (= (or b!248403 b!248399) bm!3936))

(declare-fun m!374469 () Bool)

(assert (=> b!248401 m!374469))

(declare-fun m!374471 () Bool)

(assert (=> b!248401 m!374471))

(assert (=> b!248401 m!374469))

(assert (=> b!248401 m!374471))

(declare-fun m!374473 () Bool)

(assert (=> b!248401 m!374473))

(declare-fun m!374475 () Bool)

(assert (=> b!248402 m!374475))

(assert (=> b!248404 m!373883))

(declare-fun m!374477 () Bool)

(assert (=> b!248404 m!374477))

(declare-fun m!374479 () Bool)

(assert (=> bm!3936 m!374479))

(declare-fun m!374481 () Bool)

(assert (=> bm!3936 m!374481))

(assert (=> bm!3936 m!374479))

(assert (=> bm!3936 m!374481))

(declare-fun m!374483 () Bool)

(assert (=> bm!3936 m!374483))

(assert (=> b!248367 d!83200))

(assert (=> b!248367 d!83198))

(assert (=> b!248299 d!83140))

(declare-fun d!83202 () Bool)

(declare-fun e!172086 () Bool)

(assert (=> d!83202 e!172086))

(declare-fun res!207921 () Bool)

(assert (=> d!83202 (=> (not res!207921) (not e!172086))))

(declare-fun increaseBitIndex!0 (BitStream!10794) tuple2!21276)

(assert (=> d!83202 (= res!207921 (= (buf!6423 (_2!11560 (increaseBitIndex!0 (_1!11562 lt!386601)))) (buf!6423 (_1!11562 lt!386601))))))

(declare-fun lt!387307 () Bool)

(assert (=> d!83202 (= lt!387307 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (_1!11562 lt!386601))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387311 () tuple2!21292)

(assert (=> d!83202 (= lt!387311 (tuple2!21293 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (_1!11562 lt!386601))))) #b00000000000000000000000000000000)) (_2!11560 (increaseBitIndex!0 (_1!11562 lt!386601)))))))

(assert (=> d!83202 (validate_offset_bit!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11562 lt!386601)))) ((_ sign_extend 32) (currentByte!11839 (_1!11562 lt!386601))) ((_ sign_extend 32) (currentBit!11834 (_1!11562 lt!386601))))))

(assert (=> d!83202 (= (readBit!0 (_1!11562 lt!386601)) lt!387311)))

(declare-fun lt!387308 () (_ BitVec 64))

(declare-fun b!248408 () Bool)

(declare-fun lt!387306 () (_ BitVec 64))

(assert (=> b!248408 (= e!172086 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 (increaseBitIndex!0 (_1!11562 lt!386601))))) (currentByte!11839 (_2!11560 (increaseBitIndex!0 (_1!11562 lt!386601)))) (currentBit!11834 (_2!11560 (increaseBitIndex!0 (_1!11562 lt!386601))))) (bvadd lt!387308 lt!387306)))))

(assert (=> b!248408 (or (not (= (bvand lt!387308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387306 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387308 lt!387306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248408 (= lt!387306 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248408 (= lt!387308 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)) (currentBit!11834 (_1!11562 lt!386601))))))

(declare-fun lt!387312 () Bool)

(assert (=> b!248408 (= lt!387312 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (_1!11562 lt!386601))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387310 () Bool)

(assert (=> b!248408 (= lt!387310 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (_1!11562 lt!386601))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387309 () Bool)

(assert (=> b!248408 (= lt!387309 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (_1!11562 lt!386601))))) #b00000000000000000000000000000000)))))

(assert (= (and d!83202 res!207921) b!248408))

(declare-fun m!374485 () Bool)

(assert (=> d!83202 m!374485))

(declare-fun m!374487 () Bool)

(assert (=> d!83202 m!374487))

(declare-fun m!374489 () Bool)

(assert (=> d!83202 m!374489))

(declare-fun m!374491 () Bool)

(assert (=> d!83202 m!374491))

(assert (=> b!248408 m!374317))

(assert (=> b!248408 m!374489))

(declare-fun m!374493 () Bool)

(assert (=> b!248408 m!374493))

(assert (=> b!248408 m!374485))

(assert (=> b!248408 m!374487))

(assert (=> d!83168 d!83202))

(declare-fun d!83204 () Bool)

(declare-fun e!172099 () Bool)

(assert (=> d!83204 e!172099))

(declare-fun res!207933 () Bool)

(assert (=> d!83204 (=> (not res!207933) (not e!172099))))

(declare-fun lt!387342 () (_ BitVec 64))

(declare-fun lt!387339 () tuple2!21292)

(assert (=> d!83204 (= res!207933 (bvsge (bvsub lt!387342 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5936 (buf!6423 (_2!11568 lt!387339))) (currentByte!11839 (_2!11568 lt!387339)) (currentBit!11834 (_2!11568 lt!387339)))))))

(assert (=> d!83204 (or (= (bvand lt!387342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387342 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387338 () (_ BitVec 64))

(assert (=> d!83204 (= lt!387342 (bvadd lt!387338 nBits!297))))

(assert (=> d!83204 (or (not (= (bvand lt!387338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387338 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83204 (= lt!387338 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386602))) (currentByte!11839 (_1!11562 lt!386602)) (currentBit!11834 (_1!11562 lt!386602))))))

(declare-fun e!172097 () tuple2!21292)

(assert (=> d!83204 (= lt!387339 e!172097)))

(declare-fun c!11541 () Bool)

(assert (=> d!83204 (= c!11541 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!83204 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83204 (= (checkBitsLoop!0 (_1!11562 lt!386602) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!387339)))

(declare-fun b!248427 () Bool)

(declare-fun res!207932 () Bool)

(assert (=> b!248427 (=> (not res!207932) (not e!172099))))

(assert (=> b!248427 (= res!207932 (and (= (buf!6423 (_1!11562 lt!386602)) (buf!6423 (_2!11568 lt!387339))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11568 lt!387339))))))

(declare-fun b!248428 () Bool)

(declare-fun e!172100 () tuple2!21292)

(assert (=> b!248428 (= e!172097 e!172100)))

(declare-fun lt!387343 () tuple2!21292)

(assert (=> b!248428 (= lt!387343 (readBit!0 (_1!11562 lt!386602)))))

(declare-fun c!11542 () Bool)

(assert (=> b!248428 (= c!11542 (not (= (_1!11568 lt!387343) bit!26)))))

(declare-fun lt!387335 () (_ BitVec 64))

(declare-fun b!248429 () Bool)

(declare-fun e!172098 () Bool)

(assert (=> b!248429 (= e!172098 (= (bvsub lt!387335 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5936 (buf!6423 (_2!11568 lt!387339))) (currentByte!11839 (_2!11568 lt!387339)) (currentBit!11834 (_2!11568 lt!387339)))))))

(assert (=> b!248429 (or (= (bvand lt!387335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387335 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387337 () (_ BitVec 64))

(assert (=> b!248429 (= lt!387335 (bvadd lt!387337 nBits!297))))

(assert (=> b!248429 (or (not (= (bvand lt!387337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387337 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248429 (= lt!387337 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386602))) (currentByte!11839 (_1!11562 lt!386602)) (currentBit!11834 (_1!11562 lt!386602))))))

(declare-fun b!248430 () Bool)

(assert (=> b!248430 (= e!172100 (tuple2!21293 false (_2!11568 lt!387343)))))

(declare-fun b!248431 () Bool)

(declare-fun res!207936 () Bool)

(assert (=> b!248431 (=> (not res!207936) (not e!172099))))

(assert (=> b!248431 (= res!207936 e!172098)))

(declare-fun res!207934 () Bool)

(assert (=> b!248431 (=> res!207934 e!172098)))

(assert (=> b!248431 (= res!207934 (not (_1!11568 lt!387339)))))

(declare-fun b!248432 () Bool)

(declare-fun e!172101 () Bool)

(assert (=> b!248432 (= e!172099 e!172101)))

(declare-fun res!207935 () Bool)

(assert (=> b!248432 (=> res!207935 e!172101)))

(assert (=> b!248432 (= res!207935 (or (not (_1!11568 lt!387339)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun b!248433 () Bool)

(declare-fun lt!387336 () tuple2!21292)

(assert (=> b!248433 (= lt!387336 (checkBitsLoop!0 (_2!11568 lt!387343) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!387344 () Unit!17993)

(declare-fun lt!387340 () Unit!17993)

(assert (=> b!248433 (= lt!387344 lt!387340)))

(declare-fun lt!387345 () (_ BitVec 64))

(declare-fun lt!387341 () (_ BitVec 64))

(assert (=> b!248433 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11568 lt!387343)))) ((_ sign_extend 32) (currentByte!11839 (_2!11568 lt!387343))) ((_ sign_extend 32) (currentBit!11834 (_2!11568 lt!387343))) (bvsub lt!387345 lt!387341))))

(assert (=> b!248433 (= lt!387340 (validateOffsetBitsIneqLemma!0 (_1!11562 lt!386602) (_2!11568 lt!387343) lt!387345 lt!387341))))

(assert (=> b!248433 (= lt!387341 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248433 (= lt!387345 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248433 (= e!172100 (tuple2!21293 (_1!11568 lt!387336) (_2!11568 lt!387336)))))

(declare-fun b!248434 () Bool)

(assert (=> b!248434 (= e!172101 (= bit!26 (_2!11561 (readBitPure!0 (_1!11562 lt!386602)))))))

(declare-fun b!248435 () Bool)

(assert (=> b!248435 (= e!172097 (tuple2!21293 true (_1!11562 lt!386602)))))

(assert (= (and d!83204 c!11541) b!248435))

(assert (= (and d!83204 (not c!11541)) b!248428))

(assert (= (and b!248428 c!11542) b!248430))

(assert (= (and b!248428 (not c!11542)) b!248433))

(assert (= (and d!83204 res!207933) b!248427))

(assert (= (and b!248427 res!207932) b!248431))

(assert (= (and b!248431 (not res!207934)) b!248429))

(assert (= (and b!248431 res!207936) b!248432))

(assert (= (and b!248432 (not res!207935)) b!248434))

(declare-fun m!374495 () Bool)

(assert (=> b!248433 m!374495))

(declare-fun m!374497 () Bool)

(assert (=> b!248433 m!374497))

(declare-fun m!374499 () Bool)

(assert (=> b!248433 m!374499))

(declare-fun m!374501 () Bool)

(assert (=> d!83204 m!374501))

(declare-fun m!374503 () Bool)

(assert (=> d!83204 m!374503))

(assert (=> b!248429 m!374501))

(assert (=> b!248429 m!374503))

(declare-fun m!374505 () Bool)

(assert (=> b!248428 m!374505))

(declare-fun m!374507 () Bool)

(assert (=> b!248434 m!374507))

(assert (=> d!83142 d!83204))

(declare-fun d!83206 () Bool)

(declare-fun res!207937 () Bool)

(declare-fun e!172103 () Bool)

(assert (=> d!83206 (=> (not res!207937) (not e!172103))))

(assert (=> d!83206 (= res!207937 (= (size!5936 (buf!6423 (_2!11560 lt!386591))) (size!5936 (buf!6423 (_2!11560 lt!387202)))))))

(assert (=> d!83206 (= (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!387202)) e!172103)))

(declare-fun b!248436 () Bool)

(declare-fun res!207938 () Bool)

(assert (=> b!248436 (=> (not res!207938) (not e!172103))))

(assert (=> b!248436 (= res!207938 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!387202))) (currentByte!11839 (_2!11560 lt!387202)) (currentBit!11834 (_2!11560 lt!387202)))))))

(declare-fun b!248437 () Bool)

(declare-fun e!172102 () Bool)

(assert (=> b!248437 (= e!172103 e!172102)))

(declare-fun res!207939 () Bool)

(assert (=> b!248437 (=> res!207939 e!172102)))

(assert (=> b!248437 (= res!207939 (= (size!5936 (buf!6423 (_2!11560 lt!386591))) #b00000000000000000000000000000000))))

(declare-fun b!248438 () Bool)

(assert (=> b!248438 (= e!172102 (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386591)) (buf!6423 (_2!11560 lt!387202)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(assert (= (and d!83206 res!207937) b!248436))

(assert (= (and b!248436 res!207938) b!248437))

(assert (= (and b!248437 (not res!207939)) b!248438))

(assert (=> b!248436 m!373881))

(assert (=> b!248436 m!374367))

(assert (=> b!248438 m!373881))

(assert (=> b!248438 m!373881))

(declare-fun m!374509 () Bool)

(assert (=> b!248438 m!374509))

(assert (=> b!248346 d!83206))

(declare-fun d!83208 () Bool)

(assert (=> d!83208 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83208 true))

(declare-fun _$1!318 () Unit!17993)

(assert (=> d!83208 (= (choose!27 thiss!1005 (_2!11560 lt!386591) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!318)))

(declare-fun bs!21092 () Bool)

(assert (= bs!21092 d!83208))

(assert (=> bs!21092 m!374427))

(assert (=> d!83182 d!83208))

(assert (=> d!83146 d!83144))

(declare-fun d!83210 () Bool)

(assert (=> d!83210 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386589)))

(assert (=> d!83210 true))

(declare-fun _$6!402 () Unit!17993)

(assert (=> d!83210 (= (choose!9 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!386606)) lt!386589 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))) _$6!402)))

(declare-fun bs!21093 () Bool)

(assert (= bs!21093 d!83210))

(assert (=> bs!21093 m!373833))

(assert (=> d!83146 d!83210))

(assert (=> d!83178 d!83166))

(declare-fun d!83212 () Bool)

(assert (=> d!83212 (isPrefixOf!0 thiss!1005 (_2!11560 lt!386606))))

(assert (=> d!83212 true))

(declare-fun _$15!315 () Unit!17993)

(assert (=> d!83212 (= (choose!30 thiss!1005 (_2!11560 lt!386591) (_2!11560 lt!386606)) _$15!315)))

(declare-fun bs!21094 () Bool)

(assert (= bs!21094 d!83212))

(assert (=> bs!21094 m!373851))

(assert (=> d!83178 d!83212))

(assert (=> d!83178 d!83132))

(declare-fun d!83214 () Bool)

(assert (=> d!83214 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!387201) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))) lt!387201))))

(declare-fun bs!21095 () Bool)

(assert (= bs!21095 d!83214))

(assert (=> bs!21095 m!374327))

(assert (=> b!248348 d!83214))

(assert (=> b!248376 d!83198))

(declare-fun d!83216 () Bool)

(assert (=> d!83216 (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386606)) (buf!6423 thiss!1005) lt!387276 lt!387257)))

(declare-fun lt!387348 () Unit!17993)

(declare-fun choose!8 (array!13539 array!13539 (_ BitVec 64) (_ BitVec 64)) Unit!17993)

(assert (=> d!83216 (= lt!387348 (choose!8 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!386606)) lt!387276 lt!387257))))

(assert (=> d!83216 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387276) (bvsle lt!387276 lt!387257))))

(assert (=> d!83216 (= (arrayBitRangesEqSymmetric!0 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!386606)) lt!387276 lt!387257) lt!387348)))

(declare-fun bs!21096 () Bool)

(assert (= bs!21096 d!83216))

(assert (=> bs!21096 m!374463))

(declare-fun m!374511 () Bool)

(assert (=> bs!21096 m!374511))

(assert (=> b!248376 d!83216))

(declare-fun b!248439 () Bool)

(declare-fun e!172106 () Bool)

(declare-fun e!172105 () Bool)

(assert (=> b!248439 (= e!172106 e!172105)))

(declare-fun res!207944 () Bool)

(declare-fun call!3940 () Bool)

(assert (=> b!248439 (= res!207944 call!3940)))

(assert (=> b!248439 (=> (not res!207944) (not e!172105))))

(declare-fun d!83218 () Bool)

(declare-fun res!207942 () Bool)

(declare-fun e!172108 () Bool)

(assert (=> d!83218 (=> res!207942 e!172108)))

(assert (=> d!83218 (= res!207942 (bvsge lt!387276 lt!387257))))

(assert (=> d!83218 (= (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386606)) (buf!6423 thiss!1005) lt!387276 lt!387257) e!172108)))

(declare-fun b!248440 () Bool)

(declare-fun e!172104 () Bool)

(assert (=> b!248440 (= e!172104 e!172106)))

(declare-fun c!11543 () Bool)

(declare-fun lt!387350 () tuple4!284)

(assert (=> b!248440 (= c!11543 (= (_3!922 lt!387350) (_4!142 lt!387350)))))

(declare-fun e!172109 () Bool)

(declare-fun lt!387351 () (_ BitVec 32))

(declare-fun b!248441 () Bool)

(assert (=> b!248441 (= e!172109 (byteRangesEq!0 (select (arr!6923 (buf!6423 (_2!11560 lt!386606))) (_4!142 lt!387350)) (select (arr!6923 (buf!6423 thiss!1005)) (_4!142 lt!387350)) #b00000000000000000000000000000000 lt!387351))))

(declare-fun e!172107 () Bool)

(declare-fun b!248442 () Bool)

(assert (=> b!248442 (= e!172107 (arrayRangesEq!919 (buf!6423 (_2!11560 lt!386606)) (buf!6423 thiss!1005) (_1!11569 lt!387350) (_2!11569 lt!387350)))))

(declare-fun b!248443 () Bool)

(assert (=> b!248443 (= e!172106 call!3940)))

(declare-fun b!248444 () Bool)

(assert (=> b!248444 (= e!172108 e!172104)))

(declare-fun res!207940 () Bool)

(assert (=> b!248444 (=> (not res!207940) (not e!172104))))

(assert (=> b!248444 (= res!207940 e!172107)))

(declare-fun res!207941 () Bool)

(assert (=> b!248444 (=> res!207941 e!172107)))

(assert (=> b!248444 (= res!207941 (bvsge (_1!11569 lt!387350) (_2!11569 lt!387350)))))

(assert (=> b!248444 (= lt!387351 ((_ extract 31 0) (bvsrem lt!387257 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387349 () (_ BitVec 32))

(assert (=> b!248444 (= lt!387349 ((_ extract 31 0) (bvsrem lt!387276 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248444 (= lt!387350 (arrayBitIndices!0 lt!387276 lt!387257))))

(declare-fun bm!3937 () Bool)

(assert (=> bm!3937 (= call!3940 (byteRangesEq!0 (select (arr!6923 (buf!6423 (_2!11560 lt!386606))) (_3!922 lt!387350)) (select (arr!6923 (buf!6423 thiss!1005)) (_3!922 lt!387350)) lt!387349 (ite c!11543 lt!387351 #b00000000000000000000000000001000)))))

(declare-fun b!248445 () Bool)

(declare-fun res!207943 () Bool)

(assert (=> b!248445 (= res!207943 (= lt!387351 #b00000000000000000000000000000000))))

(assert (=> b!248445 (=> res!207943 e!172109)))

(assert (=> b!248445 (= e!172105 e!172109)))

(assert (= (and d!83218 (not res!207942)) b!248444))

(assert (= (and b!248444 (not res!207941)) b!248442))

(assert (= (and b!248444 res!207940) b!248440))

(assert (= (and b!248440 c!11543) b!248443))

(assert (= (and b!248440 (not c!11543)) b!248439))

(assert (= (and b!248439 res!207944) b!248445))

(assert (= (and b!248445 (not res!207943)) b!248441))

(assert (= (or b!248443 b!248439) bm!3937))

(declare-fun m!374513 () Bool)

(assert (=> b!248441 m!374513))

(declare-fun m!374515 () Bool)

(assert (=> b!248441 m!374515))

(assert (=> b!248441 m!374513))

(assert (=> b!248441 m!374515))

(declare-fun m!374517 () Bool)

(assert (=> b!248441 m!374517))

(declare-fun m!374519 () Bool)

(assert (=> b!248442 m!374519))

(declare-fun m!374521 () Bool)

(assert (=> b!248444 m!374521))

(declare-fun m!374523 () Bool)

(assert (=> bm!3937 m!374523))

(declare-fun m!374525 () Bool)

(assert (=> bm!3937 m!374525))

(assert (=> bm!3937 m!374523))

(assert (=> bm!3937 m!374525))

(declare-fun m!374527 () Bool)

(assert (=> bm!3937 m!374527))

(assert (=> b!248376 d!83218))

(declare-fun d!83220 () Bool)

(assert (=> d!83220 (= (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))) (bvsub (bvmul ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))))))))

(assert (=> d!83170 d!83220))

(declare-fun d!83222 () Bool)

(declare-fun res!207945 () Bool)

(declare-fun e!172111 () Bool)

(assert (=> d!83222 (=> (not res!207945) (not e!172111))))

(assert (=> d!83222 (= res!207945 (= (size!5936 (buf!6423 (_2!11562 lt!387165))) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(assert (=> d!83222 (= (isPrefixOf!0 (_2!11562 lt!387165) (_2!11560 lt!386606)) e!172111)))

(declare-fun b!248446 () Bool)

(declare-fun res!207946 () Bool)

(assert (=> b!248446 (=> (not res!207946) (not e!172111))))

(assert (=> b!248446 (= res!207946 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_2!11562 lt!387165))) (currentByte!11839 (_2!11562 lt!387165)) (currentBit!11834 (_2!11562 lt!387165))) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606)))))))

(declare-fun b!248447 () Bool)

(declare-fun e!172110 () Bool)

(assert (=> b!248447 (= e!172111 e!172110)))

(declare-fun res!207947 () Bool)

(assert (=> b!248447 (=> res!207947 e!172110)))

(assert (=> b!248447 (= res!207947 (= (size!5936 (buf!6423 (_2!11562 lt!387165))) #b00000000000000000000000000000000))))

(declare-fun b!248448 () Bool)

(assert (=> b!248448 (= e!172110 (arrayBitRangesEq!0 (buf!6423 (_2!11562 lt!387165)) (buf!6423 (_2!11560 lt!386606)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_2!11562 lt!387165))) (currentByte!11839 (_2!11562 lt!387165)) (currentBit!11834 (_2!11562 lt!387165)))))))

(assert (= (and d!83222 res!207945) b!248446))

(assert (= (and b!248446 res!207946) b!248447))

(assert (= (and b!248447 (not res!207947)) b!248448))

(declare-fun m!374529 () Bool)

(assert (=> b!248446 m!374529))

(assert (=> b!248446 m!373889))

(assert (=> b!248448 m!374529))

(assert (=> b!248448 m!374529))

(declare-fun m!374531 () Bool)

(assert (=> b!248448 m!374531))

(assert (=> b!248335 d!83222))

(declare-fun d!83224 () Bool)

(assert (=> d!83224 (= (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386607)))) ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386607))) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386607)))) (bvsub (bvmul ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386607)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386607))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386607))))))))

(assert (=> d!83130 d!83224))

(declare-fun d!83226 () Bool)

(assert (=> d!83226 (= (invariant!0 (currentBit!11834 (_1!11561 lt!386607)) (currentByte!11839 (_1!11561 lt!386607)) (size!5936 (buf!6423 (_1!11561 lt!386607)))) (and (bvsge (currentBit!11834 (_1!11561 lt!386607)) #b00000000000000000000000000000000) (bvslt (currentBit!11834 (_1!11561 lt!386607)) #b00000000000000000000000000001000) (bvsge (currentByte!11839 (_1!11561 lt!386607)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11839 (_1!11561 lt!386607)) (size!5936 (buf!6423 (_1!11561 lt!386607)))) (and (= (currentBit!11834 (_1!11561 lt!386607)) #b00000000000000000000000000000000) (= (currentByte!11839 (_1!11561 lt!386607)) (size!5936 (buf!6423 (_1!11561 lt!386607))))))))))

(assert (=> d!83130 d!83226))

(assert (=> b!248333 d!83138))

(declare-fun d!83228 () Bool)

(assert (=> d!83228 (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386606)) (buf!6423 (_2!11560 lt!386591)) lt!387183 lt!387164)))

(declare-fun lt!387352 () Unit!17993)

(assert (=> d!83228 (= lt!387352 (choose!8 (buf!6423 (_2!11560 lt!386591)) (buf!6423 (_2!11560 lt!386606)) lt!387183 lt!387164))))

(assert (=> d!83228 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387183) (bvsle lt!387183 lt!387164))))

(assert (=> d!83228 (= (arrayBitRangesEqSymmetric!0 (buf!6423 (_2!11560 lt!386591)) (buf!6423 (_2!11560 lt!386606)) lt!387183 lt!387164) lt!387352)))

(declare-fun bs!21097 () Bool)

(assert (= bs!21097 d!83228))

(assert (=> bs!21097 m!374363))

(declare-fun m!374533 () Bool)

(assert (=> bs!21097 m!374533))

(assert (=> b!248333 d!83228))

(declare-fun b!248449 () Bool)

(declare-fun e!172114 () Bool)

(declare-fun e!172113 () Bool)

(assert (=> b!248449 (= e!172114 e!172113)))

(declare-fun res!207952 () Bool)

(declare-fun call!3941 () Bool)

(assert (=> b!248449 (= res!207952 call!3941)))

(assert (=> b!248449 (=> (not res!207952) (not e!172113))))

(declare-fun d!83230 () Bool)

(declare-fun res!207950 () Bool)

(declare-fun e!172116 () Bool)

(assert (=> d!83230 (=> res!207950 e!172116)))

(assert (=> d!83230 (= res!207950 (bvsge lt!387183 lt!387164))))

(assert (=> d!83230 (= (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386606)) (buf!6423 (_2!11560 lt!386591)) lt!387183 lt!387164) e!172116)))

(declare-fun b!248450 () Bool)

(declare-fun e!172112 () Bool)

(assert (=> b!248450 (= e!172112 e!172114)))

(declare-fun c!11544 () Bool)

(declare-fun lt!387354 () tuple4!284)

(assert (=> b!248450 (= c!11544 (= (_3!922 lt!387354) (_4!142 lt!387354)))))

(declare-fun b!248451 () Bool)

(declare-fun e!172117 () Bool)

(declare-fun lt!387355 () (_ BitVec 32))

(assert (=> b!248451 (= e!172117 (byteRangesEq!0 (select (arr!6923 (buf!6423 (_2!11560 lt!386606))) (_4!142 lt!387354)) (select (arr!6923 (buf!6423 (_2!11560 lt!386591))) (_4!142 lt!387354)) #b00000000000000000000000000000000 lt!387355))))

(declare-fun b!248452 () Bool)

(declare-fun e!172115 () Bool)

(assert (=> b!248452 (= e!172115 (arrayRangesEq!919 (buf!6423 (_2!11560 lt!386606)) (buf!6423 (_2!11560 lt!386591)) (_1!11569 lt!387354) (_2!11569 lt!387354)))))

(declare-fun b!248453 () Bool)

(assert (=> b!248453 (= e!172114 call!3941)))

(declare-fun b!248454 () Bool)

(assert (=> b!248454 (= e!172116 e!172112)))

(declare-fun res!207948 () Bool)

(assert (=> b!248454 (=> (not res!207948) (not e!172112))))

(assert (=> b!248454 (= res!207948 e!172115)))

(declare-fun res!207949 () Bool)

(assert (=> b!248454 (=> res!207949 e!172115)))

(assert (=> b!248454 (= res!207949 (bvsge (_1!11569 lt!387354) (_2!11569 lt!387354)))))

(assert (=> b!248454 (= lt!387355 ((_ extract 31 0) (bvsrem lt!387164 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387353 () (_ BitVec 32))

(assert (=> b!248454 (= lt!387353 ((_ extract 31 0) (bvsrem lt!387183 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248454 (= lt!387354 (arrayBitIndices!0 lt!387183 lt!387164))))

(declare-fun bm!3938 () Bool)

(assert (=> bm!3938 (= call!3941 (byteRangesEq!0 (select (arr!6923 (buf!6423 (_2!11560 lt!386606))) (_3!922 lt!387354)) (select (arr!6923 (buf!6423 (_2!11560 lt!386591))) (_3!922 lt!387354)) lt!387353 (ite c!11544 lt!387355 #b00000000000000000000000000001000)))))

(declare-fun b!248455 () Bool)

(declare-fun res!207951 () Bool)

(assert (=> b!248455 (= res!207951 (= lt!387355 #b00000000000000000000000000000000))))

(assert (=> b!248455 (=> res!207951 e!172117)))

(assert (=> b!248455 (= e!172113 e!172117)))

(assert (= (and d!83230 (not res!207950)) b!248454))

(assert (= (and b!248454 (not res!207949)) b!248452))

(assert (= (and b!248454 res!207948) b!248450))

(assert (= (and b!248450 c!11544) b!248453))

(assert (= (and b!248450 (not c!11544)) b!248449))

(assert (= (and b!248449 res!207952) b!248455))

(assert (= (and b!248455 (not res!207951)) b!248451))

(assert (= (or b!248453 b!248449) bm!3938))

(declare-fun m!374535 () Bool)

(assert (=> b!248451 m!374535))

(declare-fun m!374537 () Bool)

(assert (=> b!248451 m!374537))

(assert (=> b!248451 m!374535))

(assert (=> b!248451 m!374537))

(declare-fun m!374539 () Bool)

(assert (=> b!248451 m!374539))

(declare-fun m!374541 () Bool)

(assert (=> b!248452 m!374541))

(declare-fun m!374543 () Bool)

(assert (=> b!248454 m!374543))

(declare-fun m!374545 () Bool)

(assert (=> bm!3938 m!374545))

(declare-fun m!374547 () Bool)

(assert (=> bm!3938 m!374547))

(assert (=> bm!3938 m!374545))

(assert (=> bm!3938 m!374547))

(declare-fun m!374549 () Bool)

(assert (=> bm!3938 m!374549))

(assert (=> b!248333 d!83230))

(declare-fun d!83232 () Bool)

(declare-fun res!207953 () Bool)

(declare-fun e!172119 () Bool)

(assert (=> d!83232 (=> (not res!207953) (not e!172119))))

(assert (=> d!83232 (= res!207953 (= (size!5936 (buf!6423 (_1!11562 lt!387258))) (size!5936 (buf!6423 thiss!1005))))))

(assert (=> d!83232 (= (isPrefixOf!0 (_1!11562 lt!387258) thiss!1005) e!172119)))

(declare-fun b!248456 () Bool)

(declare-fun res!207954 () Bool)

(assert (=> b!248456 (=> (not res!207954) (not e!172119))))

(assert (=> b!248456 (= res!207954 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!387258))) (currentByte!11839 (_1!11562 lt!387258)) (currentBit!11834 (_1!11562 lt!387258))) (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(declare-fun b!248457 () Bool)

(declare-fun e!172118 () Bool)

(assert (=> b!248457 (= e!172119 e!172118)))

(declare-fun res!207955 () Bool)

(assert (=> b!248457 (=> res!207955 e!172118)))

(assert (=> b!248457 (= res!207955 (= (size!5936 (buf!6423 (_1!11562 lt!387258))) #b00000000000000000000000000000000))))

(declare-fun b!248458 () Bool)

(assert (=> b!248458 (= e!172118 (arrayBitRangesEq!0 (buf!6423 (_1!11562 lt!387258)) (buf!6423 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!387258))) (currentByte!11839 (_1!11562 lt!387258)) (currentBit!11834 (_1!11562 lt!387258)))))))

(assert (= (and d!83232 res!207953) b!248456))

(assert (= (and b!248456 res!207954) b!248457))

(assert (= (and b!248457 (not res!207955)) b!248458))

(declare-fun m!374551 () Bool)

(assert (=> b!248456 m!374551))

(assert (=> b!248456 m!373883))

(assert (=> b!248458 m!374551))

(assert (=> b!248458 m!374551))

(declare-fun m!374553 () Bool)

(assert (=> b!248458 m!374553))

(assert (=> b!248379 d!83232))

(declare-fun d!83234 () Bool)

(assert (=> d!83234 (= (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))) (bvsub (bvmul ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))))))))

(assert (=> d!83172 d!83234))

(declare-fun d!83236 () Bool)

(declare-fun res!207956 () Bool)

(declare-fun e!172121 () Bool)

(assert (=> d!83236 (=> (not res!207956) (not e!172121))))

(assert (=> d!83236 (= res!207956 (= (size!5936 (buf!6423 (_1!11562 lt!387165))) (size!5936 (buf!6423 (_2!11560 lt!386591)))))))

(assert (=> d!83236 (= (isPrefixOf!0 (_1!11562 lt!387165) (_2!11560 lt!386591)) e!172121)))

(declare-fun b!248459 () Bool)

(declare-fun res!207957 () Bool)

(assert (=> b!248459 (=> (not res!207957) (not e!172121))))

(assert (=> b!248459 (= res!207957 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!387165))) (currentByte!11839 (_1!11562 lt!387165)) (currentBit!11834 (_1!11562 lt!387165))) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(declare-fun b!248460 () Bool)

(declare-fun e!172120 () Bool)

(assert (=> b!248460 (= e!172121 e!172120)))

(declare-fun res!207958 () Bool)

(assert (=> b!248460 (=> res!207958 e!172120)))

(assert (=> b!248460 (= res!207958 (= (size!5936 (buf!6423 (_1!11562 lt!387165))) #b00000000000000000000000000000000))))

(declare-fun b!248461 () Bool)

(assert (=> b!248461 (= e!172120 (arrayBitRangesEq!0 (buf!6423 (_1!11562 lt!387165)) (buf!6423 (_2!11560 lt!386591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!387165))) (currentByte!11839 (_1!11562 lt!387165)) (currentBit!11834 (_1!11562 lt!387165)))))))

(assert (= (and d!83236 res!207956) b!248459))

(assert (= (and b!248459 res!207957) b!248460))

(assert (= (and b!248460 (not res!207958)) b!248461))

(declare-fun m!374555 () Bool)

(assert (=> b!248459 m!374555))

(assert (=> b!248459 m!373881))

(assert (=> b!248461 m!374555))

(assert (=> b!248461 m!374555))

(declare-fun m!374557 () Bool)

(assert (=> b!248461 m!374557))

(assert (=> b!248336 d!83236))

(declare-fun b!248473 () Bool)

(declare-fun e!172131 () Bool)

(declare-fun _$19!180 () tuple2!21276)

(assert (=> b!248473 (= e!172131 (array_inv!5677 (buf!6423 (_2!11560 _$19!180))))))

(declare-fun b!248474 () Bool)

(declare-fun e!172132 () Bool)

(declare-fun e!172130 () Bool)

(assert (=> b!248474 (= e!172132 e!172130)))

(declare-fun res!207970 () Bool)

(assert (=> b!248474 (=> (not res!207970) (not e!172130))))

(declare-fun lt!387358 () tuple2!21278)

(assert (=> b!248474 (= res!207970 (and (= (_2!11561 lt!387358) bit!26) (= (_1!11561 lt!387358) (_2!11560 _$19!180))))))

(assert (=> b!248474 (= lt!387358 (readBitPure!0 (readerFrom!0 (_2!11560 _$19!180) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))))

(declare-fun b!248475 () Bool)

(declare-fun res!207969 () Bool)

(assert (=> b!248475 (=> (not res!207969) (not e!172132))))

(assert (=> b!248475 (= res!207969 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 _$19!180))) (currentByte!11839 (_2!11560 _$19!180)) (currentBit!11834 (_2!11560 _$19!180))) (bvadd (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!83238 () Bool)

(assert (=> d!83238 e!172132))

(declare-fun res!207967 () Bool)

(assert (=> d!83238 (=> (not res!207967) (not e!172132))))

(assert (=> d!83238 (= res!207967 (= (size!5936 (buf!6423 thiss!1005)) (size!5936 (buf!6423 (_2!11560 _$19!180)))))))

(assert (=> d!83238 (and (inv!12 (_2!11560 _$19!180)) e!172131)))

(assert (=> d!83238 (= (choose!16 thiss!1005 bit!26) _$19!180)))

(declare-fun b!248476 () Bool)

(assert (=> b!248476 (= e!172130 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!387358))) (currentByte!11839 (_1!11561 lt!387358)) (currentBit!11834 (_1!11561 lt!387358))) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 _$19!180))) (currentByte!11839 (_2!11560 _$19!180)) (currentBit!11834 (_2!11560 _$19!180)))))))

(declare-fun b!248477 () Bool)

(declare-fun res!207968 () Bool)

(assert (=> b!248477 (=> (not res!207968) (not e!172132))))

(assert (=> b!248477 (= res!207968 (isPrefixOf!0 thiss!1005 (_2!11560 _$19!180)))))

(assert (= d!83238 b!248473))

(assert (= (and d!83238 res!207967) b!248475))

(assert (= (and b!248475 res!207969) b!248477))

(assert (= (and b!248477 res!207968) b!248474))

(assert (= (and b!248474 res!207970) b!248476))

(declare-fun m!374559 () Bool)

(assert (=> b!248476 m!374559))

(declare-fun m!374561 () Bool)

(assert (=> b!248476 m!374561))

(declare-fun m!374563 () Bool)

(assert (=> b!248474 m!374563))

(assert (=> b!248474 m!374563))

(declare-fun m!374565 () Bool)

(assert (=> b!248474 m!374565))

(assert (=> b!248475 m!374561))

(assert (=> b!248475 m!373883))

(declare-fun m!374567 () Bool)

(assert (=> b!248473 m!374567))

(declare-fun m!374569 () Bool)

(assert (=> b!248477 m!374569))

(declare-fun m!374571 () Bool)

(assert (=> d!83238 m!374571))

(assert (=> d!83160 d!83238))

(declare-fun d!83240 () Bool)

(assert (=> d!83240 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21098 () Bool)

(assert (= bs!21098 d!83240))

(assert (=> bs!21098 m!374465))

(assert (=> d!83160 d!83240))

(assert (=> b!248380 d!83138))

(assert (=> b!248380 d!83136))

(declare-fun d!83242 () Bool)

(declare-fun e!172134 () Bool)

(assert (=> d!83242 e!172134))

(declare-fun res!207972 () Bool)

(assert (=> d!83242 (=> (not res!207972) (not e!172134))))

(declare-fun lt!387359 () (_ BitVec 64))

(declare-fun lt!387361 () (_ BitVec 64))

(declare-fun lt!387364 () (_ BitVec 64))

(assert (=> d!83242 (= res!207972 (= lt!387361 (bvsub lt!387359 lt!387364)))))

(assert (=> d!83242 (or (= (bvand lt!387359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387364 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387359 lt!387364) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83242 (= lt!387364 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!387218)))) ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!387218))) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!387218)))))))

(declare-fun lt!387363 () (_ BitVec 64))

(declare-fun lt!387362 () (_ BitVec 64))

(assert (=> d!83242 (= lt!387359 (bvmul lt!387363 lt!387362))))

(assert (=> d!83242 (or (= lt!387363 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387362 (bvsdiv (bvmul lt!387363 lt!387362) lt!387363)))))

(assert (=> d!83242 (= lt!387362 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83242 (= lt!387363 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!387218)))))))

(assert (=> d!83242 (= lt!387361 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!387218))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!387218)))))))

(assert (=> d!83242 (invariant!0 (currentBit!11834 (_1!11561 lt!387218)) (currentByte!11839 (_1!11561 lt!387218)) (size!5936 (buf!6423 (_1!11561 lt!387218))))))

(assert (=> d!83242 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!387218))) (currentByte!11839 (_1!11561 lt!387218)) (currentBit!11834 (_1!11561 lt!387218))) lt!387361)))

(declare-fun b!248478 () Bool)

(declare-fun res!207971 () Bool)

(assert (=> b!248478 (=> (not res!207971) (not e!172134))))

(assert (=> b!248478 (= res!207971 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387361))))

(declare-fun b!248479 () Bool)

(declare-fun lt!387360 () (_ BitVec 64))

(assert (=> b!248479 (= e!172134 (bvsle lt!387361 (bvmul lt!387360 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248479 (or (= lt!387360 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387360 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387360)))))

(assert (=> b!248479 (= lt!387360 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!387218)))))))

(assert (= (and d!83242 res!207972) b!248478))

(assert (= (and b!248478 res!207971) b!248479))

(declare-fun m!374573 () Bool)

(assert (=> d!83242 m!374573))

(declare-fun m!374575 () Bool)

(assert (=> d!83242 m!374575))

(assert (=> b!248361 d!83242))

(declare-fun d!83244 () Bool)

(declare-fun e!172135 () Bool)

(assert (=> d!83244 e!172135))

(declare-fun res!207974 () Bool)

(assert (=> d!83244 (=> (not res!207974) (not e!172135))))

(declare-fun lt!387365 () (_ BitVec 64))

(declare-fun lt!387367 () (_ BitVec 64))

(declare-fun lt!387370 () (_ BitVec 64))

(assert (=> d!83244 (= res!207974 (= lt!387367 (bvsub lt!387365 lt!387370)))))

(assert (=> d!83244 (or (= (bvand lt!387365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387370 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387365 lt!387370) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83244 (= lt!387370 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387219)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!387219))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!387219)))))))

(declare-fun lt!387369 () (_ BitVec 64))

(declare-fun lt!387368 () (_ BitVec 64))

(assert (=> d!83244 (= lt!387365 (bvmul lt!387369 lt!387368))))

(assert (=> d!83244 (or (= lt!387369 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387368 (bvsdiv (bvmul lt!387369 lt!387368) lt!387369)))))

(assert (=> d!83244 (= lt!387368 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83244 (= lt!387369 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387219)))))))

(assert (=> d!83244 (= lt!387367 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!387219))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!387219)))))))

(assert (=> d!83244 (invariant!0 (currentBit!11834 (_2!11560 lt!387219)) (currentByte!11839 (_2!11560 lt!387219)) (size!5936 (buf!6423 (_2!11560 lt!387219))))))

(assert (=> d!83244 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!387219))) (currentByte!11839 (_2!11560 lt!387219)) (currentBit!11834 (_2!11560 lt!387219))) lt!387367)))

(declare-fun b!248480 () Bool)

(declare-fun res!207973 () Bool)

(assert (=> b!248480 (=> (not res!207973) (not e!172135))))

(assert (=> b!248480 (= res!207973 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387367))))

(declare-fun b!248481 () Bool)

(declare-fun lt!387366 () (_ BitVec 64))

(assert (=> b!248481 (= e!172135 (bvsle lt!387367 (bvmul lt!387366 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248481 (or (= lt!387366 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387366 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387366)))))

(assert (=> b!248481 (= lt!387366 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387219)))))))

(assert (= (and d!83244 res!207974) b!248480))

(assert (= (and b!248480 res!207973) b!248481))

(declare-fun m!374577 () Bool)

(assert (=> d!83244 m!374577))

(declare-fun m!374579 () Bool)

(assert (=> d!83244 m!374579))

(assert (=> b!248361 d!83244))

(declare-fun b!248482 () Bool)

(declare-fun e!172138 () Bool)

(declare-fun e!172137 () Bool)

(assert (=> b!248482 (= e!172138 e!172137)))

(declare-fun res!207979 () Bool)

(declare-fun call!3942 () Bool)

(assert (=> b!248482 (= res!207979 call!3942)))

(assert (=> b!248482 (=> (not res!207979) (not e!172137))))

(declare-fun d!83246 () Bool)

(declare-fun res!207977 () Bool)

(declare-fun e!172140 () Bool)

(assert (=> d!83246 (=> res!207977 e!172140)))

(assert (=> d!83246 (= res!207977 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(assert (=> d!83246 (= (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386591)) (buf!6423 (_2!11560 lt!386606)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))) e!172140)))

(declare-fun b!248483 () Bool)

(declare-fun e!172136 () Bool)

(assert (=> b!248483 (= e!172136 e!172138)))

(declare-fun c!11545 () Bool)

(declare-fun lt!387372 () tuple4!284)

(assert (=> b!248483 (= c!11545 (= (_3!922 lt!387372) (_4!142 lt!387372)))))

(declare-fun b!248484 () Bool)

(declare-fun lt!387373 () (_ BitVec 32))

(declare-fun e!172141 () Bool)

(assert (=> b!248484 (= e!172141 (byteRangesEq!0 (select (arr!6923 (buf!6423 (_2!11560 lt!386591))) (_4!142 lt!387372)) (select (arr!6923 (buf!6423 (_2!11560 lt!386606))) (_4!142 lt!387372)) #b00000000000000000000000000000000 lt!387373))))

(declare-fun e!172139 () Bool)

(declare-fun b!248485 () Bool)

(assert (=> b!248485 (= e!172139 (arrayRangesEq!919 (buf!6423 (_2!11560 lt!386591)) (buf!6423 (_2!11560 lt!386606)) (_1!11569 lt!387372) (_2!11569 lt!387372)))))

(declare-fun b!248486 () Bool)

(assert (=> b!248486 (= e!172138 call!3942)))

(declare-fun b!248487 () Bool)

(assert (=> b!248487 (= e!172140 e!172136)))

(declare-fun res!207975 () Bool)

(assert (=> b!248487 (=> (not res!207975) (not e!172136))))

(assert (=> b!248487 (= res!207975 e!172139)))

(declare-fun res!207976 () Bool)

(assert (=> b!248487 (=> res!207976 e!172139)))

(assert (=> b!248487 (= res!207976 (bvsge (_1!11569 lt!387372) (_2!11569 lt!387372)))))

(assert (=> b!248487 (= lt!387373 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387371 () (_ BitVec 32))

(assert (=> b!248487 (= lt!387371 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248487 (= lt!387372 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(declare-fun bm!3939 () Bool)

(assert (=> bm!3939 (= call!3942 (byteRangesEq!0 (select (arr!6923 (buf!6423 (_2!11560 lt!386591))) (_3!922 lt!387372)) (select (arr!6923 (buf!6423 (_2!11560 lt!386606))) (_3!922 lt!387372)) lt!387371 (ite c!11545 lt!387373 #b00000000000000000000000000001000)))))

(declare-fun b!248488 () Bool)

(declare-fun res!207978 () Bool)

(assert (=> b!248488 (= res!207978 (= lt!387373 #b00000000000000000000000000000000))))

(assert (=> b!248488 (=> res!207978 e!172141)))

(assert (=> b!248488 (= e!172137 e!172141)))

(assert (= (and d!83246 (not res!207977)) b!248487))

(assert (= (and b!248487 (not res!207976)) b!248485))

(assert (= (and b!248487 res!207975) b!248483))

(assert (= (and b!248483 c!11545) b!248486))

(assert (= (and b!248483 (not c!11545)) b!248482))

(assert (= (and b!248482 res!207979) b!248488))

(assert (= (and b!248488 (not res!207978)) b!248484))

(assert (= (or b!248486 b!248482) bm!3939))

(declare-fun m!374581 () Bool)

(assert (=> b!248484 m!374581))

(declare-fun m!374583 () Bool)

(assert (=> b!248484 m!374583))

(assert (=> b!248484 m!374581))

(assert (=> b!248484 m!374583))

(declare-fun m!374585 () Bool)

(assert (=> b!248484 m!374585))

(declare-fun m!374587 () Bool)

(assert (=> b!248485 m!374587))

(assert (=> b!248487 m!373881))

(declare-fun m!374589 () Bool)

(assert (=> b!248487 m!374589))

(declare-fun m!374591 () Bool)

(assert (=> bm!3939 m!374591))

(declare-fun m!374593 () Bool)

(assert (=> bm!3939 m!374593))

(assert (=> bm!3939 m!374591))

(assert (=> bm!3939 m!374593))

(declare-fun m!374595 () Bool)

(assert (=> bm!3939 m!374595))

(assert (=> b!248382 d!83246))

(assert (=> b!248382 d!83138))

(declare-fun d!83248 () Bool)

(declare-fun res!207980 () Bool)

(declare-fun e!172143 () Bool)

(assert (=> d!83248 (=> (not res!207980) (not e!172143))))

(assert (=> d!83248 (= res!207980 (= (size!5936 (buf!6423 thiss!1005)) (size!5936 (buf!6423 (_2!11560 lt!387219)))))))

(assert (=> d!83248 (= (isPrefixOf!0 thiss!1005 (_2!11560 lt!387219)) e!172143)))

(declare-fun b!248489 () Bool)

(declare-fun res!207981 () Bool)

(assert (=> b!248489 (=> (not res!207981) (not e!172143))))

(assert (=> b!248489 (= res!207981 (bvsle (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!387219))) (currentByte!11839 (_2!11560 lt!387219)) (currentBit!11834 (_2!11560 lt!387219)))))))

(declare-fun b!248490 () Bool)

(declare-fun e!172142 () Bool)

(assert (=> b!248490 (= e!172143 e!172142)))

(declare-fun res!207982 () Bool)

(assert (=> b!248490 (=> res!207982 e!172142)))

(assert (=> b!248490 (= res!207982 (= (size!5936 (buf!6423 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248491 () Bool)

(assert (=> b!248491 (= e!172142 (arrayBitRangesEq!0 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!387219)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(assert (= (and d!83248 res!207980) b!248489))

(assert (= (and b!248489 res!207981) b!248490))

(assert (= (and b!248490 (not res!207982)) b!248491))

(assert (=> b!248489 m!373883))

(assert (=> b!248489 m!374387))

(assert (=> b!248491 m!373883))

(assert (=> b!248491 m!373883))

(declare-fun m!374597 () Bool)

(assert (=> b!248491 m!374597))

(assert (=> b!248359 d!83248))

(declare-fun d!83250 () Bool)

(assert (=> d!83250 (= (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!5936 (buf!6423 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 thiss!1005)))))))

(assert (=> d!83198 d!83250))

(declare-fun d!83252 () Bool)

(assert (=> d!83252 (= (invariant!0 (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005) (size!5936 (buf!6423 thiss!1005))) (and (bvsge (currentBit!11834 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11834 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11839 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11839 thiss!1005) (size!5936 (buf!6423 thiss!1005))) (and (= (currentBit!11834 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11839 thiss!1005) (size!5936 (buf!6423 thiss!1005)))))))))

(assert (=> d!83198 d!83252))

(declare-fun d!83254 () Bool)

(assert (=> d!83254 (isPrefixOf!0 (_2!11560 lt!386606) (_2!11560 lt!386606))))

(declare-fun lt!387376 () Unit!17993)

(declare-fun choose!11 (BitStream!10794) Unit!17993)

(assert (=> d!83254 (= lt!387376 (choose!11 (_2!11560 lt!386606)))))

(assert (=> d!83254 (= (lemmaIsPrefixRefl!0 (_2!11560 lt!386606)) lt!387376)))

(declare-fun bs!21100 () Bool)

(assert (= bs!21100 d!83254))

(assert (=> bs!21100 m!374349))

(declare-fun m!374599 () Bool)

(assert (=> bs!21100 m!374599))

(assert (=> d!83148 d!83254))

(declare-fun d!83256 () Bool)

(declare-fun res!207983 () Bool)

(declare-fun e!172145 () Bool)

(assert (=> d!83256 (=> (not res!207983) (not e!172145))))

(assert (=> d!83256 (= res!207983 (= (size!5936 (buf!6423 lt!387170)) (size!5936 (buf!6423 lt!387170))))))

(assert (=> d!83256 (= (isPrefixOf!0 lt!387170 lt!387170) e!172145)))

(declare-fun b!248492 () Bool)

(declare-fun res!207984 () Bool)

(assert (=> b!248492 (=> (not res!207984) (not e!172145))))

(assert (=> b!248492 (= res!207984 (bvsle (bitIndex!0 (size!5936 (buf!6423 lt!387170)) (currentByte!11839 lt!387170) (currentBit!11834 lt!387170)) (bitIndex!0 (size!5936 (buf!6423 lt!387170)) (currentByte!11839 lt!387170) (currentBit!11834 lt!387170))))))

(declare-fun b!248493 () Bool)

(declare-fun e!172144 () Bool)

(assert (=> b!248493 (= e!172145 e!172144)))

(declare-fun res!207985 () Bool)

(assert (=> b!248493 (=> res!207985 e!172144)))

(assert (=> b!248493 (= res!207985 (= (size!5936 (buf!6423 lt!387170)) #b00000000000000000000000000000000))))

(declare-fun b!248494 () Bool)

(assert (=> b!248494 (= e!172144 (arrayBitRangesEq!0 (buf!6423 lt!387170) (buf!6423 lt!387170) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 lt!387170)) (currentByte!11839 lt!387170) (currentBit!11834 lt!387170))))))

(assert (= (and d!83256 res!207983) b!248492))

(assert (= (and b!248492 res!207984) b!248493))

(assert (= (and b!248493 (not res!207985)) b!248494))

(declare-fun m!374601 () Bool)

(assert (=> b!248492 m!374601))

(assert (=> b!248492 m!374601))

(assert (=> b!248494 m!374601))

(assert (=> b!248494 m!374601))

(declare-fun m!374603 () Bool)

(assert (=> b!248494 m!374603))

(assert (=> d!83148 d!83256))

(declare-fun d!83258 () Bool)

(assert (=> d!83258 (isPrefixOf!0 lt!387170 (_2!11560 lt!386606))))

(declare-fun lt!387377 () Unit!17993)

(assert (=> d!83258 (= lt!387377 (choose!30 lt!387170 (_2!11560 lt!386591) (_2!11560 lt!386606)))))

(assert (=> d!83258 (isPrefixOf!0 lt!387170 (_2!11560 lt!386591))))

(assert (=> d!83258 (= (lemmaIsPrefixTransitive!0 lt!387170 (_2!11560 lt!386591) (_2!11560 lt!386606)) lt!387377)))

(declare-fun bs!21101 () Bool)

(assert (= bs!21101 d!83258))

(assert (=> bs!21101 m!374345))

(declare-fun m!374605 () Bool)

(assert (=> bs!21101 m!374605))

(declare-fun m!374607 () Bool)

(assert (=> bs!21101 m!374607))

(assert (=> d!83148 d!83258))

(declare-fun d!83260 () Bool)

(assert (=> d!83260 (isPrefixOf!0 lt!387170 lt!387170)))

(declare-fun lt!387378 () Unit!17993)

(assert (=> d!83260 (= lt!387378 (choose!11 lt!387170))))

(assert (=> d!83260 (= (lemmaIsPrefixRefl!0 lt!387170) lt!387378)))

(declare-fun bs!21102 () Bool)

(assert (= bs!21102 d!83260))

(assert (=> bs!21102 m!374347))

(declare-fun m!374609 () Bool)

(assert (=> bs!21102 m!374609))

(assert (=> d!83148 d!83260))

(assert (=> d!83148 d!83196))

(declare-fun d!83262 () Bool)

(declare-fun res!207986 () Bool)

(declare-fun e!172147 () Bool)

(assert (=> d!83262 (=> (not res!207986) (not e!172147))))

(assert (=> d!83262 (= res!207986 (= (size!5936 (buf!6423 lt!387170)) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(assert (=> d!83262 (= (isPrefixOf!0 lt!387170 (_2!11560 lt!386606)) e!172147)))

(declare-fun b!248495 () Bool)

(declare-fun res!207987 () Bool)

(assert (=> b!248495 (=> (not res!207987) (not e!172147))))

(assert (=> b!248495 (= res!207987 (bvsle (bitIndex!0 (size!5936 (buf!6423 lt!387170)) (currentByte!11839 lt!387170) (currentBit!11834 lt!387170)) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606)))))))

(declare-fun b!248496 () Bool)

(declare-fun e!172146 () Bool)

(assert (=> b!248496 (= e!172147 e!172146)))

(declare-fun res!207988 () Bool)

(assert (=> b!248496 (=> res!207988 e!172146)))

(assert (=> b!248496 (= res!207988 (= (size!5936 (buf!6423 lt!387170)) #b00000000000000000000000000000000))))

(declare-fun b!248497 () Bool)

(assert (=> b!248497 (= e!172146 (arrayBitRangesEq!0 (buf!6423 lt!387170) (buf!6423 (_2!11560 lt!386606)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 lt!387170)) (currentByte!11839 lt!387170) (currentBit!11834 lt!387170))))))

(assert (= (and d!83262 res!207986) b!248495))

(assert (= (and b!248495 res!207987) b!248496))

(assert (= (and b!248496 (not res!207988)) b!248497))

(assert (=> b!248495 m!374601))

(assert (=> b!248495 m!373889))

(assert (=> b!248497 m!374601))

(assert (=> b!248497 m!374601))

(declare-fun m!374611 () Bool)

(assert (=> b!248497 m!374611))

(assert (=> d!83148 d!83262))

(declare-fun d!83264 () Bool)

(declare-fun res!207989 () Bool)

(declare-fun e!172149 () Bool)

(assert (=> d!83264 (=> (not res!207989) (not e!172149))))

(assert (=> d!83264 (= res!207989 (= (size!5936 (buf!6423 (_1!11562 lt!387165))) (size!5936 (buf!6423 (_2!11562 lt!387165)))))))

(assert (=> d!83264 (= (isPrefixOf!0 (_1!11562 lt!387165) (_2!11562 lt!387165)) e!172149)))

(declare-fun b!248498 () Bool)

(declare-fun res!207990 () Bool)

(assert (=> b!248498 (=> (not res!207990) (not e!172149))))

(assert (=> b!248498 (= res!207990 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!387165))) (currentByte!11839 (_1!11562 lt!387165)) (currentBit!11834 (_1!11562 lt!387165))) (bitIndex!0 (size!5936 (buf!6423 (_2!11562 lt!387165))) (currentByte!11839 (_2!11562 lt!387165)) (currentBit!11834 (_2!11562 lt!387165)))))))

(declare-fun b!248499 () Bool)

(declare-fun e!172148 () Bool)

(assert (=> b!248499 (= e!172149 e!172148)))

(declare-fun res!207991 () Bool)

(assert (=> b!248499 (=> res!207991 e!172148)))

(assert (=> b!248499 (= res!207991 (= (size!5936 (buf!6423 (_1!11562 lt!387165))) #b00000000000000000000000000000000))))

(declare-fun b!248500 () Bool)

(assert (=> b!248500 (= e!172148 (arrayBitRangesEq!0 (buf!6423 (_1!11562 lt!387165)) (buf!6423 (_2!11562 lt!387165)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!387165))) (currentByte!11839 (_1!11562 lt!387165)) (currentBit!11834 (_1!11562 lt!387165)))))))

(assert (= (and d!83264 res!207989) b!248498))

(assert (= (and b!248498 res!207990) b!248499))

(assert (= (and b!248499 (not res!207991)) b!248500))

(assert (=> b!248498 m!374555))

(assert (=> b!248498 m!374529))

(assert (=> b!248500 m!374555))

(assert (=> b!248500 m!374555))

(declare-fun m!374613 () Bool)

(assert (=> b!248500 m!374613))

(assert (=> d!83148 d!83264))

(declare-fun d!83266 () Bool)

(declare-fun res!207992 () Bool)

(declare-fun e!172151 () Bool)

(assert (=> d!83266 (=> (not res!207992) (not e!172151))))

(assert (=> d!83266 (= res!207992 (= (size!5936 (buf!6423 (_2!11560 lt!386591))) (size!5936 (buf!6423 (_2!11560 lt!386591)))))))

(assert (=> d!83266 (= (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!386591)) e!172151)))

(declare-fun b!248501 () Bool)

(declare-fun res!207993 () Bool)

(assert (=> b!248501 (=> (not res!207993) (not e!172151))))

(assert (=> b!248501 (= res!207993 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(declare-fun b!248502 () Bool)

(declare-fun e!172150 () Bool)

(assert (=> b!248502 (= e!172151 e!172150)))

(declare-fun res!207994 () Bool)

(assert (=> b!248502 (=> res!207994 e!172150)))

(assert (=> b!248502 (= res!207994 (= (size!5936 (buf!6423 (_2!11560 lt!386591))) #b00000000000000000000000000000000))))

(declare-fun b!248503 () Bool)

(assert (=> b!248503 (= e!172150 (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386591)) (buf!6423 (_2!11560 lt!386591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(assert (= (and d!83266 res!207992) b!248501))

(assert (= (and b!248501 res!207993) b!248502))

(assert (= (and b!248502 (not res!207994)) b!248503))

(assert (=> b!248501 m!373881))

(assert (=> b!248501 m!373881))

(assert (=> b!248503 m!373881))

(assert (=> b!248503 m!373881))

(declare-fun m!374615 () Bool)

(assert (=> b!248503 m!374615))

(assert (=> d!83148 d!83266))

(declare-fun d!83268 () Bool)

(declare-fun res!207995 () Bool)

(declare-fun e!172153 () Bool)

(assert (=> d!83268 (=> (not res!207995) (not e!172153))))

(assert (=> d!83268 (= res!207995 (= (size!5936 (buf!6423 (_2!11560 lt!386606))) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(assert (=> d!83268 (= (isPrefixOf!0 (_2!11560 lt!386606) (_2!11560 lt!386606)) e!172153)))

(declare-fun b!248504 () Bool)

(declare-fun res!207996 () Bool)

(assert (=> b!248504 (=> (not res!207996) (not e!172153))))

(assert (=> b!248504 (= res!207996 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606))) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606)))))))

(declare-fun b!248505 () Bool)

(declare-fun e!172152 () Bool)

(assert (=> b!248505 (= e!172153 e!172152)))

(declare-fun res!207997 () Bool)

(assert (=> b!248505 (=> res!207997 e!172152)))

(assert (=> b!248505 (= res!207997 (= (size!5936 (buf!6423 (_2!11560 lt!386606))) #b00000000000000000000000000000000))))

(declare-fun b!248506 () Bool)

(assert (=> b!248506 (= e!172152 (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!386606)) (buf!6423 (_2!11560 lt!386606)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606)))))))

(assert (= (and d!83268 res!207995) b!248504))

(assert (= (and b!248504 res!207996) b!248505))

(assert (= (and b!248505 (not res!207997)) b!248506))

(assert (=> b!248504 m!373889))

(assert (=> b!248504 m!373889))

(assert (=> b!248506 m!373889))

(assert (=> b!248506 m!373889))

(declare-fun m!374617 () Bool)

(assert (=> b!248506 m!374617))

(assert (=> d!83148 d!83268))

(declare-fun d!83270 () Bool)

(assert (=> d!83270 (isPrefixOf!0 lt!387170 (_2!11560 lt!386606))))

(declare-fun lt!387379 () Unit!17993)

(assert (=> d!83270 (= lt!387379 (choose!30 lt!387170 (_2!11560 lt!386606) (_2!11560 lt!386606)))))

(assert (=> d!83270 (isPrefixOf!0 lt!387170 (_2!11560 lt!386606))))

(assert (=> d!83270 (= (lemmaIsPrefixTransitive!0 lt!387170 (_2!11560 lt!386606) (_2!11560 lt!386606)) lt!387379)))

(declare-fun bs!21103 () Bool)

(assert (= bs!21103 d!83270))

(assert (=> bs!21103 m!374345))

(declare-fun m!374619 () Bool)

(assert (=> bs!21103 m!374619))

(assert (=> bs!21103 m!374345))

(assert (=> d!83148 d!83270))

(declare-fun d!83272 () Bool)

(assert (=> d!83272 (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!386591))))

(declare-fun lt!387380 () Unit!17993)

(assert (=> d!83272 (= lt!387380 (choose!11 (_2!11560 lt!386591)))))

(assert (=> d!83272 (= (lemmaIsPrefixRefl!0 (_2!11560 lt!386591)) lt!387380)))

(declare-fun bs!21104 () Bool)

(assert (= bs!21104 d!83272))

(assert (=> bs!21104 m!374339))

(declare-fun m!374621 () Bool)

(assert (=> bs!21104 m!374621))

(assert (=> d!83148 d!83272))

(declare-fun d!83274 () Bool)

(declare-fun e!172156 () Bool)

(assert (=> d!83274 e!172156))

(declare-fun res!207999 () Bool)

(assert (=> d!83274 (=> (not res!207999) (not e!172156))))

(declare-fun lt!387385 () tuple2!21292)

(declare-fun lt!387388 () (_ BitVec 64))

(assert (=> d!83274 (= res!207999 (bvsge (bvsub lt!387388 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5936 (buf!6423 (_2!11568 lt!387385))) (currentByte!11839 (_2!11568 lt!387385)) (currentBit!11834 (_2!11568 lt!387385)))))))

(assert (=> d!83274 (or (= (bvand lt!387388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387388 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387384 () (_ BitVec 64))

(assert (=> d!83274 (= lt!387388 (bvadd lt!387384 nBits!297))))

(assert (=> d!83274 (or (not (= (bvand lt!387384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387384 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83274 (= lt!387384 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386588))) (currentByte!11839 (_1!11562 lt!386588)) (currentBit!11834 (_1!11562 lt!386588))))))

(declare-fun e!172154 () tuple2!21292)

(assert (=> d!83274 (= lt!387385 e!172154)))

(declare-fun c!11546 () Bool)

(assert (=> d!83274 (= c!11546 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!83274 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83274 (= (checkBitsLoop!0 (_1!11562 lt!386588) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!387385)))

(declare-fun b!248507 () Bool)

(declare-fun res!207998 () Bool)

(assert (=> b!248507 (=> (not res!207998) (not e!172156))))

(assert (=> b!248507 (= res!207998 (and (= (buf!6423 (_1!11562 lt!386588)) (buf!6423 (_2!11568 lt!387385))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11568 lt!387385))))))

(declare-fun b!248508 () Bool)

(declare-fun e!172157 () tuple2!21292)

(assert (=> b!248508 (= e!172154 e!172157)))

(declare-fun lt!387389 () tuple2!21292)

(assert (=> b!248508 (= lt!387389 (readBit!0 (_1!11562 lt!386588)))))

(declare-fun c!11547 () Bool)

(assert (=> b!248508 (= c!11547 (not (= (_1!11568 lt!387389) bit!26)))))

(declare-fun b!248509 () Bool)

(declare-fun lt!387381 () (_ BitVec 64))

(declare-fun e!172155 () Bool)

(assert (=> b!248509 (= e!172155 (= (bvsub lt!387381 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5936 (buf!6423 (_2!11568 lt!387385))) (currentByte!11839 (_2!11568 lt!387385)) (currentBit!11834 (_2!11568 lt!387385)))))))

(assert (=> b!248509 (or (= (bvand lt!387381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387381 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387383 () (_ BitVec 64))

(assert (=> b!248509 (= lt!387381 (bvadd lt!387383 nBits!297))))

(assert (=> b!248509 (or (not (= (bvand lt!387383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387383 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248509 (= lt!387383 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386588))) (currentByte!11839 (_1!11562 lt!386588)) (currentBit!11834 (_1!11562 lt!386588))))))

(declare-fun b!248510 () Bool)

(assert (=> b!248510 (= e!172157 (tuple2!21293 false (_2!11568 lt!387389)))))

(declare-fun b!248511 () Bool)

(declare-fun res!208002 () Bool)

(assert (=> b!248511 (=> (not res!208002) (not e!172156))))

(assert (=> b!248511 (= res!208002 e!172155)))

(declare-fun res!208000 () Bool)

(assert (=> b!248511 (=> res!208000 e!172155)))

(assert (=> b!248511 (= res!208000 (not (_1!11568 lt!387385)))))

(declare-fun b!248512 () Bool)

(declare-fun e!172158 () Bool)

(assert (=> b!248512 (= e!172156 e!172158)))

(declare-fun res!208001 () Bool)

(assert (=> b!248512 (=> res!208001 e!172158)))

(assert (=> b!248512 (= res!208001 (or (not (_1!11568 lt!387385)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun lt!387382 () tuple2!21292)

(declare-fun b!248513 () Bool)

(assert (=> b!248513 (= lt!387382 (checkBitsLoop!0 (_2!11568 lt!387389) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!387390 () Unit!17993)

(declare-fun lt!387386 () Unit!17993)

(assert (=> b!248513 (= lt!387390 lt!387386)))

(declare-fun lt!387391 () (_ BitVec 64))

(declare-fun lt!387387 () (_ BitVec 64))

(assert (=> b!248513 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11568 lt!387389)))) ((_ sign_extend 32) (currentByte!11839 (_2!11568 lt!387389))) ((_ sign_extend 32) (currentBit!11834 (_2!11568 lt!387389))) (bvsub lt!387391 lt!387387))))

(assert (=> b!248513 (= lt!387386 (validateOffsetBitsIneqLemma!0 (_1!11562 lt!386588) (_2!11568 lt!387389) lt!387391 lt!387387))))

(assert (=> b!248513 (= lt!387387 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248513 (= lt!387391 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248513 (= e!172157 (tuple2!21293 (_1!11568 lt!387382) (_2!11568 lt!387382)))))

(declare-fun b!248514 () Bool)

(assert (=> b!248514 (= e!172158 (= bit!26 (_2!11561 (readBitPure!0 (_1!11562 lt!386588)))))))

(declare-fun b!248515 () Bool)

(assert (=> b!248515 (= e!172154 (tuple2!21293 true (_1!11562 lt!386588)))))

(assert (= (and d!83274 c!11546) b!248515))

(assert (= (and d!83274 (not c!11546)) b!248508))

(assert (= (and b!248508 c!11547) b!248510))

(assert (= (and b!248508 (not c!11547)) b!248513))

(assert (= (and d!83274 res!207999) b!248507))

(assert (= (and b!248507 res!207998) b!248511))

(assert (= (and b!248511 (not res!208000)) b!248509))

(assert (= (and b!248511 res!208002) b!248512))

(assert (= (and b!248512 (not res!208001)) b!248514))

(declare-fun m!374623 () Bool)

(assert (=> b!248513 m!374623))

(declare-fun m!374625 () Bool)

(assert (=> b!248513 m!374625))

(declare-fun m!374627 () Bool)

(assert (=> b!248513 m!374627))

(declare-fun m!374629 () Bool)

(assert (=> d!83274 m!374629))

(declare-fun m!374631 () Bool)

(assert (=> d!83274 m!374631))

(assert (=> b!248509 m!374629))

(assert (=> b!248509 m!374631))

(declare-fun m!374633 () Bool)

(assert (=> b!248508 m!374633))

(declare-fun m!374635 () Bool)

(assert (=> b!248514 m!374635))

(assert (=> d!83176 d!83274))

(declare-fun d!83276 () Bool)

(declare-fun e!172161 () Bool)

(assert (=> d!83276 e!172161))

(declare-fun res!208004 () Bool)

(assert (=> d!83276 (=> (not res!208004) (not e!172161))))

(declare-fun lt!387399 () (_ BitVec 64))

(declare-fun lt!387396 () tuple2!21292)

(assert (=> d!83276 (= res!208004 (bvsge (bvsub lt!387399 from!289) (bitIndex!0 (size!5936 (buf!6423 (_2!11568 lt!387396))) (currentByte!11839 (_2!11568 lt!387396)) (currentBit!11834 (_2!11568 lt!387396)))))))

(assert (=> d!83276 (or (= (bvand lt!387399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387399 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387395 () (_ BitVec 64))

(assert (=> d!83276 (= lt!387399 (bvadd lt!387395 nBits!297))))

(assert (=> d!83276 (or (not (= (bvand lt!387395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387395 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83276 (= lt!387395 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)) (currentBit!11834 (_1!11562 lt!386601))))))

(declare-fun e!172159 () tuple2!21292)

(assert (=> d!83276 (= lt!387396 e!172159)))

(declare-fun c!11548 () Bool)

(assert (=> d!83276 (= c!11548 (= from!289 nBits!297))))

(assert (=> d!83276 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83276 (= (checkBitsLoop!0 (_1!11562 lt!386601) nBits!297 bit!26 from!289) lt!387396)))

(declare-fun b!248516 () Bool)

(declare-fun res!208003 () Bool)

(assert (=> b!248516 (=> (not res!208003) (not e!172161))))

(assert (=> b!248516 (= res!208003 (and (= (buf!6423 (_1!11562 lt!386601)) (buf!6423 (_2!11568 lt!387396))) (or (not (= nBits!297 from!289)) (_1!11568 lt!387396))))))

(declare-fun b!248517 () Bool)

(declare-fun e!172162 () tuple2!21292)

(assert (=> b!248517 (= e!172159 e!172162)))

(declare-fun lt!387400 () tuple2!21292)

(assert (=> b!248517 (= lt!387400 (readBit!0 (_1!11562 lt!386601)))))

(declare-fun c!11549 () Bool)

(assert (=> b!248517 (= c!11549 (not (= (_1!11568 lt!387400) bit!26)))))

(declare-fun b!248518 () Bool)

(declare-fun e!172160 () Bool)

(declare-fun lt!387392 () (_ BitVec 64))

(assert (=> b!248518 (= e!172160 (= (bvsub lt!387392 from!289) (bitIndex!0 (size!5936 (buf!6423 (_2!11568 lt!387396))) (currentByte!11839 (_2!11568 lt!387396)) (currentBit!11834 (_2!11568 lt!387396)))))))

(assert (=> b!248518 (or (= (bvand lt!387392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387392 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387394 () (_ BitVec 64))

(assert (=> b!248518 (= lt!387392 (bvadd lt!387394 nBits!297))))

(assert (=> b!248518 (or (not (= (bvand lt!387394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387394 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248518 (= lt!387394 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)) (currentBit!11834 (_1!11562 lt!386601))))))

(declare-fun b!248519 () Bool)

(assert (=> b!248519 (= e!172162 (tuple2!21293 false (_2!11568 lt!387400)))))

(declare-fun b!248520 () Bool)

(declare-fun res!208007 () Bool)

(assert (=> b!248520 (=> (not res!208007) (not e!172161))))

(assert (=> b!248520 (= res!208007 e!172160)))

(declare-fun res!208005 () Bool)

(assert (=> b!248520 (=> res!208005 e!172160)))

(assert (=> b!248520 (= res!208005 (not (_1!11568 lt!387396)))))

(declare-fun b!248521 () Bool)

(declare-fun e!172163 () Bool)

(assert (=> b!248521 (= e!172161 e!172163)))

(declare-fun res!208006 () Bool)

(assert (=> b!248521 (=> res!208006 e!172163)))

(assert (=> b!248521 (= res!208006 (or (not (_1!11568 lt!387396)) (bvsge from!289 nBits!297)))))

(declare-fun lt!387393 () tuple2!21292)

(declare-fun b!248522 () Bool)

(assert (=> b!248522 (= lt!387393 (checkBitsLoop!0 (_2!11568 lt!387400) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!387401 () Unit!17993)

(declare-fun lt!387397 () Unit!17993)

(assert (=> b!248522 (= lt!387401 lt!387397)))

(declare-fun lt!387402 () (_ BitVec 64))

(declare-fun lt!387398 () (_ BitVec 64))

(assert (=> b!248522 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11568 lt!387400)))) ((_ sign_extend 32) (currentByte!11839 (_2!11568 lt!387400))) ((_ sign_extend 32) (currentBit!11834 (_2!11568 lt!387400))) (bvsub lt!387402 lt!387398))))

(assert (=> b!248522 (= lt!387397 (validateOffsetBitsIneqLemma!0 (_1!11562 lt!386601) (_2!11568 lt!387400) lt!387402 lt!387398))))

(assert (=> b!248522 (= lt!387398 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248522 (= lt!387402 (bvsub nBits!297 from!289))))

(assert (=> b!248522 (= e!172162 (tuple2!21293 (_1!11568 lt!387393) (_2!11568 lt!387393)))))

(declare-fun b!248523 () Bool)

(assert (=> b!248523 (= e!172163 (= bit!26 (_2!11561 (readBitPure!0 (_1!11562 lt!386601)))))))

(declare-fun b!248524 () Bool)

(assert (=> b!248524 (= e!172159 (tuple2!21293 true (_1!11562 lt!386601)))))

(assert (= (and d!83276 c!11548) b!248524))

(assert (= (and d!83276 (not c!11548)) b!248517))

(assert (= (and b!248517 c!11549) b!248519))

(assert (= (and b!248517 (not c!11549)) b!248522))

(assert (= (and d!83276 res!208004) b!248516))

(assert (= (and b!248516 res!208003) b!248520))

(assert (= (and b!248520 (not res!208005)) b!248518))

(assert (= (and b!248520 res!208007) b!248521))

(assert (= (and b!248521 (not res!208006)) b!248523))

(declare-fun m!374637 () Bool)

(assert (=> b!248522 m!374637))

(declare-fun m!374639 () Bool)

(assert (=> b!248522 m!374639))

(declare-fun m!374641 () Bool)

(assert (=> b!248522 m!374641))

(declare-fun m!374643 () Bool)

(assert (=> d!83276 m!374643))

(assert (=> d!83276 m!374317))

(assert (=> b!248518 m!374643))

(assert (=> b!248518 m!374317))

(assert (=> b!248517 m!374415))

(assert (=> b!248523 m!373847))

(assert (=> d!83180 d!83276))

(assert (=> b!248365 d!83198))

(assert (=> b!248365 d!83136))

(declare-fun d!83278 () Bool)

(declare-fun e!172164 () Bool)

(assert (=> d!83278 e!172164))

(declare-fun res!208008 () Bool)

(assert (=> d!83278 (=> (not res!208008) (not e!172164))))

(assert (=> d!83278 (= res!208008 (= (buf!6423 (_2!11560 (increaseBitIndex!0 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))) (buf!6423 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))))

(declare-fun lt!387404 () Bool)

(assert (=> d!83278 (= lt!387404 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))) (currentByte!11839 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387408 () tuple2!21292)

(assert (=> d!83278 (= lt!387408 (tuple2!21293 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))) (currentByte!11839 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11560 (increaseBitIndex!0 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))))

(assert (=> d!83278 (validate_offset_bit!0 ((_ sign_extend 32) (size!5936 (buf!6423 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))) ((_ sign_extend 32) (currentByte!11839 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))) ((_ sign_extend 32) (currentBit!11834 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))))

(assert (=> d!83278 (= (readBit!0 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))) lt!387408)))

(declare-fun lt!387403 () (_ BitVec 64))

(declare-fun lt!387405 () (_ BitVec 64))

(declare-fun b!248525 () Bool)

(assert (=> b!248525 (= e!172164 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 (increaseBitIndex!0 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))) (currentByte!11839 (_2!11560 (increaseBitIndex!0 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))) (currentBit!11834 (_2!11560 (increaseBitIndex!0 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))) (bvadd lt!387405 lt!387403)))))

(assert (=> b!248525 (or (not (= (bvand lt!387405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387403 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387405 lt!387403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248525 (= lt!387403 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248525 (= lt!387405 (bitIndex!0 (size!5936 (buf!6423 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))) (currentByte!11839 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))) (currentBit!11834 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))))

(declare-fun lt!387409 () Bool)

(assert (=> b!248525 (= lt!387409 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))) (currentByte!11839 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387407 () Bool)

(assert (=> b!248525 (= lt!387407 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))) (currentByte!11839 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387406 () Bool)

(assert (=> b!248525 (= lt!387406 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))) (currentByte!11839 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!83278 res!208008) b!248525))

(declare-fun m!374645 () Bool)

(assert (=> d!83278 m!374645))

(declare-fun m!374647 () Bool)

(assert (=> d!83278 m!374647))

(declare-fun m!374649 () Bool)

(assert (=> d!83278 m!374649))

(declare-fun m!374651 () Bool)

(assert (=> d!83278 m!374651))

(declare-fun m!374653 () Bool)

(assert (=> b!248525 m!374653))

(assert (=> b!248525 m!374649))

(declare-fun m!374655 () Bool)

(assert (=> b!248525 m!374655))

(assert (=> b!248525 m!374645))

(assert (=> b!248525 m!374647))

(assert (=> d!83186 d!83278))

(declare-fun d!83280 () Bool)

(assert (=> d!83280 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386591)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21105 () Bool)

(assert (= bs!21105 d!83280))

(assert (=> bs!21105 m!374327))

(assert (=> b!248370 d!83280))

(declare-fun d!83282 () Bool)

(declare-fun e!172165 () Bool)

(assert (=> d!83282 e!172165))

(declare-fun res!208010 () Bool)

(assert (=> d!83282 (=> (not res!208010) (not e!172165))))

(declare-fun lt!387415 () (_ BitVec 64))

(declare-fun lt!387410 () (_ BitVec 64))

(declare-fun lt!387412 () (_ BitVec 64))

(assert (=> d!83282 (= res!208010 (= lt!387412 (bvsub lt!387410 lt!387415)))))

(assert (=> d!83282 (or (= (bvand lt!387410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387410 lt!387415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83282 (= lt!387415 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 lt!387104))) ((_ sign_extend 32) (currentByte!11839 lt!387104)) ((_ sign_extend 32) (currentBit!11834 lt!387104))))))

(declare-fun lt!387414 () (_ BitVec 64))

(declare-fun lt!387413 () (_ BitVec 64))

(assert (=> d!83282 (= lt!387410 (bvmul lt!387414 lt!387413))))

(assert (=> d!83282 (or (= lt!387414 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387413 (bvsdiv (bvmul lt!387414 lt!387413) lt!387414)))))

(assert (=> d!83282 (= lt!387413 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83282 (= lt!387414 ((_ sign_extend 32) (size!5936 (buf!6423 lt!387104))))))

(assert (=> d!83282 (= lt!387412 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 lt!387104)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 lt!387104))))))

(assert (=> d!83282 (invariant!0 (currentBit!11834 lt!387104) (currentByte!11839 lt!387104) (size!5936 (buf!6423 lt!387104)))))

(assert (=> d!83282 (= (bitIndex!0 (size!5936 (buf!6423 lt!387104)) (currentByte!11839 lt!387104) (currentBit!11834 lt!387104)) lt!387412)))

(declare-fun b!248526 () Bool)

(declare-fun res!208009 () Bool)

(assert (=> b!248526 (=> (not res!208009) (not e!172165))))

(assert (=> b!248526 (= res!208009 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387412))))

(declare-fun b!248527 () Bool)

(declare-fun lt!387411 () (_ BitVec 64))

(assert (=> b!248527 (= e!172165 (bvsle lt!387412 (bvmul lt!387411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248527 (or (= lt!387411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387411)))))

(assert (=> b!248527 (= lt!387411 ((_ sign_extend 32) (size!5936 (buf!6423 lt!387104))))))

(assert (= (and d!83282 res!208010) b!248526))

(assert (= (and b!248526 res!208009) b!248527))

(declare-fun m!374657 () Bool)

(assert (=> d!83282 m!374657))

(declare-fun m!374659 () Bool)

(assert (=> d!83282 m!374659))

(assert (=> d!83134 d!83282))

(declare-fun d!83284 () Bool)

(declare-fun e!172166 () Bool)

(assert (=> d!83284 e!172166))

(declare-fun res!208012 () Bool)

(assert (=> d!83284 (=> (not res!208012) (not e!172166))))

(declare-fun lt!387421 () (_ BitVec 64))

(declare-fun lt!387418 () (_ BitVec 64))

(declare-fun lt!387416 () (_ BitVec 64))

(assert (=> d!83284 (= res!208012 (= lt!387418 (bvsub lt!387416 lt!387421)))))

(assert (=> d!83284 (or (= (bvand lt!387416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387416 lt!387421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83284 (= lt!387421 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11562 lt!386601)))) ((_ sign_extend 32) (currentByte!11839 (_1!11562 lt!386601))) ((_ sign_extend 32) (currentBit!11834 (_1!11562 lt!386601)))))))

(declare-fun lt!387420 () (_ BitVec 64))

(declare-fun lt!387419 () (_ BitVec 64))

(assert (=> d!83284 (= lt!387416 (bvmul lt!387420 lt!387419))))

(assert (=> d!83284 (or (= lt!387420 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387419 (bvsdiv (bvmul lt!387420 lt!387419) lt!387420)))))

(assert (=> d!83284 (= lt!387419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83284 (= lt!387420 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11562 lt!386601)))))))

(assert (=> d!83284 (= lt!387418 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11562 lt!386601))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11562 lt!386601)))))))

(assert (=> d!83284 (invariant!0 (currentBit!11834 (_1!11562 lt!386601)) (currentByte!11839 (_1!11562 lt!386601)) (size!5936 (buf!6423 (_1!11562 lt!386601))))))

(assert (=> d!83284 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)) (currentBit!11834 (_1!11562 lt!386601))) lt!387418)))

(declare-fun b!248528 () Bool)

(declare-fun res!208011 () Bool)

(assert (=> b!248528 (=> (not res!208011) (not e!172166))))

(assert (=> b!248528 (= res!208011 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387418))))

(declare-fun b!248529 () Bool)

(declare-fun lt!387417 () (_ BitVec 64))

(assert (=> b!248529 (= e!172166 (bvsle lt!387418 (bvmul lt!387417 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248529 (or (= lt!387417 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387417 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387417)))))

(assert (=> b!248529 (= lt!387417 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11562 lt!386601)))))))

(assert (= (and d!83284 res!208012) b!248528))

(assert (= (and b!248528 res!208011) b!248529))

(declare-fun m!374661 () Bool)

(assert (=> d!83284 m!374661))

(declare-fun m!374663 () Bool)

(assert (=> d!83284 m!374663))

(assert (=> d!83134 d!83284))

(declare-fun d!83286 () Bool)

(declare-fun lt!387437 () (_ BitVec 32))

(assert (=> d!83286 (= lt!387437 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387436 () (_ BitVec 32))

(assert (=> d!83286 (= lt!387436 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!172171 () Bool)

(assert (=> d!83286 e!172171))

(declare-fun res!208017 () Bool)

(assert (=> d!83286 (=> (not res!208017) (not e!172171))))

(assert (=> d!83286 (= res!208017 (moveBitIndexPrecond!0 (_1!11562 lt!386601) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!18003 () Unit!17993)

(declare-fun Unit!18004 () Unit!17993)

(declare-fun Unit!18005 () Unit!17993)

(assert (=> d!83286 (= (moveBitIndex!0 (_1!11562 lt!386601) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11834 (_1!11562 lt!386601)) lt!387437) #b00000000000000000000000000000000) (tuple2!21277 Unit!18003 (BitStream!10795 (buf!6423 (_1!11562 lt!386601)) (bvsub (bvadd (currentByte!11839 (_1!11562 lt!386601)) lt!387436) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!387437 (currentBit!11834 (_1!11562 lt!386601))))) (ite (bvsge (bvadd (currentBit!11834 (_1!11562 lt!386601)) lt!387437) #b00000000000000000000000000001000) (tuple2!21277 Unit!18004 (BitStream!10795 (buf!6423 (_1!11562 lt!386601)) (bvadd (currentByte!11839 (_1!11562 lt!386601)) lt!387436 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11834 (_1!11562 lt!386601)) lt!387437) #b00000000000000000000000000001000))) (tuple2!21277 Unit!18005 (BitStream!10795 (buf!6423 (_1!11562 lt!386601)) (bvadd (currentByte!11839 (_1!11562 lt!386601)) lt!387436) (bvadd (currentBit!11834 (_1!11562 lt!386601)) lt!387437))))))))

(declare-fun b!248534 () Bool)

(declare-fun e!172172 () Bool)

(assert (=> b!248534 (= e!172171 e!172172)))

(declare-fun res!208018 () Bool)

(assert (=> b!248534 (=> (not res!208018) (not e!172172))))

(declare-fun lt!387438 () (_ BitVec 64))

(declare-fun lt!387435 () tuple2!21276)

(assert (=> b!248534 (= res!208018 (= (bvadd lt!387438 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!387435))) (currentByte!11839 (_2!11560 lt!387435)) (currentBit!11834 (_2!11560 lt!387435)))))))

(assert (=> b!248534 (or (not (= (bvand lt!387438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387438 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248534 (= lt!387438 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)) (currentBit!11834 (_1!11562 lt!386601))))))

(declare-fun lt!387434 () (_ BitVec 32))

(declare-fun lt!387439 () (_ BitVec 32))

(declare-fun Unit!18006 () Unit!17993)

(declare-fun Unit!18007 () Unit!17993)

(declare-fun Unit!18008 () Unit!17993)

(assert (=> b!248534 (= lt!387435 (ite (bvslt (bvadd (currentBit!11834 (_1!11562 lt!386601)) lt!387434) #b00000000000000000000000000000000) (tuple2!21277 Unit!18006 (BitStream!10795 (buf!6423 (_1!11562 lt!386601)) (bvsub (bvadd (currentByte!11839 (_1!11562 lt!386601)) lt!387439) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!387434 (currentBit!11834 (_1!11562 lt!386601))))) (ite (bvsge (bvadd (currentBit!11834 (_1!11562 lt!386601)) lt!387434) #b00000000000000000000000000001000) (tuple2!21277 Unit!18007 (BitStream!10795 (buf!6423 (_1!11562 lt!386601)) (bvadd (currentByte!11839 (_1!11562 lt!386601)) lt!387439 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11834 (_1!11562 lt!386601)) lt!387434) #b00000000000000000000000000001000))) (tuple2!21277 Unit!18008 (BitStream!10795 (buf!6423 (_1!11562 lt!386601)) (bvadd (currentByte!11839 (_1!11562 lt!386601)) lt!387439) (bvadd (currentBit!11834 (_1!11562 lt!386601)) lt!387434))))))))

(assert (=> b!248534 (= lt!387434 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248534 (= lt!387439 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!248535 () Bool)

(assert (=> b!248535 (= e!172172 (and (= (size!5936 (buf!6423 (_1!11562 lt!386601))) (size!5936 (buf!6423 (_2!11560 lt!387435)))) (= (buf!6423 (_1!11562 lt!386601)) (buf!6423 (_2!11560 lt!387435)))))))

(assert (= (and d!83286 res!208017) b!248534))

(assert (= (and b!248534 res!208018) b!248535))

(assert (=> d!83286 m!374321))

(declare-fun m!374665 () Bool)

(assert (=> b!248534 m!374665))

(assert (=> b!248534 m!374317))

(assert (=> d!83134 d!83286))

(declare-fun d!83290 () Bool)

(declare-fun res!208021 () Bool)

(declare-fun e!172175 () Bool)

(assert (=> d!83290 (=> (not res!208021) (not e!172175))))

(assert (=> d!83290 (= res!208021 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11562 lt!386601))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11562 lt!386601))))))))))

(assert (=> d!83290 (= (moveBitIndexPrecond!0 (_1!11562 lt!386601) #b0000000000000000000000000000000000000000000000000000000000000001) e!172175)))

(declare-fun b!248539 () Bool)

(declare-fun lt!387442 () (_ BitVec 64))

(assert (=> b!248539 (= e!172175 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387442) (bvsle lt!387442 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11562 lt!386601))))))))))

(assert (=> b!248539 (= lt!387442 (bvadd (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!386601))) (currentByte!11839 (_1!11562 lt!386601)) (currentBit!11834 (_1!11562 lt!386601))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!83290 res!208021) b!248539))

(assert (=> b!248539 m!374317))

(assert (=> d!83134 d!83290))

(assert (=> d!83150 d!83252))

(declare-fun d!83292 () Bool)

(declare-fun e!172176 () Bool)

(assert (=> d!83292 e!172176))

(declare-fun res!208022 () Bool)

(assert (=> d!83292 (=> (not res!208022) (not e!172176))))

(assert (=> d!83292 (= res!208022 (= (buf!6423 (_2!11560 (increaseBitIndex!0 lt!386599))) (buf!6423 lt!386599)))))

(declare-fun lt!387444 () Bool)

(assert (=> d!83292 (= lt!387444 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 lt!386599)) (currentByte!11839 lt!386599))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 lt!386599)))) #b00000000000000000000000000000000)))))

(declare-fun lt!387448 () tuple2!21292)

(assert (=> d!83292 (= lt!387448 (tuple2!21293 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 lt!386599)) (currentByte!11839 lt!386599))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 lt!386599)))) #b00000000000000000000000000000000)) (_2!11560 (increaseBitIndex!0 lt!386599))))))

(assert (=> d!83292 (validate_offset_bit!0 ((_ sign_extend 32) (size!5936 (buf!6423 lt!386599))) ((_ sign_extend 32) (currentByte!11839 lt!386599)) ((_ sign_extend 32) (currentBit!11834 lt!386599)))))

(assert (=> d!83292 (= (readBit!0 lt!386599) lt!387448)))

(declare-fun lt!387443 () (_ BitVec 64))

(declare-fun b!248540 () Bool)

(declare-fun lt!387445 () (_ BitVec 64))

(assert (=> b!248540 (= e!172176 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 (increaseBitIndex!0 lt!386599)))) (currentByte!11839 (_2!11560 (increaseBitIndex!0 lt!386599))) (currentBit!11834 (_2!11560 (increaseBitIndex!0 lt!386599)))) (bvadd lt!387445 lt!387443)))))

(assert (=> b!248540 (or (not (= (bvand lt!387445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387443 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387445 lt!387443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248540 (= lt!387443 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248540 (= lt!387445 (bitIndex!0 (size!5936 (buf!6423 lt!386599)) (currentByte!11839 lt!386599) (currentBit!11834 lt!386599)))))

(declare-fun lt!387449 () Bool)

(assert (=> b!248540 (= lt!387449 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 lt!386599)) (currentByte!11839 lt!386599))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 lt!386599)))) #b00000000000000000000000000000000)))))

(declare-fun lt!387447 () Bool)

(assert (=> b!248540 (= lt!387447 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 lt!386599)) (currentByte!11839 lt!386599))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 lt!386599)))) #b00000000000000000000000000000000)))))

(declare-fun lt!387446 () Bool)

(assert (=> b!248540 (= lt!387446 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 lt!386599)) (currentByte!11839 lt!386599))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 lt!386599)))) #b00000000000000000000000000000000)))))

(assert (= (and d!83292 res!208022) b!248540))

(declare-fun m!374667 () Bool)

(assert (=> d!83292 m!374667))

(declare-fun m!374669 () Bool)

(assert (=> d!83292 m!374669))

(declare-fun m!374671 () Bool)

(assert (=> d!83292 m!374671))

(declare-fun m!374673 () Bool)

(assert (=> d!83292 m!374673))

(declare-fun m!374675 () Bool)

(assert (=> b!248540 m!374675))

(assert (=> b!248540 m!374671))

(declare-fun m!374677 () Bool)

(assert (=> b!248540 m!374677))

(assert (=> b!248540 m!374667))

(assert (=> b!248540 m!374669))

(assert (=> d!83156 d!83292))

(assert (=> d!83190 d!83254))

(declare-fun d!83294 () Bool)

(declare-fun res!208023 () Bool)

(declare-fun e!172178 () Bool)

(assert (=> d!83294 (=> (not res!208023) (not e!172178))))

(assert (=> d!83294 (= res!208023 (= (size!5936 (buf!6423 (_1!11562 lt!387258))) (size!5936 (buf!6423 (_2!11562 lt!387258)))))))

(assert (=> d!83294 (= (isPrefixOf!0 (_1!11562 lt!387258) (_2!11562 lt!387258)) e!172178)))

(declare-fun b!248541 () Bool)

(declare-fun res!208024 () Bool)

(assert (=> b!248541 (=> (not res!208024) (not e!172178))))

(assert (=> b!248541 (= res!208024 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!387258))) (currentByte!11839 (_1!11562 lt!387258)) (currentBit!11834 (_1!11562 lt!387258))) (bitIndex!0 (size!5936 (buf!6423 (_2!11562 lt!387258))) (currentByte!11839 (_2!11562 lt!387258)) (currentBit!11834 (_2!11562 lt!387258)))))))

(declare-fun b!248542 () Bool)

(declare-fun e!172177 () Bool)

(assert (=> b!248542 (= e!172178 e!172177)))

(declare-fun res!208025 () Bool)

(assert (=> b!248542 (=> res!208025 e!172177)))

(assert (=> b!248542 (= res!208025 (= (size!5936 (buf!6423 (_1!11562 lt!387258))) #b00000000000000000000000000000000))))

(declare-fun b!248543 () Bool)

(assert (=> b!248543 (= e!172177 (arrayBitRangesEq!0 (buf!6423 (_1!11562 lt!387258)) (buf!6423 (_2!11562 lt!387258)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_1!11562 lt!387258))) (currentByte!11839 (_1!11562 lt!387258)) (currentBit!11834 (_1!11562 lt!387258)))))))

(assert (= (and d!83294 res!208023) b!248541))

(assert (= (and b!248541 res!208024) b!248542))

(assert (= (and b!248542 (not res!208025)) b!248543))

(assert (=> b!248541 m!374551))

(declare-fun m!374679 () Bool)

(assert (=> b!248541 m!374679))

(assert (=> b!248543 m!374551))

(assert (=> b!248543 m!374551))

(declare-fun m!374681 () Bool)

(assert (=> b!248543 m!374681))

(assert (=> d!83190 d!83294))

(declare-fun d!83296 () Bool)

(declare-fun res!208026 () Bool)

(declare-fun e!172180 () Bool)

(assert (=> d!83296 (=> (not res!208026) (not e!172180))))

(assert (=> d!83296 (= res!208026 (= (size!5936 (buf!6423 thiss!1005)) (size!5936 (buf!6423 thiss!1005))))))

(assert (=> d!83296 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!172180)))

(declare-fun b!248544 () Bool)

(declare-fun res!208027 () Bool)

(assert (=> b!248544 (=> (not res!208027) (not e!172180))))

(assert (=> b!248544 (= res!208027 (bvsle (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)) (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(declare-fun b!248545 () Bool)

(declare-fun e!172179 () Bool)

(assert (=> b!248545 (= e!172180 e!172179)))

(declare-fun res!208028 () Bool)

(assert (=> b!248545 (=> res!208028 e!172179)))

(assert (=> b!248545 (= res!208028 (= (size!5936 (buf!6423 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248546 () Bool)

(assert (=> b!248546 (= e!172179 (arrayBitRangesEq!0 (buf!6423 thiss!1005) (buf!6423 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(assert (= (and d!83296 res!208026) b!248544))

(assert (= (and b!248544 res!208027) b!248545))

(assert (= (and b!248545 (not res!208028)) b!248546))

(assert (=> b!248544 m!373883))

(assert (=> b!248544 m!373883))

(assert (=> b!248546 m!373883))

(assert (=> b!248546 m!373883))

(declare-fun m!374683 () Bool)

(assert (=> b!248546 m!374683))

(assert (=> d!83190 d!83296))

(declare-fun d!83298 () Bool)

(declare-fun res!208029 () Bool)

(declare-fun e!172182 () Bool)

(assert (=> d!83298 (=> (not res!208029) (not e!172182))))

(assert (=> d!83298 (= res!208029 (= (size!5936 (buf!6423 lt!387263)) (size!5936 (buf!6423 lt!387263))))))

(assert (=> d!83298 (= (isPrefixOf!0 lt!387263 lt!387263) e!172182)))

(declare-fun b!248547 () Bool)

(declare-fun res!208030 () Bool)

(assert (=> b!248547 (=> (not res!208030) (not e!172182))))

(assert (=> b!248547 (= res!208030 (bvsle (bitIndex!0 (size!5936 (buf!6423 lt!387263)) (currentByte!11839 lt!387263) (currentBit!11834 lt!387263)) (bitIndex!0 (size!5936 (buf!6423 lt!387263)) (currentByte!11839 lt!387263) (currentBit!11834 lt!387263))))))

(declare-fun b!248548 () Bool)

(declare-fun e!172181 () Bool)

(assert (=> b!248548 (= e!172182 e!172181)))

(declare-fun res!208031 () Bool)

(assert (=> b!248548 (=> res!208031 e!172181)))

(assert (=> b!248548 (= res!208031 (= (size!5936 (buf!6423 lt!387263)) #b00000000000000000000000000000000))))

(declare-fun b!248549 () Bool)

(assert (=> b!248549 (= e!172181 (arrayBitRangesEq!0 (buf!6423 lt!387263) (buf!6423 lt!387263) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 lt!387263)) (currentByte!11839 lt!387263) (currentBit!11834 lt!387263))))))

(assert (= (and d!83298 res!208029) b!248547))

(assert (= (and b!248547 res!208030) b!248548))

(assert (= (and b!248548 (not res!208031)) b!248549))

(declare-fun m!374685 () Bool)

(assert (=> b!248547 m!374685))

(assert (=> b!248547 m!374685))

(assert (=> b!248549 m!374685))

(assert (=> b!248549 m!374685))

(declare-fun m!374687 () Bool)

(assert (=> b!248549 m!374687))

(assert (=> d!83190 d!83298))

(declare-fun d!83300 () Bool)

(assert (=> d!83300 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!387450 () Unit!17993)

(assert (=> d!83300 (= lt!387450 (choose!11 thiss!1005))))

(assert (=> d!83300 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!387450)))

(declare-fun bs!21106 () Bool)

(assert (= bs!21106 d!83300))

(assert (=> bs!21106 m!374443))

(declare-fun m!374689 () Bool)

(assert (=> bs!21106 m!374689))

(assert (=> d!83190 d!83300))

(declare-fun d!83302 () Bool)

(assert (=> d!83302 (isPrefixOf!0 lt!387263 (_2!11560 lt!386606))))

(declare-fun lt!387451 () Unit!17993)

(assert (=> d!83302 (= lt!387451 (choose!30 lt!387263 thiss!1005 (_2!11560 lt!386606)))))

(assert (=> d!83302 (isPrefixOf!0 lt!387263 thiss!1005)))

(assert (=> d!83302 (= (lemmaIsPrefixTransitive!0 lt!387263 thiss!1005 (_2!11560 lt!386606)) lt!387451)))

(declare-fun bs!21107 () Bool)

(assert (= bs!21107 d!83302))

(assert (=> bs!21107 m!374449))

(declare-fun m!374691 () Bool)

(assert (=> bs!21107 m!374691))

(declare-fun m!374693 () Bool)

(assert (=> bs!21107 m!374693))

(assert (=> d!83190 d!83302))

(assert (=> d!83190 d!83166))

(declare-fun d!83304 () Bool)

(assert (=> d!83304 (isPrefixOf!0 lt!387263 (_2!11560 lt!386606))))

(declare-fun lt!387452 () Unit!17993)

(assert (=> d!83304 (= lt!387452 (choose!30 lt!387263 (_2!11560 lt!386606) (_2!11560 lt!386606)))))

(assert (=> d!83304 (isPrefixOf!0 lt!387263 (_2!11560 lt!386606))))

(assert (=> d!83304 (= (lemmaIsPrefixTransitive!0 lt!387263 (_2!11560 lt!386606) (_2!11560 lt!386606)) lt!387452)))

(declare-fun bs!21108 () Bool)

(assert (= bs!21108 d!83304))

(assert (=> bs!21108 m!374449))

(declare-fun m!374695 () Bool)

(assert (=> bs!21108 m!374695))

(assert (=> bs!21108 m!374449))

(assert (=> d!83190 d!83304))

(declare-fun d!83306 () Bool)

(assert (=> d!83306 (isPrefixOf!0 lt!387263 lt!387263)))

(declare-fun lt!387453 () Unit!17993)

(assert (=> d!83306 (= lt!387453 (choose!11 lt!387263))))

(assert (=> d!83306 (= (lemmaIsPrefixRefl!0 lt!387263) lt!387453)))

(declare-fun bs!21109 () Bool)

(assert (= bs!21109 d!83306))

(assert (=> bs!21109 m!374451))

(declare-fun m!374697 () Bool)

(assert (=> bs!21109 m!374697))

(assert (=> d!83190 d!83306))

(assert (=> d!83190 d!83268))

(declare-fun d!83308 () Bool)

(declare-fun res!208032 () Bool)

(declare-fun e!172184 () Bool)

(assert (=> d!83308 (=> (not res!208032) (not e!172184))))

(assert (=> d!83308 (= res!208032 (= (size!5936 (buf!6423 lt!387263)) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(assert (=> d!83308 (= (isPrefixOf!0 lt!387263 (_2!11560 lt!386606)) e!172184)))

(declare-fun b!248550 () Bool)

(declare-fun res!208033 () Bool)

(assert (=> b!248550 (=> (not res!208033) (not e!172184))))

(assert (=> b!248550 (= res!208033 (bvsle (bitIndex!0 (size!5936 (buf!6423 lt!387263)) (currentByte!11839 lt!387263) (currentBit!11834 lt!387263)) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606)))))))

(declare-fun b!248551 () Bool)

(declare-fun e!172183 () Bool)

(assert (=> b!248551 (= e!172184 e!172183)))

(declare-fun res!208034 () Bool)

(assert (=> b!248551 (=> res!208034 e!172183)))

(assert (=> b!248551 (= res!208034 (= (size!5936 (buf!6423 lt!387263)) #b00000000000000000000000000000000))))

(declare-fun b!248552 () Bool)

(assert (=> b!248552 (= e!172183 (arrayBitRangesEq!0 (buf!6423 lt!387263) (buf!6423 (_2!11560 lt!386606)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 lt!387263)) (currentByte!11839 lt!387263) (currentBit!11834 lt!387263))))))

(assert (= (and d!83308 res!208032) b!248550))

(assert (= (and b!248550 res!208033) b!248551))

(assert (= (and b!248551 (not res!208034)) b!248552))

(assert (=> b!248550 m!374685))

(assert (=> b!248550 m!373889))

(assert (=> b!248552 m!374685))

(assert (=> b!248552 m!374685))

(declare-fun m!374699 () Bool)

(assert (=> b!248552 m!374699))

(assert (=> d!83190 d!83308))

(declare-fun d!83310 () Bool)

(declare-fun e!172185 () Bool)

(assert (=> d!83310 e!172185))

(declare-fun res!208036 () Bool)

(assert (=> d!83310 (=> (not res!208036) (not e!172185))))

(declare-fun lt!387456 () (_ BitVec 64))

(declare-fun lt!387454 () (_ BitVec 64))

(declare-fun lt!387459 () (_ BitVec 64))

(assert (=> d!83310 (= res!208036 (= lt!387456 (bvsub lt!387454 lt!387459)))))

(assert (=> d!83310 (or (= (bvand lt!387454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387454 lt!387459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83310 (= lt!387459 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387202)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!387202))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!387202)))))))

(declare-fun lt!387458 () (_ BitVec 64))

(declare-fun lt!387457 () (_ BitVec 64))

(assert (=> d!83310 (= lt!387454 (bvmul lt!387458 lt!387457))))

(assert (=> d!83310 (or (= lt!387458 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387457 (bvsdiv (bvmul lt!387458 lt!387457) lt!387458)))))

(assert (=> d!83310 (= lt!387457 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83310 (= lt!387458 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387202)))))))

(assert (=> d!83310 (= lt!387456 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!387202))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!387202)))))))

(assert (=> d!83310 (invariant!0 (currentBit!11834 (_2!11560 lt!387202)) (currentByte!11839 (_2!11560 lt!387202)) (size!5936 (buf!6423 (_2!11560 lt!387202))))))

(assert (=> d!83310 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!387202))) (currentByte!11839 (_2!11560 lt!387202)) (currentBit!11834 (_2!11560 lt!387202))) lt!387456)))

(declare-fun b!248553 () Bool)

(declare-fun res!208035 () Bool)

(assert (=> b!248553 (=> (not res!208035) (not e!172185))))

(assert (=> b!248553 (= res!208035 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387456))))

(declare-fun b!248554 () Bool)

(declare-fun lt!387455 () (_ BitVec 64))

(assert (=> b!248554 (= e!172185 (bvsle lt!387456 (bvmul lt!387455 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248554 (or (= lt!387455 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387455 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387455)))))

(assert (=> b!248554 (= lt!387455 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387202)))))))

(assert (= (and d!83310 res!208036) b!248553))

(assert (= (and b!248553 res!208035) b!248554))

(declare-fun m!374701 () Bool)

(assert (=> d!83310 m!374701))

(declare-fun m!374703 () Bool)

(assert (=> d!83310 m!374703))

(assert (=> b!248345 d!83310))

(assert (=> b!248345 d!83138))

(assert (=> d!83138 d!83220))

(declare-fun d!83312 () Bool)

(assert (=> d!83312 (= (invariant!0 (currentBit!11834 (_2!11560 lt!386591)) (currentByte!11839 (_2!11560 lt!386591)) (size!5936 (buf!6423 (_2!11560 lt!386591)))) (and (bvsge (currentBit!11834 (_2!11560 lt!386591)) #b00000000000000000000000000000000) (bvslt (currentBit!11834 (_2!11560 lt!386591)) #b00000000000000000000000000001000) (bvsge (currentByte!11839 (_2!11560 lt!386591)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11839 (_2!11560 lt!386591)) (size!5936 (buf!6423 (_2!11560 lt!386591)))) (and (= (currentBit!11834 (_2!11560 lt!386591)) #b00000000000000000000000000000000) (= (currentByte!11839 (_2!11560 lt!386591)) (size!5936 (buf!6423 (_2!11560 lt!386591))))))))))

(assert (=> d!83138 d!83312))

(declare-fun d!83314 () Bool)

(declare-fun e!172186 () Bool)

(assert (=> d!83314 e!172186))

(declare-fun res!208037 () Bool)

(assert (=> d!83314 (=> (not res!208037) (not e!172186))))

(declare-fun lt!387460 () BitStream!10794)

(declare-fun lt!387461 () (_ BitVec 64))

(assert (=> d!83314 (= res!208037 (= (bvadd lt!387461 (bvsub lt!387182 lt!387167)) (bitIndex!0 (size!5936 (buf!6423 lt!387460)) (currentByte!11839 lt!387460) (currentBit!11834 lt!387460))))))

(assert (=> d!83314 (or (not (= (bvand lt!387461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387182 lt!387167) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387461 (bvsub lt!387182 lt!387167)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83314 (= lt!387461 (bitIndex!0 (size!5936 (buf!6423 (_2!11562 lt!387165))) (currentByte!11839 (_2!11562 lt!387165)) (currentBit!11834 (_2!11562 lt!387165))))))

(assert (=> d!83314 (= lt!387460 (_2!11560 (moveBitIndex!0 (_2!11562 lt!387165) (bvsub lt!387182 lt!387167))))))

(assert (=> d!83314 (moveBitIndexPrecond!0 (_2!11562 lt!387165) (bvsub lt!387182 lt!387167))))

(assert (=> d!83314 (= (withMovedBitIndex!0 (_2!11562 lt!387165) (bvsub lt!387182 lt!387167)) lt!387460)))

(declare-fun b!248555 () Bool)

(assert (=> b!248555 (= e!172186 (= (size!5936 (buf!6423 (_2!11562 lt!387165))) (size!5936 (buf!6423 lt!387460))))))

(assert (= (and d!83314 res!208037) b!248555))

(declare-fun m!374705 () Bool)

(assert (=> d!83314 m!374705))

(assert (=> d!83314 m!374529))

(declare-fun m!374707 () Bool)

(assert (=> d!83314 m!374707))

(declare-fun m!374709 () Bool)

(assert (=> d!83314 m!374709))

(assert (=> b!248332 d!83314))

(assert (=> b!248332 d!83136))

(assert (=> b!248332 d!83138))

(declare-fun d!83316 () Bool)

(assert (=> d!83316 (= (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386606))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386606)))) (bvsub (bvmul ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386606))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386606))))))))

(assert (=> d!83136 d!83316))

(declare-fun d!83318 () Bool)

(assert (=> d!83318 (= (invariant!0 (currentBit!11834 (_2!11560 lt!386606)) (currentByte!11839 (_2!11560 lt!386606)) (size!5936 (buf!6423 (_2!11560 lt!386606)))) (and (bvsge (currentBit!11834 (_2!11560 lt!386606)) #b00000000000000000000000000000000) (bvslt (currentBit!11834 (_2!11560 lt!386606)) #b00000000000000000000000000001000) (bvsge (currentByte!11839 (_2!11560 lt!386606)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11839 (_2!11560 lt!386606)) (size!5936 (buf!6423 (_2!11560 lt!386606)))) (and (= (currentBit!11834 (_2!11560 lt!386606)) #b00000000000000000000000000000000) (= (currentByte!11839 (_2!11560 lt!386606)) (size!5936 (buf!6423 (_2!11560 lt!386606))))))))))

(assert (=> d!83136 d!83318))

(assert (=> d!83164 d!83174))

(declare-fun d!83320 () Bool)

(assert (=> d!83320 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!83320 true))

(declare-fun _$6!403 () Unit!17993)

(assert (=> d!83320 (= (choose!9 thiss!1005 (buf!6423 (_2!11560 lt!386606)) (bvsub nBits!297 from!289) (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))) _$6!403)))

(declare-fun bs!21110 () Bool)

(assert (= bs!21110 d!83320))

(assert (=> bs!21110 m!373875))

(assert (=> d!83164 d!83320))

(declare-fun d!83322 () Bool)

(assert (=> d!83322 (= (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386600)))) ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386600))) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386600)))) (bvsub (bvmul ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386600)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386600))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386600))))))))

(assert (=> d!83188 d!83322))

(declare-fun d!83324 () Bool)

(assert (=> d!83324 (= (invariant!0 (currentBit!11834 (_1!11561 lt!386600)) (currentByte!11839 (_1!11561 lt!386600)) (size!5936 (buf!6423 (_1!11561 lt!386600)))) (and (bvsge (currentBit!11834 (_1!11561 lt!386600)) #b00000000000000000000000000000000) (bvslt (currentBit!11834 (_1!11561 lt!386600)) #b00000000000000000000000000001000) (bvsge (currentByte!11839 (_1!11561 lt!386600)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11839 (_1!11561 lt!386600)) (size!5936 (buf!6423 (_1!11561 lt!386600)))) (and (= (currentBit!11834 (_1!11561 lt!386600)) #b00000000000000000000000000000000) (= (currentByte!11839 (_1!11561 lt!386600)) (size!5936 (buf!6423 (_1!11561 lt!386600))))))))))

(assert (=> d!83188 d!83324))

(declare-fun lt!387462 () tuple2!21292)

(declare-fun d!83326 () Bool)

(assert (=> d!83326 (= lt!387462 (checkBitsLoop!0 (_1!11562 lt!387203) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83326 (= (checkBitsLoopPure!0 (_1!11562 lt!387203) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21279 (_2!11568 lt!387462) (_1!11568 lt!387462)))))

(declare-fun bs!21111 () Bool)

(assert (= bs!21111 d!83326))

(declare-fun m!374711 () Bool)

(assert (=> bs!21111 m!374711))

(assert (=> b!248347 d!83326))

(declare-fun d!83328 () Bool)

(assert (=> d!83328 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387202)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!387201) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387202)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591)))) lt!387201))))

(declare-fun bs!21112 () Bool)

(assert (= bs!21112 d!83328))

(declare-fun m!374713 () Bool)

(assert (=> bs!21112 m!374713))

(assert (=> b!248347 d!83328))

(declare-fun d!83330 () Bool)

(assert (=> d!83330 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!387202)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!387201)))

(declare-fun lt!387463 () Unit!17993)

(assert (=> d!83330 (= lt!387463 (choose!9 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!387202)) lt!387201 (BitStream!10795 (buf!6423 (_2!11560 lt!387202)) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))))))

(assert (=> d!83330 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!387202)) lt!387201) lt!387463)))

(declare-fun bs!21113 () Bool)

(assert (= bs!21113 d!83330))

(assert (=> bs!21113 m!374371))

(declare-fun m!374715 () Bool)

(assert (=> bs!21113 m!374715))

(assert (=> b!248347 d!83330))

(declare-fun lt!387467 () (_ BitVec 64))

(declare-fun b!248556 () Bool)

(declare-fun lt!387482 () (_ BitVec 64))

(declare-fun e!172188 () Bool)

(declare-fun lt!387465 () tuple2!21280)

(assert (=> b!248556 (= e!172188 (= (_1!11562 lt!387465) (withMovedBitIndex!0 (_2!11562 lt!387465) (bvsub lt!387482 lt!387467))))))

(assert (=> b!248556 (or (= (bvand lt!387482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387482 lt!387467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248556 (= lt!387467 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!387202))) (currentByte!11839 (_2!11560 lt!387202)) (currentBit!11834 (_2!11560 lt!387202))))))

(assert (=> b!248556 (= lt!387482 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))))))

(declare-fun b!248558 () Bool)

(declare-fun e!172187 () Unit!17993)

(declare-fun Unit!18009 () Unit!17993)

(assert (=> b!248558 (= e!172187 Unit!18009)))

(declare-fun b!248559 () Bool)

(declare-fun res!208039 () Bool)

(assert (=> b!248559 (=> (not res!208039) (not e!172188))))

(assert (=> b!248559 (= res!208039 (isPrefixOf!0 (_2!11562 lt!387465) (_2!11560 lt!387202)))))

(declare-fun b!248560 () Bool)

(declare-fun res!208038 () Bool)

(assert (=> b!248560 (=> (not res!208038) (not e!172188))))

(assert (=> b!248560 (= res!208038 (isPrefixOf!0 (_1!11562 lt!387465) (_2!11560 lt!386591)))))

(declare-fun b!248557 () Bool)

(declare-fun lt!387481 () Unit!17993)

(assert (=> b!248557 (= e!172187 lt!387481)))

(declare-fun lt!387483 () (_ BitVec 64))

(assert (=> b!248557 (= lt!387483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!387464 () (_ BitVec 64))

(assert (=> b!248557 (= lt!387464 (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))))))

(assert (=> b!248557 (= lt!387481 (arrayBitRangesEqSymmetric!0 (buf!6423 (_2!11560 lt!386591)) (buf!6423 (_2!11560 lt!387202)) lt!387483 lt!387464))))

(assert (=> b!248557 (arrayBitRangesEq!0 (buf!6423 (_2!11560 lt!387202)) (buf!6423 (_2!11560 lt!386591)) lt!387483 lt!387464)))

(declare-fun d!83332 () Bool)

(assert (=> d!83332 e!172188))

(declare-fun res!208040 () Bool)

(assert (=> d!83332 (=> (not res!208040) (not e!172188))))

(assert (=> d!83332 (= res!208040 (isPrefixOf!0 (_1!11562 lt!387465) (_2!11562 lt!387465)))))

(declare-fun lt!387470 () BitStream!10794)

(assert (=> d!83332 (= lt!387465 (tuple2!21281 lt!387470 (_2!11560 lt!387202)))))

(declare-fun lt!387477 () Unit!17993)

(declare-fun lt!387469 () Unit!17993)

(assert (=> d!83332 (= lt!387477 lt!387469)))

(assert (=> d!83332 (isPrefixOf!0 lt!387470 (_2!11560 lt!387202))))

(assert (=> d!83332 (= lt!387469 (lemmaIsPrefixTransitive!0 lt!387470 (_2!11560 lt!387202) (_2!11560 lt!387202)))))

(declare-fun lt!387474 () Unit!17993)

(declare-fun lt!387475 () Unit!17993)

(assert (=> d!83332 (= lt!387474 lt!387475)))

(assert (=> d!83332 (isPrefixOf!0 lt!387470 (_2!11560 lt!387202))))

(assert (=> d!83332 (= lt!387475 (lemmaIsPrefixTransitive!0 lt!387470 (_2!11560 lt!386591) (_2!11560 lt!387202)))))

(declare-fun lt!387468 () Unit!17993)

(assert (=> d!83332 (= lt!387468 e!172187)))

(declare-fun c!11550 () Bool)

(assert (=> d!83332 (= c!11550 (not (= (size!5936 (buf!6423 (_2!11560 lt!386591))) #b00000000000000000000000000000000)))))

(declare-fun lt!387480 () Unit!17993)

(declare-fun lt!387472 () Unit!17993)

(assert (=> d!83332 (= lt!387480 lt!387472)))

(assert (=> d!83332 (isPrefixOf!0 (_2!11560 lt!387202) (_2!11560 lt!387202))))

(assert (=> d!83332 (= lt!387472 (lemmaIsPrefixRefl!0 (_2!11560 lt!387202)))))

(declare-fun lt!387473 () Unit!17993)

(declare-fun lt!387466 () Unit!17993)

(assert (=> d!83332 (= lt!387473 lt!387466)))

(assert (=> d!83332 (= lt!387466 (lemmaIsPrefixRefl!0 (_2!11560 lt!387202)))))

(declare-fun lt!387478 () Unit!17993)

(declare-fun lt!387471 () Unit!17993)

(assert (=> d!83332 (= lt!387478 lt!387471)))

(assert (=> d!83332 (isPrefixOf!0 lt!387470 lt!387470)))

(assert (=> d!83332 (= lt!387471 (lemmaIsPrefixRefl!0 lt!387470))))

(declare-fun lt!387476 () Unit!17993)

(declare-fun lt!387479 () Unit!17993)

(assert (=> d!83332 (= lt!387476 lt!387479)))

(assert (=> d!83332 (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!386591))))

(assert (=> d!83332 (= lt!387479 (lemmaIsPrefixRefl!0 (_2!11560 lt!386591)))))

(assert (=> d!83332 (= lt!387470 (BitStream!10795 (buf!6423 (_2!11560 lt!387202)) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))))))

(assert (=> d!83332 (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 lt!387202))))

(assert (=> d!83332 (= (reader!0 (_2!11560 lt!386591) (_2!11560 lt!387202)) lt!387465)))

(assert (= (and d!83332 c!11550) b!248557))

(assert (= (and d!83332 (not c!11550)) b!248558))

(assert (= (and d!83332 res!208040) b!248560))

(assert (= (and b!248560 res!208038) b!248559))

(assert (= (and b!248559 res!208039) b!248556))

(declare-fun m!374717 () Bool)

(assert (=> b!248560 m!374717))

(declare-fun m!374719 () Bool)

(assert (=> d!83332 m!374719))

(assert (=> d!83332 m!374339))

(declare-fun m!374721 () Bool)

(assert (=> d!83332 m!374721))

(declare-fun m!374723 () Bool)

(assert (=> d!83332 m!374723))

(declare-fun m!374725 () Bool)

(assert (=> d!83332 m!374725))

(assert (=> d!83332 m!374379))

(declare-fun m!374727 () Bool)

(assert (=> d!83332 m!374727))

(declare-fun m!374729 () Bool)

(assert (=> d!83332 m!374729))

(assert (=> d!83332 m!374351))

(declare-fun m!374731 () Bool)

(assert (=> d!83332 m!374731))

(declare-fun m!374733 () Bool)

(assert (=> d!83332 m!374733))

(declare-fun m!374735 () Bool)

(assert (=> b!248556 m!374735))

(assert (=> b!248556 m!374367))

(assert (=> b!248556 m!373881))

(declare-fun m!374737 () Bool)

(assert (=> b!248559 m!374737))

(assert (=> b!248557 m!373881))

(declare-fun m!374739 () Bool)

(assert (=> b!248557 m!374739))

(declare-fun m!374741 () Bool)

(assert (=> b!248557 m!374741))

(assert (=> b!248347 d!83332))

(declare-fun d!83334 () Bool)

(assert (=> d!83334 (= (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386604)))) ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386604))) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386604)))) (bvsub (bvmul ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!386604)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!386604))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!386604))))))))

(assert (=> d!83184 d!83334))

(declare-fun d!83336 () Bool)

(assert (=> d!83336 (= (invariant!0 (currentBit!11834 (_1!11561 lt!386604)) (currentByte!11839 (_1!11561 lt!386604)) (size!5936 (buf!6423 (_1!11561 lt!386604)))) (and (bvsge (currentBit!11834 (_1!11561 lt!386604)) #b00000000000000000000000000000000) (bvslt (currentBit!11834 (_1!11561 lt!386604)) #b00000000000000000000000000001000) (bvsge (currentByte!11839 (_1!11561 lt!386604)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11839 (_1!11561 lt!386604)) (size!5936 (buf!6423 (_1!11561 lt!386604)))) (and (= (currentBit!11834 (_1!11561 lt!386604)) #b00000000000000000000000000000000) (= (currentByte!11839 (_1!11561 lt!386604)) (size!5936 (buf!6423 (_1!11561 lt!386604))))))))))

(assert (=> d!83184 d!83336))

(declare-fun b!248569 () Bool)

(declare-fun e!172196 () Bool)

(declare-fun _$23!24 () tuple2!21276)

(assert (=> b!248569 (= e!172196 (array_inv!5677 (buf!6423 (_2!11560 _$23!24))))))

(declare-fun d!83338 () Bool)

(declare-fun e!172197 () Bool)

(assert (=> d!83338 e!172197))

(declare-fun res!208049 () Bool)

(assert (=> d!83338 (=> (not res!208049) (not e!172197))))

(assert (=> d!83338 (= res!208049 (= (size!5936 (buf!6423 (_2!11560 lt!386591))) (size!5936 (buf!6423 (_2!11560 _$23!24)))))))

(assert (=> d!83338 (and (inv!12 (_2!11560 _$23!24)) e!172196)))

(assert (=> d!83338 (= (choose!51 (_2!11560 lt!386591) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) _$23!24)))

(declare-fun b!248570 () Bool)

(declare-fun res!208048 () Bool)

(assert (=> b!248570 (=> (not res!208048) (not e!172197))))

(assert (=> b!248570 (= res!208048 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 _$23!24))) (currentByte!11839 (_2!11560 _$23!24)) (currentBit!11834 (_2!11560 _$23!24))) (bvadd (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386591))) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))))

(declare-fun b!248571 () Bool)

(declare-fun res!208047 () Bool)

(assert (=> b!248571 (=> (not res!208047) (not e!172197))))

(assert (=> b!248571 (= res!208047 (isPrefixOf!0 (_2!11560 lt!386591) (_2!11560 _$23!24)))))

(declare-fun b!248572 () Bool)

(declare-fun lt!387496 () tuple2!21278)

(declare-fun lt!387495 () tuple2!21280)

(assert (=> b!248572 (= e!172197 (and (_2!11561 lt!387496) (= (_1!11561 lt!387496) (_2!11562 lt!387495))))))

(assert (=> b!248572 (= lt!387496 (checkBitsLoopPure!0 (_1!11562 lt!387495) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!387497 () Unit!17993)

(declare-fun lt!387494 () Unit!17993)

(assert (=> b!248572 (= lt!387497 lt!387494)))

(declare-fun lt!387498 () (_ BitVec 64))

(assert (=> b!248572 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 _$23!24)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!387498)))

(assert (=> b!248572 (= lt!387494 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11560 lt!386591) (buf!6423 (_2!11560 _$23!24)) lt!387498))))

(assert (=> b!248572 (= lt!387498 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248572 (= lt!387495 (reader!0 (_2!11560 lt!386591) (_2!11560 _$23!24)))))

(assert (= d!83338 b!248569))

(assert (= (and d!83338 res!208049) b!248570))

(assert (= (and b!248570 res!208048) b!248571))

(assert (= (and b!248571 res!208047) b!248572))

(declare-fun m!374743 () Bool)

(assert (=> d!83338 m!374743))

(declare-fun m!374745 () Bool)

(assert (=> b!248569 m!374745))

(declare-fun m!374747 () Bool)

(assert (=> b!248570 m!374747))

(assert (=> b!248570 m!373881))

(declare-fun m!374749 () Bool)

(assert (=> b!248571 m!374749))

(declare-fun m!374751 () Bool)

(assert (=> b!248572 m!374751))

(declare-fun m!374753 () Bool)

(assert (=> b!248572 m!374753))

(declare-fun m!374755 () Bool)

(assert (=> b!248572 m!374755))

(declare-fun m!374757 () Bool)

(assert (=> b!248572 m!374757))

(assert (=> d!83154 d!83338))

(declare-fun d!83340 () Bool)

(declare-fun e!172198 () Bool)

(assert (=> d!83340 e!172198))

(declare-fun res!208050 () Bool)

(assert (=> d!83340 (=> (not res!208050) (not e!172198))))

(declare-fun lt!387500 () (_ BitVec 64))

(declare-fun lt!387499 () BitStream!10794)

(assert (=> d!83340 (= res!208050 (= (bvadd lt!387500 (bvsub lt!387275 lt!387260)) (bitIndex!0 (size!5936 (buf!6423 lt!387499)) (currentByte!11839 lt!387499) (currentBit!11834 lt!387499))))))

(assert (=> d!83340 (or (not (= (bvand lt!387500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387275 lt!387260) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387500 (bvsub lt!387275 lt!387260)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83340 (= lt!387500 (bitIndex!0 (size!5936 (buf!6423 (_2!11562 lt!387258))) (currentByte!11839 (_2!11562 lt!387258)) (currentBit!11834 (_2!11562 lt!387258))))))

(assert (=> d!83340 (= lt!387499 (_2!11560 (moveBitIndex!0 (_2!11562 lt!387258) (bvsub lt!387275 lt!387260))))))

(assert (=> d!83340 (moveBitIndexPrecond!0 (_2!11562 lt!387258) (bvsub lt!387275 lt!387260))))

(assert (=> d!83340 (= (withMovedBitIndex!0 (_2!11562 lt!387258) (bvsub lt!387275 lt!387260)) lt!387499)))

(declare-fun b!248573 () Bool)

(assert (=> b!248573 (= e!172198 (= (size!5936 (buf!6423 (_2!11562 lt!387258))) (size!5936 (buf!6423 lt!387499))))))

(assert (= (and d!83340 res!208050) b!248573))

(declare-fun m!374759 () Bool)

(assert (=> d!83340 m!374759))

(assert (=> d!83340 m!374679))

(declare-fun m!374761 () Bool)

(assert (=> d!83340 m!374761))

(declare-fun m!374763 () Bool)

(assert (=> d!83340 m!374763))

(assert (=> b!248375 d!83340))

(assert (=> b!248375 d!83136))

(assert (=> b!248375 d!83198))

(assert (=> d!83158 d!83172))

(declare-fun d!83342 () Bool)

(assert (=> d!83342 (validate_offset_bits!1 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 (_2!11560 lt!386591))) ((_ sign_extend 32) (currentBit!11834 (_2!11560 lt!386591))) lt!386598)))

(assert (=> d!83342 true))

(declare-fun _$6!404 () Unit!17993)

(assert (=> d!83342 (= (choose!9 (_2!11560 lt!386591) (buf!6423 (_2!11560 lt!386606)) lt!386598 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 (_2!11560 lt!386591)) (currentBit!11834 (_2!11560 lt!386591)))) _$6!404)))

(declare-fun bs!21114 () Bool)

(assert (= bs!21114 d!83342))

(assert (=> bs!21114 m!373861))

(assert (=> d!83158 d!83342))

(declare-fun d!83344 () Bool)

(declare-fun res!208051 () Bool)

(declare-fun e!172200 () Bool)

(assert (=> d!83344 (=> (not res!208051) (not e!172200))))

(assert (=> d!83344 (= res!208051 (= (size!5936 (buf!6423 (_2!11562 lt!387258))) (size!5936 (buf!6423 (_2!11560 lt!386606)))))))

(assert (=> d!83344 (= (isPrefixOf!0 (_2!11562 lt!387258) (_2!11560 lt!386606)) e!172200)))

(declare-fun b!248574 () Bool)

(declare-fun res!208052 () Bool)

(assert (=> b!248574 (=> (not res!208052) (not e!172200))))

(assert (=> b!248574 (= res!208052 (bvsle (bitIndex!0 (size!5936 (buf!6423 (_2!11562 lt!387258))) (currentByte!11839 (_2!11562 lt!387258)) (currentBit!11834 (_2!11562 lt!387258))) (bitIndex!0 (size!5936 (buf!6423 (_2!11560 lt!386606))) (currentByte!11839 (_2!11560 lt!386606)) (currentBit!11834 (_2!11560 lt!386606)))))))

(declare-fun b!248575 () Bool)

(declare-fun e!172199 () Bool)

(assert (=> b!248575 (= e!172200 e!172199)))

(declare-fun res!208053 () Bool)

(assert (=> b!248575 (=> res!208053 e!172199)))

(assert (=> b!248575 (= res!208053 (= (size!5936 (buf!6423 (_2!11562 lt!387258))) #b00000000000000000000000000000000))))

(declare-fun b!248576 () Bool)

(assert (=> b!248576 (= e!172199 (arrayBitRangesEq!0 (buf!6423 (_2!11562 lt!387258)) (buf!6423 (_2!11560 lt!386606)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 (_2!11562 lt!387258))) (currentByte!11839 (_2!11562 lt!387258)) (currentBit!11834 (_2!11562 lt!387258)))))))

(assert (= (and d!83344 res!208051) b!248574))

(assert (= (and b!248574 res!208052) b!248575))

(assert (= (and b!248575 (not res!208053)) b!248576))

(assert (=> b!248574 m!374679))

(assert (=> b!248574 m!373889))

(assert (=> b!248576 m!374679))

(assert (=> b!248576 m!374679))

(declare-fun m!374765 () Bool)

(assert (=> b!248576 m!374765))

(assert (=> b!248378 d!83344))

(declare-fun d!83346 () Bool)

(declare-fun e!172201 () Bool)

(assert (=> d!83346 e!172201))

(declare-fun res!208055 () Bool)

(assert (=> d!83346 (=> (not res!208055) (not e!172201))))

(declare-fun lt!387501 () (_ BitVec 64))

(declare-fun lt!387503 () (_ BitVec 64))

(declare-fun lt!387506 () (_ BitVec 64))

(assert (=> d!83346 (= res!208055 (= lt!387503 (bvsub lt!387501 lt!387506)))))

(assert (=> d!83346 (or (= (bvand lt!387501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387506 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387501 lt!387506) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83346 (= lt!387506 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!387230)))) ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!387230))) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!387230)))))))

(declare-fun lt!387505 () (_ BitVec 64))

(declare-fun lt!387504 () (_ BitVec 64))

(assert (=> d!83346 (= lt!387501 (bvmul lt!387505 lt!387504))))

(assert (=> d!83346 (or (= lt!387505 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387504 (bvsdiv (bvmul lt!387505 lt!387504) lt!387505)))))

(assert (=> d!83346 (= lt!387504 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83346 (= lt!387505 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!387230)))))))

(assert (=> d!83346 (= lt!387503 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!387230))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!387230)))))))

(assert (=> d!83346 (invariant!0 (currentBit!11834 (_1!11561 lt!387230)) (currentByte!11839 (_1!11561 lt!387230)) (size!5936 (buf!6423 (_1!11561 lt!387230))))))

(assert (=> d!83346 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!387230))) (currentByte!11839 (_1!11561 lt!387230)) (currentBit!11834 (_1!11561 lt!387230))) lt!387503)))

(declare-fun b!248577 () Bool)

(declare-fun res!208054 () Bool)

(assert (=> b!248577 (=> (not res!208054) (not e!172201))))

(assert (=> b!248577 (= res!208054 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387503))))

(declare-fun b!248578 () Bool)

(declare-fun lt!387502 () (_ BitVec 64))

(assert (=> b!248578 (= e!172201 (bvsle lt!387503 (bvmul lt!387502 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248578 (or (= lt!387502 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387502 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387502)))))

(assert (=> b!248578 (= lt!387502 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!387230)))))))

(assert (= (and d!83346 res!208055) b!248577))

(assert (= (and b!248577 res!208054) b!248578))

(declare-fun m!374767 () Bool)

(assert (=> d!83346 m!374767))

(declare-fun m!374769 () Bool)

(assert (=> d!83346 m!374769))

(assert (=> d!83162 d!83346))

(declare-fun d!83348 () Bool)

(assert (=> d!83348 (= (invariant!0 (currentBit!11834 lt!386599) (currentByte!11839 lt!386599) (size!5936 (buf!6423 (_2!11560 lt!386606)))) (and (bvsge (currentBit!11834 lt!386599) #b00000000000000000000000000000000) (bvslt (currentBit!11834 lt!386599) #b00000000000000000000000000001000) (bvsge (currentByte!11839 lt!386599) #b00000000000000000000000000000000) (or (bvslt (currentByte!11839 lt!386599) (size!5936 (buf!6423 (_2!11560 lt!386606)))) (and (= (currentBit!11834 lt!386599) #b00000000000000000000000000000000) (= (currentByte!11839 lt!386599) (size!5936 (buf!6423 (_2!11560 lt!386606))))))))))

(assert (=> d!83162 d!83348))

(declare-fun d!83350 () Bool)

(declare-fun lt!387507 () tuple2!21292)

(assert (=> d!83350 (= lt!387507 (readBit!0 lt!387231))))

(assert (=> d!83350 (= (readBitPure!0 lt!387231) (tuple2!21279 (_2!11568 lt!387507) (_1!11568 lt!387507)))))

(declare-fun bs!21115 () Bool)

(assert (= bs!21115 d!83350))

(declare-fun m!374771 () Bool)

(assert (=> bs!21115 m!374771))

(assert (=> d!83162 d!83350))

(declare-fun d!83352 () Bool)

(declare-fun e!172204 () Bool)

(assert (=> d!83352 e!172204))

(declare-fun res!208058 () Bool)

(assert (=> d!83352 (=> (not res!208058) (not e!172204))))

(declare-fun lt!387514 () tuple2!21278)

(declare-fun lt!387515 () tuple2!21278)

(assert (=> d!83352 (= res!208058 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!387514))) (currentByte!11839 (_1!11561 lt!387514)) (currentBit!11834 (_1!11561 lt!387514))) (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!387515))) (currentByte!11839 (_1!11561 lt!387515)) (currentBit!11834 (_1!11561 lt!387515)))))))

(declare-fun lt!387516 () BitStream!10794)

(assert (=> d!83352 (= lt!387515 (readBitPure!0 lt!387516))))

(assert (=> d!83352 (= lt!387514 (readBitPure!0 lt!386599))))

(assert (=> d!83352 (= lt!387516 (BitStream!10795 (buf!6423 (_2!11560 lt!386606)) (currentByte!11839 lt!386599) (currentBit!11834 lt!386599)))))

(assert (=> d!83352 (invariant!0 (currentBit!11834 lt!386599) (currentByte!11839 lt!386599) (size!5936 (buf!6423 (_2!11560 lt!386606))))))

(assert (=> d!83352 true))

(declare-fun _$9!96 () Unit!17993)

(assert (=> d!83352 (= (choose!50 lt!386599 (_2!11560 lt!386606) lt!387231 lt!387230 (tuple2!21279 (_1!11561 lt!387230) (_2!11561 lt!387230)) (_1!11561 lt!387230) (_2!11561 lt!387230) lt!387233 (tuple2!21279 (_1!11561 lt!387233) (_2!11561 lt!387233)) (_1!11561 lt!387233) (_2!11561 lt!387233)) _$9!96)))

(declare-fun b!248581 () Bool)

(assert (=> b!248581 (= e!172204 (= (_2!11561 lt!387514) (_2!11561 lt!387515)))))

(assert (= (and d!83352 res!208058) b!248581))

(declare-fun m!374773 () Bool)

(assert (=> d!83352 m!374773))

(assert (=> d!83352 m!374403))

(declare-fun m!374775 () Bool)

(assert (=> d!83352 m!374775))

(declare-fun m!374777 () Bool)

(assert (=> d!83352 m!374777))

(assert (=> d!83352 m!373865))

(assert (=> d!83162 d!83352))

(declare-fun d!83354 () Bool)

(declare-fun e!172205 () Bool)

(assert (=> d!83354 e!172205))

(declare-fun res!208060 () Bool)

(assert (=> d!83354 (=> (not res!208060) (not e!172205))))

(declare-fun lt!387517 () (_ BitVec 64))

(declare-fun lt!387522 () (_ BitVec 64))

(declare-fun lt!387519 () (_ BitVec 64))

(assert (=> d!83354 (= res!208060 (= lt!387519 (bvsub lt!387517 lt!387522)))))

(assert (=> d!83354 (or (= (bvand lt!387517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387522 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387517 lt!387522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83354 (= lt!387522 (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!387233)))) ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!387233))) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!387233)))))))

(declare-fun lt!387521 () (_ BitVec 64))

(declare-fun lt!387520 () (_ BitVec 64))

(assert (=> d!83354 (= lt!387517 (bvmul lt!387521 lt!387520))))

(assert (=> d!83354 (or (= lt!387521 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387520 (bvsdiv (bvmul lt!387521 lt!387520) lt!387521)))))

(assert (=> d!83354 (= lt!387520 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83354 (= lt!387521 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!387233)))))))

(assert (=> d!83354 (= lt!387519 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 (_1!11561 lt!387233))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 (_1!11561 lt!387233)))))))

(assert (=> d!83354 (invariant!0 (currentBit!11834 (_1!11561 lt!387233)) (currentByte!11839 (_1!11561 lt!387233)) (size!5936 (buf!6423 (_1!11561 lt!387233))))))

(assert (=> d!83354 (= (bitIndex!0 (size!5936 (buf!6423 (_1!11561 lt!387233))) (currentByte!11839 (_1!11561 lt!387233)) (currentBit!11834 (_1!11561 lt!387233))) lt!387519)))

(declare-fun b!248582 () Bool)

(declare-fun res!208059 () Bool)

(assert (=> b!248582 (=> (not res!208059) (not e!172205))))

(assert (=> b!248582 (= res!208059 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387519))))

(declare-fun b!248583 () Bool)

(declare-fun lt!387518 () (_ BitVec 64))

(assert (=> b!248583 (= e!172205 (bvsle lt!387519 (bvmul lt!387518 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248583 (or (= lt!387518 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387518 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387518)))))

(assert (=> b!248583 (= lt!387518 ((_ sign_extend 32) (size!5936 (buf!6423 (_1!11561 lt!387233)))))))

(assert (= (and d!83354 res!208060) b!248582))

(assert (= (and b!248582 res!208059) b!248583))

(declare-fun m!374779 () Bool)

(assert (=> d!83354 m!374779))

(declare-fun m!374781 () Bool)

(assert (=> d!83354 m!374781))

(assert (=> d!83162 d!83354))

(assert (=> d!83162 d!83156))

(assert (=> d!83128 d!83312))

(assert (=> b!248358 d!83244))

(assert (=> b!248358 d!83198))

(assert (=> b!248312 d!83198))

(assert (=> b!248312 d!83138))

(declare-fun d!83356 () Bool)

(declare-fun lt!387523 () tuple2!21292)

(assert (=> d!83356 (= lt!387523 (readBit!0 (readerFrom!0 (_2!11560 lt!387219) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))))

(assert (=> d!83356 (= (readBitPure!0 (readerFrom!0 (_2!11560 lt!387219) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))) (tuple2!21279 (_2!11568 lt!387523) (_1!11568 lt!387523)))))

(declare-fun bs!21116 () Bool)

(assert (= bs!21116 d!83356))

(assert (=> bs!21116 m!374389))

(declare-fun m!374783 () Bool)

(assert (=> bs!21116 m!374783))

(assert (=> b!248360 d!83356))

(declare-fun d!83358 () Bool)

(declare-fun e!172206 () Bool)

(assert (=> d!83358 e!172206))

(declare-fun res!208061 () Bool)

(assert (=> d!83358 (=> (not res!208061) (not e!172206))))

(assert (=> d!83358 (= res!208061 (invariant!0 (currentBit!11834 (_2!11560 lt!387219)) (currentByte!11839 (_2!11560 lt!387219)) (size!5936 (buf!6423 (_2!11560 lt!387219)))))))

(assert (=> d!83358 (= (readerFrom!0 (_2!11560 lt!387219) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)) (BitStream!10795 (buf!6423 (_2!11560 lt!387219)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)))))

(declare-fun b!248584 () Bool)

(assert (=> b!248584 (= e!172206 (invariant!0 (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005) (size!5936 (buf!6423 (_2!11560 lt!387219)))))))

(assert (= (and d!83358 res!208061) b!248584))

(assert (=> d!83358 m!374579))

(declare-fun m!374785 () Bool)

(assert (=> b!248584 m!374785))

(assert (=> b!248360 d!83358))

(declare-fun b!248585 () Bool)

(declare-fun e!172209 () Bool)

(declare-fun e!172208 () Bool)

(assert (=> b!248585 (= e!172209 e!172208)))

(declare-fun res!208066 () Bool)

(declare-fun call!3943 () Bool)

(assert (=> b!248585 (= res!208066 call!3943)))

(assert (=> b!248585 (=> (not res!208066) (not e!172208))))

(declare-fun d!83360 () Bool)

(declare-fun res!208064 () Bool)

(declare-fun e!172211 () Bool)

(assert (=> d!83360 (=> res!208064 e!172211)))

(assert (=> d!83360 (= res!208064 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(assert (=> d!83360 (= (arrayBitRangesEq!0 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!386591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))) e!172211)))

(declare-fun b!248586 () Bool)

(declare-fun e!172207 () Bool)

(assert (=> b!248586 (= e!172207 e!172209)))

(declare-fun c!11551 () Bool)

(declare-fun lt!387525 () tuple4!284)

(assert (=> b!248586 (= c!11551 (= (_3!922 lt!387525) (_4!142 lt!387525)))))

(declare-fun b!248587 () Bool)

(declare-fun lt!387526 () (_ BitVec 32))

(declare-fun e!172212 () Bool)

(assert (=> b!248587 (= e!172212 (byteRangesEq!0 (select (arr!6923 (buf!6423 thiss!1005)) (_4!142 lt!387525)) (select (arr!6923 (buf!6423 (_2!11560 lt!386591))) (_4!142 lt!387525)) #b00000000000000000000000000000000 lt!387526))))

(declare-fun b!248588 () Bool)

(declare-fun e!172210 () Bool)

(assert (=> b!248588 (= e!172210 (arrayRangesEq!919 (buf!6423 thiss!1005) (buf!6423 (_2!11560 lt!386591)) (_1!11569 lt!387525) (_2!11569 lt!387525)))))

(declare-fun b!248589 () Bool)

(assert (=> b!248589 (= e!172209 call!3943)))

(declare-fun b!248590 () Bool)

(assert (=> b!248590 (= e!172211 e!172207)))

(declare-fun res!208062 () Bool)

(assert (=> b!248590 (=> (not res!208062) (not e!172207))))

(assert (=> b!248590 (= res!208062 e!172210)))

(declare-fun res!208063 () Bool)

(assert (=> b!248590 (=> res!208063 e!172210)))

(assert (=> b!248590 (= res!208063 (bvsge (_1!11569 lt!387525) (_2!11569 lt!387525)))))

(assert (=> b!248590 (= lt!387526 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387524 () (_ BitVec 32))

(assert (=> b!248590 (= lt!387524 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248590 (= lt!387525 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5936 (buf!6423 thiss!1005)) (currentByte!11839 thiss!1005) (currentBit!11834 thiss!1005))))))

(declare-fun bm!3940 () Bool)

(assert (=> bm!3940 (= call!3943 (byteRangesEq!0 (select (arr!6923 (buf!6423 thiss!1005)) (_3!922 lt!387525)) (select (arr!6923 (buf!6423 (_2!11560 lt!386591))) (_3!922 lt!387525)) lt!387524 (ite c!11551 lt!387526 #b00000000000000000000000000001000)))))

(declare-fun b!248591 () Bool)

(declare-fun res!208065 () Bool)

(assert (=> b!248591 (= res!208065 (= lt!387526 #b00000000000000000000000000000000))))

(assert (=> b!248591 (=> res!208065 e!172212)))

(assert (=> b!248591 (= e!172208 e!172212)))

(assert (= (and d!83360 (not res!208064)) b!248590))

(assert (= (and b!248590 (not res!208063)) b!248588))

(assert (= (and b!248590 res!208062) b!248586))

(assert (= (and b!248586 c!11551) b!248589))

(assert (= (and b!248586 (not c!11551)) b!248585))

(assert (= (and b!248585 res!208066) b!248591))

(assert (= (and b!248591 (not res!208065)) b!248587))

(assert (= (or b!248589 b!248585) bm!3940))

(declare-fun m!374787 () Bool)

(assert (=> b!248587 m!374787))

(declare-fun m!374789 () Bool)

(assert (=> b!248587 m!374789))

(assert (=> b!248587 m!374787))

(assert (=> b!248587 m!374789))

(declare-fun m!374791 () Bool)

(assert (=> b!248587 m!374791))

(declare-fun m!374793 () Bool)

(assert (=> b!248588 m!374793))

(assert (=> b!248590 m!373883))

(assert (=> b!248590 m!374477))

(declare-fun m!374795 () Bool)

(assert (=> bm!3940 m!374795))

(declare-fun m!374797 () Bool)

(assert (=> bm!3940 m!374797))

(assert (=> bm!3940 m!374795))

(assert (=> bm!3940 m!374797))

(declare-fun m!374799 () Bool)

(assert (=> bm!3940 m!374799))

(assert (=> b!248314 d!83360))

(assert (=> b!248314 d!83198))

(assert (=> d!83144 d!83234))

(declare-fun d!83362 () Bool)

(assert (=> d!83362 (= (remainingBits!0 ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) ((_ sign_extend 32) (currentByte!11839 thiss!1005)) ((_ sign_extend 32) (currentBit!11834 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!5936 (buf!6423 (_2!11560 lt!386606)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11839 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11834 thiss!1005)))))))

(assert (=> d!83174 d!83362))

(declare-fun d!83364 () Bool)

(declare-fun e!172213 () Bool)

(assert (=> d!83364 e!172213))

(declare-fun res!208067 () Bool)

(assert (=> d!83364 (=> (not res!208067) (not e!172213))))

(assert (=> d!83364 (= res!208067 (= (buf!6423 (_2!11560 (increaseBitIndex!0 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))) (buf!6423 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))))

(declare-fun lt!387528 () Bool)

(assert (=> d!83364 (= lt!387528 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))) (currentByte!11839 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387532 () tuple2!21292)

(assert (=> d!83364 (= lt!387532 (tuple2!21293 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))) (currentByte!11839 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11560 (increaseBitIndex!0 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))))))

(assert (=> d!83364 (validate_offset_bit!0 ((_ sign_extend 32) (size!5936 (buf!6423 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))) ((_ sign_extend 32) (currentByte!11839 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))) ((_ sign_extend 32) (currentBit!11834 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))))

(assert (=> d!83364 (= (readBit!0 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))) lt!387532)))

(declare-fun lt!387527 () (_ BitVec 64))

(declare-fun lt!387529 () (_ BitVec 64))

(declare-fun b!248592 () Bool)

(assert (=> b!248592 (= e!172213 (= (bitIndex!0 (size!5936 (buf!6423 (_2!11560 (increaseBitIndex!0 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))) (currentByte!11839 (_2!11560 (increaseBitIndex!0 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))) (currentBit!11834 (_2!11560 (increaseBitIndex!0 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))) (bvadd lt!387529 lt!387527)))))

(assert (=> b!248592 (or (not (= (bvand lt!387529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387527 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387529 lt!387527) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248592 (= lt!387527 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248592 (= lt!387529 (bitIndex!0 (size!5936 (buf!6423 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))) (currentByte!11839 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))) (currentBit!11834 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))))

(declare-fun lt!387533 () Bool)

(assert (=> b!248592 (= lt!387533 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))) (currentByte!11839 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387531 () Bool)

(assert (=> b!248592 (= lt!387531 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))) (currentByte!11839 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387530 () Bool)

(assert (=> b!248592 (= lt!387530 (not (= (bvand ((_ sign_extend 24) (select (arr!6923 (buf!6423 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))) (currentByte!11839 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11834 (readerFrom!0 (_2!11560 lt!386591) (currentBit!11834 thiss!1005) (currentByte!11839 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!83364 res!208067) b!248592))

(assert (=> d!83364 m!373885))

(declare-fun m!374801 () Bool)

(assert (=> d!83364 m!374801))

(declare-fun m!374803 () Bool)

(assert (=> d!83364 m!374803))

(declare-fun m!374805 () Bool)

(assert (=> d!83364 m!374805))

(declare-fun m!374807 () Bool)

(assert (=> d!83364 m!374807))

(declare-fun m!374809 () Bool)

(assert (=> b!248592 m!374809))

(assert (=> b!248592 m!374805))

(declare-fun m!374811 () Bool)

(assert (=> b!248592 m!374811))

(assert (=> b!248592 m!373885))

(assert (=> b!248592 m!374801))

(assert (=> b!248592 m!374803))

(assert (=> d!83126 d!83364))

(assert (=> d!83192 d!83250))

(check-sat (not b!248492) (not b!248484) (not b!248498) (not d!83328) (not d!83216) (not b!248444) (not b!248459) (not b!248433) (not d!83352) (not d!83330) (not b!248474) (not b!248451) (not b!248522) (not d!83202) (not b!248477) (not d!83280) (not d!83338) (not b!248442) (not b!248540) (not d!83356) (not d!83304) (not b!248441) (not b!248446) (not b!248473) (not d!83228) (not b!248570) (not d!83342) (not bm!3936) (not b!248501) (not b!248497) (not d!83242) (not b!248514) (not d!83244) (not d!83320) (not b!248590) (not b!248495) (not b!248458) (not b!248438) (not b!248489) (not b!248574) (not b!248454) (not d!83276) (not d!83238) (not d!83332) (not b!248525) (not b!248428) (not d!83208) (not d!83284) (not b!248434) (not d!83310) (not d!83274) (not d!83306) (not d!83278) (not b!248402) (not b!248557) (not b!248517) (not d!83300) (not b!248476) (not b!248544) (not b!248503) (not b!248556) (not b!248552) (not d!83254) (not b!248518) (not d!83214) (not d!83286) (not b!248587) (not d!83292) (not b!248452) (not d!83270) (not d!83258) (not b!248560) (not d!83364) (not b!248534) (not d!83210) (not b!248576) (not b!248572) (not b!248408) (not d!83326) (not d!83302) (not b!248508) (not d!83272) (not d!83212) (not d!83340) (not d!83346) (not b!248549) (not b!248461) (not b!248592) (not bm!3938) (not d!83240) (not d!83282) (not b!248491) (not b!248448) (not d!83204) (not b!248569) (not b!248571) (not bm!3937) (not d!83260) (not b!248584) (not b!248509) (not bm!3939) (not b!248475) (not b!248500) (not b!248404) (not bm!3940) (not b!248401) (not b!248504) (not b!248547) (not b!248559) (not b!248485) (not d!83350) (not b!248546) (not b!248541) (not b!248588) (not d!83354) (not b!248456) (not b!248436) (not b!248429) (not b!248523) (not b!248550) (not d!83358) (not b!248513) (not b!248487) (not b!248506) (not b!248494) (not d!83314) (not b!248543) (not b!248539))
(check-sat)
