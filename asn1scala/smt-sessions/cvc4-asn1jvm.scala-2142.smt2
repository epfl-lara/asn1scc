; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54520 () Bool)

(assert start!54520)

(declare-fun b!254995 () Bool)

(declare-fun e!176696 () Bool)

(declare-datatypes ((array!13766 0))(
  ( (array!13767 (arr!7026 (Array (_ BitVec 32) (_ BitVec 8))) (size!6039 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11000 0))(
  ( (BitStream!11001 (buf!6553 array!13766) (currentByte!12026 (_ BitVec 32)) (currentBit!12021 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21816 0))(
  ( (tuple2!21817 (_1!11842 BitStream!11000) (_2!11842 Bool)) )
))
(declare-fun lt!395897 () tuple2!21816)

(declare-fun lt!395907 () tuple2!21816)

(assert (=> b!254995 (= e!176696 (= (_2!11842 lt!395897) (_2!11842 lt!395907)))))

(declare-fun b!254996 () Bool)

(declare-fun res!213693 () Bool)

(declare-fun e!176686 () Bool)

(assert (=> b!254996 (=> (not res!213693) (not e!176686))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!254996 (= res!213693 (bvslt from!289 nBits!297))))

(declare-fun b!254997 () Bool)

(declare-fun e!176694 () Bool)

(declare-fun thiss!1005 () BitStream!11000)

(declare-fun array_inv!5780 (array!13766) Bool)

(assert (=> b!254997 (= e!176694 (array_inv!5780 (buf!6553 thiss!1005)))))

(declare-fun b!254998 () Bool)

(declare-fun e!176693 () Bool)

(declare-fun lt!395909 () tuple2!21816)

(declare-fun lt!395905 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!254998 (= e!176693 (= (bitIndex!0 (size!6039 (buf!6553 (_1!11842 lt!395909))) (currentByte!12026 (_1!11842 lt!395909)) (currentBit!12021 (_1!11842 lt!395909))) lt!395905))))

(declare-fun b!254999 () Bool)

(declare-fun e!176688 () Bool)

(assert (=> b!254999 (= e!176686 (not e!176688))))

(declare-fun res!213695 () Bool)

(assert (=> b!254999 (=> res!213695 e!176688)))

(declare-fun lt!395916 () tuple2!21816)

(declare-datatypes ((tuple2!21818 0))(
  ( (tuple2!21819 (_1!11843 BitStream!11000) (_2!11843 BitStream!11000)) )
))
(declare-fun lt!395912 () tuple2!21818)

(assert (=> b!254999 (= res!213695 (not (= (_1!11842 lt!395916) (_2!11843 lt!395912))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11000 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21816)

(assert (=> b!254999 (= lt!395916 (checkBitsLoopPure!0 (_1!11843 lt!395912) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18280 0))(
  ( (Unit!18281) )
))
(declare-datatypes ((tuple2!21820 0))(
  ( (tuple2!21821 (_1!11844 Unit!18280) (_2!11844 BitStream!11000)) )
))
(declare-fun lt!395914 () tuple2!21820)

(declare-fun lt!395918 () tuple2!21820)

(declare-fun lt!395902 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!254999 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!395902)))

(declare-fun lt!395896 () Unit!18280)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11000 array!13766 (_ BitVec 64)) Unit!18280)

(assert (=> b!254999 (= lt!395896 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11844 lt!395918) (buf!6553 (_2!11844 lt!395914)) lt!395902))))

(declare-fun lt!395899 () tuple2!21818)

(declare-fun lt!395908 () tuple2!21816)

(assert (=> b!254999 (= lt!395908 (checkBitsLoopPure!0 (_1!11843 lt!395899) nBits!297 bit!26 from!289))))

(assert (=> b!254999 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 thiss!1005)) ((_ sign_extend 32) (currentBit!12021 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!395913 () Unit!18280)

(assert (=> b!254999 (= lt!395913 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6553 (_2!11844 lt!395914)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!11000) tuple2!21816)

(assert (=> b!254999 (= (_2!11842 (readBitPure!0 (_1!11843 lt!395899))) bit!26)))

(declare-fun reader!0 (BitStream!11000 BitStream!11000) tuple2!21818)

(assert (=> b!254999 (= lt!395912 (reader!0 (_2!11844 lt!395918) (_2!11844 lt!395914)))))

(assert (=> b!254999 (= lt!395899 (reader!0 thiss!1005 (_2!11844 lt!395914)))))

(assert (=> b!254999 e!176696))

(declare-fun res!213702 () Bool)

(assert (=> b!254999 (=> (not res!213702) (not e!176696))))

(assert (=> b!254999 (= res!213702 (= (bitIndex!0 (size!6039 (buf!6553 (_1!11842 lt!395897))) (currentByte!12026 (_1!11842 lt!395897)) (currentBit!12021 (_1!11842 lt!395897))) (bitIndex!0 (size!6039 (buf!6553 (_1!11842 lt!395907))) (currentByte!12026 (_1!11842 lt!395907)) (currentBit!12021 (_1!11842 lt!395907)))))))

(declare-fun lt!395903 () Unit!18280)

(declare-fun lt!395911 () BitStream!11000)

(declare-fun readBitPrefixLemma!0 (BitStream!11000 BitStream!11000) Unit!18280)

(assert (=> b!254999 (= lt!395903 (readBitPrefixLemma!0 lt!395911 (_2!11844 lt!395914)))))

(assert (=> b!254999 (= lt!395907 (readBitPure!0 (BitStream!11001 (buf!6553 (_2!11844 lt!395914)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005))))))

(assert (=> b!254999 (= lt!395897 (readBitPure!0 lt!395911))))

(assert (=> b!254999 (= lt!395911 (BitStream!11001 (buf!6553 (_2!11844 lt!395918)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)))))

(declare-fun e!176690 () Bool)

(assert (=> b!254999 e!176690))

(declare-fun res!213697 () Bool)

(assert (=> b!254999 (=> (not res!213697) (not e!176690))))

(declare-fun isPrefixOf!0 (BitStream!11000 BitStream!11000) Bool)

(assert (=> b!254999 (= res!213697 (isPrefixOf!0 thiss!1005 (_2!11844 lt!395914)))))

(declare-fun lt!395898 () Unit!18280)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11000 BitStream!11000 BitStream!11000) Unit!18280)

(assert (=> b!254999 (= lt!395898 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11844 lt!395918) (_2!11844 lt!395914)))))

(declare-fun e!176691 () Bool)

(assert (=> b!254999 e!176691))

(declare-fun res!213700 () Bool)

(assert (=> b!254999 (=> (not res!213700) (not e!176691))))

