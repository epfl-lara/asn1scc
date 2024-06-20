; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52984 () Bool)

(assert start!52984)

(declare-fun b!245428 () Bool)

(declare-fun res!205219 () Bool)

(declare-fun e!170054 () Bool)

(assert (=> b!245428 (=> (not res!205219) (not e!170054))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13411 0))(
  ( (array!13412 (arr!6866 (Array (_ BitVec 32) (_ BitVec 8))) (size!5879 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10680 0))(
  ( (BitStream!10681 (buf!6357 array!13411) (currentByte!11747 (_ BitVec 32)) (currentBit!11742 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10680)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245428 (= res!205219 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 thiss!1005))) ((_ sign_extend 32) (currentByte!11747 thiss!1005)) ((_ sign_extend 32) (currentBit!11742 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!245429 () Bool)

(declare-fun res!205222 () Bool)

(declare-fun e!170052 () Bool)

(assert (=> b!245429 (=> (not res!205222) (not e!170052))))

(declare-datatypes ((Unit!17865 0))(
  ( (Unit!17866) )
))
(declare-datatypes ((tuple2!21048 0))(
  ( (tuple2!21049 (_1!11446 Unit!17865) (_2!11446 BitStream!10680)) )
))
(declare-fun lt!382817 () tuple2!21048)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245429 (= res!205222 (invariant!0 (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005) (size!5879 (buf!6357 (_2!11446 lt!382817)))))))

(declare-fun b!245430 () Bool)

(declare-fun res!205216 () Bool)

(declare-fun e!170057 () Bool)

(assert (=> b!245430 (=> (not res!205216) (not e!170057))))

(declare-fun isPrefixOf!0 (BitStream!10680 BitStream!10680) Bool)

(assert (=> b!245430 (= res!205216 (isPrefixOf!0 thiss!1005 (_2!11446 lt!382817)))))

(declare-fun b!245431 () Bool)

(declare-fun res!205221 () Bool)

(declare-fun e!170058 () Bool)

(assert (=> b!245431 (=> res!205221 e!170058)))

(declare-datatypes ((tuple2!21050 0))(
  ( (tuple2!21051 (_1!11447 BitStream!10680) (_2!11447 BitStream!10680)) )
))
(declare-fun lt!382813 () tuple2!21050)

(declare-fun lt!382806 () tuple2!21050)

(declare-fun withMovedBitIndex!0 (BitStream!10680 (_ BitVec 64)) BitStream!10680)

(assert (=> b!245431 (= res!205221 (not (= (_1!11447 lt!382813) (withMovedBitIndex!0 (_1!11447 lt!382806) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!245432 () Bool)

(declare-fun e!170056 () Bool)

(declare-datatypes ((tuple2!21052 0))(
  ( (tuple2!21053 (_1!11448 BitStream!10680) (_2!11448 Bool)) )
))
(declare-fun lt!382815 () tuple2!21052)

(declare-fun lt!382809 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!245432 (= e!170056 (= (bitIndex!0 (size!5879 (buf!6357 (_1!11448 lt!382815))) (currentByte!11747 (_1!11448 lt!382815)) (currentBit!11742 (_1!11448 lt!382815))) lt!382809))))

(declare-fun b!245433 () Bool)

(declare-fun res!205223 () Bool)

(declare-fun e!170063 () Bool)

(assert (=> b!245433 (=> (not res!205223) (not e!170063))))

(declare-fun lt!382804 () tuple2!21048)

(assert (=> b!245433 (= res!205223 (isPrefixOf!0 (_2!11446 lt!382817) (_2!11446 lt!382804)))))

(declare-fun b!245434 () Bool)

(declare-fun e!170061 () Bool)

(declare-fun array_inv!5620 (array!13411) Bool)

(assert (=> b!245434 (= e!170061 (array_inv!5620 (buf!6357 thiss!1005)))))

(declare-fun b!245435 () Bool)

(declare-fun e!170055 () Bool)

(assert (=> b!245435 (= e!170055 e!170057)))

(declare-fun res!205215 () Bool)

(assert (=> b!245435 (=> (not res!205215) (not e!170057))))

(declare-fun lt!382814 () (_ BitVec 64))

(assert (=> b!245435 (= res!205215 (= lt!382809 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!382814)))))

(assert (=> b!245435 (= lt!382809 (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382817))) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817))))))

(assert (=> b!245435 (= lt!382814 (bitIndex!0 (size!5879 (buf!6357 thiss!1005)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)))))

(declare-fun b!245436 () Bool)

(declare-fun lt!382797 () tuple2!21052)

(declare-fun lt!382816 () tuple2!21050)

(assert (=> b!245436 (= e!170063 (not (or (not (_2!11448 lt!382797)) (not (= (_1!11448 lt!382797) (_2!11447 lt!382816))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10680 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21052)

(assert (=> b!245436 (= lt!382797 (checkBitsLoopPure!0 (_1!11447 lt!382816) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!382800 () (_ BitVec 64))

(assert (=> b!245436 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382800)))

(declare-fun lt!382808 () Unit!17865)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10680 array!13411 (_ BitVec 64)) Unit!17865)

(assert (=> b!245436 (= lt!382808 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11446 lt!382817) (buf!6357 (_2!11446 lt!382804)) lt!382800))))

(declare-fun reader!0 (BitStream!10680 BitStream!10680) tuple2!21050)

(assert (=> b!245436 (= lt!382816 (reader!0 (_2!11446 lt!382817) (_2!11446 lt!382804)))))

(declare-fun b!245437 () Bool)

(assert (=> b!245437 (= e!170052 (invariant!0 (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005) (size!5879 (buf!6357 (_2!11446 lt!382804)))))))

(declare-fun b!245438 () Bool)

(assert (=> b!245438 (= e!170054 (not e!170058))))

(declare-fun res!205217 () Bool)

(assert (=> b!245438 (=> res!205217 e!170058)))

(declare-fun lt!382807 () tuple2!21052)

(assert (=> b!245438 (= res!205217 (not (= (_1!11448 lt!382807) (_2!11447 lt!382813))))))

(assert (=> b!245438 (= lt!382807 (checkBitsLoopPure!0 (_1!11447 lt!382813) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!382803 () (_ BitVec 64))

(assert (=> b!245438 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382803)))

(declare-fun lt!382799 () Unit!17865)

(assert (=> b!245438 (= lt!382799 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11446 lt!382817) (buf!6357 (_2!11446 lt!382804)) lt!382803))))

(declare-fun lt!382801 () tuple2!21052)

(assert (=> b!245438 (= lt!382801 (checkBitsLoopPure!0 (_1!11447 lt!382806) nBits!297 bit!26 from!289))))

(assert (=> b!245438 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 thiss!1005)) ((_ sign_extend 32) (currentBit!11742 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!382810 () Unit!17865)

(assert (=> b!245438 (= lt!382810 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6357 (_2!11446 lt!382804)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10680) tuple2!21052)

(assert (=> b!245438 (= (_2!11448 (readBitPure!0 (_1!11447 lt!382806))) bit!26)))

(assert (=> b!245438 (= lt!382813 (reader!0 (_2!11446 lt!382817) (_2!11446 lt!382804)))))

(assert (=> b!245438 (= lt!382806 (reader!0 thiss!1005 (_2!11446 lt!382804)))))

(declare-fun e!170060 () Bool)

(assert (=> b!245438 e!170060))

(declare-fun res!205213 () Bool)

(assert (=> b!245438 (=> (not res!205213) (not e!170060))))

(declare-fun lt!382802 () tuple2!21052)

(declare-fun lt!382811 () tuple2!21052)

(assert (=> b!245438 (= res!205213 (= (bitIndex!0 (size!5879 (buf!6357 (_1!11448 lt!382802))) (currentByte!11747 (_1!11448 lt!382802)) (currentBit!11742 (_1!11448 lt!382802))) (bitIndex!0 (size!5879 (buf!6357 (_1!11448 lt!382811))) (currentByte!11747 (_1!11448 lt!382811)) (currentBit!11742 (_1!11448 lt!382811)))))))

(declare-fun lt!382818 () Unit!17865)

(declare-fun lt!382805 () BitStream!10680)

(declare-fun readBitPrefixLemma!0 (BitStream!10680 BitStream!10680) Unit!17865)

(assert (=> b!245438 (= lt!382818 (readBitPrefixLemma!0 lt!382805 (_2!11446 lt!382804)))))

(assert (=> b!245438 (= lt!382811 (readBitPure!0 (BitStream!10681 (buf!6357 (_2!11446 lt!382804)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005))))))

(assert (=> b!245438 (= lt!382802 (readBitPure!0 lt!382805))))

(assert (=> b!245438 (= lt!382805 (BitStream!10681 (buf!6357 (_2!11446 lt!382817)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)))))

(assert (=> b!245438 e!170052))

(declare-fun res!205224 () Bool)

(assert (=> b!245438 (=> (not res!205224) (not e!170052))))

(assert (=> b!245438 (= res!205224 (isPrefixOf!0 thiss!1005 (_2!11446 lt!382804)))))

(declare-fun lt!382798 () Unit!17865)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10680 BitStream!10680 BitStream!10680) Unit!17865)

(assert (=> b!245438 (= lt!382798 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11446 lt!382817) (_2!11446 lt!382804)))))

(declare-fun e!170059 () Bool)

(assert (=> b!245438 e!170059))

(declare-fun res!205227 () Bool)

(assert (=> b!245438 (=> (not res!205227) (not e!170059))))

(assert (=> b!245438 (= res!205227 (= (size!5879 (buf!6357 (_2!11446 lt!382817))) (size!5879 (buf!6357 (_2!11446 lt!382804)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10680 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21048)

(assert (=> b!245438 (= lt!382804 (appendNBitsLoop!0 (_2!11446 lt!382817) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245438 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382817)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382803)))

(assert (=> b!245438 (= lt!382803 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!382812 () Unit!17865)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10680 BitStream!10680 (_ BitVec 64) (_ BitVec 64)) Unit!17865)

(assert (=> b!245438 (= lt!382812 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11446 lt!382817) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!245438 e!170055))

(declare-fun res!205220 () Bool)

(assert (=> b!245438 (=> (not res!205220) (not e!170055))))

(assert (=> b!245438 (= res!205220 (= (size!5879 (buf!6357 thiss!1005)) (size!5879 (buf!6357 (_2!11446 lt!382817)))))))

(declare-fun appendBit!0 (BitStream!10680 Bool) tuple2!21048)

(assert (=> b!245438 (= lt!382817 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!245439 () Bool)

(assert (=> b!245439 (= e!170060 (= (_2!11448 lt!382802) (_2!11448 lt!382811)))))

(declare-fun b!245440 () Bool)

(declare-fun e!170053 () Bool)

(assert (=> b!245440 (= e!170058 e!170053)))

(declare-fun res!205226 () Bool)

(assert (=> b!245440 (=> res!205226 e!170053)))

(assert (=> b!245440 (= res!205226 (not (= (size!5879 (buf!6357 thiss!1005)) (size!5879 (buf!6357 (_2!11446 lt!382804))))))))

(assert (=> b!245440 (and (= (_2!11448 lt!382801) (_2!11448 lt!382807)) (= (_1!11448 lt!382801) (_2!11447 lt!382806)))))

(declare-fun b!245441 () Bool)

(declare-fun res!205212 () Bool)

(assert (=> b!245441 (=> (not res!205212) (not e!170054))))

(assert (=> b!245441 (= res!205212 (bvslt from!289 nBits!297))))

(declare-fun b!245442 () Bool)

(assert (=> b!245442 (= e!170059 e!170063)))

(declare-fun res!205214 () Bool)

(assert (=> b!245442 (=> (not res!205214) (not e!170063))))

(assert (=> b!245442 (= res!205214 (= (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382804))) (currentByte!11747 (_2!11446 lt!382804)) (currentBit!11742 (_2!11446 lt!382804))) (bvadd (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382817))) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817))) lt!382800)))))

