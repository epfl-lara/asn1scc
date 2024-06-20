; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3582 () Bool)

(assert start!3582)

(declare-fun b!15591 () Bool)

(declare-fun e!9742 () Bool)

(declare-fun lt!23731 () (_ BitVec 64))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun lt!23729 () (_ BitVec 64))

(assert (=> b!15591 (= e!9742 (not (or (not (= lt!23729 (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!23729 (bvand (bvadd lt!23731 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!15591 (= lt!23729 (bvand lt!23731 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!938 0))(
  ( (array!939 (arr!827 (Array (_ BitVec 32) (_ BitVec 8))) (size!398 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!756 0))(
  ( (BitStream!757 (buf!758 array!938) (currentByte!1924 (_ BitVec 32)) (currentBit!1919 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!756)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15591 (= lt!23731 (bitIndex!0 (size!398 (buf!758 thiss!1073)) (currentByte!1924 thiss!1073) (currentBit!1919 thiss!1073)))))

(declare-fun e!9744 () Bool)

(assert (=> b!15591 e!9744))

(declare-fun res!14499 () Bool)

(assert (=> b!15591 (=> (not res!14499) (not e!9744))))

(declare-datatypes ((Unit!1287 0))(
  ( (Unit!1288) )
))
(declare-datatypes ((tuple2!1868 0))(
  ( (tuple2!1869 (_1!995 Unit!1287) (_2!995 BitStream!756)) )
))
(declare-fun lt!23732 () tuple2!1868)

(assert (=> b!15591 (= res!14499 (= (size!398 (buf!758 thiss!1073)) (size!398 (buf!758 (_2!995 lt!23732)))))))

(declare-fun appendNBits!0 (BitStream!756 (_ BitVec 64) Bool) tuple2!1868)

(assert (=> b!15591 (= lt!23732 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15592 () Bool)

(declare-fun res!14498 () Bool)

(assert (=> b!15592 (=> (not res!14498) (not e!9744))))

(declare-fun isPrefixOf!0 (BitStream!756 BitStream!756) Bool)

(assert (=> b!15592 (= res!14498 (isPrefixOf!0 thiss!1073 (_2!995 lt!23732)))))

(declare-fun b!15593 () Bool)

(declare-fun res!14497 () Bool)

(assert (=> b!15593 (=> (not res!14497) (not e!9742))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15593 (= res!14497 (validate_offset_bits!1 ((_ sign_extend 32) (size!398 (buf!758 thiss!1073))) ((_ sign_extend 32) (currentByte!1924 thiss!1073)) ((_ sign_extend 32) (currentBit!1919 thiss!1073)) nBits!313))))

(declare-fun b!15595 () Bool)

(declare-fun e!9743 () Bool)

(declare-fun array_inv!387 (array!938) Bool)

(assert (=> b!15595 (= e!9743 (array_inv!387 (buf!758 thiss!1073)))))

(declare-fun b!15596 () Bool)

(declare-datatypes ((tuple2!1870 0))(
  ( (tuple2!1871 (_1!996 BitStream!756) (_2!996 Bool)) )
))
(declare-fun lt!23734 () tuple2!1870)

(declare-datatypes ((tuple2!1872 0))(
  ( (tuple2!1873 (_1!997 BitStream!756) (_2!997 BitStream!756)) )
))
(declare-fun lt!23730 () tuple2!1872)

(assert (=> b!15596 (= e!9744 (not (or (not (_2!996 lt!23734)) (not (= (_1!996 lt!23734) (_2!997 lt!23730))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!756 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1870)

(assert (=> b!15596 (= lt!23734 (checkBitsLoopPure!0 (_1!997 lt!23730) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15596 (validate_offset_bits!1 ((_ sign_extend 32) (size!398 (buf!758 (_2!995 lt!23732)))) ((_ sign_extend 32) (currentByte!1924 thiss!1073)) ((_ sign_extend 32) (currentBit!1919 thiss!1073)) nBits!313)))

(declare-fun lt!23733 () Unit!1287)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!756 array!938 (_ BitVec 64)) Unit!1287)

(assert (=> b!15596 (= lt!23733 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!758 (_2!995 lt!23732)) nBits!313))))

(declare-fun reader!0 (BitStream!756 BitStream!756) tuple2!1872)

(assert (=> b!15596 (= lt!23730 (reader!0 thiss!1073 (_2!995 lt!23732)))))

(declare-fun res!14500 () Bool)

(assert (=> start!3582 (=> (not res!14500) (not e!9742))))

(assert (=> start!3582 (= res!14500 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3582 e!9742))

(assert (=> start!3582 true))

(declare-fun inv!12 (BitStream!756) Bool)

(assert (=> start!3582 (and (inv!12 thiss!1073) e!9743)))

(declare-fun b!15594 () Bool)

(declare-fun res!14501 () Bool)

(assert (=> b!15594 (=> (not res!14501) (not e!9744))))

(assert (=> b!15594 (= res!14501 (= (bitIndex!0 (size!398 (buf!758 (_2!995 lt!23732))) (currentByte!1924 (_2!995 lt!23732)) (currentBit!1919 (_2!995 lt!23732))) (bvadd (bitIndex!0 (size!398 (buf!758 thiss!1073)) (currentByte!1924 thiss!1073) (currentBit!1919 thiss!1073)) nBits!313)))))

(assert (= (and start!3582 res!14500) b!15593))

(assert (= (and b!15593 res!14497) b!15591))

(assert (= (and b!15591 res!14499) b!15594))

(assert (= (and b!15594 res!14501) b!15592))

(assert (= (and b!15592 res!14498) b!15596))

(assert (= start!3582 b!15595))

(declare-fun m!22297 () Bool)

(assert (=> b!15594 m!22297))

(declare-fun m!22299 () Bool)

(assert (=> b!15594 m!22299))

(assert (=> b!15591 m!22299))

(declare-fun m!22301 () Bool)

(assert (=> b!15591 m!22301))

(declare-fun m!22303 () Bool)

(assert (=> b!15593 m!22303))

(declare-fun m!22305 () Bool)

(assert (=> b!15592 m!22305))

(declare-fun m!22307 () Bool)

(assert (=> b!15596 m!22307))

(declare-fun m!22309 () Bool)

(assert (=> b!15596 m!22309))

(declare-fun m!22311 () Bool)

(assert (=> b!15596 m!22311))

(declare-fun m!22313 () Bool)

(assert (=> b!15596 m!22313))

(declare-fun m!22315 () Bool)

(assert (=> b!15595 m!22315))

(declare-fun m!22317 () Bool)

(assert (=> start!3582 m!22317))

(check-sat (not b!15593) (not b!15592) (not b!15591) (not b!15596) (not b!15594) (not b!15595) (not start!3582))
(check-sat)
(get-model)

