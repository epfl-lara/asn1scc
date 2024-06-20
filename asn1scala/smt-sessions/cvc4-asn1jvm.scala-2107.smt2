; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53416 () Bool)

(assert start!53416)

(declare-fun b!248106 () Bool)

(declare-fun e!171908 () Bool)

(declare-fun e!171905 () Bool)

(assert (=> b!248106 (= e!171908 e!171905)))

(declare-fun res!207661 () Bool)

(assert (=> b!248106 (=> (not res!207661) (not e!171905))))

(declare-datatypes ((array!13541 0))(
  ( (array!13542 (arr!6924 (Array (_ BitVec 32) (_ BitVec 8))) (size!5937 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10796 0))(
  ( (BitStream!10797 (buf!6424 array!13541) (currentByte!11840 (_ BitVec 32)) (currentBit!11835 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17995 0))(
  ( (Unit!17996) )
))
(declare-datatypes ((tuple2!21282 0))(
  ( (tuple2!21283 (_1!11563 Unit!17995) (_2!11563 BitStream!10796)) )
))
(declare-fun lt!386670 () tuple2!21282)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21284 0))(
  ( (tuple2!21285 (_1!11564 BitStream!10796) (_2!11564 Bool)) )
))
(declare-fun lt!386665 () tuple2!21284)

(assert (=> b!248106 (= res!207661 (and (= (_2!11564 lt!386665) bit!26) (= (_1!11564 lt!386665) (_2!11563 lt!386670))))))

(declare-fun thiss!1005 () BitStream!10796)

(declare-fun readBitPure!0 (BitStream!10796) tuple2!21284)

(declare-fun readerFrom!0 (BitStream!10796 (_ BitVec 32) (_ BitVec 32)) BitStream!10796)

(assert (=> b!248106 (= lt!386665 (readBitPure!0 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))))

(declare-fun res!207654 () Bool)

(declare-fun e!171910 () Bool)

(assert (=> start!53416 (=> (not res!207654) (not e!171910))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53416 (= res!207654 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53416 e!171910))

(assert (=> start!53416 true))

(declare-fun e!171904 () Bool)

(declare-fun inv!12 (BitStream!10796) Bool)

(assert (=> start!53416 (and (inv!12 thiss!1005) e!171904)))

(declare-fun b!248107 () Bool)

(declare-fun e!171901 () Bool)

(declare-fun lt!386654 () tuple2!21284)

(declare-datatypes ((tuple2!21286 0))(
  ( (tuple2!21287 (_1!11565 BitStream!10796) (_2!11565 BitStream!10796)) )
))
(declare-fun lt!386660 () tuple2!21286)

(assert (=> b!248107 (= e!171901 (not (or (not (_2!11564 lt!386654)) (not (= (_1!11564 lt!386654) (_2!11565 lt!386660))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10796 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21284)

(assert (=> b!248107 (= lt!386654 (checkBitsLoopPure!0 (_1!11565 lt!386660) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!386663 () tuple2!21282)

(declare-fun lt!386656 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!248107 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386656)))

(declare-fun lt!386668 () Unit!17995)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10796 array!13541 (_ BitVec 64)) Unit!17995)

(assert (=> b!248107 (= lt!386668 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!386663)) lt!386656))))

(declare-fun reader!0 (BitStream!10796 BitStream!10796) tuple2!21286)

(assert (=> b!248107 (= lt!386660 (reader!0 (_2!11563 lt!386670) (_2!11563 lt!386663)))))

(declare-fun b!248108 () Bool)

(declare-fun e!171911 () Bool)

(declare-fun lt!386652 () tuple2!21286)

(declare-fun lt!386658 () tuple2!21286)

(declare-fun withMovedBitIndex!0 (BitStream!10796 (_ BitVec 64)) BitStream!10796)

(assert (=> b!248108 (= e!171911 (= (_1!11565 lt!386652) (withMovedBitIndex!0 (_1!11565 lt!386658) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!248109 () Bool)

(declare-fun e!171907 () Bool)

(assert (=> b!248109 (= e!171907 e!171908)))

(declare-fun res!207655 () Bool)

(assert (=> b!248109 (=> (not res!207655) (not e!171908))))

(declare-fun lt!386667 () (_ BitVec 64))

(declare-fun lt!386662 () (_ BitVec 64))

(assert (=> b!248109 (= res!207655 (= lt!386667 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!386662)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!248109 (= lt!386667 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))))))

(assert (=> b!248109 (= lt!386662 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))

(declare-fun b!248110 () Bool)

(declare-fun e!171902 () Bool)

(assert (=> b!248110 (= e!171902 e!171901)))

(declare-fun res!207651 () Bool)

(assert (=> b!248110 (=> (not res!207651) (not e!171901))))

(assert (=> b!248110 (= res!207651 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663))) (bvadd (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))) lt!386656)))))

(assert (=> b!248110 (= lt!386656 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!248111 () Bool)

(assert (=> b!248111 (= e!171910 (not e!171911))))

(declare-fun res!207652 () Bool)

(assert (=> b!248111 (=> res!207652 e!171911)))

(assert (=> b!248111 (= res!207652 (not (= (_1!11564 (checkBitsLoopPure!0 (_1!11565 lt!386652) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_2!11565 lt!386652))))))

(declare-fun lt!386651 () (_ BitVec 64))

(assert (=> b!248111 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386651)))

(declare-fun lt!386650 () Unit!17995)

(assert (=> b!248111 (= lt!386650 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!386663)) lt!386651))))

(declare-fun lt!386653 () tuple2!21284)

(assert (=> b!248111 (= lt!386653 (checkBitsLoopPure!0 (_1!11565 lt!386658) nBits!297 bit!26 from!289))))

(assert (=> b!248111 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386669 () Unit!17995)

(assert (=> b!248111 (= lt!386669 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6424 (_2!11563 lt!386663)) (bvsub nBits!297 from!289)))))

(assert (=> b!248111 (= (_2!11564 (readBitPure!0 (_1!11565 lt!386658))) bit!26)))

(assert (=> b!248111 (= lt!386652 (reader!0 (_2!11563 lt!386670) (_2!11563 lt!386663)))))

(assert (=> b!248111 (= lt!386658 (reader!0 thiss!1005 (_2!11563 lt!386663)))))

(declare-fun e!171906 () Bool)

(assert (=> b!248111 e!171906))

(declare-fun res!207653 () Bool)

(assert (=> b!248111 (=> (not res!207653) (not e!171906))))

(declare-fun lt!386657 () tuple2!21284)

(declare-fun lt!386659 () tuple2!21284)

(assert (=> b!248111 (= res!207653 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!386657))) (currentByte!11840 (_1!11564 lt!386657)) (currentBit!11835 (_1!11564 lt!386657))) (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!386659))) (currentByte!11840 (_1!11564 lt!386659)) (currentBit!11835 (_1!11564 lt!386659)))))))

(declare-fun lt!386661 () Unit!17995)

(declare-fun lt!386666 () BitStream!10796)

(declare-fun readBitPrefixLemma!0 (BitStream!10796 BitStream!10796) Unit!17995)

(assert (=> b!248111 (= lt!386661 (readBitPrefixLemma!0 lt!386666 (_2!11563 lt!386663)))))

(assert (=> b!248111 (= lt!386659 (readBitPure!0 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(assert (=> b!248111 (= lt!386657 (readBitPure!0 lt!386666))))

(assert (=> b!248111 (= lt!386666 (BitStream!10797 (buf!6424 (_2!11563 lt!386670)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))

(declare-fun e!171903 () Bool)

(assert (=> b!248111 e!171903))

(declare-fun res!207663 () Bool)

(assert (=> b!248111 (=> (not res!207663) (not e!171903))))

(declare-fun isPrefixOf!0 (BitStream!10796 BitStream!10796) Bool)

(assert (=> b!248111 (= res!207663 (isPrefixOf!0 thiss!1005 (_2!11563 lt!386663)))))

(declare-fun lt!386655 () Unit!17995)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10796 BitStream!10796 BitStream!10796) Unit!17995)

(assert (=> b!248111 (= lt!386655 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11563 lt!386670) (_2!11563 lt!386663)))))

(assert (=> b!248111 e!171902))

(declare-fun res!207657 () Bool)

(assert (=> b!248111 (=> (not res!207657) (not e!171902))))

(assert (=> b!248111 (= res!207657 (= (size!5937 (buf!6424 (_2!11563 lt!386670))) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10796 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21282)

(assert (=> b!248111 (= lt!386663 (appendNBitsLoop!0 (_2!11563 lt!386670) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248111 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386651)))

(assert (=> b!248111 (= lt!386651 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!386664 () Unit!17995)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10796 BitStream!10796 (_ BitVec 64) (_ BitVec 64)) Unit!17995)

(assert (=> b!248111 (= lt!386664 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11563 lt!386670) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!248111 e!171907))

(declare-fun res!207662 () Bool)

(assert (=> b!248111 (=> (not res!207662) (not e!171907))))

(assert (=> b!248111 (= res!207662 (= (size!5937 (buf!6424 thiss!1005)) (size!5937 (buf!6424 (_2!11563 lt!386670)))))))

(declare-fun appendBit!0 (BitStream!10796 Bool) tuple2!21282)

(assert (=> b!248111 (= lt!386670 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!248112 () Bool)

(assert (=> b!248112 (= e!171905 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!386665))) (currentByte!11840 (_1!11564 lt!386665)) (currentBit!11835 (_1!11564 lt!386665))) lt!386667))))

(declare-fun b!248113 () Bool)

(declare-fun array_inv!5678 (array!13541) Bool)

(assert (=> b!248113 (= e!171904 (array_inv!5678 (buf!6424 thiss!1005)))))

(declare-fun b!248114 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248114 (= e!171903 (invariant!0 (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(declare-fun b!248115 () Bool)

(declare-fun res!207658 () Bool)

(assert (=> b!248115 (=> (not res!207658) (not e!171908))))

(assert (=> b!248115 (= res!207658 (isPrefixOf!0 thiss!1005 (_2!11563 lt!386670)))))

(declare-fun b!248116 () Bool)

(declare-fun res!207650 () Bool)

(assert (=> b!248116 (=> (not res!207650) (not e!171910))))

(assert (=> b!248116 (= res!207650 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!248117 () Bool)

(declare-fun res!207659 () Bool)

(assert (=> b!248117 (=> (not res!207659) (not e!171903))))

(assert (=> b!248117 (= res!207659 (invariant!0 (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!386670)))))))

(declare-fun b!248118 () Bool)

(assert (=> b!248118 (= e!171906 (= (_2!11564 lt!386657) (_2!11564 lt!386659)))))

(declare-fun b!248119 () Bool)

(declare-fun res!207660 () Bool)

(assert (=> b!248119 (=> (not res!207660) (not e!171910))))

(assert (=> b!248119 (= res!207660 (bvslt from!289 nBits!297))))

(declare-fun b!248120 () Bool)

(declare-fun res!207656 () Bool)

(assert (=> b!248120 (=> (not res!207656) (not e!171901))))

(assert (=> b!248120 (= res!207656 (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!386663)))))

(assert (= (and start!53416 res!207654) b!248116))

(assert (= (and b!248116 res!207650) b!248119))

(assert (= (and b!248119 res!207660) b!248111))

(assert (= (and b!248111 res!207662) b!248109))

(assert (= (and b!248109 res!207655) b!248115))

(assert (= (and b!248115 res!207658) b!248106))

(assert (= (and b!248106 res!207661) b!248112))

(assert (= (and b!248111 res!207657) b!248110))

(assert (= (and b!248110 res!207651) b!248120))

(assert (= (and b!248120 res!207656) b!248107))

(assert (= (and b!248111 res!207663) b!248117))

(assert (= (and b!248117 res!207659) b!248114))

(assert (= (and b!248111 res!207653) b!248118))

(assert (= (and b!248111 (not res!207652)) b!248108))

(assert (= start!53416 b!248113))

(declare-fun m!373903 () Bool)

(assert (=> start!53416 m!373903))

(declare-fun m!373905 () Bool)

(assert (=> b!248107 m!373905))

(declare-fun m!373907 () Bool)

(assert (=> b!248107 m!373907))

(declare-fun m!373909 () Bool)

(assert (=> b!248107 m!373909))

(declare-fun m!373911 () Bool)

(assert (=> b!248107 m!373911))

(declare-fun m!373913 () Bool)

(assert (=> b!248116 m!373913))

(declare-fun m!373915 () Bool)

(assert (=> b!248109 m!373915))

(declare-fun m!373917 () Bool)

(assert (=> b!248109 m!373917))

(declare-fun m!373919 () Bool)

(assert (=> b!248110 m!373919))

(assert (=> b!248110 m!373915))

(declare-fun m!373921 () Bool)

(assert (=> b!248114 m!373921))

(declare-fun m!373923 () Bool)

(assert (=> b!248111 m!373923))

(declare-fun m!373925 () Bool)

(assert (=> b!248111 m!373925))

(declare-fun m!373927 () Bool)

(assert (=> b!248111 m!373927))

(declare-fun m!373929 () Bool)

(assert (=> b!248111 m!373929))

(declare-fun m!373931 () Bool)

(assert (=> b!248111 m!373931))

(declare-fun m!373933 () Bool)

(assert (=> b!248111 m!373933))

(declare-fun m!373935 () Bool)

(assert (=> b!248111 m!373935))

(declare-fun m!373937 () Bool)

(assert (=> b!248111 m!373937))

(declare-fun m!373939 () Bool)

(assert (=> b!248111 m!373939))

(declare-fun m!373941 () Bool)

(assert (=> b!248111 m!373941))

(declare-fun m!373943 () Bool)

(assert (=> b!248111 m!373943))

(declare-fun m!373945 () Bool)

(assert (=> b!248111 m!373945))

(declare-fun m!373947 () Bool)

(assert (=> b!248111 m!373947))

(declare-fun m!373949 () Bool)

(assert (=> b!248111 m!373949))

(declare-fun m!373951 () Bool)

(assert (=> b!248111 m!373951))

(declare-fun m!373953 () Bool)

(assert (=> b!248111 m!373953))

(assert (=> b!248111 m!373911))

(declare-fun m!373955 () Bool)

(assert (=> b!248111 m!373955))

(declare-fun m!373957 () Bool)

(assert (=> b!248111 m!373957))

(declare-fun m!373959 () Bool)

(assert (=> b!248111 m!373959))

(declare-fun m!373961 () Bool)

(assert (=> b!248120 m!373961))

(declare-fun m!373963 () Bool)

(assert (=> b!248106 m!373963))

(assert (=> b!248106 m!373963))

(declare-fun m!373965 () Bool)

(assert (=> b!248106 m!373965))

(declare-fun m!373967 () Bool)

(assert (=> b!248115 m!373967))

(declare-fun m!373969 () Bool)

(assert (=> b!248117 m!373969))

(declare-fun m!373971 () Bool)

(assert (=> b!248113 m!373971))

(declare-fun m!373973 () Bool)

(assert (=> b!248112 m!373973))

(declare-fun m!373975 () Bool)

(assert (=> b!248108 m!373975))

(push 1)

(assert (not b!248108))

(assert (not b!248111))

(assert (not b!248117))

(assert (not b!248114))

(assert (not b!248106))

(assert (not b!248113))

(assert (not start!53416))

(assert (not b!248107))

(assert (not b!248110))

(assert (not b!248112))

(assert (not b!248109))

(assert (not b!248116))

(assert (not b!248115))

(assert (not b!248120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83034 () Bool)

(assert (=> d!83034 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005) (size!5937 (buf!6424 thiss!1005))))))

(declare-fun bs!21053 () Bool)

(assert (= bs!21053 d!83034))

(declare-fun m!374103 () Bool)

(assert (=> bs!21053 m!374103))

(assert (=> start!53416 d!83034))

(declare-fun d!83036 () Bool)

(declare-datatypes ((tuple2!21290 0))(
  ( (tuple2!21291 (_1!11567 Bool) (_2!11567 BitStream!10796)) )
))
(declare-fun lt!386835 () tuple2!21290)

(declare-fun checkBitsLoop!0 (BitStream!10796 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21290)

(assert (=> d!83036 (= lt!386835 (checkBitsLoop!0 (_1!11565 lt!386660) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83036 (= (checkBitsLoopPure!0 (_1!11565 lt!386660) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21285 (_2!11567 lt!386835) (_1!11567 lt!386835)))))

(declare-fun bs!21054 () Bool)

(assert (= bs!21054 d!83036))

(declare-fun m!374105 () Bool)

(assert (=> bs!21054 m!374105))

(assert (=> b!248107 d!83036))

(declare-fun d!83038 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83038 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386656) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))) lt!386656))))

(declare-fun bs!21055 () Bool)

(assert (= bs!21055 d!83038))

(declare-fun m!374107 () Bool)

(assert (=> bs!21055 m!374107))

(assert (=> b!248107 d!83038))

(declare-fun d!83040 () Bool)

(assert (=> d!83040 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386656)))

(declare-fun lt!386838 () Unit!17995)

(declare-fun choose!9 (BitStream!10796 array!13541 (_ BitVec 64) BitStream!10796) Unit!17995)

(assert (=> d!83040 (= lt!386838 (choose!9 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!386663)) lt!386656 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(assert (=> d!83040 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!386663)) lt!386656) lt!386838)))

(declare-fun bs!21056 () Bool)

(assert (= bs!21056 d!83040))

(assert (=> bs!21056 m!373907))

(declare-fun m!374109 () Bool)

(assert (=> bs!21056 m!374109))

(assert (=> b!248107 d!83040))

(declare-fun d!83042 () Bool)

(declare-fun e!171966 () Bool)

(assert (=> d!83042 e!171966))

(declare-fun res!207752 () Bool)

(assert (=> d!83042 (=> (not res!207752) (not e!171966))))

(declare-fun lt!386922 () tuple2!21286)

(assert (=> d!83042 (= res!207752 (isPrefixOf!0 (_1!11565 lt!386922) (_2!11565 lt!386922)))))

(declare-fun lt!386925 () BitStream!10796)

(assert (=> d!83042 (= lt!386922 (tuple2!21287 lt!386925 (_2!11563 lt!386663)))))

(declare-fun lt!386931 () Unit!17995)

(declare-fun lt!386928 () Unit!17995)

(assert (=> d!83042 (= lt!386931 lt!386928)))

(assert (=> d!83042 (isPrefixOf!0 lt!386925 (_2!11563 lt!386663))))

(assert (=> d!83042 (= lt!386928 (lemmaIsPrefixTransitive!0 lt!386925 (_2!11563 lt!386663) (_2!11563 lt!386663)))))

(declare-fun lt!386933 () Unit!17995)

(declare-fun lt!386939 () Unit!17995)

(assert (=> d!83042 (= lt!386933 lt!386939)))

(assert (=> d!83042 (isPrefixOf!0 lt!386925 (_2!11563 lt!386663))))

(assert (=> d!83042 (= lt!386939 (lemmaIsPrefixTransitive!0 lt!386925 (_2!11563 lt!386670) (_2!11563 lt!386663)))))

(declare-fun lt!386935 () Unit!17995)

(declare-fun e!171967 () Unit!17995)

(assert (=> d!83042 (= lt!386935 e!171967)))

(declare-fun c!11528 () Bool)

(assert (=> d!83042 (= c!11528 (not (= (size!5937 (buf!6424 (_2!11563 lt!386670))) #b00000000000000000000000000000000)))))

(declare-fun lt!386936 () Unit!17995)

(declare-fun lt!386934 () Unit!17995)

(assert (=> d!83042 (= lt!386936 lt!386934)))

(assert (=> d!83042 (isPrefixOf!0 (_2!11563 lt!386663) (_2!11563 lt!386663))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10796) Unit!17995)

(assert (=> d!83042 (= lt!386934 (lemmaIsPrefixRefl!0 (_2!11563 lt!386663)))))

(declare-fun lt!386929 () Unit!17995)

(declare-fun lt!386926 () Unit!17995)

(assert (=> d!83042 (= lt!386929 lt!386926)))

(assert (=> d!83042 (= lt!386926 (lemmaIsPrefixRefl!0 (_2!11563 lt!386663)))))

(declare-fun lt!386932 () Unit!17995)

(declare-fun lt!386923 () Unit!17995)

(assert (=> d!83042 (= lt!386932 lt!386923)))

(assert (=> d!83042 (isPrefixOf!0 lt!386925 lt!386925)))

(assert (=> d!83042 (= lt!386923 (lemmaIsPrefixRefl!0 lt!386925))))

(declare-fun lt!386924 () Unit!17995)

(declare-fun lt!386921 () Unit!17995)

(assert (=> d!83042 (= lt!386924 lt!386921)))

(assert (=> d!83042 (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!386670))))

(assert (=> d!83042 (= lt!386921 (lemmaIsPrefixRefl!0 (_2!11563 lt!386670)))))

(assert (=> d!83042 (= lt!386925 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))))))

(assert (=> d!83042 (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!386663))))

(assert (=> d!83042 (= (reader!0 (_2!11563 lt!386670) (_2!11563 lt!386663)) lt!386922)))

(declare-fun b!248219 () Bool)

(declare-fun lt!386938 () (_ BitVec 64))

(declare-fun lt!386927 () (_ BitVec 64))

(assert (=> b!248219 (= e!171966 (= (_1!11565 lt!386922) (withMovedBitIndex!0 (_2!11565 lt!386922) (bvsub lt!386938 lt!386927))))))

(assert (=> b!248219 (or (= (bvand lt!386938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386927 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386938 lt!386927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248219 (= lt!386927 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663))))))

(assert (=> b!248219 (= lt!386938 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))))))

(declare-fun b!248220 () Bool)

(declare-fun Unit!17999 () Unit!17995)

(assert (=> b!248220 (= e!171967 Unit!17999)))

(declare-fun b!248221 () Bool)

(declare-fun res!207750 () Bool)

(assert (=> b!248221 (=> (not res!207750) (not e!171966))))

(assert (=> b!248221 (= res!207750 (isPrefixOf!0 (_1!11565 lt!386922) (_2!11563 lt!386670)))))

(declare-fun b!248222 () Bool)

(declare-fun res!207751 () Bool)

(assert (=> b!248222 (=> (not res!207751) (not e!171966))))

(assert (=> b!248222 (= res!207751 (isPrefixOf!0 (_2!11565 lt!386922) (_2!11563 lt!386663)))))

(declare-fun b!248223 () Bool)

(declare-fun lt!386940 () Unit!17995)

(assert (=> b!248223 (= e!171967 lt!386940)))

(declare-fun lt!386937 () (_ BitVec 64))

(assert (=> b!248223 (= lt!386937 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!386930 () (_ BitVec 64))

(assert (=> b!248223 (= lt!386930 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13541 array!13541 (_ BitVec 64) (_ BitVec 64)) Unit!17995)

(assert (=> b!248223 (= lt!386940 (arrayBitRangesEqSymmetric!0 (buf!6424 (_2!11563 lt!386670)) (buf!6424 (_2!11563 lt!386663)) lt!386937 lt!386930))))

(declare-fun arrayBitRangesEq!0 (array!13541 array!13541 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!248223 (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386663)) (buf!6424 (_2!11563 lt!386670)) lt!386937 lt!386930)))

(assert (= (and d!83042 c!11528) b!248223))

(assert (= (and d!83042 (not c!11528)) b!248220))

(assert (= (and d!83042 res!207752) b!248221))

(assert (= (and b!248221 res!207750) b!248222))

(assert (= (and b!248222 res!207751) b!248219))

(declare-fun m!374149 () Bool)

(assert (=> b!248221 m!374149))

(declare-fun m!374151 () Bool)

(assert (=> b!248219 m!374151))

(assert (=> b!248219 m!373919))

(assert (=> b!248219 m!373915))

(assert (=> b!248223 m!373915))

(declare-fun m!374153 () Bool)

(assert (=> b!248223 m!374153))

(declare-fun m!374155 () Bool)

(assert (=> b!248223 m!374155))

(declare-fun m!374157 () Bool)

(assert (=> d!83042 m!374157))

(declare-fun m!374159 () Bool)

(assert (=> d!83042 m!374159))

(declare-fun m!374161 () Bool)

(assert (=> d!83042 m!374161))

(assert (=> d!83042 m!373961))

(declare-fun m!374163 () Bool)

(assert (=> d!83042 m!374163))

(declare-fun m!374165 () Bool)

(assert (=> d!83042 m!374165))

(declare-fun m!374167 () Bool)

(assert (=> d!83042 m!374167))

(declare-fun m!374169 () Bool)

(assert (=> d!83042 m!374169))

(declare-fun m!374171 () Bool)

(assert (=> d!83042 m!374171))

(declare-fun m!374173 () Bool)

(assert (=> d!83042 m!374173))

(declare-fun m!374175 () Bool)

(assert (=> d!83042 m!374175))

(declare-fun m!374177 () Bool)

(assert (=> b!248222 m!374177))

(assert (=> b!248107 d!83042))

(declare-fun d!83062 () Bool)

(declare-fun lt!386943 () tuple2!21290)

(declare-fun readBit!0 (BitStream!10796) tuple2!21290)

(assert (=> d!83062 (= lt!386943 (readBit!0 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))))

(assert (=> d!83062 (= (readBitPure!0 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))) (tuple2!21285 (_2!11567 lt!386943) (_1!11567 lt!386943)))))

(declare-fun bs!21062 () Bool)

(assert (= bs!21062 d!83062))

(assert (=> bs!21062 m!373963))

(declare-fun m!374179 () Bool)

(assert (=> bs!21062 m!374179))

(assert (=> b!248106 d!83062))

(declare-fun d!83064 () Bool)

(declare-fun e!171970 () Bool)

(assert (=> d!83064 e!171970))

(declare-fun res!207756 () Bool)

(assert (=> d!83064 (=> (not res!207756) (not e!171970))))

(assert (=> d!83064 (= res!207756 (invariant!0 (currentBit!11835 (_2!11563 lt!386670)) (currentByte!11840 (_2!11563 lt!386670)) (size!5937 (buf!6424 (_2!11563 lt!386670)))))))

(assert (=> d!83064 (= (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)) (BitStream!10797 (buf!6424 (_2!11563 lt!386670)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))

(declare-fun b!248226 () Bool)

(assert (=> b!248226 (= e!171970 (invariant!0 (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!386670)))))))

(assert (= (and d!83064 res!207756) b!248226))

(declare-fun m!374181 () Bool)

(assert (=> d!83064 m!374181))

(assert (=> b!248226 m!373969))

(assert (=> b!248106 d!83064))

(declare-fun d!83066 () Bool)

(assert (=> d!83066 (= (invariant!0 (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!386670)))) (and (bvsge (currentBit!11835 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11835 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11840 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!386670)))) (and (= (currentBit!11835 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!386670))))))))))

(assert (=> b!248117 d!83066))

(declare-fun d!83068 () Bool)

(assert (=> d!83068 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21063 () Bool)

(assert (= bs!21063 d!83068))

(declare-fun m!374183 () Bool)

(assert (=> bs!21063 m!374183))

(assert (=> b!248116 d!83068))

(declare-fun d!83070 () Bool)

(declare-fun res!207763 () Bool)

(declare-fun e!171976 () Bool)

(assert (=> d!83070 (=> (not res!207763) (not e!171976))))

(assert (=> d!83070 (= res!207763 (= (size!5937 (buf!6424 (_2!11563 lt!386670))) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(assert (=> d!83070 (= (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!386663)) e!171976)))

(declare-fun b!248233 () Bool)

(declare-fun res!207765 () Bool)

(assert (=> b!248233 (=> (not res!207765) (not e!171976))))

(assert (=> b!248233 (= res!207765 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663)))))))

(declare-fun b!248234 () Bool)

(declare-fun e!171975 () Bool)

(assert (=> b!248234 (= e!171976 e!171975)))

(declare-fun res!207764 () Bool)

(assert (=> b!248234 (=> res!207764 e!171975)))

(assert (=> b!248234 (= res!207764 (= (size!5937 (buf!6424 (_2!11563 lt!386670))) #b00000000000000000000000000000000))))

(declare-fun b!248235 () Bool)

(assert (=> b!248235 (= e!171975 (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386670)) (buf!6424 (_2!11563 lt!386663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(assert (= (and d!83070 res!207763) b!248233))

(assert (= (and b!248233 res!207765) b!248234))

(assert (= (and b!248234 (not res!207764)) b!248235))

(assert (=> b!248233 m!373915))

(assert (=> b!248233 m!373919))

(assert (=> b!248235 m!373915))

(assert (=> b!248235 m!373915))

(declare-fun m!374185 () Bool)

(assert (=> b!248235 m!374185))

(assert (=> b!248120 d!83070))

(declare-fun d!83072 () Bool)

(declare-fun e!171979 () Bool)

(assert (=> d!83072 e!171979))

(declare-fun res!207771 () Bool)

(assert (=> d!83072 (=> (not res!207771) (not e!171979))))

(declare-fun lt!386956 () (_ BitVec 64))

(declare-fun lt!386957 () (_ BitVec 64))

(declare-fun lt!386961 () (_ BitVec 64))

(assert (=> d!83072 (= res!207771 (= lt!386961 (bvsub lt!386956 lt!386957)))))

(assert (=> d!83072 (or (= (bvand lt!386956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386957 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386956 lt!386957) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83072 (= lt!386957 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))))))

(declare-fun lt!386959 () (_ BitVec 64))

(declare-fun lt!386960 () (_ BitVec 64))

(assert (=> d!83072 (= lt!386956 (bvmul lt!386959 lt!386960))))

(assert (=> d!83072 (or (= lt!386959 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386960 (bvsdiv (bvmul lt!386959 lt!386960) lt!386959)))))

(assert (=> d!83072 (= lt!386960 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83072 (= lt!386959 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))))))

(assert (=> d!83072 (= lt!386961 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))))))

(assert (=> d!83072 (invariant!0 (currentBit!11835 (_2!11563 lt!386670)) (currentByte!11840 (_2!11563 lt!386670)) (size!5937 (buf!6424 (_2!11563 lt!386670))))))

(assert (=> d!83072 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))) lt!386961)))