(assert (=> b!245442 (= lt!382800 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!205225 () Bool)

(assert (=> start!52984 (=> (not res!205225) (not e!170054))))

(assert (=> start!52984 (= res!205225 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52984 e!170054))

(assert (=> start!52984 true))

(declare-fun inv!12 (BitStream!10680) Bool)

(assert (=> start!52984 (and (inv!12 thiss!1005) e!170061)))

(declare-fun b!245443 () Bool)

(assert (=> b!245443 (= e!170057 e!170056)))

(declare-fun res!205218 () Bool)

(assert (=> b!245443 (=> (not res!205218) (not e!170056))))

(assert (=> b!245443 (= res!205218 (and (= (_2!11448 lt!382815) bit!26) (= (_1!11448 lt!382815) (_2!11446 lt!382817))))))

(declare-fun readerFrom!0 (BitStream!10680 (_ BitVec 32) (_ BitVec 32)) BitStream!10680)

(assert (=> b!245443 (= lt!382815 (readBitPure!0 (readerFrom!0 (_2!11446 lt!382817) (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005))))))

(declare-fun b!245444 () Bool)

(assert (=> b!245444 (= e!170053 (invariant!0 (currentBit!11742 (_2!11446 lt!382804)) (currentByte!11747 (_2!11446 lt!382804)) (size!5879 (buf!6357 (_2!11446 lt!382804)))))))

(assert (= (and start!52984 res!205225) b!245428))

(assert (= (and b!245428 res!205219) b!245441))

(assert (= (and b!245441 res!205212) b!245438))

(assert (= (and b!245438 res!205220) b!245435))

(assert (= (and b!245435 res!205215) b!245430))

(assert (= (and b!245430 res!205216) b!245443))

(assert (= (and b!245443 res!205218) b!245432))

(assert (= (and b!245438 res!205227) b!245442))

(assert (= (and b!245442 res!205214) b!245433))

(assert (= (and b!245433 res!205223) b!245436))

(assert (= (and b!245438 res!205224) b!245429))

(assert (= (and b!245429 res!205222) b!245437))

(assert (= (and b!245438 res!205213) b!245439))

(assert (= (and b!245438 (not res!205217)) b!245431))

(assert (= (and b!245431 (not res!205221)) b!245440))

(assert (= (and b!245440 (not res!205226)) b!245444))

(assert (= start!52984 b!245434))

(declare-fun m!370095 () Bool)

(assert (=> b!245432 m!370095))

(declare-fun m!370097 () Bool)

(assert (=> b!245433 m!370097))

(declare-fun m!370099 () Bool)

(assert (=> b!245444 m!370099))

(declare-fun m!370101 () Bool)

(assert (=> b!245437 m!370101))

(declare-fun m!370103 () Bool)

(assert (=> b!245431 m!370103))

(declare-fun m!370105 () Bool)

(assert (=> b!245429 m!370105))

(declare-fun m!370107 () Bool)

(assert (=> b!245443 m!370107))

(assert (=> b!245443 m!370107))

(declare-fun m!370109 () Bool)

(assert (=> b!245443 m!370109))

(declare-fun m!370111 () Bool)

(assert (=> b!245438 m!370111))

(declare-fun m!370113 () Bool)

(assert (=> b!245438 m!370113))

(declare-fun m!370115 () Bool)

(assert (=> b!245438 m!370115))

(declare-fun m!370117 () Bool)

(assert (=> b!245438 m!370117))

(declare-fun m!370119 () Bool)

(assert (=> b!245438 m!370119))

(declare-fun m!370121 () Bool)

(assert (=> b!245438 m!370121))

(declare-fun m!370123 () Bool)

(assert (=> b!245438 m!370123))

(declare-fun m!370125 () Bool)

(assert (=> b!245438 m!370125))

(declare-fun m!370127 () Bool)

(assert (=> b!245438 m!370127))

(declare-fun m!370129 () Bool)

(assert (=> b!245438 m!370129))

(declare-fun m!370131 () Bool)

(assert (=> b!245438 m!370131))

(declare-fun m!370133 () Bool)

(assert (=> b!245438 m!370133))

(declare-fun m!370135 () Bool)

(assert (=> b!245438 m!370135))

(declare-fun m!370137 () Bool)

(assert (=> b!245438 m!370137))

(declare-fun m!370139 () Bool)

(assert (=> b!245438 m!370139))

(declare-fun m!370141 () Bool)

(assert (=> b!245438 m!370141))

(declare-fun m!370143 () Bool)

(assert (=> b!245438 m!370143))

(declare-fun m!370145 () Bool)

(assert (=> b!245438 m!370145))

(declare-fun m!370147 () Bool)

(assert (=> b!245438 m!370147))

(declare-fun m!370149 () Bool)

(assert (=> b!245438 m!370149))

(declare-fun m!370151 () Bool)

(assert (=> b!245436 m!370151))

(declare-fun m!370153 () Bool)

(assert (=> b!245436 m!370153))

(declare-fun m!370155 () Bool)

(assert (=> b!245436 m!370155))

(assert (=> b!245436 m!370115))

(declare-fun m!370157 () Bool)

(assert (=> b!245434 m!370157))

(declare-fun m!370159 () Bool)

(assert (=> b!245428 m!370159))

(declare-fun m!370161 () Bool)

(assert (=> start!52984 m!370161))

(declare-fun m!370163 () Bool)

(assert (=> b!245435 m!370163))

(declare-fun m!370165 () Bool)

(assert (=> b!245435 m!370165))

(declare-fun m!370167 () Bool)

(assert (=> b!245442 m!370167))

(assert (=> b!245442 m!370163))

(declare-fun m!370169 () Bool)

(assert (=> b!245430 m!370169))

(check-sat (not b!245432) (not b!245436) (not start!52984) (not b!245433) (not b!245430) (not b!245444) (not b!245429) (not b!245443) (not b!245442) (not b!245438) (not b!245428) (not b!245435) (not b!245434) (not b!245437) (not b!245431))
(check-sat)
(get-model)

(declare-fun d!82366 () Bool)

(assert (=> d!82366 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382803)))

(declare-fun lt!382887 () Unit!17865)

(declare-fun choose!9 (BitStream!10680 array!13411 (_ BitVec 64) BitStream!10680) Unit!17865)

(assert (=> d!82366 (= lt!382887 (choose!9 (_2!11446 lt!382817) (buf!6357 (_2!11446 lt!382804)) lt!382803 (BitStream!10681 (buf!6357 (_2!11446 lt!382804)) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817)))))))

(assert (=> d!82366 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11446 lt!382817) (buf!6357 (_2!11446 lt!382804)) lt!382803) lt!382887)))

(declare-fun bs!20841 () Bool)

(assert (= bs!20841 d!82366))

(assert (=> bs!20841 m!370141))

(declare-fun m!370247 () Bool)

(assert (=> bs!20841 m!370247))

(assert (=> b!245438 d!82366))

(declare-datatypes ((tuple2!21060 0))(
  ( (tuple2!21061 (_1!11452 Bool) (_2!11452 BitStream!10680)) )
))
(declare-fun lt!382890 () tuple2!21060)

(declare-fun d!82368 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10680 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21060)

(assert (=> d!82368 (= lt!382890 (checkBitsLoop!0 (_1!11447 lt!382813) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82368 (= (checkBitsLoopPure!0 (_1!11447 lt!382813) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21053 (_2!11452 lt!382890) (_1!11452 lt!382890)))))

(declare-fun bs!20842 () Bool)

(assert (= bs!20842 d!82368))

(declare-fun m!370249 () Bool)

(assert (=> bs!20842 m!370249))

(assert (=> b!245438 d!82368))

(declare-fun d!82370 () Bool)

(declare-fun res!205282 () Bool)

(declare-fun e!170105 () Bool)

(assert (=> d!82370 (=> (not res!205282) (not e!170105))))

(assert (=> d!82370 (= res!205282 (= (size!5879 (buf!6357 thiss!1005)) (size!5879 (buf!6357 (_2!11446 lt!382804)))))))

(assert (=> d!82370 (= (isPrefixOf!0 thiss!1005 (_2!11446 lt!382804)) e!170105)))

(declare-fun b!245502 () Bool)

(declare-fun res!205283 () Bool)

(assert (=> b!245502 (=> (not res!205283) (not e!170105))))

(assert (=> b!245502 (= res!205283 (bvsle (bitIndex!0 (size!5879 (buf!6357 thiss!1005)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)) (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382804))) (currentByte!11747 (_2!11446 lt!382804)) (currentBit!11742 (_2!11446 lt!382804)))))))

(declare-fun b!245503 () Bool)

(declare-fun e!170104 () Bool)

(assert (=> b!245503 (= e!170105 e!170104)))

(declare-fun res!205284 () Bool)

(assert (=> b!245503 (=> res!205284 e!170104)))