(assert (=> b!254999 (= res!213700 (= (size!6039 (buf!6553 (_2!11844 lt!395918))) (size!6039 (buf!6553 (_2!11844 lt!395914)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11000 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21820)

(assert (=> b!254999 (= lt!395914 (appendNBitsLoop!0 (_2!11844 lt!395918) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254999 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395918)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!395902)))

(assert (=> b!254999 (= lt!395902 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!395906 () Unit!18280)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11000 BitStream!11000 (_ BitVec 64) (_ BitVec 64)) Unit!18280)

(assert (=> b!254999 (= lt!395906 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11844 lt!395918) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!176689 () Bool)

(assert (=> b!254999 e!176689))

(declare-fun res!213688 () Bool)

(assert (=> b!254999 (=> (not res!213688) (not e!176689))))

(assert (=> b!254999 (= res!213688 (= (size!6039 (buf!6553 thiss!1005)) (size!6039 (buf!6553 (_2!11844 lt!395918)))))))

(declare-fun appendBit!0 (BitStream!11000 Bool) tuple2!21820)

(assert (=> b!254999 (= lt!395918 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255000 () Bool)

(declare-fun res!213696 () Bool)

(assert (=> b!255000 (=> (not res!213696) (not e!176686))))

(assert (=> b!255000 (= res!213696 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 thiss!1005))) ((_ sign_extend 32) (currentByte!12026 thiss!1005)) ((_ sign_extend 32) (currentBit!12021 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun e!176685 () Bool)

(declare-fun lt!395900 () (_ BitVec 64))

(declare-fun b!255001 () Bool)

(declare-fun lt!395917 () (_ BitVec 64))

(assert (=> b!255001 (= e!176685 (or (not (= lt!395900 (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!395900 (bvand (bvadd lt!395917 (bvsub nBits!297 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255001 (= lt!395900 (bvand lt!395917 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255001 (= lt!395917 (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)))))

(declare-fun res!213690 () Bool)

(assert (=> start!54520 (=> (not res!213690) (not e!176686))))

(assert (=> start!54520 (= res!213690 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54520 e!176686))

(assert (=> start!54520 true))

(declare-fun inv!12 (BitStream!11000) Bool)

(assert (=> start!54520 (and (inv!12 thiss!1005) e!176694)))

(declare-fun b!255002 () Bool)

(declare-fun res!213698 () Bool)

(assert (=> b!255002 (=> (not res!213698) (not e!176690))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255002 (= res!213698 (invariant!0 (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005) (size!6039 (buf!6553 (_2!11844 lt!395918)))))))

(declare-fun b!255003 () Bool)

(assert (=> b!255003 (= e!176688 e!176685)))

(declare-fun res!213687 () Bool)

(assert (=> b!255003 (=> res!213687 e!176685)))

(assert (=> b!255003 (= res!213687 (not (= (size!6039 (buf!6553 thiss!1005)) (size!6039 (buf!6553 (_2!11844 lt!395914))))))))

(assert (=> b!255003 (and (= (_2!11842 lt!395908) (_2!11842 lt!395916)) (= (_1!11842 lt!395908) (_2!11843 lt!395899)))))

(declare-fun b!255004 () Bool)

(declare-fun e!176687 () Bool)

(assert (=> b!255004 (= e!176689 e!176687)))

(declare-fun res!213691 () Bool)

(assert (=> b!255004 (=> (not res!213691) (not e!176687))))

(declare-fun lt!395915 () (_ BitVec 64))

(assert (=> b!255004 (= res!213691 (= lt!395905 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!395915)))))

(assert (=> b!255004 (= lt!395905 (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395918))) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918))))))

(assert (=> b!255004 (= lt!395915 (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)))))

(declare-fun b!255005 () Bool)

(assert (=> b!255005 (= e!176687 e!176693)))

(declare-fun res!213689 () Bool)

(assert (=> b!255005 (=> (not res!213689) (not e!176693))))

(assert (=> b!255005 (= res!213689 (and (= (_2!11842 lt!395909) bit!26) (= (_1!11842 lt!395909) (_2!11844 lt!395918))))))

(declare-fun readerFrom!0 (BitStream!11000 (_ BitVec 32) (_ BitVec 32)) BitStream!11000)

(assert (=> b!255005 (= lt!395909 (readBitPure!0 (readerFrom!0 (_2!11844 lt!395918) (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005))))))

(declare-fun b!255006 () Bool)

(assert (=> b!255006 (= e!176690 (invariant!0 (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005) (size!6039 (buf!6553 (_2!11844 lt!395914)))))))

(declare-fun b!255007 () Bool)

(declare-fun res!213692 () Bool)

(assert (=> b!255007 (=> res!213692 e!176688)))

(declare-fun withMovedBitIndex!0 (BitStream!11000 (_ BitVec 64)) BitStream!11000)

(assert (=> b!255007 (= res!213692 (not (= (_1!11843 lt!395912) (withMovedBitIndex!0 (_1!11843 lt!395899) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255008 () Bool)

(declare-fun e!176695 () Bool)

(declare-fun lt!395901 () tuple2!21816)

(declare-fun lt!395904 () tuple2!21818)

(assert (=> b!255008 (= e!176695 (not (or (not (_2!11842 lt!395901)) (not (= (_1!11842 lt!395901) (_2!11843 lt!395904))))))))

(assert (=> b!255008 (= lt!395901 (checkBitsLoopPure!0 (_1!11843 lt!395904) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!395919 () (_ BitVec 64))

(assert (=> b!255008 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!395919)))

(declare-fun lt!395910 () Unit!18280)

(assert (=> b!255008 (= lt!395910 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11844 lt!395918) (buf!6553 (_2!11844 lt!395914)) lt!395919))))

(assert (=> b!255008 (= lt!395904 (reader!0 (_2!11844 lt!395918) (_2!11844 lt!395914)))))

(declare-fun b!255009 () Bool)

(assert (=> b!255009 (= e!176691 e!176695)))

(declare-fun res!213694 () Bool)

(assert (=> b!255009 (=> (not res!213694) (not e!176695))))

(assert (=> b!255009 (= res!213694 (= (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395914))) (currentByte!12026 (_2!11844 lt!395914)) (currentBit!12021 (_2!11844 lt!395914))) (bvadd (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395918))) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918))) lt!395919)))))

(assert (=> b!255009 (= lt!395919 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255010 () Bool)

(declare-fun res!213701 () Bool)

(assert (=> b!255010 (=> (not res!213701) (not e!176687))))

(assert (=> b!255010 (= res!213701 (isPrefixOf!0 thiss!1005 (_2!11844 lt!395918)))))

(declare-fun b!255011 () Bool)

(declare-fun res!213699 () Bool)

(assert (=> b!255011 (=> (not res!213699) (not e!176695))))

(assert (=> b!255011 (= res!213699 (isPrefixOf!0 (_2!11844 lt!395918) (_2!11844 lt!395914)))))

(assert (= (and start!54520 res!213690) b!255000))

(assert (= (and b!255000 res!213696) b!254996))

(assert (= (and b!254996 res!213693) b!254999))

(assert (= (and b!254999 res!213688) b!255004))

(assert (= (and b!255004 res!213691) b!255010))

(assert (= (and b!255010 res!213701) b!255005))

(assert (= (and b!255005 res!213689) b!254998))

(assert (= (and b!254999 res!213700) b!255009))

(assert (= (and b!255009 res!213694) b!255011))

(assert (= (and b!255011 res!213699) b!255008))

(assert (= (and b!254999 res!213697) b!255002))

(assert (= (and b!255002 res!213698) b!255006))

(assert (= (and b!254999 res!213702) b!254995))

(assert (= (and b!254999 (not res!213695)) b!255007))

(assert (= (and b!255007 (not res!213692)) b!255003))

(assert (= (and b!255003 (not res!213687)) b!255001))

(assert (= start!54520 b!254997))

(declare-fun m!384049 () Bool)

(assert (=> b!255007 m!384049))

(declare-fun m!384051 () Bool)

(assert (=> start!54520 m!384051))

(declare-fun m!384053 () Bool)

(assert (=> b!255004 m!384053))

(declare-fun m!384055 () Bool)

(assert (=> b!255004 m!384055))

(declare-fun m!384057 () Bool)

(assert (=> b!254998 m!384057))

(declare-fun m!384059 () Bool)

(assert (=> b!255002 m!384059))

(declare-fun m!384061 () Bool)

(assert (=> b!255009 m!384061))

(assert (=> b!255009 m!384053))

(declare-fun m!384063 () Bool)

(assert (=> b!255006 m!384063))

(declare-fun m!384065 () Bool)

(assert (=> b!254997 m!384065))

(declare-fun m!384067 () Bool)

(assert (=> b!255008 m!384067))

(declare-fun m!384069 () Bool)

(assert (=> b!255008 m!384069))

(declare-fun m!384071 () Bool)

(assert (=> b!255008 m!384071))

(declare-fun m!384073 () Bool)

(assert (=> b!255008 m!384073))

(declare-fun m!384075 () Bool)

(assert (=> b!255000 m!384075))

(declare-fun m!384077 () Bool)

(assert (=> b!254999 m!384077))

(declare-fun m!384079 () Bool)

(assert (=> b!254999 m!384079))

(declare-fun m!384081 () Bool)

(assert (=> b!254999 m!384081))

(declare-fun m!384083 () Bool)

(assert (=> b!254999 m!384083))

(declare-fun m!384085 () Bool)

(assert (=> b!254999 m!384085))

(declare-fun m!384087 () Bool)

(assert (=> b!254999 m!384087))

(declare-fun m!384089 () Bool)

(assert (=> b!254999 m!384089))

(declare-fun m!384091 () Bool)

(assert (=> b!254999 m!384091))

(declare-fun m!384093 () Bool)

(assert (=> b!254999 m!384093))

(declare-fun m!384095 () Bool)

(assert (=> b!254999 m!384095))

(declare-fun m!384097 () Bool)

(assert (=> b!254999 m!384097))

(declare-fun m!384099 () Bool)

(assert (=> b!254999 m!384099))

(declare-fun m!384101 () Bool)

(assert (=> b!254999 m!384101))

(declare-fun m!384103 () Bool)

(assert (=> b!254999 m!384103))

(declare-fun m!384105 () Bool)

(assert (=> b!254999 m!384105))

(declare-fun m!384107 () Bool)

(assert (=> b!254999 m!384107))

(declare-fun m!384109 () Bool)

(assert (=> b!254999 m!384109))

(declare-fun m!384111 () Bool)

(assert (=> b!254999 m!384111))

(declare-fun m!384113 () Bool)

(assert (=> b!254999 m!384113))

(assert (=> b!254999 m!384073))

(declare-fun m!384115 () Bool)

(assert (=> b!255005 m!384115))

(assert (=> b!255005 m!384115))

(declare-fun m!384117 () Bool)

(assert (=> b!255005 m!384117))

(declare-fun m!384119 () Bool)

(assert (=> b!255011 m!384119))

(declare-fun m!384121 () Bool)

(assert (=> b!255010 m!384121))

(assert (=> b!255001 m!384055))

(push 1)

(assert (not b!255004))

(assert (not b!255000))

(assert (not b!255009))

(assert (not b!254999))

(assert (not b!255007))

(assert (not b!255006))

(assert (not b!255008))

(assert (not b!255001))

(assert (not b!254997))

(assert (not start!54520))

(assert (not b!254998))

(assert (not b!255011))

(assert (not b!255005))

(assert (not b!255010))

(assert (not b!255002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85848 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!85848 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 thiss!1005))) ((_ sign_extend 32) (currentByte!12026 thiss!1005)) ((_ sign_extend 32) (currentBit!12021 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 thiss!1005))) ((_ sign_extend 32) (currentByte!12026 thiss!1005)) ((_ sign_extend 32) (currentBit!12021 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21654 () Bool)

(assert (= bs!21654 d!85848))

(declare-fun m!384451 () Bool)

(assert (=> bs!21654 m!384451))

(assert (=> b!255000 d!85848))

(declare-fun d!85850 () Bool)

(declare-fun res!213871 () Bool)

(declare-fun e!176802 () Bool)

(assert (=> d!85850 (=> (not res!213871) (not e!176802))))

(assert (=> d!85850 (= res!213871 (= (size!6039 (buf!6553 (_2!11844 lt!395918))) (size!6039 (buf!6553 (_2!11844 lt!395914)))))))

(assert (=> d!85850 (= (isPrefixOf!0 (_2!11844 lt!395918) (_2!11844 lt!395914)) e!176802)))

(declare-fun b!255194 () Bool)

(declare-fun res!213870 () Bool)

(assert (=> b!255194 (=> (not res!213870) (not e!176802))))

(assert (=> b!255194 (= res!213870 (bvsle (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395918))) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918))) (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395914))) (currentByte!12026 (_2!11844 lt!395914)) (currentBit!12021 (_2!11844 lt!395914)))))))

(declare-fun b!255195 () Bool)

(declare-fun e!176801 () Bool)

(assert (=> b!255195 (= e!176802 e!176801)))

(declare-fun res!213869 () Bool)

(assert (=> b!255195 (=> res!213869 e!176801)))

(assert (=> b!255195 (= res!213869 (= (size!6039 (buf!6553 (_2!11844 lt!395918))) #b00000000000000000000000000000000))))

(declare-fun b!255196 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13766 array!13766 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255196 (= e!176801 (arrayBitRangesEq!0 (buf!6553 (_2!11844 lt!395918)) (buf!6553 (_2!11844 lt!395914)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395918))) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918)))))))

(assert (= (and d!85850 res!213871) b!255194))

(assert (= (and b!255194 res!213870) b!255195))

(assert (= (and b!255195 (not res!213869)) b!255196))

(assert (=> b!255194 m!384053))

(assert (=> b!255194 m!384061))

(assert (=> b!255196 m!384053))

(assert (=> b!255196 m!384053))

(declare-fun m!384453 () Bool)

(assert (=> b!255196 m!384453))

(assert (=> b!255011 d!85850))

(declare-fun d!85852 () Bool)

(declare-fun res!213874 () Bool)

(declare-fun e!176804 () Bool)

(assert (=> d!85852 (=> (not res!213874) (not e!176804))))

(assert (=> d!85852 (= res!213874 (= (size!6039 (buf!6553 thiss!1005)) (size!6039 (buf!6553 (_2!11844 lt!395918)))))))

(assert (=> d!85852 (= (isPrefixOf!0 thiss!1005 (_2!11844 lt!395918)) e!176804)))