(declare-fun b!248240 () Bool)

(declare-fun res!207770 () Bool)

(assert (=> b!248240 (=> (not res!207770) (not e!171979))))

(assert (=> b!248240 (= res!207770 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386961))))

(declare-fun b!248241 () Bool)

(declare-fun lt!386958 () (_ BitVec 64))

(assert (=> b!248241 (= e!171979 (bvsle lt!386961 (bvmul lt!386958 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248241 (or (= lt!386958 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386958 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386958)))))

(assert (=> b!248241 (= lt!386958 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))))))

(assert (= (and d!83072 res!207771) b!248240))

(assert (= (and b!248240 res!207770) b!248241))

(declare-fun m!374187 () Bool)

(assert (=> d!83072 m!374187))

(assert (=> d!83072 m!374181))

(assert (=> b!248109 d!83072))

(declare-fun d!83074 () Bool)

(declare-fun e!171980 () Bool)

(assert (=> d!83074 e!171980))

(declare-fun res!207773 () Bool)

(assert (=> d!83074 (=> (not res!207773) (not e!171980))))

(declare-fun lt!386967 () (_ BitVec 64))

(declare-fun lt!386963 () (_ BitVec 64))

(declare-fun lt!386962 () (_ BitVec 64))

(assert (=> d!83074 (= res!207773 (= lt!386967 (bvsub lt!386962 lt!386963)))))

(assert (=> d!83074 (or (= (bvand lt!386962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386963 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386962 lt!386963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83074 (= lt!386963 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005))))))

(declare-fun lt!386965 () (_ BitVec 64))

(declare-fun lt!386966 () (_ BitVec 64))

(assert (=> d!83074 (= lt!386962 (bvmul lt!386965 lt!386966))))

(assert (=> d!83074 (or (= lt!386965 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386966 (bvsdiv (bvmul lt!386965 lt!386966) lt!386965)))))

(assert (=> d!83074 (= lt!386966 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83074 (= lt!386965 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))))))

(assert (=> d!83074 (= lt!386967 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 thiss!1005))))))

(assert (=> d!83074 (invariant!0 (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005) (size!5937 (buf!6424 thiss!1005)))))

(assert (=> d!83074 (= (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)) lt!386967)))

(declare-fun b!248242 () Bool)

(declare-fun res!207772 () Bool)

(assert (=> b!248242 (=> (not res!207772) (not e!171980))))

(assert (=> b!248242 (= res!207772 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386967))))

(declare-fun b!248243 () Bool)

(declare-fun lt!386964 () (_ BitVec 64))

(assert (=> b!248243 (= e!171980 (bvsle lt!386967 (bvmul lt!386964 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248243 (or (= lt!386964 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386964 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386964)))))

(assert (=> b!248243 (= lt!386964 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))))))

(assert (= (and d!83074 res!207773) b!248242))

(assert (= (and b!248242 res!207772) b!248243))

(assert (=> d!83074 m!374183))

(assert (=> d!83074 m!374103))

(assert (=> b!248109 d!83074))

(declare-fun d!83076 () Bool)

(declare-fun e!171983 () Bool)

(assert (=> d!83076 e!171983))

(declare-fun res!207776 () Bool)

(assert (=> d!83076 (=> (not res!207776) (not e!171983))))

(declare-fun lt!386973 () (_ BitVec 64))

(declare-fun lt!386972 () BitStream!10796)

(assert (=> d!83076 (= res!207776 (= (bvadd lt!386973 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5937 (buf!6424 lt!386972)) (currentByte!11840 lt!386972) (currentBit!11835 lt!386972))))))

(assert (=> d!83076 (or (not (= (bvand lt!386973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!386973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!386973 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83076 (= lt!386973 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)) (currentBit!11835 (_1!11565 lt!386658))))))

(declare-fun moveBitIndex!0 (BitStream!10796 (_ BitVec 64)) tuple2!21282)

(assert (=> d!83076 (= lt!386972 (_2!11563 (moveBitIndex!0 (_1!11565 lt!386658) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10796 (_ BitVec 64)) Bool)

(assert (=> d!83076 (moveBitIndexPrecond!0 (_1!11565 lt!386658) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!83076 (= (withMovedBitIndex!0 (_1!11565 lt!386658) #b0000000000000000000000000000000000000000000000000000000000000001) lt!386972)))

(declare-fun b!248246 () Bool)

(assert (=> b!248246 (= e!171983 (= (size!5937 (buf!6424 (_1!11565 lt!386658))) (size!5937 (buf!6424 lt!386972))))))

(assert (= (and d!83076 res!207776) b!248246))

(declare-fun m!374189 () Bool)

(assert (=> d!83076 m!374189))

(declare-fun m!374191 () Bool)

(assert (=> d!83076 m!374191))

(declare-fun m!374193 () Bool)

(assert (=> d!83076 m!374193))

(declare-fun m!374195 () Bool)

(assert (=> d!83076 m!374195))

(assert (=> b!248108 d!83076))

(declare-fun d!83078 () Bool)

(declare-fun e!171984 () Bool)

(assert (=> d!83078 e!171984))

(declare-fun res!207778 () Bool)

(assert (=> d!83078 (=> (not res!207778) (not e!171984))))

(declare-fun lt!386975 () (_ BitVec 64))

(declare-fun lt!386979 () (_ BitVec 64))

(declare-fun lt!386974 () (_ BitVec 64))

(assert (=> d!83078 (= res!207778 (= lt!386979 (bvsub lt!386974 lt!386975)))))

(assert (=> d!83078 (or (= (bvand lt!386974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386974 lt!386975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83078 (= lt!386975 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386665)))) ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386665))) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386665)))))))

(declare-fun lt!386977 () (_ BitVec 64))

(declare-fun lt!386978 () (_ BitVec 64))

(assert (=> d!83078 (= lt!386974 (bvmul lt!386977 lt!386978))))

(assert (=> d!83078 (or (= lt!386977 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386978 (bvsdiv (bvmul lt!386977 lt!386978) lt!386977)))))

(assert (=> d!83078 (= lt!386978 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83078 (= lt!386977 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386665)))))))

(assert (=> d!83078 (= lt!386979 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386665))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386665)))))))

(assert (=> d!83078 (invariant!0 (currentBit!11835 (_1!11564 lt!386665)) (currentByte!11840 (_1!11564 lt!386665)) (size!5937 (buf!6424 (_1!11564 lt!386665))))))

(assert (=> d!83078 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!386665))) (currentByte!11840 (_1!11564 lt!386665)) (currentBit!11835 (_1!11564 lt!386665))) lt!386979)))

(declare-fun b!248247 () Bool)

(declare-fun res!207777 () Bool)

(assert (=> b!248247 (=> (not res!207777) (not e!171984))))

(assert (=> b!248247 (= res!207777 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386979))))

(declare-fun b!248248 () Bool)

(declare-fun lt!386976 () (_ BitVec 64))

(assert (=> b!248248 (= e!171984 (bvsle lt!386979 (bvmul lt!386976 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248248 (or (= lt!386976 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386976 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386976)))))

(assert (=> b!248248 (= lt!386976 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386665)))))))

(assert (= (and d!83078 res!207778) b!248247))

(assert (= (and b!248247 res!207777) b!248248))

(declare-fun m!374197 () Bool)

(assert (=> d!83078 m!374197))

(declare-fun m!374199 () Bool)

(assert (=> d!83078 m!374199))

(assert (=> b!248112 d!83078))

(declare-fun d!83080 () Bool)

(declare-fun lt!386980 () tuple2!21290)

(assert (=> d!83080 (= lt!386980 (readBit!0 lt!386666))))

(assert (=> d!83080 (= (readBitPure!0 lt!386666) (tuple2!21285 (_2!11567 lt!386980) (_1!11567 lt!386980)))))

(declare-fun bs!21064 () Bool)

(assert (= bs!21064 d!83080))

(declare-fun m!374201 () Bool)

(assert (=> bs!21064 m!374201))

(assert (=> b!248111 d!83080))

(declare-fun b!248260 () Bool)

(declare-fun e!171990 () Bool)

(declare-fun lt!387001 () (_ BitVec 64))

(assert (=> b!248260 (= e!171990 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!387001))))

(declare-fun b!248258 () Bool)

(declare-fun res!207788 () Bool)

(declare-fun e!171989 () Bool)

(assert (=> b!248258 (=> (not res!207788) (not e!171989))))

(declare-fun lt!387002 () tuple2!21282)

(assert (=> b!248258 (= res!207788 (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!387002)))))

(declare-fun b!248259 () Bool)

(declare-fun lt!387003 () tuple2!21284)

(declare-fun lt!386999 () tuple2!21286)

(assert (=> b!248259 (= e!171989 (and (_2!11564 lt!387003) (= (_1!11564 lt!387003) (_2!11565 lt!386999))))))

(assert (=> b!248259 (= lt!387003 (checkBitsLoopPure!0 (_1!11565 lt!386999) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!386997 () Unit!17995)

(declare-fun lt!386998 () Unit!17995)

(assert (=> b!248259 (= lt!386997 lt!386998)))

(assert (=> b!248259 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387002)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!387001)))

(assert (=> b!248259 (= lt!386998 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!387002)) lt!387001))))

(assert (=> b!248259 e!171990))

(declare-fun res!207790 () Bool)

(assert (=> b!248259 (=> (not res!207790) (not e!171990))))

(assert (=> b!248259 (= res!207790 (and (= (size!5937 (buf!6424 (_2!11563 lt!386670))) (size!5937 (buf!6424 (_2!11563 lt!387002)))) (bvsge lt!387001 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248259 (= lt!387001 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248259 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248259 (= lt!386999 (reader!0 (_2!11563 lt!386670) (_2!11563 lt!387002)))))

(declare-fun d!83082 () Bool)

(assert (=> d!83082 e!171989))

(declare-fun res!207789 () Bool)

(assert (=> d!83082 (=> (not res!207789) (not e!171989))))

(assert (=> d!83082 (= res!207789 (= (size!5937 (buf!6424 (_2!11563 lt!386670))) (size!5937 (buf!6424 (_2!11563 lt!387002)))))))

(declare-fun choose!51 (BitStream!10796 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21282)

(assert (=> d!83082 (= lt!387002 (choose!51 (_2!11563 lt!386670) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83082 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83082 (= (appendNBitsLoop!0 (_2!11563 lt!386670) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!387002)))

(declare-fun b!248257 () Bool)

(declare-fun res!207787 () Bool)

(assert (=> b!248257 (=> (not res!207787) (not e!171989))))

(declare-fun lt!387000 () (_ BitVec 64))

(declare-fun lt!387004 () (_ BitVec 64))

(assert (=> b!248257 (= res!207787 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!387002))) (currentByte!11840 (_2!11563 lt!387002)) (currentBit!11835 (_2!11563 lt!387002))) (bvadd lt!387000 lt!387004)))))

(assert (=> b!248257 (or (not (= (bvand lt!387000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387004 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387000 lt!387004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248257 (= lt!387004 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248257 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248257 (= lt!387000 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))))))

(assert (= (and d!83082 res!207789) b!248257))

(assert (= (and b!248257 res!207787) b!248258))

(assert (= (and b!248258 res!207788) b!248259))

(assert (= (and b!248259 res!207790) b!248260))

(declare-fun m!374203 () Bool)

(assert (=> b!248257 m!374203))

(assert (=> b!248257 m!373915))

(declare-fun m!374205 () Bool)

(assert (=> b!248260 m!374205))

(declare-fun m!374207 () Bool)

(assert (=> b!248258 m!374207))

(declare-fun m!374209 () Bool)

(assert (=> b!248259 m!374209))

(declare-fun m!374211 () Bool)

(assert (=> b!248259 m!374211))

(declare-fun m!374213 () Bool)

(assert (=> b!248259 m!374213))

(declare-fun m!374215 () Bool)

(assert (=> b!248259 m!374215))

(declare-fun m!374217 () Bool)

(assert (=> d!83082 m!374217))

(assert (=> b!248111 d!83082))

(declare-fun d!83084 () Bool)

(declare-fun e!171991 () Bool)

(assert (=> d!83084 e!171991))

(declare-fun res!207792 () Bool)

(assert (=> d!83084 (=> (not res!207792) (not e!171991))))

(declare-fun lt!387010 () (_ BitVec 64))

(declare-fun lt!387005 () (_ BitVec 64))

(declare-fun lt!387006 () (_ BitVec 64))

(assert (=> d!83084 (= res!207792 (= lt!387010 (bvsub lt!387005 lt!387006)))))

(assert (=> d!83084 (or (= (bvand lt!387005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387006 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387005 lt!387006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83084 (= lt!387006 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386657)))) ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386657))) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386657)))))))

(declare-fun lt!387008 () (_ BitVec 64))

(declare-fun lt!387009 () (_ BitVec 64))

(assert (=> d!83084 (= lt!387005 (bvmul lt!387008 lt!387009))))

(assert (=> d!83084 (or (= lt!387008 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387009 (bvsdiv (bvmul lt!387008 lt!387009) lt!387008)))))

(assert (=> d!83084 (= lt!387009 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83084 (= lt!387008 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386657)))))))

(assert (=> d!83084 (= lt!387010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386657))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386657)))))))

(assert (=> d!83084 (invariant!0 (currentBit!11835 (_1!11564 lt!386657)) (currentByte!11840 (_1!11564 lt!386657)) (size!5937 (buf!6424 (_1!11564 lt!386657))))))

(assert (=> d!83084 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!386657))) (currentByte!11840 (_1!11564 lt!386657)) (currentBit!11835 (_1!11564 lt!386657))) lt!387010)))

(declare-fun b!248261 () Bool)

(declare-fun res!207791 () Bool)

(assert (=> b!248261 (=> (not res!207791) (not e!171991))))

(assert (=> b!248261 (= res!207791 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387010))))

(declare-fun b!248262 () Bool)

(declare-fun lt!387007 () (_ BitVec 64))

(assert (=> b!248262 (= e!171991 (bvsle lt!387010 (bvmul lt!387007 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248262 (or (= lt!387007 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387007 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387007)))))

(assert (=> b!248262 (= lt!387007 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386657)))))))

(assert (= (and d!83084 res!207792) b!248261))

(assert (= (and b!248261 res!207791) b!248262))

(declare-fun m!374219 () Bool)

(assert (=> d!83084 m!374219))

(declare-fun m!374221 () Bool)

(assert (=> d!83084 m!374221))

(assert (=> b!248111 d!83084))

(declare-fun d!83086 () Bool)

(declare-fun e!171992 () Bool)

(assert (=> d!83086 e!171992))

(declare-fun res!207794 () Bool)

(assert (=> d!83086 (=> (not res!207794) (not e!171992))))

(declare-fun lt!387012 () (_ BitVec 64))

(declare-fun lt!387016 () (_ BitVec 64))

(declare-fun lt!387011 () (_ BitVec 64))

(assert (=> d!83086 (= res!207794 (= lt!387016 (bvsub lt!387011 lt!387012)))))

(assert (=> d!83086 (or (= (bvand lt!387011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387012 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387011 lt!387012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83086 (= lt!387012 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386659)))) ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386659))) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386659)))))))

(declare-fun lt!387014 () (_ BitVec 64))

(declare-fun lt!387015 () (_ BitVec 64))

(assert (=> d!83086 (= lt!387011 (bvmul lt!387014 lt!387015))))

(assert (=> d!83086 (or (= lt!387014 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387015 (bvsdiv (bvmul lt!387014 lt!387015) lt!387014)))))

(assert (=> d!83086 (= lt!387015 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83086 (= lt!387014 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386659)))))))

(assert (=> d!83086 (= lt!387016 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386659))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386659)))))))

(assert (=> d!83086 (invariant!0 (currentBit!11835 (_1!11564 lt!386659)) (currentByte!11840 (_1!11564 lt!386659)) (size!5937 (buf!6424 (_1!11564 lt!386659))))))

(assert (=> d!83086 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!386659))) (currentByte!11840 (_1!11564 lt!386659)) (currentBit!11835 (_1!11564 lt!386659))) lt!387016)))

(declare-fun b!248263 () Bool)

(declare-fun res!207793 () Bool)

(assert (=> b!248263 (=> (not res!207793) (not e!171992))))

(assert (=> b!248263 (= res!207793 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387016))))

(declare-fun b!248264 () Bool)

(declare-fun lt!387013 () (_ BitVec 64))

(assert (=> b!248264 (= e!171992 (bvsle lt!387016 (bvmul lt!387013 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248264 (or (= lt!387013 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387013 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387013)))))

(assert (=> b!248264 (= lt!387013 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386659)))))))

(assert (= (and d!83086 res!207794) b!248263))

(assert (= (and b!248263 res!207793) b!248264))

(declare-fun m!374223 () Bool)

(assert (=> d!83086 m!374223))

(declare-fun m!374225 () Bool)

(assert (=> d!83086 m!374225))

(assert (=> b!248111 d!83086))

(declare-fun d!83088 () Bool)

(declare-fun lt!387017 () tuple2!21290)

(assert (=> d!83088 (= lt!387017 (readBit!0 (_1!11565 lt!386658)))))

(assert (=> d!83088 (= (readBitPure!0 (_1!11565 lt!386658)) (tuple2!21285 (_2!11567 lt!387017) (_1!11567 lt!387017)))))

(declare-fun bs!21065 () Bool)

(assert (= bs!21065 d!83088))

(declare-fun m!374227 () Bool)

(assert (=> bs!21065 m!374227))

(assert (=> b!248111 d!83088))

(declare-fun b!248274 () Bool)

(declare-fun res!207805 () Bool)

(declare-fun e!171997 () Bool)

(assert (=> b!248274 (=> (not res!207805) (not e!171997))))

(declare-fun lt!387029 () tuple2!21282)

(declare-fun lt!387028 () (_ BitVec 64))

(declare-fun lt!387027 () (_ BitVec 64))

(assert (=> b!248274 (= res!207805 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!387029))) (currentByte!11840 (_2!11563 lt!387029)) (currentBit!11835 (_2!11563 lt!387029))) (bvadd lt!387028 lt!387027)))))

(assert (=> b!248274 (or (not (= (bvand lt!387028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387027 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387028 lt!387027) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248274 (= lt!387027 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248274 (= lt!387028 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))

(declare-fun b!248276 () Bool)

(declare-fun e!171998 () Bool)

(assert (=> b!248276 (= e!171997 e!171998)))

(declare-fun res!207804 () Bool)

(assert (=> b!248276 (=> (not res!207804) (not e!171998))))

(declare-fun lt!387026 () tuple2!21284)

(assert (=> b!248276 (= res!207804 (and (= (_2!11564 lt!387026) bit!26) (= (_1!11564 lt!387026) (_2!11563 lt!387029))))))

(assert (=> b!248276 (= lt!387026 (readBitPure!0 (readerFrom!0 (_2!11563 lt!387029) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))))

(declare-fun b!248275 () Bool)

(declare-fun res!207806 () Bool)

(assert (=> b!248275 (=> (not res!207806) (not e!171997))))

(assert (=> b!248275 (= res!207806 (isPrefixOf!0 thiss!1005 (_2!11563 lt!387029)))))

(declare-fun d!83090 () Bool)

(assert (=> d!83090 e!171997))

(declare-fun res!207803 () Bool)

(assert (=> d!83090 (=> (not res!207803) (not e!171997))))

(assert (=> d!83090 (= res!207803 (= (size!5937 (buf!6424 thiss!1005)) (size!5937 (buf!6424 (_2!11563 lt!387029)))))))

(declare-fun choose!16 (BitStream!10796 Bool) tuple2!21282)

(assert (=> d!83090 (= lt!387029 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!83090 (validate_offset_bit!0 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005)))))

(assert (=> d!83090 (= (appendBit!0 thiss!1005 bit!26) lt!387029)))

(declare-fun b!248277 () Bool)

(assert (=> b!248277 (= e!171998 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!387026))) (currentByte!11840 (_1!11564 lt!387026)) (currentBit!11835 (_1!11564 lt!387026))) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!387029))) (currentByte!11840 (_2!11563 lt!387029)) (currentBit!11835 (_2!11563 lt!387029)))))))

(assert (= (and d!83090 res!207803) b!248274))

(assert (= (and b!248274 res!207805) b!248275))

(assert (= (and b!248275 res!207806) b!248276))

(assert (= (and b!248276 res!207804) b!248277))

(declare-fun m!374229 () Bool)

(assert (=> d!83090 m!374229))

(declare-fun m!374231 () Bool)

(assert (=> d!83090 m!374231))

(declare-fun m!374233 () Bool)

(assert (=> b!248275 m!374233))

(declare-fun m!374235 () Bool)

(assert (=> b!248274 m!374235))

(assert (=> b!248274 m!373917))

(declare-fun m!374237 () Bool)

(assert (=> b!248276 m!374237))

(assert (=> b!248276 m!374237))

(declare-fun m!374239 () Bool)

(assert (=> b!248276 m!374239))

(declare-fun m!374241 () Bool)

(assert (=> b!248277 m!374241))

(assert (=> b!248277 m!374235))

(assert (=> b!248111 d!83090))

(declare-fun d!83092 () Bool)

(declare-fun e!171999 () Bool)

(assert (=> d!83092 e!171999))

(declare-fun res!207809 () Bool)

(assert (=> d!83092 (=> (not res!207809) (not e!171999))))

(declare-fun lt!387031 () tuple2!21286)

(assert (=> d!83092 (= res!207809 (isPrefixOf!0 (_1!11565 lt!387031) (_2!11565 lt!387031)))))

(declare-fun lt!387034 () BitStream!10796)

(assert (=> d!83092 (= lt!387031 (tuple2!21287 lt!387034 (_2!11563 lt!386663)))))

(declare-fun lt!387040 () Unit!17995)

(declare-fun lt!387037 () Unit!17995)

(assert (=> d!83092 (= lt!387040 lt!387037)))

(assert (=> d!83092 (isPrefixOf!0 lt!387034 (_2!11563 lt!386663))))

(assert (=> d!83092 (= lt!387037 (lemmaIsPrefixTransitive!0 lt!387034 (_2!11563 lt!386663) (_2!11563 lt!386663)))))

(declare-fun lt!387042 () Unit!17995)

(declare-fun lt!387048 () Unit!17995)

(assert (=> d!83092 (= lt!387042 lt!387048)))

(assert (=> d!83092 (isPrefixOf!0 lt!387034 (_2!11563 lt!386663))))

(assert (=> d!83092 (= lt!387048 (lemmaIsPrefixTransitive!0 lt!387034 thiss!1005 (_2!11563 lt!386663)))))

(declare-fun lt!387044 () Unit!17995)

(declare-fun e!172000 () Unit!17995)

(assert (=> d!83092 (= lt!387044 e!172000)))

(declare-fun c!11529 () Bool)

(assert (=> d!83092 (= c!11529 (not (= (size!5937 (buf!6424 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!387045 () Unit!17995)

(declare-fun lt!387043 () Unit!17995)

(assert (=> d!83092 (= lt!387045 lt!387043)))

(assert (=> d!83092 (isPrefixOf!0 (_2!11563 lt!386663) (_2!11563 lt!386663))))

(assert (=> d!83092 (= lt!387043 (lemmaIsPrefixRefl!0 (_2!11563 lt!386663)))))

(declare-fun lt!387038 () Unit!17995)

(declare-fun lt!387035 () Unit!17995)

(assert (=> d!83092 (= lt!387038 lt!387035)))

(assert (=> d!83092 (= lt!387035 (lemmaIsPrefixRefl!0 (_2!11563 lt!386663)))))

(declare-fun lt!387041 () Unit!17995)

(declare-fun lt!387032 () Unit!17995)

(assert (=> d!83092 (= lt!387041 lt!387032)))

(assert (=> d!83092 (isPrefixOf!0 lt!387034 lt!387034)))

(assert (=> d!83092 (= lt!387032 (lemmaIsPrefixRefl!0 lt!387034))))

(declare-fun lt!387033 () Unit!17995)

(declare-fun lt!387030 () Unit!17995)

(assert (=> d!83092 (= lt!387033 lt!387030)))

(assert (=> d!83092 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!83092 (= lt!387030 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!83092 (= lt!387034 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))

(assert (=> d!83092 (isPrefixOf!0 thiss!1005 (_2!11563 lt!386663))))

(assert (=> d!83092 (= (reader!0 thiss!1005 (_2!11563 lt!386663)) lt!387031)))

(declare-fun lt!387036 () (_ BitVec 64))

(declare-fun lt!387047 () (_ BitVec 64))

(declare-fun b!248278 () Bool)

(assert (=> b!248278 (= e!171999 (= (_1!11565 lt!387031) (withMovedBitIndex!0 (_2!11565 lt!387031) (bvsub lt!387047 lt!387036))))))

(assert (=> b!248278 (or (= (bvand lt!387047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387036 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387047 lt!387036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248278 (= lt!387036 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663))))))

(assert (=> b!248278 (= lt!387047 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))

(declare-fun b!248279 () Bool)

(declare-fun Unit!18000 () Unit!17995)

(assert (=> b!248279 (= e!172000 Unit!18000)))

(declare-fun b!248280 () Bool)

(declare-fun res!207807 () Bool)

(assert (=> b!248280 (=> (not res!207807) (not e!171999))))

(assert (=> b!248280 (= res!207807 (isPrefixOf!0 (_1!11565 lt!387031) thiss!1005))))

(declare-fun b!248281 () Bool)

(declare-fun res!207808 () Bool)

(assert (=> b!248281 (=> (not res!207808) (not e!171999))))

(assert (=> b!248281 (= res!207808 (isPrefixOf!0 (_2!11565 lt!387031) (_2!11563 lt!386663)))))

(declare-fun b!248282 () Bool)

(declare-fun lt!387049 () Unit!17995)

(assert (=> b!248282 (= e!172000 lt!387049)))

(declare-fun lt!387046 () (_ BitVec 64))

(assert (=> b!248282 (= lt!387046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!387039 () (_ BitVec 64))

(assert (=> b!248282 (= lt!387039 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))

(assert (=> b!248282 (= lt!387049 (arrayBitRangesEqSymmetric!0 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!386663)) lt!387046 lt!387039))))

(assert (=> b!248282 (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386663)) (buf!6424 thiss!1005) lt!387046 lt!387039)))

(assert (= (and d!83092 c!11529) b!248282))

(assert (= (and d!83092 (not c!11529)) b!248279))

(assert (= (and d!83092 res!207809) b!248280))

(assert (= (and b!248280 res!207807) b!248281))

(assert (= (and b!248281 res!207808) b!248278))

(declare-fun m!374243 () Bool)

(assert (=> b!248280 m!374243))

(declare-fun m!374245 () Bool)

(assert (=> b!248278 m!374245))

(assert (=> b!248278 m!373919))

(assert (=> b!248278 m!373917))

(assert (=> b!248282 m!373917))

(declare-fun m!374247 () Bool)

(assert (=> b!248282 m!374247))

(declare-fun m!374249 () Bool)

(assert (=> b!248282 m!374249))

(declare-fun m!374251 () Bool)

(assert (=> d!83092 m!374251))

(declare-fun m!374253 () Bool)

(assert (=> d!83092 m!374253))

(declare-fun m!374255 () Bool)

(assert (=> d!83092 m!374255))

(assert (=> d!83092 m!373933))

(declare-fun m!374257 () Bool)

(assert (=> d!83092 m!374257))

(declare-fun m!374259 () Bool)

(assert (=> d!83092 m!374259))

(declare-fun m!374261 () Bool)

(assert (=> d!83092 m!374261))

(assert (=> d!83092 m!374169))

(assert (=> d!83092 m!374171))

(declare-fun m!374263 () Bool)

(assert (=> d!83092 m!374263))

(declare-fun m!374265 () Bool)

(assert (=> d!83092 m!374265))

(declare-fun m!374267 () Bool)

(assert (=> b!248281 m!374267))

(assert (=> b!248111 d!83092))

(declare-fun d!83094 () Bool)

(declare-fun lt!387050 () tuple2!21290)

(assert (=> d!83094 (= lt!387050 (readBit!0 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(assert (=> d!83094 (= (readBitPure!0 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))) (tuple2!21285 (_2!11567 lt!387050) (_1!11567 lt!387050)))))

(declare-fun bs!21066 () Bool)

(assert (= bs!21066 d!83094))

(declare-fun m!374269 () Bool)

(assert (=> bs!21066 m!374269))

(assert (=> b!248111 d!83094))

(declare-fun d!83096 () Bool)

(assert (=> d!83096 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386651) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))) lt!386651))))

(declare-fun bs!21067 () Bool)

(assert (= bs!21067 d!83096))

(assert (=> bs!21067 m!374107))

(assert (=> b!248111 d!83096))

(declare-fun d!83098 () Bool)

(assert (=> d!83098 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386651)))

(declare-fun lt!387051 () Unit!17995)

(assert (=> d!83098 (= lt!387051 (choose!9 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!386663)) lt!386651 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(assert (=> d!83098 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!386663)) lt!386651) lt!387051)))

(declare-fun bs!21068 () Bool)

(assert (= bs!21068 d!83098))

(assert (=> bs!21068 m!373955))

(declare-fun m!374271 () Bool)

(assert (=> bs!21068 m!374271))

(assert (=> b!248111 d!83098))

(declare-fun d!83100 () Bool)

(assert (=> d!83100 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!387052 () Unit!17995)

(assert (=> d!83100 (= lt!387052 (choose!9 thiss!1005 (buf!6424 (_2!11563 lt!386663)) (bvsub nBits!297 from!289) (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(assert (=> d!83100 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6424 (_2!11563 lt!386663)) (bvsub nBits!297 from!289)) lt!387052)))

(declare-fun bs!21069 () Bool)

(assert (= bs!21069 d!83100))

(assert (=> bs!21069 m!373941))

(declare-fun m!374273 () Bool)

(assert (=> bs!21069 m!374273))

(assert (=> b!248111 d!83100))

(declare-fun lt!387053 () tuple2!21290)

(declare-fun d!83102 () Bool)

(assert (=> d!83102 (= lt!387053 (checkBitsLoop!0 (_1!11565 lt!386652) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83102 (= (checkBitsLoopPure!0 (_1!11565 lt!386652) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21285 (_2!11567 lt!387053) (_1!11567 lt!387053)))))

(declare-fun bs!21070 () Bool)

(assert (= bs!21070 d!83102))

(declare-fun m!374275 () Bool)

(assert (=> bs!21070 m!374275))

(assert (=> b!248111 d!83102))

(declare-fun d!83104 () Bool)

(declare-fun lt!387054 () tuple2!21290)

(assert (=> d!83104 (= lt!387054 (checkBitsLoop!0 (_1!11565 lt!386658) nBits!297 bit!26 from!289))))

(assert (=> d!83104 (= (checkBitsLoopPure!0 (_1!11565 lt!386658) nBits!297 bit!26 from!289) (tuple2!21285 (_2!11567 lt!387054) (_1!11567 lt!387054)))))

(declare-fun bs!21071 () Bool)

(assert (= bs!21071 d!83104))

(declare-fun m!374277 () Bool)

(assert (=> bs!21071 m!374277))

(assert (=> b!248111 d!83104))

(declare-fun d!83106 () Bool)

(assert (=> d!83106 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386651) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))) lt!386651))))