(assert (=> b!245503 (= res!205284 (= (size!5879 (buf!6357 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245504 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13411 array!13411 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245504 (= e!170104 (arrayBitRangesEq!0 (buf!6357 thiss!1005) (buf!6357 (_2!11446 lt!382804)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5879 (buf!6357 thiss!1005)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005))))))

(assert (= (and d!82370 res!205282) b!245502))

(assert (= (and b!245502 res!205283) b!245503))

(assert (= (and b!245503 (not res!205284)) b!245504))

(assert (=> b!245502 m!370165))

(assert (=> b!245502 m!370167))

(assert (=> b!245504 m!370165))

(assert (=> b!245504 m!370165))

(declare-fun m!370251 () Bool)

(assert (=> b!245504 m!370251))

(assert (=> b!245438 d!82370))

(declare-fun b!245515 () Bool)

(declare-fun e!170111 () Unit!17865)

(declare-fun lt!382950 () Unit!17865)

(assert (=> b!245515 (= e!170111 lt!382950)))

(declare-fun lt!382938 () (_ BitVec 64))

(assert (=> b!245515 (= lt!382938 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!382949 () (_ BitVec 64))

(assert (=> b!245515 (= lt!382949 (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382817))) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13411 array!13411 (_ BitVec 64) (_ BitVec 64)) Unit!17865)

(assert (=> b!245515 (= lt!382950 (arrayBitRangesEqSymmetric!0 (buf!6357 (_2!11446 lt!382817)) (buf!6357 (_2!11446 lt!382804)) lt!382938 lt!382949))))

(assert (=> b!245515 (arrayBitRangesEq!0 (buf!6357 (_2!11446 lt!382804)) (buf!6357 (_2!11446 lt!382817)) lt!382938 lt!382949)))

(declare-fun b!245516 () Bool)

(declare-fun Unit!17869 () Unit!17865)

(assert (=> b!245516 (= e!170111 Unit!17869)))

(declare-fun b!245517 () Bool)

(declare-fun res!205293 () Bool)

(declare-fun e!170110 () Bool)

(assert (=> b!245517 (=> (not res!205293) (not e!170110))))

(declare-fun lt!382942 () tuple2!21050)

(assert (=> b!245517 (= res!205293 (isPrefixOf!0 (_1!11447 lt!382942) (_2!11446 lt!382817)))))

(declare-fun b!245518 () Bool)

(declare-fun res!205291 () Bool)

(assert (=> b!245518 (=> (not res!205291) (not e!170110))))

(assert (=> b!245518 (= res!205291 (isPrefixOf!0 (_2!11447 lt!382942) (_2!11446 lt!382804)))))

(declare-fun b!245519 () Bool)

(declare-fun lt!382941 () (_ BitVec 64))

(declare-fun lt!382931 () (_ BitVec 64))

(assert (=> b!245519 (= e!170110 (= (_1!11447 lt!382942) (withMovedBitIndex!0 (_2!11447 lt!382942) (bvsub lt!382931 lt!382941))))))

(assert (=> b!245519 (or (= (bvand lt!382931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382931 lt!382941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245519 (= lt!382941 (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382804))) (currentByte!11747 (_2!11446 lt!382804)) (currentBit!11742 (_2!11446 lt!382804))))))

(assert (=> b!245519 (= lt!382931 (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382817))) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817))))))

(declare-fun d!82372 () Bool)

(assert (=> d!82372 e!170110))

(declare-fun res!205292 () Bool)

(assert (=> d!82372 (=> (not res!205292) (not e!170110))))

(assert (=> d!82372 (= res!205292 (isPrefixOf!0 (_1!11447 lt!382942) (_2!11447 lt!382942)))))

(declare-fun lt!382932 () BitStream!10680)

(assert (=> d!82372 (= lt!382942 (tuple2!21051 lt!382932 (_2!11446 lt!382804)))))

(declare-fun lt!382940 () Unit!17865)

(declare-fun lt!382943 () Unit!17865)

(assert (=> d!82372 (= lt!382940 lt!382943)))

(assert (=> d!82372 (isPrefixOf!0 lt!382932 (_2!11446 lt!382804))))

(assert (=> d!82372 (= lt!382943 (lemmaIsPrefixTransitive!0 lt!382932 (_2!11446 lt!382804) (_2!11446 lt!382804)))))

(declare-fun lt!382937 () Unit!17865)

(declare-fun lt!382948 () Unit!17865)

(assert (=> d!82372 (= lt!382937 lt!382948)))

(assert (=> d!82372 (isPrefixOf!0 lt!382932 (_2!11446 lt!382804))))

(assert (=> d!82372 (= lt!382948 (lemmaIsPrefixTransitive!0 lt!382932 (_2!11446 lt!382817) (_2!11446 lt!382804)))))

(declare-fun lt!382939 () Unit!17865)

(assert (=> d!82372 (= lt!382939 e!170111)))

(declare-fun c!11491 () Bool)

(assert (=> d!82372 (= c!11491 (not (= (size!5879 (buf!6357 (_2!11446 lt!382817))) #b00000000000000000000000000000000)))))

(declare-fun lt!382935 () Unit!17865)

(declare-fun lt!382946 () Unit!17865)

(assert (=> d!82372 (= lt!382935 lt!382946)))

(assert (=> d!82372 (isPrefixOf!0 (_2!11446 lt!382804) (_2!11446 lt!382804))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10680) Unit!17865)

(assert (=> d!82372 (= lt!382946 (lemmaIsPrefixRefl!0 (_2!11446 lt!382804)))))

(declare-fun lt!382934 () Unit!17865)

(declare-fun lt!382944 () Unit!17865)

(assert (=> d!82372 (= lt!382934 lt!382944)))

(assert (=> d!82372 (= lt!382944 (lemmaIsPrefixRefl!0 (_2!11446 lt!382804)))))

(declare-fun lt!382933 () Unit!17865)

(declare-fun lt!382947 () Unit!17865)

(assert (=> d!82372 (= lt!382933 lt!382947)))

(assert (=> d!82372 (isPrefixOf!0 lt!382932 lt!382932)))

(assert (=> d!82372 (= lt!382947 (lemmaIsPrefixRefl!0 lt!382932))))

(declare-fun lt!382936 () Unit!17865)

(declare-fun lt!382945 () Unit!17865)

(assert (=> d!82372 (= lt!382936 lt!382945)))

(assert (=> d!82372 (isPrefixOf!0 (_2!11446 lt!382817) (_2!11446 lt!382817))))

(assert (=> d!82372 (= lt!382945 (lemmaIsPrefixRefl!0 (_2!11446 lt!382817)))))

(assert (=> d!82372 (= lt!382932 (BitStream!10681 (buf!6357 (_2!11446 lt!382804)) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817))))))

(assert (=> d!82372 (isPrefixOf!0 (_2!11446 lt!382817) (_2!11446 lt!382804))))

(assert (=> d!82372 (= (reader!0 (_2!11446 lt!382817) (_2!11446 lt!382804)) lt!382942)))

(assert (= (and d!82372 c!11491) b!245515))

(assert (= (and d!82372 (not c!11491)) b!245516))

(assert (= (and d!82372 res!205292) b!245517))

(assert (= (and b!245517 res!205293) b!245518))

(assert (= (and b!245518 res!205291) b!245519))

(declare-fun m!370253 () Bool)

(assert (=> b!245517 m!370253))

(declare-fun m!370255 () Bool)

(assert (=> b!245518 m!370255))

(assert (=> d!82372 m!370097))

(declare-fun m!370257 () Bool)

(assert (=> d!82372 m!370257))

(declare-fun m!370259 () Bool)

(assert (=> d!82372 m!370259))

(declare-fun m!370261 () Bool)

(assert (=> d!82372 m!370261))

(declare-fun m!370263 () Bool)

(assert (=> d!82372 m!370263))

(declare-fun m!370265 () Bool)

(assert (=> d!82372 m!370265))

(declare-fun m!370267 () Bool)

(assert (=> d!82372 m!370267))

(declare-fun m!370269 () Bool)

(assert (=> d!82372 m!370269))

(declare-fun m!370271 () Bool)

(assert (=> d!82372 m!370271))

(declare-fun m!370273 () Bool)

(assert (=> d!82372 m!370273))

(declare-fun m!370275 () Bool)

(assert (=> d!82372 m!370275))

(assert (=> b!245515 m!370163))

(declare-fun m!370277 () Bool)

(assert (=> b!245515 m!370277))

(declare-fun m!370279 () Bool)

(assert (=> b!245515 m!370279))

(declare-fun m!370281 () Bool)

(assert (=> b!245519 m!370281))

(assert (=> b!245519 m!370167))

(assert (=> b!245519 m!370163))

(assert (=> b!245438 d!82372))

(declare-fun b!245529 () Bool)

(declare-fun res!205305 () Bool)

(declare-fun e!170116 () Bool)

(assert (=> b!245529 (=> (not res!205305) (not e!170116))))

(declare-fun lt!382973 () tuple2!21048)

(assert (=> b!245529 (= res!205305 (isPrefixOf!0 (_2!11446 lt!382817) (_2!11446 lt!382973)))))

(declare-fun b!245531 () Bool)

(declare-fun e!170117 () Bool)

(declare-fun lt!382970 () (_ BitVec 64))

(assert (=> b!245531 (= e!170117 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382817)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382970))))

(declare-fun b!245528 () Bool)

(declare-fun res!205303 () Bool)

(assert (=> b!245528 (=> (not res!205303) (not e!170116))))

(declare-fun lt!382974 () (_ BitVec 64))

(declare-fun lt!382969 () (_ BitVec 64))

(assert (=> b!245528 (= res!205303 (= (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382973))) (currentByte!11747 (_2!11446 lt!382973)) (currentBit!11742 (_2!11446 lt!382973))) (bvadd lt!382969 lt!382974)))))

(assert (=> b!245528 (or (not (= (bvand lt!382969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382974 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!382969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!382969 lt!382974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245528 (= lt!382974 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245528 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245528 (= lt!382969 (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382817))) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817))))))

(declare-fun d!82374 () Bool)

(assert (=> d!82374 e!170116))

(declare-fun res!205302 () Bool)

(assert (=> d!82374 (=> (not res!205302) (not e!170116))))

(assert (=> d!82374 (= res!205302 (= (size!5879 (buf!6357 (_2!11446 lt!382817))) (size!5879 (buf!6357 (_2!11446 lt!382973)))))))