(declare-fun b!255197 () Bool)

(declare-fun res!213873 () Bool)

(assert (=> b!255197 (=> (not res!213873) (not e!176804))))

(assert (=> b!255197 (= res!213873 (bvsle (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)) (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395918))) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918)))))))

(declare-fun b!255198 () Bool)

(declare-fun e!176803 () Bool)

(assert (=> b!255198 (= e!176804 e!176803)))

(declare-fun res!213872 () Bool)

(assert (=> b!255198 (=> res!213872 e!176803)))

(assert (=> b!255198 (= res!213872 (= (size!6039 (buf!6553 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!255199 () Bool)

(assert (=> b!255199 (= e!176803 (arrayBitRangesEq!0 (buf!6553 thiss!1005) (buf!6553 (_2!11844 lt!395918)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005))))))

(assert (= (and d!85852 res!213874) b!255197))

(assert (= (and b!255197 res!213873) b!255198))

(assert (= (and b!255198 (not res!213872)) b!255199))

(assert (=> b!255197 m!384055))

(assert (=> b!255197 m!384053))

(assert (=> b!255199 m!384055))

(assert (=> b!255199 m!384055))

(declare-fun m!384455 () Bool)

(assert (=> b!255199 m!384455))

(assert (=> b!255010 d!85852))

(declare-fun d!85854 () Bool)

(assert (=> d!85854 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 thiss!1005)) ((_ sign_extend 32) (currentBit!12021 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!396330 () Unit!18280)

(declare-fun choose!9 (BitStream!11000 array!13766 (_ BitVec 64) BitStream!11000) Unit!18280)

(assert (=> d!85854 (= lt!396330 (choose!9 thiss!1005 (buf!6553 (_2!11844 lt!395914)) (bvsub nBits!297 from!289) (BitStream!11001 (buf!6553 (_2!11844 lt!395914)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005))))))

(assert (=> d!85854 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6553 (_2!11844 lt!395914)) (bvsub nBits!297 from!289)) lt!396330)))

(declare-fun bs!21655 () Bool)

(assert (= bs!21655 d!85854))

(assert (=> bs!21655 m!384079))

(declare-fun m!384457 () Bool)

(assert (=> bs!21655 m!384457))

(assert (=> b!254999 d!85854))

(declare-fun d!85856 () Bool)

(declare-fun e!176807 () Bool)

(assert (=> d!85856 e!176807))

(declare-fun res!213877 () Bool)

(assert (=> d!85856 (=> (not res!213877) (not e!176807))))

(assert (=> d!85856 (= res!213877 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!396333 () Unit!18280)

(declare-fun choose!27 (BitStream!11000 BitStream!11000 (_ BitVec 64) (_ BitVec 64)) Unit!18280)

(assert (=> d!85856 (= lt!396333 (choose!27 thiss!1005 (_2!11844 lt!395918) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!85856 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!85856 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11844 lt!395918) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!396333)))

(declare-fun b!255202 () Bool)

(assert (=> b!255202 (= e!176807 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395918)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!85856 res!213877) b!255202))

(declare-fun m!384459 () Bool)

(assert (=> d!85856 m!384459))

(declare-fun m!384461 () Bool)

(assert (=> b!255202 m!384461))

(assert (=> b!254999 d!85856))

(declare-datatypes ((tuple2!21826 0))(
  ( (tuple2!21827 (_1!11847 Bool) (_2!11847 BitStream!11000)) )
))
(declare-fun lt!396336 () tuple2!21826)

(declare-fun d!85858 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!11000 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21826)

(assert (=> d!85858 (= lt!396336 (checkBitsLoop!0 (_1!11843 lt!395912) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85858 (= (checkBitsLoopPure!0 (_1!11843 lt!395912) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21817 (_2!11847 lt!396336) (_1!11847 lt!396336)))))

(declare-fun bs!21656 () Bool)

(assert (= bs!21656 d!85858))

(declare-fun m!384463 () Bool)

(assert (=> bs!21656 m!384463))

(assert (=> b!254999 d!85858))

(declare-fun b!255213 () Bool)

(declare-fun res!213884 () Bool)

(declare-fun e!176812 () Bool)

(assert (=> b!255213 (=> (not res!213884) (not e!176812))))

(declare-fun lt!396395 () tuple2!21818)

(assert (=> b!255213 (= res!213884 (isPrefixOf!0 (_2!11843 lt!396395) (_2!11844 lt!395914)))))

(declare-fun b!255214 () Bool)

(declare-fun e!176813 () Unit!18280)

(declare-fun lt!396377 () Unit!18280)

(assert (=> b!255214 (= e!176813 lt!396377)))

(declare-fun lt!396392 () (_ BitVec 64))

(assert (=> b!255214 (= lt!396392 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!396394 () (_ BitVec 64))

(assert (=> b!255214 (= lt!396394 (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13766 array!13766 (_ BitVec 64) (_ BitVec 64)) Unit!18280)

(assert (=> b!255214 (= lt!396377 (arrayBitRangesEqSymmetric!0 (buf!6553 thiss!1005) (buf!6553 (_2!11844 lt!395914)) lt!396392 lt!396394))))

(assert (=> b!255214 (arrayBitRangesEq!0 (buf!6553 (_2!11844 lt!395914)) (buf!6553 thiss!1005) lt!396392 lt!396394)))

(declare-fun b!255215 () Bool)

(declare-fun Unit!18286 () Unit!18280)

(assert (=> b!255215 (= e!176813 Unit!18286)))

(declare-fun d!85860 () Bool)

(assert (=> d!85860 e!176812))

(declare-fun res!213886 () Bool)

(assert (=> d!85860 (=> (not res!213886) (not e!176812))))

(assert (=> d!85860 (= res!213886 (isPrefixOf!0 (_1!11843 lt!396395) (_2!11843 lt!396395)))))

(declare-fun lt!396396 () BitStream!11000)

(assert (=> d!85860 (= lt!396395 (tuple2!21819 lt!396396 (_2!11844 lt!395914)))))

(declare-fun lt!396383 () Unit!18280)

(declare-fun lt!396378 () Unit!18280)

(assert (=> d!85860 (= lt!396383 lt!396378)))

(assert (=> d!85860 (isPrefixOf!0 lt!396396 (_2!11844 lt!395914))))

(assert (=> d!85860 (= lt!396378 (lemmaIsPrefixTransitive!0 lt!396396 (_2!11844 lt!395914) (_2!11844 lt!395914)))))

(declare-fun lt!396385 () Unit!18280)

(declare-fun lt!396382 () Unit!18280)

(assert (=> d!85860 (= lt!396385 lt!396382)))

(assert (=> d!85860 (isPrefixOf!0 lt!396396 (_2!11844 lt!395914))))

(assert (=> d!85860 (= lt!396382 (lemmaIsPrefixTransitive!0 lt!396396 thiss!1005 (_2!11844 lt!395914)))))

(declare-fun lt!396389 () Unit!18280)

(assert (=> d!85860 (= lt!396389 e!176813)))

(declare-fun c!11769 () Bool)

(assert (=> d!85860 (= c!11769 (not (= (size!6039 (buf!6553 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!396381 () Unit!18280)

(declare-fun lt!396386 () Unit!18280)

(assert (=> d!85860 (= lt!396381 lt!396386)))

(assert (=> d!85860 (isPrefixOf!0 (_2!11844 lt!395914) (_2!11844 lt!395914))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11000) Unit!18280)

(assert (=> d!85860 (= lt!396386 (lemmaIsPrefixRefl!0 (_2!11844 lt!395914)))))

(declare-fun lt!396390 () Unit!18280)

(declare-fun lt!396380 () Unit!18280)

(assert (=> d!85860 (= lt!396390 lt!396380)))

(assert (=> d!85860 (= lt!396380 (lemmaIsPrefixRefl!0 (_2!11844 lt!395914)))))

(declare-fun lt!396384 () Unit!18280)

(declare-fun lt!396379 () Unit!18280)

(assert (=> d!85860 (= lt!396384 lt!396379)))

(assert (=> d!85860 (isPrefixOf!0 lt!396396 lt!396396)))

(assert (=> d!85860 (= lt!396379 (lemmaIsPrefixRefl!0 lt!396396))))

(declare-fun lt!396388 () Unit!18280)

(declare-fun lt!396391 () Unit!18280)

(assert (=> d!85860 (= lt!396388 lt!396391)))

(assert (=> d!85860 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85860 (= lt!396391 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!85860 (= lt!396396 (BitStream!11001 (buf!6553 (_2!11844 lt!395914)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)))))

(assert (=> d!85860 (isPrefixOf!0 thiss!1005 (_2!11844 lt!395914))))

(assert (=> d!85860 (= (reader!0 thiss!1005 (_2!11844 lt!395914)) lt!396395)))

(declare-fun b!255216 () Bool)

(declare-fun res!213885 () Bool)

(assert (=> b!255216 (=> (not res!213885) (not e!176812))))

(assert (=> b!255216 (= res!213885 (isPrefixOf!0 (_1!11843 lt!396395) thiss!1005))))

(declare-fun lt!396393 () (_ BitVec 64))

(declare-fun lt!396387 () (_ BitVec 64))

(declare-fun b!255217 () Bool)

(assert (=> b!255217 (= e!176812 (= (_1!11843 lt!396395) (withMovedBitIndex!0 (_2!11843 lt!396395) (bvsub lt!396393 lt!396387))))))

(assert (=> b!255217 (or (= (bvand lt!396393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396387 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396393 lt!396387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255217 (= lt!396387 (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395914))) (currentByte!12026 (_2!11844 lt!395914)) (currentBit!12021 (_2!11844 lt!395914))))))

(assert (=> b!255217 (= lt!396393 (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)))))

(assert (= (and d!85860 c!11769) b!255214))

(assert (= (and d!85860 (not c!11769)) b!255215))

(assert (= (and d!85860 res!213886) b!255216))

(assert (= (and b!255216 res!213885) b!255213))

(assert (= (and b!255213 res!213884) b!255217))

(assert (=> b!255214 m!384055))

(declare-fun m!384465 () Bool)

(assert (=> b!255214 m!384465))

(declare-fun m!384467 () Bool)

(assert (=> b!255214 m!384467))

(declare-fun m!384469 () Bool)

(assert (=> b!255213 m!384469))

(declare-fun m!384471 () Bool)

(assert (=> d!85860 m!384471))

(assert (=> d!85860 m!384097))

(declare-fun m!384473 () Bool)

(assert (=> d!85860 m!384473))

(declare-fun m!384475 () Bool)

(assert (=> d!85860 m!384475))

(declare-fun m!384477 () Bool)

(assert (=> d!85860 m!384477))

(declare-fun m!384479 () Bool)

(assert (=> d!85860 m!384479))

(declare-fun m!384481 () Bool)

(assert (=> d!85860 m!384481))

(declare-fun m!384483 () Bool)

(assert (=> d!85860 m!384483))

(declare-fun m!384485 () Bool)

(assert (=> d!85860 m!384485))

(declare-fun m!384487 () Bool)

(assert (=> d!85860 m!384487))

(declare-fun m!384489 () Bool)

(assert (=> d!85860 m!384489))

(declare-fun m!384491 () Bool)

(assert (=> b!255217 m!384491))

(assert (=> b!255217 m!384061))

(assert (=> b!255217 m!384055))

(declare-fun m!384493 () Bool)

(assert (=> b!255216 m!384493))

(assert (=> b!254999 d!85860))

(declare-fun d!85862 () Bool)

(declare-fun lt!396399 () tuple2!21826)

(declare-fun readBit!0 (BitStream!11000) tuple2!21826)

(assert (=> d!85862 (= lt!396399 (readBit!0 (BitStream!11001 (buf!6553 (_2!11844 lt!395914)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005))))))

(assert (=> d!85862 (= (readBitPure!0 (BitStream!11001 (buf!6553 (_2!11844 lt!395914)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005))) (tuple2!21817 (_2!11847 lt!396399) (_1!11847 lt!396399)))))

(declare-fun bs!21657 () Bool)

(assert (= bs!21657 d!85862))

(declare-fun m!384495 () Bool)

(assert (=> bs!21657 m!384495))

(assert (=> b!254999 d!85862))

(declare-fun b!255228 () Bool)

(declare-fun res!213896 () Bool)

(declare-fun e!176819 () Bool)

(assert (=> b!255228 (=> (not res!213896) (not e!176819))))

(declare-fun lt!396408 () tuple2!21820)

(assert (=> b!255228 (= res!213896 (isPrefixOf!0 thiss!1005 (_2!11844 lt!396408)))))

(declare-fun d!85864 () Bool)

(assert (=> d!85864 e!176819))

(declare-fun res!213895 () Bool)

(assert (=> d!85864 (=> (not res!213895) (not e!176819))))

(assert (=> d!85864 (= res!213895 (= (size!6039 (buf!6553 thiss!1005)) (size!6039 (buf!6553 (_2!11844 lt!396408)))))))

(declare-fun choose!16 (BitStream!11000 Bool) tuple2!21820)

(assert (=> d!85864 (= lt!396408 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!85864 (validate_offset_bit!0 ((_ sign_extend 32) (size!6039 (buf!6553 thiss!1005))) ((_ sign_extend 32) (currentByte!12026 thiss!1005)) ((_ sign_extend 32) (currentBit!12021 thiss!1005)))))

(assert (=> d!85864 (= (appendBit!0 thiss!1005 bit!26) lt!396408)))

(declare-fun b!255230 () Bool)

(declare-fun e!176818 () Bool)

(declare-fun lt!396410 () tuple2!21816)

(assert (=> b!255230 (= e!176818 (= (bitIndex!0 (size!6039 (buf!6553 (_1!11842 lt!396410))) (currentByte!12026 (_1!11842 lt!396410)) (currentBit!12021 (_1!11842 lt!396410))) (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!396408))) (currentByte!12026 (_2!11844 lt!396408)) (currentBit!12021 (_2!11844 lt!396408)))))))

(declare-fun b!255227 () Bool)

(declare-fun res!213898 () Bool)

(assert (=> b!255227 (=> (not res!213898) (not e!176819))))

(declare-fun lt!396411 () (_ BitVec 64))

(declare-fun lt!396409 () (_ BitVec 64))

(assert (=> b!255227 (= res!213898 (= (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!396408))) (currentByte!12026 (_2!11844 lt!396408)) (currentBit!12021 (_2!11844 lt!396408))) (bvadd lt!396409 lt!396411)))))

(assert (=> b!255227 (or (not (= (bvand lt!396409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396411 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!396409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!396409 lt!396411) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255227 (= lt!396411 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!255227 (= lt!396409 (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)))))

(declare-fun b!255229 () Bool)

(assert (=> b!255229 (= e!176819 e!176818)))

(declare-fun res!213897 () Bool)

(assert (=> b!255229 (=> (not res!213897) (not e!176818))))

(assert (=> b!255229 (= res!213897 (and (= (_2!11842 lt!396410) bit!26) (= (_1!11842 lt!396410) (_2!11844 lt!396408))))))

(assert (=> b!255229 (= lt!396410 (readBitPure!0 (readerFrom!0 (_2!11844 lt!396408) (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005))))))

(assert (= (and d!85864 res!213895) b!255227))

(assert (= (and b!255227 res!213898) b!255228))

(assert (= (and b!255228 res!213896) b!255229))

(assert (= (and b!255229 res!213897) b!255230))

(declare-fun m!384497 () Bool)

(assert (=> d!85864 m!384497))

(declare-fun m!384499 () Bool)

(assert (=> d!85864 m!384499))

(declare-fun m!384501 () Bool)

(assert (=> b!255228 m!384501))

(declare-fun m!384503 () Bool)

(assert (=> b!255227 m!384503))

(assert (=> b!255227 m!384055))

(declare-fun m!384505 () Bool)

(assert (=> b!255230 m!384505))

(assert (=> b!255230 m!384503))

(declare-fun m!384507 () Bool)

(assert (=> b!255229 m!384507))

(assert (=> b!255229 m!384507))

(declare-fun m!384509 () Bool)

(assert (=> b!255229 m!384509))

(assert (=> b!254999 d!85864))

(declare-fun d!85866 () Bool)

(declare-fun e!176822 () Bool)

(assert (=> d!85866 e!176822))

(declare-fun res!213901 () Bool)

(assert (=> d!85866 (=> (not res!213901) (not e!176822))))

(declare-fun lt!396423 () tuple2!21816)

(declare-fun lt!396420 () tuple2!21816)

(assert (=> d!85866 (= res!213901 (= (bitIndex!0 (size!6039 (buf!6553 (_1!11842 lt!396423))) (currentByte!12026 (_1!11842 lt!396423)) (currentBit!12021 (_1!11842 lt!396423))) (bitIndex!0 (size!6039 (buf!6553 (_1!11842 lt!396420))) (currentByte!12026 (_1!11842 lt!396420)) (currentBit!12021 (_1!11842 lt!396420)))))))

(declare-fun lt!396421 () Unit!18280)

(declare-fun lt!396422 () BitStream!11000)

(declare-fun choose!50 (BitStream!11000 BitStream!11000 BitStream!11000 tuple2!21816 tuple2!21816 BitStream!11000 Bool tuple2!21816 tuple2!21816 BitStream!11000 Bool) Unit!18280)

(assert (=> d!85866 (= lt!396421 (choose!50 lt!395911 (_2!11844 lt!395914) lt!396422 lt!396423 (tuple2!21817 (_1!11842 lt!396423) (_2!11842 lt!396423)) (_1!11842 lt!396423) (_2!11842 lt!396423) lt!396420 (tuple2!21817 (_1!11842 lt!396420) (_2!11842 lt!396420)) (_1!11842 lt!396420) (_2!11842 lt!396420)))))

(assert (=> d!85866 (= lt!396420 (readBitPure!0 lt!396422))))

(assert (=> d!85866 (= lt!396423 (readBitPure!0 lt!395911))))

(assert (=> d!85866 (= lt!396422 (BitStream!11001 (buf!6553 (_2!11844 lt!395914)) (currentByte!12026 lt!395911) (currentBit!12021 lt!395911)))))

(assert (=> d!85866 (invariant!0 (currentBit!12021 lt!395911) (currentByte!12026 lt!395911) (size!6039 (buf!6553 (_2!11844 lt!395914))))))

(assert (=> d!85866 (= (readBitPrefixLemma!0 lt!395911 (_2!11844 lt!395914)) lt!396421)))

(declare-fun b!255233 () Bool)

(assert (=> b!255233 (= e!176822 (= (_2!11842 lt!396423) (_2!11842 lt!396420)))))

(assert (= (and d!85866 res!213901) b!255233))

(declare-fun m!384511 () Bool)

(assert (=> d!85866 m!384511))

(declare-fun m!384513 () Bool)

(assert (=> d!85866 m!384513))

(declare-fun m!384515 () Bool)

(assert (=> d!85866 m!384515))

(declare-fun m!384517 () Bool)

(assert (=> d!85866 m!384517))

(assert (=> d!85866 m!384077))

(declare-fun m!384519 () Bool)

(assert (=> d!85866 m!384519))

(assert (=> b!254999 d!85866))

(declare-fun d!85868 () Bool)

(declare-fun lt!396424 () tuple2!21826)

(assert (=> d!85868 (= lt!396424 (readBit!0 lt!395911))))

(assert (=> d!85868 (= (readBitPure!0 lt!395911) (tuple2!21817 (_2!11847 lt!396424) (_1!11847 lt!396424)))))

(declare-fun bs!21658 () Bool)

(assert (= bs!21658 d!85868))

(declare-fun m!384521 () Bool)

(assert (=> bs!21658 m!384521))

(assert (=> b!254999 d!85868))

(declare-fun d!85870 () Bool)

(declare-fun e!176825 () Bool)

(assert (=> d!85870 e!176825))

(declare-fun res!213907 () Bool)

(assert (=> d!85870 (=> (not res!213907) (not e!176825))))

(declare-fun lt!396438 () (_ BitVec 64))

(declare-fun lt!396440 () (_ BitVec 64))

(declare-fun lt!396442 () (_ BitVec 64))

(assert (=> d!85870 (= res!213907 (= lt!396440 (bvsub lt!396438 lt!396442)))))

(assert (=> d!85870 (or (= (bvand lt!396438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396438 lt!396442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85870 (= lt!396442 (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 (_1!11842 lt!395897)))) ((_ sign_extend 32) (currentByte!12026 (_1!11842 lt!395897))) ((_ sign_extend 32) (currentBit!12021 (_1!11842 lt!395897)))))))

(declare-fun lt!396437 () (_ BitVec 64))

(declare-fun lt!396439 () (_ BitVec 64))

(assert (=> d!85870 (= lt!396438 (bvmul lt!396437 lt!396439))))

(assert (=> d!85870 (or (= lt!396437 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396439 (bvsdiv (bvmul lt!396437 lt!396439) lt!396437)))))

(assert (=> d!85870 (= lt!396439 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85870 (= lt!396437 ((_ sign_extend 32) (size!6039 (buf!6553 (_1!11842 lt!395897)))))))

(assert (=> d!85870 (= lt!396440 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12026 (_1!11842 lt!395897))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12021 (_1!11842 lt!395897)))))))

(assert (=> d!85870 (invariant!0 (currentBit!12021 (_1!11842 lt!395897)) (currentByte!12026 (_1!11842 lt!395897)) (size!6039 (buf!6553 (_1!11842 lt!395897))))))

(assert (=> d!85870 (= (bitIndex!0 (size!6039 (buf!6553 (_1!11842 lt!395897))) (currentByte!12026 (_1!11842 lt!395897)) (currentBit!12021 (_1!11842 lt!395897))) lt!396440)))

(declare-fun b!255238 () Bool)

(declare-fun res!213906 () Bool)

(assert (=> b!255238 (=> (not res!213906) (not e!176825))))

(assert (=> b!255238 (= res!213906 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396440))))

(declare-fun b!255239 () Bool)

(declare-fun lt!396441 () (_ BitVec 64))

(assert (=> b!255239 (= e!176825 (bvsle lt!396440 (bvmul lt!396441 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255239 (or (= lt!396441 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396441 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396441)))))

(assert (=> b!255239 (= lt!396441 ((_ sign_extend 32) (size!6039 (buf!6553 (_1!11842 lt!395897)))))))

(assert (= (and d!85870 res!213907) b!255238))

(assert (= (and b!255238 res!213906) b!255239))

(declare-fun m!384523 () Bool)

(assert (=> d!85870 m!384523))

(declare-fun m!384525 () Bool)

(assert (=> d!85870 m!384525))

(assert (=> b!254999 d!85870))

(declare-fun b!255250 () Bool)

(declare-fun e!176831 () Bool)

(declare-fun lt!396465 () tuple2!21816)

(declare-fun lt!396463 () tuple2!21818)

(assert (=> b!255250 (= e!176831 (and (_2!11842 lt!396465) (= (_1!11842 lt!396465) (_2!11843 lt!396463))))))

(assert (=> b!255250 (= lt!396465 (checkBitsLoopPure!0 (_1!11843 lt!396463) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396459 () Unit!18280)

(declare-fun lt!396464 () Unit!18280)

(assert (=> b!255250 (= lt!396459 lt!396464)))

(declare-fun lt!396460 () tuple2!21820)

(declare-fun lt!396462 () (_ BitVec 64))

(assert (=> b!255250 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!396460)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!396462)))

(assert (=> b!255250 (= lt!396464 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11844 lt!395918) (buf!6553 (_2!11844 lt!396460)) lt!396462))))

(declare-fun e!176830 () Bool)

(assert (=> b!255250 e!176830))

(declare-fun res!213919 () Bool)

(assert (=> b!255250 (=> (not res!213919) (not e!176830))))

(assert (=> b!255250 (= res!213919 (and (= (size!6039 (buf!6553 (_2!11844 lt!395918))) (size!6039 (buf!6553 (_2!11844 lt!396460)))) (bvsge lt!396462 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255250 (= lt!396462 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255250 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255250 (= lt!396463 (reader!0 (_2!11844 lt!395918) (_2!11844 lt!396460)))))

(declare-fun b!255248 () Bool)

(declare-fun res!213916 () Bool)

(assert (=> b!255248 (=> (not res!213916) (not e!176831))))

(declare-fun lt!396461 () (_ BitVec 64))

(declare-fun lt!396466 () (_ BitVec 64))

(assert (=> b!255248 (= res!213916 (= (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!396460))) (currentByte!12026 (_2!11844 lt!396460)) (currentBit!12021 (_2!11844 lt!396460))) (bvadd lt!396461 lt!396466)))))

(assert (=> b!255248 (or (not (= (bvand lt!396461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396466 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!396461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!396461 lt!396466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255248 (= lt!396466 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255248 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255248 (= lt!396461 (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395918))) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918))))))

(declare-fun b!255251 () Bool)

(assert (=> b!255251 (= e!176830 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395918)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!396462))))

(declare-fun d!85872 () Bool)

(assert (=> d!85872 e!176831))

(declare-fun res!213917 () Bool)

(assert (=> d!85872 (=> (not res!213917) (not e!176831))))

(assert (=> d!85872 (= res!213917 (= (size!6039 (buf!6553 (_2!11844 lt!395918))) (size!6039 (buf!6553 (_2!11844 lt!396460)))))))

(declare-fun choose!51 (BitStream!11000 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21820)

(assert (=> d!85872 (= lt!396460 (choose!51 (_2!11844 lt!395918) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85872 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85872 (= (appendNBitsLoop!0 (_2!11844 lt!395918) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!396460)))

(declare-fun b!255249 () Bool)

(declare-fun res!213918 () Bool)

(assert (=> b!255249 (=> (not res!213918) (not e!176831))))

(assert (=> b!255249 (= res!213918 (isPrefixOf!0 (_2!11844 lt!395918) (_2!11844 lt!396460)))))

(assert (= (and d!85872 res!213917) b!255248))

(assert (= (and b!255248 res!213916) b!255249))

(assert (= (and b!255249 res!213918) b!255250))

(assert (= (and b!255250 res!213919) b!255251))

(declare-fun m!384527 () Bool)

(assert (=> d!85872 m!384527))

(declare-fun m!384529 () Bool)

(assert (=> b!255251 m!384529))

(declare-fun m!384531 () Bool)

(assert (=> b!255250 m!384531))

(declare-fun m!384533 () Bool)

(assert (=> b!255250 m!384533))

(declare-fun m!384535 () Bool)

(assert (=> b!255250 m!384535))

(declare-fun m!384537 () Bool)

(assert (=> b!255250 m!384537))

(declare-fun m!384539 () Bool)

(assert (=> b!255249 m!384539))

(declare-fun m!384541 () Bool)

(assert (=> b!255248 m!384541))

(assert (=> b!255248 m!384053))

(assert (=> b!254999 d!85872))

(declare-fun d!85874 () Bool)

(assert (=> d!85874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 thiss!1005)) ((_ sign_extend 32) (currentBit!12021 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 thiss!1005)) ((_ sign_extend 32) (currentBit!12021 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21659 () Bool)

(assert (= bs!21659 d!85874))

(declare-fun m!384543 () Bool)

(assert (=> bs!21659 m!384543))

(assert (=> b!254999 d!85874))

(declare-fun b!255252 () Bool)

(declare-fun res!213920 () Bool)

(declare-fun e!176832 () Bool)

(assert (=> b!255252 (=> (not res!213920) (not e!176832))))

(declare-fun lt!396485 () tuple2!21818)

(assert (=> b!255252 (= res!213920 (isPrefixOf!0 (_2!11843 lt!396485) (_2!11844 lt!395914)))))

(declare-fun b!255253 () Bool)

(declare-fun e!176833 () Unit!18280)

(declare-fun lt!396467 () Unit!18280)

(assert (=> b!255253 (= e!176833 lt!396467)))

(declare-fun lt!396482 () (_ BitVec 64))

(assert (=> b!255253 (= lt!396482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!396484 () (_ BitVec 64))

(assert (=> b!255253 (= lt!396484 (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395918))) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918))))))

(assert (=> b!255253 (= lt!396467 (arrayBitRangesEqSymmetric!0 (buf!6553 (_2!11844 lt!395918)) (buf!6553 (_2!11844 lt!395914)) lt!396482 lt!396484))))

(assert (=> b!255253 (arrayBitRangesEq!0 (buf!6553 (_2!11844 lt!395914)) (buf!6553 (_2!11844 lt!395918)) lt!396482 lt!396484)))

(declare-fun b!255254 () Bool)

(declare-fun Unit!18287 () Unit!18280)

(assert (=> b!255254 (= e!176833 Unit!18287)))

(declare-fun d!85876 () Bool)

(assert (=> d!85876 e!176832))

(declare-fun res!213922 () Bool)

(assert (=> d!85876 (=> (not res!213922) (not e!176832))))

(assert (=> d!85876 (= res!213922 (isPrefixOf!0 (_1!11843 lt!396485) (_2!11843 lt!396485)))))

(declare-fun lt!396486 () BitStream!11000)

(assert (=> d!85876 (= lt!396485 (tuple2!21819 lt!396486 (_2!11844 lt!395914)))))

(declare-fun lt!396473 () Unit!18280)

(declare-fun lt!396468 () Unit!18280)

(assert (=> d!85876 (= lt!396473 lt!396468)))

(assert (=> d!85876 (isPrefixOf!0 lt!396486 (_2!11844 lt!395914))))

(assert (=> d!85876 (= lt!396468 (lemmaIsPrefixTransitive!0 lt!396486 (_2!11844 lt!395914) (_2!11844 lt!395914)))))

(declare-fun lt!396475 () Unit!18280)

(declare-fun lt!396472 () Unit!18280)

(assert (=> d!85876 (= lt!396475 lt!396472)))

(assert (=> d!85876 (isPrefixOf!0 lt!396486 (_2!11844 lt!395914))))

(assert (=> d!85876 (= lt!396472 (lemmaIsPrefixTransitive!0 lt!396486 (_2!11844 lt!395918) (_2!11844 lt!395914)))))

(declare-fun lt!396479 () Unit!18280)

(assert (=> d!85876 (= lt!396479 e!176833)))

(declare-fun c!11770 () Bool)

(assert (=> d!85876 (= c!11770 (not (= (size!6039 (buf!6553 (_2!11844 lt!395918))) #b00000000000000000000000000000000)))))

(declare-fun lt!396471 () Unit!18280)

(declare-fun lt!396476 () Unit!18280)

(assert (=> d!85876 (= lt!396471 lt!396476)))

(assert (=> d!85876 (isPrefixOf!0 (_2!11844 lt!395914) (_2!11844 lt!395914))))

(assert (=> d!85876 (= lt!396476 (lemmaIsPrefixRefl!0 (_2!11844 lt!395914)))))

(declare-fun lt!396480 () Unit!18280)

(declare-fun lt!396470 () Unit!18280)

(assert (=> d!85876 (= lt!396480 lt!396470)))

(assert (=> d!85876 (= lt!396470 (lemmaIsPrefixRefl!0 (_2!11844 lt!395914)))))

(declare-fun lt!396474 () Unit!18280)

(declare-fun lt!396469 () Unit!18280)

(assert (=> d!85876 (= lt!396474 lt!396469)))

(assert (=> d!85876 (isPrefixOf!0 lt!396486 lt!396486)))

(assert (=> d!85876 (= lt!396469 (lemmaIsPrefixRefl!0 lt!396486))))

(declare-fun lt!396478 () Unit!18280)

(declare-fun lt!396481 () Unit!18280)

(assert (=> d!85876 (= lt!396478 lt!396481)))

(assert (=> d!85876 (isPrefixOf!0 (_2!11844 lt!395918) (_2!11844 lt!395918))))

(assert (=> d!85876 (= lt!396481 (lemmaIsPrefixRefl!0 (_2!11844 lt!395918)))))

(assert (=> d!85876 (= lt!396486 (BitStream!11001 (buf!6553 (_2!11844 lt!395914)) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918))))))

(assert (=> d!85876 (isPrefixOf!0 (_2!11844 lt!395918) (_2!11844 lt!395914))))

(assert (=> d!85876 (= (reader!0 (_2!11844 lt!395918) (_2!11844 lt!395914)) lt!396485)))

(declare-fun b!255255 () Bool)

(declare-fun res!213921 () Bool)

(assert (=> b!255255 (=> (not res!213921) (not e!176832))))

(assert (=> b!255255 (= res!213921 (isPrefixOf!0 (_1!11843 lt!396485) (_2!11844 lt!395918)))))

(declare-fun lt!396477 () (_ BitVec 64))

(declare-fun b!255256 () Bool)

(declare-fun lt!396483 () (_ BitVec 64))

(assert (=> b!255256 (= e!176832 (= (_1!11843 lt!396485) (withMovedBitIndex!0 (_2!11843 lt!396485) (bvsub lt!396483 lt!396477))))))

(assert (=> b!255256 (or (= (bvand lt!396483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396477 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396483 lt!396477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255256 (= lt!396477 (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395914))) (currentByte!12026 (_2!11844 lt!395914)) (currentBit!12021 (_2!11844 lt!395914))))))

(assert (=> b!255256 (= lt!396483 (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395918))) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918))))))

(assert (= (and d!85876 c!11770) b!255253))

(assert (= (and d!85876 (not c!11770)) b!255254))

(assert (= (and d!85876 res!213922) b!255255))

(assert (= (and b!255255 res!213921) b!255252))

(assert (= (and b!255252 res!213920) b!255256))

(assert (=> b!255253 m!384053))

(declare-fun m!384545 () Bool)

(assert (=> b!255253 m!384545))

(declare-fun m!384547 () Bool)

(assert (=> b!255253 m!384547))

(declare-fun m!384549 () Bool)

(assert (=> b!255252 m!384549))

(declare-fun m!384551 () Bool)

(assert (=> d!85876 m!384551))

(assert (=> d!85876 m!384119))

(declare-fun m!384553 () Bool)

(assert (=> d!85876 m!384553))

(declare-fun m!384555 () Bool)

(assert (=> d!85876 m!384555))

(declare-fun m!384557 () Bool)

(assert (=> d!85876 m!384557))

(assert (=> d!85876 m!384479))

(declare-fun m!384559 () Bool)

(assert (=> d!85876 m!384559))

(declare-fun m!384561 () Bool)

(assert (=> d!85876 m!384561))

(declare-fun m!384563 () Bool)

(assert (=> d!85876 m!384563))

(declare-fun m!384565 () Bool)

(assert (=> d!85876 m!384565))

(assert (=> d!85876 m!384489))

(declare-fun m!384567 () Bool)

(assert (=> b!255256 m!384567))

(assert (=> b!255256 m!384061))

(assert (=> b!255256 m!384053))

(declare-fun m!384569 () Bool)

(assert (=> b!255255 m!384569))

(assert (=> b!254999 d!85876))

(declare-fun d!85878 () Bool)

(declare-fun lt!396487 () tuple2!21826)

(assert (=> d!85878 (= lt!396487 (readBit!0 (_1!11843 lt!395899)))))

(assert (=> d!85878 (= (readBitPure!0 (_1!11843 lt!395899)) (tuple2!21817 (_2!11847 lt!396487) (_1!11847 lt!396487)))))

(declare-fun bs!21660 () Bool)

(assert (= bs!21660 d!85878))

(declare-fun m!384571 () Bool)

(assert (=> bs!21660 m!384571))

(assert (=> b!254999 d!85878))

(declare-fun d!85880 () Bool)

(assert (=> d!85880 (isPrefixOf!0 thiss!1005 (_2!11844 lt!395914))))

(declare-fun lt!396490 () Unit!18280)

(declare-fun choose!30 (BitStream!11000 BitStream!11000 BitStream!11000) Unit!18280)

(assert (=> d!85880 (= lt!396490 (choose!30 thiss!1005 (_2!11844 lt!395918) (_2!11844 lt!395914)))))

(assert (=> d!85880 (isPrefixOf!0 thiss!1005 (_2!11844 lt!395918))))

(assert (=> d!85880 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11844 lt!395918) (_2!11844 lt!395914)) lt!396490)))

(declare-fun bs!21661 () Bool)

(assert (= bs!21661 d!85880))

(assert (=> bs!21661 m!384097))

(declare-fun m!384573 () Bool)

(assert (=> bs!21661 m!384573))

(assert (=> bs!21661 m!384121))

(assert (=> b!254999 d!85880))

(declare-fun d!85882 () Bool)

(assert (=> d!85882 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395918)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!395902) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395918)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918)))) lt!395902))))

