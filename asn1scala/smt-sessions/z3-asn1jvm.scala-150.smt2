; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3516 () Bool)

(assert start!3516)

(declare-fun b!15351 () Bool)

(declare-fun e!9605 () Bool)

(declare-datatypes ((array!923 0))(
  ( (array!924 (arr!821 (Array (_ BitVec 32) (_ BitVec 8))) (size!392 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!744 0))(
  ( (BitStream!745 (buf!749 array!923) (currentByte!1912 (_ BitVec 32)) (currentBit!1907 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!744)

(declare-fun array_inv!381 (array!923) Bool)

(assert (=> b!15351 (= e!9605 (array_inv!381 (buf!749 thiss!1073)))))

(declare-fun b!15353 () Bool)

(declare-fun res!14293 () Bool)

(declare-fun e!9603 () Bool)

(assert (=> b!15353 (=> (not res!14293) (not e!9603))))

(declare-datatypes ((Unit!1272 0))(
  ( (Unit!1273) )
))
(declare-datatypes ((tuple2!1826 0))(
  ( (tuple2!1827 (_1!974 Unit!1272) (_2!974 BitStream!744)) )
))
(declare-fun lt!23261 () tuple2!1826)

(declare-fun isPrefixOf!0 (BitStream!744 BitStream!744) Bool)

(assert (=> b!15353 (= res!14293 (isPrefixOf!0 thiss!1073 (_2!974 lt!23261)))))

(declare-fun b!15354 () Bool)

(declare-fun res!14297 () Bool)

(declare-fun e!9604 () Bool)

(assert (=> b!15354 (=> (not res!14297) (not e!9604))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15354 (= res!14297 (validate_offset_bits!1 ((_ sign_extend 32) (size!392 (buf!749 thiss!1073))) ((_ sign_extend 32) (currentByte!1912 thiss!1073)) ((_ sign_extend 32) (currentBit!1907 thiss!1073)) nBits!313))))

(declare-fun b!15355 () Bool)

(declare-fun res!14295 () Bool)

(assert (=> b!15355 (=> (not res!14295) (not e!9603))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15355 (= res!14295 (= (bitIndex!0 (size!392 (buf!749 (_2!974 lt!23261))) (currentByte!1912 (_2!974 lt!23261)) (currentBit!1907 (_2!974 lt!23261))) (bvadd (bitIndex!0 (size!392 (buf!749 thiss!1073)) (currentByte!1912 thiss!1073) (currentBit!1907 thiss!1073)) nBits!313)))))

(declare-fun b!15356 () Bool)

(declare-datatypes ((tuple2!1828 0))(
  ( (tuple2!1829 (_1!975 BitStream!744) (_2!975 Bool)) )
))
(declare-fun lt!23260 () tuple2!1828)

(declare-datatypes ((tuple2!1830 0))(
  ( (tuple2!1831 (_1!976 BitStream!744) (_2!976 BitStream!744)) )
))
(declare-fun lt!23263 () tuple2!1830)

(assert (=> b!15356 (= e!9603 (not (or (not (_2!975 lt!23260)) (not (= (_1!975 lt!23260) (_2!976 lt!23263))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!744 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1828)

(assert (=> b!15356 (= lt!23260 (checkBitsLoopPure!0 (_1!976 lt!23263) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15356 (validate_offset_bits!1 ((_ sign_extend 32) (size!392 (buf!749 (_2!974 lt!23261)))) ((_ sign_extend 32) (currentByte!1912 thiss!1073)) ((_ sign_extend 32) (currentBit!1907 thiss!1073)) nBits!313)))

(declare-fun lt!23259 () Unit!1272)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!744 array!923 (_ BitVec 64)) Unit!1272)

(assert (=> b!15356 (= lt!23259 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!749 (_2!974 lt!23261)) nBits!313))))

(declare-fun reader!0 (BitStream!744 BitStream!744) tuple2!1830)

(assert (=> b!15356 (= lt!23263 (reader!0 thiss!1073 (_2!974 lt!23261)))))

(declare-fun res!14294 () Bool)

(assert (=> start!3516 (=> (not res!14294) (not e!9604))))

(assert (=> start!3516 (= res!14294 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3516 e!9604))

(assert (=> start!3516 true))

(declare-fun inv!12 (BitStream!744) Bool)

(assert (=> start!3516 (and (inv!12 thiss!1073) e!9605)))

(declare-fun b!15352 () Bool)

(assert (=> b!15352 (= e!9604 (not true))))

(assert (=> b!15352 (validate_offset_bits!1 ((_ sign_extend 32) (size!392 (buf!749 (_2!974 lt!23261)))) ((_ sign_extend 32) (currentByte!1912 thiss!1073)) ((_ sign_extend 32) (currentBit!1907 thiss!1073)) nBits!313)))

(declare-fun lt!23262 () Unit!1272)

(assert (=> b!15352 (= lt!23262 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!749 (_2!974 lt!23261)) nBits!313))))

(declare-fun lt!23264 () tuple2!1830)

(assert (=> b!15352 (= lt!23264 (reader!0 thiss!1073 (_2!974 lt!23261)))))

(declare-fun lt!23266 () Bool)

(assert (=> b!15352 (= lt!23266 (isPrefixOf!0 thiss!1073 (_2!974 lt!23261)))))

(declare-fun lt!23265 () (_ BitVec 64))

(assert (=> b!15352 (= lt!23265 (bitIndex!0 (size!392 (buf!749 (_2!974 lt!23261))) (currentByte!1912 (_2!974 lt!23261)) (currentBit!1907 (_2!974 lt!23261))))))

(declare-fun lt!23258 () (_ BitVec 64))

(assert (=> b!15352 (= lt!23258 (bitIndex!0 (size!392 (buf!749 thiss!1073)) (currentByte!1912 thiss!1073) (currentBit!1907 thiss!1073)))))

(assert (=> b!15352 e!9603))

(declare-fun res!14296 () Bool)

(assert (=> b!15352 (=> (not res!14296) (not e!9603))))

(assert (=> b!15352 (= res!14296 (= (size!392 (buf!749 thiss!1073)) (size!392 (buf!749 (_2!974 lt!23261)))))))

(declare-fun appendNBits!0 (BitStream!744 (_ BitVec 64) Bool) tuple2!1826)

(assert (=> b!15352 (= lt!23261 (appendNBits!0 thiss!1073 nBits!313 true))))

(assert (= (and start!3516 res!14294) b!15354))

(assert (= (and b!15354 res!14297) b!15352))

(assert (= (and b!15352 res!14296) b!15355))

(assert (= (and b!15355 res!14295) b!15353))

(assert (= (and b!15353 res!14293) b!15356))

(assert (= start!3516 b!15351))

(declare-fun m!21973 () Bool)

(assert (=> b!15356 m!21973))

(declare-fun m!21975 () Bool)

(assert (=> b!15356 m!21975))

(declare-fun m!21977 () Bool)

(assert (=> b!15356 m!21977))

(declare-fun m!21979 () Bool)

(assert (=> b!15356 m!21979))

(declare-fun m!21981 () Bool)

(assert (=> start!3516 m!21981))

(declare-fun m!21983 () Bool)

(assert (=> b!15352 m!21983))

(declare-fun m!21985 () Bool)

(assert (=> b!15352 m!21985))

(declare-fun m!21987 () Bool)

(assert (=> b!15352 m!21987))

(assert (=> b!15352 m!21975))

(declare-fun m!21989 () Bool)

(assert (=> b!15352 m!21989))

(assert (=> b!15352 m!21977))

(assert (=> b!15352 m!21979))

(assert (=> b!15355 m!21987))

(assert (=> b!15355 m!21985))

(declare-fun m!21991 () Bool)

(assert (=> b!15351 m!21991))

(assert (=> b!15353 m!21983))

(declare-fun m!21993 () Bool)

(assert (=> b!15354 m!21993))

(check-sat (not b!15353) (not b!15351) (not b!15356) (not b!15352) (not b!15355) (not b!15354) (not start!3516))
