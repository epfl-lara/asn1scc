; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53102 () Bool)

(assert start!53102)

(declare-fun b!246100 () Bool)

(declare-fun res!205839 () Bool)

(declare-fun e!170490 () Bool)

(assert (=> b!246100 (=> (not res!205839) (not e!170490))))

(declare-datatypes ((array!13430 0))(
  ( (array!13431 (arr!6874 (Array (_ BitVec 32) (_ BitVec 8))) (size!5887 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10696 0))(
  ( (BitStream!10697 (buf!6368 array!13430) (currentByte!11764 (_ BitVec 32)) (currentBit!11759 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10696)

(declare-datatypes ((Unit!17886 0))(
  ( (Unit!17887) )
))
(declare-datatypes ((tuple2!21102 0))(
  ( (tuple2!21103 (_1!11473 Unit!17886) (_2!11473 BitStream!10696)) )
))
(declare-fun lt!383979 () tuple2!21102)

(declare-fun isPrefixOf!0 (BitStream!10696 BitStream!10696) Bool)

(assert (=> b!246100 (= res!205839 (isPrefixOf!0 thiss!1005 (_2!11473 lt!383979)))))

(declare-fun b!246101 () Bool)

(declare-fun res!205850 () Bool)

(declare-fun e!170498 () Bool)

(assert (=> b!246101 (=> (not res!205850) (not e!170498))))

(declare-fun lt!383977 () tuple2!21102)

(assert (=> b!246101 (= res!205850 (isPrefixOf!0 (_2!11473 lt!383979) (_2!11473 lt!383977)))))

(declare-fun b!246102 () Bool)

(declare-datatypes ((tuple2!21104 0))(
  ( (tuple2!21105 (_1!11474 BitStream!10696) (_2!11474 Bool)) )
))
(declare-fun lt!383960 () tuple2!21104)

(declare-datatypes ((tuple2!21106 0))(
  ( (tuple2!21107 (_1!11475 BitStream!10696) (_2!11475 BitStream!10696)) )
))
(declare-fun lt!383964 () tuple2!21106)

(assert (=> b!246102 (= e!170498 (not (or (not (_2!11474 lt!383960)) (not (= (_1!11474 lt!383960) (_2!11475 lt!383964))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10696 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21104)

(assert (=> b!246102 (= lt!383960 (checkBitsLoopPure!0 (_1!11475 lt!383964) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383976 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246102 (validate_offset_bits!1 ((_ sign_extend 32) (size!5887 (buf!6368 (_2!11473 lt!383977)))) ((_ sign_extend 32) (currentByte!11764 (_2!11473 lt!383979))) ((_ sign_extend 32) (currentBit!11759 (_2!11473 lt!383979))) lt!383976)))

(declare-fun lt!383981 () Unit!17886)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10696 array!13430 (_ BitVec 64)) Unit!17886)

(assert (=> b!246102 (= lt!383981 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11473 lt!383979) (buf!6368 (_2!11473 lt!383977)) lt!383976))))

(declare-fun reader!0 (BitStream!10696 BitStream!10696) tuple2!21106)

(assert (=> b!246102 (= lt!383964 (reader!0 (_2!11473 lt!383979) (_2!11473 lt!383977)))))

(declare-fun b!246103 () Bool)

(declare-fun e!170496 () Bool)

(declare-fun array_inv!5628 (array!13430) Bool)

(assert (=> b!246103 (= e!170496 (array_inv!5628 (buf!6368 thiss!1005)))))

(declare-fun b!246104 () Bool)

(declare-fun e!170492 () Bool)

(assert (=> b!246104 (= e!170492 true)))

(declare-fun lt!383965 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246104 (= lt!383965 (bitIndex!0 (size!5887 (buf!6368 (_2!11473 lt!383977))) (currentByte!11764 (_2!11473 lt!383977)) (currentBit!11759 (_2!11473 lt!383977))))))

(declare-fun lt!383963 () (_ BitVec 64))

(assert (=> b!246104 (= lt!383963 (bitIndex!0 (size!5887 (buf!6368 thiss!1005)) (currentByte!11764 thiss!1005) (currentBit!11759 thiss!1005)))))

(declare-fun b!246105 () Bool)

(declare-fun e!170493 () Bool)

(assert (=> b!246105 (= e!170493 e!170490)))

(declare-fun res!205848 () Bool)

(assert (=> b!246105 (=> (not res!205848) (not e!170490))))

(declare-fun lt!383959 () (_ BitVec 64))

(declare-fun lt!383978 () (_ BitVec 64))

(assert (=> b!246105 (= res!205848 (= lt!383959 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!383978)))))

(assert (=> b!246105 (= lt!383959 (bitIndex!0 (size!5887 (buf!6368 (_2!11473 lt!383979))) (currentByte!11764 (_2!11473 lt!383979)) (currentBit!11759 (_2!11473 lt!383979))))))

(assert (=> b!246105 (= lt!383978 (bitIndex!0 (size!5887 (buf!6368 thiss!1005)) (currentByte!11764 thiss!1005) (currentBit!11759 thiss!1005)))))

(declare-fun res!205840 () Bool)

(declare-fun e!170501 () Bool)

(assert (=> start!53102 (=> (not res!205840) (not e!170501))))

(assert (=> start!53102 (= res!205840 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53102 e!170501))

(assert (=> start!53102 true))

(declare-fun inv!12 (BitStream!10696) Bool)

(assert (=> start!53102 (and (inv!12 thiss!1005) e!170496)))

(declare-fun b!246106 () Bool)

(declare-fun e!170499 () Bool)

(assert (=> b!246106 (= e!170499 e!170492)))

(declare-fun res!205841 () Bool)

(assert (=> b!246106 (=> res!205841 e!170492)))

(assert (=> b!246106 (= res!205841 (not (= (size!5887 (buf!6368 thiss!1005)) (size!5887 (buf!6368 (_2!11473 lt!383977))))))))

(declare-fun lt!383982 () tuple2!21104)

(declare-fun lt!383974 () tuple2!21104)

(declare-fun lt!383969 () tuple2!21106)

(assert (=> b!246106 (and (= (_2!11474 lt!383982) (_2!11474 lt!383974)) (= (_1!11474 lt!383982) (_2!11475 lt!383969)))))

(declare-fun b!246107 () Bool)

(declare-fun e!170494 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246107 (= e!170494 (invariant!0 (currentBit!11759 thiss!1005) (currentByte!11764 thiss!1005) (size!5887 (buf!6368 (_2!11473 lt!383977)))))))

(declare-fun b!246108 () Bool)

(declare-fun res!205846 () Bool)

(assert (=> b!246108 (=> (not res!205846) (not e!170501))))

(assert (=> b!246108 (= res!205846 (validate_offset_bits!1 ((_ sign_extend 32) (size!5887 (buf!6368 thiss!1005))) ((_ sign_extend 32) (currentByte!11764 thiss!1005)) ((_ sign_extend 32) (currentBit!11759 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246109 () Bool)

(declare-fun e!170495 () Bool)

(assert (=> b!246109 (= e!170495 e!170498)))

(declare-fun res!205847 () Bool)

(assert (=> b!246109 (=> (not res!205847) (not e!170498))))

(assert (=> b!246109 (= res!205847 (= (bitIndex!0 (size!5887 (buf!6368 (_2!11473 lt!383977))) (currentByte!11764 (_2!11473 lt!383977)) (currentBit!11759 (_2!11473 lt!383977))) (bvadd (bitIndex!0 (size!5887 (buf!6368 (_2!11473 lt!383979))) (currentByte!11764 (_2!11473 lt!383979)) (currentBit!11759 (_2!11473 lt!383979))) lt!383976)))))

(assert (=> b!246109 (= lt!383976 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246110 () Bool)

(declare-fun e!170500 () Bool)

(declare-fun lt!383970 () tuple2!21104)

(assert (=> b!246110 (= e!170500 (= (bitIndex!0 (size!5887 (buf!6368 (_1!11474 lt!383970))) (currentByte!11764 (_1!11474 lt!383970)) (currentBit!11759 (_1!11474 lt!383970))) lt!383959))))

(declare-fun b!246111 () Bool)

(declare-fun res!205851 () Bool)

(assert (=> b!246111 (=> (not res!205851) (not e!170501))))

(assert (=> b!246111 (= res!205851 (bvslt from!289 nBits!297))))

(declare-fun b!246112 () Bool)

(assert (=> b!246112 (= e!170490 e!170500)))

(declare-fun res!205845 () Bool)

(assert (=> b!246112 (=> (not res!205845) (not e!170500))))

(assert (=> b!246112 (= res!205845 (and (= (_2!11474 lt!383970) bit!26) (= (_1!11474 lt!383970) (_2!11473 lt!383979))))))

(declare-fun readBitPure!0 (BitStream!10696) tuple2!21104)

(declare-fun readerFrom!0 (BitStream!10696 (_ BitVec 32) (_ BitVec 32)) BitStream!10696)

(assert (=> b!246112 (= lt!383970 (readBitPure!0 (readerFrom!0 (_2!11473 lt!383979) (currentBit!11759 thiss!1005) (currentByte!11764 thiss!1005))))))

(declare-fun b!246113 () Bool)

(assert (=> b!246113 (= e!170501 (not e!170499))))

(declare-fun res!205836 () Bool)

(assert (=> b!246113 (=> res!205836 e!170499)))

(declare-fun lt!383972 () tuple2!21106)

(assert (=> b!246113 (= res!205836 (not (= (_1!11474 lt!383974) (_2!11475 lt!383972))))))

(assert (=> b!246113 (= lt!383974 (checkBitsLoopPure!0 (_1!11475 lt!383972) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383961 () (_ BitVec 64))

(assert (=> b!246113 (validate_offset_bits!1 ((_ sign_extend 32) (size!5887 (buf!6368 (_2!11473 lt!383977)))) ((_ sign_extend 32) (currentByte!11764 (_2!11473 lt!383979))) ((_ sign_extend 32) (currentBit!11759 (_2!11473 lt!383979))) lt!383961)))

(declare-fun lt!383966 () Unit!17886)

(assert (=> b!246113 (= lt!383966 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11473 lt!383979) (buf!6368 (_2!11473 lt!383977)) lt!383961))))

(assert (=> b!246113 (= lt!383982 (checkBitsLoopPure!0 (_1!11475 lt!383969) nBits!297 bit!26 from!289))))

(assert (=> b!246113 (validate_offset_bits!1 ((_ sign_extend 32) (size!5887 (buf!6368 (_2!11473 lt!383977)))) ((_ sign_extend 32) (currentByte!11764 thiss!1005)) ((_ sign_extend 32) (currentBit!11759 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383975 () Unit!17886)

(assert (=> b!246113 (= lt!383975 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6368 (_2!11473 lt!383977)) (bvsub nBits!297 from!289)))))

(assert (=> b!246113 (= (_2!11474 (readBitPure!0 (_1!11475 lt!383969))) bit!26)))

(assert (=> b!246113 (= lt!383972 (reader!0 (_2!11473 lt!383979) (_2!11473 lt!383977)))))

(assert (=> b!246113 (= lt!383969 (reader!0 thiss!1005 (_2!11473 lt!383977)))))

(declare-fun e!170497 () Bool)

(assert (=> b!246113 e!170497))

(declare-fun res!205844 () Bool)

(assert (=> b!246113 (=> (not res!205844) (not e!170497))))

(declare-fun lt!383968 () tuple2!21104)

(declare-fun lt!383971 () tuple2!21104)

(assert (=> b!246113 (= res!205844 (= (bitIndex!0 (size!5887 (buf!6368 (_1!11474 lt!383968))) (currentByte!11764 (_1!11474 lt!383968)) (currentBit!11759 (_1!11474 lt!383968))) (bitIndex!0 (size!5887 (buf!6368 (_1!11474 lt!383971))) (currentByte!11764 (_1!11474 lt!383971)) (currentBit!11759 (_1!11474 lt!383971)))))))

(declare-fun lt!383980 () Unit!17886)

(declare-fun lt!383973 () BitStream!10696)

(declare-fun readBitPrefixLemma!0 (BitStream!10696 BitStream!10696) Unit!17886)

(assert (=> b!246113 (= lt!383980 (readBitPrefixLemma!0 lt!383973 (_2!11473 lt!383977)))))

(assert (=> b!246113 (= lt!383971 (readBitPure!0 (BitStream!10697 (buf!6368 (_2!11473 lt!383977)) (currentByte!11764 thiss!1005) (currentBit!11759 thiss!1005))))))

(assert (=> b!246113 (= lt!383968 (readBitPure!0 lt!383973))))

(assert (=> b!246113 (= lt!383973 (BitStream!10697 (buf!6368 (_2!11473 lt!383979)) (currentByte!11764 thiss!1005) (currentBit!11759 thiss!1005)))))

(assert (=> b!246113 e!170494))

(declare-fun res!205842 () Bool)

(assert (=> b!246113 (=> (not res!205842) (not e!170494))))

(assert (=> b!246113 (= res!205842 (isPrefixOf!0 thiss!1005 (_2!11473 lt!383977)))))

(declare-fun lt!383967 () Unit!17886)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10696 BitStream!10696 BitStream!10696) Unit!17886)

(assert (=> b!246113 (= lt!383967 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11473 lt!383979) (_2!11473 lt!383977)))))

(assert (=> b!246113 e!170495))

(declare-fun res!205837 () Bool)

(assert (=> b!246113 (=> (not res!205837) (not e!170495))))

(assert (=> b!246113 (= res!205837 (= (size!5887 (buf!6368 (_2!11473 lt!383979))) (size!5887 (buf!6368 (_2!11473 lt!383977)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10696 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21102)

(assert (=> b!246113 (= lt!383977 (appendNBitsLoop!0 (_2!11473 lt!383979) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246113 (validate_offset_bits!1 ((_ sign_extend 32) (size!5887 (buf!6368 (_2!11473 lt!383979)))) ((_ sign_extend 32) (currentByte!11764 (_2!11473 lt!383979))) ((_ sign_extend 32) (currentBit!11759 (_2!11473 lt!383979))) lt!383961)))

(assert (=> b!246113 (= lt!383961 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!383962 () Unit!17886)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10696 BitStream!10696 (_ BitVec 64) (_ BitVec 64)) Unit!17886)

(assert (=> b!246113 (= lt!383962 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11473 lt!383979) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!246113 e!170493))

(declare-fun res!205843 () Bool)

(assert (=> b!246113 (=> (not res!205843) (not e!170493))))

(assert (=> b!246113 (= res!205843 (= (size!5887 (buf!6368 thiss!1005)) (size!5887 (buf!6368 (_2!11473 lt!383979)))))))

(declare-fun appendBit!0 (BitStream!10696 Bool) tuple2!21102)

(assert (=> b!246113 (= lt!383979 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246114 () Bool)

(declare-fun res!205838 () Bool)

(assert (=> b!246114 (=> (not res!205838) (not e!170494))))

(assert (=> b!246114 (= res!205838 (invariant!0 (currentBit!11759 thiss!1005) (currentByte!11764 thiss!1005) (size!5887 (buf!6368 (_2!11473 lt!383979)))))))

(declare-fun b!246115 () Bool)

(assert (=> b!246115 (= e!170497 (= (_2!11474 lt!383968) (_2!11474 lt!383971)))))

(declare-fun b!246116 () Bool)

(declare-fun res!205849 () Bool)

(assert (=> b!246116 (=> res!205849 e!170499)))

(declare-fun withMovedBitIndex!0 (BitStream!10696 (_ BitVec 64)) BitStream!10696)

(assert (=> b!246116 (= res!205849 (not (= (_1!11475 lt!383972) (withMovedBitIndex!0 (_1!11475 lt!383969) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!53102 res!205840) b!246108))

(assert (= (and b!246108 res!205846) b!246111))

(assert (= (and b!246111 res!205851) b!246113))

(assert (= (and b!246113 res!205843) b!246105))

(assert (= (and b!246105 res!205848) b!246100))

(assert (= (and b!246100 res!205839) b!246112))

(assert (= (and b!246112 res!205845) b!246110))

(assert (= (and b!246113 res!205837) b!246109))

(assert (= (and b!246109 res!205847) b!246101))

(assert (= (and b!246101 res!205850) b!246102))

(assert (= (and b!246113 res!205842) b!246114))

(assert (= (and b!246114 res!205838) b!246107))

(assert (= (and b!246113 res!205844) b!246115))

(assert (= (and b!246113 (not res!205836)) b!246116))

(assert (= (and b!246116 (not res!205849)) b!246106))

(assert (= (and b!246106 (not res!205841)) b!246104))

(assert (= start!53102 b!246103))

(declare-fun m!371183 () Bool)

(assert (=> b!246107 m!371183))

(declare-fun m!371185 () Bool)

(assert (=> b!246102 m!371185))

(declare-fun m!371187 () Bool)

(assert (=> b!246102 m!371187))

(declare-fun m!371189 () Bool)

(assert (=> b!246102 m!371189))

(declare-fun m!371191 () Bool)

(assert (=> b!246102 m!371191))

(declare-fun m!371193 () Bool)

(assert (=> start!53102 m!371193))

(declare-fun m!371195 () Bool)

(assert (=> b!246110 m!371195))

(declare-fun m!371197 () Bool)

(assert (=> b!246112 m!371197))

(assert (=> b!246112 m!371197))

(declare-fun m!371199 () Bool)

(assert (=> b!246112 m!371199))

(declare-fun m!371201 () Bool)

(assert (=> b!246100 m!371201))

(declare-fun m!371203 () Bool)

(assert (=> b!246116 m!371203))

(declare-fun m!371205 () Bool)

(assert (=> b!246104 m!371205))

(declare-fun m!371207 () Bool)

(assert (=> b!246104 m!371207))

(declare-fun m!371209 () Bool)

(assert (=> b!246114 m!371209))

(declare-fun m!371211 () Bool)

(assert (=> b!246103 m!371211))

(declare-fun m!371213 () Bool)

(assert (=> b!246113 m!371213))

(declare-fun m!371215 () Bool)

(assert (=> b!246113 m!371215))

(declare-fun m!371217 () Bool)

(assert (=> b!246113 m!371217))

(declare-fun m!371219 () Bool)

(assert (=> b!246113 m!371219))

(declare-fun m!371221 () Bool)

(assert (=> b!246113 m!371221))

(declare-fun m!371223 () Bool)

(assert (=> b!246113 m!371223))

(declare-fun m!371225 () Bool)

(assert (=> b!246113 m!371225))

(declare-fun m!371227 () Bool)

(assert (=> b!246113 m!371227))

(declare-fun m!371229 () Bool)

(assert (=> b!246113 m!371229))

(assert (=> b!246113 m!371191))

(declare-fun m!371231 () Bool)

(assert (=> b!246113 m!371231))

(declare-fun m!371233 () Bool)

(assert (=> b!246113 m!371233))

(declare-fun m!371235 () Bool)

(assert (=> b!246113 m!371235))

(declare-fun m!371237 () Bool)

(assert (=> b!246113 m!371237))

(declare-fun m!371239 () Bool)

(assert (=> b!246113 m!371239))

(declare-fun m!371241 () Bool)

(assert (=> b!246113 m!371241))

(declare-fun m!371243 () Bool)

(assert (=> b!246113 m!371243))

(declare-fun m!371245 () Bool)

(assert (=> b!246113 m!371245))

(declare-fun m!371247 () Bool)

(assert (=> b!246113 m!371247))

(declare-fun m!371249 () Bool)

(assert (=> b!246113 m!371249))

(declare-fun m!371251 () Bool)

(assert (=> b!246101 m!371251))

(assert (=> b!246109 m!371205))

(declare-fun m!371253 () Bool)

(assert (=> b!246109 m!371253))

(declare-fun m!371255 () Bool)

(assert (=> b!246108 m!371255))

(assert (=> b!246105 m!371253))

(assert (=> b!246105 m!371207))

(push 1)

(assert (not b!246116))

(assert (not b!246104))

(assert (not b!246108))

(assert (not b!246102))

(assert (not b!246101))