(declare-fun bs!21662 () Bool)

(assert (= bs!21662 d!85882))

(declare-fun m!384575 () Bool)

(assert (=> bs!21662 m!384575))

(assert (=> b!254999 d!85882))

(declare-fun lt!396491 () tuple2!21826)

(declare-fun d!85884 () Bool)

(assert (=> d!85884 (= lt!396491 (checkBitsLoop!0 (_1!11843 lt!395899) nBits!297 bit!26 from!289))))

(assert (=> d!85884 (= (checkBitsLoopPure!0 (_1!11843 lt!395899) nBits!297 bit!26 from!289) (tuple2!21817 (_2!11847 lt!396491) (_1!11847 lt!396491)))))

(declare-fun bs!21663 () Bool)

(assert (= bs!21663 d!85884))

(declare-fun m!384577 () Bool)

(assert (=> bs!21663 m!384577))

(assert (=> b!254999 d!85884))

(declare-fun d!85886 () Bool)

(assert (=> d!85886 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!395902)))

(declare-fun lt!396492 () Unit!18280)

(assert (=> d!85886 (= lt!396492 (choose!9 (_2!11844 lt!395918) (buf!6553 (_2!11844 lt!395914)) lt!395902 (BitStream!11001 (buf!6553 (_2!11844 lt!395914)) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918)))))))

