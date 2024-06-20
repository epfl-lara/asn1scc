; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3352 () Bool)

(assert start!3352)

(declare-fun b!14691 () Bool)

(declare-fun res!13738 () Bool)

(declare-fun e!9209 () Bool)

(assert (=> b!14691 (=> (not res!13738) (not e!9209))))

(declare-datatypes ((array!873 0))(
  ( (array!874 (arr!799 (Array (_ BitVec 32) (_ BitVec 8))) (size!370 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!700 0))(
  ( (BitStream!701 (buf!721 array!873) (currentByte!1872 (_ BitVec 32)) (currentBit!1867 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1222 0))(
  ( (Unit!1223) )
))
(declare-datatypes ((tuple2!1682 0))(
  ( (tuple2!1683 (_1!902 Unit!1222) (_2!902 BitStream!700)) )
))
(declare-fun lt!22142 () tuple2!1682)

(declare-fun thiss!1073 () BitStream!700)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14691 (= res!13738 (= (bitIndex!0 (size!370 (buf!721 (_2!902 lt!22142))) (currentByte!1872 (_2!902 lt!22142)) (currentBit!1867 (_2!902 lt!22142))) (bvadd (bitIndex!0 (size!370 (buf!721 thiss!1073)) (currentByte!1872 thiss!1073) (currentBit!1867 thiss!1073)) nBits!313)))))

(declare-fun b!14692 () Bool)

(declare-datatypes ((tuple2!1684 0))(
  ( (tuple2!1685 (_1!903 BitStream!700) (_2!903 Bool)) )
))
(declare-fun lt!22141 () tuple2!1684)

(declare-datatypes ((tuple2!1686 0))(
  ( (tuple2!1687 (_1!904 BitStream!700) (_2!904 BitStream!700)) )
))
(declare-fun lt!22143 () tuple2!1686)

(assert (=> b!14692 (= e!9209 (not (or (not (_2!903 lt!22141)) (not (= (_1!903 lt!22141) (_2!904 lt!22143))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!700 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1684)

(assert (=> b!14692 (= lt!22141 (checkBitsLoopPure!0 (_1!904 lt!22143) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14692 (validate_offset_bits!1 ((_ sign_extend 32) (size!370 (buf!721 (_2!902 lt!22142)))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073)) nBits!313)))

(declare-fun lt!22144 () Unit!1222)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!700 array!873 (_ BitVec 64)) Unit!1222)

(assert (=> b!14692 (= lt!22144 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!721 (_2!902 lt!22142)) nBits!313))))

(declare-fun reader!0 (BitStream!700 BitStream!700) tuple2!1686)

(assert (=> b!14692 (= lt!22143 (reader!0 thiss!1073 (_2!902 lt!22142)))))

(declare-fun b!14693 () Bool)

(declare-fun e!9208 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14693 (= e!9208 (not (invariant!0 (currentBit!1867 (_2!902 lt!22142)) (currentByte!1872 (_2!902 lt!22142)) (size!370 (buf!721 (_2!902 lt!22142))))))))

(assert (=> b!14693 e!9209))

(declare-fun res!13739 () Bool)

(assert (=> b!14693 (=> (not res!13739) (not e!9209))))

(assert (=> b!14693 (= res!13739 (= (size!370 (buf!721 thiss!1073)) (size!370 (buf!721 (_2!902 lt!22142)))))))

(declare-fun appendNBits!0 (BitStream!700 (_ BitVec 64) Bool) tuple2!1682)

(assert (=> b!14693 (= lt!22142 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun res!13736 () Bool)

(assert (=> start!3352 (=> (not res!13736) (not e!9208))))

(assert (=> start!3352 (= res!13736 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3352 e!9208))

(assert (=> start!3352 true))

(declare-fun e!9210 () Bool)

(declare-fun inv!12 (BitStream!700) Bool)

(assert (=> start!3352 (and (inv!12 thiss!1073) e!9210)))

(declare-fun b!14694 () Bool)

(declare-fun res!13735 () Bool)

(assert (=> b!14694 (=> (not res!13735) (not e!9208))))

(assert (=> b!14694 (= res!13735 (validate_offset_bits!1 ((_ sign_extend 32) (size!370 (buf!721 thiss!1073))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073)) nBits!313))))

(declare-fun b!14695 () Bool)

(declare-fun res!13737 () Bool)

(assert (=> b!14695 (=> (not res!13737) (not e!9209))))

(declare-fun isPrefixOf!0 (BitStream!700 BitStream!700) Bool)

(assert (=> b!14695 (= res!13737 (isPrefixOf!0 thiss!1073 (_2!902 lt!22142)))))

(declare-fun b!14696 () Bool)

(declare-fun array_inv!359 (array!873) Bool)

(assert (=> b!14696 (= e!9210 (array_inv!359 (buf!721 thiss!1073)))))

(assert (= (and start!3352 res!13736) b!14694))

(assert (= (and b!14694 res!13735) b!14693))

(assert (= (and b!14693 res!13739) b!14691))

(assert (= (and b!14691 res!13738) b!14695))

(assert (= (and b!14695 res!13737) b!14692))

(assert (= start!3352 b!14696))

(declare-fun m!21129 () Bool)

(assert (=> b!14692 m!21129))

(declare-fun m!21131 () Bool)

(assert (=> b!14692 m!21131))

(declare-fun m!21133 () Bool)

(assert (=> b!14692 m!21133))

(declare-fun m!21135 () Bool)

(assert (=> b!14692 m!21135))

(declare-fun m!21137 () Bool)

(assert (=> b!14691 m!21137))

(declare-fun m!21139 () Bool)

(assert (=> b!14691 m!21139))

(declare-fun m!21141 () Bool)

(assert (=> b!14694 m!21141))

(declare-fun m!21143 () Bool)

(assert (=> b!14693 m!21143))

(declare-fun m!21145 () Bool)

(assert (=> b!14693 m!21145))

(declare-fun m!21147 () Bool)

(assert (=> start!3352 m!21147))

(declare-fun m!21149 () Bool)

(assert (=> b!14696 m!21149))

(declare-fun m!21151 () Bool)

(assert (=> b!14695 m!21151))

(push 1)

(assert (not b!14691))

(assert (not b!14696))

(assert (not b!14695))

(assert (not b!14693))

(assert (not start!3352))

(assert (not b!14694))

(assert (not b!14692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4846 () Bool)

(declare-fun e!9240 () Bool)

(assert (=> d!4846 e!9240))

(declare-fun res!13781 () Bool)

(assert (=> d!4846 (=> (not res!13781) (not e!9240))))

(declare-fun lt!22202 () (_ BitVec 64))

(declare-fun lt!22199 () (_ BitVec 64))

(declare-fun lt!22201 () (_ BitVec 64))

(assert (=> d!4846 (= res!13781 (= lt!22201 (bvsub lt!22202 lt!22199)))))

(assert (=> d!4846 (or (= (bvand lt!22202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22199 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22202 lt!22199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4846 (= lt!22199 (remainingBits!0 ((_ sign_extend 32) (size!370 (buf!721 (_2!902 lt!22142)))) ((_ sign_extend 32) (currentByte!1872 (_2!902 lt!22142))) ((_ sign_extend 32) (currentBit!1867 (_2!902 lt!22142)))))))

(declare-fun lt!22203 () (_ BitVec 64))

(declare-fun lt!22200 () (_ BitVec 64))

(assert (=> d!4846 (= lt!22202 (bvmul lt!22203 lt!22200))))

(assert (=> d!4846 (or (= lt!22203 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22200 (bvsdiv (bvmul lt!22203 lt!22200) lt!22203)))))

(assert (=> d!4846 (= lt!22200 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4846 (= lt!22203 ((_ sign_extend 32) (size!370 (buf!721 (_2!902 lt!22142)))))))

(assert (=> d!4846 (= lt!22201 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1872 (_2!902 lt!22142))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1867 (_2!902 lt!22142)))))))

(assert (=> d!4846 (invariant!0 (currentBit!1867 (_2!902 lt!22142)) (currentByte!1872 (_2!902 lt!22142)) (size!370 (buf!721 (_2!902 lt!22142))))))

(assert (=> d!4846 (= (bitIndex!0 (size!370 (buf!721 (_2!902 lt!22142))) (currentByte!1872 (_2!902 lt!22142)) (currentBit!1867 (_2!902 lt!22142))) lt!22201)))

(declare-fun b!14743 () Bool)

(declare-fun res!13780 () Bool)

(assert (=> b!14743 (=> (not res!13780) (not e!9240))))

(assert (=> b!14743 (= res!13780 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22201))))

(declare-fun b!14744 () Bool)

(declare-fun lt!22204 () (_ BitVec 64))

(assert (=> b!14744 (= e!9240 (bvsle lt!22201 (bvmul lt!22204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14744 (or (= lt!22204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22204)))))

(assert (=> b!14744 (= lt!22204 ((_ sign_extend 32) (size!370 (buf!721 (_2!902 lt!22142)))))))

(assert (= (and d!4846 res!13781) b!14743))

(assert (= (and b!14743 res!13780) b!14744))

(declare-fun m!21205 () Bool)

(assert (=> d!4846 m!21205))

(assert (=> d!4846 m!21143))

(assert (=> b!14691 d!4846))

(declare-fun d!4858 () Bool)

(declare-fun e!9242 () Bool)

(assert (=> d!4858 e!9242))

(declare-fun res!13785 () Bool)

(assert (=> d!4858 (=> (not res!13785) (not e!9242))))

(declare-fun lt!22214 () (_ BitVec 64))

(declare-fun lt!22213 () (_ BitVec 64))

(declare-fun lt!22211 () (_ BitVec 64))

(assert (=> d!4858 (= res!13785 (= lt!22213 (bvsub lt!22214 lt!22211)))))

(assert (=> d!4858 (or (= (bvand lt!22214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22211 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22214 lt!22211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4858 (= lt!22211 (remainingBits!0 ((_ sign_extend 32) (size!370 (buf!721 thiss!1073))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073))))))

(declare-fun lt!22215 () (_ BitVec 64))

(declare-fun lt!22212 () (_ BitVec 64))

(assert (=> d!4858 (= lt!22214 (bvmul lt!22215 lt!22212))))

(assert (=> d!4858 (or (= lt!22215 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22212 (bvsdiv (bvmul lt!22215 lt!22212) lt!22215)))))

(assert (=> d!4858 (= lt!22212 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4858 (= lt!22215 ((_ sign_extend 32) (size!370 (buf!721 thiss!1073))))))

(assert (=> d!4858 (= lt!22213 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1872 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1867 thiss!1073))))))

(assert (=> d!4858 (invariant!0 (currentBit!1867 thiss!1073) (currentByte!1872 thiss!1073) (size!370 (buf!721 thiss!1073)))))

(assert (=> d!4858 (= (bitIndex!0 (size!370 (buf!721 thiss!1073)) (currentByte!1872 thiss!1073) (currentBit!1867 thiss!1073)) lt!22213)))

(declare-fun b!14747 () Bool)

(declare-fun res!13784 () Bool)

(assert (=> b!14747 (=> (not res!13784) (not e!9242))))

(assert (=> b!14747 (= res!13784 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22213))))

(declare-fun b!14748 () Bool)

(declare-fun lt!22216 () (_ BitVec 64))

(assert (=> b!14748 (= e!9242 (bvsle lt!22213 (bvmul lt!22216 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14748 (or (= lt!22216 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22216 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22216)))))

(assert (=> b!14748 (= lt!22216 ((_ sign_extend 32) (size!370 (buf!721 thiss!1073))))))

(assert (= (and d!4858 res!13785) b!14747))

(assert (= (and b!14747 res!13784) b!14748))

(declare-fun m!21209 () Bool)

(assert (=> d!4858 m!21209))

(declare-fun m!21211 () Bool)

(assert (=> d!4858 m!21211))

(assert (=> b!14691 d!4858))

(declare-fun d!4862 () Bool)

(assert (=> d!4862 (= (array_inv!359 (buf!721 thiss!1073)) (bvsge (size!370 (buf!721 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14696 d!4862))

(declare-fun d!4864 () Bool)

(declare-fun res!13793 () Bool)

(declare-fun e!9247 () Bool)

(assert (=> d!4864 (=> (not res!13793) (not e!9247))))

(assert (=> d!4864 (= res!13793 (= (size!370 (buf!721 thiss!1073)) (size!370 (buf!721 (_2!902 lt!22142)))))))

(assert (=> d!4864 (= (isPrefixOf!0 thiss!1073 (_2!902 lt!22142)) e!9247)))

(declare-fun b!14755 () Bool)

(declare-fun res!13794 () Bool)

(assert (=> b!14755 (=> (not res!13794) (not e!9247))))

(assert (=> b!14755 (= res!13794 (bvsle (bitIndex!0 (size!370 (buf!721 thiss!1073)) (currentByte!1872 thiss!1073) (currentBit!1867 thiss!1073)) (bitIndex!0 (size!370 (buf!721 (_2!902 lt!22142))) (currentByte!1872 (_2!902 lt!22142)) (currentBit!1867 (_2!902 lt!22142)))))))

(declare-fun b!14756 () Bool)

(declare-fun e!9248 () Bool)

(assert (=> b!14756 (= e!9247 e!9248)))

(declare-fun res!13792 () Bool)

(assert (=> b!14756 (=> res!13792 e!9248)))

(assert (=> b!14756 (= res!13792 (= (size!370 (buf!721 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!14757 () Bool)

(declare-fun arrayBitRangesEq!0 (array!873 array!873 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14757 (= e!9248 (arrayBitRangesEq!0 (buf!721 thiss!1073) (buf!721 (_2!902 lt!22142)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!370 (buf!721 thiss!1073)) (currentByte!1872 thiss!1073) (currentBit!1867 thiss!1073))))))

(assert (= (and d!4864 res!13793) b!14755))

(assert (= (and b!14755 res!13794) b!14756))

(assert (= (and b!14756 (not res!13792)) b!14757))

(assert (=> b!14755 m!21139))

(assert (=> b!14755 m!21137))

(assert (=> b!14757 m!21139))

(assert (=> b!14757 m!21139))

(declare-fun m!21213 () Bool)

(assert (=> b!14757 m!21213))

(assert (=> b!14695 d!4864))

(declare-fun d!4868 () Bool)

(assert (=> d!4868 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!370 (buf!721 thiss!1073))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!370 (buf!721 thiss!1073))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073))) nBits!313))))

(declare-fun bs!1342 () Bool)

(assert (= bs!1342 d!4868))

(assert (=> bs!1342 m!21209))

(assert (=> b!14694 d!4868))

(declare-fun d!4870 () Bool)

(assert (=> d!4870 (= (invariant!0 (currentBit!1867 (_2!902 lt!22142)) (currentByte!1872 (_2!902 lt!22142)) (size!370 (buf!721 (_2!902 lt!22142)))) (and (bvsge (currentBit!1867 (_2!902 lt!22142)) #b00000000000000000000000000000000) (bvslt (currentBit!1867 (_2!902 lt!22142)) #b00000000000000000000000000001000) (bvsge (currentByte!1872 (_2!902 lt!22142)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1872 (_2!902 lt!22142)) (size!370 (buf!721 (_2!902 lt!22142)))) (and (= (currentBit!1867 (_2!902 lt!22142)) #b00000000000000000000000000000000) (= (currentByte!1872 (_2!902 lt!22142)) (size!370 (buf!721 (_2!902 lt!22142))))))))))

(assert (=> b!14693 d!4870))

(declare-fun b!14790 () Bool)

(declare-fun res!13828 () Bool)

(declare-fun e!9265 () Bool)

(assert (=> b!14790 (=> (not res!13828) (not e!9265))))

(declare-fun lt!22266 () tuple2!1682)

(declare-fun lt!22269 () (_ BitVec 64))

(assert (=> b!14790 (= res!13828 (= (bitIndex!0 (size!370 (buf!721 (_2!902 lt!22266))) (currentByte!1872 (_2!902 lt!22266)) (currentBit!1867 (_2!902 lt!22266))) (bvadd lt!22269 nBits!313)))))

(assert (=> b!14790 (or (not (= (bvand lt!22269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!22269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!22269 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14790 (= lt!22269 (bitIndex!0 (size!370 (buf!721 thiss!1073)) (currentByte!1872 thiss!1073) (currentBit!1867 thiss!1073)))))

(declare-fun b!14791 () Bool)

(declare-fun res!13829 () Bool)

(assert (=> b!14791 (=> (not res!13829) (not e!9265))))

(assert (=> b!14791 (= res!13829 (isPrefixOf!0 thiss!1073 (_2!902 lt!22266)))))

(declare-fun d!4872 () Bool)

(assert (=> d!4872 e!9265))

(declare-fun res!13827 () Bool)

(assert (=> d!4872 (=> (not res!13827) (not e!9265))))

(assert (=> d!4872 (= res!13827 (= (size!370 (buf!721 thiss!1073)) (size!370 (buf!721 (_2!902 lt!22266)))))))

(declare-fun choose!36 (BitStream!700 (_ BitVec 64) Bool) tuple2!1682)

(assert (=> d!4872 (= lt!22266 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!4872 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4872 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!22266)))

(declare-fun b!14792 () Bool)

(declare-fun lt!22267 () tuple2!1684)

(declare-fun lt!22268 () tuple2!1686)

(assert (=> b!14792 (= e!9265 (and (_2!903 lt!22267) (= (_1!903 lt!22267) (_2!904 lt!22268))))))

(assert (=> b!14792 (= lt!22267 (checkBitsLoopPure!0 (_1!904 lt!22268) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!22270 () Unit!1222)

(declare-fun lt!22265 () Unit!1222)

(assert (=> b!14792 (= lt!22270 lt!22265)))

(assert (=> b!14792 (validate_offset_bits!1 ((_ sign_extend 32) (size!370 (buf!721 (_2!902 lt!22266)))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073)) nBits!313)))

(assert (=> b!14792 (= lt!22265 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!721 (_2!902 lt!22266)) nBits!313))))

(declare-fun e!9266 () Bool)

(assert (=> b!14792 e!9266))

(declare-fun res!13830 () Bool)

(assert (=> b!14792 (=> (not res!13830) (not e!9266))))

(assert (=> b!14792 (= res!13830 (and (= (size!370 (buf!721 thiss!1073)) (size!370 (buf!721 (_2!902 lt!22266)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14792 (= lt!22268 (reader!0 thiss!1073 (_2!902 lt!22266)))))

(declare-fun b!14793 () Bool)

(assert (=> b!14793 (= e!9266 (validate_offset_bits!1 ((_ sign_extend 32) (size!370 (buf!721 thiss!1073))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073)) nBits!313))))

(assert (= (and d!4872 res!13827) b!14790))

(assert (= (and b!14790 res!13828) b!14791))

(assert (= (and b!14791 res!13829) b!14792))

(assert (= (and b!14792 res!13830) b!14793))

(assert (=> b!14793 m!21141))

(declare-fun m!21243 () Bool)

(assert (=> b!14790 m!21243))

(assert (=> b!14790 m!21139))

(declare-fun m!21245 () Bool)

(assert (=> d!4872 m!21245))

(declare-fun m!21247 () Bool)

(assert (=> b!14792 m!21247))

(declare-fun m!21249 () Bool)

(assert (=> b!14792 m!21249))

(declare-fun m!21251 () Bool)

(assert (=> b!14792 m!21251))

(declare-fun m!21253 () Bool)

(assert (=> b!14792 m!21253))

(declare-fun m!21255 () Bool)

(assert (=> b!14791 m!21255))

(assert (=> b!14693 d!4872))

(declare-fun d!4878 () Bool)

(assert (=> d!4878 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1867 thiss!1073) (currentByte!1872 thiss!1073) (size!370 (buf!721 thiss!1073))))))

(declare-fun bs!1344 () Bool)

(assert (= bs!1344 d!4878))

(assert (=> bs!1344 m!21211))

(assert (=> start!3352 d!4878))

(declare-fun d!4882 () Bool)

(declare-datatypes ((tuple2!1702 0))(
  ( (tuple2!1703 (_1!912 Bool) (_2!912 BitStream!700)) )
))
(declare-fun lt!22279 () tuple2!1702)

(declare-fun checkBitsLoop!0 (BitStream!700 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1702)

(assert (=> d!4882 (= lt!22279 (checkBitsLoop!0 (_1!904 lt!22143) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4882 (= (checkBitsLoopPure!0 (_1!904 lt!22143) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1685 (_2!912 lt!22279) (_1!912 lt!22279)))))

(declare-fun bs!1348 () Bool)

(assert (= bs!1348 d!4882))

(declare-fun m!21265 () Bool)

(assert (=> bs!1348 m!21265))

(assert (=> b!14692 d!4882))

(declare-fun d!4894 () Bool)

(assert (=> d!4894 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!370 (buf!721 (_2!902 lt!22142)))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!370 (buf!721 (_2!902 lt!22142)))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073))) nBits!313))))

(declare-fun bs!1349 () Bool)

(assert (= bs!1349 d!4894))

(declare-fun m!21267 () Bool)

(assert (=> bs!1349 m!21267))

(assert (=> b!14692 d!4894))

(declare-fun d!4896 () Bool)

(assert (=> d!4896 (validate_offset_bits!1 ((_ sign_extend 32) (size!370 (buf!721 (_2!902 lt!22142)))) ((_ sign_extend 32) (currentByte!1872 thiss!1073)) ((_ sign_extend 32) (currentBit!1867 thiss!1073)) nBits!313)))

(declare-fun lt!22285 () Unit!1222)

(declare-fun choose!9 (BitStream!700 array!873 (_ BitVec 64) BitStream!700) Unit!1222)

(assert (=> d!4896 (= lt!22285 (choose!9 thiss!1073 (buf!721 (_2!902 lt!22142)) nBits!313 (BitStream!701 (buf!721 (_2!902 lt!22142)) (currentByte!1872 thiss!1073) (currentBit!1867 thiss!1073))))))

(assert (=> d!4896 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!721 (_2!902 lt!22142)) nBits!313) lt!22285)))

(declare-fun bs!1352 () Bool)

(assert (= bs!1352 d!4896))

(assert (=> bs!1352 m!21131))

(declare-fun m!21273 () Bool)

(assert (=> bs!1352 m!21273))

(assert (=> b!14692 d!4896))

(declare-fun lt!22447 () (_ BitVec 64))

(declare-fun lt!22432 () tuple2!1686)

(declare-fun lt!22442 () (_ BitVec 64))

(declare-fun b!14838 () Bool)

(declare-fun e!9288 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!700 (_ BitVec 64)) BitStream!700)

(assert (=> b!14838 (= e!9288 (= (_1!904 lt!22432) (withMovedBitIndex!0 (_2!904 lt!22432) (bvsub lt!22447 lt!22442))))))

(assert (=> b!14838 (or (= (bvand lt!22447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22447 lt!22442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14838 (= lt!22442 (bitIndex!0 (size!370 (buf!721 (_2!902 lt!22142))) (currentByte!1872 (_2!902 lt!22142)) (currentBit!1867 (_2!902 lt!22142))))))

(assert (=> b!14838 (= lt!22447 (bitIndex!0 (size!370 (buf!721 thiss!1073)) (currentByte!1872 thiss!1073) (currentBit!1867 thiss!1073)))))

(declare-fun b!14839 () Bool)

(declare-fun e!9287 () Unit!1222)

(declare-fun Unit!1228 () Unit!1222)

(assert (=> b!14839 (= e!9287 Unit!1228)))

(declare-fun b!14840 () Bool)

(declare-fun lt!22438 () Unit!1222)

(assert (=> b!14840 (= e!9287 lt!22438)))

(declare-fun lt!22443 () (_ BitVec 64))

(assert (=> b!14840 (= lt!22443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22436 () (_ BitVec 64))

(assert (=> b!14840 (= lt!22436 (bitIndex!0 (size!370 (buf!721 thiss!1073)) (currentByte!1872 thiss!1073) (currentBit!1867 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!873 array!873 (_ BitVec 64) (_ BitVec 64)) Unit!1222)

(assert (=> b!14840 (= lt!22438 (arrayBitRangesEqSymmetric!0 (buf!721 thiss!1073) (buf!721 (_2!902 lt!22142)) lt!22443 lt!22436))))

(assert (=> b!14840 (arrayBitRangesEq!0 (buf!721 (_2!902 lt!22142)) (buf!721 thiss!1073) lt!22443 lt!22436)))

(declare-fun b!14842 () Bool)

(declare-fun res!13861 () Bool)

(assert (=> b!14842 (=> (not res!13861) (not e!9288))))

(assert (=> b!14842 (= res!13861 (isPrefixOf!0 (_2!904 lt!22432) (_2!902 lt!22142)))))

(declare-fun d!4902 () Bool)

(assert (=> d!4902 e!9288))

(declare-fun res!13863 () Bool)

(assert (=> d!4902 (=> (not res!13863) (not e!9288))))

(assert (=> d!4902 (= res!13863 (isPrefixOf!0 (_1!904 lt!22432) (_2!904 lt!22432)))))

(declare-fun lt!22429 () BitStream!700)

(assert (=> d!4902 (= lt!22432 (tuple2!1687 lt!22429 (_2!902 lt!22142)))))

(declare-fun lt!22430 () Unit!1222)

(declare-fun lt!22448 () Unit!1222)

(assert (=> d!4902 (= lt!22430 lt!22448)))

(assert (=> d!4902 (isPrefixOf!0 lt!22429 (_2!902 lt!22142))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!700 BitStream!700 BitStream!700) Unit!1222)

(assert (=> d!4902 (= lt!22448 (lemmaIsPrefixTransitive!0 lt!22429 (_2!902 lt!22142) (_2!902 lt!22142)))))

(declare-fun lt!22444 () Unit!1222)

(declare-fun lt!22446 () Unit!1222)

(assert (=> d!4902 (= lt!22444 lt!22446)))

(assert (=> d!4902 (isPrefixOf!0 lt!22429 (_2!902 lt!22142))))

(assert (=> d!4902 (= lt!22446 (lemmaIsPrefixTransitive!0 lt!22429 thiss!1073 (_2!902 lt!22142)))))

(declare-fun lt!22439 () Unit!1222)

(assert (=> d!4902 (= lt!22439 e!9287)))

(declare-fun c!1029 () Bool)

(assert (=> d!4902 (= c!1029 (not (= (size!370 (buf!721 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!22440 () Unit!1222)

(declare-fun lt!22441 () Unit!1222)

(assert (=> d!4902 (= lt!22440 lt!22441)))

(assert (=> d!4902 (isPrefixOf!0 (_2!902 lt!22142) (_2!902 lt!22142))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!700) Unit!1222)

(assert (=> d!4902 (= lt!22441 (lemmaIsPrefixRefl!0 (_2!902 lt!22142)))))

(declare-fun lt!22433 () Unit!1222)

(declare-fun lt!22435 () Unit!1222)

(assert (=> d!4902 (= lt!22433 lt!22435)))

(assert (=> d!4902 (= lt!22435 (lemmaIsPrefixRefl!0 (_2!902 lt!22142)))))

(declare-fun lt!22445 () Unit!1222)

(declare-fun lt!22434 () Unit!1222)

(assert (=> d!4902 (= lt!22445 lt!22434)))

(assert (=> d!4902 (isPrefixOf!0 lt!22429 lt!22429)))

(assert (=> d!4902 (= lt!22434 (lemmaIsPrefixRefl!0 lt!22429))))

(declare-fun lt!22431 () Unit!1222)

(declare-fun lt!22437 () Unit!1222)

(assert (=> d!4902 (= lt!22431 lt!22437)))

(assert (=> d!4902 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!4902 (= lt!22437 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!4902 (= lt!22429 (BitStream!701 (buf!721 (_2!902 lt!22142)) (currentByte!1872 thiss!1073) (currentBit!1867 thiss!1073)))))

(assert (=> d!4902 (isPrefixOf!0 thiss!1073 (_2!902 lt!22142))))

(assert (=> d!4902 (= (reader!0 thiss!1073 (_2!902 lt!22142)) lt!22432)))

(declare-fun b!14841 () Bool)

(declare-fun res!13862 () Bool)

(assert (=> b!14841 (=> (not res!13862) (not e!9288))))

(assert (=> b!14841 (= res!13862 (isPrefixOf!0 (_1!904 lt!22432) thiss!1073))))

(assert (= (and d!4902 c!1029) b!14840))

(assert (= (and d!4902 (not c!1029)) b!14839))

(assert (= (and d!4902 res!13863) b!14841))

(assert (= (and b!14841 res!13862) b!14842))

(assert (= (and b!14842 res!13861) b!14838))

(assert (=> b!14840 m!21139))

(declare-fun m!21307 () Bool)

(assert (=> b!14840 m!21307))

(declare-fun m!21309 () Bool)

(assert (=> b!14840 m!21309))

(declare-fun m!21311 () Bool)

(assert (=> b!14841 m!21311))

(declare-fun m!21313 () Bool)

(assert (=> b!14838 m!21313))

(assert (=> b!14838 m!21137))

(assert (=> b!14838 m!21139))

(declare-fun m!21315 () Bool)

(assert (=> d!4902 m!21315))

(declare-fun m!21317 () Bool)

(assert (=> d!4902 m!21317))

(declare-fun m!21319 () Bool)

(assert (=> d!4902 m!21319))

(declare-fun m!21321 () Bool)

(assert (=> d!4902 m!21321))

(declare-fun m!21323 () Bool)

(assert (=> d!4902 m!21323))

(declare-fun m!21325 () Bool)

(assert (=> d!4902 m!21325))

(declare-fun m!21327 () Bool)

(assert (=> d!4902 m!21327))

(assert (=> d!4902 m!21151))

(declare-fun m!21329 () Bool)

(assert (=> d!4902 m!21329))

(declare-fun m!21331 () Bool)

(assert (=> d!4902 m!21331))

(declare-fun m!21333 () Bool)

(assert (=> d!4902 m!21333))

(declare-fun m!21335 () Bool)

(assert (=> b!14842 m!21335))

(assert (=> b!14692 d!4902))

(push 1)

(assert (not b!14791))

(assert (not d!4902))

(assert (not b!14755))

(assert (not b!14793))

(assert (not b!14838))

(assert (not b!14842))

(assert (not d!4882))

(assert (not b!14841))

(assert (not d!4896))

(assert (not b!14792))

(assert (not b!14840))

(assert (not d!4868))

(assert (not d!4846))

(assert (not d!4872))

(assert (not d!4894))

(assert (not b!14757))

(assert (not b!14790))

(assert (not d!4858))

(assert (not d!4878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

