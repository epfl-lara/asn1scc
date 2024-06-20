; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54642 () Bool)

(assert start!54642)

(declare-fun b!255778 () Bool)

(declare-fun e!177198 () Bool)

(declare-datatypes ((array!13789 0))(
  ( (array!13790 (arr!7036 (Array (_ BitVec 32) (_ BitVec 8))) (size!6049 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11020 0))(
  ( (BitStream!11021 (buf!6566 array!13789) (currentByte!12045 (_ BitVec 32)) (currentBit!12040 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11020)

(declare-fun array_inv!5790 (array!13789) Bool)

(assert (=> b!255778 (= e!177198 (array_inv!5790 (buf!6566 thiss!1005)))))

(declare-fun res!214418 () Bool)

(declare-fun e!177196 () Bool)

(assert (=> start!54642 (=> (not res!214418) (not e!177196))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!54642 (= res!214418 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54642 e!177196))

(assert (=> start!54642 true))

(declare-fun inv!12 (BitStream!11020) Bool)

(assert (=> start!54642 (and (inv!12 thiss!1005) e!177198)))

(declare-fun b!255779 () Bool)

(declare-fun e!177200 () Bool)

(declare-datatypes ((tuple2!21882 0))(
  ( (tuple2!21883 (_1!11875 BitStream!11020) (_2!11875 Bool)) )
))
(declare-fun lt!397219 () tuple2!21882)

(declare-fun lt!397215 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255779 (= e!177200 (= (bitIndex!0 (size!6049 (buf!6566 (_1!11875 lt!397219))) (currentByte!12045 (_1!11875 lt!397219)) (currentBit!12040 (_1!11875 lt!397219))) lt!397215))))

(declare-fun b!255780 () Bool)

(declare-fun res!214420 () Bool)

(declare-fun e!177204 () Bool)

(assert (=> b!255780 (=> (not res!214420) (not e!177204))))

(declare-datatypes ((Unit!18306 0))(
  ( (Unit!18307) )
))
(declare-datatypes ((tuple2!21884 0))(
  ( (tuple2!21885 (_1!11876 Unit!18306) (_2!11876 BitStream!11020)) )
))
(declare-fun lt!397211 () tuple2!21884)

(declare-fun lt!397233 () tuple2!21884)

(declare-fun isPrefixOf!0 (BitStream!11020 BitStream!11020) Bool)

(assert (=> b!255780 (= res!214420 (isPrefixOf!0 (_2!11876 lt!397211) (_2!11876 lt!397233)))))

(declare-fun b!255781 () Bool)

(declare-fun e!177199 () Bool)

(assert (=> b!255781 (= e!177196 (not e!177199))))

(declare-fun res!214423 () Bool)

(assert (=> b!255781 (=> res!214423 e!177199)))

(declare-fun lt!397216 () tuple2!21882)

(declare-datatypes ((tuple2!21886 0))(
  ( (tuple2!21887 (_1!11877 BitStream!11020) (_2!11877 BitStream!11020)) )
))
(declare-fun lt!397223 () tuple2!21886)

(assert (=> b!255781 (= res!214423 (not (= (_1!11875 lt!397216) (_2!11877 lt!397223))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11020 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21882)

(assert (=> b!255781 (= lt!397216 (checkBitsLoopPure!0 (_1!11877 lt!397223) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397230 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255781 (validate_offset_bits!1 ((_ sign_extend 32) (size!6049 (buf!6566 (_2!11876 lt!397233)))) ((_ sign_extend 32) (currentByte!12045 (_2!11876 lt!397211))) ((_ sign_extend 32) (currentBit!12040 (_2!11876 lt!397211))) lt!397230)))

(declare-fun lt!397220 () Unit!18306)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11020 array!13789 (_ BitVec 64)) Unit!18306)

(assert (=> b!255781 (= lt!397220 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11876 lt!397211) (buf!6566 (_2!11876 lt!397233)) lt!397230))))

(declare-fun lt!397221 () tuple2!21882)

(declare-fun lt!397226 () tuple2!21886)

(assert (=> b!255781 (= lt!397221 (checkBitsLoopPure!0 (_1!11877 lt!397226) nBits!297 bit!26 from!289))))

(assert (=> b!255781 (validate_offset_bits!1 ((_ sign_extend 32) (size!6049 (buf!6566 (_2!11876 lt!397233)))) ((_ sign_extend 32) (currentByte!12045 thiss!1005)) ((_ sign_extend 32) (currentBit!12040 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397231 () Unit!18306)

(assert (=> b!255781 (= lt!397231 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6566 (_2!11876 lt!397233)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!11020) tuple2!21882)

(assert (=> b!255781 (= (_2!11875 (readBitPure!0 (_1!11877 lt!397226))) bit!26)))

(declare-fun reader!0 (BitStream!11020 BitStream!11020) tuple2!21886)

(assert (=> b!255781 (= lt!397223 (reader!0 (_2!11876 lt!397211) (_2!11876 lt!397233)))))

(assert (=> b!255781 (= lt!397226 (reader!0 thiss!1005 (_2!11876 lt!397233)))))

(declare-fun e!177206 () Bool)

(assert (=> b!255781 e!177206))

(declare-fun res!214425 () Bool)

(assert (=> b!255781 (=> (not res!214425) (not e!177206))))

(declare-fun lt!397210 () tuple2!21882)

(declare-fun lt!397218 () tuple2!21882)

(assert (=> b!255781 (= res!214425 (= (bitIndex!0 (size!6049 (buf!6566 (_1!11875 lt!397210))) (currentByte!12045 (_1!11875 lt!397210)) (currentBit!12040 (_1!11875 lt!397210))) (bitIndex!0 (size!6049 (buf!6566 (_1!11875 lt!397218))) (currentByte!12045 (_1!11875 lt!397218)) (currentBit!12040 (_1!11875 lt!397218)))))))

(declare-fun lt!397227 () Unit!18306)

(declare-fun lt!397225 () BitStream!11020)

(declare-fun readBitPrefixLemma!0 (BitStream!11020 BitStream!11020) Unit!18306)

(assert (=> b!255781 (= lt!397227 (readBitPrefixLemma!0 lt!397225 (_2!11876 lt!397233)))))

(assert (=> b!255781 (= lt!397218 (readBitPure!0 (BitStream!11021 (buf!6566 (_2!11876 lt!397233)) (currentByte!12045 thiss!1005) (currentBit!12040 thiss!1005))))))

(assert (=> b!255781 (= lt!397210 (readBitPure!0 lt!397225))))

(assert (=> b!255781 (= lt!397225 (BitStream!11021 (buf!6566 (_2!11876 lt!397211)) (currentByte!12045 thiss!1005) (currentBit!12040 thiss!1005)))))

(declare-fun e!177201 () Bool)

(assert (=> b!255781 e!177201))

(declare-fun res!214419 () Bool)

(assert (=> b!255781 (=> (not res!214419) (not e!177201))))

(assert (=> b!255781 (= res!214419 (isPrefixOf!0 thiss!1005 (_2!11876 lt!397233)))))

(declare-fun lt!397228 () Unit!18306)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11020 BitStream!11020 BitStream!11020) Unit!18306)

(assert (=> b!255781 (= lt!397228 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11876 lt!397211) (_2!11876 lt!397233)))))

(declare-fun e!177205 () Bool)

(assert (=> b!255781 e!177205))

(declare-fun res!214426 () Bool)

(assert (=> b!255781 (=> (not res!214426) (not e!177205))))

(assert (=> b!255781 (= res!214426 (= (size!6049 (buf!6566 (_2!11876 lt!397211))) (size!6049 (buf!6566 (_2!11876 lt!397233)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11020 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21884)

(assert (=> b!255781 (= lt!397233 (appendNBitsLoop!0 (_2!11876 lt!397211) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255781 (validate_offset_bits!1 ((_ sign_extend 32) (size!6049 (buf!6566 (_2!11876 lt!397211)))) ((_ sign_extend 32) (currentByte!12045 (_2!11876 lt!397211))) ((_ sign_extend 32) (currentBit!12040 (_2!11876 lt!397211))) lt!397230)))

(assert (=> b!255781 (= lt!397230 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!397213 () Unit!18306)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11020 BitStream!11020 (_ BitVec 64) (_ BitVec 64)) Unit!18306)

(assert (=> b!255781 (= lt!397213 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11876 lt!397211) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!177203 () Bool)

(assert (=> b!255781 e!177203))

(declare-fun res!214431 () Bool)

(assert (=> b!255781 (=> (not res!214431) (not e!177203))))

(assert (=> b!255781 (= res!214431 (= (size!6049 (buf!6566 thiss!1005)) (size!6049 (buf!6566 (_2!11876 lt!397211)))))))

(declare-fun appendBit!0 (BitStream!11020 Bool) tuple2!21884)

(assert (=> b!255781 (= lt!397211 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255782 () Bool)

(declare-fun e!177195 () Bool)

(assert (=> b!255782 (= e!177195 true)))

(declare-fun lt!397232 () (_ BitVec 64))

(assert (=> b!255782 (= lt!397232 (bitIndex!0 (size!6049 (buf!6566 (_2!11876 lt!397233))) (currentByte!12045 (_2!11876 lt!397233)) (currentBit!12040 (_2!11876 lt!397233))))))

(declare-fun lt!397212 () (_ BitVec 64))

(assert (=> b!255782 (= lt!397212 (bitIndex!0 (size!6049 (buf!6566 thiss!1005)) (currentByte!12045 thiss!1005) (currentBit!12040 thiss!1005)))))

(declare-fun b!255783 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255783 (= e!177201 (invariant!0 (currentBit!12040 thiss!1005) (currentByte!12045 thiss!1005) (size!6049 (buf!6566 (_2!11876 lt!397233)))))))

(declare-fun b!255784 () Bool)

(assert (=> b!255784 (= e!177206 (= (_2!11875 lt!397210) (_2!11875 lt!397218)))))

(declare-fun b!255785 () Bool)

(declare-fun res!214427 () Bool)

(assert (=> b!255785 (=> res!214427 e!177199)))

(declare-fun withMovedBitIndex!0 (BitStream!11020 (_ BitVec 64)) BitStream!11020)

(assert (=> b!255785 (= res!214427 (not (= (_1!11877 lt!397223) (withMovedBitIndex!0 (_1!11877 lt!397226) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255786 () Bool)

(declare-fun res!214428 () Bool)

(assert (=> b!255786 (=> (not res!214428) (not e!177196))))

(assert (=> b!255786 (= res!214428 (bvslt from!289 nBits!297))))

(declare-fun b!255787 () Bool)

(declare-fun lt!397229 () tuple2!21882)

(declare-fun lt!397224 () tuple2!21886)

(assert (=> b!255787 (= e!177204 (not (or (not (_2!11875 lt!397229)) (not (= (_1!11875 lt!397229) (_2!11877 lt!397224))))))))

(assert (=> b!255787 (= lt!397229 (checkBitsLoopPure!0 (_1!11877 lt!397224) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397214 () (_ BitVec 64))

(assert (=> b!255787 (validate_offset_bits!1 ((_ sign_extend 32) (size!6049 (buf!6566 (_2!11876 lt!397233)))) ((_ sign_extend 32) (currentByte!12045 (_2!11876 lt!397211))) ((_ sign_extend 32) (currentBit!12040 (_2!11876 lt!397211))) lt!397214)))

(declare-fun lt!397222 () Unit!18306)

(assert (=> b!255787 (= lt!397222 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11876 lt!397211) (buf!6566 (_2!11876 lt!397233)) lt!397214))))

(assert (=> b!255787 (= lt!397224 (reader!0 (_2!11876 lt!397211) (_2!11876 lt!397233)))))

(declare-fun b!255788 () Bool)

(declare-fun e!177202 () Bool)

(assert (=> b!255788 (= e!177202 e!177200)))

(declare-fun res!214417 () Bool)

(assert (=> b!255788 (=> (not res!214417) (not e!177200))))

(assert (=> b!255788 (= res!214417 (and (= (_2!11875 lt!397219) bit!26) (= (_1!11875 lt!397219) (_2!11876 lt!397211))))))

(declare-fun readerFrom!0 (BitStream!11020 (_ BitVec 32) (_ BitVec 32)) BitStream!11020)

(assert (=> b!255788 (= lt!397219 (readBitPure!0 (readerFrom!0 (_2!11876 lt!397211) (currentBit!12040 thiss!1005) (currentByte!12045 thiss!1005))))))

(declare-fun b!255789 () Bool)

(assert (=> b!255789 (= e!177203 e!177202)))

(declare-fun res!214430 () Bool)

(assert (=> b!255789 (=> (not res!214430) (not e!177202))))

(declare-fun lt!397217 () (_ BitVec 64))

(assert (=> b!255789 (= res!214430 (= lt!397215 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!397217)))))

(assert (=> b!255789 (= lt!397215 (bitIndex!0 (size!6049 (buf!6566 (_2!11876 lt!397211))) (currentByte!12045 (_2!11876 lt!397211)) (currentBit!12040 (_2!11876 lt!397211))))))

(assert (=> b!255789 (= lt!397217 (bitIndex!0 (size!6049 (buf!6566 thiss!1005)) (currentByte!12045 thiss!1005) (currentBit!12040 thiss!1005)))))

(declare-fun b!255790 () Bool)

(assert (=> b!255790 (= e!177199 e!177195)))

(declare-fun res!214424 () Bool)

(assert (=> b!255790 (=> res!214424 e!177195)))

(assert (=> b!255790 (= res!214424 (not (= (size!6049 (buf!6566 thiss!1005)) (size!6049 (buf!6566 (_2!11876 lt!397233))))))))

(assert (=> b!255790 (and (= (_2!11875 lt!397221) (_2!11875 lt!397216)) (= (_1!11875 lt!397221) (_2!11877 lt!397226)))))

(declare-fun b!255791 () Bool)

(declare-fun res!214421 () Bool)

(assert (=> b!255791 (=> (not res!214421) (not e!177196))))

(assert (=> b!255791 (= res!214421 (validate_offset_bits!1 ((_ sign_extend 32) (size!6049 (buf!6566 thiss!1005))) ((_ sign_extend 32) (currentByte!12045 thiss!1005)) ((_ sign_extend 32) (currentBit!12040 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255792 () Bool)

(declare-fun res!214422 () Bool)

(assert (=> b!255792 (=> (not res!214422) (not e!177202))))

(assert (=> b!255792 (= res!214422 (isPrefixOf!0 thiss!1005 (_2!11876 lt!397211)))))

(declare-fun b!255793 () Bool)

(assert (=> b!255793 (= e!177205 e!177204)))

(declare-fun res!214416 () Bool)

(assert (=> b!255793 (=> (not res!214416) (not e!177204))))

(assert (=> b!255793 (= res!214416 (= (bitIndex!0 (size!6049 (buf!6566 (_2!11876 lt!397233))) (currentByte!12045 (_2!11876 lt!397233)) (currentBit!12040 (_2!11876 lt!397233))) (bvadd (bitIndex!0 (size!6049 (buf!6566 (_2!11876 lt!397211))) (currentByte!12045 (_2!11876 lt!397211)) (currentBit!12040 (_2!11876 lt!397211))) lt!397214)))))

(assert (=> b!255793 (= lt!397214 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255794 () Bool)

(declare-fun res!214429 () Bool)

(assert (=> b!255794 (=> (not res!214429) (not e!177201))))

(assert (=> b!255794 (= res!214429 (invariant!0 (currentBit!12040 thiss!1005) (currentByte!12045 thiss!1005) (size!6049 (buf!6566 (_2!11876 lt!397211)))))))

(assert (= (and start!54642 res!214418) b!255791))

(assert (= (and b!255791 res!214421) b!255786))

(assert (= (and b!255786 res!214428) b!255781))

(assert (= (and b!255781 res!214431) b!255789))

(assert (= (and b!255789 res!214430) b!255792))

(assert (= (and b!255792 res!214422) b!255788))

(assert (= (and b!255788 res!214417) b!255779))

(assert (= (and b!255781 res!214426) b!255793))

(assert (= (and b!255793 res!214416) b!255780))

(assert (= (and b!255780 res!214420) b!255787))

(assert (= (and b!255781 res!214419) b!255794))

(assert (= (and b!255794 res!214429) b!255783))

(assert (= (and b!255781 res!214425) b!255784))

(assert (= (and b!255781 (not res!214423)) b!255785))

(assert (= (and b!255785 (not res!214427)) b!255790))

(assert (= (and b!255790 (not res!214424)) b!255782))

(assert (= start!54642 b!255778))

(declare-fun m!385281 () Bool)

(assert (=> b!255779 m!385281))

(declare-fun m!385283 () Bool)

(assert (=> b!255789 m!385283))

(declare-fun m!385285 () Bool)

(assert (=> b!255789 m!385285))

(declare-fun m!385287 () Bool)

(assert (=> b!255782 m!385287))

(assert (=> b!255782 m!385285))

(declare-fun m!385289 () Bool)

(assert (=> b!255792 m!385289))

(declare-fun m!385291 () Bool)

(assert (=> b!255781 m!385291))

(declare-fun m!385293 () Bool)

(assert (=> b!255781 m!385293))

(declare-fun m!385295 () Bool)

(assert (=> b!255781 m!385295))

(declare-fun m!385297 () Bool)

(assert (=> b!255781 m!385297))

(declare-fun m!385299 () Bool)

(assert (=> b!255781 m!385299))

(declare-fun m!385301 () Bool)

(assert (=> b!255781 m!385301))

(declare-fun m!385303 () Bool)

(assert (=> b!255781 m!385303))

(declare-fun m!385305 () Bool)

(assert (=> b!255781 m!385305))

(declare-fun m!385307 () Bool)

(assert (=> b!255781 m!385307))

(declare-fun m!385309 () Bool)

(assert (=> b!255781 m!385309))

(declare-fun m!385311 () Bool)

(assert (=> b!255781 m!385311))

(declare-fun m!385313 () Bool)

(assert (=> b!255781 m!385313))

(declare-fun m!385315 () Bool)

(assert (=> b!255781 m!385315))

(declare-fun m!385317 () Bool)

(assert (=> b!255781 m!385317))

(declare-fun m!385319 () Bool)

(assert (=> b!255781 m!385319))

(declare-fun m!385321 () Bool)

(assert (=> b!255781 m!385321))

(declare-fun m!385323 () Bool)

(assert (=> b!255781 m!385323))

(declare-fun m!385325 () Bool)

(assert (=> b!255781 m!385325))

(declare-fun m!385327 () Bool)

(assert (=> b!255781 m!385327))

(declare-fun m!385329 () Bool)

(assert (=> b!255781 m!385329))

(declare-fun m!385331 () Bool)

(assert (=> b!255785 m!385331))

(declare-fun m!385333 () Bool)

(assert (=> b!255783 m!385333))

(declare-fun m!385335 () Bool)

(assert (=> b!255787 m!385335))

(declare-fun m!385337 () Bool)

(assert (=> b!255787 m!385337))

(declare-fun m!385339 () Bool)

(assert (=> b!255787 m!385339))

(assert (=> b!255787 m!385293))

(declare-fun m!385341 () Bool)

(assert (=> b!255780 m!385341))

(declare-fun m!385343 () Bool)

(assert (=> b!255778 m!385343))

(declare-fun m!385345 () Bool)

(assert (=> b!255791 m!385345))

(declare-fun m!385347 () Bool)

(assert (=> b!255788 m!385347))

(assert (=> b!255788 m!385347))

(declare-fun m!385349 () Bool)

(assert (=> b!255788 m!385349))

(declare-fun m!385351 () Bool)

(assert (=> b!255794 m!385351))

(assert (=> b!255793 m!385287))

(assert (=> b!255793 m!385283))

(declare-fun m!385353 () Bool)

(assert (=> start!54642 m!385353))

(push 1)

(assert (not b!255778))

(assert (not b!255782))

(assert (not b!255794))

