; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53104 () Bool)

(assert start!53104)

(declare-fun b!246151 () Bool)

(declare-fun e!170529 () Bool)

(declare-fun e!170526 () Bool)

(assert (=> b!246151 (= e!170529 (not e!170526))))

(declare-fun res!205893 () Bool)

(assert (=> b!246151 (=> res!205893 e!170526)))

(declare-datatypes ((array!13432 0))(
  ( (array!13433 (arr!6875 (Array (_ BitVec 32) (_ BitVec 8))) (size!5888 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10698 0))(
  ( (BitStream!10699 (buf!6369 array!13432) (currentByte!11765 (_ BitVec 32)) (currentBit!11760 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21108 0))(
  ( (tuple2!21109 (_1!11476 BitStream!10698) (_2!11476 Bool)) )
))
(declare-fun lt!384044 () tuple2!21108)

(declare-datatypes ((tuple2!21110 0))(
  ( (tuple2!21111 (_1!11477 BitStream!10698) (_2!11477 BitStream!10698)) )
))
(declare-fun lt!384031 () tuple2!21110)

(assert (=> b!246151 (= res!205893 (not (= (_1!11476 lt!384044) (_2!11477 lt!384031))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10698 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21108)

(assert (=> b!246151 (= lt!384044 (checkBitsLoopPure!0 (_1!11477 lt!384031) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!17888 0))(
  ( (Unit!17889) )
))
(declare-datatypes ((tuple2!21112 0))(
  ( (tuple2!21113 (_1!11478 Unit!17888) (_2!11478 BitStream!10698)) )
))
(declare-fun lt!384051 () tuple2!21112)

(declare-fun lt!384052 () tuple2!21112)

(declare-fun lt!384033 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246151 (validate_offset_bits!1 ((_ sign_extend 32) (size!5888 (buf!6369 (_2!11478 lt!384051)))) ((_ sign_extend 32) (currentByte!11765 (_2!11478 lt!384052))) ((_ sign_extend 32) (currentBit!11760 (_2!11478 lt!384052))) lt!384033)))

(declare-fun lt!384047 () Unit!17888)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10698 array!13432 (_ BitVec 64)) Unit!17888)

(assert (=> b!246151 (= lt!384047 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11478 lt!384052) (buf!6369 (_2!11478 lt!384051)) lt!384033))))

(declare-fun lt!384039 () tuple2!21108)

(declare-fun lt!384049 () tuple2!21110)

(assert (=> b!246151 (= lt!384039 (checkBitsLoopPure!0 (_1!11477 lt!384049) nBits!297 bit!26 from!289))))

(declare-fun thiss!1005 () BitStream!10698)

(assert (=> b!246151 (validate_offset_bits!1 ((_ sign_extend 32) (size!5888 (buf!6369 (_2!11478 lt!384051)))) ((_ sign_extend 32) (currentByte!11765 thiss!1005)) ((_ sign_extend 32) (currentBit!11760 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384032 () Unit!17888)

(assert (=> b!246151 (= lt!384032 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6369 (_2!11478 lt!384051)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10698) tuple2!21108)

(assert (=> b!246151 (= (_2!11476 (readBitPure!0 (_1!11477 lt!384049))) bit!26)))

(declare-fun reader!0 (BitStream!10698 BitStream!10698) tuple2!21110)

(assert (=> b!246151 (= lt!384031 (reader!0 (_2!11478 lt!384052) (_2!11478 lt!384051)))))

(assert (=> b!246151 (= lt!384049 (reader!0 thiss!1005 (_2!11478 lt!384051)))))

(declare-fun e!170533 () Bool)

(assert (=> b!246151 e!170533))

(declare-fun res!205887 () Bool)

(assert (=> b!246151 (=> (not res!205887) (not e!170533))))

(declare-fun lt!384038 () tuple2!21108)

(declare-fun lt!384043 () tuple2!21108)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246151 (= res!205887 (= (bitIndex!0 (size!5888 (buf!6369 (_1!11476 lt!384038))) (currentByte!11765 (_1!11476 lt!384038)) (currentBit!11760 (_1!11476 lt!384038))) (bitIndex!0 (size!5888 (buf!6369 (_1!11476 lt!384043))) (currentByte!11765 (_1!11476 lt!384043)) (currentBit!11760 (_1!11476 lt!384043)))))))

(declare-fun lt!384053 () Unit!17888)

(declare-fun lt!384042 () BitStream!10698)

(declare-fun readBitPrefixLemma!0 (BitStream!10698 BitStream!10698) Unit!17888)

(assert (=> b!246151 (= lt!384053 (readBitPrefixLemma!0 lt!384042 (_2!11478 lt!384051)))))

(assert (=> b!246151 (= lt!384043 (readBitPure!0 (BitStream!10699 (buf!6369 (_2!11478 lt!384051)) (currentByte!11765 thiss!1005) (currentBit!11760 thiss!1005))))))

(assert (=> b!246151 (= lt!384038 (readBitPure!0 lt!384042))))

(assert (=> b!246151 (= lt!384042 (BitStream!10699 (buf!6369 (_2!11478 lt!384052)) (currentByte!11765 thiss!1005) (currentBit!11760 thiss!1005)))))

(declare-fun e!170536 () Bool)

(assert (=> b!246151 e!170536))

(declare-fun res!205892 () Bool)

(assert (=> b!246151 (=> (not res!205892) (not e!170536))))

(declare-fun isPrefixOf!0 (BitStream!10698 BitStream!10698) Bool)

(assert (=> b!246151 (= res!205892 (isPrefixOf!0 thiss!1005 (_2!11478 lt!384051)))))

(declare-fun lt!384050 () Unit!17888)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10698 BitStream!10698 BitStream!10698) Unit!17888)

(assert (=> b!246151 (= lt!384050 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11478 lt!384052) (_2!11478 lt!384051)))))

(declare-fun e!170534 () Bool)

(assert (=> b!246151 e!170534))

(declare-fun res!205889 () Bool)

(assert (=> b!246151 (=> (not res!205889) (not e!170534))))

(assert (=> b!246151 (= res!205889 (= (size!5888 (buf!6369 (_2!11478 lt!384052))) (size!5888 (buf!6369 (_2!11478 lt!384051)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10698 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21112)

(assert (=> b!246151 (= lt!384051 (appendNBitsLoop!0 (_2!11478 lt!384052) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246151 (validate_offset_bits!1 ((_ sign_extend 32) (size!5888 (buf!6369 (_2!11478 lt!384052)))) ((_ sign_extend 32) (currentByte!11765 (_2!11478 lt!384052))) ((_ sign_extend 32) (currentBit!11760 (_2!11478 lt!384052))) lt!384033)))

(assert (=> b!246151 (= lt!384033 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384045 () Unit!17888)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10698 BitStream!10698 (_ BitVec 64) (_ BitVec 64)) Unit!17888)

(assert (=> b!246151 (= lt!384045 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11478 lt!384052) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170532 () Bool)

(assert (=> b!246151 e!170532))

(declare-fun res!205895 () Bool)

(assert (=> b!246151 (=> (not res!205895) (not e!170532))))

(assert (=> b!246151 (= res!205895 (= (size!5888 (buf!6369 thiss!1005)) (size!5888 (buf!6369 (_2!11478 lt!384052)))))))

(declare-fun appendBit!0 (BitStream!10698 Bool) tuple2!21112)

(assert (=> b!246151 (= lt!384052 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246152 () Bool)

(declare-fun res!205894 () Bool)

(assert (=> b!246152 (=> (not res!205894) (not e!170536))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246152 (= res!205894 (invariant!0 (currentBit!11760 thiss!1005) (currentByte!11765 thiss!1005) (size!5888 (buf!6369 (_2!11478 lt!384052)))))))

(declare-fun res!205899 () Bool)

(assert (=> start!53104 (=> (not res!205899) (not e!170529))))

(assert (=> start!53104 (= res!205899 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53104 e!170529))

(assert (=> start!53104 true))

(declare-fun e!170531 () Bool)

(declare-fun inv!12 (BitStream!10698) Bool)

(assert (=> start!53104 (and (inv!12 thiss!1005) e!170531)))

(declare-fun b!246153 () Bool)

(declare-fun e!170528 () Bool)

(declare-fun lt!384040 () tuple2!21108)

(declare-fun lt!384041 () tuple2!21110)

(assert (=> b!246153 (= e!170528 (not (or (not (_2!11476 lt!384040)) (not (= (_1!11476 lt!384040) (_2!11477 lt!384041))))))))

(assert (=> b!246153 (= lt!384040 (checkBitsLoopPure!0 (_1!11477 lt!384041) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384036 () (_ BitVec 64))

(assert (=> b!246153 (validate_offset_bits!1 ((_ sign_extend 32) (size!5888 (buf!6369 (_2!11478 lt!384051)))) ((_ sign_extend 32) (currentByte!11765 (_2!11478 lt!384052))) ((_ sign_extend 32) (currentBit!11760 (_2!11478 lt!384052))) lt!384036)))

(declare-fun lt!384035 () Unit!17888)

(assert (=> b!246153 (= lt!384035 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11478 lt!384052) (buf!6369 (_2!11478 lt!384051)) lt!384036))))

(assert (=> b!246153 (= lt!384041 (reader!0 (_2!11478 lt!384052) (_2!11478 lt!384051)))))

(declare-fun b!246154 () Bool)

(declare-fun res!205891 () Bool)

(assert (=> b!246154 (=> (not res!205891) (not e!170529))))

(assert (=> b!246154 (= res!205891 (validate_offset_bits!1 ((_ sign_extend 32) (size!5888 (buf!6369 thiss!1005))) ((_ sign_extend 32) (currentByte!11765 thiss!1005)) ((_ sign_extend 32) (currentBit!11760 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246155 () Bool)

(declare-fun array_inv!5629 (array!13432) Bool)

(assert (=> b!246155 (= e!170531 (array_inv!5629 (buf!6369 thiss!1005)))))

(declare-fun b!246156 () Bool)

(declare-fun res!205885 () Bool)

(declare-fun e!170535 () Bool)

(assert (=> b!246156 (=> (not res!205885) (not e!170535))))

(assert (=> b!246156 (= res!205885 (isPrefixOf!0 thiss!1005 (_2!11478 lt!384052)))))

(declare-fun b!246157 () Bool)

(declare-fun e!170530 () Bool)

(assert (=> b!246157 (= e!170530 true)))

(declare-fun lt!384037 () (_ BitVec 64))

(assert (=> b!246157 (= lt!384037 (bitIndex!0 (size!5888 (buf!6369 (_2!11478 lt!384051))) (currentByte!11765 (_2!11478 lt!384051)) (currentBit!11760 (_2!11478 lt!384051))))))

(declare-fun lt!384054 () (_ BitVec 64))

(assert (=> b!246157 (= lt!384054 (bitIndex!0 (size!5888 (buf!6369 thiss!1005)) (currentByte!11765 thiss!1005) (currentBit!11760 thiss!1005)))))

(declare-fun b!246158 () Bool)

(assert (=> b!246158 (= e!170532 e!170535)))

(declare-fun res!205897 () Bool)

(assert (=> b!246158 (=> (not res!205897) (not e!170535))))

(declare-fun lt!384034 () (_ BitVec 64))

(declare-fun lt!384048 () (_ BitVec 64))

(assert (=> b!246158 (= res!205897 (= lt!384034 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384048)))))

(assert (=> b!246158 (= lt!384034 (bitIndex!0 (size!5888 (buf!6369 (_2!11478 lt!384052))) (currentByte!11765 (_2!11478 lt!384052)) (currentBit!11760 (_2!11478 lt!384052))))))

(assert (=> b!246158 (= lt!384048 (bitIndex!0 (size!5888 (buf!6369 thiss!1005)) (currentByte!11765 thiss!1005) (currentBit!11760 thiss!1005)))))

(declare-fun b!246159 () Bool)

(declare-fun res!205890 () Bool)

(assert (=> b!246159 (=> (not res!205890) (not e!170529))))

(assert (=> b!246159 (= res!205890 (bvslt from!289 nBits!297))))

(declare-fun b!246160 () Bool)

(assert (=> b!246160 (= e!170536 (invariant!0 (currentBit!11760 thiss!1005) (currentByte!11765 thiss!1005) (size!5888 (buf!6369 (_2!11478 lt!384051)))))))

(declare-fun b!246161 () Bool)

(declare-fun e!170537 () Bool)

(assert (=> b!246161 (= e!170535 e!170537)))

(declare-fun res!205886 () Bool)

(assert (=> b!246161 (=> (not res!205886) (not e!170537))))

(declare-fun lt!384046 () tuple2!21108)

(assert (=> b!246161 (= res!205886 (and (= (_2!11476 lt!384046) bit!26) (= (_1!11476 lt!384046) (_2!11478 lt!384052))))))

(declare-fun readerFrom!0 (BitStream!10698 (_ BitVec 32) (_ BitVec 32)) BitStream!10698)

(assert (=> b!246161 (= lt!384046 (readBitPure!0 (readerFrom!0 (_2!11478 lt!384052) (currentBit!11760 thiss!1005) (currentByte!11765 thiss!1005))))))

(declare-fun b!246162 () Bool)

(assert (=> b!246162 (= e!170537 (= (bitIndex!0 (size!5888 (buf!6369 (_1!11476 lt!384046))) (currentByte!11765 (_1!11476 lt!384046)) (currentBit!11760 (_1!11476 lt!384046))) lt!384034))))

(declare-fun b!246163 () Bool)

(declare-fun res!205888 () Bool)

(assert (=> b!246163 (=> (not res!205888) (not e!170528))))

(assert (=> b!246163 (= res!205888 (isPrefixOf!0 (_2!11478 lt!384052) (_2!11478 lt!384051)))))

(declare-fun b!246164 () Bool)

(assert (=> b!246164 (= e!170534 e!170528)))

(declare-fun res!205884 () Bool)

(assert (=> b!246164 (=> (not res!205884) (not e!170528))))

(assert (=> b!246164 (= res!205884 (= (bitIndex!0 (size!5888 (buf!6369 (_2!11478 lt!384051))) (currentByte!11765 (_2!11478 lt!384051)) (currentBit!11760 (_2!11478 lt!384051))) (bvadd (bitIndex!0 (size!5888 (buf!6369 (_2!11478 lt!384052))) (currentByte!11765 (_2!11478 lt!384052)) (currentBit!11760 (_2!11478 lt!384052))) lt!384036)))))

(assert (=> b!246164 (= lt!384036 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246165 () Bool)

(assert (=> b!246165 (= e!170526 e!170530)))

(declare-fun res!205898 () Bool)

(assert (=> b!246165 (=> res!205898 e!170530)))

(assert (=> b!246165 (= res!205898 (not (= (size!5888 (buf!6369 thiss!1005)) (size!5888 (buf!6369 (_2!11478 lt!384051))))))))

(assert (=> b!246165 (and (= (_2!11476 lt!384039) (_2!11476 lt!384044)) (= (_1!11476 lt!384039) (_2!11477 lt!384049)))))

(declare-fun b!246166 () Bool)

(assert (=> b!246166 (= e!170533 (= (_2!11476 lt!384038) (_2!11476 lt!384043)))))

(declare-fun b!246167 () Bool)

(declare-fun res!205896 () Bool)

(assert (=> b!246167 (=> res!205896 e!170526)))

(declare-fun withMovedBitIndex!0 (BitStream!10698 (_ BitVec 64)) BitStream!10698)

(assert (=> b!246167 (= res!205896 (not (= (_1!11477 lt!384031) (withMovedBitIndex!0 (_1!11477 lt!384049) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!53104 res!205899) b!246154))

(assert (= (and b!246154 res!205891) b!246159))

(assert (= (and b!246159 res!205890) b!246151))

(assert (= (and b!246151 res!205895) b!246158))

(assert (= (and b!246158 res!205897) b!246156))

(assert (= (and b!246156 res!205885) b!246161))

(assert (= (and b!246161 res!205886) b!246162))

(assert (= (and b!246151 res!205889) b!246164))

(assert (= (and b!246164 res!205884) b!246163))

(assert (= (and b!246163 res!205888) b!246153))

(assert (= (and b!246151 res!205892) b!246152))

(assert (= (and b!246152 res!205894) b!246160))

(assert (= (and b!246151 res!205887) b!246166))

(assert (= (and b!246151 (not res!205893)) b!246167))

(assert (= (and b!246167 (not res!205896)) b!246165))

(assert (= (and b!246165 (not res!205898)) b!246157))

(assert (= start!53104 b!246155))

(declare-fun m!371257 () Bool)

(assert (=> b!246158 m!371257))

(declare-fun m!371259 () Bool)

(assert (=> b!246158 m!371259))

(declare-fun m!371261 () Bool)

(assert (=> b!246164 m!371261))

(assert (=> b!246164 m!371257))

(declare-fun m!371263 () Bool)

(assert (=> b!246153 m!371263))

(declare-fun m!371265 () Bool)

(assert (=> b!246153 m!371265))

(declare-fun m!371267 () Bool)

(assert (=> b!246153 m!371267))

(declare-fun m!371269 () Bool)

(assert (=> b!246153 m!371269))

(declare-fun m!371271 () Bool)

(assert (=> start!53104 m!371271))

(declare-fun m!371273 () Bool)

(assert (=> b!246156 m!371273))

(declare-fun m!371275 () Bool)

(assert (=> b!246155 m!371275))

(declare-fun m!371277 () Bool)

(assert (=> b!246161 m!371277))

(assert (=> b!246161 m!371277))

(declare-fun m!371279 () Bool)

(assert (=> b!246161 m!371279))

(declare-fun m!371281 () Bool)

(assert (=> b!246167 m!371281))

(assert (=> b!246157 m!371261))

(assert (=> b!246157 m!371259))

(declare-fun m!371283 () Bool)

(assert (=> b!246152 m!371283))

(declare-fun m!371285 () Bool)

(assert (=> b!246162 m!371285))

(declare-fun m!371287 () Bool)

(assert (=> b!246160 m!371287))

(declare-fun m!371289 () Bool)

(assert (=> b!246163 m!371289))

(declare-fun m!371291 () Bool)

(assert (=> b!246151 m!371291))

(declare-fun m!371293 () Bool)

(assert (=> b!246151 m!371293))

(declare-fun m!371295 () Bool)

(assert (=> b!246151 m!371295))

(declare-fun m!371297 () Bool)

(assert (=> b!246151 m!371297))

(declare-fun m!371299 () Bool)

(assert (=> b!246151 m!371299))

(declare-fun m!371301 () Bool)

(assert (=> b!246151 m!371301))

(declare-fun m!371303 () Bool)

(assert (=> b!246151 m!371303))

(declare-fun m!371305 () Bool)

(assert (=> b!246151 m!371305))

(declare-fun m!371307 () Bool)

(assert (=> b!246151 m!371307))

(assert (=> b!246151 m!371269))

(declare-fun m!371309 () Bool)

(assert (=> b!246151 m!371309))

(declare-fun m!371311 () Bool)

(assert (=> b!246151 m!371311))

(declare-fun m!371313 () Bool)

(assert (=> b!246151 m!371313))

(declare-fun m!371315 () Bool)

(assert (=> b!246151 m!371315))

(declare-fun m!371317 () Bool)

(assert (=> b!246151 m!371317))

(declare-fun m!371319 () Bool)

(assert (=> b!246151 m!371319))

(declare-fun m!371321 () Bool)

(assert (=> b!246151 m!371321))

(declare-fun m!371323 () Bool)

(assert (=> b!246151 m!371323))

(declare-fun m!371325 () Bool)

(assert (=> b!246151 m!371325))

(declare-fun m!371327 () Bool)

(assert (=> b!246151 m!371327))

(declare-fun m!371329 () Bool)

(assert (=> b!246154 m!371329))

(check-sat (not b!246154) (not b!246157) (not b!246153) (not b!246151) (not b!246164) (not b!246163) (not b!246160) (not b!246152) (not b!246162) (not b!246158) (not b!246161) (not start!53104) (not b!246155) (not b!246167) (not b!246156))