(assert (=> d!85886 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11844 lt!395918) (buf!6553 (_2!11844 lt!395914)) lt!395902) lt!396492)))

(declare-fun bs!21664 () Bool)

(assert (= bs!21664 d!85886))

(assert (=> bs!21664 m!384091))

(declare-fun m!384579 () Bool)

(assert (=> bs!21664 m!384579))

(assert (=> b!254999 d!85886))

(declare-fun d!85888 () Bool)

(assert (=> d!85888 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!395902) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918)))) lt!395902))))

(declare-fun bs!21665 () Bool)

(assert (= bs!21665 d!85888))

(declare-fun m!384581 () Bool)

(assert (=> bs!21665 m!384581))

(assert (=> b!254999 d!85888))

(declare-fun d!85890 () Bool)

(declare-fun res!213925 () Bool)

(declare-fun e!176835 () Bool)

(assert (=> d!85890 (=> (not res!213925) (not e!176835))))

(assert (=> d!85890 (= res!213925 (= (size!6039 (buf!6553 thiss!1005)) (size!6039 (buf!6553 (_2!11844 lt!395914)))))))

(assert (=> d!85890 (= (isPrefixOf!0 thiss!1005 (_2!11844 lt!395914)) e!176835)))

(declare-fun b!255257 () Bool)