(declare-fun choose!51 (BitStream!10680 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21048)

(assert (=> d!82374 (= lt!382973 (choose!51 (_2!11446 lt!382817) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82374 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82374 (= (appendNBitsLoop!0 (_2!11446 lt!382817) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!382973)))

(declare-fun b!245530 () Bool)

(declare-fun lt!382971 () tuple2!21052)

(declare-fun lt!382972 () tuple2!21050)

(assert (=> b!245530 (= e!170116 (and (_2!11448 lt!382971) (= (_1!11448 lt!382971) (_2!11447 lt!382972))))))

(assert (=> b!245530 (= lt!382971 (checkBitsLoopPure!0 (_1!11447 lt!382972) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!382968 () Unit!17865)

(declare-fun lt!382967 () Unit!17865)

(assert (=> b!245530 (= lt!382968 lt!382967)))

(assert (=> b!245530 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382973)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382970)))

(assert (=> b!245530 (= lt!382967 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11446 lt!382817) (buf!6357 (_2!11446 lt!382973)) lt!382970))))

(assert (=> b!245530 e!170117))

(declare-fun res!205304 () Bool)

(assert (=> b!245530 (=> (not res!205304) (not e!170117))))

(assert (=> b!245530 (= res!205304 (and (= (size!5879 (buf!6357 (_2!11446 lt!382817))) (size!5879 (buf!6357 (_2!11446 lt!382973)))) (bvsge lt!382970 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245530 (= lt!382970 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245530 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245530 (= lt!382972 (reader!0 (_2!11446 lt!382817) (_2!11446 lt!382973)))))

(assert (= (and d!82374 res!205302) b!245528))

(assert (= (and b!245528 res!205303) b!245529))

(assert (= (and b!245529 res!205305) b!245530))

(assert (= (and b!245530 res!205304) b!245531))

(declare-fun m!370283 () Bool)

(assert (=> b!245530 m!370283))

(declare-fun m!370285 () Bool)

(assert (=> b!245530 m!370285))

(declare-fun m!370287 () Bool)

(assert (=> b!245530 m!370287))

(declare-fun m!370289 () Bool)

(assert (=> b!245530 m!370289))

(declare-fun m!370291 () Bool)

(assert (=> d!82374 m!370291))

(declare-fun m!370293 () Bool)

(assert (=> b!245528 m!370293))

(assert (=> b!245528 m!370163))

(declare-fun m!370295 () Bool)

(assert (=> b!245531 m!370295))

(declare-fun m!370297 () Bool)

(assert (=> b!245529 m!370297))

(assert (=> b!245438 d!82374))

(declare-fun d!82376 () Bool)

(declare-fun e!170120 () Bool)

(assert (=> d!82376 e!170120))

(declare-fun res!205311 () Bool)

(assert (=> d!82376 (=> (not res!205311) (not e!170120))))

(declare-fun lt!382987 () (_ BitVec 64))

(declare-fun lt!382988 () (_ BitVec 64))

(declare-fun lt!382991 () (_ BitVec 64))

(assert (=> d!82376 (= res!205311 (= lt!382987 (bvsub lt!382988 lt!382991)))))

(assert (=> d!82376 (or (= (bvand lt!382988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382991 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382988 lt!382991) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82376 (= lt!382991 (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 (_1!11448 lt!382811)))) ((_ sign_extend 32) (currentByte!11747 (_1!11448 lt!382811))) ((_ sign_extend 32) (currentBit!11742 (_1!11448 lt!382811)))))))

(declare-fun lt!382989 () (_ BitVec 64))

(declare-fun lt!382992 () (_ BitVec 64))

(assert (=> d!82376 (= lt!382988 (bvmul lt!382989 lt!382992))))

(assert (=> d!82376 (or (= lt!382989 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382992 (bvsdiv (bvmul lt!382989 lt!382992) lt!382989)))))

(assert (=> d!82376 (= lt!382992 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82376 (= lt!382989 ((_ sign_extend 32) (size!5879 (buf!6357 (_1!11448 lt!382811)))))))

(assert (=> d!82376 (= lt!382987 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11747 (_1!11448 lt!382811))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11742 (_1!11448 lt!382811)))))))

(assert (=> d!82376 (invariant!0 (currentBit!11742 (_1!11448 lt!382811)) (currentByte!11747 (_1!11448 lt!382811)) (size!5879 (buf!6357 (_1!11448 lt!382811))))))

(assert (=> d!82376 (= (bitIndex!0 (size!5879 (buf!6357 (_1!11448 lt!382811))) (currentByte!11747 (_1!11448 lt!382811)) (currentBit!11742 (_1!11448 lt!382811))) lt!382987)))

(declare-fun b!245536 () Bool)

(declare-fun res!205310 () Bool)

(assert (=> b!245536 (=> (not res!205310) (not e!170120))))

(assert (=> b!245536 (= res!205310 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382987))))

(declare-fun b!245537 () Bool)

(declare-fun lt!382990 () (_ BitVec 64))

(assert (=> b!245537 (= e!170120 (bvsle lt!382987 (bvmul lt!382990 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245537 (or (= lt!382990 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382990 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382990)))))

(assert (=> b!245537 (= lt!382990 ((_ sign_extend 32) (size!5879 (buf!6357 (_1!11448 lt!382811)))))))

(assert (= (and d!82376 res!205311) b!245536))

(assert (= (and b!245536 res!205310) b!245537))

(declare-fun m!370299 () Bool)

(assert (=> d!82376 m!370299))

(declare-fun m!370301 () Bool)

(assert (=> d!82376 m!370301))

(assert (=> b!245438 d!82376))

(declare-fun d!82378 () Bool)

(declare-fun lt!382995 () tuple2!21060)

(declare-fun readBit!0 (BitStream!10680) tuple2!21060)

(assert (=> d!82378 (= lt!382995 (readBit!0 lt!382805))))

(assert (=> d!82378 (= (readBitPure!0 lt!382805) (tuple2!21053 (_2!11452 lt!382995) (_1!11452 lt!382995)))))

(declare-fun bs!20843 () Bool)

(assert (= bs!20843 d!82378))

(declare-fun m!370303 () Bool)

(assert (=> bs!20843 m!370303))

(assert (=> b!245438 d!82378))

(declare-fun d!82380 () Bool)

(declare-fun lt!382996 () tuple2!21060)

(assert (=> d!82380 (= lt!382996 (checkBitsLoop!0 (_1!11447 lt!382806) nBits!297 bit!26 from!289))))

(assert (=> d!82380 (= (checkBitsLoopPure!0 (_1!11447 lt!382806) nBits!297 bit!26 from!289) (tuple2!21053 (_2!11452 lt!382996) (_1!11452 lt!382996)))))

(declare-fun bs!20844 () Bool)

(assert (= bs!20844 d!82380))

(declare-fun m!370305 () Bool)

(assert (=> bs!20844 m!370305))

(assert (=> b!245438 d!82380))

(declare-fun d!82382 () Bool)

(assert (=> d!82382 (isPrefixOf!0 thiss!1005 (_2!11446 lt!382804))))

(declare-fun lt!382999 () Unit!17865)

(declare-fun choose!30 (BitStream!10680 BitStream!10680 BitStream!10680) Unit!17865)

(assert (=> d!82382 (= lt!382999 (choose!30 thiss!1005 (_2!11446 lt!382817) (_2!11446 lt!382804)))))

(assert (=> d!82382 (isPrefixOf!0 thiss!1005 (_2!11446 lt!382817))))

(assert (=> d!82382 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11446 lt!382817) (_2!11446 lt!382804)) lt!382999)))

(declare-fun bs!20845 () Bool)

(assert (= bs!20845 d!82382))

(assert (=> bs!20845 m!370111))

(declare-fun m!370307 () Bool)

(assert (=> bs!20845 m!370307))

(assert (=> bs!20845 m!370169))

(assert (=> b!245438 d!82382))

(declare-fun d!82384 () Bool)

(declare-fun e!170123 () Bool)

(assert (=> d!82384 e!170123))

(declare-fun res!205314 () Bool)

(assert (=> d!82384 (=> (not res!205314) (not e!170123))))

(assert (=> d!82384 (= res!205314 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!383002 () Unit!17865)

(declare-fun choose!27 (BitStream!10680 BitStream!10680 (_ BitVec 64) (_ BitVec 64)) Unit!17865)

(assert (=> d!82384 (= lt!383002 (choose!27 thiss!1005 (_2!11446 lt!382817) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82384 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82384 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11446 lt!382817) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!383002)))

(declare-fun b!245540 () Bool)

(assert (=> b!245540 (= e!170123 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382817)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82384 res!205314) b!245540))

(declare-fun m!370309 () Bool)

(assert (=> d!82384 m!370309))

(declare-fun m!370311 () Bool)

(assert (=> b!245540 m!370311))

(assert (=> b!245438 d!82384))

(declare-fun d!82386 () Bool)

(assert (=> d!82386 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 thiss!1005)) ((_ sign_extend 32) (currentBit!11742 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 thiss!1005)) ((_ sign_extend 32) (currentBit!11742 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20846 () Bool)

(assert (= bs!20846 d!82386))

(declare-fun m!370313 () Bool)

(assert (=> bs!20846 m!370313))

(assert (=> b!245438 d!82386))

(declare-fun b!245552 () Bool)

(declare-fun e!170128 () Bool)

(declare-fun e!170129 () Bool)

(assert (=> b!245552 (= e!170128 e!170129)))

(declare-fun res!205325 () Bool)

(assert (=> b!245552 (=> (not res!205325) (not e!170129))))

(declare-fun lt!383011 () tuple2!21048)

(declare-fun lt!383014 () tuple2!21052)

(assert (=> b!245552 (= res!205325 (and (= (_2!11448 lt!383014) bit!26) (= (_1!11448 lt!383014) (_2!11446 lt!383011))))))

(assert (=> b!245552 (= lt!383014 (readBitPure!0 (readerFrom!0 (_2!11446 lt!383011) (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005))))))

(declare-fun b!245550 () Bool)

(declare-fun res!205323 () Bool)

(assert (=> b!245550 (=> (not res!205323) (not e!170128))))

(declare-fun lt!383012 () (_ BitVec 64))

(declare-fun lt!383013 () (_ BitVec 64))

(assert (=> b!245550 (= res!205323 (= (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!383011))) (currentByte!11747 (_2!11446 lt!383011)) (currentBit!11742 (_2!11446 lt!383011))) (bvadd lt!383012 lt!383013)))))

