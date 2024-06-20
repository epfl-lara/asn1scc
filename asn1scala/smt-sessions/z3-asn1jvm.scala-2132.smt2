; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54074 () Bool)

(assert start!54074)

(declare-fun b!251830 () Bool)

(declare-fun res!210937 () Bool)

(declare-fun e!174491 () Bool)

(assert (=> b!251830 (=> (not res!210937) (not e!174491))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!251830 (= res!210937 (bvslt from!289 nBits!297))))

(declare-fun b!251831 () Bool)

(declare-fun e!174495 () Bool)

(declare-datatypes ((array!13698 0))(
  ( (array!13699 (arr!6995 (Array (_ BitVec 32) (_ BitVec 8))) (size!6008 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10938 0))(
  ( (BitStream!10939 (buf!6510 array!13698) (currentByte!11965 (_ BitVec 32)) (currentBit!11960 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10938)

(declare-datatypes ((Unit!18164 0))(
  ( (Unit!18165) )
))
(declare-datatypes ((tuple2!21618 0))(
  ( (tuple2!21619 (_1!11737 Unit!18164) (_2!11737 BitStream!10938)) )
))
(declare-fun lt!391252 () tuple2!21618)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251831 (= e!174495 (invariant!0 (currentBit!11960 thiss!1005) (currentByte!11965 thiss!1005) (size!6008 (buf!6510 (_2!11737 lt!391252)))))))

(declare-fun b!251832 () Bool)

(declare-fun res!210934 () Bool)

(assert (=> b!251832 (=> (not res!210934) (not e!174495))))

(declare-fun lt!391256 () tuple2!21618)

(assert (=> b!251832 (= res!210934 (invariant!0 (currentBit!11960 thiss!1005) (currentByte!11965 thiss!1005) (size!6008 (buf!6510 (_2!11737 lt!391256)))))))

(declare-fun b!251833 () Bool)

(declare-fun e!174500 () Bool)

(declare-fun e!174494 () Bool)

(assert (=> b!251833 (= e!174500 e!174494)))

(declare-fun res!210930 () Bool)

(assert (=> b!251833 (=> (not res!210930) (not e!174494))))

(declare-fun lt!391246 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251833 (= res!210930 (= (bitIndex!0 (size!6008 (buf!6510 (_2!11737 lt!391252))) (currentByte!11965 (_2!11737 lt!391252)) (currentBit!11960 (_2!11737 lt!391252))) (bvadd (bitIndex!0 (size!6008 (buf!6510 (_2!11737 lt!391256))) (currentByte!11965 (_2!11737 lt!391256)) (currentBit!11960 (_2!11737 lt!391256))) lt!391246)))))

(assert (=> b!251833 (= lt!391246 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251834 () Bool)

(declare-fun e!174496 () Bool)

(declare-fun e!174492 () Bool)

(assert (=> b!251834 (= e!174496 e!174492)))

(declare-fun res!210932 () Bool)

(assert (=> b!251834 (=> (not res!210932) (not e!174492))))

(declare-datatypes ((tuple2!21620 0))(
  ( (tuple2!21621 (_1!11738 BitStream!10938) (_2!11738 Bool)) )
))
(declare-fun lt!391243 () tuple2!21620)

(declare-fun bit!26 () Bool)

(assert (=> b!251834 (= res!210932 (and (= (_2!11738 lt!391243) bit!26) (= (_1!11738 lt!391243) (_2!11737 lt!391256))))))

(declare-fun readBitPure!0 (BitStream!10938) tuple2!21620)

(declare-fun readerFrom!0 (BitStream!10938 (_ BitVec 32) (_ BitVec 32)) BitStream!10938)

(assert (=> b!251834 (= lt!391243 (readBitPure!0 (readerFrom!0 (_2!11737 lt!391256) (currentBit!11960 thiss!1005) (currentByte!11965 thiss!1005))))))

(declare-fun b!251835 () Bool)

(declare-fun res!210931 () Bool)

(assert (=> b!251835 (=> (not res!210931) (not e!174496))))

(declare-fun isPrefixOf!0 (BitStream!10938 BitStream!10938) Bool)

(assert (=> b!251835 (= res!210931 (isPrefixOf!0 thiss!1005 (_2!11737 lt!391256)))))

(declare-fun b!251836 () Bool)

(declare-fun lt!391253 () tuple2!21620)

(declare-datatypes ((tuple2!21622 0))(
  ( (tuple2!21623 (_1!11739 BitStream!10938) (_2!11739 BitStream!10938)) )
))
(declare-fun lt!391249 () tuple2!21622)

(assert (=> b!251836 (= e!174494 (not (or (not (_2!11738 lt!391253)) (not (= (_1!11738 lt!391253) (_2!11739 lt!391249))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10938 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21620)

(assert (=> b!251836 (= lt!391253 (checkBitsLoopPure!0 (_1!11739 lt!391249) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251836 (validate_offset_bits!1 ((_ sign_extend 32) (size!6008 (buf!6510 (_2!11737 lt!391252)))) ((_ sign_extend 32) (currentByte!11965 (_2!11737 lt!391256))) ((_ sign_extend 32) (currentBit!11960 (_2!11737 lt!391256))) lt!391246)))

(declare-fun lt!391242 () Unit!18164)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10938 array!13698 (_ BitVec 64)) Unit!18164)

(assert (=> b!251836 (= lt!391242 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11737 lt!391256) (buf!6510 (_2!11737 lt!391252)) lt!391246))))

(declare-fun reader!0 (BitStream!10938 BitStream!10938) tuple2!21622)

(assert (=> b!251836 (= lt!391249 (reader!0 (_2!11737 lt!391256) (_2!11737 lt!391252)))))

(declare-fun b!251837 () Bool)

(declare-fun e!174499 () Bool)

(declare-fun array_inv!5749 (array!13698) Bool)

(assert (=> b!251837 (= e!174499 (array_inv!5749 (buf!6510 thiss!1005)))))

(declare-fun b!251838 () Bool)

(declare-fun e!174498 () Bool)

(declare-fun lt!391241 () tuple2!21620)

(declare-fun lt!391244 () tuple2!21620)

(assert (=> b!251838 (= e!174498 (= (_2!11738 lt!391241) (_2!11738 lt!391244)))))

(declare-fun b!251839 () Bool)

(declare-fun e!174493 () Bool)

(assert (=> b!251839 (= e!174493 e!174496)))

(declare-fun res!210927 () Bool)

(assert (=> b!251839 (=> (not res!210927) (not e!174496))))

(declare-fun lt!391250 () (_ BitVec 64))

(declare-fun lt!391251 () (_ BitVec 64))

(assert (=> b!251839 (= res!210927 (= lt!391250 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391251)))))

(assert (=> b!251839 (= lt!391250 (bitIndex!0 (size!6008 (buf!6510 (_2!11737 lt!391256))) (currentByte!11965 (_2!11737 lt!391256)) (currentBit!11960 (_2!11737 lt!391256))))))

(assert (=> b!251839 (= lt!391251 (bitIndex!0 (size!6008 (buf!6510 thiss!1005)) (currentByte!11965 thiss!1005) (currentBit!11960 thiss!1005)))))

(declare-fun res!210938 () Bool)

(assert (=> start!54074 (=> (not res!210938) (not e!174491))))

(assert (=> start!54074 (= res!210938 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54074 e!174491))

(assert (=> start!54074 true))

(declare-fun inv!12 (BitStream!10938) Bool)

(assert (=> start!54074 (and (inv!12 thiss!1005) e!174499)))

(declare-fun b!251840 () Bool)

(assert (=> b!251840 (= e!174492 (= (bitIndex!0 (size!6008 (buf!6510 (_1!11738 lt!391243))) (currentByte!11965 (_1!11738 lt!391243)) (currentBit!11960 (_1!11738 lt!391243))) lt!391250))))

(declare-fun b!251841 () Bool)

(declare-fun res!210928 () Bool)

(assert (=> b!251841 (=> (not res!210928) (not e!174494))))

(assert (=> b!251841 (= res!210928 (isPrefixOf!0 (_2!11737 lt!391256) (_2!11737 lt!391252)))))

(declare-fun b!251842 () Bool)

(declare-fun res!210935 () Bool)

(assert (=> b!251842 (=> (not res!210935) (not e!174491))))

(assert (=> b!251842 (= res!210935 (validate_offset_bits!1 ((_ sign_extend 32) (size!6008 (buf!6510 thiss!1005))) ((_ sign_extend 32) (currentByte!11965 thiss!1005)) ((_ sign_extend 32) (currentBit!11960 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251843 () Bool)

(assert (=> b!251843 (= e!174491 (not true))))

(declare-fun lt!391245 () tuple2!21622)

(assert (=> b!251843 (= (_2!11738 (readBitPure!0 (_1!11739 lt!391245))) bit!26)))

(declare-fun lt!391255 () tuple2!21622)

(assert (=> b!251843 (= lt!391255 (reader!0 (_2!11737 lt!391256) (_2!11737 lt!391252)))))

(assert (=> b!251843 (= lt!391245 (reader!0 thiss!1005 (_2!11737 lt!391252)))))

(assert (=> b!251843 e!174498))

(declare-fun res!210939 () Bool)

(assert (=> b!251843 (=> (not res!210939) (not e!174498))))

(assert (=> b!251843 (= res!210939 (= (bitIndex!0 (size!6008 (buf!6510 (_1!11738 lt!391241))) (currentByte!11965 (_1!11738 lt!391241)) (currentBit!11960 (_1!11738 lt!391241))) (bitIndex!0 (size!6008 (buf!6510 (_1!11738 lt!391244))) (currentByte!11965 (_1!11738 lt!391244)) (currentBit!11960 (_1!11738 lt!391244)))))))

(declare-fun lt!391248 () Unit!18164)

(declare-fun lt!391247 () BitStream!10938)

(declare-fun readBitPrefixLemma!0 (BitStream!10938 BitStream!10938) Unit!18164)

(assert (=> b!251843 (= lt!391248 (readBitPrefixLemma!0 lt!391247 (_2!11737 lt!391252)))))

(assert (=> b!251843 (= lt!391244 (readBitPure!0 (BitStream!10939 (buf!6510 (_2!11737 lt!391252)) (currentByte!11965 thiss!1005) (currentBit!11960 thiss!1005))))))

(assert (=> b!251843 (= lt!391241 (readBitPure!0 lt!391247))))

(assert (=> b!251843 (= lt!391247 (BitStream!10939 (buf!6510 (_2!11737 lt!391256)) (currentByte!11965 thiss!1005) (currentBit!11960 thiss!1005)))))

(assert (=> b!251843 e!174495))

(declare-fun res!210936 () Bool)

(assert (=> b!251843 (=> (not res!210936) (not e!174495))))

(assert (=> b!251843 (= res!210936 (isPrefixOf!0 thiss!1005 (_2!11737 lt!391252)))))

(declare-fun lt!391257 () Unit!18164)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10938 BitStream!10938 BitStream!10938) Unit!18164)

(assert (=> b!251843 (= lt!391257 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11737 lt!391256) (_2!11737 lt!391252)))))

(assert (=> b!251843 e!174500))

(declare-fun res!210933 () Bool)

(assert (=> b!251843 (=> (not res!210933) (not e!174500))))

(assert (=> b!251843 (= res!210933 (= (size!6008 (buf!6510 (_2!11737 lt!391256))) (size!6008 (buf!6510 (_2!11737 lt!391252)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10938 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21618)

(assert (=> b!251843 (= lt!391252 (appendNBitsLoop!0 (_2!11737 lt!391256) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251843 (validate_offset_bits!1 ((_ sign_extend 32) (size!6008 (buf!6510 (_2!11737 lt!391256)))) ((_ sign_extend 32) (currentByte!11965 (_2!11737 lt!391256))) ((_ sign_extend 32) (currentBit!11960 (_2!11737 lt!391256))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391254 () Unit!18164)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10938 BitStream!10938 (_ BitVec 64) (_ BitVec 64)) Unit!18164)

(assert (=> b!251843 (= lt!391254 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11737 lt!391256) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!251843 e!174493))

(declare-fun res!210929 () Bool)

(assert (=> b!251843 (=> (not res!210929) (not e!174493))))

(assert (=> b!251843 (= res!210929 (= (size!6008 (buf!6510 thiss!1005)) (size!6008 (buf!6510 (_2!11737 lt!391256)))))))

(declare-fun appendBit!0 (BitStream!10938 Bool) tuple2!21618)

(assert (=> b!251843 (= lt!391256 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!54074 res!210938) b!251842))

(assert (= (and b!251842 res!210935) b!251830))

(assert (= (and b!251830 res!210937) b!251843))

(assert (= (and b!251843 res!210929) b!251839))

(assert (= (and b!251839 res!210927) b!251835))

(assert (= (and b!251835 res!210931) b!251834))

(assert (= (and b!251834 res!210932) b!251840))

(assert (= (and b!251843 res!210933) b!251833))

(assert (= (and b!251833 res!210930) b!251841))

(assert (= (and b!251841 res!210928) b!251836))

(assert (= (and b!251843 res!210936) b!251832))

(assert (= (and b!251832 res!210934) b!251831))

(assert (= (and b!251843 res!210939) b!251838))

(assert (= start!54074 b!251837))

(declare-fun m!378867 () Bool)

(assert (=> b!251843 m!378867))

(declare-fun m!378869 () Bool)

(assert (=> b!251843 m!378869))

(declare-fun m!378871 () Bool)

(assert (=> b!251843 m!378871))

(declare-fun m!378873 () Bool)

(assert (=> b!251843 m!378873))

(declare-fun m!378875 () Bool)

(assert (=> b!251843 m!378875))

(declare-fun m!378877 () Bool)

(assert (=> b!251843 m!378877))

(declare-fun m!378879 () Bool)

(assert (=> b!251843 m!378879))

(declare-fun m!378881 () Bool)

(assert (=> b!251843 m!378881))

(declare-fun m!378883 () Bool)

(assert (=> b!251843 m!378883))

(declare-fun m!378885 () Bool)

(assert (=> b!251843 m!378885))

(declare-fun m!378887 () Bool)

(assert (=> b!251843 m!378887))

(declare-fun m!378889 () Bool)

(assert (=> b!251843 m!378889))

(declare-fun m!378891 () Bool)

(assert (=> b!251843 m!378891))

(declare-fun m!378893 () Bool)

(assert (=> b!251843 m!378893))

(declare-fun m!378895 () Bool)

(assert (=> b!251837 m!378895))

(declare-fun m!378897 () Bool)

(assert (=> b!251832 m!378897))

(declare-fun m!378899 () Bool)

(assert (=> b!251836 m!378899))

(declare-fun m!378901 () Bool)

(assert (=> b!251836 m!378901))

(declare-fun m!378903 () Bool)

(assert (=> b!251836 m!378903))

(assert (=> b!251836 m!378873))

(declare-fun m!378905 () Bool)

(assert (=> b!251842 m!378905))

(declare-fun m!378907 () Bool)

(assert (=> b!251833 m!378907))

(declare-fun m!378909 () Bool)

(assert (=> b!251833 m!378909))

(declare-fun m!378911 () Bool)

(assert (=> b!251831 m!378911))

(declare-fun m!378913 () Bool)

(assert (=> start!54074 m!378913))

(assert (=> b!251839 m!378909))

(declare-fun m!378915 () Bool)

(assert (=> b!251839 m!378915))

(declare-fun m!378917 () Bool)

(assert (=> b!251834 m!378917))

(assert (=> b!251834 m!378917))

(declare-fun m!378919 () Bool)

(assert (=> b!251834 m!378919))

(declare-fun m!378921 () Bool)

(assert (=> b!251840 m!378921))

(declare-fun m!378923 () Bool)

(assert (=> b!251835 m!378923))

(declare-fun m!378925 () Bool)

(assert (=> b!251841 m!378925))

(check-sat (not start!54074) (not b!251840) (not b!251841) (not b!251832) (not b!251835) (not b!251831) (not b!251843) (not b!251834) (not b!251837) (not b!251839) (not b!251842) (not b!251836) (not b!251833))