(declare-fun bs!21072 () Bool)

(assert (= bs!21072 d!83106))

(assert (=> bs!21072 m!374187))

(assert (=> b!248111 d!83106))

(declare-fun d!83108 () Bool)

(assert (=> d!83108 (isPrefixOf!0 thiss!1005 (_2!11563 lt!386663))))

(declare-fun lt!387057 () Unit!17995)

(declare-fun choose!30 (BitStream!10796 BitStream!10796 BitStream!10796) Unit!17995)

(assert (=> d!83108 (= lt!387057 (choose!30 thiss!1005 (_2!11563 lt!386670) (_2!11563 lt!386663)))))

(assert (=> d!83108 (isPrefixOf!0 thiss!1005 (_2!11563 lt!386670))))

(assert (=> d!83108 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11563 lt!386670) (_2!11563 lt!386663)) lt!387057)))

(declare-fun bs!21073 () Bool)

(assert (= bs!21073 d!83108))

(assert (=> bs!21073 m!373933))

(declare-fun m!374279 () Bool)

(assert (=> bs!21073 m!374279))

(assert (=> bs!21073 m!373967))

(assert (=> b!248111 d!83108))

(declare-fun d!83110 () Bool)

(assert (=> d!83110 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21074 () Bool)

(assert (= bs!21074 d!83110))

(declare-fun m!374281 () Bool)

(assert (=> bs!21074 m!374281))

(assert (=> b!248111 d!83110))

(assert (=> b!248111 d!83042))

(declare-fun d!83112 () Bool)

(declare-fun e!172003 () Bool)

(assert (=> d!83112 e!172003))

(declare-fun res!207812 () Bool)

(assert (=> d!83112 (=> (not res!207812) (not e!172003))))

(assert (=> d!83112 (= res!207812 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!387060 () Unit!17995)

(declare-fun choose!27 (BitStream!10796 BitStream!10796 (_ BitVec 64) (_ BitVec 64)) Unit!17995)

(assert (=> d!83112 (= lt!387060 (choose!27 thiss!1005 (_2!11563 lt!386670) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83112 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!83112 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11563 lt!386670) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!387060)))

(declare-fun b!248285 () Bool)

(assert (=> b!248285 (= e!172003 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!83112 res!207812) b!248285))

(declare-fun m!374283 () Bool)

(assert (=> d!83112 m!374283))

(declare-fun m!374285 () Bool)

(assert (=> b!248285 m!374285))

(assert (=> b!248111 d!83112))

(declare-fun d!83114 () Bool)

(declare-fun e!172006 () Bool)

(assert (=> d!83114 e!172006))

(declare-fun res!207815 () Bool)

(assert (=> d!83114 (=> (not res!207815) (not e!172006))))

(declare-fun lt!387072 () tuple2!21284)

(declare-fun lt!387071 () tuple2!21284)

(assert (=> d!83114 (= res!207815 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!387072))) (currentByte!11840 (_1!11564 lt!387072)) (currentBit!11835 (_1!11564 lt!387072))) (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!387071))) (currentByte!11840 (_1!11564 lt!387071)) (currentBit!11835 (_1!11564 lt!387071)))))))

(declare-fun lt!387070 () Unit!17995)

(declare-fun lt!387069 () BitStream!10796)

(declare-fun choose!50 (BitStream!10796 BitStream!10796 BitStream!10796 tuple2!21284 tuple2!21284 BitStream!10796 Bool tuple2!21284 tuple2!21284 BitStream!10796 Bool) Unit!17995)

(assert (=> d!83114 (= lt!387070 (choose!50 lt!386666 (_2!11563 lt!386663) lt!387069 lt!387072 (tuple2!21285 (_1!11564 lt!387072) (_2!11564 lt!387072)) (_1!11564 lt!387072) (_2!11564 lt!387072) lt!387071 (tuple2!21285 (_1!11564 lt!387071) (_2!11564 lt!387071)) (_1!11564 lt!387071) (_2!11564 lt!387071)))))

(assert (=> d!83114 (= lt!387071 (readBitPure!0 lt!387069))))

(assert (=> d!83114 (= lt!387072 (readBitPure!0 lt!386666))))

(assert (=> d!83114 (= lt!387069 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 lt!386666) (currentBit!11835 lt!386666)))))

(assert (=> d!83114 (invariant!0 (currentBit!11835 lt!386666) (currentByte!11840 lt!386666) (size!5937 (buf!6424 (_2!11563 lt!386663))))))

(assert (=> d!83114 (= (readBitPrefixLemma!0 lt!386666 (_2!11563 lt!386663)) lt!387070)))

(declare-fun b!248288 () Bool)

(assert (=> b!248288 (= e!172006 (= (_2!11564 lt!387072) (_2!11564 lt!387071)))))

(assert (= (and d!83114 res!207815) b!248288))

(declare-fun m!374287 () Bool)

(assert (=> d!83114 m!374287))

(declare-fun m!374289 () Bool)

(assert (=> d!83114 m!374289))

(declare-fun m!374291 () Bool)

(assert (=> d!83114 m!374291))

(declare-fun m!374293 () Bool)

(assert (=> d!83114 m!374293))

(declare-fun m!374295 () Bool)

(assert (=> d!83114 m!374295))

(assert (=> d!83114 m!373945))

(assert (=> b!248111 d!83114))

(declare-fun d!83116 () Bool)

(declare-fun res!207816 () Bool)

(declare-fun e!172008 () Bool)

(assert (=> d!83116 (=> (not res!207816) (not e!172008))))

(assert (=> d!83116 (= res!207816 (= (size!5937 (buf!6424 thiss!1005)) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(assert (=> d!83116 (= (isPrefixOf!0 thiss!1005 (_2!11563 lt!386663)) e!172008)))

(declare-fun b!248289 () Bool)

(declare-fun res!207818 () Bool)

(assert (=> b!248289 (=> (not res!207818) (not e!172008))))

(assert (=> b!248289 (= res!207818 (bvsle (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663)))))))

(declare-fun b!248290 () Bool)

(declare-fun e!172007 () Bool)

(assert (=> b!248290 (= e!172008 e!172007)))

(declare-fun res!207817 () Bool)

(assert (=> b!248290 (=> res!207817 e!172007)))

(assert (=> b!248290 (= res!207817 (= (size!5937 (buf!6424 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248291 () Bool)

(assert (=> b!248291 (= e!172007 (arrayBitRangesEq!0 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!386663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(assert (= (and d!83116 res!207816) b!248289))

(assert (= (and b!248289 res!207818) b!248290))

(assert (= (and b!248290 (not res!207817)) b!248291))

(assert (=> b!248289 m!373917))

(assert (=> b!248289 m!373919))

(assert (=> b!248291 m!373917))

(assert (=> b!248291 m!373917))

(declare-fun m!374297 () Bool)

(assert (=> b!248291 m!374297))

(assert (=> b!248111 d!83116))

(declare-fun d!83118 () Bool)

(declare-fun e!172009 () Bool)

(assert (=> d!83118 e!172009))

(declare-fun res!207820 () Bool)

(assert (=> d!83118 (=> (not res!207820) (not e!172009))))

(declare-fun lt!387074 () (_ BitVec 64))

(declare-fun lt!387078 () (_ BitVec 64))

(declare-fun lt!387073 () (_ BitVec 64))

(assert (=> d!83118 (= res!207820 (= lt!387078 (bvsub lt!387073 lt!387074)))))

(assert (=> d!83118 (or (= (bvand lt!387073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387073 lt!387074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83118 (= lt!387074 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386663))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386663)))))))

(declare-fun lt!387076 () (_ BitVec 64))

(declare-fun lt!387077 () (_ BitVec 64))

(assert (=> d!83118 (= lt!387073 (bvmul lt!387076 lt!387077))))

(assert (=> d!83118 (or (= lt!387076 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387077 (bvsdiv (bvmul lt!387076 lt!387077) lt!387076)))))

(assert (=> d!83118 (= lt!387077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83118 (= lt!387076 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(assert (=> d!83118 (= lt!387078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386663))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386663)))))))

(assert (=> d!83118 (invariant!0 (currentBit!11835 (_2!11563 lt!386663)) (currentByte!11840 (_2!11563 lt!386663)) (size!5937 (buf!6424 (_2!11563 lt!386663))))))

(assert (=> d!83118 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663))) lt!387078)))

(declare-fun b!248292 () Bool)

(declare-fun res!207819 () Bool)

(assert (=> b!248292 (=> (not res!207819) (not e!172009))))

(assert (=> b!248292 (= res!207819 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387078))))

(declare-fun b!248293 () Bool)

(declare-fun lt!387075 () (_ BitVec 64))

(assert (=> b!248293 (= e!172009 (bvsle lt!387078 (bvmul lt!387075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248293 (or (= lt!387075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387075)))))

(assert (=> b!248293 (= lt!387075 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(assert (= (and d!83118 res!207820) b!248292))

(assert (= (and b!248292 res!207819) b!248293))

(declare-fun m!374299 () Bool)

(assert (=> d!83118 m!374299))

(declare-fun m!374301 () Bool)

(assert (=> d!83118 m!374301))

(assert (=> b!248110 d!83118))

(assert (=> b!248110 d!83072))

(declare-fun d!83120 () Bool)

(declare-fun res!207821 () Bool)

(declare-fun e!172011 () Bool)

(assert (=> d!83120 (=> (not res!207821) (not e!172011))))

(assert (=> d!83120 (= res!207821 (= (size!5937 (buf!6424 thiss!1005)) (size!5937 (buf!6424 (_2!11563 lt!386670)))))))

(assert (=> d!83120 (= (isPrefixOf!0 thiss!1005 (_2!11563 lt!386670)) e!172011)))

(declare-fun b!248294 () Bool)

(declare-fun res!207823 () Bool)

(assert (=> b!248294 (=> (not res!207823) (not e!172011))))

(assert (=> b!248294 (= res!207823 (bvsle (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(declare-fun b!248295 () Bool)

(declare-fun e!172010 () Bool)

(assert (=> b!248295 (= e!172011 e!172010)))

(declare-fun res!207822 () Bool)

(assert (=> b!248295 (=> res!207822 e!172010)))

(assert (=> b!248295 (= res!207822 (= (size!5937 (buf!6424 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248296 () Bool)

(assert (=> b!248296 (= e!172010 (arrayBitRangesEq!0 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!386670)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(assert (= (and d!83120 res!207821) b!248294))

(assert (= (and b!248294 res!207823) b!248295))

(assert (= (and b!248295 (not res!207822)) b!248296))

(assert (=> b!248294 m!373917))

(assert (=> b!248294 m!373915))

(assert (=> b!248296 m!373917))

(assert (=> b!248296 m!373917))

(declare-fun m!374303 () Bool)

(assert (=> b!248296 m!374303))

(assert (=> b!248115 d!83120))

(declare-fun d!83122 () Bool)

(assert (=> d!83122 (= (invariant!0 (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!386663)))) (and (bvsge (currentBit!11835 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11835 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11840 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!386663)))) (and (= (currentBit!11835 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!386663))))))))))

(assert (=> b!248114 d!83122))

(declare-fun d!83124 () Bool)

(assert (=> d!83124 (= (array_inv!5678 (buf!6424 thiss!1005)) (bvsge (size!5937 (buf!6424 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!248113 d!83124))

(push 1)

(assert (not d!83092))

(assert (not b!248233))

(assert (not d!83068))

(assert (not b!248280))

(assert (not d!83088))

(assert (not d!83080))

(assert (not b!248219))

(assert (not b!248294))

(assert (not b!248257))

(assert (not b!248277))

(assert (not b!248274))

(assert (not d!83062))

(assert (not d!83112))

(assert (not b!248222))

(assert (not d!83038))

(assert (not b!248291))

(assert (not d!83108))

(assert (not d!83104))

(assert (not b!248223))

(assert (not d!83042))

(assert (not d!83072))

(assert (not b!248259))

(assert (not d!83084))

(assert (not b!248282))

(assert (not b!248235))

(assert (not b!248260))

(assert (not d!83090))

(assert (not d!83074))

(assert (not d!83114))

(assert (not d!83034))

(assert (not d!83118))

(assert (not b!248285))

(assert (not d!83064))

(assert (not d!83106))

(assert (not d!83102))

(assert (not b!248296))

(assert (not b!248281))

(assert (not d!83036))

(assert (not d!83078))

(assert (not b!248289))

(assert (not b!248226))

(assert (not d!83110))

(assert (not b!248221))

(assert (not b!248275))

(assert (not d!83096))

(assert (not d!83094))

(assert (not b!248278))

(assert (not d!83086))

(assert (not b!248258))

(assert (not d!83098))

(assert (not d!83082))

(assert (not d!83100))

(assert (not b!248276))

(assert (not d!83076))

(assert (not d!83040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83366 () Bool)

(assert (=> d!83366 (= (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386663))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386663)))) (bvsub (bvmul ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386663))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386663))))))))

(assert (=> d!83118 d!83366))

(declare-fun d!83368 () Bool)

(assert (=> d!83368 (= (invariant!0 (currentBit!11835 (_2!11563 lt!386663)) (currentByte!11840 (_2!11563 lt!386663)) (size!5937 (buf!6424 (_2!11563 lt!386663)))) (and (bvsge (currentBit!11835 (_2!11563 lt!386663)) #b00000000000000000000000000000000) (bvslt (currentBit!11835 (_2!11563 lt!386663)) #b00000000000000000000000000001000) (bvsge (currentByte!11840 (_2!11563 lt!386663)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11840 (_2!11563 lt!386663)) (size!5937 (buf!6424 (_2!11563 lt!386663)))) (and (= (currentBit!11835 (_2!11563 lt!386663)) #b00000000000000000000000000000000) (= (currentByte!11840 (_2!11563 lt!386663)) (size!5937 (buf!6424 (_2!11563 lt!386663))))))))))

(assert (=> d!83118 d!83368))

(declare-fun d!83370 () Bool)

(assert (=> d!83370 (= (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 thiss!1005)))))))

(assert (=> d!83068 d!83370))

(declare-fun b!248607 () Bool)

(declare-fun lt!387540 () (_ BitVec 32))

(declare-fun e!172226 () Bool)

(declare-datatypes ((tuple4!286 0))(
  ( (tuple4!287 (_1!11570 (_ BitVec 32)) (_2!11570 (_ BitVec 32)) (_3!923 (_ BitVec 32)) (_4!143 (_ BitVec 32))) )
))
(declare-fun lt!387542 () tuple4!286)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248607 (= e!172226 (byteRangesEq!0 (select (arr!6924 (buf!6424 thiss!1005)) (_4!143 lt!387542)) (select (arr!6924 (buf!6424 (_2!11563 lt!386670))) (_4!143 lt!387542)) #b00000000000000000000000000000000 lt!387540))))

(declare-fun b!248608 () Bool)

(declare-fun e!172230 () Bool)

(declare-fun e!172229 () Bool)

(assert (=> b!248608 (= e!172230 e!172229)))

(declare-fun res!208082 () Bool)

(assert (=> b!248608 (=> (not res!208082) (not e!172229))))

(declare-fun e!172227 () Bool)

(assert (=> b!248608 (= res!208082 e!172227)))

(declare-fun res!208080 () Bool)

(assert (=> b!248608 (=> res!208080 e!172227)))

(assert (=> b!248608 (= res!208080 (bvsge (_1!11570 lt!387542) (_2!11570 lt!387542)))))

(assert (=> b!248608 (= lt!387540 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387541 () (_ BitVec 32))

(assert (=> b!248608 (= lt!387541 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!286)

(assert (=> b!248608 (= lt!387542 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(declare-fun b!248609 () Bool)

(declare-fun res!208081 () Bool)

(assert (=> b!248609 (= res!208081 (= lt!387540 #b00000000000000000000000000000000))))

(assert (=> b!248609 (=> res!208081 e!172226)))

(declare-fun e!172228 () Bool)

(assert (=> b!248609 (= e!172228 e!172226)))

(declare-fun b!248610 () Bool)

(declare-fun e!172231 () Bool)

(assert (=> b!248610 (= e!172229 e!172231)))

(declare-fun c!11554 () Bool)

(assert (=> b!248610 (= c!11554 (= (_3!923 lt!387542) (_4!143 lt!387542)))))

(declare-fun b!248611 () Bool)

(declare-fun call!3946 () Bool)

(assert (=> b!248611 (= e!172231 call!3946)))

(declare-fun d!83372 () Bool)

(declare-fun res!208078 () Bool)

(assert (=> d!83372 (=> res!208078 e!172230)))

(assert (=> d!83372 (= res!208078 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(assert (=> d!83372 (= (arrayBitRangesEq!0 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!386670)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))) e!172230)))

(declare-fun b!248612 () Bool)

(declare-fun arrayRangesEq!920 (array!13541 array!13541 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248612 (= e!172227 (arrayRangesEq!920 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!386670)) (_1!11570 lt!387542) (_2!11570 lt!387542)))))

(declare-fun bm!3943 () Bool)

(assert (=> bm!3943 (= call!3946 (byteRangesEq!0 (select (arr!6924 (buf!6424 thiss!1005)) (_3!923 lt!387542)) (select (arr!6924 (buf!6424 (_2!11563 lt!386670))) (_3!923 lt!387542)) lt!387541 (ite c!11554 lt!387540 #b00000000000000000000000000001000)))))

(declare-fun b!248613 () Bool)

(assert (=> b!248613 (= e!172231 e!172228)))

(declare-fun res!208079 () Bool)

(assert (=> b!248613 (= res!208079 call!3946)))

(assert (=> b!248613 (=> (not res!208079) (not e!172228))))

(assert (= (and d!83372 (not res!208078)) b!248608))

(assert (= (and b!248608 (not res!208080)) b!248612))

(assert (= (and b!248608 res!208082) b!248610))

(assert (= (and b!248610 c!11554) b!248611))

(assert (= (and b!248610 (not c!11554)) b!248613))

(assert (= (and b!248613 res!208079) b!248609))

(assert (= (and b!248609 (not res!208081)) b!248607))

(assert (= (or b!248611 b!248613) bm!3943))

(declare-fun m!374813 () Bool)

(assert (=> b!248607 m!374813))

(declare-fun m!374815 () Bool)

(assert (=> b!248607 m!374815))

(assert (=> b!248607 m!374813))

(assert (=> b!248607 m!374815))

(declare-fun m!374817 () Bool)

(assert (=> b!248607 m!374817))

(assert (=> b!248608 m!373917))

(declare-fun m!374819 () Bool)

(assert (=> b!248608 m!374819))

(declare-fun m!374821 () Bool)

(assert (=> b!248612 m!374821))

(declare-fun m!374823 () Bool)

(assert (=> bm!3943 m!374823))

(declare-fun m!374825 () Bool)

(assert (=> bm!3943 m!374825))

(assert (=> bm!3943 m!374823))

(assert (=> bm!3943 m!374825))

(declare-fun m!374827 () Bool)

(assert (=> bm!3943 m!374827))

(assert (=> b!248296 d!83372))

(assert (=> b!248296 d!83074))

(assert (=> b!248294 d!83074))

(assert (=> b!248294 d!83072))

(declare-fun d!83374 () Bool)

(declare-fun e!172238 () Bool)

(assert (=> d!83374 e!172238))

(declare-fun res!208085 () Bool)

(assert (=> d!83374 (=> (not res!208085) (not e!172238))))

(declare-fun increaseBitIndex!0 (BitStream!10796) tuple2!21282)

(assert (=> d!83374 (= res!208085 (= (buf!6424 (_2!11563 (increaseBitIndex!0 (_1!11565 lt!386658)))) (buf!6424 (_1!11565 lt!386658))))))

(declare-fun lt!387563 () Bool)

(assert (=> d!83374 (= lt!387563 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (_1!11565 lt!386658))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387562 () tuple2!21290)

(assert (=> d!83374 (= lt!387562 (tuple2!21291 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (_1!11565 lt!386658))))) #b00000000000000000000000000000000)) (_2!11563 (increaseBitIndex!0 (_1!11565 lt!386658)))))))

(assert (=> d!83374 (validate_offset_bit!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11565 lt!386658)))) ((_ sign_extend 32) (currentByte!11840 (_1!11565 lt!386658))) ((_ sign_extend 32) (currentBit!11835 (_1!11565 lt!386658))))))

(assert (=> d!83374 (= (readBit!0 (_1!11565 lt!386658)) lt!387562)))

(declare-fun b!248616 () Bool)

(declare-fun lt!387557 () (_ BitVec 64))

(declare-fun lt!387558 () (_ BitVec 64))

(assert (=> b!248616 (= e!172238 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 (increaseBitIndex!0 (_1!11565 lt!386658))))) (currentByte!11840 (_2!11563 (increaseBitIndex!0 (_1!11565 lt!386658)))) (currentBit!11835 (_2!11563 (increaseBitIndex!0 (_1!11565 lt!386658))))) (bvadd lt!387558 lt!387557)))))

(assert (=> b!248616 (or (not (= (bvand lt!387558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387557 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387558 lt!387557) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248616 (= lt!387557 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248616 (= lt!387558 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)) (currentBit!11835 (_1!11565 lt!386658))))))

(declare-fun lt!387561 () Bool)

(assert (=> b!248616 (= lt!387561 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (_1!11565 lt!386658))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387560 () Bool)

(assert (=> b!248616 (= lt!387560 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (_1!11565 lt!386658))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387559 () Bool)

(assert (=> b!248616 (= lt!387559 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (_1!11565 lt!386658))))) #b00000000000000000000000000000000)))))

(assert (= (and d!83374 res!208085) b!248616))

(declare-fun m!374829 () Bool)

(assert (=> d!83374 m!374829))

(declare-fun m!374831 () Bool)

(assert (=> d!83374 m!374831))

(declare-fun m!374833 () Bool)

(assert (=> d!83374 m!374833))

(declare-fun m!374835 () Bool)

(assert (=> d!83374 m!374835))

(declare-fun m!374837 () Bool)

(assert (=> b!248616 m!374837))

(assert (=> b!248616 m!374829))

(assert (=> b!248616 m!374833))

(assert (=> b!248616 m!374831))

(assert (=> b!248616 m!374191))

(assert (=> d!83088 d!83374))

(declare-fun d!83376 () Bool)

(assert (=> d!83376 (= (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386659)))) ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386659))) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386659)))) (bvsub (bvmul ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386659)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386659))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386659))))))))

(assert (=> d!83086 d!83376))

(declare-fun d!83378 () Bool)

(assert (=> d!83378 (= (invariant!0 (currentBit!11835 (_1!11564 lt!386659)) (currentByte!11840 (_1!11564 lt!386659)) (size!5937 (buf!6424 (_1!11564 lt!386659)))) (and (bvsge (currentBit!11835 (_1!11564 lt!386659)) #b00000000000000000000000000000000) (bvslt (currentBit!11835 (_1!11564 lt!386659)) #b00000000000000000000000000001000) (bvsge (currentByte!11840 (_1!11564 lt!386659)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11840 (_1!11564 lt!386659)) (size!5937 (buf!6424 (_1!11564 lt!386659)))) (and (= (currentBit!11835 (_1!11564 lt!386659)) #b00000000000000000000000000000000) (= (currentByte!11840 (_1!11564 lt!386659)) (size!5937 (buf!6424 (_1!11564 lt!386659))))))))))

(assert (=> d!83086 d!83378))

(declare-fun b!248628 () Bool)

(declare-fun e!172247 () Bool)

(declare-fun e!172250 () Bool)

(assert (=> b!248628 (= e!172247 e!172250)))

(declare-fun res!208094 () Bool)

(assert (=> b!248628 (=> (not res!208094) (not e!172250))))

(declare-fun _$19!183 () tuple2!21282)

(declare-fun lt!387566 () tuple2!21284)

(assert (=> b!248628 (= res!208094 (and (= (_2!11564 lt!387566) bit!26) (= (_1!11564 lt!387566) (_2!11563 _$19!183))))))

(assert (=> b!248628 (= lt!387566 (readBitPure!0 (readerFrom!0 (_2!11563 _$19!183) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))))

(declare-fun b!248629 () Bool)

(declare-fun e!172248 () Bool)

(assert (=> b!248629 (= e!172248 (array_inv!5678 (buf!6424 (_2!11563 _$19!183))))))

(declare-fun b!248630 () Bool)

(declare-fun res!208095 () Bool)

(assert (=> b!248630 (=> (not res!208095) (not e!172247))))

(assert (=> b!248630 (= res!208095 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 _$19!183))) (currentByte!11840 (_2!11563 _$19!183)) (currentBit!11835 (_2!11563 _$19!183))) (bvadd (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!83380 () Bool)

(assert (=> d!83380 e!172247))

(declare-fun res!208097 () Bool)

(assert (=> d!83380 (=> (not res!208097) (not e!172247))))

(assert (=> d!83380 (= res!208097 (= (size!5937 (buf!6424 thiss!1005)) (size!5937 (buf!6424 (_2!11563 _$19!183)))))))

(assert (=> d!83380 (and (inv!12 (_2!11563 _$19!183)) e!172248)))

(assert (=> d!83380 (= (choose!16 thiss!1005 bit!26) _$19!183)))

(declare-fun b!248631 () Bool)

(declare-fun res!208096 () Bool)

(assert (=> b!248631 (=> (not res!208096) (not e!172247))))

(assert (=> b!248631 (= res!208096 (isPrefixOf!0 thiss!1005 (_2!11563 _$19!183)))))

(declare-fun b!248632 () Bool)

(assert (=> b!248632 (= e!172250 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!387566))) (currentByte!11840 (_1!11564 lt!387566)) (currentBit!11835 (_1!11564 lt!387566))) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 _$19!183))) (currentByte!11840 (_2!11563 _$19!183)) (currentBit!11835 (_2!11563 _$19!183)))))))

(assert (= d!83380 b!248629))

(assert (= (and d!83380 res!208097) b!248630))

(assert (= (and b!248630 res!208095) b!248631))

(assert (= (and b!248631 res!208096) b!248628))

(assert (= (and b!248628 res!208094) b!248632))

(declare-fun m!374839 () Bool)

(assert (=> b!248630 m!374839))

(assert (=> b!248630 m!373917))

(declare-fun m!374841 () Bool)

(assert (=> b!248629 m!374841))

(declare-fun m!374843 () Bool)

(assert (=> b!248631 m!374843))

(declare-fun m!374845 () Bool)