(assert (=> b!245550 (or (not (= (bvand lt!383012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383013 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!383012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!383012 lt!383013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245550 (= lt!383013 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!245550 (= lt!383012 (bitIndex!0 (size!5879 (buf!6357 thiss!1005)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)))))

(declare-fun b!245551 () Bool)

(declare-fun res!205324 () Bool)

(assert (=> b!245551 (=> (not res!205324) (not e!170128))))

(assert (=> b!245551 (= res!205324 (isPrefixOf!0 thiss!1005 (_2!11446 lt!383011)))))

(declare-fun d!82388 () Bool)

(assert (=> d!82388 e!170128))

(declare-fun res!205326 () Bool)

(assert (=> d!82388 (=> (not res!205326) (not e!170128))))

(assert (=> d!82388 (= res!205326 (= (size!5879 (buf!6357 thiss!1005)) (size!5879 (buf!6357 (_2!11446 lt!383011)))))))

(declare-fun choose!16 (BitStream!10680 Bool) tuple2!21048)

(assert (=> d!82388 (= lt!383011 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82388 (validate_offset_bit!0 ((_ sign_extend 32) (size!5879 (buf!6357 thiss!1005))) ((_ sign_extend 32) (currentByte!11747 thiss!1005)) ((_ sign_extend 32) (currentBit!11742 thiss!1005)))))

(assert (=> d!82388 (= (appendBit!0 thiss!1005 bit!26) lt!383011)))

(declare-fun b!245553 () Bool)

(assert (=> b!245553 (= e!170129 (= (bitIndex!0 (size!5879 (buf!6357 (_1!11448 lt!383014))) (currentByte!11747 (_1!11448 lt!383014)) (currentBit!11742 (_1!11448 lt!383014))) (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!383011))) (currentByte!11747 (_2!11446 lt!383011)) (currentBit!11742 (_2!11446 lt!383011)))))))

(assert (= (and d!82388 res!205326) b!245550))

(assert (= (and b!245550 res!205323) b!245551))

(assert (= (and b!245551 res!205324) b!245552))

(assert (= (and b!245552 res!205325) b!245553))

(declare-fun m!370315 () Bool)

(assert (=> d!82388 m!370315))

(declare-fun m!370317 () Bool)

(assert (=> d!82388 m!370317))

(declare-fun m!370319 () Bool)

(assert (=> b!245552 m!370319))

(assert (=> b!245552 m!370319))

(declare-fun m!370321 () Bool)

(assert (=> b!245552 m!370321))

(declare-fun m!370323 () Bool)

(assert (=> b!245553 m!370323))

(declare-fun m!370325 () Bool)

(assert (=> b!245553 m!370325))

(declare-fun m!370327 () Bool)

(assert (=> b!245551 m!370327))

(assert (=> b!245550 m!370325))

(assert (=> b!245550 m!370165))

(assert (=> b!245438 d!82388))

(declare-fun b!245560 () Bool)

(declare-fun e!170135 () Unit!17865)

(declare-fun lt!383034 () Unit!17865)

(assert (=> b!245560 (= e!170135 lt!383034)))

(declare-fun lt!383022 () (_ BitVec 64))

(assert (=> b!245560 (= lt!383022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!383033 () (_ BitVec 64))

(assert (=> b!245560 (= lt!383033 (bitIndex!0 (size!5879 (buf!6357 thiss!1005)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)))))

(assert (=> b!245560 (= lt!383034 (arrayBitRangesEqSymmetric!0 (buf!6357 thiss!1005) (buf!6357 (_2!11446 lt!382804)) lt!383022 lt!383033))))

(assert (=> b!245560 (arrayBitRangesEq!0 (buf!6357 (_2!11446 lt!382804)) (buf!6357 thiss!1005) lt!383022 lt!383033)))

(declare-fun b!245561 () Bool)

(declare-fun Unit!17870 () Unit!17865)

(assert (=> b!245561 (= e!170135 Unit!17870)))

(declare-fun b!245562 () Bool)

(declare-fun res!205335 () Bool)

(declare-fun e!170134 () Bool)

(assert (=> b!245562 (=> (not res!205335) (not e!170134))))

(declare-fun lt!383026 () tuple2!21050)

(assert (=> b!245562 (= res!205335 (isPrefixOf!0 (_1!11447 lt!383026) thiss!1005))))

(declare-fun b!245563 () Bool)

(declare-fun res!205333 () Bool)

(assert (=> b!245563 (=> (not res!205333) (not e!170134))))

(assert (=> b!245563 (= res!205333 (isPrefixOf!0 (_2!11447 lt!383026) (_2!11446 lt!382804)))))

(declare-fun b!245564 () Bool)

(declare-fun lt!383025 () (_ BitVec 64))

(declare-fun lt!383015 () (_ BitVec 64))

(assert (=> b!245564 (= e!170134 (= (_1!11447 lt!383026) (withMovedBitIndex!0 (_2!11447 lt!383026) (bvsub lt!383015 lt!383025))))))

(assert (=> b!245564 (or (= (bvand lt!383015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383015 lt!383025) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245564 (= lt!383025 (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382804))) (currentByte!11747 (_2!11446 lt!382804)) (currentBit!11742 (_2!11446 lt!382804))))))

(assert (=> b!245564 (= lt!383015 (bitIndex!0 (size!5879 (buf!6357 thiss!1005)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)))))

(declare-fun d!82392 () Bool)

(assert (=> d!82392 e!170134))

(declare-fun res!205334 () Bool)

(assert (=> d!82392 (=> (not res!205334) (not e!170134))))

(assert (=> d!82392 (= res!205334 (isPrefixOf!0 (_1!11447 lt!383026) (_2!11447 lt!383026)))))

(declare-fun lt!383016 () BitStream!10680)

(assert (=> d!82392 (= lt!383026 (tuple2!21051 lt!383016 (_2!11446 lt!382804)))))

(declare-fun lt!383024 () Unit!17865)

(declare-fun lt!383027 () Unit!17865)

(assert (=> d!82392 (= lt!383024 lt!383027)))

(assert (=> d!82392 (isPrefixOf!0 lt!383016 (_2!11446 lt!382804))))

(assert (=> d!82392 (= lt!383027 (lemmaIsPrefixTransitive!0 lt!383016 (_2!11446 lt!382804) (_2!11446 lt!382804)))))

(declare-fun lt!383021 () Unit!17865)

(declare-fun lt!383032 () Unit!17865)

(assert (=> d!82392 (= lt!383021 lt!383032)))

(assert (=> d!82392 (isPrefixOf!0 lt!383016 (_2!11446 lt!382804))))

(assert (=> d!82392 (= lt!383032 (lemmaIsPrefixTransitive!0 lt!383016 thiss!1005 (_2!11446 lt!382804)))))

(declare-fun lt!383023 () Unit!17865)

(assert (=> d!82392 (= lt!383023 e!170135)))

(declare-fun c!11492 () Bool)

(assert (=> d!82392 (= c!11492 (not (= (size!5879 (buf!6357 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!383019 () Unit!17865)

(declare-fun lt!383030 () Unit!17865)

(assert (=> d!82392 (= lt!383019 lt!383030)))

(assert (=> d!82392 (isPrefixOf!0 (_2!11446 lt!382804) (_2!11446 lt!382804))))

(assert (=> d!82392 (= lt!383030 (lemmaIsPrefixRefl!0 (_2!11446 lt!382804)))))

(declare-fun lt!383018 () Unit!17865)

(declare-fun lt!383028 () Unit!17865)

(assert (=> d!82392 (= lt!383018 lt!383028)))

(assert (=> d!82392 (= lt!383028 (lemmaIsPrefixRefl!0 (_2!11446 lt!382804)))))

(declare-fun lt!383017 () Unit!17865)

(declare-fun lt!383031 () Unit!17865)

(assert (=> d!82392 (= lt!383017 lt!383031)))

(assert (=> d!82392 (isPrefixOf!0 lt!383016 lt!383016)))

(assert (=> d!82392 (= lt!383031 (lemmaIsPrefixRefl!0 lt!383016))))

(declare-fun lt!383020 () Unit!17865)

(declare-fun lt!383029 () Unit!17865)

(assert (=> d!82392 (= lt!383020 lt!383029)))

(assert (=> d!82392 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82392 (= lt!383029 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82392 (= lt!383016 (BitStream!10681 (buf!6357 (_2!11446 lt!382804)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)))))

(assert (=> d!82392 (isPrefixOf!0 thiss!1005 (_2!11446 lt!382804))))

(assert (=> d!82392 (= (reader!0 thiss!1005 (_2!11446 lt!382804)) lt!383026)))

(assert (= (and d!82392 c!11492) b!245560))

(assert (= (and d!82392 (not c!11492)) b!245561))

(assert (= (and d!82392 res!205334) b!245562))

(assert (= (and b!245562 res!205335) b!245563))

(assert (= (and b!245563 res!205333) b!245564))

(declare-fun m!370329 () Bool)

(assert (=> b!245562 m!370329))

(declare-fun m!370331 () Bool)

(assert (=> b!245563 m!370331))

(assert (=> d!82392 m!370111))

(declare-fun m!370333 () Bool)

(assert (=> d!82392 m!370333))

(assert (=> d!82392 m!370259))

(declare-fun m!370337 () Bool)

(assert (=> d!82392 m!370337))

(assert (=> d!82392 m!370263))

(declare-fun m!370339 () Bool)

(assert (=> d!82392 m!370339))

(declare-fun m!370341 () Bool)

(assert (=> d!82392 m!370341))

(declare-fun m!370343 () Bool)

(assert (=> d!82392 m!370343))

(declare-fun m!370345 () Bool)

(assert (=> d!82392 m!370345))

(declare-fun m!370347 () Bool)

(assert (=> d!82392 m!370347))

(declare-fun m!370349 () Bool)

(assert (=> d!82392 m!370349))

(assert (=> b!245560 m!370165))

(declare-fun m!370351 () Bool)

(assert (=> b!245560 m!370351))

(declare-fun m!370353 () Bool)

(assert (=> b!245560 m!370353))

(declare-fun m!370355 () Bool)

(assert (=> b!245564 m!370355))

(assert (=> b!245564 m!370167))

(assert (=> b!245564 m!370165))

(assert (=> b!245438 d!82392))

(declare-fun d!82396 () Bool)

(assert (=> d!82396 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382817)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382803) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382817)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817)))) lt!382803))))

(declare-fun bs!20847 () Bool)

(assert (= bs!20847 d!82396))

(declare-fun m!370357 () Bool)

(assert (=> bs!20847 m!370357))

(assert (=> b!245438 d!82396))

(declare-fun d!82398 () Bool)

(declare-fun e!170142 () Bool)

(assert (=> d!82398 e!170142))

(declare-fun res!205345 () Bool)

(assert (=> d!82398 (=> (not res!205345) (not e!170142))))

(declare-fun lt!383058 () tuple2!21052)

(declare-fun lt!383055 () tuple2!21052)

(assert (=> d!82398 (= res!205345 (= (bitIndex!0 (size!5879 (buf!6357 (_1!11448 lt!383058))) (currentByte!11747 (_1!11448 lt!383058)) (currentBit!11742 (_1!11448 lt!383058))) (bitIndex!0 (size!5879 (buf!6357 (_1!11448 lt!383055))) (currentByte!11747 (_1!11448 lt!383055)) (currentBit!11742 (_1!11448 lt!383055)))))))

(declare-fun lt!383057 () BitStream!10680)

(declare-fun lt!383056 () Unit!17865)

(declare-fun choose!50 (BitStream!10680 BitStream!10680 BitStream!10680 tuple2!21052 tuple2!21052 BitStream!10680 Bool tuple2!21052 tuple2!21052 BitStream!10680 Bool) Unit!17865)

(assert (=> d!82398 (= lt!383056 (choose!50 lt!382805 (_2!11446 lt!382804) lt!383057 lt!383058 (tuple2!21053 (_1!11448 lt!383058) (_2!11448 lt!383058)) (_1!11448 lt!383058) (_2!11448 lt!383058) lt!383055 (tuple2!21053 (_1!11448 lt!383055) (_2!11448 lt!383055)) (_1!11448 lt!383055) (_2!11448 lt!383055)))))

(assert (=> d!82398 (= lt!383055 (readBitPure!0 lt!383057))))

(assert (=> d!82398 (= lt!383058 (readBitPure!0 lt!382805))))

(assert (=> d!82398 (= lt!383057 (BitStream!10681 (buf!6357 (_2!11446 lt!382804)) (currentByte!11747 lt!382805) (currentBit!11742 lt!382805)))))

(assert (=> d!82398 (invariant!0 (currentBit!11742 lt!382805) (currentByte!11747 lt!382805) (size!5879 (buf!6357 (_2!11446 lt!382804))))))

(assert (=> d!82398 (= (readBitPrefixLemma!0 lt!382805 (_2!11446 lt!382804)) lt!383056)))

(declare-fun b!245574 () Bool)

(assert (=> b!245574 (= e!170142 (= (_2!11448 lt!383058) (_2!11448 lt!383055)))))

(assert (= (and d!82398 res!205345) b!245574))

(declare-fun m!370361 () Bool)

(assert (=> d!82398 m!370361))

(declare-fun m!370363 () Bool)

(assert (=> d!82398 m!370363))

(declare-fun m!370365 () Bool)

(assert (=> d!82398 m!370365))

(declare-fun m!370367 () Bool)

(assert (=> d!82398 m!370367))

(assert (=> d!82398 m!370119))

(declare-fun m!370369 () Bool)

(assert (=> d!82398 m!370369))

(assert (=> b!245438 d!82398))

(declare-fun d!82402 () Bool)

(assert (=> d!82402 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382803) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817)))) lt!382803))))

