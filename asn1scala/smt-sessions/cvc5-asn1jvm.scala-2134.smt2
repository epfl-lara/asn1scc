; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54084 () Bool)

(assert start!54084)

(declare-fun b!252040 () Bool)

(declare-fun e!174648 () Bool)

(declare-fun lt!391524 () (_ BitVec 64))

(declare-fun lt!391542 () (_ BitVec 64))

(assert (=> b!252040 (= e!174648 (not (or (= lt!391524 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!391524 (bvand lt!391542 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!252040 (= lt!391524 (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!13708 0))(
  ( (array!13709 (arr!7000 (Array (_ BitVec 32) (_ BitVec 8))) (size!6013 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10948 0))(
  ( (BitStream!10949 (buf!6515 array!13708) (currentByte!11970 (_ BitVec 32)) (currentBit!11965 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21648 0))(
  ( (tuple2!21649 (_1!11752 BitStream!10948) (_2!11752 BitStream!10948)) )
))
(declare-fun lt!391539 () tuple2!21648)

(declare-datatypes ((tuple2!21650 0))(
  ( (tuple2!21651 (_1!11753 BitStream!10948) (_2!11753 Bool)) )
))
(declare-fun lt!391531 () tuple2!21650)

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10948 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21650)

(assert (=> b!252040 (= lt!391531 (checkBitsLoopPure!0 (_1!11752 lt!391539) nBits!297 bit!26 from!289))))

(declare-datatypes ((Unit!18174 0))(
  ( (Unit!18175) )
))
(declare-datatypes ((tuple2!21652 0))(
  ( (tuple2!21653 (_1!11754 Unit!18174) (_2!11754 BitStream!10948)) )
))
(declare-fun lt!391532 () tuple2!21652)

(declare-fun thiss!1005 () BitStream!10948)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252040 (validate_offset_bits!1 ((_ sign_extend 32) (size!6013 (buf!6515 (_2!11754 lt!391532)))) ((_ sign_extend 32) (currentByte!11970 thiss!1005)) ((_ sign_extend 32) (currentBit!11965 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391528 () Unit!18174)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10948 array!13708 (_ BitVec 64)) Unit!18174)

(assert (=> b!252040 (= lt!391528 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6515 (_2!11754 lt!391532)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10948) tuple2!21650)

(assert (=> b!252040 (= (_2!11753 (readBitPure!0 (_1!11752 lt!391539))) bit!26)))

(declare-fun lt!391530 () tuple2!21648)

(declare-fun lt!391522 () tuple2!21652)

(declare-fun reader!0 (BitStream!10948 BitStream!10948) tuple2!21648)

(assert (=> b!252040 (= lt!391530 (reader!0 (_2!11754 lt!391522) (_2!11754 lt!391532)))))

(assert (=> b!252040 (= lt!391539 (reader!0 thiss!1005 (_2!11754 lt!391532)))))

(declare-fun e!174642 () Bool)

(assert (=> b!252040 e!174642))

(declare-fun res!211124 () Bool)

(assert (=> b!252040 (=> (not res!211124) (not e!174642))))

(declare-fun lt!391527 () tuple2!21650)

(declare-fun lt!391536 () tuple2!21650)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252040 (= res!211124 (= (bitIndex!0 (size!6013 (buf!6515 (_1!11753 lt!391527))) (currentByte!11970 (_1!11753 lt!391527)) (currentBit!11965 (_1!11753 lt!391527))) (bitIndex!0 (size!6013 (buf!6515 (_1!11753 lt!391536))) (currentByte!11970 (_1!11753 lt!391536)) (currentBit!11965 (_1!11753 lt!391536)))))))

(declare-fun lt!391533 () Unit!18174)

(declare-fun lt!391535 () BitStream!10948)

(declare-fun readBitPrefixLemma!0 (BitStream!10948 BitStream!10948) Unit!18174)

(assert (=> b!252040 (= lt!391533 (readBitPrefixLemma!0 lt!391535 (_2!11754 lt!391532)))))

(assert (=> b!252040 (= lt!391536 (readBitPure!0 (BitStream!10949 (buf!6515 (_2!11754 lt!391532)) (currentByte!11970 thiss!1005) (currentBit!11965 thiss!1005))))))

(assert (=> b!252040 (= lt!391527 (readBitPure!0 lt!391535))))

(assert (=> b!252040 (= lt!391535 (BitStream!10949 (buf!6515 (_2!11754 lt!391522)) (currentByte!11970 thiss!1005) (currentBit!11965 thiss!1005)))))

(declare-fun e!174645 () Bool)

(assert (=> b!252040 e!174645))

(declare-fun res!211127 () Bool)

(assert (=> b!252040 (=> (not res!211127) (not e!174645))))

(declare-fun isPrefixOf!0 (BitStream!10948 BitStream!10948) Bool)

(assert (=> b!252040 (= res!211127 (isPrefixOf!0 thiss!1005 (_2!11754 lt!391532)))))

(declare-fun lt!391525 () Unit!18174)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10948 BitStream!10948 BitStream!10948) Unit!18174)

(assert (=> b!252040 (= lt!391525 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11754 lt!391522) (_2!11754 lt!391532)))))

(declare-fun e!174641 () Bool)

(assert (=> b!252040 e!174641))

(declare-fun res!211130 () Bool)

(assert (=> b!252040 (=> (not res!211130) (not e!174641))))

(assert (=> b!252040 (= res!211130 (= (size!6013 (buf!6515 (_2!11754 lt!391522))) (size!6013 (buf!6515 (_2!11754 lt!391532)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10948 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21652)

(assert (=> b!252040 (= lt!391532 (appendNBitsLoop!0 (_2!11754 lt!391522) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252040 (validate_offset_bits!1 ((_ sign_extend 32) (size!6013 (buf!6515 (_2!11754 lt!391522)))) ((_ sign_extend 32) (currentByte!11970 (_2!11754 lt!391522))) ((_ sign_extend 32) (currentBit!11965 (_2!11754 lt!391522))) lt!391542)))

(assert (=> b!252040 (= lt!391542 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391538 () Unit!18174)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10948 BitStream!10948 (_ BitVec 64) (_ BitVec 64)) Unit!18174)

(assert (=> b!252040 (= lt!391538 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11754 lt!391522) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174643 () Bool)

(assert (=> b!252040 e!174643))

(declare-fun res!211131 () Bool)

(assert (=> b!252040 (=> (not res!211131) (not e!174643))))

(assert (=> b!252040 (= res!211131 (= (size!6013 (buf!6515 thiss!1005)) (size!6013 (buf!6515 (_2!11754 lt!391522)))))))

(declare-fun appendBit!0 (BitStream!10948 Bool) tuple2!21652)

(assert (=> b!252040 (= lt!391522 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252041 () Bool)

(declare-fun e!174646 () Bool)

(declare-fun lt!391529 () tuple2!21650)

(declare-fun lt!391523 () (_ BitVec 64))

(assert (=> b!252041 (= e!174646 (= (bitIndex!0 (size!6013 (buf!6515 (_1!11753 lt!391529))) (currentByte!11970 (_1!11753 lt!391529)) (currentBit!11965 (_1!11753 lt!391529))) lt!391523))))

(declare-fun b!252042 () Bool)

(declare-fun e!174647 () Bool)

(declare-fun lt!391540 () tuple2!21650)

(declare-fun lt!391526 () tuple2!21648)

(assert (=> b!252042 (= e!174647 (not (or (not (_2!11753 lt!391540)) (not (= (_1!11753 lt!391540) (_2!11752 lt!391526))))))))

(assert (=> b!252042 (= lt!391540 (checkBitsLoopPure!0 (_1!11752 lt!391526) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!391534 () (_ BitVec 64))

(assert (=> b!252042 (validate_offset_bits!1 ((_ sign_extend 32) (size!6013 (buf!6515 (_2!11754 lt!391532)))) ((_ sign_extend 32) (currentByte!11970 (_2!11754 lt!391522))) ((_ sign_extend 32) (currentBit!11965 (_2!11754 lt!391522))) lt!391534)))

(declare-fun lt!391537 () Unit!18174)

(assert (=> b!252042 (= lt!391537 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11754 lt!391522) (buf!6515 (_2!11754 lt!391532)) lt!391534))))

(assert (=> b!252042 (= lt!391526 (reader!0 (_2!11754 lt!391522) (_2!11754 lt!391532)))))

(declare-fun b!252043 () Bool)

(declare-fun e!174650 () Bool)

(declare-fun array_inv!5754 (array!13708) Bool)

(assert (=> b!252043 (= e!174650 (array_inv!5754 (buf!6515 thiss!1005)))))

(declare-fun b!252044 () Bool)

(declare-fun res!211132 () Bool)

(assert (=> b!252044 (=> (not res!211132) (not e!174647))))

(assert (=> b!252044 (= res!211132 (isPrefixOf!0 (_2!11754 lt!391522) (_2!11754 lt!391532)))))

(declare-fun b!252045 () Bool)

(declare-fun e!174649 () Bool)

(assert (=> b!252045 (= e!174649 e!174646)))

(declare-fun res!211133 () Bool)

(assert (=> b!252045 (=> (not res!211133) (not e!174646))))

(assert (=> b!252045 (= res!211133 (and (= (_2!11753 lt!391529) bit!26) (= (_1!11753 lt!391529) (_2!11754 lt!391522))))))

(declare-fun readerFrom!0 (BitStream!10948 (_ BitVec 32) (_ BitVec 32)) BitStream!10948)

(assert (=> b!252045 (= lt!391529 (readBitPure!0 (readerFrom!0 (_2!11754 lt!391522) (currentBit!11965 thiss!1005) (currentByte!11970 thiss!1005))))))

(declare-fun b!252046 () Bool)

(assert (=> b!252046 (= e!174642 (= (_2!11753 lt!391527) (_2!11753 lt!391536)))))

(declare-fun b!252047 () Bool)

(declare-fun res!211123 () Bool)

(assert (=> b!252047 (=> (not res!211123) (not e!174649))))

(assert (=> b!252047 (= res!211123 (isPrefixOf!0 thiss!1005 (_2!11754 lt!391522)))))

(declare-fun b!252048 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252048 (= e!174645 (invariant!0 (currentBit!11965 thiss!1005) (currentByte!11970 thiss!1005) (size!6013 (buf!6515 (_2!11754 lt!391532)))))))

(declare-fun b!252049 () Bool)

(declare-fun res!211122 () Bool)

(assert (=> b!252049 (=> (not res!211122) (not e!174648))))

(assert (=> b!252049 (= res!211122 (validate_offset_bits!1 ((_ sign_extend 32) (size!6013 (buf!6515 thiss!1005))) ((_ sign_extend 32) (currentByte!11970 thiss!1005)) ((_ sign_extend 32) (currentBit!11965 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252050 () Bool)

(declare-fun res!211129 () Bool)

(assert (=> b!252050 (=> (not res!211129) (not e!174645))))

(assert (=> b!252050 (= res!211129 (invariant!0 (currentBit!11965 thiss!1005) (currentByte!11970 thiss!1005) (size!6013 (buf!6515 (_2!11754 lt!391522)))))))

(declare-fun b!252051 () Bool)

(declare-fun res!211128 () Bool)

(assert (=> b!252051 (=> (not res!211128) (not e!174648))))

(assert (=> b!252051 (= res!211128 (bvslt from!289 nBits!297))))

(declare-fun b!252052 () Bool)

(assert (=> b!252052 (= e!174641 e!174647)))

(declare-fun res!211134 () Bool)

(assert (=> b!252052 (=> (not res!211134) (not e!174647))))

(assert (=> b!252052 (= res!211134 (= (bitIndex!0 (size!6013 (buf!6515 (_2!11754 lt!391532))) (currentByte!11970 (_2!11754 lt!391532)) (currentBit!11965 (_2!11754 lt!391532))) (bvadd (bitIndex!0 (size!6013 (buf!6515 (_2!11754 lt!391522))) (currentByte!11970 (_2!11754 lt!391522)) (currentBit!11965 (_2!11754 lt!391522))) lt!391534)))))

(assert (=> b!252052 (= lt!391534 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!211126 () Bool)

(assert (=> start!54084 (=> (not res!211126) (not e!174648))))

(assert (=> start!54084 (= res!211126 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54084 e!174648))

(assert (=> start!54084 true))

(declare-fun inv!12 (BitStream!10948) Bool)

(assert (=> start!54084 (and (inv!12 thiss!1005) e!174650)))

(declare-fun b!252053 () Bool)

(assert (=> b!252053 (= e!174643 e!174649)))

(declare-fun res!211125 () Bool)

(assert (=> b!252053 (=> (not res!211125) (not e!174649))))

(declare-fun lt!391541 () (_ BitVec 64))

(assert (=> b!252053 (= res!211125 (= lt!391523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391541)))))

(assert (=> b!252053 (= lt!391523 (bitIndex!0 (size!6013 (buf!6515 (_2!11754 lt!391522))) (currentByte!11970 (_2!11754 lt!391522)) (currentBit!11965 (_2!11754 lt!391522))))))

(assert (=> b!252053 (= lt!391541 (bitIndex!0 (size!6013 (buf!6515 thiss!1005)) (currentByte!11970 thiss!1005) (currentBit!11965 thiss!1005)))))

(assert (= (and start!54084 res!211126) b!252049))

(assert (= (and b!252049 res!211122) b!252051))

(assert (= (and b!252051 res!211128) b!252040))

(assert (= (and b!252040 res!211131) b!252053))

(assert (= (and b!252053 res!211125) b!252047))

(assert (= (and b!252047 res!211123) b!252045))

(assert (= (and b!252045 res!211133) b!252041))

(assert (= (and b!252040 res!211130) b!252052))

(assert (= (and b!252052 res!211134) b!252044))

(assert (= (and b!252044 res!211132) b!252042))

(assert (= (and b!252040 res!211127) b!252050))

(assert (= (and b!252050 res!211129) b!252048))

(assert (= (and b!252040 res!211124) b!252046))

(assert (= start!54084 b!252043))

(declare-fun m!379185 () Bool)

(assert (=> b!252047 m!379185))

(declare-fun m!379187 () Bool)

(assert (=> b!252049 m!379187))

(declare-fun m!379189 () Bool)

(assert (=> b!252045 m!379189))

(assert (=> b!252045 m!379189))

(declare-fun m!379191 () Bool)

(assert (=> b!252045 m!379191))

(declare-fun m!379193 () Bool)

(assert (=> b!252044 m!379193))

(declare-fun m!379195 () Bool)

(assert (=> b!252048 m!379195))

(declare-fun m!379197 () Bool)

(assert (=> b!252040 m!379197))

(declare-fun m!379199 () Bool)

(assert (=> b!252040 m!379199))

(declare-fun m!379201 () Bool)

(assert (=> b!252040 m!379201))

(declare-fun m!379203 () Bool)

(assert (=> b!252040 m!379203))

(declare-fun m!379205 () Bool)

(assert (=> b!252040 m!379205))

(declare-fun m!379207 () Bool)

(assert (=> b!252040 m!379207))

(declare-fun m!379209 () Bool)

(assert (=> b!252040 m!379209))

(declare-fun m!379211 () Bool)

(assert (=> b!252040 m!379211))

(declare-fun m!379213 () Bool)

(assert (=> b!252040 m!379213))

(declare-fun m!379215 () Bool)

(assert (=> b!252040 m!379215))

(declare-fun m!379217 () Bool)

(assert (=> b!252040 m!379217))

(declare-fun m!379219 () Bool)

(assert (=> b!252040 m!379219))

(declare-fun m!379221 () Bool)

(assert (=> b!252040 m!379221))

(declare-fun m!379223 () Bool)

(assert (=> b!252040 m!379223))

(declare-fun m!379225 () Bool)

(assert (=> b!252040 m!379225))

(declare-fun m!379227 () Bool)

(assert (=> b!252040 m!379227))

(declare-fun m!379229 () Bool)

(assert (=> b!252040 m!379229))

(declare-fun m!379231 () Bool)

(assert (=> start!54084 m!379231))

(declare-fun m!379233 () Bool)

(assert (=> b!252042 m!379233))

(declare-fun m!379235 () Bool)

(assert (=> b!252042 m!379235))

(declare-fun m!379237 () Bool)

(assert (=> b!252042 m!379237))

(assert (=> b!252042 m!379229))

(declare-fun m!379239 () Bool)

(assert (=> b!252041 m!379239))

(declare-fun m!379241 () Bool)

(assert (=> b!252050 m!379241))

(declare-fun m!379243 () Bool)

(assert (=> b!252043 m!379243))

(declare-fun m!379245 () Bool)

(assert (=> b!252052 m!379245))

(declare-fun m!379247 () Bool)

(assert (=> b!252052 m!379247))

(assert (=> b!252053 m!379247))

(declare-fun m!379249 () Bool)

(assert (=> b!252053 m!379249))

(push 1)

(assert (not b!252047))

(assert (not b!252052))

(assert (not b!252044))

(assert (not b!252041))

(assert (not b!252053))

(assert (not start!54084))

(assert (not b!252050))

(assert (not b!252049))

(assert (not b!252042))

(assert (not b!252043))

(assert (not b!252045))

(assert (not b!252048))

(assert (not b!252040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