(declare-fun res!213924 () Bool)

(assert (=> b!255257 (=> (not res!213924) (not e!176835))))

(assert (=> b!255257 (= res!213924 (bvsle (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)) (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395914))) (currentByte!12026 (_2!11844 lt!395914)) (currentBit!12021 (_2!11844 lt!395914)))))))

(declare-fun b!255258 () Bool)

(declare-fun e!176834 () Bool)

(assert (=> b!255258 (= e!176835 e!176834)))

(declare-fun res!213923 () Bool)

(assert (=> b!255258 (=> res!213923 e!176834)))

(assert (=> b!255258 (= res!213923 (= (size!6039 (buf!6553 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!255259 () Bool)

(assert (=> b!255259 (= e!176834 (arrayBitRangesEq!0 (buf!6553 thiss!1005) (buf!6553 (_2!11844 lt!395914)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005))))))

(assert (= (and d!85890 res!213925) b!255257))

(assert (= (and b!255257 res!213924) b!255258))

(assert (= (and b!255258 (not res!213923)) b!255259))

(assert (=> b!255257 m!384055))

(assert (=> b!255257 m!384061))

(assert (=> b!255259 m!384055))

(assert (=> b!255259 m!384055))

(declare-fun m!384583 () Bool)

(assert (=> b!255259 m!384583))

(assert (=> b!254999 d!85890))

(declare-fun d!85892 () Bool)

(declare-fun e!176836 () Bool)

(assert (=> d!85892 e!176836))

(declare-fun res!213927 () Bool)

(assert (=> d!85892 (=> (not res!213927) (not e!176836))))

(declare-fun lt!396498 () (_ BitVec 64))

(declare-fun lt!396496 () (_ BitVec 64))

(declare-fun lt!396494 () (_ BitVec 64))

(assert (=> d!85892 (= res!213927 (= lt!396496 (bvsub lt!396494 lt!396498)))))

(assert (=> d!85892 (or (= (bvand lt!396494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396494 lt!396498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85892 (= lt!396498 (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 (_1!11842 lt!395907)))) ((_ sign_extend 32) (currentByte!12026 (_1!11842 lt!395907))) ((_ sign_extend 32) (currentBit!12021 (_1!11842 lt!395907)))))))

(declare-fun lt!396493 () (_ BitVec 64))

(declare-fun lt!396495 () (_ BitVec 64))

(assert (=> d!85892 (= lt!396494 (bvmul lt!396493 lt!396495))))

(assert (=> d!85892 (or (= lt!396493 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396495 (bvsdiv (bvmul lt!396493 lt!396495) lt!396493)))))

(assert (=> d!85892 (= lt!396495 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85892 (= lt!396493 ((_ sign_extend 32) (size!6039 (buf!6553 (_1!11842 lt!395907)))))))

(assert (=> d!85892 (= lt!396496 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12026 (_1!11842 lt!395907))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12021 (_1!11842 lt!395907)))))))

(assert (=> d!85892 (invariant!0 (currentBit!12021 (_1!11842 lt!395907)) (currentByte!12026 (_1!11842 lt!395907)) (size!6039 (buf!6553 (_1!11842 lt!395907))))))

(assert (=> d!85892 (= (bitIndex!0 (size!6039 (buf!6553 (_1!11842 lt!395907))) (currentByte!12026 (_1!11842 lt!395907)) (currentBit!12021 (_1!11842 lt!395907))) lt!396496)))

(declare-fun b!255260 () Bool)

(declare-fun res!213926 () Bool)

(assert (=> b!255260 (=> (not res!213926) (not e!176836))))

(assert (=> b!255260 (= res!213926 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396496))))

