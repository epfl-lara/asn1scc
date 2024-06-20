; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54088 () Bool)

(assert start!54088)

(declare-fun b!252124 () Bool)

(declare-fun res!211206 () Bool)

(declare-fun e!174704 () Bool)

(assert (=> b!252124 (=> (not res!211206) (not e!174704))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13712 0))(
  ( (array!13713 (arr!7002 (Array (_ BitVec 32) (_ BitVec 8))) (size!6015 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10952 0))(
  ( (BitStream!10953 (buf!6517 array!13712) (currentByte!11972 (_ BitVec 32)) (currentBit!11967 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10952)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252124 (= res!211206 (validate_offset_bits!1 ((_ sign_extend 32) (size!6015 (buf!6517 thiss!1005))) ((_ sign_extend 32) (currentByte!11972 thiss!1005)) ((_ sign_extend 32) (currentBit!11967 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!211200 () Bool)

(assert (=> start!54088 (=> (not res!211200) (not e!174704))))

(assert (=> start!54088 (= res!211200 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54088 e!174704))

(assert (=> start!54088 true))

(declare-fun e!174707 () Bool)

(declare-fun inv!12 (BitStream!10952) Bool)

(assert (=> start!54088 (and (inv!12 thiss!1005) e!174707)))

(declare-fun b!252125 () Bool)

(declare-fun e!174706 () Bool)

(declare-fun e!174702 () Bool)

(assert (=> b!252125 (= e!174706 e!174702)))

(declare-fun res!211212 () Bool)

(assert (=> b!252125 (=> (not res!211212) (not e!174702))))

(declare-datatypes ((tuple2!21660 0))(
  ( (tuple2!21661 (_1!11758 BitStream!10952) (_2!11758 Bool)) )
))
(declare-fun lt!391666 () tuple2!21660)

(declare-fun bit!26 () Bool)

(declare-datatypes ((Unit!18178 0))(
  ( (Unit!18179) )
))
(declare-datatypes ((tuple2!21662 0))(
  ( (tuple2!21663 (_1!11759 Unit!18178) (_2!11759 BitStream!10952)) )
))
(declare-fun lt!391660 () tuple2!21662)

(assert (=> b!252125 (= res!211212 (and (= (_2!11758 lt!391666) bit!26) (= (_1!11758 lt!391666) (_2!11759 lt!391660))))))

(declare-fun readBitPure!0 (BitStream!10952) tuple2!21660)

(declare-fun readerFrom!0 (BitStream!10952 (_ BitVec 32) (_ BitVec 32)) BitStream!10952)

(assert (=> b!252125 (= lt!391666 (readBitPure!0 (readerFrom!0 (_2!11759 lt!391660) (currentBit!11967 thiss!1005) (currentByte!11972 thiss!1005))))))

(declare-fun b!252126 () Bool)

(declare-fun e!174705 () Bool)

(declare-fun e!174709 () Bool)

(assert (=> b!252126 (= e!174705 e!174709)))

(declare-fun res!211201 () Bool)

(assert (=> b!252126 (=> (not res!211201) (not e!174709))))

(declare-fun lt!391667 () tuple2!21662)

(declare-fun lt!391654 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252126 (= res!211201 (= (bitIndex!0 (size!6015 (buf!6517 (_2!11759 lt!391667))) (currentByte!11972 (_2!11759 lt!391667)) (currentBit!11967 (_2!11759 lt!391667))) (bvadd (bitIndex!0 (size!6015 (buf!6517 (_2!11759 lt!391660))) (currentByte!11972 (_2!11759 lt!391660)) (currentBit!11967 (_2!11759 lt!391660))) lt!391654)))))

(assert (=> b!252126 (= lt!391654 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252127 () Bool)

(declare-fun lt!391656 () (_ BitVec 64))

(assert (=> b!252127 (= e!174702 (= (bitIndex!0 (size!6015 (buf!6517 (_1!11758 lt!391666))) (currentByte!11972 (_1!11758 lt!391666)) (currentBit!11967 (_1!11758 lt!391666))) lt!391656))))

(declare-fun b!252128 () Bool)

(declare-fun res!211205 () Bool)

(assert (=> b!252128 (=> (not res!211205) (not e!174706))))

(declare-fun isPrefixOf!0 (BitStream!10952 BitStream!10952) Bool)

(assert (=> b!252128 (= res!211205 (isPrefixOf!0 thiss!1005 (_2!11759 lt!391660)))))

(declare-fun b!252129 () Bool)

(declare-fun e!174701 () Bool)

(assert (=> b!252129 (= e!174701 e!174706)))

(declare-fun res!211211 () Bool)

(assert (=> b!252129 (=> (not res!211211) (not e!174706))))

(declare-fun lt!391661 () (_ BitVec 64))

(assert (=> b!252129 (= res!211211 (= lt!391656 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391661)))))

(assert (=> b!252129 (= lt!391656 (bitIndex!0 (size!6015 (buf!6517 (_2!11759 lt!391660))) (currentByte!11972 (_2!11759 lt!391660)) (currentBit!11967 (_2!11759 lt!391660))))))

(assert (=> b!252129 (= lt!391661 (bitIndex!0 (size!6015 (buf!6517 thiss!1005)) (currentByte!11972 thiss!1005) (currentBit!11967 thiss!1005)))))

(declare-fun b!252130 () Bool)

(declare-fun array_inv!5756 (array!13712) Bool)

(assert (=> b!252130 (= e!174707 (array_inv!5756 (buf!6517 thiss!1005)))))

(declare-fun b!252131 () Bool)

(declare-fun e!174708 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252131 (= e!174708 (invariant!0 (currentBit!11967 thiss!1005) (currentByte!11972 thiss!1005) (size!6015 (buf!6517 (_2!11759 lt!391667)))))))

(declare-fun b!252132 () Bool)

(declare-fun lt!391648 () (_ BitVec 64))

(declare-fun lt!391649 () (_ BitVec 64))

(assert (=> b!252132 (= e!174704 (not (or (= lt!391648 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!391648 (bvand lt!391649 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!252132 (= lt!391648 (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!391657 () tuple2!21660)

(declare-datatypes ((tuple2!21664 0))(
  ( (tuple2!21665 (_1!11760 BitStream!10952) (_2!11760 BitStream!10952)) )
))
(declare-fun lt!391652 () tuple2!21664)

(declare-fun checkBitsLoopPure!0 (BitStream!10952 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21660)

(assert (=> b!252132 (= lt!391657 (checkBitsLoopPure!0 (_1!11760 lt!391652) nBits!297 bit!26 from!289))))

(assert (=> b!252132 (validate_offset_bits!1 ((_ sign_extend 32) (size!6015 (buf!6517 (_2!11759 lt!391667)))) ((_ sign_extend 32) (currentByte!11972 thiss!1005)) ((_ sign_extend 32) (currentBit!11967 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391663 () Unit!18178)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10952 array!13712 (_ BitVec 64)) Unit!18178)

(assert (=> b!252132 (= lt!391663 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6517 (_2!11759 lt!391667)) (bvsub nBits!297 from!289)))))

(assert (=> b!252132 (= (_2!11758 (readBitPure!0 (_1!11760 lt!391652))) bit!26)))

(declare-fun lt!391658 () tuple2!21664)

(declare-fun reader!0 (BitStream!10952 BitStream!10952) tuple2!21664)

(assert (=> b!252132 (= lt!391658 (reader!0 (_2!11759 lt!391660) (_2!11759 lt!391667)))))

(assert (=> b!252132 (= lt!391652 (reader!0 thiss!1005 (_2!11759 lt!391667)))))

(declare-fun e!174703 () Bool)

(assert (=> b!252132 e!174703))

(declare-fun res!211204 () Bool)

(assert (=> b!252132 (=> (not res!211204) (not e!174703))))

(declare-fun lt!391659 () tuple2!21660)

(declare-fun lt!391668 () tuple2!21660)

(assert (=> b!252132 (= res!211204 (= (bitIndex!0 (size!6015 (buf!6517 (_1!11758 lt!391659))) (currentByte!11972 (_1!11758 lt!391659)) (currentBit!11967 (_1!11758 lt!391659))) (bitIndex!0 (size!6015 (buf!6517 (_1!11758 lt!391668))) (currentByte!11972 (_1!11758 lt!391668)) (currentBit!11967 (_1!11758 lt!391668)))))))

(declare-fun lt!391651 () Unit!18178)

(declare-fun lt!391655 () BitStream!10952)

(declare-fun readBitPrefixLemma!0 (BitStream!10952 BitStream!10952) Unit!18178)

(assert (=> b!252132 (= lt!391651 (readBitPrefixLemma!0 lt!391655 (_2!11759 lt!391667)))))

(assert (=> b!252132 (= lt!391668 (readBitPure!0 (BitStream!10953 (buf!6517 (_2!11759 lt!391667)) (currentByte!11972 thiss!1005) (currentBit!11967 thiss!1005))))))

(assert (=> b!252132 (= lt!391659 (readBitPure!0 lt!391655))))

(assert (=> b!252132 (= lt!391655 (BitStream!10953 (buf!6517 (_2!11759 lt!391660)) (currentByte!11972 thiss!1005) (currentBit!11967 thiss!1005)))))

(assert (=> b!252132 e!174708))

(declare-fun res!211202 () Bool)

(assert (=> b!252132 (=> (not res!211202) (not e!174708))))

(assert (=> b!252132 (= res!211202 (isPrefixOf!0 thiss!1005 (_2!11759 lt!391667)))))

(declare-fun lt!391653 () Unit!18178)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10952 BitStream!10952 BitStream!10952) Unit!18178)

(assert (=> b!252132 (= lt!391653 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11759 lt!391660) (_2!11759 lt!391667)))))

(assert (=> b!252132 e!174705))

(declare-fun res!211203 () Bool)

(assert (=> b!252132 (=> (not res!211203) (not e!174705))))

(assert (=> b!252132 (= res!211203 (= (size!6015 (buf!6517 (_2!11759 lt!391660))) (size!6015 (buf!6517 (_2!11759 lt!391667)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10952 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21662)

(assert (=> b!252132 (= lt!391667 (appendNBitsLoop!0 (_2!11759 lt!391660) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252132 (validate_offset_bits!1 ((_ sign_extend 32) (size!6015 (buf!6517 (_2!11759 lt!391660)))) ((_ sign_extend 32) (currentByte!11972 (_2!11759 lt!391660))) ((_ sign_extend 32) (currentBit!11967 (_2!11759 lt!391660))) lt!391649)))

(assert (=> b!252132 (= lt!391649 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391650 () Unit!18178)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10952 BitStream!10952 (_ BitVec 64) (_ BitVec 64)) Unit!18178)

(assert (=> b!252132 (= lt!391650 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11759 lt!391660) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252132 e!174701))

(declare-fun res!211207 () Bool)

(assert (=> b!252132 (=> (not res!211207) (not e!174701))))

(assert (=> b!252132 (= res!211207 (= (size!6015 (buf!6517 thiss!1005)) (size!6015 (buf!6517 (_2!11759 lt!391660)))))))

(declare-fun appendBit!0 (BitStream!10952 Bool) tuple2!21662)

(assert (=> b!252132 (= lt!391660 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252133 () Bool)

(declare-fun res!211210 () Bool)

(assert (=> b!252133 (=> (not res!211210) (not e!174709))))

(assert (=> b!252133 (= res!211210 (isPrefixOf!0 (_2!11759 lt!391660) (_2!11759 lt!391667)))))

(declare-fun b!252134 () Bool)

(declare-fun res!211209 () Bool)

(assert (=> b!252134 (=> (not res!211209) (not e!174708))))

(assert (=> b!252134 (= res!211209 (invariant!0 (currentBit!11967 thiss!1005) (currentByte!11972 thiss!1005) (size!6015 (buf!6517 (_2!11759 lt!391660)))))))

(declare-fun b!252135 () Bool)

(declare-fun res!211208 () Bool)

(assert (=> b!252135 (=> (not res!211208) (not e!174704))))

(assert (=> b!252135 (= res!211208 (bvslt from!289 nBits!297))))

(declare-fun b!252136 () Bool)

(declare-fun lt!391664 () tuple2!21660)

(declare-fun lt!391665 () tuple2!21664)

(assert (=> b!252136 (= e!174709 (not (or (not (_2!11758 lt!391664)) (not (= (_1!11758 lt!391664) (_2!11760 lt!391665))))))))

(assert (=> b!252136 (= lt!391664 (checkBitsLoopPure!0 (_1!11760 lt!391665) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252136 (validate_offset_bits!1 ((_ sign_extend 32) (size!6015 (buf!6517 (_2!11759 lt!391667)))) ((_ sign_extend 32) (currentByte!11972 (_2!11759 lt!391660))) ((_ sign_extend 32) (currentBit!11967 (_2!11759 lt!391660))) lt!391654)))

(declare-fun lt!391662 () Unit!18178)

(assert (=> b!252136 (= lt!391662 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11759 lt!391660) (buf!6517 (_2!11759 lt!391667)) lt!391654))))

(assert (=> b!252136 (= lt!391665 (reader!0 (_2!11759 lt!391660) (_2!11759 lt!391667)))))

(declare-fun b!252137 () Bool)

(assert (=> b!252137 (= e!174703 (= (_2!11758 lt!391659) (_2!11758 lt!391668)))))

(assert (= (and start!54088 res!211200) b!252124))

(assert (= (and b!252124 res!211206) b!252135))

(assert (= (and b!252135 res!211208) b!252132))

(assert (= (and b!252132 res!211207) b!252129))

(assert (= (and b!252129 res!211211) b!252128))

(assert (= (and b!252128 res!211205) b!252125))

(assert (= (and b!252125 res!211212) b!252127))

(assert (= (and b!252132 res!211203) b!252126))

(assert (= (and b!252126 res!211201) b!252133))

(assert (= (and b!252133 res!211210) b!252136))

(assert (= (and b!252132 res!211202) b!252134))

(assert (= (and b!252134 res!211209) b!252131))

(assert (= (and b!252132 res!211204) b!252137))

(assert (= start!54088 b!252130))

(declare-fun m!379317 () Bool)

(assert (=> b!252136 m!379317))

(declare-fun m!379319 () Bool)

(assert (=> b!252136 m!379319))

(declare-fun m!379321 () Bool)

(assert (=> b!252136 m!379321))

(declare-fun m!379323 () Bool)

(assert (=> b!252136 m!379323))

(declare-fun m!379325 () Bool)

(assert (=> b!252127 m!379325))

(declare-fun m!379327 () Bool)

(assert (=> b!252131 m!379327))

(declare-fun m!379329 () Bool)

(assert (=> b!252133 m!379329))

(declare-fun m!379331 () Bool)

(assert (=> b!252130 m!379331))

(declare-fun m!379333 () Bool)

(assert (=> b!252128 m!379333))

(declare-fun m!379335 () Bool)

(assert (=> b!252125 m!379335))

(assert (=> b!252125 m!379335))

(declare-fun m!379337 () Bool)

(assert (=> b!252125 m!379337))

(declare-fun m!379339 () Bool)

(assert (=> b!252132 m!379339))

(declare-fun m!379341 () Bool)

(assert (=> b!252132 m!379341))

(declare-fun m!379343 () Bool)

(assert (=> b!252132 m!379343))

(declare-fun m!379345 () Bool)

(assert (=> b!252132 m!379345))

(declare-fun m!379347 () Bool)

(assert (=> b!252132 m!379347))

(declare-fun m!379349 () Bool)

(assert (=> b!252132 m!379349))

(declare-fun m!379351 () Bool)

(assert (=> b!252132 m!379351))

(declare-fun m!379353 () Bool)

(assert (=> b!252132 m!379353))

(declare-fun m!379355 () Bool)

(assert (=> b!252132 m!379355))

(declare-fun m!379357 () Bool)

(assert (=> b!252132 m!379357))

(declare-fun m!379359 () Bool)

(assert (=> b!252132 m!379359))

(declare-fun m!379361 () Bool)

(assert (=> b!252132 m!379361))

(declare-fun m!379363 () Bool)

(assert (=> b!252132 m!379363))

(declare-fun m!379365 () Bool)

(assert (=> b!252132 m!379365))

(assert (=> b!252132 m!379323))

(declare-fun m!379367 () Bool)

(assert (=> b!252132 m!379367))

(declare-fun m!379369 () Bool)

(assert (=> b!252132 m!379369))

(declare-fun m!379371 () Bool)

(assert (=> b!252134 m!379371))

(declare-fun m!379373 () Bool)

(assert (=> b!252124 m!379373))

(declare-fun m!379375 () Bool)

(assert (=> start!54088 m!379375))

(declare-fun m!379377 () Bool)

(assert (=> b!252129 m!379377))

(declare-fun m!379379 () Bool)

(assert (=> b!252129 m!379379))

(declare-fun m!379381 () Bool)

(assert (=> b!252126 m!379381))

(assert (=> b!252126 m!379377))

(push 1)

(assert (not b!252130))

(assert (not start!54088))

(assert (not b!252129))

(assert (not b!252125))

(assert (not b!252136))

(assert (not b!252131))

(assert (not b!252126))

(assert (not b!252133))

(assert (not b!252128))

(assert (not b!252124))

(assert (not b!252134))

(assert (not b!252132))

(assert (not b!252127))

(check-sat)

(pop 1)

(push 1)

(check-sat)