(declare-fun bs!20848 () Bool)

(assert (= bs!20848 d!82402))

(declare-fun m!370371 () Bool)

(assert (=> bs!20848 m!370371))

(assert (=> b!245438 d!82402))

(declare-fun d!82404 () Bool)

(declare-fun e!170145 () Bool)

(assert (=> d!82404 e!170145))

(declare-fun res!205351 () Bool)

(assert (=> d!82404 (=> (not res!205351) (not e!170145))))

(declare-fun lt!383072 () (_ BitVec 64))

(declare-fun lt!383075 () (_ BitVec 64))

(declare-fun lt!383071 () (_ BitVec 64))

(assert (=> d!82404 (= res!205351 (= lt!383071 (bvsub lt!383072 lt!383075)))))

(assert (=> d!82404 (or (= (bvand lt!383072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383072 lt!383075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82404 (= lt!383075 (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 (_1!11448 lt!382802)))) ((_ sign_extend 32) (currentByte!11747 (_1!11448 lt!382802))) ((_ sign_extend 32) (currentBit!11742 (_1!11448 lt!382802)))))))

(declare-fun lt!383073 () (_ BitVec 64))

(declare-fun lt!383076 () (_ BitVec 64))

(assert (=> d!82404 (= lt!383072 (bvmul lt!383073 lt!383076))))

(assert (=> d!82404 (or (= lt!383073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383076 (bvsdiv (bvmul lt!383073 lt!383076) lt!383073)))))

(assert (=> d!82404 (= lt!383076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82404 (= lt!383073 ((_ sign_extend 32) (size!5879 (buf!6357 (_1!11448 lt!382802)))))))

(assert (=> d!82404 (= lt!383071 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11747 (_1!11448 lt!382802))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11742 (_1!11448 lt!382802)))))))

(assert (=> d!82404 (invariant!0 (currentBit!11742 (_1!11448 lt!382802)) (currentByte!11747 (_1!11448 lt!382802)) (size!5879 (buf!6357 (_1!11448 lt!382802))))))

(assert (=> d!82404 (= (bitIndex!0 (size!5879 (buf!6357 (_1!11448 lt!382802))) (currentByte!11747 (_1!11448 lt!382802)) (currentBit!11742 (_1!11448 lt!382802))) lt!383071)))

(declare-fun b!245579 () Bool)

(declare-fun res!205350 () Bool)

(assert (=> b!245579 (=> (not res!205350) (not e!170145))))

(assert (=> b!245579 (= res!205350 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383071))))

(declare-fun b!245580 () Bool)

(declare-fun lt!383074 () (_ BitVec 64))

(assert (=> b!245580 (= e!170145 (bvsle lt!383071 (bvmul lt!383074 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245580 (or (= lt!383074 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383074 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383074)))))

(assert (=> b!245580 (= lt!383074 ((_ sign_extend 32) (size!5879 (buf!6357 (_1!11448 lt!382802)))))))

(assert (= (and d!82404 res!205351) b!245579))

(assert (= (and b!245579 res!205350) b!245580))

(declare-fun m!370377 () Bool)

(assert (=> d!82404 m!370377))

(declare-fun m!370379 () Bool)

(assert (=> d!82404 m!370379))

(assert (=> b!245438 d!82404))

(declare-fun d!82408 () Bool)

(declare-fun lt!383083 () tuple2!21060)

(assert (=> d!82408 (= lt!383083 (readBit!0 (_1!11447 lt!382806)))))

(assert (=> d!82408 (= (readBitPure!0 (_1!11447 lt!382806)) (tuple2!21053 (_2!11452 lt!383083) (_1!11452 lt!383083)))))

(declare-fun bs!20849 () Bool)

(assert (= bs!20849 d!82408))

(declare-fun m!370385 () Bool)

(assert (=> bs!20849 m!370385))

(assert (=> b!245438 d!82408))

(declare-fun d!82412 () Bool)

(declare-fun lt!383084 () tuple2!21060)

(assert (=> d!82412 (= lt!383084 (readBit!0 (BitStream!10681 (buf!6357 (_2!11446 lt!382804)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005))))))

(assert (=> d!82412 (= (readBitPure!0 (BitStream!10681 (buf!6357 (_2!11446 lt!382804)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005))) (tuple2!21053 (_2!11452 lt!383084) (_1!11452 lt!383084)))))

(declare-fun bs!20850 () Bool)

(assert (= bs!20850 d!82412))

(declare-fun m!370387 () Bool)

(assert (=> bs!20850 m!370387))

(assert (=> b!245438 d!82412))

(declare-fun d!82414 () Bool)

(assert (=> d!82414 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 thiss!1005)) ((_ sign_extend 32) (currentBit!11742 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383085 () Unit!17865)

(assert (=> d!82414 (= lt!383085 (choose!9 thiss!1005 (buf!6357 (_2!11446 lt!382804)) (bvsub nBits!297 from!289) (BitStream!10681 (buf!6357 (_2!11446 lt!382804)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005))))))

(assert (=> d!82414 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6357 (_2!11446 lt!382804)) (bvsub nBits!297 from!289)) lt!383085)))

(declare-fun bs!20851 () Bool)

(assert (= bs!20851 d!82414))

(assert (=> bs!20851 m!370113))

(declare-fun m!370389 () Bool)

(assert (=> bs!20851 m!370389))

(assert (=> b!245438 d!82414))

(declare-fun d!82416 () Bool)

(assert (=> d!82416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 thiss!1005))) ((_ sign_extend 32) (currentByte!11747 thiss!1005)) ((_ sign_extend 32) (currentBit!11742 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 thiss!1005))) ((_ sign_extend 32) (currentByte!11747 thiss!1005)) ((_ sign_extend 32) (currentBit!11742 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20852 () Bool)

(assert (= bs!20852 d!82416))

(declare-fun m!370391 () Bool)

(assert (=> bs!20852 m!370391))

(assert (=> b!245428 d!82416))

(declare-fun d!82418 () Bool)

(assert (=> d!82418 (= (invariant!0 (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005) (size!5879 (buf!6357 (_2!11446 lt!382817)))) (and (bvsge (currentBit!11742 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11742 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11747 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11747 thiss!1005) (size!5879 (buf!6357 (_2!11446 lt!382817)))) (and (= (currentBit!11742 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11747 thiss!1005) (size!5879 (buf!6357 (_2!11446 lt!382817))))))))))

(assert (=> b!245429 d!82418))

(declare-fun d!82426 () Bool)

(declare-fun e!170147 () Bool)

(assert (=> d!82426 e!170147))

(declare-fun res!205355 () Bool)

(assert (=> d!82426 (=> (not res!205355) (not e!170147))))

(declare-fun lt!383087 () (_ BitVec 64))

(declare-fun lt!383090 () (_ BitVec 64))

(declare-fun lt!383086 () (_ BitVec 64))

(assert (=> d!82426 (= res!205355 (= lt!383086 (bvsub lt!383087 lt!383090)))))

(assert (=> d!82426 (or (= (bvand lt!383087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383090 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383087 lt!383090) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82426 (= lt!383090 (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382817)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817)))))))

(declare-fun lt!383088 () (_ BitVec 64))

(declare-fun lt!383091 () (_ BitVec 64))

(assert (=> d!82426 (= lt!383087 (bvmul lt!383088 lt!383091))))

(assert (=> d!82426 (or (= lt!383088 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383091 (bvsdiv (bvmul lt!383088 lt!383091) lt!383088)))))

(assert (=> d!82426 (= lt!383091 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82426 (= lt!383088 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382817)))))))

(assert (=> d!82426 (= lt!383086 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817)))))))

(assert (=> d!82426 (invariant!0 (currentBit!11742 (_2!11446 lt!382817)) (currentByte!11747 (_2!11446 lt!382817)) (size!5879 (buf!6357 (_2!11446 lt!382817))))))

(assert (=> d!82426 (= (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382817))) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817))) lt!383086)))

(declare-fun b!245583 () Bool)

(declare-fun res!205354 () Bool)

(assert (=> b!245583 (=> (not res!205354) (not e!170147))))

(assert (=> b!245583 (= res!205354 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383086))))

(declare-fun b!245584 () Bool)

(declare-fun lt!383089 () (_ BitVec 64))

(assert (=> b!245584 (= e!170147 (bvsle lt!383086 (bvmul lt!383089 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245584 (or (= lt!383089 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383089 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383089)))))

(assert (=> b!245584 (= lt!383089 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382817)))))))

