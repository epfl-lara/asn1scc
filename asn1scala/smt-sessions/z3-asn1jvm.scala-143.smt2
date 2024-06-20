; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3354 () Bool)

(assert start!3354)

(declare-fun b!14709 () Bool)

(declare-fun e!9219 () Bool)

(declare-datatypes ((array!875 0))(
  ( (array!876 (arr!800 (Array (_ BitVec 32) (_ BitVec 8))) (size!371 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!702 0))(
  ( (BitStream!703 (buf!722 array!875) (currentByte!1873 (_ BitVec 32)) (currentBit!1868 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1688 0))(
  ( (tuple2!1689 (_1!905 BitStream!702) (_2!905 Bool)) )
))
(declare-fun lt!22153 () tuple2!1688)

(declare-datatypes ((tuple2!1690 0))(
  ( (tuple2!1691 (_1!906 BitStream!702) (_2!906 BitStream!702)) )
))
(declare-fun lt!22154 () tuple2!1690)

(assert (=> b!14709 (= e!9219 (not (or (not (_2!905 lt!22153)) (not (= (_1!905 lt!22153) (_2!906 lt!22154))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!702 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1688)

(assert (=> b!14709 (= lt!22153 (checkBitsLoopPure!0 (_1!906 lt!22154) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1224 0))(
  ( (Unit!1225) )
))
(declare-datatypes ((tuple2!1692 0))(
  ( (tuple2!1693 (_1!907 Unit!1224) (_2!907 BitStream!702)) )
))
(declare-fun lt!22155 () tuple2!1692)

(declare-fun thiss!1073 () BitStream!702)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14709 (validate_offset_bits!1 ((_ sign_extend 32) (size!371 (buf!722 (_2!907 lt!22155)))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073)) nBits!313)))

(declare-fun lt!22156 () Unit!1224)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!702 array!875 (_ BitVec 64)) Unit!1224)

(assert (=> b!14709 (= lt!22156 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!722 (_2!907 lt!22155)) nBits!313))))

(declare-fun reader!0 (BitStream!702 BitStream!702) tuple2!1690)

(assert (=> b!14709 (= lt!22154 (reader!0 thiss!1073 (_2!907 lt!22155)))))

(declare-fun b!14710 () Bool)

(declare-fun res!13753 () Bool)

(assert (=> b!14710 (=> (not res!13753) (not e!9219))))

(declare-fun isPrefixOf!0 (BitStream!702 BitStream!702) Bool)

(assert (=> b!14710 (= res!13753 (isPrefixOf!0 thiss!1073 (_2!907 lt!22155)))))

(declare-fun b!14711 () Bool)

(declare-fun res!13754 () Bool)

(declare-fun e!9220 () Bool)

(assert (=> b!14711 (=> (not res!13754) (not e!9220))))

(assert (=> b!14711 (= res!13754 (validate_offset_bits!1 ((_ sign_extend 32) (size!371 (buf!722 thiss!1073))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073)) nBits!313))))

(declare-fun b!14712 () Bool)

(declare-fun res!13750 () Bool)

(assert (=> b!14712 (=> (not res!13750) (not e!9219))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14712 (= res!13750 (= (bitIndex!0 (size!371 (buf!722 (_2!907 lt!22155))) (currentByte!1873 (_2!907 lt!22155)) (currentBit!1868 (_2!907 lt!22155))) (bvadd (bitIndex!0 (size!371 (buf!722 thiss!1073)) (currentByte!1873 thiss!1073) (currentBit!1868 thiss!1073)) nBits!313)))))

(declare-fun b!14713 () Bool)

(declare-fun e!9222 () Bool)

(declare-fun array_inv!360 (array!875) Bool)

(assert (=> b!14713 (= e!9222 (array_inv!360 (buf!722 thiss!1073)))))

(declare-fun b!14714 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14714 (= e!9220 (not (invariant!0 (currentBit!1868 (_2!907 lt!22155)) (currentByte!1873 (_2!907 lt!22155)) (size!371 (buf!722 (_2!907 lt!22155))))))))

(assert (=> b!14714 e!9219))

(declare-fun res!13752 () Bool)

(assert (=> b!14714 (=> (not res!13752) (not e!9219))))

(assert (=> b!14714 (= res!13752 (= (size!371 (buf!722 thiss!1073)) (size!371 (buf!722 (_2!907 lt!22155)))))))

(declare-fun appendNBits!0 (BitStream!702 (_ BitVec 64) Bool) tuple2!1692)

(assert (=> b!14714 (= lt!22155 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun res!13751 () Bool)

(assert (=> start!3354 (=> (not res!13751) (not e!9220))))

(assert (=> start!3354 (= res!13751 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3354 e!9220))

(assert (=> start!3354 true))

(declare-fun inv!12 (BitStream!702) Bool)

(assert (=> start!3354 (and (inv!12 thiss!1073) e!9222)))

(assert (= (and start!3354 res!13751) b!14711))

(assert (= (and b!14711 res!13754) b!14714))

(assert (= (and b!14714 res!13752) b!14712))

(assert (= (and b!14712 res!13750) b!14710))

(assert (= (and b!14710 res!13753) b!14709))

(assert (= start!3354 b!14713))

(declare-fun m!21153 () Bool)

(assert (=> b!14713 m!21153))

(declare-fun m!21155 () Bool)

(assert (=> b!14710 m!21155))

(declare-fun m!21157 () Bool)

(assert (=> b!14709 m!21157))

(declare-fun m!21159 () Bool)

(assert (=> b!14709 m!21159))

(declare-fun m!21161 () Bool)

(assert (=> b!14709 m!21161))

(declare-fun m!21163 () Bool)

(assert (=> b!14709 m!21163))

(declare-fun m!21165 () Bool)

(assert (=> b!14714 m!21165))

(declare-fun m!21167 () Bool)

(assert (=> b!14714 m!21167))

(declare-fun m!21169 () Bool)

(assert (=> start!3354 m!21169))

(declare-fun m!21171 () Bool)

(assert (=> b!14712 m!21171))

(declare-fun m!21173 () Bool)

(assert (=> b!14712 m!21173))

(declare-fun m!21175 () Bool)

(assert (=> b!14711 m!21175))

(check-sat (not b!14709) (not b!14712) (not b!14714) (not b!14710) (not b!14713) (not b!14711) (not start!3354))
(check-sat)
(get-model)

(declare-fun d!4852 () Bool)

(assert (=> d!4852 (= (invariant!0 (currentBit!1868 (_2!907 lt!22155)) (currentByte!1873 (_2!907 lt!22155)) (size!371 (buf!722 (_2!907 lt!22155)))) (and (bvsge (currentBit!1868 (_2!907 lt!22155)) #b00000000000000000000000000000000) (bvslt (currentBit!1868 (_2!907 lt!22155)) #b00000000000000000000000000001000) (bvsge (currentByte!1873 (_2!907 lt!22155)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1873 (_2!907 lt!22155)) (size!371 (buf!722 (_2!907 lt!22155)))) (and (= (currentBit!1868 (_2!907 lt!22155)) #b00000000000000000000000000000000) (= (currentByte!1873 (_2!907 lt!22155)) (size!371 (buf!722 (_2!907 lt!22155))))))))))

(assert (=> b!14714 d!4852))

(declare-fun d!4854 () Bool)

(declare-fun e!9261 () Bool)

(assert (=> d!4854 e!9261))

(declare-fun res!13817 () Bool)

(assert (=> d!4854 (=> (not res!13817) (not e!9261))))

(declare-fun lt!22256 () tuple2!1692)

(assert (=> d!4854 (= res!13817 (= (size!371 (buf!722 thiss!1073)) (size!371 (buf!722 (_2!907 lt!22256)))))))

(declare-fun choose!36 (BitStream!702 (_ BitVec 64) Bool) tuple2!1692)

(assert (=> d!4854 (= lt!22256 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!4854 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4854 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!22256)))

(declare-fun b!14780 () Bool)

(declare-fun res!13818 () Bool)

(assert (=> b!14780 (=> (not res!13818) (not e!9261))))

(declare-fun lt!22260 () (_ BitVec 64))

(assert (=> b!14780 (= res!13818 (= (bitIndex!0 (size!371 (buf!722 (_2!907 lt!22256))) (currentByte!1873 (_2!907 lt!22256)) (currentBit!1868 (_2!907 lt!22256))) (bvadd lt!22260 nBits!313)))))

(assert (=> b!14780 (or (not (= (bvand lt!22260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!22260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!22260 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14780 (= lt!22260 (bitIndex!0 (size!371 (buf!722 thiss!1073)) (currentByte!1873 thiss!1073) (currentBit!1868 thiss!1073)))))

(declare-fun b!14781 () Bool)

(declare-fun res!13820 () Bool)

(assert (=> b!14781 (=> (not res!13820) (not e!9261))))

(assert (=> b!14781 (= res!13820 (isPrefixOf!0 thiss!1073 (_2!907 lt!22256)))))

(declare-fun b!14782 () Bool)

(declare-fun lt!22254 () tuple2!1688)

(declare-fun lt!22252 () tuple2!1690)

(assert (=> b!14782 (= e!9261 (and (_2!905 lt!22254) (= (_1!905 lt!22254) (_2!906 lt!22252))))))

(assert (=> b!14782 (= lt!22254 (checkBitsLoopPure!0 (_1!906 lt!22252) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!22250 () Unit!1224)

(declare-fun lt!22249 () Unit!1224)

(assert (=> b!14782 (= lt!22250 lt!22249)))

(assert (=> b!14782 (validate_offset_bits!1 ((_ sign_extend 32) (size!371 (buf!722 (_2!907 lt!22256)))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073)) nBits!313)))

(assert (=> b!14782 (= lt!22249 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!722 (_2!907 lt!22256)) nBits!313))))

(declare-fun e!9260 () Bool)

(assert (=> b!14782 e!9260))

(declare-fun res!13822 () Bool)

(assert (=> b!14782 (=> (not res!13822) (not e!9260))))

(assert (=> b!14782 (= res!13822 (and (= (size!371 (buf!722 thiss!1073)) (size!371 (buf!722 (_2!907 lt!22256)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14782 (= lt!22252 (reader!0 thiss!1073 (_2!907 lt!22256)))))

(declare-fun b!14784 () Bool)

(assert (=> b!14784 (= e!9260 (validate_offset_bits!1 ((_ sign_extend 32) (size!371 (buf!722 thiss!1073))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073)) nBits!313))))

(assert (= (and d!4854 res!13817) b!14780))

(assert (= (and b!14780 res!13818) b!14781))

(assert (= (and b!14781 res!13820) b!14782))

(assert (= (and b!14782 res!13822) b!14784))

(assert (=> b!14784 m!21175))

(declare-fun m!21217 () Bool)

(assert (=> b!14782 m!21217))

(declare-fun m!21221 () Bool)

(assert (=> b!14782 m!21221))

(declare-fun m!21225 () Bool)

(assert (=> b!14782 m!21225))

(declare-fun m!21229 () Bool)

(assert (=> b!14782 m!21229))

(declare-fun m!21233 () Bool)

(assert (=> b!14781 m!21233))

(declare-fun m!21235 () Bool)

(assert (=> d!4854 m!21235))

(declare-fun m!21239 () Bool)

(assert (=> b!14780 m!21239))

(assert (=> b!14780 m!21173))

(assert (=> b!14714 d!4854))

(declare-fun d!4874 () Bool)

(declare-datatypes ((tuple2!1700 0))(
  ( (tuple2!1701 (_1!911 Bool) (_2!911 BitStream!702)) )
))
(declare-fun lt!22273 () tuple2!1700)

(declare-fun checkBitsLoop!0 (BitStream!702 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1700)

(assert (=> d!4874 (= lt!22273 (checkBitsLoop!0 (_1!906 lt!22154) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4874 (= (checkBitsLoopPure!0 (_1!906 lt!22154) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1689 (_2!911 lt!22273) (_1!911 lt!22273)))))

(declare-fun bs!1343 () Bool)

(assert (= bs!1343 d!4874))

(declare-fun m!21257 () Bool)

(assert (=> bs!1343 m!21257))

(assert (=> b!14709 d!4874))

(declare-fun d!4880 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4880 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!371 (buf!722 (_2!907 lt!22155)))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!371 (buf!722 (_2!907 lt!22155)))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073))) nBits!313))))

(declare-fun bs!1345 () Bool)

(assert (= bs!1345 d!4880))

(declare-fun m!21259 () Bool)

(assert (=> bs!1345 m!21259))

(assert (=> b!14709 d!4880))

(declare-fun d!4884 () Bool)

(assert (=> d!4884 (validate_offset_bits!1 ((_ sign_extend 32) (size!371 (buf!722 (_2!907 lt!22155)))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073)) nBits!313)))

(declare-fun lt!22278 () Unit!1224)

(declare-fun choose!9 (BitStream!702 array!875 (_ BitVec 64) BitStream!702) Unit!1224)

(assert (=> d!4884 (= lt!22278 (choose!9 thiss!1073 (buf!722 (_2!907 lt!22155)) nBits!313 (BitStream!703 (buf!722 (_2!907 lt!22155)) (currentByte!1873 thiss!1073) (currentBit!1868 thiss!1073))))))

(assert (=> d!4884 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!722 (_2!907 lt!22155)) nBits!313) lt!22278)))

(declare-fun bs!1347 () Bool)

(assert (= bs!1347 d!4884))

(assert (=> bs!1347 m!21159))

(declare-fun m!21263 () Bool)

(assert (=> bs!1347 m!21263))

(assert (=> b!14709 d!4884))

(declare-fun b!14827 () Bool)

(declare-fun res!13852 () Bool)

(declare-fun e!9283 () Bool)

(assert (=> b!14827 (=> (not res!13852) (not e!9283))))

(declare-fun lt!22397 () tuple2!1690)

(assert (=> b!14827 (= res!13852 (isPrefixOf!0 (_2!906 lt!22397) (_2!907 lt!22155)))))

(declare-fun b!14828 () Bool)

(declare-fun e!9284 () Unit!1224)

(declare-fun lt!22415 () Unit!1224)

(assert (=> b!14828 (= e!9284 lt!22415)))

(declare-fun lt!22405 () (_ BitVec 64))

(assert (=> b!14828 (= lt!22405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22400 () (_ BitVec 64))

(assert (=> b!14828 (= lt!22400 (bitIndex!0 (size!371 (buf!722 thiss!1073)) (currentByte!1873 thiss!1073) (currentBit!1868 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!875 array!875 (_ BitVec 64) (_ BitVec 64)) Unit!1224)

(assert (=> b!14828 (= lt!22415 (arrayBitRangesEqSymmetric!0 (buf!722 thiss!1073) (buf!722 (_2!907 lt!22155)) lt!22405 lt!22400))))

(declare-fun arrayBitRangesEq!0 (array!875 array!875 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14828 (arrayBitRangesEq!0 (buf!722 (_2!907 lt!22155)) (buf!722 thiss!1073) lt!22405 lt!22400)))

(declare-fun d!4892 () Bool)

(assert (=> d!4892 e!9283))

(declare-fun res!13853 () Bool)

(assert (=> d!4892 (=> (not res!13853) (not e!9283))))

(assert (=> d!4892 (= res!13853 (isPrefixOf!0 (_1!906 lt!22397) (_2!906 lt!22397)))))

(declare-fun lt!22404 () BitStream!702)

(assert (=> d!4892 (= lt!22397 (tuple2!1691 lt!22404 (_2!907 lt!22155)))))

(declare-fun lt!22410 () Unit!1224)

(declare-fun lt!22411 () Unit!1224)

(assert (=> d!4892 (= lt!22410 lt!22411)))

(assert (=> d!4892 (isPrefixOf!0 lt!22404 (_2!907 lt!22155))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!702 BitStream!702 BitStream!702) Unit!1224)

(assert (=> d!4892 (= lt!22411 (lemmaIsPrefixTransitive!0 lt!22404 (_2!907 lt!22155) (_2!907 lt!22155)))))

(declare-fun lt!22416 () Unit!1224)

(declare-fun lt!22402 () Unit!1224)

(assert (=> d!4892 (= lt!22416 lt!22402)))

(assert (=> d!4892 (isPrefixOf!0 lt!22404 (_2!907 lt!22155))))

(assert (=> d!4892 (= lt!22402 (lemmaIsPrefixTransitive!0 lt!22404 thiss!1073 (_2!907 lt!22155)))))

(declare-fun lt!22406 () Unit!1224)

(assert (=> d!4892 (= lt!22406 e!9284)))

(declare-fun c!1028 () Bool)

(assert (=> d!4892 (= c!1028 (not (= (size!371 (buf!722 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!22413 () Unit!1224)

(declare-fun lt!22398 () Unit!1224)

(assert (=> d!4892 (= lt!22413 lt!22398)))

(assert (=> d!4892 (isPrefixOf!0 (_2!907 lt!22155) (_2!907 lt!22155))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!702) Unit!1224)

(assert (=> d!4892 (= lt!22398 (lemmaIsPrefixRefl!0 (_2!907 lt!22155)))))

(declare-fun lt!22409 () Unit!1224)

(declare-fun lt!22408 () Unit!1224)

(assert (=> d!4892 (= lt!22409 lt!22408)))

(assert (=> d!4892 (= lt!22408 (lemmaIsPrefixRefl!0 (_2!907 lt!22155)))))

(declare-fun lt!22407 () Unit!1224)

(declare-fun lt!22396 () Unit!1224)

(assert (=> d!4892 (= lt!22407 lt!22396)))

(assert (=> d!4892 (isPrefixOf!0 lt!22404 lt!22404)))

(assert (=> d!4892 (= lt!22396 (lemmaIsPrefixRefl!0 lt!22404))))

(declare-fun lt!22412 () Unit!1224)

(declare-fun lt!22414 () Unit!1224)

(assert (=> d!4892 (= lt!22412 lt!22414)))

(assert (=> d!4892 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!4892 (= lt!22414 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!4892 (= lt!22404 (BitStream!703 (buf!722 (_2!907 lt!22155)) (currentByte!1873 thiss!1073) (currentBit!1868 thiss!1073)))))

(assert (=> d!4892 (isPrefixOf!0 thiss!1073 (_2!907 lt!22155))))

(assert (=> d!4892 (= (reader!0 thiss!1073 (_2!907 lt!22155)) lt!22397)))

(declare-fun lt!22395 () (_ BitVec 64))

(declare-fun b!14829 () Bool)

(declare-fun lt!22403 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!702 (_ BitVec 64)) BitStream!702)

(assert (=> b!14829 (= e!9283 (= (_1!906 lt!22397) (withMovedBitIndex!0 (_2!906 lt!22397) (bvsub lt!22403 lt!22395))))))

(assert (=> b!14829 (or (= (bvand lt!22403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22395 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22403 lt!22395) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14829 (= lt!22395 (bitIndex!0 (size!371 (buf!722 (_2!907 lt!22155))) (currentByte!1873 (_2!907 lt!22155)) (currentBit!1868 (_2!907 lt!22155))))))

(assert (=> b!14829 (= lt!22403 (bitIndex!0 (size!371 (buf!722 thiss!1073)) (currentByte!1873 thiss!1073) (currentBit!1868 thiss!1073)))))

(declare-fun b!14830 () Bool)

(declare-fun Unit!1229 () Unit!1224)

(assert (=> b!14830 (= e!9284 Unit!1229)))

(declare-fun b!14831 () Bool)

(declare-fun res!13854 () Bool)

(assert (=> b!14831 (=> (not res!13854) (not e!9283))))

(assert (=> b!14831 (= res!13854 (isPrefixOf!0 (_1!906 lt!22397) thiss!1073))))

(assert (= (and d!4892 c!1028) b!14828))

(assert (= (and d!4892 (not c!1028)) b!14830))

(assert (= (and d!4892 res!13853) b!14831))

(assert (= (and b!14831 res!13854) b!14827))

(assert (= (and b!14827 res!13852) b!14829))

(declare-fun m!21277 () Bool)

(assert (=> d!4892 m!21277))

(declare-fun m!21279 () Bool)

(assert (=> d!4892 m!21279))

(declare-fun m!21281 () Bool)

(assert (=> d!4892 m!21281))

(declare-fun m!21283 () Bool)

(assert (=> d!4892 m!21283))

(declare-fun m!21285 () Bool)

(assert (=> d!4892 m!21285))

(assert (=> d!4892 m!21155))

(declare-fun m!21287 () Bool)

(assert (=> d!4892 m!21287))

(declare-fun m!21289 () Bool)

(assert (=> d!4892 m!21289))

(declare-fun m!21291 () Bool)

(assert (=> d!4892 m!21291))

(declare-fun m!21293 () Bool)

(assert (=> d!4892 m!21293))

(declare-fun m!21295 () Bool)

(assert (=> d!4892 m!21295))

(declare-fun m!21297 () Bool)

(assert (=> b!14831 m!21297))

(assert (=> b!14828 m!21173))

(declare-fun m!21299 () Bool)

(assert (=> b!14828 m!21299))

(declare-fun m!21301 () Bool)

(assert (=> b!14828 m!21301))

(declare-fun m!21303 () Bool)

(assert (=> b!14827 m!21303))

(declare-fun m!21305 () Bool)

(assert (=> b!14829 m!21305))

(assert (=> b!14829 m!21171))

(assert (=> b!14829 m!21173))

(assert (=> b!14709 d!4892))

(declare-fun d!4906 () Bool)

(assert (=> d!4906 (= (array_inv!360 (buf!722 thiss!1073)) (bvsge (size!371 (buf!722 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14713 d!4906))

(declare-fun d!4908 () Bool)

(declare-fun e!9293 () Bool)

(assert (=> d!4908 e!9293))

(declare-fun res!13871 () Bool)

(assert (=> d!4908 (=> (not res!13871) (not e!9293))))

(declare-fun lt!22481 () (_ BitVec 64))

(declare-fun lt!22482 () (_ BitVec 64))

(declare-fun lt!22485 () (_ BitVec 64))

(assert (=> d!4908 (= res!13871 (= lt!22482 (bvsub lt!22485 lt!22481)))))

(assert (=> d!4908 (or (= (bvand lt!22485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22485 lt!22481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4908 (= lt!22481 (remainingBits!0 ((_ sign_extend 32) (size!371 (buf!722 (_2!907 lt!22155)))) ((_ sign_extend 32) (currentByte!1873 (_2!907 lt!22155))) ((_ sign_extend 32) (currentBit!1868 (_2!907 lt!22155)))))))

(declare-fun lt!22484 () (_ BitVec 64))

(declare-fun lt!22483 () (_ BitVec 64))

(assert (=> d!4908 (= lt!22485 (bvmul lt!22484 lt!22483))))

(assert (=> d!4908 (or (= lt!22484 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22483 (bvsdiv (bvmul lt!22484 lt!22483) lt!22484)))))

(assert (=> d!4908 (= lt!22483 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4908 (= lt!22484 ((_ sign_extend 32) (size!371 (buf!722 (_2!907 lt!22155)))))))

(assert (=> d!4908 (= lt!22482 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1873 (_2!907 lt!22155))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1868 (_2!907 lt!22155)))))))

(assert (=> d!4908 (invariant!0 (currentBit!1868 (_2!907 lt!22155)) (currentByte!1873 (_2!907 lt!22155)) (size!371 (buf!722 (_2!907 lt!22155))))))

(assert (=> d!4908 (= (bitIndex!0 (size!371 (buf!722 (_2!907 lt!22155))) (currentByte!1873 (_2!907 lt!22155)) (currentBit!1868 (_2!907 lt!22155))) lt!22482)))

(declare-fun b!14852 () Bool)

(declare-fun res!13872 () Bool)

(assert (=> b!14852 (=> (not res!13872) (not e!9293))))

(assert (=> b!14852 (= res!13872 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22482))))

(declare-fun b!14853 () Bool)

(declare-fun lt!22486 () (_ BitVec 64))

(assert (=> b!14853 (= e!9293 (bvsle lt!22482 (bvmul lt!22486 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14853 (or (= lt!22486 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22486 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22486)))))

(assert (=> b!14853 (= lt!22486 ((_ sign_extend 32) (size!371 (buf!722 (_2!907 lt!22155)))))))

(assert (= (and d!4908 res!13871) b!14852))

(assert (= (and b!14852 res!13872) b!14853))

(declare-fun m!21367 () Bool)

(assert (=> d!4908 m!21367))

(assert (=> d!4908 m!21165))

(assert (=> b!14712 d!4908))

(declare-fun d!4910 () Bool)

(declare-fun e!9294 () Bool)

(assert (=> d!4910 e!9294))

(declare-fun res!13873 () Bool)

(assert (=> d!4910 (=> (not res!13873) (not e!9294))))

(declare-fun lt!22487 () (_ BitVec 64))

(declare-fun lt!22488 () (_ BitVec 64))

(declare-fun lt!22491 () (_ BitVec 64))

(assert (=> d!4910 (= res!13873 (= lt!22488 (bvsub lt!22491 lt!22487)))))

(assert (=> d!4910 (or (= (bvand lt!22491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22491 lt!22487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4910 (= lt!22487 (remainingBits!0 ((_ sign_extend 32) (size!371 (buf!722 thiss!1073))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073))))))

(declare-fun lt!22490 () (_ BitVec 64))

(declare-fun lt!22489 () (_ BitVec 64))

(assert (=> d!4910 (= lt!22491 (bvmul lt!22490 lt!22489))))

(assert (=> d!4910 (or (= lt!22490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22489 (bvsdiv (bvmul lt!22490 lt!22489) lt!22490)))))

(assert (=> d!4910 (= lt!22489 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4910 (= lt!22490 ((_ sign_extend 32) (size!371 (buf!722 thiss!1073))))))

(assert (=> d!4910 (= lt!22488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1873 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1868 thiss!1073))))))

(assert (=> d!4910 (invariant!0 (currentBit!1868 thiss!1073) (currentByte!1873 thiss!1073) (size!371 (buf!722 thiss!1073)))))

(assert (=> d!4910 (= (bitIndex!0 (size!371 (buf!722 thiss!1073)) (currentByte!1873 thiss!1073) (currentBit!1868 thiss!1073)) lt!22488)))

(declare-fun b!14854 () Bool)

(declare-fun res!13874 () Bool)

(assert (=> b!14854 (=> (not res!13874) (not e!9294))))

(assert (=> b!14854 (= res!13874 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22488))))

(declare-fun b!14855 () Bool)

(declare-fun lt!22492 () (_ BitVec 64))

(assert (=> b!14855 (= e!9294 (bvsle lt!22488 (bvmul lt!22492 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14855 (or (= lt!22492 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22492 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22492)))))

(assert (=> b!14855 (= lt!22492 ((_ sign_extend 32) (size!371 (buf!722 thiss!1073))))))

(assert (= (and d!4910 res!13873) b!14854))

(assert (= (and b!14854 res!13874) b!14855))

(declare-fun m!21369 () Bool)

(assert (=> d!4910 m!21369))

(declare-fun m!21371 () Bool)

(assert (=> d!4910 m!21371))

(assert (=> b!14712 d!4910))

(declare-fun d!4912 () Bool)

(assert (=> d!4912 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!371 (buf!722 thiss!1073))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!371 (buf!722 thiss!1073))) ((_ sign_extend 32) (currentByte!1873 thiss!1073)) ((_ sign_extend 32) (currentBit!1868 thiss!1073))) nBits!313))))

(declare-fun bs!1354 () Bool)

(assert (= bs!1354 d!4912))

(assert (=> bs!1354 m!21369))

(assert (=> b!14711 d!4912))

(declare-fun d!4914 () Bool)

(declare-fun res!13883 () Bool)

(declare-fun e!9300 () Bool)

(assert (=> d!4914 (=> (not res!13883) (not e!9300))))

(assert (=> d!4914 (= res!13883 (= (size!371 (buf!722 thiss!1073)) (size!371 (buf!722 (_2!907 lt!22155)))))))

(assert (=> d!4914 (= (isPrefixOf!0 thiss!1073 (_2!907 lt!22155)) e!9300)))

(declare-fun b!14862 () Bool)

(declare-fun res!13881 () Bool)

(assert (=> b!14862 (=> (not res!13881) (not e!9300))))

(assert (=> b!14862 (= res!13881 (bvsle (bitIndex!0 (size!371 (buf!722 thiss!1073)) (currentByte!1873 thiss!1073) (currentBit!1868 thiss!1073)) (bitIndex!0 (size!371 (buf!722 (_2!907 lt!22155))) (currentByte!1873 (_2!907 lt!22155)) (currentBit!1868 (_2!907 lt!22155)))))))

(declare-fun b!14863 () Bool)

(declare-fun e!9299 () Bool)

(assert (=> b!14863 (= e!9300 e!9299)))

(declare-fun res!13882 () Bool)

(assert (=> b!14863 (=> res!13882 e!9299)))

(assert (=> b!14863 (= res!13882 (= (size!371 (buf!722 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!14864 () Bool)

(assert (=> b!14864 (= e!9299 (arrayBitRangesEq!0 (buf!722 thiss!1073) (buf!722 (_2!907 lt!22155)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!371 (buf!722 thiss!1073)) (currentByte!1873 thiss!1073) (currentBit!1868 thiss!1073))))))

(assert (= (and d!4914 res!13883) b!14862))

(assert (= (and b!14862 res!13881) b!14863))

(assert (= (and b!14863 (not res!13882)) b!14864))

(assert (=> b!14862 m!21173))

(assert (=> b!14862 m!21171))

(assert (=> b!14864 m!21173))

(assert (=> b!14864 m!21173))

(declare-fun m!21373 () Bool)

(assert (=> b!14864 m!21373))

(assert (=> b!14710 d!4914))

(declare-fun d!4916 () Bool)

(assert (=> d!4916 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1868 thiss!1073) (currentByte!1873 thiss!1073) (size!371 (buf!722 thiss!1073))))))

(declare-fun bs!1355 () Bool)

(assert (= bs!1355 d!4916))

(assert (=> bs!1355 m!21371))

(assert (=> start!3354 d!4916))

(check-sat (not b!14780) (not b!14784) (not b!14864) (not d!4892) (not d!4884) (not b!14831) (not b!14862) (not d!4908) (not b!14829) (not d!4880) (not d!4874) (not d!4910) (not b!14781) (not d!4916) (not b!14782) (not b!14828) (not d!4854) (not d!4912) (not b!14827))