(assert (=> b!248632 m!374845))

(assert (=> b!248632 m!374839))

(declare-fun m!374847 () Bool)

(assert (=> b!248628 m!374847))

(assert (=> b!248628 m!374847))

(declare-fun m!374849 () Bool)

(assert (=> b!248628 m!374849))

(declare-fun m!374851 () Bool)

(assert (=> d!83380 m!374851))

(assert (=> d!83090 d!83380))

(declare-fun d!83382 () Bool)

(assert (=> d!83382 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 thiss!1005))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21117 () Bool)

(assert (= bs!21117 d!83382))

(assert (=> bs!21117 m!374183))

(assert (=> d!83090 d!83382))

(declare-fun d!83384 () Bool)

(assert (=> d!83384 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21118 () Bool)

(assert (= bs!21118 d!83384))

(assert (=> bs!21118 m!374187))

(assert (=> b!248285 d!83384))

(declare-fun d!83386 () Bool)

(declare-fun e!172251 () Bool)

(assert (=> d!83386 e!172251))

(declare-fun res!208099 () Bool)

(assert (=> d!83386 (=> (not res!208099) (not e!172251))))

(declare-fun lt!387567 () (_ BitVec 64))

(declare-fun lt!387568 () (_ BitVec 64))

(declare-fun lt!387572 () (_ BitVec 64))

(assert (=> d!83386 (= res!208099 (= lt!387572 (bvsub lt!387567 lt!387568)))))

(assert (=> d!83386 (or (= (bvand lt!387567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387568 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387567 lt!387568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83386 (= lt!387568 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 lt!386972))) ((_ sign_extend 32) (currentByte!11840 lt!386972)) ((_ sign_extend 32) (currentBit!11835 lt!386972))))))

(declare-fun lt!387570 () (_ BitVec 64))

(declare-fun lt!387571 () (_ BitVec 64))

(assert (=> d!83386 (= lt!387567 (bvmul lt!387570 lt!387571))))

(assert (=> d!83386 (or (= lt!387570 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387571 (bvsdiv (bvmul lt!387570 lt!387571) lt!387570)))))

(assert (=> d!83386 (= lt!387571 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83386 (= lt!387570 ((_ sign_extend 32) (size!5937 (buf!6424 lt!386972))))))

(assert (=> d!83386 (= lt!387572 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 lt!386972)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 lt!386972))))))

(assert (=> d!83386 (invariant!0 (currentBit!11835 lt!386972) (currentByte!11840 lt!386972) (size!5937 (buf!6424 lt!386972)))))

(assert (=> d!83386 (= (bitIndex!0 (size!5937 (buf!6424 lt!386972)) (currentByte!11840 lt!386972) (currentBit!11835 lt!386972)) lt!387572)))

(declare-fun b!248633 () Bool)

(declare-fun res!208098 () Bool)

(assert (=> b!248633 (=> (not res!208098) (not e!172251))))

(assert (=> b!248633 (= res!208098 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387572))))

(declare-fun b!248634 () Bool)

(declare-fun lt!387569 () (_ BitVec 64))

(assert (=> b!248634 (= e!172251 (bvsle lt!387572 (bvmul lt!387569 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248634 (or (= lt!387569 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387569 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387569)))))

(assert (=> b!248634 (= lt!387569 ((_ sign_extend 32) (size!5937 (buf!6424 lt!386972))))))

(assert (= (and d!83386 res!208099) b!248633))

(assert (= (and b!248633 res!208098) b!248634))

(declare-fun m!374853 () Bool)

(assert (=> d!83386 m!374853))

(declare-fun m!374855 () Bool)

(assert (=> d!83386 m!374855))

(assert (=> d!83076 d!83386))

(declare-fun d!83388 () Bool)

(declare-fun e!172252 () Bool)

(assert (=> d!83388 e!172252))

(declare-fun res!208101 () Bool)

(assert (=> d!83388 (=> (not res!208101) (not e!172252))))

(declare-fun lt!387574 () (_ BitVec 64))

(declare-fun lt!387578 () (_ BitVec 64))

(declare-fun lt!387573 () (_ BitVec 64))

(assert (=> d!83388 (= res!208101 (= lt!387578 (bvsub lt!387573 lt!387574)))))

(assert (=> d!83388 (or (= (bvand lt!387573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387574 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387573 lt!387574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83388 (= lt!387574 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11565 lt!386658)))) ((_ sign_extend 32) (currentByte!11840 (_1!11565 lt!386658))) ((_ sign_extend 32) (currentBit!11835 (_1!11565 lt!386658)))))))

(declare-fun lt!387576 () (_ BitVec 64))

(declare-fun lt!387577 () (_ BitVec 64))

(assert (=> d!83388 (= lt!387573 (bvmul lt!387576 lt!387577))))

(assert (=> d!83388 (or (= lt!387576 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387577 (bvsdiv (bvmul lt!387576 lt!387577) lt!387576)))))

(assert (=> d!83388 (= lt!387577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83388 (= lt!387576 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11565 lt!386658)))))))

(assert (=> d!83388 (= lt!387578 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11565 lt!386658))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11565 lt!386658)))))))

(assert (=> d!83388 (invariant!0 (currentBit!11835 (_1!11565 lt!386658)) (currentByte!11840 (_1!11565 lt!386658)) (size!5937 (buf!6424 (_1!11565 lt!386658))))))

(assert (=> d!83388 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)) (currentBit!11835 (_1!11565 lt!386658))) lt!387578)))

(declare-fun b!248635 () Bool)

(declare-fun res!208100 () Bool)

(assert (=> b!248635 (=> (not res!208100) (not e!172252))))

(assert (=> b!248635 (= res!208100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387578))))

(declare-fun b!248636 () Bool)

(declare-fun lt!387575 () (_ BitVec 64))

(assert (=> b!248636 (= e!172252 (bvsle lt!387578 (bvmul lt!387575 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248636 (or (= lt!387575 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387575 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387575)))))

(assert (=> b!248636 (= lt!387575 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11565 lt!386658)))))))

(assert (= (and d!83388 res!208101) b!248635))

(assert (= (and b!248635 res!208100) b!248636))

(declare-fun m!374857 () Bool)

(assert (=> d!83388 m!374857))

(declare-fun m!374859 () Bool)

(assert (=> d!83388 m!374859))

(assert (=> d!83076 d!83388))

(declare-fun d!83390 () Bool)

(declare-fun lt!387595 () (_ BitVec 32))

(assert (=> d!83390 (= lt!387595 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387594 () (_ BitVec 32))

(assert (=> d!83390 (= lt!387594 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!172258 () Bool)

(assert (=> d!83390 e!172258))

(declare-fun res!208107 () Bool)

(assert (=> d!83390 (=> (not res!208107) (not e!172258))))

(assert (=> d!83390 (= res!208107 (moveBitIndexPrecond!0 (_1!11565 lt!386658) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!18010 () Unit!17995)

(declare-fun Unit!18011 () Unit!17995)

(declare-fun Unit!18012 () Unit!17995)

(assert (=> d!83390 (= (moveBitIndex!0 (_1!11565 lt!386658) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11835 (_1!11565 lt!386658)) lt!387595) #b00000000000000000000000000000000) (tuple2!21283 Unit!18010 (BitStream!10797 (buf!6424 (_1!11565 lt!386658)) (bvsub (bvadd (currentByte!11840 (_1!11565 lt!386658)) lt!387594) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!387595 (currentBit!11835 (_1!11565 lt!386658))))) (ite (bvsge (bvadd (currentBit!11835 (_1!11565 lt!386658)) lt!387595) #b00000000000000000000000000001000) (tuple2!21283 Unit!18011 (BitStream!10797 (buf!6424 (_1!11565 lt!386658)) (bvadd (currentByte!11840 (_1!11565 lt!386658)) lt!387594 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11835 (_1!11565 lt!386658)) lt!387595) #b00000000000000000000000000001000))) (tuple2!21283 Unit!18012 (BitStream!10797 (buf!6424 (_1!11565 lt!386658)) (bvadd (currentByte!11840 (_1!11565 lt!386658)) lt!387594) (bvadd (currentBit!11835 (_1!11565 lt!386658)) lt!387595))))))))

(declare-fun b!248641 () Bool)

(declare-fun e!172257 () Bool)

(assert (=> b!248641 (= e!172258 e!172257)))

(declare-fun res!208106 () Bool)

(assert (=> b!248641 (=> (not res!208106) (not e!172257))))

(declare-fun lt!387596 () (_ BitVec 64))

(declare-fun lt!387593 () tuple2!21282)

(assert (=> b!248641 (= res!208106 (= (bvadd lt!387596 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!387593))) (currentByte!11840 (_2!11563 lt!387593)) (currentBit!11835 (_2!11563 lt!387593)))))))

(assert (=> b!248641 (or (not (= (bvand lt!387596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387596 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248641 (= lt!387596 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)) (currentBit!11835 (_1!11565 lt!386658))))))

(declare-fun lt!387591 () (_ BitVec 32))

(declare-fun lt!387592 () (_ BitVec 32))

(declare-fun Unit!18013 () Unit!17995)

(declare-fun Unit!18014 () Unit!17995)

(declare-fun Unit!18015 () Unit!17995)

(assert (=> b!248641 (= lt!387593 (ite (bvslt (bvadd (currentBit!11835 (_1!11565 lt!386658)) lt!387592) #b00000000000000000000000000000000) (tuple2!21283 Unit!18013 (BitStream!10797 (buf!6424 (_1!11565 lt!386658)) (bvsub (bvadd (currentByte!11840 (_1!11565 lt!386658)) lt!387591) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!387592 (currentBit!11835 (_1!11565 lt!386658))))) (ite (bvsge (bvadd (currentBit!11835 (_1!11565 lt!386658)) lt!387592) #b00000000000000000000000000001000) (tuple2!21283 Unit!18014 (BitStream!10797 (buf!6424 (_1!11565 lt!386658)) (bvadd (currentByte!11840 (_1!11565 lt!386658)) lt!387591 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11835 (_1!11565 lt!386658)) lt!387592) #b00000000000000000000000000001000))) (tuple2!21283 Unit!18015 (BitStream!10797 (buf!6424 (_1!11565 lt!386658)) (bvadd (currentByte!11840 (_1!11565 lt!386658)) lt!387591) (bvadd (currentBit!11835 (_1!11565 lt!386658)) lt!387592))))))))

(assert (=> b!248641 (= lt!387592 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248641 (= lt!387591 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!248642 () Bool)

(assert (=> b!248642 (= e!172257 (and (= (size!5937 (buf!6424 (_1!11565 lt!386658))) (size!5937 (buf!6424 (_2!11563 lt!387593)))) (= (buf!6424 (_1!11565 lt!386658)) (buf!6424 (_2!11563 lt!387593)))))))

(assert (= (and d!83390 res!208107) b!248641))

(assert (= (and b!248641 res!208106) b!248642))

(assert (=> d!83390 m!374195))

(declare-fun m!374861 () Bool)

(assert (=> b!248641 m!374861))

(assert (=> b!248641 m!374191))

(assert (=> d!83076 d!83390))

(declare-fun d!83394 () Bool)

(declare-fun res!208110 () Bool)

(declare-fun e!172261 () Bool)

(assert (=> d!83394 (=> (not res!208110) (not e!172261))))

(assert (=> d!83394 (= res!208110 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11565 lt!386658))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11565 lt!386658))))))))))

(assert (=> d!83394 (= (moveBitIndexPrecond!0 (_1!11565 lt!386658) #b0000000000000000000000000000000000000000000000000000000000000001) e!172261)))

(declare-fun b!248646 () Bool)

(declare-fun lt!387599 () (_ BitVec 64))

(assert (=> b!248646 (= e!172261 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387599) (bvsle lt!387599 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11565 lt!386658))))))))))

(assert (=> b!248646 (= lt!387599 (bvadd (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)) (currentBit!11835 (_1!11565 lt!386658))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!83394 res!208110) b!248646))

(assert (=> b!248646 m!374191))

(assert (=> d!83076 d!83394))

(declare-fun d!83396 () Bool)

(assert (=> d!83396 (= (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 thiss!1005)))))))

(assert (=> d!83110 d!83396))

(declare-fun d!83398 () Bool)

(declare-fun e!172262 () Bool)

(assert (=> d!83398 e!172262))

(declare-fun res!208111 () Bool)

(assert (=> d!83398 (=> (not res!208111) (not e!172262))))

(declare-fun lt!387601 () (_ BitVec 64))

(declare-fun lt!387600 () BitStream!10796)

(assert (=> d!83398 (= res!208111 (= (bvadd lt!387601 (bvsub lt!387047 lt!387036)) (bitIndex!0 (size!5937 (buf!6424 lt!387600)) (currentByte!11840 lt!387600) (currentBit!11835 lt!387600))))))

(assert (=> d!83398 (or (not (= (bvand lt!387601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387047 lt!387036) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387601 (bvsub lt!387047 lt!387036)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83398 (= lt!387601 (bitIndex!0 (size!5937 (buf!6424 (_2!11565 lt!387031))) (currentByte!11840 (_2!11565 lt!387031)) (currentBit!11835 (_2!11565 lt!387031))))))

(assert (=> d!83398 (= lt!387600 (_2!11563 (moveBitIndex!0 (_2!11565 lt!387031) (bvsub lt!387047 lt!387036))))))

(assert (=> d!83398 (moveBitIndexPrecond!0 (_2!11565 lt!387031) (bvsub lt!387047 lt!387036))))

(assert (=> d!83398 (= (withMovedBitIndex!0 (_2!11565 lt!387031) (bvsub lt!387047 lt!387036)) lt!387600)))

(declare-fun b!248647 () Bool)

(assert (=> b!248647 (= e!172262 (= (size!5937 (buf!6424 (_2!11565 lt!387031))) (size!5937 (buf!6424 lt!387600))))))

(assert (= (and d!83398 res!208111) b!248647))

(declare-fun m!374863 () Bool)

(assert (=> d!83398 m!374863))

(declare-fun m!374865 () Bool)

(assert (=> d!83398 m!374865))

(declare-fun m!374867 () Bool)

(assert (=> d!83398 m!374867))

(declare-fun m!374869 () Bool)

(assert (=> d!83398 m!374869))

(assert (=> b!248278 d!83398))

(assert (=> b!248278 d!83118))

(assert (=> b!248278 d!83074))

(declare-fun d!83400 () Bool)

(declare-fun lt!387602 () tuple2!21290)

(assert (=> d!83400 (= lt!387602 (readBit!0 (readerFrom!0 (_2!11563 lt!387029) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))))

(assert (=> d!83400 (= (readBitPure!0 (readerFrom!0 (_2!11563 lt!387029) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))) (tuple2!21285 (_2!11567 lt!387602) (_1!11567 lt!387602)))))

(declare-fun bs!21119 () Bool)

(assert (= bs!21119 d!83400))

(assert (=> bs!21119 m!374237))

(declare-fun m!374871 () Bool)

(assert (=> bs!21119 m!374871))

(assert (=> b!248276 d!83400))

(declare-fun d!83402 () Bool)

(declare-fun e!172263 () Bool)

(assert (=> d!83402 e!172263))

(declare-fun res!208112 () Bool)

(assert (=> d!83402 (=> (not res!208112) (not e!172263))))

(assert (=> d!83402 (= res!208112 (invariant!0 (currentBit!11835 (_2!11563 lt!387029)) (currentByte!11840 (_2!11563 lt!387029)) (size!5937 (buf!6424 (_2!11563 lt!387029)))))))

(assert (=> d!83402 (= (readerFrom!0 (_2!11563 lt!387029) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)) (BitStream!10797 (buf!6424 (_2!11563 lt!387029)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))

(declare-fun b!248648 () Bool)

(assert (=> b!248648 (= e!172263 (invariant!0 (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005) (size!5937 (buf!6424 (_2!11563 lt!387029)))))))

(assert (= (and d!83402 res!208112) b!248648))

(declare-fun m!374873 () Bool)

(assert (=> d!83402 m!374873))

(declare-fun m!374875 () Bool)

(assert (=> b!248648 m!374875))

(assert (=> b!248276 d!83402))

(declare-fun d!83404 () Bool)

(declare-fun res!208113 () Bool)

(declare-fun e!172265 () Bool)

(assert (=> d!83404 (=> (not res!208113) (not e!172265))))

(assert (=> d!83404 (= res!208113 (= (size!5937 (buf!6424 (_1!11565 lt!386922))) (size!5937 (buf!6424 (_2!11563 lt!386670)))))))

(assert (=> d!83404 (= (isPrefixOf!0 (_1!11565 lt!386922) (_2!11563 lt!386670)) e!172265)))

(declare-fun b!248649 () Bool)

(declare-fun res!208115 () Bool)

(assert (=> b!248649 (=> (not res!208115) (not e!172265))))

(assert (=> b!248649 (= res!208115 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386922))) (currentByte!11840 (_1!11565 lt!386922)) (currentBit!11835 (_1!11565 lt!386922))) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(declare-fun b!248650 () Bool)

(declare-fun e!172264 () Bool)

(assert (=> b!248650 (= e!172265 e!172264)))

(declare-fun res!208114 () Bool)

(assert (=> b!248650 (=> res!208114 e!172264)))

(assert (=> b!248650 (= res!208114 (= (size!5937 (buf!6424 (_1!11565 lt!386922))) #b00000000000000000000000000000000))))

(declare-fun b!248651 () Bool)

(assert (=> b!248651 (= e!172264 (arrayBitRangesEq!0 (buf!6424 (_1!11565 lt!386922)) (buf!6424 (_2!11563 lt!386670)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386922))) (currentByte!11840 (_1!11565 lt!386922)) (currentBit!11835 (_1!11565 lt!386922)))))))

(assert (= (and d!83404 res!208113) b!248649))

(assert (= (and b!248649 res!208115) b!248650))

(assert (= (and b!248650 (not res!208114)) b!248651))

(declare-fun m!374877 () Bool)

(assert (=> b!248649 m!374877))

(assert (=> b!248649 m!373915))

(assert (=> b!248651 m!374877))

(assert (=> b!248651 m!374877))

(declare-fun m!374879 () Bool)

(assert (=> b!248651 m!374879))

(assert (=> b!248221 d!83404))

(declare-fun d!83406 () Bool)

(declare-fun res!208116 () Bool)

(declare-fun e!172267 () Bool)

(assert (=> d!83406 (=> (not res!208116) (not e!172267))))

(assert (=> d!83406 (= res!208116 (= (size!5937 (buf!6424 (_1!11565 lt!387031))) (size!5937 (buf!6424 thiss!1005))))))

(assert (=> d!83406 (= (isPrefixOf!0 (_1!11565 lt!387031) thiss!1005) e!172267)))

(declare-fun b!248652 () Bool)

(declare-fun res!208118 () Bool)

(assert (=> b!248652 (=> (not res!208118) (not e!172267))))

(assert (=> b!248652 (= res!208118 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!387031))) (currentByte!11840 (_1!11565 lt!387031)) (currentBit!11835 (_1!11565 lt!387031))) (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(declare-fun b!248653 () Bool)

(declare-fun e!172266 () Bool)

(assert (=> b!248653 (= e!172267 e!172266)))

(declare-fun res!208117 () Bool)

(assert (=> b!248653 (=> res!208117 e!172266)))

(assert (=> b!248653 (= res!208117 (= (size!5937 (buf!6424 (_1!11565 lt!387031))) #b00000000000000000000000000000000))))

(declare-fun b!248654 () Bool)

(assert (=> b!248654 (= e!172266 (arrayBitRangesEq!0 (buf!6424 (_1!11565 lt!387031)) (buf!6424 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!387031))) (currentByte!11840 (_1!11565 lt!387031)) (currentBit!11835 (_1!11565 lt!387031)))))))

(assert (= (and d!83406 res!208116) b!248652))

(assert (= (and b!248652 res!208118) b!248653))

(assert (= (and b!248653 (not res!208117)) b!248654))

(declare-fun m!374881 () Bool)

(assert (=> b!248652 m!374881))

(assert (=> b!248652 m!373917))

(assert (=> b!248654 m!374881))

(assert (=> b!248654 m!374881))

(declare-fun m!374883 () Bool)

(assert (=> b!248654 m!374883))

(assert (=> b!248280 d!83406))

(declare-fun d!83408 () Bool)

(assert (=> d!83408 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!387001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))) lt!387001))))

(declare-fun bs!21120 () Bool)

(assert (= bs!21120 d!83408))

(assert (=> bs!21120 m!374187))

(assert (=> b!248260 d!83408))

(declare-fun d!83410 () Bool)

(assert (=> d!83410 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83410 true))

(declare-fun _$1!321 () Unit!17995)

(assert (=> d!83410 (= (choose!27 thiss!1005 (_2!11563 lt!386670) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!321)))

(declare-fun bs!21121 () Bool)

(assert (= bs!21121 d!83410))

(assert (=> bs!21121 m!374285))

(assert (=> d!83112 d!83410))

(assert (=> b!248223 d!83072))

(declare-fun d!83412 () Bool)

(assert (=> d!83412 (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386663)) (buf!6424 (_2!11563 lt!386670)) lt!386937 lt!386930)))

(declare-fun lt!387605 () Unit!17995)

(declare-fun choose!8 (array!13541 array!13541 (_ BitVec 64) (_ BitVec 64)) Unit!17995)

(assert (=> d!83412 (= lt!387605 (choose!8 (buf!6424 (_2!11563 lt!386670)) (buf!6424 (_2!11563 lt!386663)) lt!386937 lt!386930))))

(assert (=> d!83412 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386937) (bvsle lt!386937 lt!386930))))

(assert (=> d!83412 (= (arrayBitRangesEqSymmetric!0 (buf!6424 (_2!11563 lt!386670)) (buf!6424 (_2!11563 lt!386663)) lt!386937 lt!386930) lt!387605)))

(declare-fun bs!21122 () Bool)

(assert (= bs!21122 d!83412))

(assert (=> bs!21122 m!374155))

(declare-fun m!374885 () Bool)

(assert (=> bs!21122 m!374885))

(assert (=> b!248223 d!83412))

(declare-fun b!248655 () Bool)

(declare-fun e!172268 () Bool)

(declare-fun lt!387608 () tuple4!286)

(declare-fun lt!387606 () (_ BitVec 32))

