; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3498 () Bool)

(assert start!3498)

(declare-fun b!15189 () Bool)

(declare-fun res!14162 () Bool)

(declare-fun e!9497 () Bool)

(assert (=> b!15189 (=> (not res!14162) (not e!9497))))

(declare-datatypes ((array!905 0))(
  ( (array!906 (arr!812 (Array (_ BitVec 32) (_ BitVec 8))) (size!383 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!726 0))(
  ( (BitStream!727 (buf!740 array!905) (currentByte!1903 (_ BitVec 32)) (currentBit!1898 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!726)

(declare-datatypes ((Unit!1254 0))(
  ( (Unit!1255) )
))
(declare-datatypes ((tuple2!1772 0))(
  ( (tuple2!1773 (_1!947 Unit!1254) (_2!947 BitStream!726)) )
))
(declare-fun lt!23035 () tuple2!1772)

(declare-fun isPrefixOf!0 (BitStream!726 BitStream!726) Bool)

(assert (=> b!15189 (= res!14162 (isPrefixOf!0 thiss!1073 (_2!947 lt!23035)))))

(declare-fun b!15190 () Bool)

(declare-fun res!14158 () Bool)

(assert (=> b!15190 (=> (not res!14158) (not e!9497))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15190 (= res!14158 (= (bitIndex!0 (size!383 (buf!740 (_2!947 lt!23035))) (currentByte!1903 (_2!947 lt!23035)) (currentBit!1898 (_2!947 lt!23035))) (bvadd (bitIndex!0 (size!383 (buf!740 thiss!1073)) (currentByte!1903 thiss!1073) (currentBit!1898 thiss!1073)) nBits!313)))))

(declare-fun b!15191 () Bool)

(declare-fun e!9498 () Bool)

(declare-fun array_inv!372 (array!905) Bool)

(assert (=> b!15191 (= e!9498 (array_inv!372 (buf!740 thiss!1073)))))

(declare-fun res!14161 () Bool)

(declare-fun e!9495 () Bool)

(assert (=> start!3498 (=> (not res!14161) (not e!9495))))

(assert (=> start!3498 (= res!14161 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3498 e!9495))

(assert (=> start!3498 true))

(declare-fun inv!12 (BitStream!726) Bool)

(assert (=> start!3498 (and (inv!12 thiss!1073) e!9498)))

(declare-fun b!15192 () Bool)

(declare-datatypes ((tuple2!1774 0))(
  ( (tuple2!1775 (_1!948 BitStream!726) (_2!948 Bool)) )
))
(declare-fun lt!23031 () tuple2!1774)

(declare-datatypes ((tuple2!1776 0))(
  ( (tuple2!1777 (_1!949 BitStream!726) (_2!949 BitStream!726)) )
))
(declare-fun lt!23032 () tuple2!1776)

(assert (=> b!15192 (= e!9497 (not (or (not (_2!948 lt!23031)) (not (= (_1!948 lt!23031) (_2!949 lt!23032))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!726 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1774)

(assert (=> b!15192 (= lt!23031 (checkBitsLoopPure!0 (_1!949 lt!23032) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15192 (validate_offset_bits!1 ((_ sign_extend 32) (size!383 (buf!740 (_2!947 lt!23035)))) ((_ sign_extend 32) (currentByte!1903 thiss!1073)) ((_ sign_extend 32) (currentBit!1898 thiss!1073)) nBits!313)))

(declare-fun lt!23030 () Unit!1254)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!726 array!905 (_ BitVec 64)) Unit!1254)

(assert (=> b!15192 (= lt!23030 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!740 (_2!947 lt!23035)) nBits!313))))

(declare-fun reader!0 (BitStream!726 BitStream!726) tuple2!1776)

(assert (=> b!15192 (= lt!23032 (reader!0 thiss!1073 (_2!947 lt!23035)))))

(declare-fun b!15193 () Bool)

(assert (=> b!15193 (= e!9495 (not true))))

(declare-fun lt!23033 () tuple2!1776)

(assert (=> b!15193 (= lt!23033 (reader!0 thiss!1073 (_2!947 lt!23035)))))

(declare-fun lt!23029 () Bool)

(assert (=> b!15193 (= lt!23029 (isPrefixOf!0 thiss!1073 (_2!947 lt!23035)))))

(declare-fun lt!23028 () (_ BitVec 64))

(assert (=> b!15193 (= lt!23028 (bitIndex!0 (size!383 (buf!740 (_2!947 lt!23035))) (currentByte!1903 (_2!947 lt!23035)) (currentBit!1898 (_2!947 lt!23035))))))

(declare-fun lt!23034 () (_ BitVec 64))

(assert (=> b!15193 (= lt!23034 (bitIndex!0 (size!383 (buf!740 thiss!1073)) (currentByte!1903 thiss!1073) (currentBit!1898 thiss!1073)))))

(assert (=> b!15193 e!9497))

(declare-fun res!14160 () Bool)

(assert (=> b!15193 (=> (not res!14160) (not e!9497))))

(assert (=> b!15193 (= res!14160 (= (size!383 (buf!740 thiss!1073)) (size!383 (buf!740 (_2!947 lt!23035)))))))

(declare-fun appendNBits!0 (BitStream!726 (_ BitVec 64) Bool) tuple2!1772)

(assert (=> b!15193 (= lt!23035 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15194 () Bool)

(declare-fun res!14159 () Bool)

(assert (=> b!15194 (=> (not res!14159) (not e!9495))))

(assert (=> b!15194 (= res!14159 (validate_offset_bits!1 ((_ sign_extend 32) (size!383 (buf!740 thiss!1073))) ((_ sign_extend 32) (currentByte!1903 thiss!1073)) ((_ sign_extend 32) (currentBit!1898 thiss!1073)) nBits!313))))

(assert (= (and start!3498 res!14161) b!15194))

(assert (= (and b!15194 res!14159) b!15193))

(assert (= (and b!15193 res!14160) b!15190))

(assert (= (and b!15190 res!14158) b!15189))

(assert (= (and b!15189 res!14162) b!15192))

(assert (= start!3498 b!15191))

(declare-fun m!21775 () Bool)

(assert (=> b!15193 m!21775))

(declare-fun m!21777 () Bool)

(assert (=> b!15193 m!21777))

(declare-fun m!21779 () Bool)

(assert (=> b!15193 m!21779))

(declare-fun m!21781 () Bool)

(assert (=> b!15193 m!21781))

(declare-fun m!21783 () Bool)

(assert (=> b!15193 m!21783))

(declare-fun m!21785 () Bool)

(assert (=> start!3498 m!21785))

(declare-fun m!21787 () Bool)

(assert (=> b!15194 m!21787))

(declare-fun m!21789 () Bool)

(assert (=> b!15191 m!21789))

(assert (=> b!15190 m!21777))

(assert (=> b!15190 m!21775))

(assert (=> b!15189 m!21781))

(declare-fun m!21791 () Bool)

(assert (=> b!15192 m!21791))

(declare-fun m!21793 () Bool)

(assert (=> b!15192 m!21793))

(declare-fun m!21795 () Bool)

(assert (=> b!15192 m!21795))

(assert (=> b!15192 m!21783))

(check-sat (not b!15189) (not b!15190) (not start!3498) (not b!15191) (not b!15193) (not b!15192) (not b!15194))
