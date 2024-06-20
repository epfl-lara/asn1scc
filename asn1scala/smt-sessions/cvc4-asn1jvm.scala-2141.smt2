; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54514 () Bool)

(assert start!54514)

(declare-fun b!254842 () Bool)

(declare-fun e!176585 () Bool)

(declare-fun e!176584 () Bool)

(assert (=> b!254842 (= e!176585 (not e!176584))))

(declare-fun res!213543 () Bool)

(assert (=> b!254842 (=> res!213543 e!176584)))

(declare-datatypes ((array!13760 0))(
  ( (array!13761 (arr!7023 (Array (_ BitVec 32) (_ BitVec 8))) (size!6036 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10994 0))(
  ( (BitStream!10995 (buf!6550 array!13760) (currentByte!12023 (_ BitVec 32)) (currentBit!12018 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21798 0))(
  ( (tuple2!21799 (_1!11833 BitStream!10994) (_2!11833 Bool)) )
))
(declare-fun lt!395692 () tuple2!21798)

(declare-datatypes ((tuple2!21800 0))(
  ( (tuple2!21801 (_1!11834 BitStream!10994) (_2!11834 BitStream!10994)) )
))
(declare-fun lt!395697 () tuple2!21800)

(assert (=> b!254842 (= res!213543 (not (= (_1!11833 lt!395692) (_2!11834 lt!395697))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10994 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21798)

(assert (=> b!254842 (= lt!395692 (checkBitsLoopPure!0 (_1!11834 lt!395697) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18274 0))(
  ( (Unit!18275) )
))
(declare-datatypes ((tuple2!21802 0))(
  ( (tuple2!21803 (_1!11835 Unit!18274) (_2!11835 BitStream!10994)) )
))
(declare-fun lt!395683 () tuple2!21802)

(declare-fun lt!395691 () tuple2!21802)

(declare-fun lt!395690 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!254842 (validate_offset_bits!1 ((_ sign_extend 32) (size!6036 (buf!6550 (_2!11835 lt!395683)))) ((_ sign_extend 32) (currentByte!12023 (_2!11835 lt!395691))) ((_ sign_extend 32) (currentBit!12018 (_2!11835 lt!395691))) lt!395690)))

(declare-fun lt!395688 () Unit!18274)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10994 array!13760 (_ BitVec 64)) Unit!18274)

(assert (=> b!254842 (= lt!395688 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11835 lt!395691) (buf!6550 (_2!11835 lt!395683)) lt!395690))))

(declare-fun lt!395696 () tuple2!21798)

(declare-fun lt!395699 () tuple2!21800)

(assert (=> b!254842 (= lt!395696 (checkBitsLoopPure!0 (_1!11834 lt!395699) nBits!297 bit!26 from!289))))

(declare-fun thiss!1005 () BitStream!10994)

(assert (=> b!254842 (validate_offset_bits!1 ((_ sign_extend 32) (size!6036 (buf!6550 (_2!11835 lt!395683)))) ((_ sign_extend 32) (currentByte!12023 thiss!1005)) ((_ sign_extend 32) (currentBit!12018 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!395701 () Unit!18274)

(assert (=> b!254842 (= lt!395701 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6550 (_2!11835 lt!395683)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10994) tuple2!21798)

(assert (=> b!254842 (= (_2!11833 (readBitPure!0 (_1!11834 lt!395699))) bit!26)))

(declare-fun reader!0 (BitStream!10994 BitStream!10994) tuple2!21800)

(assert (=> b!254842 (= lt!395697 (reader!0 (_2!11835 lt!395691) (_2!11835 lt!395683)))))

(assert (=> b!254842 (= lt!395699 (reader!0 thiss!1005 (_2!11835 lt!395683)))))

(declare-fun e!176586 () Bool)

(assert (=> b!254842 e!176586))

(declare-fun res!213550 () Bool)

(assert (=> b!254842 (=> (not res!213550) (not e!176586))))

(declare-fun lt!395685 () tuple2!21798)

(declare-fun lt!395693 () tuple2!21798)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!254842 (= res!213550 (= (bitIndex!0 (size!6036 (buf!6550 (_1!11833 lt!395685))) (currentByte!12023 (_1!11833 lt!395685)) (currentBit!12018 (_1!11833 lt!395685))) (bitIndex!0 (size!6036 (buf!6550 (_1!11833 lt!395693))) (currentByte!12023 (_1!11833 lt!395693)) (currentBit!12018 (_1!11833 lt!395693)))))))

(declare-fun lt!395687 () Unit!18274)

(declare-fun lt!395689 () BitStream!10994)

(declare-fun readBitPrefixLemma!0 (BitStream!10994 BitStream!10994) Unit!18274)

(assert (=> b!254842 (= lt!395687 (readBitPrefixLemma!0 lt!395689 (_2!11835 lt!395683)))))

(assert (=> b!254842 (= lt!395693 (readBitPure!0 (BitStream!10995 (buf!6550 (_2!11835 lt!395683)) (currentByte!12023 thiss!1005) (currentBit!12018 thiss!1005))))))

(assert (=> b!254842 (= lt!395685 (readBitPure!0 lt!395689))))

(assert (=> b!254842 (= lt!395689 (BitStream!10995 (buf!6550 (_2!11835 lt!395691)) (currentByte!12023 thiss!1005) (currentBit!12018 thiss!1005)))))

(declare-fun e!176577 () Bool)

(assert (=> b!254842 e!176577))

(declare-fun res!213556 () Bool)

(assert (=> b!254842 (=> (not res!213556) (not e!176577))))

(declare-fun isPrefixOf!0 (BitStream!10994 BitStream!10994) Bool)

(assert (=> b!254842 (= res!213556 (isPrefixOf!0 thiss!1005 (_2!11835 lt!395683)))))

(declare-fun lt!395700 () Unit!18274)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10994 BitStream!10994 BitStream!10994) Unit!18274)

(assert (=> b!254842 (= lt!395700 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11835 lt!395691) (_2!11835 lt!395683)))))

(declare-fun e!176587 () Bool)

(assert (=> b!254842 e!176587))

(declare-fun res!213547 () Bool)

(assert (=> b!254842 (=> (not res!213547) (not e!176587))))

(assert (=> b!254842 (= res!213547 (= (size!6036 (buf!6550 (_2!11835 lt!395691))) (size!6036 (buf!6550 (_2!11835 lt!395683)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10994 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21802)

(assert (=> b!254842 (= lt!395683 (appendNBitsLoop!0 (_2!11835 lt!395691) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254842 (validate_offset_bits!1 ((_ sign_extend 32) (size!6036 (buf!6550 (_2!11835 lt!395691)))) ((_ sign_extend 32) (currentByte!12023 (_2!11835 lt!395691))) ((_ sign_extend 32) (currentBit!12018 (_2!11835 lt!395691))) lt!395690)))

(assert (=> b!254842 (= lt!395690 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!395698 () Unit!18274)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10994 BitStream!10994 (_ BitVec 64) (_ BitVec 64)) Unit!18274)

(assert (=> b!254842 (= lt!395698 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11835 lt!395691) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!176588 () Bool)

(assert (=> b!254842 e!176588))

(declare-fun res!213554 () Bool)

(assert (=> b!254842 (=> (not res!213554) (not e!176588))))

(assert (=> b!254842 (= res!213554 (= (size!6036 (buf!6550 thiss!1005)) (size!6036 (buf!6550 (_2!11835 lt!395691)))))))

(declare-fun appendBit!0 (BitStream!10994 Bool) tuple2!21802)

(assert (=> b!254842 (= lt!395691 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!254843 () Bool)

(declare-fun e!176582 () Bool)

(declare-fun array_inv!5777 (array!13760) Bool)

(assert (=> b!254843 (= e!176582 (array_inv!5777 (buf!6550 thiss!1005)))))

(declare-fun b!254844 () Bool)

(declare-fun res!213558 () Bool)

(assert (=> b!254844 (=> (not res!213558) (not e!176585))))

(assert (=> b!254844 (= res!213558 (bvslt from!289 nBits!297))))

(declare-fun b!254845 () Bool)

(declare-fun e!176578 () Bool)

(assert (=> b!254845 (= e!176588 e!176578)))

(declare-fun res!213549 () Bool)

(assert (=> b!254845 (=> (not res!213549) (not e!176578))))

(declare-fun lt!395702 () (_ BitVec 64))

(declare-fun lt!395694 () (_ BitVec 64))

(assert (=> b!254845 (= res!213549 (= lt!395702 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!395694)))))

(assert (=> b!254845 (= lt!395702 (bitIndex!0 (size!6036 (buf!6550 (_2!11835 lt!395691))) (currentByte!12023 (_2!11835 lt!395691)) (currentBit!12018 (_2!11835 lt!395691))))))

(assert (=> b!254845 (= lt!395694 (bitIndex!0 (size!6036 (buf!6550 thiss!1005)) (currentByte!12023 thiss!1005) (currentBit!12018 thiss!1005)))))

(declare-fun b!254846 () Bool)

(declare-fun e!176581 () Bool)

(assert (=> b!254846 (= e!176584 e!176581)))

(declare-fun res!213548 () Bool)

(assert (=> b!254846 (=> res!213548 e!176581)))

(assert (=> b!254846 (= res!213548 (not (= (size!6036 (buf!6550 thiss!1005)) (size!6036 (buf!6550 (_2!11835 lt!395683))))))))

(assert (=> b!254846 (and (= (_2!11833 lt!395696) (_2!11833 lt!395692)) (= (_1!11833 lt!395696) (_2!11834 lt!395699)))))

(declare-fun b!254847 () Bool)

(assert (=> b!254847 (= e!176586 (= (_2!11833 lt!395685) (_2!11833 lt!395693)))))

(declare-fun b!254848 () Bool)

(declare-fun res!213555 () Bool)

(assert (=> b!254848 (=> (not res!213555) (not e!176578))))

(assert (=> b!254848 (= res!213555 (isPrefixOf!0 thiss!1005 (_2!11835 lt!395691)))))

(declare-fun b!254849 () Bool)

(declare-fun res!213551 () Bool)

(declare-fun e!176583 () Bool)

(assert (=> b!254849 (=> (not res!213551) (not e!176583))))

(assert (=> b!254849 (= res!213551 (isPrefixOf!0 (_2!11835 lt!395691) (_2!11835 lt!395683)))))

(declare-fun b!254850 () Bool)

(declare-fun res!213557 () Bool)

(assert (=> b!254850 (=> (not res!213557) (not e!176577))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254850 (= res!213557 (invariant!0 (currentBit!12018 thiss!1005) (currentByte!12023 thiss!1005) (size!6036 (buf!6550 (_2!11835 lt!395691)))))))

(declare-fun b!254851 () Bool)

(declare-fun lt!395681 () tuple2!21798)

(declare-fun lt!395686 () tuple2!21800)

(assert (=> b!254851 (= e!176583 (not (or (not (_2!11833 lt!395681)) (not (= (_1!11833 lt!395681) (_2!11834 lt!395686))))))))

(assert (=> b!254851 (= lt!395681 (checkBitsLoopPure!0 (_1!11834 lt!395686) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!395695 () (_ BitVec 64))

(assert (=> b!254851 (validate_offset_bits!1 ((_ sign_extend 32) (size!6036 (buf!6550 (_2!11835 lt!395683)))) ((_ sign_extend 32) (currentByte!12023 (_2!11835 lt!395691))) ((_ sign_extend 32) (currentBit!12018 (_2!11835 lt!395691))) lt!395695)))

(declare-fun lt!395703 () Unit!18274)

(assert (=> b!254851 (= lt!395703 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11835 lt!395691) (buf!6550 (_2!11835 lt!395683)) lt!395695))))

(assert (=> b!254851 (= lt!395686 (reader!0 (_2!11835 lt!395691) (_2!11835 lt!395683)))))

(declare-fun b!254852 () Bool)

(assert (=> b!254852 (= e!176587 e!176583)))

(declare-fun res!213544 () Bool)

(assert (=> b!254852 (=> (not res!213544) (not e!176583))))

(assert (=> b!254852 (= res!213544 (= (bitIndex!0 (size!6036 (buf!6550 (_2!11835 lt!395683))) (currentByte!12023 (_2!11835 lt!395683)) (currentBit!12018 (_2!11835 lt!395683))) (bvadd (bitIndex!0 (size!6036 (buf!6550 (_2!11835 lt!395691))) (currentByte!12023 (_2!11835 lt!395691)) (currentBit!12018 (_2!11835 lt!395691))) lt!395695)))))

(assert (=> b!254852 (= lt!395695 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!213545 () Bool)

(assert (=> start!54514 (=> (not res!213545) (not e!176585))))

(assert (=> start!54514 (= res!213545 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54514 e!176585))

(assert (=> start!54514 true))

(declare-fun inv!12 (BitStream!10994) Bool)

(assert (=> start!54514 (and (inv!12 thiss!1005) e!176582)))

(declare-fun b!254853 () Bool)

(declare-fun e!176579 () Bool)

(declare-fun lt!395682 () tuple2!21798)

(assert (=> b!254853 (= e!176579 (= (bitIndex!0 (size!6036 (buf!6550 (_1!11833 lt!395682))) (currentByte!12023 (_1!11833 lt!395682)) (currentBit!12018 (_1!11833 lt!395682))) lt!395702))))

(declare-fun b!254854 () Bool)

(declare-fun res!213552 () Bool)

(assert (=> b!254854 (=> (not res!213552) (not e!176585))))

(assert (=> b!254854 (= res!213552 (validate_offset_bits!1 ((_ sign_extend 32) (size!6036 (buf!6550 thiss!1005))) ((_ sign_extend 32) (currentByte!12023 thiss!1005)) ((_ sign_extend 32) (currentBit!12018 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!254855 () Bool)

(assert (=> b!254855 (= e!176577 (invariant!0 (currentBit!12018 thiss!1005) (currentByte!12023 thiss!1005) (size!6036 (buf!6550 (_2!11835 lt!395683)))))))

(declare-fun b!254856 () Bool)

(declare-fun res!213546 () Bool)

(assert (=> b!254856 (=> res!213546 e!176584)))

(declare-fun withMovedBitIndex!0 (BitStream!10994 (_ BitVec 64)) BitStream!10994)

(assert (=> b!254856 (= res!213546 (not (= (_1!11834 lt!395697) (withMovedBitIndex!0 (_1!11834 lt!395699) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!254857 () Bool)

(assert (=> b!254857 (= e!176578 e!176579)))

(declare-fun res!213553 () Bool)

(assert (=> b!254857 (=> (not res!213553) (not e!176579))))

(assert (=> b!254857 (= res!213553 (and (= (_2!11833 lt!395682) bit!26) (= (_1!11833 lt!395682) (_2!11835 lt!395691))))))

(declare-fun readerFrom!0 (BitStream!10994 (_ BitVec 32) (_ BitVec 32)) BitStream!10994)

(assert (=> b!254857 (= lt!395682 (readBitPure!0 (readerFrom!0 (_2!11835 lt!395691) (currentBit!12018 thiss!1005) (currentByte!12023 thiss!1005))))))

(declare-fun b!254858 () Bool)

(assert (=> b!254858 (= e!176581 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!395684 () (_ BitVec 64))

(assert (=> b!254858 (= lt!395684 (bitIndex!0 (size!6036 (buf!6550 thiss!1005)) (currentByte!12023 thiss!1005) (currentBit!12018 thiss!1005)))))

(assert (= (and start!54514 res!213545) b!254854))

(assert (= (and b!254854 res!213552) b!254844))

(assert (= (and b!254844 res!213558) b!254842))

(assert (= (and b!254842 res!213554) b!254845))

(assert (= (and b!254845 res!213549) b!254848))

(assert (= (and b!254848 res!213555) b!254857))

(assert (= (and b!254857 res!213553) b!254853))

(assert (= (and b!254842 res!213547) b!254852))

(assert (= (and b!254852 res!213544) b!254849))

(assert (= (and b!254849 res!213551) b!254851))

(assert (= (and b!254842 res!213556) b!254850))

(assert (= (and b!254850 res!213557) b!254855))

(assert (= (and b!254842 res!213550) b!254847))

(assert (= (and b!254842 (not res!213543)) b!254856))

(assert (= (and b!254856 (not res!213546)) b!254846))

(assert (= (and b!254846 (not res!213548)) b!254858))

(assert (= start!54514 b!254843))

(declare-fun m!383827 () Bool)

(assert (=> b!254856 m!383827))

(declare-fun m!383829 () Bool)

(assert (=> b!254858 m!383829))

(declare-fun m!383831 () Bool)

(assert (=> b!254842 m!383831))

(declare-fun m!383833 () Bool)

(assert (=> b!254842 m!383833))

(declare-fun m!383835 () Bool)

(assert (=> b!254842 m!383835))

(declare-fun m!383837 () Bool)

(assert (=> b!254842 m!383837))

(declare-fun m!383839 () Bool)

(assert (=> b!254842 m!383839))

(declare-fun m!383841 () Bool)

(assert (=> b!254842 m!383841))

(declare-fun m!383843 () Bool)

(assert (=> b!254842 m!383843))

(declare-fun m!383845 () Bool)

(assert (=> b!254842 m!383845))

(declare-fun m!383847 () Bool)

(assert (=> b!254842 m!383847))

(declare-fun m!383849 () Bool)

(assert (=> b!254842 m!383849))

(declare-fun m!383851 () Bool)

(assert (=> b!254842 m!383851))

(declare-fun m!383853 () Bool)

(assert (=> b!254842 m!383853))

(declare-fun m!383855 () Bool)

(assert (=> b!254842 m!383855))

(declare-fun m!383857 () Bool)

(assert (=> b!254842 m!383857))

(declare-fun m!383859 () Bool)

(assert (=> b!254842 m!383859))

(declare-fun m!383861 () Bool)

(assert (=> b!254842 m!383861))

(declare-fun m!383863 () Bool)

(assert (=> b!254842 m!383863))

(declare-fun m!383865 () Bool)

(assert (=> b!254842 m!383865))

(declare-fun m!383867 () Bool)

(assert (=> b!254842 m!383867))

(declare-fun m!383869 () Bool)

(assert (=> b!254842 m!383869))

(declare-fun m!383871 () Bool)

(assert (=> b!254857 m!383871))

(assert (=> b!254857 m!383871))

(declare-fun m!383873 () Bool)

(assert (=> b!254857 m!383873))

(declare-fun m!383875 () Bool)

(assert (=> b!254845 m!383875))

(assert (=> b!254845 m!383829))

(declare-fun m!383877 () Bool)

(assert (=> b!254853 m!383877))

(declare-fun m!383879 () Bool)

(assert (=> b!254848 m!383879))

(declare-fun m!383881 () Bool)

(assert (=> b!254843 m!383881))

(declare-fun m!383883 () Bool)

(assert (=> b!254854 m!383883))

(declare-fun m!383885 () Bool)

(assert (=> b!254849 m!383885))

(declare-fun m!383887 () Bool)

(assert (=> b!254855 m!383887))

(declare-fun m!383889 () Bool)

(assert (=> b!254852 m!383889))

(assert (=> b!254852 m!383875))

(declare-fun m!383891 () Bool)

(assert (=> start!54514 m!383891))

(declare-fun m!383893 () Bool)

(assert (=> b!254850 m!383893))

(declare-fun m!383895 () Bool)

(assert (=> b!254851 m!383895))

(declare-fun m!383897 () Bool)

(assert (=> b!254851 m!383897))

(declare-fun m!383899 () Bool)

(assert (=> b!254851 m!383899))

(assert (=> b!254851 m!383845))

(push 1)

(assert (not b!254852))

(assert (not b!254843))

(assert (not b!254849))

(assert (not b!254851))

(assert (not b!254854))

(assert (not b!254858))

(assert (not b!254856))

(assert (not b!254850))

(assert (not start!54514))

(assert (not b!254842))

(assert (not b!254853))

(assert (not b!254857))

(assert (not b!254855))

(assert (not b!254845))

(assert (not b!254848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