(assert (=> b!248655 (= e!172268 (byteRangesEq!0 (select (arr!6924 (buf!6424 (_2!11563 lt!386663))) (_4!143 lt!387608)) (select (arr!6924 (buf!6424 (_2!11563 lt!386670))) (_4!143 lt!387608)) #b00000000000000000000000000000000 lt!387606))))

(declare-fun b!248656 () Bool)

(declare-fun e!172272 () Bool)

(declare-fun e!172271 () Bool)

(assert (=> b!248656 (= e!172272 e!172271)))

(declare-fun res!208123 () Bool)

(assert (=> b!248656 (=> (not res!208123) (not e!172271))))

(declare-fun e!172269 () Bool)

(assert (=> b!248656 (= res!208123 e!172269)))

(declare-fun res!208121 () Bool)

(assert (=> b!248656 (=> res!208121 e!172269)))

(assert (=> b!248656 (= res!208121 (bvsge (_1!11570 lt!387608) (_2!11570 lt!387608)))))

(assert (=> b!248656 (= lt!387606 ((_ extract 31 0) (bvsrem lt!386930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387607 () (_ BitVec 32))

(assert (=> b!248656 (= lt!387607 ((_ extract 31 0) (bvsrem lt!386937 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248656 (= lt!387608 (arrayBitIndices!0 lt!386937 lt!386930))))

(declare-fun b!248657 () Bool)

(declare-fun res!208122 () Bool)

(assert (=> b!248657 (= res!208122 (= lt!387606 #b00000000000000000000000000000000))))

(assert (=> b!248657 (=> res!208122 e!172268)))

(declare-fun e!172270 () Bool)

(assert (=> b!248657 (= e!172270 e!172268)))

(declare-fun b!248658 () Bool)

(declare-fun e!172273 () Bool)

(assert (=> b!248658 (= e!172271 e!172273)))

(declare-fun c!11555 () Bool)

(assert (=> b!248658 (= c!11555 (= (_3!923 lt!387608) (_4!143 lt!387608)))))

(declare-fun b!248659 () Bool)

(declare-fun call!3947 () Bool)

(assert (=> b!248659 (= e!172273 call!3947)))

(declare-fun d!83414 () Bool)

(declare-fun res!208119 () Bool)

(assert (=> d!83414 (=> res!208119 e!172272)))

(assert (=> d!83414 (= res!208119 (bvsge lt!386937 lt!386930))))

(assert (=> d!83414 (= (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386663)) (buf!6424 (_2!11563 lt!386670)) lt!386937 lt!386930) e!172272)))

(declare-fun b!248660 () Bool)

(assert (=> b!248660 (= e!172269 (arrayRangesEq!920 (buf!6424 (_2!11563 lt!386663)) (buf!6424 (_2!11563 lt!386670)) (_1!11570 lt!387608) (_2!11570 lt!387608)))))

(declare-fun bm!3944 () Bool)

(assert (=> bm!3944 (= call!3947 (byteRangesEq!0 (select (arr!6924 (buf!6424 (_2!11563 lt!386663))) (_3!923 lt!387608)) (select (arr!6924 (buf!6424 (_2!11563 lt!386670))) (_3!923 lt!387608)) lt!387607 (ite c!11555 lt!387606 #b00000000000000000000000000001000)))))

(declare-fun b!248661 () Bool)

(assert (=> b!248661 (= e!172273 e!172270)))

(declare-fun res!208120 () Bool)

(assert (=> b!248661 (= res!208120 call!3947)))

(assert (=> b!248661 (=> (not res!208120) (not e!172270))))

(assert (= (and d!83414 (not res!208119)) b!248656))

(assert (= (and b!248656 (not res!208121)) b!248660))

(assert (= (and b!248656 res!208123) b!248658))

(assert (= (and b!248658 c!11555) b!248659))

(assert (= (and b!248658 (not c!11555)) b!248661))

(assert (= (and b!248661 res!208120) b!248657))

(assert (= (and b!248657 (not res!208122)) b!248655))

(assert (= (or b!248659 b!248661) bm!3944))

(declare-fun m!374887 () Bool)

(assert (=> b!248655 m!374887))

(declare-fun m!374889 () Bool)

(assert (=> b!248655 m!374889))

(assert (=> b!248655 m!374887))

(assert (=> b!248655 m!374889))

(declare-fun m!374891 () Bool)

(assert (=> b!248655 m!374891))

(declare-fun m!374893 () Bool)

(assert (=> b!248656 m!374893))

(declare-fun m!374895 () Bool)

(assert (=> b!248660 m!374895))

(declare-fun m!374897 () Bool)

(assert (=> bm!3944 m!374897))

(declare-fun m!374899 () Bool)

(assert (=> bm!3944 m!374899))

(assert (=> bm!3944 m!374897))

(assert (=> bm!3944 m!374899))

(declare-fun m!374901 () Bool)

(assert (=> bm!3944 m!374901))

(assert (=> b!248223 d!83414))

(declare-fun d!83416 () Bool)

(declare-fun res!208124 () Bool)

(declare-fun e!172275 () Bool)

(assert (=> d!83416 (=> (not res!208124) (not e!172275))))

(assert (=> d!83416 (= res!208124 (= (size!5937 (buf!6424 (_2!11563 lt!386670))) (size!5937 (buf!6424 (_2!11563 lt!387002)))))))

(assert (=> d!83416 (= (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!387002)) e!172275)))

(declare-fun b!248662 () Bool)

(declare-fun res!208126 () Bool)

(assert (=> b!248662 (=> (not res!208126) (not e!172275))))

(assert (=> b!248662 (= res!208126 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!387002))) (currentByte!11840 (_2!11563 lt!387002)) (currentBit!11835 (_2!11563 lt!387002)))))))

(declare-fun b!248663 () Bool)

(declare-fun e!172274 () Bool)

(assert (=> b!248663 (= e!172275 e!172274)))

(declare-fun res!208125 () Bool)

(assert (=> b!248663 (=> res!208125 e!172274)))

(assert (=> b!248663 (= res!208125 (= (size!5937 (buf!6424 (_2!11563 lt!386670))) #b00000000000000000000000000000000))))

(declare-fun b!248664 () Bool)

(assert (=> b!248664 (= e!172274 (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386670)) (buf!6424 (_2!11563 lt!387002)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(assert (= (and d!83416 res!208124) b!248662))

(assert (= (and b!248662 res!208126) b!248663))

(assert (= (and b!248663 (not res!208125)) b!248664))

(assert (=> b!248662 m!373915))

(assert (=> b!248662 m!374203))

(assert (=> b!248664 m!373915))

(assert (=> b!248664 m!373915))

(declare-fun m!374903 () Bool)

(assert (=> b!248664 m!374903))

(assert (=> b!248258 d!83416))

(declare-fun d!83418 () Bool)

(assert (=> d!83418 (= (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))) (bvsub (bvmul ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386670)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))))))))

(assert (=> d!83106 d!83418))

(assert (=> b!248282 d!83074))

(declare-fun d!83420 () Bool)

(assert (=> d!83420 (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386663)) (buf!6424 thiss!1005) lt!387046 lt!387039)))

(declare-fun lt!387609 () Unit!17995)

(assert (=> d!83420 (= lt!387609 (choose!8 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!386663)) lt!387046 lt!387039))))

(assert (=> d!83420 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387046) (bvsle lt!387046 lt!387039))))

(assert (=> d!83420 (= (arrayBitRangesEqSymmetric!0 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!386663)) lt!387046 lt!387039) lt!387609)))

(declare-fun bs!21123 () Bool)

(assert (= bs!21123 d!83420))

(assert (=> bs!21123 m!374249))

(declare-fun m!374905 () Bool)

(assert (=> bs!21123 m!374905))

(assert (=> b!248282 d!83420))

(declare-fun lt!387610 () (_ BitVec 32))

(declare-fun e!172276 () Bool)

(declare-fun b!248665 () Bool)

(declare-fun lt!387612 () tuple4!286)

(assert (=> b!248665 (= e!172276 (byteRangesEq!0 (select (arr!6924 (buf!6424 (_2!11563 lt!386663))) (_4!143 lt!387612)) (select (arr!6924 (buf!6424 thiss!1005)) (_4!143 lt!387612)) #b00000000000000000000000000000000 lt!387610))))

(declare-fun b!248666 () Bool)

(declare-fun e!172280 () Bool)

(declare-fun e!172279 () Bool)

(assert (=> b!248666 (= e!172280 e!172279)))

(declare-fun res!208131 () Bool)

(assert (=> b!248666 (=> (not res!208131) (not e!172279))))

(declare-fun e!172277 () Bool)

(assert (=> b!248666 (= res!208131 e!172277)))

(declare-fun res!208129 () Bool)

(assert (=> b!248666 (=> res!208129 e!172277)))

(assert (=> b!248666 (= res!208129 (bvsge (_1!11570 lt!387612) (_2!11570 lt!387612)))))

(assert (=> b!248666 (= lt!387610 ((_ extract 31 0) (bvsrem lt!387039 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387611 () (_ BitVec 32))

(assert (=> b!248666 (= lt!387611 ((_ extract 31 0) (bvsrem lt!387046 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248666 (= lt!387612 (arrayBitIndices!0 lt!387046 lt!387039))))

(declare-fun b!248667 () Bool)

(declare-fun res!208130 () Bool)

(assert (=> b!248667 (= res!208130 (= lt!387610 #b00000000000000000000000000000000))))

(assert (=> b!248667 (=> res!208130 e!172276)))

(declare-fun e!172278 () Bool)

(assert (=> b!248667 (= e!172278 e!172276)))

(declare-fun b!248668 () Bool)

(declare-fun e!172281 () Bool)

(assert (=> b!248668 (= e!172279 e!172281)))

(declare-fun c!11556 () Bool)

(assert (=> b!248668 (= c!11556 (= (_3!923 lt!387612) (_4!143 lt!387612)))))

(declare-fun b!248669 () Bool)

(declare-fun call!3948 () Bool)

(assert (=> b!248669 (= e!172281 call!3948)))

(declare-fun d!83422 () Bool)

(declare-fun res!208127 () Bool)

(assert (=> d!83422 (=> res!208127 e!172280)))

(assert (=> d!83422 (= res!208127 (bvsge lt!387046 lt!387039))))

(assert (=> d!83422 (= (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386663)) (buf!6424 thiss!1005) lt!387046 lt!387039) e!172280)))

(declare-fun b!248670 () Bool)

(assert (=> b!248670 (= e!172277 (arrayRangesEq!920 (buf!6424 (_2!11563 lt!386663)) (buf!6424 thiss!1005) (_1!11570 lt!387612) (_2!11570 lt!387612)))))

(declare-fun bm!3945 () Bool)

(assert (=> bm!3945 (= call!3948 (byteRangesEq!0 (select (arr!6924 (buf!6424 (_2!11563 lt!386663))) (_3!923 lt!387612)) (select (arr!6924 (buf!6424 thiss!1005)) (_3!923 lt!387612)) lt!387611 (ite c!11556 lt!387610 #b00000000000000000000000000001000)))))

(declare-fun b!248671 () Bool)

(assert (=> b!248671 (= e!172281 e!172278)))

(declare-fun res!208128 () Bool)

(assert (=> b!248671 (= res!208128 call!3948)))

(assert (=> b!248671 (=> (not res!208128) (not e!172278))))

(assert (= (and d!83422 (not res!208127)) b!248666))

(assert (= (and b!248666 (not res!208129)) b!248670))

(assert (= (and b!248666 res!208131) b!248668))

(assert (= (and b!248668 c!11556) b!248669))

(assert (= (and b!248668 (not c!11556)) b!248671))

(assert (= (and b!248671 res!208128) b!248667))

(assert (= (and b!248667 (not res!208130)) b!248665))

(assert (= (or b!248669 b!248671) bm!3945))

(declare-fun m!374907 () Bool)

(assert (=> b!248665 m!374907))

(declare-fun m!374909 () Bool)

(assert (=> b!248665 m!374909))

(assert (=> b!248665 m!374907))

(assert (=> b!248665 m!374909))

(declare-fun m!374911 () Bool)

(assert (=> b!248665 m!374911))

(declare-fun m!374913 () Bool)

(assert (=> b!248666 m!374913))

(declare-fun m!374915 () Bool)

(assert (=> b!248670 m!374915))

(declare-fun m!374917 () Bool)

(assert (=> bm!3945 m!374917))

(declare-fun m!374919 () Bool)

(assert (=> bm!3945 m!374919))

(assert (=> bm!3945 m!374917))

(assert (=> bm!3945 m!374919))

(declare-fun m!374921 () Bool)

(assert (=> bm!3945 m!374921))

(assert (=> b!248282 d!83422))

(declare-fun d!83424 () Bool)

(assert (=> d!83424 (= (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))) (bvsub (bvmul ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))))))))

(assert (=> d!83038 d!83424))

(assert (=> b!248289 d!83074))

(assert (=> b!248289 d!83118))

(declare-fun e!172282 () Bool)

(declare-fun lt!387615 () tuple4!286)

(declare-fun lt!387613 () (_ BitVec 32))

(declare-fun b!248672 () Bool)

(assert (=> b!248672 (= e!172282 (byteRangesEq!0 (select (arr!6924 (buf!6424 thiss!1005)) (_4!143 lt!387615)) (select (arr!6924 (buf!6424 (_2!11563 lt!386663))) (_4!143 lt!387615)) #b00000000000000000000000000000000 lt!387613))))

(declare-fun b!248673 () Bool)

(declare-fun e!172286 () Bool)

(declare-fun e!172285 () Bool)

(assert (=> b!248673 (= e!172286 e!172285)))

(declare-fun res!208136 () Bool)

(assert (=> b!248673 (=> (not res!208136) (not e!172285))))

(declare-fun e!172283 () Bool)

(assert (=> b!248673 (= res!208136 e!172283)))

(declare-fun res!208134 () Bool)

(assert (=> b!248673 (=> res!208134 e!172283)))

(assert (=> b!248673 (= res!208134 (bvsge (_1!11570 lt!387615) (_2!11570 lt!387615)))))

(assert (=> b!248673 (= lt!387613 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387614 () (_ BitVec 32))

(assert (=> b!248673 (= lt!387614 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248673 (= lt!387615 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(declare-fun b!248674 () Bool)

(declare-fun res!208135 () Bool)

(assert (=> b!248674 (= res!208135 (= lt!387613 #b00000000000000000000000000000000))))

(assert (=> b!248674 (=> res!208135 e!172282)))

(declare-fun e!172284 () Bool)

(assert (=> b!248674 (= e!172284 e!172282)))

(declare-fun b!248675 () Bool)

(declare-fun e!172287 () Bool)

(assert (=> b!248675 (= e!172285 e!172287)))

(declare-fun c!11557 () Bool)

(assert (=> b!248675 (= c!11557 (= (_3!923 lt!387615) (_4!143 lt!387615)))))

(declare-fun b!248676 () Bool)

(declare-fun call!3949 () Bool)

(assert (=> b!248676 (= e!172287 call!3949)))

(declare-fun d!83426 () Bool)

(declare-fun res!208132 () Bool)

(assert (=> d!83426 (=> res!208132 e!172286)))

(assert (=> d!83426 (= res!208132 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(assert (=> d!83426 (= (arrayBitRangesEq!0 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!386663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))) e!172286)))

(declare-fun b!248677 () Bool)

(assert (=> b!248677 (= e!172283 (arrayRangesEq!920 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!386663)) (_1!11570 lt!387615) (_2!11570 lt!387615)))))

(declare-fun bm!3946 () Bool)

(assert (=> bm!3946 (= call!3949 (byteRangesEq!0 (select (arr!6924 (buf!6424 thiss!1005)) (_3!923 lt!387615)) (select (arr!6924 (buf!6424 (_2!11563 lt!386663))) (_3!923 lt!387615)) lt!387614 (ite c!11557 lt!387613 #b00000000000000000000000000001000)))))

(declare-fun b!248678 () Bool)

(assert (=> b!248678 (= e!172287 e!172284)))

(declare-fun res!208133 () Bool)

(assert (=> b!248678 (= res!208133 call!3949)))

(assert (=> b!248678 (=> (not res!208133) (not e!172284))))

(assert (= (and d!83426 (not res!208132)) b!248673))

(assert (= (and b!248673 (not res!208134)) b!248677))

(assert (= (and b!248673 res!208136) b!248675))

(assert (= (and b!248675 c!11557) b!248676))

(assert (= (and b!248675 (not c!11557)) b!248678))

(assert (= (and b!248678 res!208133) b!248674))

(assert (= (and b!248674 (not res!208135)) b!248672))

(assert (= (or b!248676 b!248678) bm!3946))

(declare-fun m!374923 () Bool)

(assert (=> b!248672 m!374923))

(declare-fun m!374925 () Bool)

(assert (=> b!248672 m!374925))

(assert (=> b!248672 m!374923))

(assert (=> b!248672 m!374925))

(declare-fun m!374927 () Bool)

(assert (=> b!248672 m!374927))

(assert (=> b!248673 m!373917))

(assert (=> b!248673 m!374819))

(declare-fun m!374929 () Bool)

(assert (=> b!248677 m!374929))

(declare-fun m!374931 () Bool)

(assert (=> bm!3946 m!374931))

(declare-fun m!374933 () Bool)

(assert (=> bm!3946 m!374933))

(assert (=> bm!3946 m!374931))

(assert (=> bm!3946 m!374933))

(declare-fun m!374935 () Bool)

(assert (=> bm!3946 m!374935))

(assert (=> b!248291 d!83426))

(assert (=> b!248291 d!83074))

(declare-fun b!248697 () Bool)

(declare-fun res!208147 () Bool)

(declare-fun e!172301 () Bool)

(assert (=> b!248697 (=> (not res!208147) (not e!172301))))

(declare-fun lt!387646 () tuple2!21290)

(assert (=> b!248697 (= res!208147 (and (= (buf!6424 (_1!11565 lt!386660)) (buf!6424 (_2!11567 lt!387646))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11567 lt!387646))))))

(declare-fun b!248698 () Bool)

(declare-fun e!172299 () tuple2!21290)

(declare-fun lt!387645 () tuple2!21290)

(assert (=> b!248698 (= e!172299 (tuple2!21291 false (_2!11567 lt!387645)))))

(declare-fun b!248699 () Bool)

(declare-fun e!172298 () tuple2!21290)

(assert (=> b!248699 (= e!172298 (tuple2!21291 true (_1!11565 lt!386660)))))

(declare-fun b!248700 () Bool)

(declare-fun e!172300 () Bool)

(declare-fun lt!387647 () (_ BitVec 64))

(assert (=> b!248700 (= e!172300 (= (bvsub lt!387647 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5937 (buf!6424 (_2!11567 lt!387646))) (currentByte!11840 (_2!11567 lt!387646)) (currentBit!11835 (_2!11567 lt!387646)))))))

(assert (=> b!248700 (or (= (bvand lt!387647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387647 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387640 () (_ BitVec 64))

(assert (=> b!248700 (= lt!387647 (bvadd lt!387640 nBits!297))))

(assert (=> b!248700 (or (not (= (bvand lt!387640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387640 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248700 (= lt!387640 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386660))) (currentByte!11840 (_1!11565 lt!386660)) (currentBit!11835 (_1!11565 lt!386660))))))

(declare-fun d!83428 () Bool)

(assert (=> d!83428 e!172301))

(declare-fun res!208150 () Bool)

(assert (=> d!83428 (=> (not res!208150) (not e!172301))))

(declare-fun lt!387644 () (_ BitVec 64))

(assert (=> d!83428 (= res!208150 (bvsge (bvsub lt!387644 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5937 (buf!6424 (_2!11567 lt!387646))) (currentByte!11840 (_2!11567 lt!387646)) (currentBit!11835 (_2!11567 lt!387646)))))))

(assert (=> d!83428 (or (= (bvand lt!387644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387644 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387648 () (_ BitVec 64))

(assert (=> d!83428 (= lt!387644 (bvadd lt!387648 nBits!297))))

(assert (=> d!83428 (or (not (= (bvand lt!387648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387648 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83428 (= lt!387648 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386660))) (currentByte!11840 (_1!11565 lt!386660)) (currentBit!11835 (_1!11565 lt!386660))))))

(assert (=> d!83428 (= lt!387646 e!172298)))

(declare-fun c!11562 () Bool)

(assert (=> d!83428 (= c!11562 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!83428 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83428 (= (checkBitsLoop!0 (_1!11565 lt!386660) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!387646)))

(declare-fun lt!387638 () tuple2!21290)

(declare-fun b!248701 () Bool)

(assert (=> b!248701 (= lt!387638 (checkBitsLoop!0 (_2!11567 lt!387645) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!387642 () Unit!17995)

(declare-fun lt!387639 () Unit!17995)

(assert (=> b!248701 (= lt!387642 lt!387639)))

(declare-fun lt!387643 () (_ BitVec 64))

(declare-fun lt!387641 () (_ BitVec 64))

(assert (=> b!248701 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11567 lt!387645)))) ((_ sign_extend 32) (currentByte!11840 (_2!11567 lt!387645))) ((_ sign_extend 32) (currentBit!11835 (_2!11567 lt!387645))) (bvsub lt!387643 lt!387641))))

(assert (=> b!248701 (= lt!387639 (validateOffsetBitsIneqLemma!0 (_1!11565 lt!386660) (_2!11567 lt!387645) lt!387643 lt!387641))))

(assert (=> b!248701 (= lt!387641 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248701 (= lt!387643 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248701 (= e!172299 (tuple2!21291 (_1!11567 lt!387638) (_2!11567 lt!387638)))))

(declare-fun b!248702 () Bool)

(assert (=> b!248702 (= e!172298 e!172299)))

(assert (=> b!248702 (= lt!387645 (readBit!0 (_1!11565 lt!386660)))))

(declare-fun c!11563 () Bool)

(assert (=> b!248702 (= c!11563 (not (= (_1!11567 lt!387645) bit!26)))))

(declare-fun b!248703 () Bool)

(declare-fun res!208149 () Bool)

(assert (=> b!248703 (=> (not res!208149) (not e!172301))))

(assert (=> b!248703 (= res!208149 e!172300)))

(declare-fun res!208151 () Bool)

(assert (=> b!248703 (=> res!208151 e!172300)))

(assert (=> b!248703 (= res!208151 (not (_1!11567 lt!387646)))))

(declare-fun b!248704 () Bool)

(declare-fun e!172302 () Bool)

(assert (=> b!248704 (= e!172302 (= bit!26 (_2!11564 (readBitPure!0 (_1!11565 lt!386660)))))))

(declare-fun b!248705 () Bool)

(assert (=> b!248705 (= e!172301 e!172302)))

(declare-fun res!208148 () Bool)

(assert (=> b!248705 (=> res!208148 e!172302)))

(assert (=> b!248705 (= res!208148 (or (not (_1!11567 lt!387646)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(assert (= (and d!83428 c!11562) b!248699))

(assert (= (and d!83428 (not c!11562)) b!248702))

(assert (= (and b!248702 c!11563) b!248698))

(assert (= (and b!248702 (not c!11563)) b!248701))

(assert (= (and d!83428 res!208150) b!248697))

(assert (= (and b!248697 res!208147) b!248703))

(assert (= (and b!248703 (not res!208151)) b!248700))

(assert (= (and b!248703 res!208149) b!248705))

(assert (= (and b!248705 (not res!208148)) b!248704))

(declare-fun m!374937 () Bool)

(assert (=> b!248700 m!374937))

(declare-fun m!374939 () Bool)

(assert (=> b!248700 m!374939))

(assert (=> d!83428 m!374937))

(assert (=> d!83428 m!374939))

(declare-fun m!374941 () Bool)

(assert (=> b!248702 m!374941))

(declare-fun m!374943 () Bool)

(assert (=> b!248701 m!374943))

(declare-fun m!374945 () Bool)

(assert (=> b!248701 m!374945))

(declare-fun m!374947 () Bool)

(assert (=> b!248701 m!374947))

(declare-fun m!374949 () Bool)

(assert (=> b!248704 m!374949))

(assert (=> d!83036 d!83428))

(declare-fun d!83430 () Bool)

(declare-fun e!172303 () Bool)

(assert (=> d!83430 e!172303))

(declare-fun res!208152 () Bool)

(assert (=> d!83430 (=> (not res!208152) (not e!172303))))

(assert (=> d!83430 (= res!208152 (= (buf!6424 (_2!11563 (increaseBitIndex!0 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))) (buf!6424 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))))

(declare-fun lt!387655 () Bool)

(assert (=> d!83430 (= lt!387655 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))) (currentByte!11840 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387654 () tuple2!21290)

(assert (=> d!83430 (= lt!387654 (tuple2!21291 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))) (currentByte!11840 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11563 (increaseBitIndex!0 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))))

(assert (=> d!83430 (validate_offset_bit!0 ((_ sign_extend 32) (size!5937 (buf!6424 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))) ((_ sign_extend 32) (currentByte!11840 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))) ((_ sign_extend 32) (currentBit!11835 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))))

(assert (=> d!83430 (= (readBit!0 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))) lt!387654)))

(declare-fun lt!387649 () (_ BitVec 64))

(declare-fun b!248706 () Bool)

(declare-fun lt!387650 () (_ BitVec 64))

(assert (=> b!248706 (= e!172303 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 (increaseBitIndex!0 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))) (currentByte!11840 (_2!11563 (increaseBitIndex!0 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))) (currentBit!11835 (_2!11563 (increaseBitIndex!0 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))) (bvadd lt!387650 lt!387649)))))

(assert (=> b!248706 (or (not (= (bvand lt!387650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387649 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387650 lt!387649) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248706 (= lt!387649 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248706 (= lt!387650 (bitIndex!0 (size!5937 (buf!6424 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))) (currentByte!11840 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))) (currentBit!11835 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))))

(declare-fun lt!387653 () Bool)

(assert (=> b!248706 (= lt!387653 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))) (currentByte!11840 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387652 () Bool)

(assert (=> b!248706 (= lt!387652 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))) (currentByte!11840 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387651 () Bool)

(assert (=> b!248706 (= lt!387651 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))) (currentByte!11840 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!83430 res!208152) b!248706))

(declare-fun m!374951 () Bool)

(assert (=> d!83430 m!374951))

(declare-fun m!374953 () Bool)

(assert (=> d!83430 m!374953))

(declare-fun m!374955 () Bool)

(assert (=> d!83430 m!374955))

(declare-fun m!374957 () Bool)

(assert (=> d!83430 m!374957))

(declare-fun m!374959 () Bool)

(assert (=> b!248706 m!374959))

(assert (=> b!248706 m!374951))

(assert (=> b!248706 m!374955))

(assert (=> b!248706 m!374953))

(declare-fun m!374961 () Bool)

(assert (=> b!248706 m!374961))

(assert (=> d!83094 d!83430))

(declare-fun b!248707 () Bool)

(declare-fun res!208153 () Bool)

(declare-fun e!172307 () Bool)

(assert (=> b!248707 (=> (not res!208153) (not e!172307))))

(declare-fun lt!387664 () tuple2!21290)

(assert (=> b!248707 (= res!208153 (and (= (buf!6424 (_1!11565 lt!386652)) (buf!6424 (_2!11567 lt!387664))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11567 lt!387664))))))

(declare-fun b!248708 () Bool)

(declare-fun e!172305 () tuple2!21290)

(declare-fun lt!387663 () tuple2!21290)

(assert (=> b!248708 (= e!172305 (tuple2!21291 false (_2!11567 lt!387663)))))

(declare-fun b!248709 () Bool)

(declare-fun e!172304 () tuple2!21290)

(assert (=> b!248709 (= e!172304 (tuple2!21291 true (_1!11565 lt!386652)))))

(declare-fun e!172306 () Bool)

(declare-fun lt!387665 () (_ BitVec 64))

(declare-fun b!248710 () Bool)

(assert (=> b!248710 (= e!172306 (= (bvsub lt!387665 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5937 (buf!6424 (_2!11567 lt!387664))) (currentByte!11840 (_2!11567 lt!387664)) (currentBit!11835 (_2!11567 lt!387664)))))))

(assert (=> b!248710 (or (= (bvand lt!387665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387665 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387658 () (_ BitVec 64))

(assert (=> b!248710 (= lt!387665 (bvadd lt!387658 nBits!297))))

(assert (=> b!248710 (or (not (= (bvand lt!387658 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387658 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387658 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248710 (= lt!387658 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386652))) (currentByte!11840 (_1!11565 lt!386652)) (currentBit!11835 (_1!11565 lt!386652))))))

(declare-fun d!83432 () Bool)

(assert (=> d!83432 e!172307))

(declare-fun res!208156 () Bool)

(assert (=> d!83432 (=> (not res!208156) (not e!172307))))

(declare-fun lt!387662 () (_ BitVec 64))

(assert (=> d!83432 (= res!208156 (bvsge (bvsub lt!387662 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5937 (buf!6424 (_2!11567 lt!387664))) (currentByte!11840 (_2!11567 lt!387664)) (currentBit!11835 (_2!11567 lt!387664)))))))

(assert (=> d!83432 (or (= (bvand lt!387662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387662 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387666 () (_ BitVec 64))

(assert (=> d!83432 (= lt!387662 (bvadd lt!387666 nBits!297))))

(assert (=> d!83432 (or (not (= (bvand lt!387666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387666 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83432 (= lt!387666 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386652))) (currentByte!11840 (_1!11565 lt!386652)) (currentBit!11835 (_1!11565 lt!386652))))))

(assert (=> d!83432 (= lt!387664 e!172304)))

(declare-fun c!11564 () Bool)

(assert (=> d!83432 (= c!11564 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!83432 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83432 (= (checkBitsLoop!0 (_1!11565 lt!386652) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!387664)))

(declare-fun lt!387656 () tuple2!21290)

(declare-fun b!248711 () Bool)

(assert (=> b!248711 (= lt!387656 (checkBitsLoop!0 (_2!11567 lt!387663) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!387660 () Unit!17995)

(declare-fun lt!387657 () Unit!17995)

(assert (=> b!248711 (= lt!387660 lt!387657)))

(declare-fun lt!387661 () (_ BitVec 64))

(declare-fun lt!387659 () (_ BitVec 64))

(assert (=> b!248711 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11567 lt!387663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11567 lt!387663))) ((_ sign_extend 32) (currentBit!11835 (_2!11567 lt!387663))) (bvsub lt!387661 lt!387659))))

(assert (=> b!248711 (= lt!387657 (validateOffsetBitsIneqLemma!0 (_1!11565 lt!386652) (_2!11567 lt!387663) lt!387661 lt!387659))))

(assert (=> b!248711 (= lt!387659 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248711 (= lt!387661 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248711 (= e!172305 (tuple2!21291 (_1!11567 lt!387656) (_2!11567 lt!387656)))))

(declare-fun b!248712 () Bool)

(assert (=> b!248712 (= e!172304 e!172305)))

(assert (=> b!248712 (= lt!387663 (readBit!0 (_1!11565 lt!386652)))))

(declare-fun c!11565 () Bool)

(assert (=> b!248712 (= c!11565 (not (= (_1!11567 lt!387663) bit!26)))))

(declare-fun b!248713 () Bool)

(declare-fun res!208155 () Bool)

(assert (=> b!248713 (=> (not res!208155) (not e!172307))))

(assert (=> b!248713 (= res!208155 e!172306)))

(declare-fun res!208157 () Bool)

(assert (=> b!248713 (=> res!208157 e!172306)))

(assert (=> b!248713 (= res!208157 (not (_1!11567 lt!387664)))))

(declare-fun b!248714 () Bool)

(declare-fun e!172308 () Bool)

(assert (=> b!248714 (= e!172308 (= bit!26 (_2!11564 (readBitPure!0 (_1!11565 lt!386652)))))))

(declare-fun b!248715 () Bool)

(assert (=> b!248715 (= e!172307 e!172308)))

(declare-fun res!208154 () Bool)

(assert (=> b!248715 (=> res!208154 e!172308)))

(assert (=> b!248715 (= res!208154 (or (not (_1!11567 lt!387664)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(assert (= (and d!83432 c!11564) b!248709))

(assert (= (and d!83432 (not c!11564)) b!248712))

(assert (= (and b!248712 c!11565) b!248708))

(assert (= (and b!248712 (not c!11565)) b!248711))

(assert (= (and d!83432 res!208156) b!248707))

(assert (= (and b!248707 res!208153) b!248713))

(assert (= (and b!248713 (not res!208157)) b!248710))

(assert (= (and b!248713 res!208155) b!248715))

(assert (= (and b!248715 (not res!208154)) b!248714))

(declare-fun m!374963 () Bool)

(assert (=> b!248710 m!374963))

(declare-fun m!374965 () Bool)

(assert (=> b!248710 m!374965))

(assert (=> d!83432 m!374963))

(assert (=> d!83432 m!374965))

(declare-fun m!374967 () Bool)

(assert (=> b!248712 m!374967))

(declare-fun m!374969 () Bool)

(assert (=> b!248711 m!374969))

(declare-fun m!374971 () Bool)

(assert (=> b!248711 m!374971))

(declare-fun m!374973 () Bool)

(assert (=> b!248711 m!374973))

(declare-fun m!374975 () Bool)

(assert (=> b!248714 m!374975))

(assert (=> d!83102 d!83432))

(declare-fun d!83434 () Bool)

(declare-fun e!172309 () Bool)

(assert (=> d!83434 e!172309))

(declare-fun res!208158 () Bool)

(assert (=> d!83434 (=> (not res!208158) (not e!172309))))

(assert (=> d!83434 (= res!208158 (= (buf!6424 (_2!11563 (increaseBitIndex!0 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))) (buf!6424 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))))

(declare-fun lt!387673 () Bool)

(assert (=> d!83434 (= lt!387673 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))) (currentByte!11840 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387672 () tuple2!21290)

(assert (=> d!83434 (= lt!387672 (tuple2!21291 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))) (currentByte!11840 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11563 (increaseBitIndex!0 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))))))

(assert (=> d!83434 (validate_offset_bit!0 ((_ sign_extend 32) (size!5937 (buf!6424 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))) ((_ sign_extend 32) (currentByte!11840 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))) ((_ sign_extend 32) (currentBit!11835 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))))

(assert (=> d!83434 (= (readBit!0 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))) lt!387672)))

(declare-fun b!248716 () Bool)

(declare-fun lt!387667 () (_ BitVec 64))

(declare-fun lt!387668 () (_ BitVec 64))

(assert (=> b!248716 (= e!172309 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 (increaseBitIndex!0 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))) (currentByte!11840 (_2!11563 (increaseBitIndex!0 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))) (currentBit!11835 (_2!11563 (increaseBitIndex!0 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))) (bvadd lt!387668 lt!387667)))))

(assert (=> b!248716 (or (not (= (bvand lt!387668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387667 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387668 lt!387667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248716 (= lt!387667 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248716 (= lt!387668 (bitIndex!0 (size!5937 (buf!6424 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))) (currentByte!11840 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))) (currentBit!11835 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))))

(declare-fun lt!387671 () Bool)

(assert (=> b!248716 (= lt!387671 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))) (currentByte!11840 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387670 () Bool)

(assert (=> b!248716 (= lt!387670 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))) (currentByte!11840 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387669 () Bool)

(assert (=> b!248716 (= lt!387669 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))) (currentByte!11840 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 (readerFrom!0 (_2!11563 lt!386670) (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!83434 res!208158) b!248716))

(assert (=> d!83434 m!373963))

(declare-fun m!374977 () Bool)

(assert (=> d!83434 m!374977))

(declare-fun m!374979 () Bool)

(assert (=> d!83434 m!374979))

(declare-fun m!374981 () Bool)

(assert (=> d!83434 m!374981))

(declare-fun m!374983 () Bool)

(assert (=> d!83434 m!374983))

(declare-fun m!374985 () Bool)

(assert (=> b!248716 m!374985))

(assert (=> b!248716 m!373963))

(assert (=> b!248716 m!374977))

(assert (=> b!248716 m!374981))

(assert (=> b!248716 m!374979))

(declare-fun m!374987 () Bool)

(assert (=> b!248716 m!374987))

(assert (=> d!83062 d!83434))

(declare-fun d!83436 () Bool)

(assert (=> d!83436 (isPrefixOf!0 (_2!11563 lt!386663) (_2!11563 lt!386663))))

(declare-fun lt!387676 () Unit!17995)

(declare-fun choose!11 (BitStream!10796) Unit!17995)

(assert (=> d!83436 (= lt!387676 (choose!11 (_2!11563 lt!386663)))))

(assert (=> d!83436 (= (lemmaIsPrefixRefl!0 (_2!11563 lt!386663)) lt!387676)))

(declare-fun bs!21125 () Bool)

(assert (= bs!21125 d!83436))

(assert (=> bs!21125 m!374169))

(declare-fun m!374989 () Bool)

(assert (=> bs!21125 m!374989))

(assert (=> d!83092 d!83436))

(declare-fun d!83438 () Bool)

(declare-fun res!208159 () Bool)

(declare-fun e!172311 () Bool)

(assert (=> d!83438 (=> (not res!208159) (not e!172311))))

(assert (=> d!83438 (= res!208159 (= (size!5937 (buf!6424 (_2!11563 lt!386663))) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(assert (=> d!83438 (= (isPrefixOf!0 (_2!11563 lt!386663) (_2!11563 lt!386663)) e!172311)))

(declare-fun b!248717 () Bool)

(declare-fun res!208161 () Bool)

(assert (=> b!248717 (=> (not res!208161) (not e!172311))))

(assert (=> b!248717 (= res!208161 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663))) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663)))))))

(declare-fun b!248718 () Bool)

(declare-fun e!172310 () Bool)

(assert (=> b!248718 (= e!172311 e!172310)))

(declare-fun res!208160 () Bool)

(assert (=> b!248718 (=> res!208160 e!172310)))

(assert (=> b!248718 (= res!208160 (= (size!5937 (buf!6424 (_2!11563 lt!386663))) #b00000000000000000000000000000000))))

(declare-fun b!248719 () Bool)

(assert (=> b!248719 (= e!172310 (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386663)) (buf!6424 (_2!11563 lt!386663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663)))))))

(assert (= (and d!83438 res!208159) b!248717))

(assert (= (and b!248717 res!208161) b!248718))

(assert (= (and b!248718 (not res!208160)) b!248719))

(assert (=> b!248717 m!373919))

(assert (=> b!248717 m!373919))

(assert (=> b!248719 m!373919))

(assert (=> b!248719 m!373919))

(declare-fun m!374991 () Bool)

(assert (=> b!248719 m!374991))

(assert (=> d!83092 d!83438))

(declare-fun d!83440 () Bool)

(declare-fun res!208162 () Bool)

(declare-fun e!172313 () Bool)

(assert (=> d!83440 (=> (not res!208162) (not e!172313))))

(assert (=> d!83440 (= res!208162 (= (size!5937 (buf!6424 thiss!1005)) (size!5937 (buf!6424 thiss!1005))))))

(assert (=> d!83440 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!172313)))

(declare-fun b!248720 () Bool)

(declare-fun res!208164 () Bool)

(assert (=> b!248720 (=> (not res!208164) (not e!172313))))

(assert (=> b!248720 (= res!208164 (bvsle (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)) (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(declare-fun b!248721 () Bool)

(declare-fun e!172312 () Bool)

(assert (=> b!248721 (= e!172313 e!172312)))

(declare-fun res!208163 () Bool)

(assert (=> b!248721 (=> res!208163 e!172312)))

(assert (=> b!248721 (= res!208163 (= (size!5937 (buf!6424 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248722 () Bool)

(assert (=> b!248722 (= e!172312 (arrayBitRangesEq!0 (buf!6424 thiss!1005) (buf!6424 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(assert (= (and d!83440 res!208162) b!248720))

(assert (= (and b!248720 res!208164) b!248721))

(assert (= (and b!248721 (not res!208163)) b!248722))

(assert (=> b!248720 m!373917))

(assert (=> b!248720 m!373917))

(assert (=> b!248722 m!373917))

(assert (=> b!248722 m!373917))

(declare-fun m!374993 () Bool)

(assert (=> b!248722 m!374993))

(assert (=> d!83092 d!83440))

(declare-fun d!83442 () Bool)

(declare-fun res!208165 () Bool)

(declare-fun e!172315 () Bool)

(assert (=> d!83442 (=> (not res!208165) (not e!172315))))

(assert (=> d!83442 (= res!208165 (= (size!5937 (buf!6424 lt!387034)) (size!5937 (buf!6424 lt!387034))))))

(assert (=> d!83442 (= (isPrefixOf!0 lt!387034 lt!387034) e!172315)))

(declare-fun b!248723 () Bool)

(declare-fun res!208167 () Bool)

(assert (=> b!248723 (=> (not res!208167) (not e!172315))))

(assert (=> b!248723 (= res!208167 (bvsle (bitIndex!0 (size!5937 (buf!6424 lt!387034)) (currentByte!11840 lt!387034) (currentBit!11835 lt!387034)) (bitIndex!0 (size!5937 (buf!6424 lt!387034)) (currentByte!11840 lt!387034) (currentBit!11835 lt!387034))))))

(declare-fun b!248724 () Bool)

(declare-fun e!172314 () Bool)

(assert (=> b!248724 (= e!172315 e!172314)))

(declare-fun res!208166 () Bool)

(assert (=> b!248724 (=> res!208166 e!172314)))

(assert (=> b!248724 (= res!208166 (= (size!5937 (buf!6424 lt!387034)) #b00000000000000000000000000000000))))

(declare-fun b!248725 () Bool)

(assert (=> b!248725 (= e!172314 (arrayBitRangesEq!0 (buf!6424 lt!387034) (buf!6424 lt!387034) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 lt!387034)) (currentByte!11840 lt!387034) (currentBit!11835 lt!387034))))))

(assert (= (and d!83442 res!208165) b!248723))

(assert (= (and b!248723 res!208167) b!248724))

(assert (= (and b!248724 (not res!208166)) b!248725))

(declare-fun m!374995 () Bool)

(assert (=> b!248723 m!374995))

(assert (=> b!248723 m!374995))

(assert (=> b!248725 m!374995))

(assert (=> b!248725 m!374995))

(declare-fun m!374997 () Bool)

(assert (=> b!248725 m!374997))

(assert (=> d!83092 d!83442))

(declare-fun d!83444 () Bool)

(assert (=> d!83444 (isPrefixOf!0 lt!387034 (_2!11563 lt!386663))))

(declare-fun lt!387677 () Unit!17995)

(assert (=> d!83444 (= lt!387677 (choose!30 lt!387034 thiss!1005 (_2!11563 lt!386663)))))

(assert (=> d!83444 (isPrefixOf!0 lt!387034 thiss!1005)))

(assert (=> d!83444 (= (lemmaIsPrefixTransitive!0 lt!387034 thiss!1005 (_2!11563 lt!386663)) lt!387677)))

(declare-fun bs!21126 () Bool)

(assert (= bs!21126 d!83444))

(assert (=> bs!21126 m!374257))

(declare-fun m!374999 () Bool)

(assert (=> bs!21126 m!374999))

(declare-fun m!375001 () Bool)

(assert (=> bs!21126 m!375001))

(assert (=> d!83092 d!83444))

(declare-fun d!83446 () Bool)

(assert (=> d!83446 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!387678 () Unit!17995)

(assert (=> d!83446 (= lt!387678 (choose!11 thiss!1005))))

(assert (=> d!83446 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!387678)))

(declare-fun bs!21127 () Bool)

(assert (= bs!21127 d!83446))

(assert (=> bs!21127 m!374259))

(declare-fun m!375003 () Bool)

(assert (=> bs!21127 m!375003))

(assert (=> d!83092 d!83446))

(declare-fun d!83448 () Bool)

(declare-fun res!208168 () Bool)

(declare-fun e!172317 () Bool)

(assert (=> d!83448 (=> (not res!208168) (not e!172317))))

(assert (=> d!83448 (= res!208168 (= (size!5937 (buf!6424 lt!387034)) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(assert (=> d!83448 (= (isPrefixOf!0 lt!387034 (_2!11563 lt!386663)) e!172317)))

(declare-fun b!248726 () Bool)

(declare-fun res!208170 () Bool)

(assert (=> b!248726 (=> (not res!208170) (not e!172317))))

(assert (=> b!248726 (= res!208170 (bvsle (bitIndex!0 (size!5937 (buf!6424 lt!387034)) (currentByte!11840 lt!387034) (currentBit!11835 lt!387034)) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663)))))))

(declare-fun b!248727 () Bool)

(declare-fun e!172316 () Bool)

(assert (=> b!248727 (= e!172317 e!172316)))

(declare-fun res!208169 () Bool)

(assert (=> b!248727 (=> res!208169 e!172316)))

(assert (=> b!248727 (= res!208169 (= (size!5937 (buf!6424 lt!387034)) #b00000000000000000000000000000000))))

(declare-fun b!248728 () Bool)

(assert (=> b!248728 (= e!172316 (arrayBitRangesEq!0 (buf!6424 lt!387034) (buf!6424 (_2!11563 lt!386663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 lt!387034)) (currentByte!11840 lt!387034) (currentBit!11835 lt!387034))))))

(assert (= (and d!83448 res!208168) b!248726))

(assert (= (and b!248726 res!208170) b!248727))

(assert (= (and b!248727 (not res!208169)) b!248728))

(assert (=> b!248726 m!374995))

(assert (=> b!248726 m!373919))

(assert (=> b!248728 m!374995))

(assert (=> b!248728 m!374995))

(declare-fun m!375005 () Bool)

(assert (=> b!248728 m!375005))

(assert (=> d!83092 d!83448))

(declare-fun d!83450 () Bool)

(assert (=> d!83450 (isPrefixOf!0 lt!387034 lt!387034)))

(declare-fun lt!387679 () Unit!17995)

(assert (=> d!83450 (= lt!387679 (choose!11 lt!387034))))

(assert (=> d!83450 (= (lemmaIsPrefixRefl!0 lt!387034) lt!387679)))

(declare-fun bs!21128 () Bool)

(assert (= bs!21128 d!83450))

(assert (=> bs!21128 m!374263))

(declare-fun m!375007 () Bool)

(assert (=> bs!21128 m!375007))

(assert (=> d!83092 d!83450))

(declare-fun d!83452 () Bool)

(assert (=> d!83452 (isPrefixOf!0 lt!387034 (_2!11563 lt!386663))))

(declare-fun lt!387680 () Unit!17995)

(assert (=> d!83452 (= lt!387680 (choose!30 lt!387034 (_2!11563 lt!386663) (_2!11563 lt!386663)))))

(assert (=> d!83452 (isPrefixOf!0 lt!387034 (_2!11563 lt!386663))))

(assert (=> d!83452 (= (lemmaIsPrefixTransitive!0 lt!387034 (_2!11563 lt!386663) (_2!11563 lt!386663)) lt!387680)))

(declare-fun bs!21129 () Bool)

(assert (= bs!21129 d!83452))

(assert (=> bs!21129 m!374257))

(declare-fun m!375009 () Bool)

(assert (=> bs!21129 m!375009))

(assert (=> bs!21129 m!374257))

(assert (=> d!83092 d!83452))

(declare-fun d!83454 () Bool)

(declare-fun res!208171 () Bool)

(declare-fun e!172319 () Bool)

(assert (=> d!83454 (=> (not res!208171) (not e!172319))))

(assert (=> d!83454 (= res!208171 (= (size!5937 (buf!6424 (_1!11565 lt!387031))) (size!5937 (buf!6424 (_2!11565 lt!387031)))))))

(assert (=> d!83454 (= (isPrefixOf!0 (_1!11565 lt!387031) (_2!11565 lt!387031)) e!172319)))

(declare-fun b!248729 () Bool)

(declare-fun res!208173 () Bool)

(assert (=> b!248729 (=> (not res!208173) (not e!172319))))

(assert (=> b!248729 (= res!208173 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!387031))) (currentByte!11840 (_1!11565 lt!387031)) (currentBit!11835 (_1!11565 lt!387031))) (bitIndex!0 (size!5937 (buf!6424 (_2!11565 lt!387031))) (currentByte!11840 (_2!11565 lt!387031)) (currentBit!11835 (_2!11565 lt!387031)))))))

(declare-fun b!248730 () Bool)

(declare-fun e!172318 () Bool)

(assert (=> b!248730 (= e!172319 e!172318)))

(declare-fun res!208172 () Bool)

(assert (=> b!248730 (=> res!208172 e!172318)))

(assert (=> b!248730 (= res!208172 (= (size!5937 (buf!6424 (_1!11565 lt!387031))) #b00000000000000000000000000000000))))

(declare-fun b!248731 () Bool)

(assert (=> b!248731 (= e!172318 (arrayBitRangesEq!0 (buf!6424 (_1!11565 lt!387031)) (buf!6424 (_2!11565 lt!387031)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!387031))) (currentByte!11840 (_1!11565 lt!387031)) (currentBit!11835 (_1!11565 lt!387031)))))))

(assert (= (and d!83454 res!208171) b!248729))

(assert (= (and b!248729 res!208173) b!248730))

(assert (= (and b!248730 (not res!208172)) b!248731))

(assert (=> b!248729 m!374881))

(assert (=> b!248729 m!374865))

(assert (=> b!248731 m!374881))

(assert (=> b!248731 m!374881))

(declare-fun m!375011 () Bool)

(assert (=> b!248731 m!375011))

(assert (=> d!83092 d!83454))

(assert (=> d!83092 d!83116))

(assert (=> d!83040 d!83038))

(declare-fun d!83456 () Bool)

(assert (=> d!83456 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386656)))

(assert (=> d!83456 true))

(declare-fun _$6!407 () Unit!17995)

(assert (=> d!83456 (= (choose!9 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!386663)) lt!386656 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))) _$6!407)))

(declare-fun bs!21130 () Bool)

(assert (= bs!21130 d!83456))

(assert (=> bs!21130 m!373907))

(assert (=> d!83040 d!83456))

(declare-fun d!83458 () Bool)

(declare-fun e!172320 () Bool)

(assert (=> d!83458 e!172320))

(declare-fun res!208175 () Bool)

(assert (=> d!83458 (=> (not res!208175) (not e!172320))))

(declare-fun lt!387686 () (_ BitVec 64))

(declare-fun lt!387682 () (_ BitVec 64))

(declare-fun lt!387681 () (_ BitVec 64))

(assert (=> d!83458 (= res!208175 (= lt!387686 (bvsub lt!387681 lt!387682)))))

(assert (=> d!83458 (or (= (bvand lt!387681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387682 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387681 lt!387682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83458 (= lt!387682 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387029)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!387029))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!387029)))))))

(declare-fun lt!387684 () (_ BitVec 64))

(declare-fun lt!387685 () (_ BitVec 64))

(assert (=> d!83458 (= lt!387681 (bvmul lt!387684 lt!387685))))

(assert (=> d!83458 (or (= lt!387684 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387685 (bvsdiv (bvmul lt!387684 lt!387685) lt!387684)))))

(assert (=> d!83458 (= lt!387685 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83458 (= lt!387684 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387029)))))))

(assert (=> d!83458 (= lt!387686 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!387029))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!387029)))))))

(assert (=> d!83458 (invariant!0 (currentBit!11835 (_2!11563 lt!387029)) (currentByte!11840 (_2!11563 lt!387029)) (size!5937 (buf!6424 (_2!11563 lt!387029))))))

(assert (=> d!83458 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!387029))) (currentByte!11840 (_2!11563 lt!387029)) (currentBit!11835 (_2!11563 lt!387029))) lt!387686)))

(declare-fun b!248732 () Bool)

(declare-fun res!208174 () Bool)

(assert (=> b!248732 (=> (not res!208174) (not e!172320))))

(assert (=> b!248732 (= res!208174 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387686))))

(declare-fun b!248733 () Bool)

(declare-fun lt!387683 () (_ BitVec 64))

(assert (=> b!248733 (= e!172320 (bvsle lt!387686 (bvmul lt!387683 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248733 (or (= lt!387683 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387683 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387683)))))

(assert (=> b!248733 (= lt!387683 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387029)))))))

(assert (= (and d!83458 res!208175) b!248732))

(assert (= (and b!248732 res!208174) b!248733))

(declare-fun m!375013 () Bool)

(assert (=> d!83458 m!375013))

(assert (=> d!83458 m!374873))

(assert (=> b!248274 d!83458))

(assert (=> b!248274 d!83074))

(declare-fun d!83460 () Bool)

(declare-fun e!172321 () Bool)

(assert (=> d!83460 e!172321))

(declare-fun res!208176 () Bool)

(assert (=> d!83460 (=> (not res!208176) (not e!172321))))

(declare-fun lt!387688 () (_ BitVec 64))

(declare-fun lt!387687 () BitStream!10796)

(assert (=> d!83460 (= res!208176 (= (bvadd lt!387688 (bvsub lt!386938 lt!386927)) (bitIndex!0 (size!5937 (buf!6424 lt!387687)) (currentByte!11840 lt!387687) (currentBit!11835 lt!387687))))))

(assert (=> d!83460 (or (not (= (bvand lt!387688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386938 lt!386927) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387688 (bvsub lt!386938 lt!386927)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83460 (= lt!387688 (bitIndex!0 (size!5937 (buf!6424 (_2!11565 lt!386922))) (currentByte!11840 (_2!11565 lt!386922)) (currentBit!11835 (_2!11565 lt!386922))))))

(assert (=> d!83460 (= lt!387687 (_2!11563 (moveBitIndex!0 (_2!11565 lt!386922) (bvsub lt!386938 lt!386927))))))

(assert (=> d!83460 (moveBitIndexPrecond!0 (_2!11565 lt!386922) (bvsub lt!386938 lt!386927))))

(assert (=> d!83460 (= (withMovedBitIndex!0 (_2!11565 lt!386922) (bvsub lt!386938 lt!386927)) lt!387687)))

(declare-fun b!248734 () Bool)

(assert (=> b!248734 (= e!172321 (= (size!5937 (buf!6424 (_2!11565 lt!386922))) (size!5937 (buf!6424 lt!387687))))))

(assert (= (and d!83460 res!208176) b!248734))

(declare-fun m!375015 () Bool)

(assert (=> d!83460 m!375015))

(declare-fun m!375017 () Bool)

(assert (=> d!83460 m!375017))

(declare-fun m!375019 () Bool)

(assert (=> d!83460 m!375019))

(declare-fun m!375021 () Bool)

(assert (=> d!83460 m!375021))

(assert (=> b!248219 d!83460))

(assert (=> b!248219 d!83118))

(assert (=> b!248219 d!83072))

(assert (=> d!83096 d!83424))

(declare-fun b!248735 () Bool)

(declare-fun res!208177 () Bool)

(declare-fun e!172325 () Bool)

(assert (=> b!248735 (=> (not res!208177) (not e!172325))))

(declare-fun lt!387697 () tuple2!21290)

(assert (=> b!248735 (= res!208177 (and (= (buf!6424 (_1!11565 lt!386658)) (buf!6424 (_2!11567 lt!387697))) (or (not (= nBits!297 from!289)) (_1!11567 lt!387697))))))

(declare-fun b!248736 () Bool)

(declare-fun e!172323 () tuple2!21290)

(declare-fun lt!387696 () tuple2!21290)

(assert (=> b!248736 (= e!172323 (tuple2!21291 false (_2!11567 lt!387696)))))

(declare-fun b!248737 () Bool)

(declare-fun e!172322 () tuple2!21290)

(assert (=> b!248737 (= e!172322 (tuple2!21291 true (_1!11565 lt!386658)))))

(declare-fun e!172324 () Bool)

(declare-fun b!248738 () Bool)

(declare-fun lt!387698 () (_ BitVec 64))

(assert (=> b!248738 (= e!172324 (= (bvsub lt!387698 from!289) (bitIndex!0 (size!5937 (buf!6424 (_2!11567 lt!387697))) (currentByte!11840 (_2!11567 lt!387697)) (currentBit!11835 (_2!11567 lt!387697)))))))

(assert (=> b!248738 (or (= (bvand lt!387698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387698 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387691 () (_ BitVec 64))

(assert (=> b!248738 (= lt!387698 (bvadd lt!387691 nBits!297))))

(assert (=> b!248738 (or (not (= (bvand lt!387691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387691 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248738 (= lt!387691 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)) (currentBit!11835 (_1!11565 lt!386658))))))

(declare-fun d!83462 () Bool)

(assert (=> d!83462 e!172325))

(declare-fun res!208180 () Bool)

(assert (=> d!83462 (=> (not res!208180) (not e!172325))))

(declare-fun lt!387695 () (_ BitVec 64))

(assert (=> d!83462 (= res!208180 (bvsge (bvsub lt!387695 from!289) (bitIndex!0 (size!5937 (buf!6424 (_2!11567 lt!387697))) (currentByte!11840 (_2!11567 lt!387697)) (currentBit!11835 (_2!11567 lt!387697)))))))

(assert (=> d!83462 (or (= (bvand lt!387695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387695 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387699 () (_ BitVec 64))

(assert (=> d!83462 (= lt!387695 (bvadd lt!387699 nBits!297))))

(assert (=> d!83462 (or (not (= (bvand lt!387699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387699 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83462 (= lt!387699 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386658))) (currentByte!11840 (_1!11565 lt!386658)) (currentBit!11835 (_1!11565 lt!386658))))))

(assert (=> d!83462 (= lt!387697 e!172322)))

(declare-fun c!11566 () Bool)

(assert (=> d!83462 (= c!11566 (= from!289 nBits!297))))

(assert (=> d!83462 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83462 (= (checkBitsLoop!0 (_1!11565 lt!386658) nBits!297 bit!26 from!289) lt!387697)))

(declare-fun b!248739 () Bool)

(declare-fun lt!387689 () tuple2!21290)

(assert (=> b!248739 (= lt!387689 (checkBitsLoop!0 (_2!11567 lt!387696) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!387693 () Unit!17995)

(declare-fun lt!387690 () Unit!17995)

(assert (=> b!248739 (= lt!387693 lt!387690)))

(declare-fun lt!387694 () (_ BitVec 64))

(declare-fun lt!387692 () (_ BitVec 64))

(assert (=> b!248739 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11567 lt!387696)))) ((_ sign_extend 32) (currentByte!11840 (_2!11567 lt!387696))) ((_ sign_extend 32) (currentBit!11835 (_2!11567 lt!387696))) (bvsub lt!387694 lt!387692))))

(assert (=> b!248739 (= lt!387690 (validateOffsetBitsIneqLemma!0 (_1!11565 lt!386658) (_2!11567 lt!387696) lt!387694 lt!387692))))

(assert (=> b!248739 (= lt!387692 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248739 (= lt!387694 (bvsub nBits!297 from!289))))

(assert (=> b!248739 (= e!172323 (tuple2!21291 (_1!11567 lt!387689) (_2!11567 lt!387689)))))

(declare-fun b!248740 () Bool)

(assert (=> b!248740 (= e!172322 e!172323)))

(assert (=> b!248740 (= lt!387696 (readBit!0 (_1!11565 lt!386658)))))

(declare-fun c!11567 () Bool)

(assert (=> b!248740 (= c!11567 (not (= (_1!11567 lt!387696) bit!26)))))

(declare-fun b!248741 () Bool)

(declare-fun res!208179 () Bool)

(assert (=> b!248741 (=> (not res!208179) (not e!172325))))

(assert (=> b!248741 (= res!208179 e!172324)))

(declare-fun res!208181 () Bool)

(assert (=> b!248741 (=> res!208181 e!172324)))

(assert (=> b!248741 (= res!208181 (not (_1!11567 lt!387697)))))

(declare-fun b!248742 () Bool)

(declare-fun e!172326 () Bool)

(assert (=> b!248742 (= e!172326 (= bit!26 (_2!11564 (readBitPure!0 (_1!11565 lt!386658)))))))

(declare-fun b!248743 () Bool)

(assert (=> b!248743 (= e!172325 e!172326)))

(declare-fun res!208178 () Bool)

(assert (=> b!248743 (=> res!208178 e!172326)))

(assert (=> b!248743 (= res!208178 (or (not (_1!11567 lt!387697)) (bvsge from!289 nBits!297)))))

(assert (= (and d!83462 c!11566) b!248737))

(assert (= (and d!83462 (not c!11566)) b!248740))

(assert (= (and b!248740 c!11567) b!248736))

(assert (= (and b!248740 (not c!11567)) b!248739))

(assert (= (and d!83462 res!208180) b!248735))

(assert (= (and b!248735 res!208177) b!248741))

(assert (= (and b!248741 (not res!208181)) b!248738))

(assert (= (and b!248741 res!208179) b!248743))

(assert (= (and b!248743 (not res!208178)) b!248742))

(declare-fun m!375023 () Bool)

(assert (=> b!248738 m!375023))

(assert (=> b!248738 m!374191))

(assert (=> d!83462 m!375023))

(assert (=> d!83462 m!374191))

(assert (=> b!248740 m!374227))

(declare-fun m!375025 () Bool)

(assert (=> b!248739 m!375025))

(declare-fun m!375027 () Bool)

(assert (=> b!248739 m!375027))

(declare-fun m!375029 () Bool)

(assert (=> b!248739 m!375029))

(assert (=> b!248742 m!373925))

(assert (=> d!83104 d!83462))

(declare-fun d!83464 () Bool)

(declare-fun e!172327 () Bool)

(assert (=> d!83464 e!172327))

(declare-fun res!208183 () Bool)

(assert (=> d!83464 (=> (not res!208183) (not e!172327))))

(declare-fun lt!387701 () (_ BitVec 64))

(declare-fun lt!387700 () (_ BitVec 64))

(declare-fun lt!387705 () (_ BitVec 64))

(assert (=> d!83464 (= res!208183 (= lt!387705 (bvsub lt!387700 lt!387701)))))

(assert (=> d!83464 (or (= (bvand lt!387700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387701 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387700 lt!387701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83464 (= lt!387701 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387002)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!387002))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!387002)))))))

(declare-fun lt!387703 () (_ BitVec 64))

(declare-fun lt!387704 () (_ BitVec 64))

(assert (=> d!83464 (= lt!387700 (bvmul lt!387703 lt!387704))))

(assert (=> d!83464 (or (= lt!387703 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387704 (bvsdiv (bvmul lt!387703 lt!387704) lt!387703)))))

(assert (=> d!83464 (= lt!387704 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83464 (= lt!387703 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387002)))))))

(assert (=> d!83464 (= lt!387705 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!387002))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!387002)))))))

(assert (=> d!83464 (invariant!0 (currentBit!11835 (_2!11563 lt!387002)) (currentByte!11840 (_2!11563 lt!387002)) (size!5937 (buf!6424 (_2!11563 lt!387002))))))

(assert (=> d!83464 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!387002))) (currentByte!11840 (_2!11563 lt!387002)) (currentBit!11835 (_2!11563 lt!387002))) lt!387705)))

(declare-fun b!248744 () Bool)

(declare-fun res!208182 () Bool)

(assert (=> b!248744 (=> (not res!208182) (not e!172327))))

(assert (=> b!248744 (= res!208182 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387705))))

(declare-fun b!248745 () Bool)

(declare-fun lt!387702 () (_ BitVec 64))

(assert (=> b!248745 (= e!172327 (bvsle lt!387705 (bvmul lt!387702 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248745 (or (= lt!387702 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387702 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387702)))))

(assert (=> b!248745 (= lt!387702 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387002)))))))

(assert (= (and d!83464 res!208183) b!248744))

(assert (= (and b!248744 res!208182) b!248745))

(declare-fun m!375031 () Bool)

(assert (=> d!83464 m!375031))

(declare-fun m!375033 () Bool)

(assert (=> d!83464 m!375033))

(assert (=> b!248257 d!83464))

(assert (=> b!248257 d!83072))

(declare-fun d!83466 () Bool)

(assert (=> d!83466 (= (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386657)))) ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386657))) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386657)))) (bvsub (bvmul ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386657)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386657))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386657))))))))

(assert (=> d!83084 d!83466))

(declare-fun d!83468 () Bool)

(assert (=> d!83468 (= (invariant!0 (currentBit!11835 (_1!11564 lt!386657)) (currentByte!11840 (_1!11564 lt!386657)) (size!5937 (buf!6424 (_1!11564 lt!386657)))) (and (bvsge (currentBit!11835 (_1!11564 lt!386657)) #b00000000000000000000000000000000) (bvslt (currentBit!11835 (_1!11564 lt!386657)) #b00000000000000000000000000001000) (bvsge (currentByte!11840 (_1!11564 lt!386657)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11840 (_1!11564 lt!386657)) (size!5937 (buf!6424 (_1!11564 lt!386657)))) (and (= (currentBit!11835 (_1!11564 lt!386657)) #b00000000000000000000000000000000) (= (currentByte!11840 (_1!11564 lt!386657)) (size!5937 (buf!6424 (_1!11564 lt!386657))))))))))

(assert (=> d!83084 d!83468))

(declare-fun lt!387706 () (_ BitVec 32))

(declare-fun b!248746 () Bool)

(declare-fun e!172328 () Bool)

(declare-fun lt!387708 () tuple4!286)

(assert (=> b!248746 (= e!172328 (byteRangesEq!0 (select (arr!6924 (buf!6424 (_2!11563 lt!386670))) (_4!143 lt!387708)) (select (arr!6924 (buf!6424 (_2!11563 lt!386663))) (_4!143 lt!387708)) #b00000000000000000000000000000000 lt!387706))))

(declare-fun b!248747 () Bool)

(declare-fun e!172332 () Bool)

(declare-fun e!172331 () Bool)

(assert (=> b!248747 (= e!172332 e!172331)))

(declare-fun res!208188 () Bool)

(assert (=> b!248747 (=> (not res!208188) (not e!172331))))

(declare-fun e!172329 () Bool)

(assert (=> b!248747 (= res!208188 e!172329)))

(declare-fun res!208186 () Bool)

(assert (=> b!248747 (=> res!208186 e!172329)))

(assert (=> b!248747 (= res!208186 (bvsge (_1!11570 lt!387708) (_2!11570 lt!387708)))))

(assert (=> b!248747 (= lt!387706 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387707 () (_ BitVec 32))

(assert (=> b!248747 (= lt!387707 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248747 (= lt!387708 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(declare-fun b!248748 () Bool)

(declare-fun res!208187 () Bool)

(assert (=> b!248748 (= res!208187 (= lt!387706 #b00000000000000000000000000000000))))

(assert (=> b!248748 (=> res!208187 e!172328)))

(declare-fun e!172330 () Bool)

(assert (=> b!248748 (= e!172330 e!172328)))

(declare-fun b!248749 () Bool)

(declare-fun e!172333 () Bool)

(assert (=> b!248749 (= e!172331 e!172333)))

(declare-fun c!11568 () Bool)

(assert (=> b!248749 (= c!11568 (= (_3!923 lt!387708) (_4!143 lt!387708)))))

(declare-fun b!248750 () Bool)

(declare-fun call!3950 () Bool)

(assert (=> b!248750 (= e!172333 call!3950)))

(declare-fun d!83470 () Bool)

(declare-fun res!208184 () Bool)

(assert (=> d!83470 (=> res!208184 e!172332)))

(assert (=> d!83470 (= res!208184 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(assert (=> d!83470 (= (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386670)) (buf!6424 (_2!11563 lt!386663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))) e!172332)))

(declare-fun b!248751 () Bool)

(assert (=> b!248751 (= e!172329 (arrayRangesEq!920 (buf!6424 (_2!11563 lt!386670)) (buf!6424 (_2!11563 lt!386663)) (_1!11570 lt!387708) (_2!11570 lt!387708)))))

(declare-fun bm!3947 () Bool)

(assert (=> bm!3947 (= call!3950 (byteRangesEq!0 (select (arr!6924 (buf!6424 (_2!11563 lt!386670))) (_3!923 lt!387708)) (select (arr!6924 (buf!6424 (_2!11563 lt!386663))) (_3!923 lt!387708)) lt!387707 (ite c!11568 lt!387706 #b00000000000000000000000000001000)))))

(declare-fun b!248752 () Bool)

(assert (=> b!248752 (= e!172333 e!172330)))

(declare-fun res!208185 () Bool)

(assert (=> b!248752 (= res!208185 call!3950)))

(assert (=> b!248752 (=> (not res!208185) (not e!172330))))

(assert (= (and d!83470 (not res!208184)) b!248747))

(assert (= (and b!248747 (not res!208186)) b!248751))

(assert (= (and b!248747 res!208188) b!248749))

(assert (= (and b!248749 c!11568) b!248750))

(assert (= (and b!248749 (not c!11568)) b!248752))

(assert (= (and b!248752 res!208185) b!248748))

(assert (= (and b!248748 (not res!208187)) b!248746))

(assert (= (or b!248750 b!248752) bm!3947))

(declare-fun m!375035 () Bool)

(assert (=> b!248746 m!375035))

(declare-fun m!375037 () Bool)

(assert (=> b!248746 m!375037))

(assert (=> b!248746 m!375035))

(assert (=> b!248746 m!375037))

(declare-fun m!375039 () Bool)

(assert (=> b!248746 m!375039))

(assert (=> b!248747 m!373915))

(declare-fun m!375041 () Bool)

(assert (=> b!248747 m!375041))

(declare-fun m!375043 () Bool)

(assert (=> b!248751 m!375043))

(declare-fun m!375045 () Bool)

(assert (=> bm!3947 m!375045))

(declare-fun m!375047 () Bool)

(assert (=> bm!3947 m!375047))

(assert (=> bm!3947 m!375045))

(assert (=> bm!3947 m!375047))

(declare-fun m!375049 () Bool)

(assert (=> bm!3947 m!375049))

(assert (=> b!248235 d!83470))

(assert (=> b!248235 d!83072))

(declare-fun d!83472 () Bool)

(declare-fun e!172334 () Bool)

(assert (=> d!83472 e!172334))

(declare-fun res!208190 () Bool)

(assert (=> d!83472 (=> (not res!208190) (not e!172334))))

(declare-fun lt!387709 () (_ BitVec 64))

(declare-fun lt!387714 () (_ BitVec 64))

(declare-fun lt!387710 () (_ BitVec 64))

(assert (=> d!83472 (= res!208190 (= lt!387714 (bvsub lt!387709 lt!387710)))))

(assert (=> d!83472 (or (= (bvand lt!387709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387710 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387709 lt!387710) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83472 (= lt!387710 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!387026)))) ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!387026))) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!387026)))))))

(declare-fun lt!387712 () (_ BitVec 64))

(declare-fun lt!387713 () (_ BitVec 64))

(assert (=> d!83472 (= lt!387709 (bvmul lt!387712 lt!387713))))

(assert (=> d!83472 (or (= lt!387712 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387713 (bvsdiv (bvmul lt!387712 lt!387713) lt!387712)))))

(assert (=> d!83472 (= lt!387713 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83472 (= lt!387712 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!387026)))))))

(assert (=> d!83472 (= lt!387714 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!387026))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!387026)))))))

(assert (=> d!83472 (invariant!0 (currentBit!11835 (_1!11564 lt!387026)) (currentByte!11840 (_1!11564 lt!387026)) (size!5937 (buf!6424 (_1!11564 lt!387026))))))

(assert (=> d!83472 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!387026))) (currentByte!11840 (_1!11564 lt!387026)) (currentBit!11835 (_1!11564 lt!387026))) lt!387714)))

(declare-fun b!248753 () Bool)

(declare-fun res!208189 () Bool)

(assert (=> b!248753 (=> (not res!208189) (not e!172334))))

(assert (=> b!248753 (= res!208189 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387714))))

(declare-fun b!248754 () Bool)

(declare-fun lt!387711 () (_ BitVec 64))

(assert (=> b!248754 (= e!172334 (bvsle lt!387714 (bvmul lt!387711 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248754 (or (= lt!387711 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387711 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387711)))))

(assert (=> b!248754 (= lt!387711 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!387026)))))))

(assert (= (and d!83472 res!208190) b!248753))

(assert (= (and b!248753 res!208189) b!248754))

(declare-fun m!375051 () Bool)

(assert (=> d!83472 m!375051))

(declare-fun m!375053 () Bool)

(assert (=> d!83472 m!375053))

(assert (=> b!248277 d!83472))

(assert (=> b!248277 d!83458))

(declare-fun d!83474 () Bool)

(declare-fun res!208191 () Bool)

(declare-fun e!172336 () Bool)

(assert (=> d!83474 (=> (not res!208191) (not e!172336))))

(assert (=> d!83474 (= res!208191 (= (size!5937 (buf!6424 (_2!11565 lt!386922))) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(assert (=> d!83474 (= (isPrefixOf!0 (_2!11565 lt!386922) (_2!11563 lt!386663)) e!172336)))

(declare-fun b!248755 () Bool)

(declare-fun res!208193 () Bool)

(assert (=> b!248755 (=> (not res!208193) (not e!172336))))

(assert (=> b!248755 (= res!208193 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_2!11565 lt!386922))) (currentByte!11840 (_2!11565 lt!386922)) (currentBit!11835 (_2!11565 lt!386922))) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663)))))))

(declare-fun b!248756 () Bool)

(declare-fun e!172335 () Bool)

(assert (=> b!248756 (= e!172336 e!172335)))

(declare-fun res!208192 () Bool)

(assert (=> b!248756 (=> res!208192 e!172335)))

(assert (=> b!248756 (= res!208192 (= (size!5937 (buf!6424 (_2!11565 lt!386922))) #b00000000000000000000000000000000))))

(declare-fun b!248757 () Bool)

(assert (=> b!248757 (= e!172335 (arrayBitRangesEq!0 (buf!6424 (_2!11565 lt!386922)) (buf!6424 (_2!11563 lt!386663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_2!11565 lt!386922))) (currentByte!11840 (_2!11565 lt!386922)) (currentBit!11835 (_2!11565 lt!386922)))))))

(assert (= (and d!83474 res!208191) b!248755))

(assert (= (and b!248755 res!208193) b!248756))

(assert (= (and b!248756 (not res!208192)) b!248757))

(assert (=> b!248755 m!375017))

(assert (=> b!248755 m!373919))

(assert (=> b!248757 m!375017))

(assert (=> b!248757 m!375017))

(declare-fun m!375055 () Bool)

(assert (=> b!248757 m!375055))

(assert (=> b!248222 d!83474))

(assert (=> b!248233 d!83072))

(assert (=> b!248233 d!83118))

(declare-fun d!83476 () Bool)

(declare-fun res!208194 () Bool)

(declare-fun e!172338 () Bool)

(assert (=> d!83476 (=> (not res!208194) (not e!172338))))

(assert (=> d!83476 (= res!208194 (= (size!5937 (buf!6424 thiss!1005)) (size!5937 (buf!6424 (_2!11563 lt!387029)))))))

(assert (=> d!83476 (= (isPrefixOf!0 thiss!1005 (_2!11563 lt!387029)) e!172338)))

(declare-fun b!248758 () Bool)

(declare-fun res!208196 () Bool)

(assert (=> b!248758 (=> (not res!208196) (not e!172338))))

(assert (=> b!248758 (= res!208196 (bvsle (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005)) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!387029))) (currentByte!11840 (_2!11563 lt!387029)) (currentBit!11835 (_2!11563 lt!387029)))))))

(declare-fun b!248759 () Bool)

(declare-fun e!172337 () Bool)

(assert (=> b!248759 (= e!172338 e!172337)))

(declare-fun res!208195 () Bool)

(assert (=> b!248759 (=> res!208195 e!172337)))

(assert (=> b!248759 (= res!208195 (= (size!5937 (buf!6424 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248760 () Bool)

(assert (=> b!248760 (= e!172337 (arrayBitRangesEq!0 (buf!6424 thiss!1005) (buf!6424 (_2!11563 lt!387029)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 thiss!1005)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))))))

(assert (= (and d!83476 res!208194) b!248758))

(assert (= (and b!248758 res!208196) b!248759))

(assert (= (and b!248759 (not res!208195)) b!248760))

(assert (=> b!248758 m!373917))

(assert (=> b!248758 m!374235))

(assert (=> b!248760 m!373917))

(assert (=> b!248760 m!373917))

(declare-fun m!375057 () Bool)

(assert (=> b!248760 m!375057))

(assert (=> b!248275 d!83476))

(assert (=> b!248226 d!83066))

(assert (=> d!83098 d!83096))

(declare-fun d!83478 () Bool)

(assert (=> d!83478 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!386651)))

(assert (=> d!83478 true))

(declare-fun _$6!408 () Unit!17995)

(assert (=> d!83478 (= (choose!9 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!386663)) lt!386651 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))) _$6!408)))

(declare-fun bs!21131 () Bool)

(assert (= bs!21131 d!83478))

(assert (=> bs!21131 m!373955))

(assert (=> d!83098 d!83478))

(declare-fun d!83480 () Bool)

(declare-fun e!172339 () Bool)

(assert (=> d!83480 e!172339))

(declare-fun res!208197 () Bool)

(assert (=> d!83480 (=> (not res!208197) (not e!172339))))

(assert (=> d!83480 (= res!208197 (= (buf!6424 (_2!11563 (increaseBitIndex!0 lt!386666))) (buf!6424 lt!386666)))))

(declare-fun lt!387721 () Bool)

(assert (=> d!83480 (= lt!387721 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 lt!386666)) (currentByte!11840 lt!386666))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 lt!386666)))) #b00000000000000000000000000000000)))))