(assert (= (and d!82426 res!205355) b!245583))

(assert (= (and b!245583 res!205354) b!245584))

(assert (=> d!82426 m!370357))

(declare-fun m!370397 () Bool)

(assert (=> d!82426 m!370397))

(assert (=> b!245435 d!82426))

(declare-fun d!82428 () Bool)

(declare-fun e!170148 () Bool)

(assert (=> d!82428 e!170148))

(declare-fun res!205357 () Bool)

(assert (=> d!82428 (=> (not res!205357) (not e!170148))))

(declare-fun lt!383093 () (_ BitVec 64))

(declare-fun lt!383092 () (_ BitVec 64))

(declare-fun lt!383096 () (_ BitVec 64))

(assert (=> d!82428 (= res!205357 (= lt!383092 (bvsub lt!383093 lt!383096)))))

(assert (=> d!82428 (or (= (bvand lt!383093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383096 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383093 lt!383096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82428 (= lt!383096 (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 thiss!1005))) ((_ sign_extend 32) (currentByte!11747 thiss!1005)) ((_ sign_extend 32) (currentBit!11742 thiss!1005))))))

(declare-fun lt!383094 () (_ BitVec 64))

(declare-fun lt!383097 () (_ BitVec 64))

(assert (=> d!82428 (= lt!383093 (bvmul lt!383094 lt!383097))))

(assert (=> d!82428 (or (= lt!383094 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383097 (bvsdiv (bvmul lt!383094 lt!383097) lt!383094)))))

(assert (=> d!82428 (= lt!383097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82428 (= lt!383094 ((_ sign_extend 32) (size!5879 (buf!6357 thiss!1005))))))

(assert (=> d!82428 (= lt!383092 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11747 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11742 thiss!1005))))))

(assert (=> d!82428 (invariant!0 (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005) (size!5879 (buf!6357 thiss!1005)))))

(assert (=> d!82428 (= (bitIndex!0 (size!5879 (buf!6357 thiss!1005)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)) lt!383092)))

(declare-fun b!245585 () Bool)

(declare-fun res!205356 () Bool)

(assert (=> b!245585 (=> (not res!205356) (not e!170148))))

(assert (=> b!245585 (= res!205356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383092))))

(declare-fun b!245586 () Bool)

(declare-fun lt!383095 () (_ BitVec 64))

(assert (=> b!245586 (= e!170148 (bvsle lt!383092 (bvmul lt!383095 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245586 (or (= lt!383095 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383095 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383095)))))

(assert (=> b!245586 (= lt!383095 ((_ sign_extend 32) (size!5879 (buf!6357 thiss!1005))))))

(assert (= (and d!82428 res!205357) b!245585))

(assert (= (and b!245585 res!205356) b!245586))

(assert (=> d!82428 m!370391))

(declare-fun m!370399 () Bool)

(assert (=> d!82428 m!370399))

(assert (=> b!245435 d!82428))

(declare-fun d!82430 () Bool)

(declare-fun lt!383098 () tuple2!21060)

(assert (=> d!82430 (= lt!383098 (checkBitsLoop!0 (_1!11447 lt!382816) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82430 (= (checkBitsLoopPure!0 (_1!11447 lt!382816) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21053 (_2!11452 lt!383098) (_1!11452 lt!383098)))))

(declare-fun bs!20856 () Bool)

(assert (= bs!20856 d!82430))

(declare-fun m!370401 () Bool)

(assert (=> bs!20856 m!370401))

(assert (=> b!245436 d!82430))

(declare-fun d!82432 () Bool)

(assert (=> d!82432 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382800) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817)))) lt!382800))))

(declare-fun bs!20857 () Bool)

(assert (= bs!20857 d!82432))

(assert (=> bs!20857 m!370371))

(assert (=> b!245436 d!82432))

(declare-fun d!82434 () Bool)

(assert (=> d!82434 (validate_offset_bits!1 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382817))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382817))) lt!382800)))

(declare-fun lt!383099 () Unit!17865)

(assert (=> d!82434 (= lt!383099 (choose!9 (_2!11446 lt!382817) (buf!6357 (_2!11446 lt!382804)) lt!382800 (BitStream!10681 (buf!6357 (_2!11446 lt!382804)) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817)))))))

(assert (=> d!82434 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11446 lt!382817) (buf!6357 (_2!11446 lt!382804)) lt!382800) lt!383099)))

(declare-fun bs!20858 () Bool)

(assert (= bs!20858 d!82434))

(assert (=> bs!20858 m!370153))

(declare-fun m!370403 () Bool)

(assert (=> bs!20858 m!370403))

(assert (=> b!245436 d!82434))

(assert (=> b!245436 d!82372))

(declare-fun d!82436 () Bool)

(assert (=> d!82436 (= (invariant!0 (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005) (size!5879 (buf!6357 (_2!11446 lt!382804)))) (and (bvsge (currentBit!11742 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11742 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11747 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11747 thiss!1005) (size!5879 (buf!6357 (_2!11446 lt!382804)))) (and (= (currentBit!11742 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11747 thiss!1005) (size!5879 (buf!6357 (_2!11446 lt!382804))))))))))

(assert (=> b!245437 d!82436))

(declare-fun d!82438 () Bool)

(declare-fun lt!383100 () tuple2!21060)

(assert (=> d!82438 (= lt!383100 (readBit!0 (readerFrom!0 (_2!11446 lt!382817) (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005))))))

(assert (=> d!82438 (= (readBitPure!0 (readerFrom!0 (_2!11446 lt!382817) (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005))) (tuple2!21053 (_2!11452 lt!383100) (_1!11452 lt!383100)))))

(declare-fun bs!20859 () Bool)

(assert (= bs!20859 d!82438))

(assert (=> bs!20859 m!370107))

(declare-fun m!370405 () Bool)

(assert (=> bs!20859 m!370405))

(assert (=> b!245443 d!82438))

(declare-fun d!82440 () Bool)

(declare-fun e!170152 () Bool)

(assert (=> d!82440 e!170152))

(declare-fun res!205363 () Bool)

(assert (=> d!82440 (=> (not res!205363) (not e!170152))))

(assert (=> d!82440 (= res!205363 (invariant!0 (currentBit!11742 (_2!11446 lt!382817)) (currentByte!11747 (_2!11446 lt!382817)) (size!5879 (buf!6357 (_2!11446 lt!382817)))))))

(assert (=> d!82440 (= (readerFrom!0 (_2!11446 lt!382817) (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005)) (BitStream!10681 (buf!6357 (_2!11446 lt!382817)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)))))

(declare-fun b!245591 () Bool)

(assert (=> b!245591 (= e!170152 (invariant!0 (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005) (size!5879 (buf!6357 (_2!11446 lt!382817)))))))

(assert (= (and d!82440 res!205363) b!245591))

(assert (=> d!82440 m!370397))

(assert (=> b!245591 m!370105))

(assert (=> b!245443 d!82440))

(declare-fun d!82446 () Bool)

(declare-fun e!170153 () Bool)

(assert (=> d!82446 e!170153))

(declare-fun res!205365 () Bool)

(assert (=> d!82446 (=> (not res!205365) (not e!170153))))

(declare-fun lt!383110 () (_ BitVec 64))

(declare-fun lt!383114 () (_ BitVec 64))

(declare-fun lt!383111 () (_ BitVec 64))

(assert (=> d!82446 (= res!205365 (= lt!383110 (bvsub lt!383111 lt!383114)))))

(assert (=> d!82446 (or (= (bvand lt!383111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383114 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383111 lt!383114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82446 (= lt!383114 (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 (_1!11448 lt!382815)))) ((_ sign_extend 32) (currentByte!11747 (_1!11448 lt!382815))) ((_ sign_extend 32) (currentBit!11742 (_1!11448 lt!382815)))))))

(declare-fun lt!383112 () (_ BitVec 64))

(declare-fun lt!383115 () (_ BitVec 64))

(assert (=> d!82446 (= lt!383111 (bvmul lt!383112 lt!383115))))

(assert (=> d!82446 (or (= lt!383112 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383115 (bvsdiv (bvmul lt!383112 lt!383115) lt!383112)))))

(assert (=> d!82446 (= lt!383115 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82446 (= lt!383112 ((_ sign_extend 32) (size!5879 (buf!6357 (_1!11448 lt!382815)))))))

(assert (=> d!82446 (= lt!383110 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11747 (_1!11448 lt!382815))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11742 (_1!11448 lt!382815)))))))

(assert (=> d!82446 (invariant!0 (currentBit!11742 (_1!11448 lt!382815)) (currentByte!11747 (_1!11448 lt!382815)) (size!5879 (buf!6357 (_1!11448 lt!382815))))))

(assert (=> d!82446 (= (bitIndex!0 (size!5879 (buf!6357 (_1!11448 lt!382815))) (currentByte!11747 (_1!11448 lt!382815)) (currentBit!11742 (_1!11448 lt!382815))) lt!383110)))

(declare-fun b!245592 () Bool)

(declare-fun res!205364 () Bool)

(assert (=> b!245592 (=> (not res!205364) (not e!170153))))

(assert (=> b!245592 (= res!205364 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383110))))

(declare-fun b!245593 () Bool)

(declare-fun lt!383113 () (_ BitVec 64))

(assert (=> b!245593 (= e!170153 (bvsle lt!383110 (bvmul lt!383113 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245593 (or (= lt!383113 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383113 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383113)))))

(assert (=> b!245593 (= lt!383113 ((_ sign_extend 32) (size!5879 (buf!6357 (_1!11448 lt!382815)))))))

(assert (= (and d!82446 res!205365) b!245592))

(assert (= (and b!245592 res!205364) b!245593))

(declare-fun m!370413 () Bool)

(assert (=> d!82446 m!370413))

(declare-fun m!370415 () Bool)

(assert (=> d!82446 m!370415))

(assert (=> b!245432 d!82446))

(declare-fun d!82448 () Bool)

(declare-fun res!205366 () Bool)

(declare-fun e!170155 () Bool)

(assert (=> d!82448 (=> (not res!205366) (not e!170155))))

(assert (=> d!82448 (= res!205366 (= (size!5879 (buf!6357 (_2!11446 lt!382817))) (size!5879 (buf!6357 (_2!11446 lt!382804)))))))

(assert (=> d!82448 (= (isPrefixOf!0 (_2!11446 lt!382817) (_2!11446 lt!382804)) e!170155)))

(declare-fun b!245594 () Bool)

(declare-fun res!205367 () Bool)

(assert (=> b!245594 (=> (not res!205367) (not e!170155))))

(assert (=> b!245594 (= res!205367 (bvsle (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382817))) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817))) (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382804))) (currentByte!11747 (_2!11446 lt!382804)) (currentBit!11742 (_2!11446 lt!382804)))))))