(declare-fun b!255261 () Bool)

(declare-fun lt!396497 () (_ BitVec 64))

(assert (=> b!255261 (= e!176836 (bvsle lt!396496 (bvmul lt!396497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255261 (or (= lt!396497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396497)))))

(assert (=> b!255261 (= lt!396497 ((_ sign_extend 32) (size!6039 (buf!6553 (_1!11842 lt!395907)))))))

(assert (= (and d!85892 res!213927) b!255260))

(assert (= (and b!255260 res!213926) b!255261))

(declare-fun m!384585 () Bool)

(assert (=> d!85892 m!384585))

(declare-fun m!384587 () Bool)

(assert (=> d!85892 m!384587))

(assert (=> b!254999 d!85892))

(declare-fun d!85894 () Bool)

(declare-fun e!176837 () Bool)

(assert (=> d!85894 e!176837))

(declare-fun res!213929 () Bool)

(assert (=> d!85894 (=> (not res!213929) (not e!176837))))

(declare-fun lt!396500 () (_ BitVec 64))

(declare-fun lt!396502 () (_ BitVec 64))

(declare-fun lt!396504 () (_ BitVec 64))

(assert (=> d!85894 (= res!213929 (= lt!396502 (bvsub lt!396500 lt!396504)))))

(assert (=> d!85894 (or (= (bvand lt!396500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396500 lt!396504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85894 (= lt!396504 (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 (_1!11842 lt!395909)))) ((_ sign_extend 32) (currentByte!12026 (_1!11842 lt!395909))) ((_ sign_extend 32) (currentBit!12021 (_1!11842 lt!395909)))))))

(declare-fun lt!396499 () (_ BitVec 64))

(declare-fun lt!396501 () (_ BitVec 64))

(assert (=> d!85894 (= lt!396500 (bvmul lt!396499 lt!396501))))

(assert (=> d!85894 (or (= lt!396499 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396501 (bvsdiv (bvmul lt!396499 lt!396501) lt!396499)))))

(assert (=> d!85894 (= lt!396501 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85894 (= lt!396499 ((_ sign_extend 32) (size!6039 (buf!6553 (_1!11842 lt!395909)))))))

(assert (=> d!85894 (= lt!396502 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12026 (_1!11842 lt!395909))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12021 (_1!11842 lt!395909)))))))

(assert (=> d!85894 (invariant!0 (currentBit!12021 (_1!11842 lt!395909)) (currentByte!12026 (_1!11842 lt!395909)) (size!6039 (buf!6553 (_1!11842 lt!395909))))))

(assert (=> d!85894 (= (bitIndex!0 (size!6039 (buf!6553 (_1!11842 lt!395909))) (currentByte!12026 (_1!11842 lt!395909)) (currentBit!12021 (_1!11842 lt!395909))) lt!396502)))

(declare-fun b!255262 () Bool)

(declare-fun res!213928 () Bool)

(assert (=> b!255262 (=> (not res!213928) (not e!176837))))

(assert (=> b!255262 (= res!213928 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396502))))

(declare-fun b!255263 () Bool)

(declare-fun lt!396503 () (_ BitVec 64))

(assert (=> b!255263 (= e!176837 (bvsle lt!396502 (bvmul lt!396503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255263 (or (= lt!396503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396503)))))

(assert (=> b!255263 (= lt!396503 ((_ sign_extend 32) (size!6039 (buf!6553 (_1!11842 lt!395909)))))))

(assert (= (and d!85894 res!213929) b!255262))

(assert (= (and b!255262 res!213928) b!255263))

(declare-fun m!384589 () Bool)

(assert (=> d!85894 m!384589))

(declare-fun m!384591 () Bool)

(assert (=> d!85894 m!384591))

(assert (=> b!254998 d!85894))

(declare-fun d!85896 () Bool)

(declare-fun e!176838 () Bool)

(assert (=> d!85896 e!176838))

(declare-fun res!213931 () Bool)

(assert (=> d!85896 (=> (not res!213931) (not e!176838))))

(declare-fun lt!396508 () (_ BitVec 64))

(declare-fun lt!396510 () (_ BitVec 64))

(declare-fun lt!396506 () (_ BitVec 64))

(assert (=> d!85896 (= res!213931 (= lt!396508 (bvsub lt!396506 lt!396510)))))

(assert (=> d!85896 (or (= (bvand lt!396506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396510 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396506 lt!396510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85896 (= lt!396510 (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395914))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395914)))))))

(declare-fun lt!396505 () (_ BitVec 64))

(declare-fun lt!396507 () (_ BitVec 64))

(assert (=> d!85896 (= lt!396506 (bvmul lt!396505 lt!396507))))

(assert (=> d!85896 (or (= lt!396505 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396507 (bvsdiv (bvmul lt!396505 lt!396507) lt!396505)))))

(assert (=> d!85896 (= lt!396507 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85896 (= lt!396505 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))))))

(assert (=> d!85896 (= lt!396508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395914))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395914)))))))

(assert (=> d!85896 (invariant!0 (currentBit!12021 (_2!11844 lt!395914)) (currentByte!12026 (_2!11844 lt!395914)) (size!6039 (buf!6553 (_2!11844 lt!395914))))))

(assert (=> d!85896 (= (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395914))) (currentByte!12026 (_2!11844 lt!395914)) (currentBit!12021 (_2!11844 lt!395914))) lt!396508)))

(declare-fun b!255264 () Bool)

(declare-fun res!213930 () Bool)

(assert (=> b!255264 (=> (not res!213930) (not e!176838))))

(assert (=> b!255264 (= res!213930 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396508))))

(declare-fun b!255265 () Bool)

(declare-fun lt!396509 () (_ BitVec 64))

(assert (=> b!255265 (= e!176838 (bvsle lt!396508 (bvmul lt!396509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255265 (or (= lt!396509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396509)))))

(assert (=> b!255265 (= lt!396509 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))))))

(assert (= (and d!85896 res!213931) b!255264))

(assert (= (and b!255264 res!213930) b!255265))

(declare-fun m!384593 () Bool)

(assert (=> d!85896 m!384593))

(declare-fun m!384595 () Bool)

(assert (=> d!85896 m!384595))

(assert (=> b!255009 d!85896))

(declare-fun d!85898 () Bool)

(declare-fun e!176839 () Bool)

(assert (=> d!85898 e!176839))

(declare-fun res!213933 () Bool)

(assert (=> d!85898 (=> (not res!213933) (not e!176839))))

(declare-fun lt!396512 () (_ BitVec 64))

(declare-fun lt!396514 () (_ BitVec 64))

(declare-fun lt!396516 () (_ BitVec 64))

(assert (=> d!85898 (= res!213933 (= lt!396514 (bvsub lt!396512 lt!396516)))))

(assert (=> d!85898 (or (= (bvand lt!396512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396512 lt!396516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85898 (= lt!396516 (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395918)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918)))))))

(declare-fun lt!396511 () (_ BitVec 64))

(declare-fun lt!396513 () (_ BitVec 64))

(assert (=> d!85898 (= lt!396512 (bvmul lt!396511 lt!396513))))

(assert (=> d!85898 (or (= lt!396511 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396513 (bvsdiv (bvmul lt!396511 lt!396513) lt!396511)))))

(assert (=> d!85898 (= lt!396513 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85898 (= lt!396511 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395918)))))))

(assert (=> d!85898 (= lt!396514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918)))))))

(assert (=> d!85898 (invariant!0 (currentBit!12021 (_2!11844 lt!395918)) (currentByte!12026 (_2!11844 lt!395918)) (size!6039 (buf!6553 (_2!11844 lt!395918))))))

(assert (=> d!85898 (= (bitIndex!0 (size!6039 (buf!6553 (_2!11844 lt!395918))) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918))) lt!396514)))

(declare-fun b!255266 () Bool)

(declare-fun res!213932 () Bool)

(assert (=> b!255266 (=> (not res!213932) (not e!176839))))

(assert (=> b!255266 (= res!213932 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396514))))

(declare-fun b!255267 () Bool)

(declare-fun lt!396515 () (_ BitVec 64))

(assert (=> b!255267 (= e!176839 (bvsle lt!396514 (bvmul lt!396515 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255267 (or (= lt!396515 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396515 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396515)))))

(assert (=> b!255267 (= lt!396515 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395918)))))))

(assert (= (and d!85898 res!213933) b!255266))

(assert (= (and b!255266 res!213932) b!255267))

(assert (=> d!85898 m!384575))

(declare-fun m!384597 () Bool)

(assert (=> d!85898 m!384597))

(assert (=> b!255009 d!85898))

(declare-fun d!85900 () Bool)

(assert (=> d!85900 (= (invariant!0 (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005) (size!6039 (buf!6553 (_2!11844 lt!395918)))) (and (bvsge (currentBit!12021 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12021 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12026 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12026 thiss!1005) (size!6039 (buf!6553 (_2!11844 lt!395918)))) (and (= (currentBit!12021 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12026 thiss!1005) (size!6039 (buf!6553 (_2!11844 lt!395918))))))))))

(assert (=> b!255002 d!85900))

(declare-fun d!85902 () Bool)

(declare-fun e!176840 () Bool)

(assert (=> d!85902 e!176840))

(declare-fun res!213935 () Bool)

(assert (=> d!85902 (=> (not res!213935) (not e!176840))))

(declare-fun lt!396522 () (_ BitVec 64))

(declare-fun lt!396520 () (_ BitVec 64))

(declare-fun lt!396518 () (_ BitVec 64))

(assert (=> d!85902 (= res!213935 (= lt!396520 (bvsub lt!396518 lt!396522)))))

(assert (=> d!85902 (or (= (bvand lt!396518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396522 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396518 lt!396522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85902 (= lt!396522 (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 thiss!1005))) ((_ sign_extend 32) (currentByte!12026 thiss!1005)) ((_ sign_extend 32) (currentBit!12021 thiss!1005))))))