(declare-fun lt!387720 () tuple2!21290)

(assert (=> d!83480 (= lt!387720 (tuple2!21291 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 lt!386666)) (currentByte!11840 lt!386666))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 lt!386666)))) #b00000000000000000000000000000000)) (_2!11563 (increaseBitIndex!0 lt!386666))))))

(assert (=> d!83480 (validate_offset_bit!0 ((_ sign_extend 32) (size!5937 (buf!6424 lt!386666))) ((_ sign_extend 32) (currentByte!11840 lt!386666)) ((_ sign_extend 32) (currentBit!11835 lt!386666)))))

(assert (=> d!83480 (= (readBit!0 lt!386666) lt!387720)))

(declare-fun lt!387716 () (_ BitVec 64))

(declare-fun b!248761 () Bool)

(declare-fun lt!387715 () (_ BitVec 64))

(assert (=> b!248761 (= e!172339 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 (increaseBitIndex!0 lt!386666)))) (currentByte!11840 (_2!11563 (increaseBitIndex!0 lt!386666))) (currentBit!11835 (_2!11563 (increaseBitIndex!0 lt!386666)))) (bvadd lt!387716 lt!387715)))))

(assert (=> b!248761 (or (not (= (bvand lt!387716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387715 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387716 lt!387715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248761 (= lt!387715 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248761 (= lt!387716 (bitIndex!0 (size!5937 (buf!6424 lt!386666)) (currentByte!11840 lt!386666) (currentBit!11835 lt!386666)))))

(declare-fun lt!387719 () Bool)

(assert (=> b!248761 (= lt!387719 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 lt!386666)) (currentByte!11840 lt!386666))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 lt!386666)))) #b00000000000000000000000000000000)))))

(declare-fun lt!387718 () Bool)

(assert (=> b!248761 (= lt!387718 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 lt!386666)) (currentByte!11840 lt!386666))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 lt!386666)))) #b00000000000000000000000000000000)))))