(declare-fun b!245595 () Bool)

(declare-fun e!170154 () Bool)

(assert (=> b!245595 (= e!170155 e!170154)))

(declare-fun res!205368 () Bool)

(assert (=> b!245595 (=> res!205368 e!170154)))

(assert (=> b!245595 (= res!205368 (= (size!5879 (buf!6357 (_2!11446 lt!382817))) #b00000000000000000000000000000000))))

(declare-fun b!245596 () Bool)

(assert (=> b!245596 (= e!170154 (arrayBitRangesEq!0 (buf!6357 (_2!11446 lt!382817)) (buf!6357 (_2!11446 lt!382804)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382817))) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817)))))))

(assert (= (and d!82448 res!205366) b!245594))

(assert (= (and b!245594 res!205367) b!245595))

(assert (= (and b!245595 (not res!205368)) b!245596))

(assert (=> b!245594 m!370163))

(assert (=> b!245594 m!370167))

(assert (=> b!245596 m!370163))

(assert (=> b!245596 m!370163))

(declare-fun m!370417 () Bool)

(assert (=> b!245596 m!370417))

(assert (=> b!245433 d!82448))

(declare-fun d!82450 () Bool)

(assert (=> d!82450 (= (invariant!0 (currentBit!11742 (_2!11446 lt!382804)) (currentByte!11747 (_2!11446 lt!382804)) (size!5879 (buf!6357 (_2!11446 lt!382804)))) (and (bvsge (currentBit!11742 (_2!11446 lt!382804)) #b00000000000000000000000000000000) (bvslt (currentBit!11742 (_2!11446 lt!382804)) #b00000000000000000000000000001000) (bvsge (currentByte!11747 (_2!11446 lt!382804)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11747 (_2!11446 lt!382804)) (size!5879 (buf!6357 (_2!11446 lt!382804)))) (and (= (currentBit!11742 (_2!11446 lt!382804)) #b00000000000000000000000000000000) (= (currentByte!11747 (_2!11446 lt!382804)) (size!5879 (buf!6357 (_2!11446 lt!382804))))))))))

(assert (=> b!245444 d!82450))

(declare-fun d!82452 () Bool)

(assert (=> d!82452 (= (array_inv!5620 (buf!6357 thiss!1005)) (bvsge (size!5879 (buf!6357 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!245434 d!82452))

(declare-fun d!82454 () Bool)

(assert (=> d!82454 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11742 thiss!1005) (currentByte!11747 thiss!1005) (size!5879 (buf!6357 thiss!1005))))))

(declare-fun bs!20861 () Bool)

(assert (= bs!20861 d!82454))

(assert (=> bs!20861 m!370399))

(assert (=> start!52984 d!82454))

(declare-fun d!82456 () Bool)

(declare-fun res!205369 () Bool)

(declare-fun e!170157 () Bool)

(assert (=> d!82456 (=> (not res!205369) (not e!170157))))

(assert (=> d!82456 (= res!205369 (= (size!5879 (buf!6357 thiss!1005)) (size!5879 (buf!6357 (_2!11446 lt!382817)))))))

(assert (=> d!82456 (= (isPrefixOf!0 thiss!1005 (_2!11446 lt!382817)) e!170157)))

(declare-fun b!245597 () Bool)

(declare-fun res!205370 () Bool)

(assert (=> b!245597 (=> (not res!205370) (not e!170157))))

(assert (=> b!245597 (= res!205370 (bvsle (bitIndex!0 (size!5879 (buf!6357 thiss!1005)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005)) (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382817))) (currentByte!11747 (_2!11446 lt!382817)) (currentBit!11742 (_2!11446 lt!382817)))))))

(declare-fun b!245598 () Bool)

(declare-fun e!170156 () Bool)

(assert (=> b!245598 (= e!170157 e!170156)))

(declare-fun res!205371 () Bool)

(assert (=> b!245598 (=> res!205371 e!170156)))

(assert (=> b!245598 (= res!205371 (= (size!5879 (buf!6357 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245599 () Bool)

(assert (=> b!245599 (= e!170156 (arrayBitRangesEq!0 (buf!6357 thiss!1005) (buf!6357 (_2!11446 lt!382817)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5879 (buf!6357 thiss!1005)) (currentByte!11747 thiss!1005) (currentBit!11742 thiss!1005))))))

(assert (= (and d!82456 res!205369) b!245597))

(assert (= (and b!245597 res!205370) b!245598))

(assert (= (and b!245598 (not res!205371)) b!245599))

(assert (=> b!245597 m!370165))

(assert (=> b!245597 m!370163))

(assert (=> b!245599 m!370165))

(assert (=> b!245599 m!370165))

(declare-fun m!370419 () Bool)

(assert (=> b!245599 m!370419))

(assert (=> b!245430 d!82456))

(declare-fun d!82458 () Bool)

(declare-fun e!170164 () Bool)

(assert (=> d!82458 e!170164))

(declare-fun res!205379 () Bool)

(assert (=> d!82458 (=> (not res!205379) (not e!170164))))

(declare-fun lt!383139 () (_ BitVec 64))

(declare-fun lt!383138 () BitStream!10680)

(assert (=> d!82458 (= res!205379 (= (bvadd lt!383139 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5879 (buf!6357 lt!383138)) (currentByte!11747 lt!383138) (currentBit!11742 lt!383138))))))

(assert (=> d!82458 (or (not (= (bvand lt!383139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!383139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!383139 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82458 (= lt!383139 (bitIndex!0 (size!5879 (buf!6357 (_1!11447 lt!382806))) (currentByte!11747 (_1!11447 lt!382806)) (currentBit!11742 (_1!11447 lt!382806))))))

(declare-fun moveBitIndex!0 (BitStream!10680 (_ BitVec 64)) tuple2!21048)

(assert (=> d!82458 (= lt!383138 (_2!11446 (moveBitIndex!0 (_1!11447 lt!382806) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10680 (_ BitVec 64)) Bool)

(assert (=> d!82458 (moveBitIndexPrecond!0 (_1!11447 lt!382806) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!82458 (= (withMovedBitIndex!0 (_1!11447 lt!382806) #b0000000000000000000000000000000000000000000000000000000000000001) lt!383138)))

(declare-fun b!245607 () Bool)

(assert (=> b!245607 (= e!170164 (= (size!5879 (buf!6357 (_1!11447 lt!382806))) (size!5879 (buf!6357 lt!383138))))))

(assert (= (and d!82458 res!205379) b!245607))

(declare-fun m!370435 () Bool)

(assert (=> d!82458 m!370435))

(declare-fun m!370437 () Bool)

(assert (=> d!82458 m!370437))

(declare-fun m!370439 () Bool)

(assert (=> d!82458 m!370439))

(declare-fun m!370441 () Bool)

(assert (=> d!82458 m!370441))

(assert (=> b!245431 d!82458))

(declare-fun d!82464 () Bool)

(declare-fun e!170165 () Bool)

(assert (=> d!82464 e!170165))

(declare-fun res!205381 () Bool)

(assert (=> d!82464 (=> (not res!205381) (not e!170165))))

(declare-fun lt!383140 () (_ BitVec 64))

(declare-fun lt!383144 () (_ BitVec 64))

(declare-fun lt!383141 () (_ BitVec 64))

(assert (=> d!82464 (= res!205381 (= lt!383140 (bvsub lt!383141 lt!383144)))))

(assert (=> d!82464 (or (= (bvand lt!383141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383141 lt!383144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82464 (= lt!383144 (remainingBits!0 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))) ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382804))) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382804)))))))

(declare-fun lt!383142 () (_ BitVec 64))

(declare-fun lt!383145 () (_ BitVec 64))

(assert (=> d!82464 (= lt!383141 (bvmul lt!383142 lt!383145))))

(assert (=> d!82464 (or (= lt!383142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383145 (bvsdiv (bvmul lt!383142 lt!383145) lt!383142)))))

(assert (=> d!82464 (= lt!383145 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82464 (= lt!383142 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))))))

(assert (=> d!82464 (= lt!383140 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11747 (_2!11446 lt!382804))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11742 (_2!11446 lt!382804)))))))

(assert (=> d!82464 (invariant!0 (currentBit!11742 (_2!11446 lt!382804)) (currentByte!11747 (_2!11446 lt!382804)) (size!5879 (buf!6357 (_2!11446 lt!382804))))))

(assert (=> d!82464 (= (bitIndex!0 (size!5879 (buf!6357 (_2!11446 lt!382804))) (currentByte!11747 (_2!11446 lt!382804)) (currentBit!11742 (_2!11446 lt!382804))) lt!383140)))

(declare-fun b!245608 () Bool)

(declare-fun res!205380 () Bool)

(assert (=> b!245608 (=> (not res!205380) (not e!170165))))

(assert (=> b!245608 (= res!205380 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383140))))

(declare-fun b!245609 () Bool)

(declare-fun lt!383143 () (_ BitVec 64))

(assert (=> b!245609 (= e!170165 (bvsle lt!383140 (bvmul lt!383143 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245609 (or (= lt!383143 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383143 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383143)))))

(assert (=> b!245609 (= lt!383143 ((_ sign_extend 32) (size!5879 (buf!6357 (_2!11446 lt!382804)))))))

(assert (= (and d!82464 res!205381) b!245608))

(assert (= (and b!245608 res!205380) b!245609))

(declare-fun m!370443 () Bool)

(assert (=> d!82464 m!370443))

(assert (=> d!82464 m!370099))

(assert (=> b!245442 d!82464))

(assert (=> b!245442 d!82426))

(check-sat (not d!82398) (not d!82446) (not d!82404) (not b!245591) (not b!245564) (not d!82440) (not b!245594) (not d!82376) (not b!245519) (not d!82428) (not d!82384) (not d!82378) (not d!82458) (not d!82414) (not d!82392) (not d!82464) (not d!82438) (not b!245550) (not d!82386) (not b!245518) (not b!245596) (not b!245552) (not b!245529) (not b!245504) (not d!82366) (not d!82374) (not d!82388) (not d!82430) (not d!82412) (not d!82382) (not b!245517) (not b!245530) (not b!245562) (not b!245560) (not d!82416) (not d!82380) (not d!82402) (not d!82454) (not d!82396) (not b!245563) (not b!245599) (not b!245515) (not b!245553) (not d!82408) (not d!82368) (not b!245540) (not b!245531) (not d!82434) (not d!82372) (not b!245502) (not b!245551) (not b!245597) (not d!82426) (not b!245528) (not d!82432))