(declare-fun lt!396517 () (_ BitVec 64))

(declare-fun lt!396519 () (_ BitVec 64))

(assert (=> d!85902 (= lt!396518 (bvmul lt!396517 lt!396519))))

(assert (=> d!85902 (or (= lt!396517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396519 (bvsdiv (bvmul lt!396517 lt!396519) lt!396517)))))

(assert (=> d!85902 (= lt!396519 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85902 (= lt!396517 ((_ sign_extend 32) (size!6039 (buf!6553 thiss!1005))))))

(assert (=> d!85902 (= lt!396520 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12026 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12021 thiss!1005))))))

(assert (=> d!85902 (invariant!0 (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005) (size!6039 (buf!6553 thiss!1005)))))

(assert (=> d!85902 (= (bitIndex!0 (size!6039 (buf!6553 thiss!1005)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)) lt!396520)))

(declare-fun b!255268 () Bool)

(declare-fun res!213934 () Bool)

(assert (=> b!255268 (=> (not res!213934) (not e!176840))))

(assert (=> b!255268 (= res!213934 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396520))))

(declare-fun b!255269 () Bool)

(declare-fun lt!396521 () (_ BitVec 64))

(assert (=> b!255269 (= e!176840 (bvsle lt!396520 (bvmul lt!396521 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255269 (or (= lt!396521 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396521 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396521)))))

(assert (=> b!255269 (= lt!396521 ((_ sign_extend 32) (size!6039 (buf!6553 thiss!1005))))))

(assert (= (and d!85902 res!213935) b!255268))

(assert (= (and b!255268 res!213934) b!255269))

(assert (=> d!85902 m!384451))

(declare-fun m!384599 () Bool)

(assert (=> d!85902 m!384599))

(assert (=> b!255001 d!85902))

(declare-fun d!85904 () Bool)

(assert (=> d!85904 (= (inv!12 thiss!1005) (invariant!0 (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005) (size!6039 (buf!6553 thiss!1005))))))

(declare-fun bs!21666 () Bool)

(assert (= bs!21666 d!85904))

(assert (=> bs!21666 m!384599))

(assert (=> start!54520 d!85904))

(declare-fun d!85906 () Bool)

(declare-fun lt!396523 () tuple2!21826)

(assert (=> d!85906 (= lt!396523 (readBit!0 (readerFrom!0 (_2!11844 lt!395918) (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005))))))

(assert (=> d!85906 (= (readBitPure!0 (readerFrom!0 (_2!11844 lt!395918) (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005))) (tuple2!21817 (_2!11847 lt!396523) (_1!11847 lt!396523)))))

(declare-fun bs!21667 () Bool)

(assert (= bs!21667 d!85906))

(assert (=> bs!21667 m!384115))

(declare-fun m!384601 () Bool)

(assert (=> bs!21667 m!384601))

(assert (=> b!255005 d!85906))

(declare-fun d!85908 () Bool)

(declare-fun e!176843 () Bool)

(assert (=> d!85908 e!176843))

(declare-fun res!213939 () Bool)

(assert (=> d!85908 (=> (not res!213939) (not e!176843))))

(assert (=> d!85908 (= res!213939 (invariant!0 (currentBit!12021 (_2!11844 lt!395918)) (currentByte!12026 (_2!11844 lt!395918)) (size!6039 (buf!6553 (_2!11844 lt!395918)))))))

(assert (=> d!85908 (= (readerFrom!0 (_2!11844 lt!395918) (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005)) (BitStream!11001 (buf!6553 (_2!11844 lt!395918)) (currentByte!12026 thiss!1005) (currentBit!12021 thiss!1005)))))

(declare-fun b!255272 () Bool)

(assert (=> b!255272 (= e!176843 (invariant!0 (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005) (size!6039 (buf!6553 (_2!11844 lt!395918)))))))

(assert (= (and d!85908 res!213939) b!255272))

(assert (=> d!85908 m!384597))

(assert (=> b!255272 m!384059))

(assert (=> b!255005 d!85908))

(assert (=> b!255004 d!85898))

(assert (=> b!255004 d!85902))

(declare-fun lt!396524 () tuple2!21826)

(declare-fun d!85910 () Bool)

(assert (=> d!85910 (= lt!396524 (checkBitsLoop!0 (_1!11843 lt!395904) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85910 (= (checkBitsLoopPure!0 (_1!11843 lt!395904) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21817 (_2!11847 lt!396524) (_1!11847 lt!396524)))))

(declare-fun bs!21668 () Bool)

(assert (= bs!21668 d!85910))

(declare-fun m!384603 () Bool)

(assert (=> bs!21668 m!384603))

(assert (=> b!255008 d!85910))

(declare-fun d!85912 () Bool)

(assert (=> d!85912 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!395919) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918)))) lt!395919))))

(declare-fun bs!21669 () Bool)

(assert (= bs!21669 d!85912))

(assert (=> bs!21669 m!384581))

(assert (=> b!255008 d!85912))

(declare-fun d!85914 () Bool)

(assert (=> d!85914 (validate_offset_bits!1 ((_ sign_extend 32) (size!6039 (buf!6553 (_2!11844 lt!395914)))) ((_ sign_extend 32) (currentByte!12026 (_2!11844 lt!395918))) ((_ sign_extend 32) (currentBit!12021 (_2!11844 lt!395918))) lt!395919)))

(declare-fun lt!396525 () Unit!18280)

(assert (=> d!85914 (= lt!396525 (choose!9 (_2!11844 lt!395918) (buf!6553 (_2!11844 lt!395914)) lt!395919 (BitStream!11001 (buf!6553 (_2!11844 lt!395914)) (currentByte!12026 (_2!11844 lt!395918)) (currentBit!12021 (_2!11844 lt!395918)))))))

(assert (=> d!85914 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11844 lt!395918) (buf!6553 (_2!11844 lt!395914)) lt!395919) lt!396525)))

(declare-fun bs!21670 () Bool)

(assert (= bs!21670 d!85914))

(assert (=> bs!21670 m!384069))

(declare-fun m!384605 () Bool)

(assert (=> bs!21670 m!384605))

(assert (=> b!255008 d!85914))

(assert (=> b!255008 d!85876))

(declare-fun d!85916 () Bool)

(assert (=> d!85916 (= (array_inv!5780 (buf!6553 thiss!1005)) (bvsge (size!6039 (buf!6553 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!254997 d!85916))

(declare-fun d!85918 () Bool)

(declare-fun e!176846 () Bool)

(assert (=> d!85918 e!176846))

(declare-fun res!213942 () Bool)

(assert (=> d!85918 (=> (not res!213942) (not e!176846))))

(declare-fun lt!396531 () (_ BitVec 64))

(declare-fun lt!396530 () BitStream!11000)

(assert (=> d!85918 (= res!213942 (= (bvadd lt!396531 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6039 (buf!6553 lt!396530)) (currentByte!12026 lt!396530) (currentBit!12021 lt!396530))))))

(assert (=> d!85918 (or (not (= (bvand lt!396531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!396531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!396531 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85918 (= lt!396531 (bitIndex!0 (size!6039 (buf!6553 (_1!11843 lt!395899))) (currentByte!12026 (_1!11843 lt!395899)) (currentBit!12021 (_1!11843 lt!395899))))))

(declare-fun moveBitIndex!0 (BitStream!11000 (_ BitVec 64)) tuple2!21820)

(assert (=> d!85918 (= lt!396530 (_2!11844 (moveBitIndex!0 (_1!11843 lt!395899) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!11000 (_ BitVec 64)) Bool)

(assert (=> d!85918 (moveBitIndexPrecond!0 (_1!11843 lt!395899) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!85918 (= (withMovedBitIndex!0 (_1!11843 lt!395899) #b0000000000000000000000000000000000000000000000000000000000000001) lt!396530)))

(declare-fun b!255275 () Bool)

(assert (=> b!255275 (= e!176846 (= (size!6039 (buf!6553 (_1!11843 lt!395899))) (size!6039 (buf!6553 lt!396530))))))

(assert (= (and d!85918 res!213942) b!255275))

(declare-fun m!384607 () Bool)

(assert (=> d!85918 m!384607))

(declare-fun m!384609 () Bool)

(assert (=> d!85918 m!384609))

(declare-fun m!384611 () Bool)

(assert (=> d!85918 m!384611))

(declare-fun m!384613 () Bool)

(assert (=> d!85918 m!384613))

(assert (=> b!255007 d!85918))

(declare-fun d!85920 () Bool)

(assert (=> d!85920 (= (invariant!0 (currentBit!12021 thiss!1005) (currentByte!12026 thiss!1005) (size!6039 (buf!6553 (_2!11844 lt!395914)))) (and (bvsge (currentBit!12021 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12021 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12026 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12026 thiss!1005) (size!6039 (buf!6553 (_2!11844 lt!395914)))) (and (= (currentBit!12021 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12026 thiss!1005) (size!6039 (buf!6553 (_2!11844 lt!395914))))))))))

(assert (=> b!255006 d!85920))

(push 1)

(assert (not b!255250))

(assert (not d!85848))

(assert (not b!255227))

(assert (not b!255194))

(assert (not d!85864))

(assert (not d!85914))

(assert (not b!255202))

(assert (not d!85902))

(assert (not d!85862))

(assert (not d!85882))

(assert (not d!85918))

(assert (not d!85898))

(assert (not d!85866))

(assert (not b!255213))

(assert (not d!85912))

(assert (not d!85908))

(assert (not d!85906))

(assert (not d!85872))

(assert (not b!255197))

(assert (not d!85870))

(assert (not d!85884))

(assert (not b!255230))

(assert (not d!85868))

(assert (not b!255251))

(assert (not b!255259))

(assert (not d!85896))

(assert (not b!255257))

(assert (not b!255255))

(assert (not b!255199))

(assert (not d!85860))

(assert (not b!255272))

(assert (not d!85874))

(assert (not b!255228))

(assert (not d!85858))

(assert (not b!255217))

(assert (not b!255216))

(assert (not b!255214))

(assert (not d!85854))

(assert (not b!255229))

(assert (not d!85856))

(assert (not d!85878))

(assert (not d!85892))

(assert (not b!255248))

(assert (not d!85886))

(assert (not d!85876))

(assert (not d!85910))

(assert (not d!85894))

(assert (not b!255252))

(assert (not b!255256))

(assert (not d!85904))

(assert (not b!255253))

(assert (not d!85880))

(assert (not d!85888))

(assert (not b!255196))

(assert (not b!255249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