(declare-fun lt!387717 () Bool)

(assert (=> b!248761 (= lt!387717 (not (= (bvand ((_ sign_extend 24) (select (arr!6924 (buf!6424 lt!386666)) (currentByte!11840 lt!386666))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11835 lt!386666)))) #b00000000000000000000000000000000)))))

(assert (= (and d!83480 res!208197) b!248761))

(declare-fun m!375059 () Bool)

(assert (=> d!83480 m!375059))

(declare-fun m!375061 () Bool)

(assert (=> d!83480 m!375061))

(declare-fun m!375063 () Bool)

(assert (=> d!83480 m!375063))

(declare-fun m!375065 () Bool)

(assert (=> d!83480 m!375065))

(declare-fun m!375067 () Bool)

(assert (=> b!248761 m!375067))

(assert (=> b!248761 m!375059))

(assert (=> b!248761 m!375063))

(assert (=> b!248761 m!375061))

(declare-fun m!375069 () Bool)

(assert (=> b!248761 m!375069))

(assert (=> d!83080 d!83480))

(declare-fun d!83482 () Bool)

(assert (=> d!83482 (= (invariant!0 (currentBit!11835 thiss!1005) (currentByte!11840 thiss!1005) (size!5937 (buf!6424 thiss!1005))) (and (bvsge (currentBit!11835 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11835 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11840 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11840 thiss!1005) (size!5937 (buf!6424 thiss!1005))) (and (= (currentBit!11835 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11840 thiss!1005) (size!5937 (buf!6424 thiss!1005)))))))))

(assert (=> d!83034 d!83482))

(declare-fun d!83484 () Bool)

(assert (=> d!83484 (= (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386665)))) ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386665))) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386665)))) (bvsub (bvmul ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!386665)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!386665))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!386665))))))))

(assert (=> d!83078 d!83484))

(declare-fun d!83486 () Bool)

(assert (=> d!83486 (= (invariant!0 (currentBit!11835 (_1!11564 lt!386665)) (currentByte!11840 (_1!11564 lt!386665)) (size!5937 (buf!6424 (_1!11564 lt!386665)))) (and (bvsge (currentBit!11835 (_1!11564 lt!386665)) #b00000000000000000000000000000000) (bvslt (currentBit!11835 (_1!11564 lt!386665)) #b00000000000000000000000000001000) (bvsge (currentByte!11840 (_1!11564 lt!386665)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11840 (_1!11564 lt!386665)) (size!5937 (buf!6424 (_1!11564 lt!386665)))) (and (= (currentBit!11835 (_1!11564 lt!386665)) #b00000000000000000000000000000000) (= (currentByte!11840 (_1!11564 lt!386665)) (size!5937 (buf!6424 (_1!11564 lt!386665))))))))))

(assert (=> d!83078 d!83486))

(declare-fun d!83488 () Bool)

(declare-fun lt!387722 () tuple2!21290)

(assert (=> d!83488 (= lt!387722 (checkBitsLoop!0 (_1!11565 lt!386999) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83488 (= (checkBitsLoopPure!0 (_1!11565 lt!386999) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21285 (_2!11567 lt!387722) (_1!11567 lt!387722)))))

(declare-fun bs!21132 () Bool)

(assert (= bs!21132 d!83488))

(declare-fun m!375071 () Bool)

(assert (=> bs!21132 m!375071))

(assert (=> b!248259 d!83488))

(declare-fun d!83490 () Bool)

(assert (=> d!83490 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387002)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!387001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387002)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670)))) lt!387001))))

(declare-fun bs!21133 () Bool)

(assert (= bs!21133 d!83490))

(declare-fun m!375073 () Bool)

(assert (=> bs!21133 m!375073))

(assert (=> b!248259 d!83490))

(declare-fun d!83492 () Bool)

(assert (=> d!83492 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!387002)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!387001)))

(declare-fun lt!387723 () Unit!17995)

(assert (=> d!83492 (= lt!387723 (choose!9 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!387002)) lt!387001 (BitStream!10797 (buf!6424 (_2!11563 lt!387002)) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(assert (=> d!83492 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11563 lt!386670) (buf!6424 (_2!11563 lt!387002)) lt!387001) lt!387723)))

(declare-fun bs!21134 () Bool)

(assert (= bs!21134 d!83492))

(assert (=> bs!21134 m!374211))

(declare-fun m!375075 () Bool)

(assert (=> bs!21134 m!375075))

(assert (=> b!248259 d!83492))

(declare-fun d!83494 () Bool)

(declare-fun e!172340 () Bool)

(assert (=> d!83494 e!172340))

(declare-fun res!208200 () Bool)

(assert (=> d!83494 (=> (not res!208200) (not e!172340))))

(declare-fun lt!387725 () tuple2!21286)

(assert (=> d!83494 (= res!208200 (isPrefixOf!0 (_1!11565 lt!387725) (_2!11565 lt!387725)))))

(declare-fun lt!387728 () BitStream!10796)

(assert (=> d!83494 (= lt!387725 (tuple2!21287 lt!387728 (_2!11563 lt!387002)))))

(declare-fun lt!387734 () Unit!17995)

(declare-fun lt!387731 () Unit!17995)

(assert (=> d!83494 (= lt!387734 lt!387731)))

(assert (=> d!83494 (isPrefixOf!0 lt!387728 (_2!11563 lt!387002))))

(assert (=> d!83494 (= lt!387731 (lemmaIsPrefixTransitive!0 lt!387728 (_2!11563 lt!387002) (_2!11563 lt!387002)))))

(declare-fun lt!387736 () Unit!17995)

(declare-fun lt!387742 () Unit!17995)

(assert (=> d!83494 (= lt!387736 lt!387742)))

(assert (=> d!83494 (isPrefixOf!0 lt!387728 (_2!11563 lt!387002))))

(assert (=> d!83494 (= lt!387742 (lemmaIsPrefixTransitive!0 lt!387728 (_2!11563 lt!386670) (_2!11563 lt!387002)))))

(declare-fun lt!387738 () Unit!17995)

(declare-fun e!172341 () Unit!17995)

(assert (=> d!83494 (= lt!387738 e!172341)))

(declare-fun c!11569 () Bool)

(assert (=> d!83494 (= c!11569 (not (= (size!5937 (buf!6424 (_2!11563 lt!386670))) #b00000000000000000000000000000000)))))

(declare-fun lt!387739 () Unit!17995)

(declare-fun lt!387737 () Unit!17995)

(assert (=> d!83494 (= lt!387739 lt!387737)))

(assert (=> d!83494 (isPrefixOf!0 (_2!11563 lt!387002) (_2!11563 lt!387002))))

(assert (=> d!83494 (= lt!387737 (lemmaIsPrefixRefl!0 (_2!11563 lt!387002)))))

(declare-fun lt!387732 () Unit!17995)

(declare-fun lt!387729 () Unit!17995)

(assert (=> d!83494 (= lt!387732 lt!387729)))

(assert (=> d!83494 (= lt!387729 (lemmaIsPrefixRefl!0 (_2!11563 lt!387002)))))

(declare-fun lt!387735 () Unit!17995)

(declare-fun lt!387726 () Unit!17995)

(assert (=> d!83494 (= lt!387735 lt!387726)))

(assert (=> d!83494 (isPrefixOf!0 lt!387728 lt!387728)))

(assert (=> d!83494 (= lt!387726 (lemmaIsPrefixRefl!0 lt!387728))))

(declare-fun lt!387727 () Unit!17995)

(declare-fun lt!387724 () Unit!17995)

(assert (=> d!83494 (= lt!387727 lt!387724)))

(assert (=> d!83494 (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!386670))))

(assert (=> d!83494 (= lt!387724 (lemmaIsPrefixRefl!0 (_2!11563 lt!386670)))))

(assert (=> d!83494 (= lt!387728 (BitStream!10797 (buf!6424 (_2!11563 lt!387002)) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))))))

(assert (=> d!83494 (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!387002))))

(assert (=> d!83494 (= (reader!0 (_2!11563 lt!386670) (_2!11563 lt!387002)) lt!387725)))

(declare-fun lt!387741 () (_ BitVec 64))

(declare-fun lt!387730 () (_ BitVec 64))

(declare-fun b!248762 () Bool)

(assert (=> b!248762 (= e!172340 (= (_1!11565 lt!387725) (withMovedBitIndex!0 (_2!11565 lt!387725) (bvsub lt!387741 lt!387730))))))

(assert (=> b!248762 (or (= (bvand lt!387741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387730 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387741 lt!387730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248762 (= lt!387730 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!387002))) (currentByte!11840 (_2!11563 lt!387002)) (currentBit!11835 (_2!11563 lt!387002))))))

(assert (=> b!248762 (= lt!387741 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))))))

(declare-fun b!248763 () Bool)

(declare-fun Unit!18016 () Unit!17995)

(assert (=> b!248763 (= e!172341 Unit!18016)))

(declare-fun b!248764 () Bool)

(declare-fun res!208198 () Bool)

(assert (=> b!248764 (=> (not res!208198) (not e!172340))))

(assert (=> b!248764 (= res!208198 (isPrefixOf!0 (_1!11565 lt!387725) (_2!11563 lt!386670)))))

(declare-fun b!248765 () Bool)

(declare-fun res!208199 () Bool)

(assert (=> b!248765 (=> (not res!208199) (not e!172340))))

(assert (=> b!248765 (= res!208199 (isPrefixOf!0 (_2!11565 lt!387725) (_2!11563 lt!387002)))))

(declare-fun b!248766 () Bool)

(declare-fun lt!387743 () Unit!17995)

(assert (=> b!248766 (= e!172341 lt!387743)))

(declare-fun lt!387740 () (_ BitVec 64))

(assert (=> b!248766 (= lt!387740 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!387733 () (_ BitVec 64))

(assert (=> b!248766 (= lt!387733 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))))))

(assert (=> b!248766 (= lt!387743 (arrayBitRangesEqSymmetric!0 (buf!6424 (_2!11563 lt!386670)) (buf!6424 (_2!11563 lt!387002)) lt!387740 lt!387733))))

(assert (=> b!248766 (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!387002)) (buf!6424 (_2!11563 lt!386670)) lt!387740 lt!387733)))

(assert (= (and d!83494 c!11569) b!248766))

(assert (= (and d!83494 (not c!11569)) b!248763))

(assert (= (and d!83494 res!208200) b!248764))

(assert (= (and b!248764 res!208198) b!248765))

(assert (= (and b!248765 res!208199) b!248762))

(declare-fun m!375077 () Bool)

(assert (=> b!248764 m!375077))

(declare-fun m!375079 () Bool)

(assert (=> b!248762 m!375079))

(assert (=> b!248762 m!374203))

(assert (=> b!248762 m!373915))

(assert (=> b!248766 m!373915))

(declare-fun m!375081 () Bool)

(assert (=> b!248766 m!375081))

(declare-fun m!375083 () Bool)

(assert (=> b!248766 m!375083))

(declare-fun m!375085 () Bool)

(assert (=> d!83494 m!375085))

(declare-fun m!375087 () Bool)

(assert (=> d!83494 m!375087))

(declare-fun m!375089 () Bool)

(assert (=> d!83494 m!375089))

(assert (=> d!83494 m!374207))

(declare-fun m!375091 () Bool)

(assert (=> d!83494 m!375091))

(assert (=> d!83494 m!374165))

(declare-fun m!375093 () Bool)

(assert (=> d!83494 m!375093))

(declare-fun m!375095 () Bool)

(assert (=> d!83494 m!375095))

(declare-fun m!375097 () Bool)

(assert (=> d!83494 m!375097))

(declare-fun m!375099 () Bool)

(assert (=> d!83494 m!375099))

(assert (=> d!83494 m!374175))

(declare-fun m!375101 () Bool)

(assert (=> b!248765 m!375101))

(assert (=> b!248259 d!83494))

(assert (=> d!83100 d!83110))

(declare-fun d!83496 () Bool)

(assert (=> d!83496 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 lt!386663)))) ((_ sign_extend 32) (currentByte!11840 thiss!1005)) ((_ sign_extend 32) (currentBit!11835 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!83496 true))

(declare-fun _$6!409 () Unit!17995)

(assert (=> d!83496 (= (choose!9 thiss!1005 (buf!6424 (_2!11563 lt!386663)) (bvsub nBits!297 from!289) (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 thiss!1005) (currentBit!11835 thiss!1005))) _$6!409)))

(declare-fun bs!21135 () Bool)

(assert (= bs!21135 d!83496))

(assert (=> bs!21135 m!373941))

(assert (=> d!83100 d!83496))

(declare-fun b!248778 () Bool)

(declare-fun e!172350 () Bool)

(declare-fun lt!387758 () tuple2!21284)

(declare-fun lt!387756 () tuple2!21286)

(assert (=> b!248778 (= e!172350 (and (_2!11564 lt!387758) (= (_1!11564 lt!387758) (_2!11565 lt!387756))))))

