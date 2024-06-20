; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53092 () Bool)

(assert start!53092)

(declare-fun b!245845 () Bool)

(declare-fun res!205610 () Bool)

(declare-fun e!170315 () Bool)

(assert (=> b!245845 (=> (not res!205610) (not e!170315))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!245845 (= res!205610 (bvslt from!289 nBits!297))))

(declare-fun b!245846 () Bool)

(declare-fun e!170316 () Bool)

(declare-datatypes ((array!13420 0))(
  ( (array!13421 (arr!6869 (Array (_ BitVec 32) (_ BitVec 8))) (size!5882 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10686 0))(
  ( (BitStream!10687 (buf!6363 array!13420) (currentByte!11759 (_ BitVec 32)) (currentBit!11754 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21072 0))(
  ( (tuple2!21073 (_1!11458 BitStream!10686) (_2!11458 Bool)) )
))
(declare-fun lt!383617 () tuple2!21072)

(declare-datatypes ((tuple2!21074 0))(
  ( (tuple2!21075 (_1!11459 BitStream!10686) (_2!11459 BitStream!10686)) )
))
(declare-fun lt!383608 () tuple2!21074)

(assert (=> b!245846 (= e!170316 (not (or (not (_2!11458 lt!383617)) (not (= (_1!11458 lt!383617) (_2!11459 lt!383608))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10686 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21072)

(assert (=> b!245846 (= lt!383617 (checkBitsLoopPure!0 (_1!11459 lt!383608) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!17876 0))(
  ( (Unit!17877) )
))
(declare-datatypes ((tuple2!21076 0))(
  ( (tuple2!21077 (_1!11460 Unit!17876) (_2!11460 BitStream!10686)) )
))
(declare-fun lt!383618 () tuple2!21076)

(declare-fun lt!383628 () tuple2!21076)

(declare-fun lt!383621 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245846 (validate_offset_bits!1 ((_ sign_extend 32) (size!5882 (buf!6363 (_2!11460 lt!383618)))) ((_ sign_extend 32) (currentByte!11759 (_2!11460 lt!383628))) ((_ sign_extend 32) (currentBit!11754 (_2!11460 lt!383628))) lt!383621)))

(declare-fun lt!383625 () Unit!17876)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10686 array!13420 (_ BitVec 64)) Unit!17876)

(assert (=> b!245846 (= lt!383625 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11460 lt!383628) (buf!6363 (_2!11460 lt!383618)) lt!383621))))

(declare-fun reader!0 (BitStream!10686 BitStream!10686) tuple2!21074)

(assert (=> b!245846 (= lt!383608 (reader!0 (_2!11460 lt!383628) (_2!11460 lt!383618)))))

(declare-fun b!245847 () Bool)

(declare-fun res!205601 () Bool)

(assert (=> b!245847 (=> (not res!205601) (not e!170316))))

(declare-fun isPrefixOf!0 (BitStream!10686 BitStream!10686) Bool)

(assert (=> b!245847 (= res!205601 (isPrefixOf!0 (_2!11460 lt!383628) (_2!11460 lt!383618)))))

(declare-fun res!205599 () Bool)

(assert (=> start!53092 (=> (not res!205599) (not e!170315))))

(assert (=> start!53092 (= res!205599 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53092 e!170315))

(assert (=> start!53092 true))

(declare-fun thiss!1005 () BitStream!10686)

(declare-fun e!170318 () Bool)

(declare-fun inv!12 (BitStream!10686) Bool)

(assert (=> start!53092 (and (inv!12 thiss!1005) e!170318)))

(declare-fun b!245848 () Bool)

(declare-fun res!205606 () Bool)

(assert (=> b!245848 (=> (not res!205606) (not e!170315))))

(assert (=> b!245848 (= res!205606 (validate_offset_bits!1 ((_ sign_extend 32) (size!5882 (buf!6363 thiss!1005))) ((_ sign_extend 32) (currentByte!11759 thiss!1005)) ((_ sign_extend 32) (currentBit!11754 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!245849 () Bool)

(declare-fun res!205602 () Bool)

(declare-fun e!170317 () Bool)

(assert (=> b!245849 (=> (not res!205602) (not e!170317))))

(assert (=> b!245849 (= res!205602 (isPrefixOf!0 thiss!1005 (_2!11460 lt!383628)))))

(declare-fun b!245850 () Bool)

(declare-fun e!170321 () Bool)

(assert (=> b!245850 (= e!170321 e!170317)))

(declare-fun res!205609 () Bool)

(assert (=> b!245850 (=> (not res!205609) (not e!170317))))

(declare-fun lt!383622 () (_ BitVec 64))

(declare-fun lt!383623 () (_ BitVec 64))

(assert (=> b!245850 (= res!205609 (= lt!383622 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!383623)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!245850 (= lt!383622 (bitIndex!0 (size!5882 (buf!6363 (_2!11460 lt!383628))) (currentByte!11759 (_2!11460 lt!383628)) (currentBit!11754 (_2!11460 lt!383628))))))

(assert (=> b!245850 (= lt!383623 (bitIndex!0 (size!5882 (buf!6363 thiss!1005)) (currentByte!11759 thiss!1005) (currentBit!11754 thiss!1005)))))

(declare-fun b!245851 () Bool)

(declare-fun e!170311 () Bool)

(assert (=> b!245851 (= e!170315 (not e!170311))))

(declare-fun res!205611 () Bool)

(assert (=> b!245851 (=> res!205611 e!170311)))

(declare-fun lt!383626 () tuple2!21072)

(declare-fun lt!383609 () tuple2!21074)

(assert (=> b!245851 (= res!205611 (not (= (_1!11458 lt!383626) (_2!11459 lt!383609))))))

(assert (=> b!245851 (= lt!383626 (checkBitsLoopPure!0 (_1!11459 lt!383609) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383615 () (_ BitVec 64))

(assert (=> b!245851 (validate_offset_bits!1 ((_ sign_extend 32) (size!5882 (buf!6363 (_2!11460 lt!383618)))) ((_ sign_extend 32) (currentByte!11759 (_2!11460 lt!383628))) ((_ sign_extend 32) (currentBit!11754 (_2!11460 lt!383628))) lt!383615)))

(declare-fun lt!383611 () Unit!17876)

(assert (=> b!245851 (= lt!383611 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11460 lt!383628) (buf!6363 (_2!11460 lt!383618)) lt!383615))))

(declare-fun lt!383620 () tuple2!21072)

(declare-fun lt!383612 () tuple2!21074)

(assert (=> b!245851 (= lt!383620 (checkBitsLoopPure!0 (_1!11459 lt!383612) nBits!297 bit!26 from!289))))

(assert (=> b!245851 (validate_offset_bits!1 ((_ sign_extend 32) (size!5882 (buf!6363 (_2!11460 lt!383618)))) ((_ sign_extend 32) (currentByte!11759 thiss!1005)) ((_ sign_extend 32) (currentBit!11754 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383607 () Unit!17876)

(assert (=> b!245851 (= lt!383607 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6363 (_2!11460 lt!383618)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10686) tuple2!21072)

(assert (=> b!245851 (= (_2!11458 (readBitPure!0 (_1!11459 lt!383612))) bit!26)))

(assert (=> b!245851 (= lt!383609 (reader!0 (_2!11460 lt!383628) (_2!11460 lt!383618)))))

(assert (=> b!245851 (= lt!383612 (reader!0 thiss!1005 (_2!11460 lt!383618)))))

(declare-fun e!170314 () Bool)

(assert (=> b!245851 e!170314))

(declare-fun res!205604 () Bool)

(assert (=> b!245851 (=> (not res!205604) (not e!170314))))

(declare-fun lt!383619 () tuple2!21072)

(declare-fun lt!383616 () tuple2!21072)

(assert (=> b!245851 (= res!205604 (= (bitIndex!0 (size!5882 (buf!6363 (_1!11458 lt!383619))) (currentByte!11759 (_1!11458 lt!383619)) (currentBit!11754 (_1!11458 lt!383619))) (bitIndex!0 (size!5882 (buf!6363 (_1!11458 lt!383616))) (currentByte!11759 (_1!11458 lt!383616)) (currentBit!11754 (_1!11458 lt!383616)))))))

(declare-fun lt!383614 () Unit!17876)

(declare-fun lt!383627 () BitStream!10686)

(declare-fun readBitPrefixLemma!0 (BitStream!10686 BitStream!10686) Unit!17876)

(assert (=> b!245851 (= lt!383614 (readBitPrefixLemma!0 lt!383627 (_2!11460 lt!383618)))))

(assert (=> b!245851 (= lt!383616 (readBitPure!0 (BitStream!10687 (buf!6363 (_2!11460 lt!383618)) (currentByte!11759 thiss!1005) (currentBit!11754 thiss!1005))))))

(assert (=> b!245851 (= lt!383619 (readBitPure!0 lt!383627))))

(assert (=> b!245851 (= lt!383627 (BitStream!10687 (buf!6363 (_2!11460 lt!383628)) (currentByte!11759 thiss!1005) (currentBit!11754 thiss!1005)))))

(declare-fun e!170313 () Bool)

(assert (=> b!245851 e!170313))

(declare-fun res!205603 () Bool)

(assert (=> b!245851 (=> (not res!205603) (not e!170313))))

(assert (=> b!245851 (= res!205603 (isPrefixOf!0 thiss!1005 (_2!11460 lt!383618)))))

(declare-fun lt!383610 () Unit!17876)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10686 BitStream!10686 BitStream!10686) Unit!17876)

(assert (=> b!245851 (= lt!383610 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11460 lt!383628) (_2!11460 lt!383618)))))

(declare-fun e!170310 () Bool)

(assert (=> b!245851 e!170310))

(declare-fun res!205608 () Bool)

(assert (=> b!245851 (=> (not res!205608) (not e!170310))))

(assert (=> b!245851 (= res!205608 (= (size!5882 (buf!6363 (_2!11460 lt!383628))) (size!5882 (buf!6363 (_2!11460 lt!383618)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10686 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21076)

(assert (=> b!245851 (= lt!383618 (appendNBitsLoop!0 (_2!11460 lt!383628) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245851 (validate_offset_bits!1 ((_ sign_extend 32) (size!5882 (buf!6363 (_2!11460 lt!383628)))) ((_ sign_extend 32) (currentByte!11759 (_2!11460 lt!383628))) ((_ sign_extend 32) (currentBit!11754 (_2!11460 lt!383628))) lt!383615)))

(assert (=> b!245851 (= lt!383615 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!383624 () Unit!17876)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10686 BitStream!10686 (_ BitVec 64) (_ BitVec 64)) Unit!17876)

(assert (=> b!245851 (= lt!383624 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11460 lt!383628) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!245851 e!170321))

(declare-fun res!205596 () Bool)

(assert (=> b!245851 (=> (not res!205596) (not e!170321))))

(assert (=> b!245851 (= res!205596 (= (size!5882 (buf!6363 thiss!1005)) (size!5882 (buf!6363 (_2!11460 lt!383628)))))))

(declare-fun appendBit!0 (BitStream!10686 Bool) tuple2!21076)

(assert (=> b!245851 (= lt!383628 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!245852 () Bool)

(assert (=> b!245852 (= e!170314 (= (_2!11458 lt!383619) (_2!11458 lt!383616)))))

(declare-fun b!245853 () Bool)

(declare-fun res!205605 () Bool)

(assert (=> b!245853 (=> (not res!205605) (not e!170313))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245853 (= res!205605 (invariant!0 (currentBit!11754 thiss!1005) (currentByte!11759 thiss!1005) (size!5882 (buf!6363 (_2!11460 lt!383628)))))))

(declare-fun b!245854 () Bool)

(declare-fun e!170312 () Bool)

(declare-fun lt!383613 () tuple2!21072)

(assert (=> b!245854 (= e!170312 (= (bitIndex!0 (size!5882 (buf!6363 (_1!11458 lt!383613))) (currentByte!11759 (_1!11458 lt!383613)) (currentBit!11754 (_1!11458 lt!383613))) lt!383622))))

(declare-fun b!245855 () Bool)

(declare-fun e!170319 () Bool)

(assert (=> b!245855 (= e!170311 e!170319)))

(declare-fun res!205607 () Bool)

(assert (=> b!245855 (=> res!205607 e!170319)))

(assert (=> b!245855 (= res!205607 (not (= (size!5882 (buf!6363 thiss!1005)) (size!5882 (buf!6363 (_2!11460 lt!383618))))))))

(assert (=> b!245855 (and (= (_2!11458 lt!383620) (_2!11458 lt!383626)) (= (_1!11458 lt!383620) (_2!11459 lt!383612)))))

(declare-fun b!245856 () Bool)

(declare-fun res!205598 () Bool)

(assert (=> b!245856 (=> res!205598 e!170311)))

(declare-fun withMovedBitIndex!0 (BitStream!10686 (_ BitVec 64)) BitStream!10686)

(assert (=> b!245856 (= res!205598 (not (= (_1!11459 lt!383609) (withMovedBitIndex!0 (_1!11459 lt!383612) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!245857 () Bool)

(assert (=> b!245857 (= e!170310 e!170316)))

(declare-fun res!205600 () Bool)

(assert (=> b!245857 (=> (not res!205600) (not e!170316))))

(assert (=> b!245857 (= res!205600 (= (bitIndex!0 (size!5882 (buf!6363 (_2!11460 lt!383618))) (currentByte!11759 (_2!11460 lt!383618)) (currentBit!11754 (_2!11460 lt!383618))) (bvadd (bitIndex!0 (size!5882 (buf!6363 (_2!11460 lt!383628))) (currentByte!11759 (_2!11460 lt!383628)) (currentBit!11754 (_2!11460 lt!383628))) lt!383621)))))

(assert (=> b!245857 (= lt!383621 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!245858 () Bool)

(assert (=> b!245858 (= e!170317 e!170312)))

(declare-fun res!205597 () Bool)

(assert (=> b!245858 (=> (not res!205597) (not e!170312))))

(assert (=> b!245858 (= res!205597 (and (= (_2!11458 lt!383613) bit!26) (= (_1!11458 lt!383613) (_2!11460 lt!383628))))))

(declare-fun readerFrom!0 (BitStream!10686 (_ BitVec 32) (_ BitVec 32)) BitStream!10686)

(assert (=> b!245858 (= lt!383613 (readBitPure!0 (readerFrom!0 (_2!11460 lt!383628) (currentBit!11754 thiss!1005) (currentByte!11759 thiss!1005))))))

(declare-fun b!245859 () Bool)

(assert (=> b!245859 (= e!170313 (invariant!0 (currentBit!11754 thiss!1005) (currentByte!11759 thiss!1005) (size!5882 (buf!6363 (_2!11460 lt!383618)))))))

(declare-fun b!245860 () Bool)

(assert (=> b!245860 (= e!170319 (invariant!0 (currentBit!11754 thiss!1005) (currentByte!11759 thiss!1005) (size!5882 (buf!6363 thiss!1005))))))

(declare-fun b!245861 () Bool)

(declare-fun array_inv!5623 (array!13420) Bool)

(assert (=> b!245861 (= e!170318 (array_inv!5623 (buf!6363 thiss!1005)))))

(assert (= (and start!53092 res!205599) b!245848))

(assert (= (and b!245848 res!205606) b!245845))

(assert (= (and b!245845 res!205610) b!245851))

(assert (= (and b!245851 res!205596) b!245850))

(assert (= (and b!245850 res!205609) b!245849))

(assert (= (and b!245849 res!205602) b!245858))

(assert (= (and b!245858 res!205597) b!245854))

(assert (= (and b!245851 res!205608) b!245857))

(assert (= (and b!245857 res!205600) b!245847))

(assert (= (and b!245847 res!205601) b!245846))

(assert (= (and b!245851 res!205603) b!245853))

(assert (= (and b!245853 res!205605) b!245859))

(assert (= (and b!245851 res!205604) b!245852))

(assert (= (and b!245851 (not res!205611)) b!245856))

(assert (= (and b!245856 (not res!205598)) b!245855))

(assert (= (and b!245855 (not res!205607)) b!245860))

(assert (= start!53092 b!245861))

(declare-fun m!370809 () Bool)

(assert (=> b!245856 m!370809))

(declare-fun m!370811 () Bool)

(assert (=> b!245849 m!370811))

(declare-fun m!370813 () Bool)

(assert (=> b!245859 m!370813))

(declare-fun m!370815 () Bool)

(assert (=> start!53092 m!370815))

(declare-fun m!370817 () Bool)

(assert (=> b!245850 m!370817))

(declare-fun m!370819 () Bool)

(assert (=> b!245850 m!370819))

(declare-fun m!370821 () Bool)

(assert (=> b!245846 m!370821))

(declare-fun m!370823 () Bool)

(assert (=> b!245846 m!370823))

(declare-fun m!370825 () Bool)

(assert (=> b!245846 m!370825))

(declare-fun m!370827 () Bool)

(assert (=> b!245846 m!370827))

(declare-fun m!370829 () Bool)

(assert (=> b!245857 m!370829))

(assert (=> b!245857 m!370817))

(declare-fun m!370831 () Bool)

(assert (=> b!245853 m!370831))

(declare-fun m!370833 () Bool)

(assert (=> b!245851 m!370833))

(declare-fun m!370835 () Bool)

(assert (=> b!245851 m!370835))

(assert (=> b!245851 m!370827))

(declare-fun m!370837 () Bool)

(assert (=> b!245851 m!370837))

(declare-fun m!370839 () Bool)

(assert (=> b!245851 m!370839))

(declare-fun m!370841 () Bool)

(assert (=> b!245851 m!370841))

(declare-fun m!370843 () Bool)

(assert (=> b!245851 m!370843))

(declare-fun m!370845 () Bool)

(assert (=> b!245851 m!370845))

(declare-fun m!370847 () Bool)

(assert (=> b!245851 m!370847))

(declare-fun m!370849 () Bool)

(assert (=> b!245851 m!370849))

(declare-fun m!370851 () Bool)

(assert (=> b!245851 m!370851))

(declare-fun m!370853 () Bool)

(assert (=> b!245851 m!370853))

(declare-fun m!370855 () Bool)

(assert (=> b!245851 m!370855))

(declare-fun m!370857 () Bool)

(assert (=> b!245851 m!370857))

(declare-fun m!370859 () Bool)

(assert (=> b!245851 m!370859))

(declare-fun m!370861 () Bool)

(assert (=> b!245851 m!370861))

(declare-fun m!370863 () Bool)

(assert (=> b!245851 m!370863))

(declare-fun m!370865 () Bool)

(assert (=> b!245851 m!370865))

(declare-fun m!370867 () Bool)

(assert (=> b!245851 m!370867))

(declare-fun m!370869 () Bool)

(assert (=> b!245851 m!370869))

(declare-fun m!370871 () Bool)

(assert (=> b!245847 m!370871))

(declare-fun m!370873 () Bool)

(assert (=> b!245861 m!370873))

(declare-fun m!370875 () Bool)

(assert (=> b!245858 m!370875))

(assert (=> b!245858 m!370875))

(declare-fun m!370877 () Bool)

(assert (=> b!245858 m!370877))

(declare-fun m!370879 () Bool)

(assert (=> b!245854 m!370879))

(declare-fun m!370881 () Bool)

(assert (=> b!245860 m!370881))

(declare-fun m!370883 () Bool)

(assert (=> b!245848 m!370883))

(check-sat (not b!245848) (not b!245847) (not b!245854) (not b!245860) (not b!245853) (not b!245856) (not b!245857) (not b!245858) (not b!245846) (not b!245861) (not b!245850) (not start!53092) (not b!245859) (not b!245849) (not b!245851))