(assert (=> b!248778 (= lt!387758 (checkBitsLoopPure!0 (_1!11565 lt!387756) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!387754 () Unit!17995)

(declare-fun lt!387755 () Unit!17995)

(assert (=> b!248778 (= lt!387754 lt!387755)))

(declare-fun _$23!27 () tuple2!21282)

(declare-fun lt!387757 () (_ BitVec 64))

(assert (=> b!248778 (validate_offset_bits!1 ((_ sign_extend 32) (size!5937 (buf!6424 (_2!11563 _$23!27)))) ((_ sign_extend 32) (currentByte!11840 (_2!11563 lt!386670))) ((_ sign_extend 32) (currentBit!11835 (_2!11563 lt!386670))) lt!387757)))

(assert (=> b!248778 (= lt!387755 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11563 lt!386670) (buf!6424 (_2!11563 _$23!27)) lt!387757))))

(assert (=> b!248778 (= lt!387757 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248778 (= lt!387756 (reader!0 (_2!11563 lt!386670) (_2!11563 _$23!27)))))

(declare-fun b!248776 () Bool)

(declare-fun res!208207 () Bool)

(assert (=> b!248776 (=> (not res!208207) (not e!172350))))

(assert (=> b!248776 (= res!208207 (= (bitIndex!0 (size!5937 (buf!6424 (_2!11563 _$23!27))) (currentByte!11840 (_2!11563 _$23!27)) (currentBit!11835 (_2!11563 _$23!27))) (bvadd (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))))

(declare-fun d!83498 () Bool)

(assert (=> d!83498 e!172350))

(declare-fun res!208208 () Bool)

(assert (=> d!83498 (=> (not res!208208) (not e!172350))))

(assert (=> d!83498 (= res!208208 (= (size!5937 (buf!6424 (_2!11563 lt!386670))) (size!5937 (buf!6424 (_2!11563 _$23!27)))))))

(declare-fun e!172348 () Bool)

(assert (=> d!83498 (and (inv!12 (_2!11563 _$23!27)) e!172348)))

(assert (=> d!83498 (= (choose!51 (_2!11563 lt!386670) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) _$23!27)))

(declare-fun b!248775 () Bool)

(assert (=> b!248775 (= e!172348 (array_inv!5678 (buf!6424 (_2!11563 _$23!27))))))

(declare-fun b!248777 () Bool)

(declare-fun res!208209 () Bool)

(assert (=> b!248777 (=> (not res!208209) (not e!172350))))

(assert (=> b!248777 (= res!208209 (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 _$23!27)))))

(assert (= d!83498 b!248775))

(assert (= (and d!83498 res!208208) b!248776))

(assert (= (and b!248776 res!208207) b!248777))

(assert (= (and b!248777 res!208209) b!248778))

(declare-fun m!375103 () Bool)

(assert (=> b!248775 m!375103))

(declare-fun m!375105 () Bool)

(assert (=> d!83498 m!375105))

(declare-fun m!375107 () Bool)

(assert (=> b!248776 m!375107))

(assert (=> b!248776 m!373915))

(declare-fun m!375109 () Bool)

(assert (=> b!248778 m!375109))

(declare-fun m!375111 () Bool)

(assert (=> b!248778 m!375111))

(declare-fun m!375113 () Bool)

(assert (=> b!248778 m!375113))

(declare-fun m!375115 () Bool)

(assert (=> b!248778 m!375115))

(declare-fun m!375117 () Bool)

(assert (=> b!248777 m!375117))

(assert (=> d!83082 d!83498))

(declare-fun d!83500 () Bool)

(assert (=> d!83500 (= (invariant!0 (currentBit!11835 (_2!11563 lt!386670)) (currentByte!11840 (_2!11563 lt!386670)) (size!5937 (buf!6424 (_2!11563 lt!386670)))) (and (bvsge (currentBit!11835 (_2!11563 lt!386670)) #b00000000000000000000000000000000) (bvslt (currentBit!11835 (_2!11563 lt!386670)) #b00000000000000000000000000001000) (bvsge (currentByte!11840 (_2!11563 lt!386670)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11840 (_2!11563 lt!386670)) (size!5937 (buf!6424 (_2!11563 lt!386670)))) (and (= (currentBit!11835 (_2!11563 lt!386670)) #b00000000000000000000000000000000) (= (currentByte!11840 (_2!11563 lt!386670)) (size!5937 (buf!6424 (_2!11563 lt!386670))))))))))

(assert (=> d!83064 d!83500))

(assert (=> d!83114 d!83080))

(declare-fun d!83502 () Bool)

(declare-fun e!172351 () Bool)

(assert (=> d!83502 e!172351))

(declare-fun res!208211 () Bool)

(assert (=> d!83502 (=> (not res!208211) (not e!172351))))

(declare-fun lt!387760 () (_ BitVec 64))

(declare-fun lt!387759 () (_ BitVec 64))

(declare-fun lt!387764 () (_ BitVec 64))

(assert (=> d!83502 (= res!208211 (= lt!387764 (bvsub lt!387759 lt!387760)))))

(assert (=> d!83502 (or (= (bvand lt!387759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387759 lt!387760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83502 (= lt!387760 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!387072)))) ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!387072))) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!387072)))))))

(declare-fun lt!387762 () (_ BitVec 64))

(declare-fun lt!387763 () (_ BitVec 64))

(assert (=> d!83502 (= lt!387759 (bvmul lt!387762 lt!387763))))

(assert (=> d!83502 (or (= lt!387762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387763 (bvsdiv (bvmul lt!387762 lt!387763) lt!387762)))))

(assert (=> d!83502 (= lt!387763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83502 (= lt!387762 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!387072)))))))

(assert (=> d!83502 (= lt!387764 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!387072))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!387072)))))))

(assert (=> d!83502 (invariant!0 (currentBit!11835 (_1!11564 lt!387072)) (currentByte!11840 (_1!11564 lt!387072)) (size!5937 (buf!6424 (_1!11564 lt!387072))))))

(assert (=> d!83502 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!387072))) (currentByte!11840 (_1!11564 lt!387072)) (currentBit!11835 (_1!11564 lt!387072))) lt!387764)))

(declare-fun b!248779 () Bool)

(declare-fun res!208210 () Bool)

(assert (=> b!248779 (=> (not res!208210) (not e!172351))))

(assert (=> b!248779 (= res!208210 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387764))))

(declare-fun b!248780 () Bool)

(declare-fun lt!387761 () (_ BitVec 64))

(assert (=> b!248780 (= e!172351 (bvsle lt!387764 (bvmul lt!387761 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248780 (or (= lt!387761 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387761 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387761)))))

(assert (=> b!248780 (= lt!387761 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!387072)))))))

(assert (= (and d!83502 res!208211) b!248779))

(assert (= (and b!248779 res!208210) b!248780))

(declare-fun m!375119 () Bool)

(assert (=> d!83502 m!375119))

(declare-fun m!375121 () Bool)

(assert (=> d!83502 m!375121))

(assert (=> d!83114 d!83502))

(declare-fun d!83504 () Bool)

(declare-fun e!172352 () Bool)

(assert (=> d!83504 e!172352))

(declare-fun res!208213 () Bool)

(assert (=> d!83504 (=> (not res!208213) (not e!172352))))

(declare-fun lt!387765 () (_ BitVec 64))

(declare-fun lt!387770 () (_ BitVec 64))

(declare-fun lt!387766 () (_ BitVec 64))

(assert (=> d!83504 (= res!208213 (= lt!387770 (bvsub lt!387765 lt!387766)))))

(assert (=> d!83504 (or (= (bvand lt!387765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387766 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387765 lt!387766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83504 (= lt!387766 (remainingBits!0 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!387071)))) ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!387071))) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!387071)))))))

(declare-fun lt!387768 () (_ BitVec 64))

(declare-fun lt!387769 () (_ BitVec 64))

(assert (=> d!83504 (= lt!387765 (bvmul lt!387768 lt!387769))))

(assert (=> d!83504 (or (= lt!387768 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387769 (bvsdiv (bvmul lt!387768 lt!387769) lt!387768)))))

(assert (=> d!83504 (= lt!387769 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83504 (= lt!387768 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!387071)))))))

(assert (=> d!83504 (= lt!387770 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11840 (_1!11564 lt!387071))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11835 (_1!11564 lt!387071)))))))

(assert (=> d!83504 (invariant!0 (currentBit!11835 (_1!11564 lt!387071)) (currentByte!11840 (_1!11564 lt!387071)) (size!5937 (buf!6424 (_1!11564 lt!387071))))))

(assert (=> d!83504 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!387071))) (currentByte!11840 (_1!11564 lt!387071)) (currentBit!11835 (_1!11564 lt!387071))) lt!387770)))

(declare-fun b!248781 () Bool)

(declare-fun res!208212 () Bool)

(assert (=> b!248781 (=> (not res!208212) (not e!172352))))

(assert (=> b!248781 (= res!208212 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387770))))

(declare-fun b!248782 () Bool)

(declare-fun lt!387767 () (_ BitVec 64))

(assert (=> b!248782 (= e!172352 (bvsle lt!387770 (bvmul lt!387767 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248782 (or (= lt!387767 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387767 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387767)))))

(assert (=> b!248782 (= lt!387767 ((_ sign_extend 32) (size!5937 (buf!6424 (_1!11564 lt!387071)))))))

(assert (= (and d!83504 res!208213) b!248781))

(assert (= (and b!248781 res!208212) b!248782))

(declare-fun m!375123 () Bool)

(assert (=> d!83504 m!375123))

(declare-fun m!375125 () Bool)

(assert (=> d!83504 m!375125))

(assert (=> d!83114 d!83504))

(declare-fun d!83506 () Bool)

(declare-fun e!172355 () Bool)

(assert (=> d!83506 e!172355))

(declare-fun res!208216 () Bool)

(assert (=> d!83506 (=> (not res!208216) (not e!172355))))

(declare-fun lt!387777 () tuple2!21284)

(declare-fun lt!387779 () tuple2!21284)

(assert (=> d!83506 (= res!208216 (= (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!387777))) (currentByte!11840 (_1!11564 lt!387777)) (currentBit!11835 (_1!11564 lt!387777))) (bitIndex!0 (size!5937 (buf!6424 (_1!11564 lt!387779))) (currentByte!11840 (_1!11564 lt!387779)) (currentBit!11835 (_1!11564 lt!387779)))))))

(declare-fun lt!387778 () BitStream!10796)

(assert (=> d!83506 (= lt!387779 (readBitPure!0 lt!387778))))

(assert (=> d!83506 (= lt!387777 (readBitPure!0 lt!386666))))

(assert (=> d!83506 (= lt!387778 (BitStream!10797 (buf!6424 (_2!11563 lt!386663)) (currentByte!11840 lt!386666) (currentBit!11835 lt!386666)))))

(assert (=> d!83506 (invariant!0 (currentBit!11835 lt!386666) (currentByte!11840 lt!386666) (size!5937 (buf!6424 (_2!11563 lt!386663))))))

(assert (=> d!83506 true))

(declare-fun _$9!99 () Unit!17995)

(assert (=> d!83506 (= (choose!50 lt!386666 (_2!11563 lt!386663) lt!387069 lt!387072 (tuple2!21285 (_1!11564 lt!387072) (_2!11564 lt!387072)) (_1!11564 lt!387072) (_2!11564 lt!387072) lt!387071 (tuple2!21285 (_1!11564 lt!387071) (_2!11564 lt!387071)) (_1!11564 lt!387071) (_2!11564 lt!387071)) _$9!99)))

(declare-fun b!248785 () Bool)

(assert (=> b!248785 (= e!172355 (= (_2!11564 lt!387777) (_2!11564 lt!387779)))))

(assert (= (and d!83506 res!208216) b!248785))

(declare-fun m!375127 () Bool)

(assert (=> d!83506 m!375127))

(assert (=> d!83506 m!374295))

(declare-fun m!375129 () Bool)

(assert (=> d!83506 m!375129))

(assert (=> d!83506 m!373945))

(declare-fun m!375131 () Bool)

(assert (=> d!83506 m!375131))

(assert (=> d!83114 d!83506))

(declare-fun d!83508 () Bool)

(assert (=> d!83508 (= (invariant!0 (currentBit!11835 lt!386666) (currentByte!11840 lt!386666) (size!5937 (buf!6424 (_2!11563 lt!386663)))) (and (bvsge (currentBit!11835 lt!386666) #b00000000000000000000000000000000) (bvslt (currentBit!11835 lt!386666) #b00000000000000000000000000001000) (bvsge (currentByte!11840 lt!386666) #b00000000000000000000000000000000) (or (bvslt (currentByte!11840 lt!386666) (size!5937 (buf!6424 (_2!11563 lt!386663)))) (and (= (currentBit!11835 lt!386666) #b00000000000000000000000000000000) (= (currentByte!11840 lt!386666) (size!5937 (buf!6424 (_2!11563 lt!386663))))))))))

(assert (=> d!83114 d!83508))

(declare-fun d!83510 () Bool)

(declare-fun lt!387780 () tuple2!21290)

(assert (=> d!83510 (= lt!387780 (readBit!0 lt!387069))))

(assert (=> d!83510 (= (readBitPure!0 lt!387069) (tuple2!21285 (_2!11567 lt!387780) (_1!11567 lt!387780)))))

(declare-fun bs!21136 () Bool)

(assert (= bs!21136 d!83510))

(declare-fun m!375133 () Bool)

(assert (=> bs!21136 m!375133))

(assert (=> d!83114 d!83510))

(assert (=> d!83074 d!83370))

(assert (=> d!83074 d!83482))

(declare-fun d!83512 () Bool)

(declare-fun res!208217 () Bool)

(declare-fun e!172357 () Bool)

(assert (=> d!83512 (=> (not res!208217) (not e!172357))))

(assert (=> d!83512 (= res!208217 (= (size!5937 (buf!6424 (_2!11565 lt!387031))) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(assert (=> d!83512 (= (isPrefixOf!0 (_2!11565 lt!387031) (_2!11563 lt!386663)) e!172357)))

(declare-fun b!248786 () Bool)

(declare-fun res!208219 () Bool)

(assert (=> b!248786 (=> (not res!208219) (not e!172357))))

(assert (=> b!248786 (= res!208219 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_2!11565 lt!387031))) (currentByte!11840 (_2!11565 lt!387031)) (currentBit!11835 (_2!11565 lt!387031))) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663)))))))

(declare-fun b!248787 () Bool)

(declare-fun e!172356 () Bool)

(assert (=> b!248787 (= e!172357 e!172356)))

(declare-fun res!208218 () Bool)

(assert (=> b!248787 (=> res!208218 e!172356)))

(assert (=> b!248787 (= res!208218 (= (size!5937 (buf!6424 (_2!11565 lt!387031))) #b00000000000000000000000000000000))))

(declare-fun b!248788 () Bool)

(assert (=> b!248788 (= e!172356 (arrayBitRangesEq!0 (buf!6424 (_2!11565 lt!387031)) (buf!6424 (_2!11563 lt!386663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_2!11565 lt!387031))) (currentByte!11840 (_2!11565 lt!387031)) (currentBit!11835 (_2!11565 lt!387031)))))))

(assert (= (and d!83512 res!208217) b!248786))

(assert (= (and b!248786 res!208219) b!248787))

(assert (= (and b!248787 (not res!208218)) b!248788))

(assert (=> b!248786 m!374865))

(assert (=> b!248786 m!373919))

(assert (=> b!248788 m!374865))

(assert (=> b!248788 m!374865))

(declare-fun m!375135 () Bool)

(assert (=> b!248788 m!375135))

(assert (=> b!248281 d!83512))

(assert (=> d!83108 d!83116))

(declare-fun d!83514 () Bool)

(assert (=> d!83514 (isPrefixOf!0 thiss!1005 (_2!11563 lt!386663))))

(assert (=> d!83514 true))

(declare-fun _$15!318 () Unit!17995)

(assert (=> d!83514 (= (choose!30 thiss!1005 (_2!11563 lt!386670) (_2!11563 lt!386663)) _$15!318)))

(declare-fun bs!21137 () Bool)

(assert (= bs!21137 d!83514))

(assert (=> bs!21137 m!373933))

(assert (=> d!83108 d!83514))

(assert (=> d!83108 d!83120))

(assert (=> d!83072 d!83418))

(assert (=> d!83072 d!83500))

(declare-fun d!83516 () Bool)

(declare-fun res!208220 () Bool)

(declare-fun e!172359 () Bool)

(assert (=> d!83516 (=> (not res!208220) (not e!172359))))

(assert (=> d!83516 (= res!208220 (= (size!5937 (buf!6424 lt!386925)) (size!5937 (buf!6424 (_2!11563 lt!386663)))))))

(assert (=> d!83516 (= (isPrefixOf!0 lt!386925 (_2!11563 lt!386663)) e!172359)))

(declare-fun b!248789 () Bool)

(declare-fun res!208222 () Bool)

(assert (=> b!248789 (=> (not res!208222) (not e!172359))))

(assert (=> b!248789 (= res!208222 (bvsle (bitIndex!0 (size!5937 (buf!6424 lt!386925)) (currentByte!11840 lt!386925) (currentBit!11835 lt!386925)) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386663))) (currentByte!11840 (_2!11563 lt!386663)) (currentBit!11835 (_2!11563 lt!386663)))))))

(declare-fun b!248790 () Bool)

(declare-fun e!172358 () Bool)

(assert (=> b!248790 (= e!172359 e!172358)))

(declare-fun res!208221 () Bool)

(assert (=> b!248790 (=> res!208221 e!172358)))

(assert (=> b!248790 (= res!208221 (= (size!5937 (buf!6424 lt!386925)) #b00000000000000000000000000000000))))

(declare-fun b!248791 () Bool)

(assert (=> b!248791 (= e!172358 (arrayBitRangesEq!0 (buf!6424 lt!386925) (buf!6424 (_2!11563 lt!386663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 lt!386925)) (currentByte!11840 lt!386925) (currentBit!11835 lt!386925))))))

(assert (= (and d!83516 res!208220) b!248789))

(assert (= (and b!248789 res!208222) b!248790))

(assert (= (and b!248790 (not res!208221)) b!248791))

(declare-fun m!375137 () Bool)

(assert (=> b!248789 m!375137))

(assert (=> b!248789 m!373919))

(assert (=> b!248791 m!375137))

(assert (=> b!248791 m!375137))

(declare-fun m!375139 () Bool)

(assert (=> b!248791 m!375139))

(assert (=> d!83042 d!83516))

(declare-fun d!83518 () Bool)

(assert (=> d!83518 (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!386670))))

(declare-fun lt!387781 () Unit!17995)

(assert (=> d!83518 (= lt!387781 (choose!11 (_2!11563 lt!386670)))))

(assert (=> d!83518 (= (lemmaIsPrefixRefl!0 (_2!11563 lt!386670)) lt!387781)))

(declare-fun bs!21138 () Bool)

(assert (= bs!21138 d!83518))

(assert (=> bs!21138 m!374165))

(declare-fun m!375141 () Bool)

(assert (=> bs!21138 m!375141))

(assert (=> d!83042 d!83518))

(assert (=> d!83042 d!83438))

(declare-fun d!83520 () Bool)

(declare-fun res!208223 () Bool)

(declare-fun e!172361 () Bool)

(assert (=> d!83520 (=> (not res!208223) (not e!172361))))

(assert (=> d!83520 (= res!208223 (= (size!5937 (buf!6424 (_2!11563 lt!386670))) (size!5937 (buf!6424 (_2!11563 lt!386670)))))))

(assert (=> d!83520 (= (isPrefixOf!0 (_2!11563 lt!386670) (_2!11563 lt!386670)) e!172361)))

(declare-fun b!248792 () Bool)

(declare-fun res!208225 () Bool)

(assert (=> b!248792 (=> (not res!208225) (not e!172361))))

(assert (=> b!248792 (= res!208225 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670))) (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(declare-fun b!248793 () Bool)

(declare-fun e!172360 () Bool)

(assert (=> b!248793 (= e!172361 e!172360)))

(declare-fun res!208224 () Bool)

(assert (=> b!248793 (=> res!208224 e!172360)))

(assert (=> b!248793 (= res!208224 (= (size!5937 (buf!6424 (_2!11563 lt!386670))) #b00000000000000000000000000000000))))

(declare-fun b!248794 () Bool)

(assert (=> b!248794 (= e!172360 (arrayBitRangesEq!0 (buf!6424 (_2!11563 lt!386670)) (buf!6424 (_2!11563 lt!386670)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_2!11563 lt!386670))) (currentByte!11840 (_2!11563 lt!386670)) (currentBit!11835 (_2!11563 lt!386670)))))))

(assert (= (and d!83520 res!208223) b!248792))

(assert (= (and b!248792 res!208225) b!248793))

(assert (= (and b!248793 (not res!208224)) b!248794))

(assert (=> b!248792 m!373915))

(assert (=> b!248792 m!373915))

(assert (=> b!248794 m!373915))

(assert (=> b!248794 m!373915))

(declare-fun m!375143 () Bool)

(assert (=> b!248794 m!375143))

(assert (=> d!83042 d!83520))

(declare-fun d!83522 () Bool)

(assert (=> d!83522 (isPrefixOf!0 lt!386925 (_2!11563 lt!386663))))

(declare-fun lt!387782 () Unit!17995)

(assert (=> d!83522 (= lt!387782 (choose!30 lt!386925 (_2!11563 lt!386663) (_2!11563 lt!386663)))))

(assert (=> d!83522 (isPrefixOf!0 lt!386925 (_2!11563 lt!386663))))

(assert (=> d!83522 (= (lemmaIsPrefixTransitive!0 lt!386925 (_2!11563 lt!386663) (_2!11563 lt!386663)) lt!387782)))

(declare-fun bs!21139 () Bool)

(assert (= bs!21139 d!83522))

(assert (=> bs!21139 m!374163))

(declare-fun m!375145 () Bool)

(assert (=> bs!21139 m!375145))

(assert (=> bs!21139 m!374163))

(assert (=> d!83042 d!83522))

(assert (=> d!83042 d!83070))

(declare-fun d!83524 () Bool)

(declare-fun res!208226 () Bool)

(declare-fun e!172363 () Bool)

(assert (=> d!83524 (=> (not res!208226) (not e!172363))))

(assert (=> d!83524 (= res!208226 (= (size!5937 (buf!6424 lt!386925)) (size!5937 (buf!6424 lt!386925))))))

(assert (=> d!83524 (= (isPrefixOf!0 lt!386925 lt!386925) e!172363)))

(declare-fun b!248795 () Bool)

(declare-fun res!208228 () Bool)

(assert (=> b!248795 (=> (not res!208228) (not e!172363))))

(assert (=> b!248795 (= res!208228 (bvsle (bitIndex!0 (size!5937 (buf!6424 lt!386925)) (currentByte!11840 lt!386925) (currentBit!11835 lt!386925)) (bitIndex!0 (size!5937 (buf!6424 lt!386925)) (currentByte!11840 lt!386925) (currentBit!11835 lt!386925))))))

(declare-fun b!248796 () Bool)

(declare-fun e!172362 () Bool)

(assert (=> b!248796 (= e!172363 e!172362)))

(declare-fun res!208227 () Bool)

(assert (=> b!248796 (=> res!208227 e!172362)))

(assert (=> b!248796 (= res!208227 (= (size!5937 (buf!6424 lt!386925)) #b00000000000000000000000000000000))))

(declare-fun b!248797 () Bool)

(assert (=> b!248797 (= e!172362 (arrayBitRangesEq!0 (buf!6424 lt!386925) (buf!6424 lt!386925) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 lt!386925)) (currentByte!11840 lt!386925) (currentBit!11835 lt!386925))))))

(assert (= (and d!83524 res!208226) b!248795))

(assert (= (and b!248795 res!208228) b!248796))

(assert (= (and b!248796 (not res!208227)) b!248797))

(assert (=> b!248795 m!375137))

(assert (=> b!248795 m!375137))

(assert (=> b!248797 m!375137))

(assert (=> b!248797 m!375137))

(declare-fun m!375147 () Bool)

(assert (=> b!248797 m!375147))

(assert (=> d!83042 d!83524))

(declare-fun d!83526 () Bool)

(declare-fun res!208229 () Bool)

(declare-fun e!172365 () Bool)

(assert (=> d!83526 (=> (not res!208229) (not e!172365))))

(assert (=> d!83526 (= res!208229 (= (size!5937 (buf!6424 (_1!11565 lt!386922))) (size!5937 (buf!6424 (_2!11565 lt!386922)))))))

(assert (=> d!83526 (= (isPrefixOf!0 (_1!11565 lt!386922) (_2!11565 lt!386922)) e!172365)))

(declare-fun b!248798 () Bool)

(declare-fun res!208231 () Bool)

(assert (=> b!248798 (=> (not res!208231) (not e!172365))))

(assert (=> b!248798 (= res!208231 (bvsle (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386922))) (currentByte!11840 (_1!11565 lt!386922)) (currentBit!11835 (_1!11565 lt!386922))) (bitIndex!0 (size!5937 (buf!6424 (_2!11565 lt!386922))) (currentByte!11840 (_2!11565 lt!386922)) (currentBit!11835 (_2!11565 lt!386922)))))))

(declare-fun b!248799 () Bool)

(declare-fun e!172364 () Bool)

(assert (=> b!248799 (= e!172365 e!172364)))

(declare-fun res!208230 () Bool)

(assert (=> b!248799 (=> res!208230 e!172364)))

(assert (=> b!248799 (= res!208230 (= (size!5937 (buf!6424 (_1!11565 lt!386922))) #b00000000000000000000000000000000))))

(declare-fun b!248800 () Bool)

(assert (=> b!248800 (= e!172364 (arrayBitRangesEq!0 (buf!6424 (_1!11565 lt!386922)) (buf!6424 (_2!11565 lt!386922)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5937 (buf!6424 (_1!11565 lt!386922))) (currentByte!11840 (_1!11565 lt!386922)) (currentBit!11835 (_1!11565 lt!386922)))))))

(assert (= (and d!83526 res!208229) b!248798))

(assert (= (and b!248798 res!208231) b!248799))

(assert (= (and b!248799 (not res!208230)) b!248800))

(assert (=> b!248798 m!374877))

(assert (=> b!248798 m!375017))

(assert (=> b!248800 m!374877))

(assert (=> b!248800 m!374877))

(declare-fun m!375149 () Bool)

(assert (=> b!248800 m!375149))

(assert (=> d!83042 d!83526))

(assert (=> d!83042 d!83436))

(declare-fun d!83528 () Bool)

(assert (=> d!83528 (isPrefixOf!0 lt!386925 (_2!11563 lt!386663))))

(declare-fun lt!387783 () Unit!17995)

(assert (=> d!83528 (= lt!387783 (choose!30 lt!386925 (_2!11563 lt!386670) (_2!11563 lt!386663)))))

(assert (=> d!83528 (isPrefixOf!0 lt!386925 (_2!11563 lt!386670))))

(assert (=> d!83528 (= (lemmaIsPrefixTransitive!0 lt!386925 (_2!11563 lt!386670) (_2!11563 lt!386663)) lt!387783)))

(declare-fun bs!21140 () Bool)

(assert (= bs!21140 d!83528))

(assert (=> bs!21140 m!374163))

(declare-fun m!375151 () Bool)

(assert (=> bs!21140 m!375151))

(declare-fun m!375153 () Bool)

(assert (=> bs!21140 m!375153))

(assert (=> d!83042 d!83528))

(declare-fun d!83530 () Bool)

(assert (=> d!83530 (isPrefixOf!0 lt!386925 lt!386925)))

(declare-fun lt!387784 () Unit!17995)

(assert (=> d!83530 (= lt!387784 (choose!11 lt!386925))))

(assert (=> d!83530 (= (lemmaIsPrefixRefl!0 lt!386925) lt!387784)))

(declare-fun bs!21141 () Bool)

(assert (= bs!21141 d!83530))

(assert (=> bs!21141 m!374173))

(declare-fun m!375155 () Bool)

(assert (=> bs!21141 m!375155))

(assert (=> d!83042 d!83530))

(push 1)

(assert (not b!248739))

(assert (not d!83390))

(assert (not b!248651))

(assert (not d!83530))

(assert (not b!248798))

(assert (not b!248673))

(assert (not d!83428))

(assert (not b!248762))

(assert (not d!83460))

(assert (not b!248710))

(assert (not b!248792))

(assert (not b!248629))

(assert (not b!248712))

(assert (not d!83464))

(assert (not b!248608))

(assert (not b!248632))

(assert (not d!83380))

(assert (not d!83434))

(assert (not d!83490))

(assert (not b!248672))

(assert (not b!248731))

(assert (not b!248786))

(assert (not b!248654))

(assert (not b!248716))

(assert (not b!248755))

(assert (not b!248612))

(assert (not b!248729))

(assert (not d!83502))

(assert (not d!83462))

(assert (not b!248797))

(assert (not d!83420))

(assert (not d!83402))

(assert (not b!248725))

(assert (not bm!3945))

(assert (not d!83452))

(assert (not b!248751))

(assert (not b!248652))

(assert (not b!248789))

(assert (not bm!3944))

(assert (not bm!3946))

(assert (not b!248726))

(assert (not b!248740))

(assert (not b!248646))

(assert (not d!83522))

(assert (not d!83458))

(assert (not b!248778))

(assert (not b!248776))

(assert (not b!248628))

(assert (not b!248761))

(assert (not b!248728))

(assert (not b!248800))

(assert (not b!248704))

(assert (not d!83430))

(assert (not d!83528))

(assert (not d!83410))

(assert (not d!83436))

(assert (not d!83408))

(assert (not b!248664))

(assert (not b!248723))

(assert (not b!248711))

(assert (not b!248607))

(assert (not b!248649))

(assert (not b!248746))

(assert (not b!248738))

(assert (not b!248766))

(assert (not d!83398))

(assert (not d!83498))

(assert (not b!248666))

(assert (not b!248777))

(assert (not b!248660))

(assert (not b!248631))

(assert (not d!83384))

(assert (not d!83432))

(assert (not bm!3943))

(assert (not b!248720))

(assert (not d!83386))

(assert (not d!83382))

(assert (not b!248760))

(assert (not b!248641))

(assert (not b!248655))

(assert (not d!83388))

(assert (not b!248764))

(assert (not b!248701))

(assert (not d!83450))

(assert (not b!248662))

(assert (not b!248665))

(assert (not d!83412))

(assert (not b!248795))

(assert (not d!83446))

(assert (not d!83488))

(assert (not d!83510))

(assert (not b!248742))

(assert (not d!83472))

(assert (not b!248648))

(assert (not b!248775))

(assert (not d!83400))

(assert (not d!83496))

(assert (not d!83514))

(assert (not bm!3947))

(assert (not d!83492))

(assert (not b!248722))

(assert (not b!248791))

(assert (not b!248719))

(assert (not b!248677))

(assert (not b!248706))

(assert (not b!248656))

(assert (not d!83444))

(assert (not d!83504))

(assert (not d!83506))

(assert (not b!248616))

(assert (not b!248670))

(assert (not b!248717))

(assert (not b!248747))

(assert (not d!83478))

(assert (not b!248700))

(assert (not d!83480))

(assert (not b!248702))

(assert (not b!248630))

(assert (not d!83518))

(assert (not b!248794))

(assert (not b!248757))

(assert (not b!248765))

(assert (not b!248788))

(assert (not d!83456))

(assert (not d!83374))

(assert (not b!248714))

(assert (not b!248758))

(assert (not d!83494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

