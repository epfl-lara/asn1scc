; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3492 () Bool)

(assert start!3492)

(declare-fun b!15135 () Bool)

(declare-fun e!9462 () Bool)

(declare-datatypes ((array!899 0))(
  ( (array!900 (arr!809 (Array (_ BitVec 32) (_ BitVec 8))) (size!380 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!720 0))(
  ( (BitStream!721 (buf!737 array!899) (currentByte!1900 (_ BitVec 32)) (currentBit!1895 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1754 0))(
  ( (tuple2!1755 (_1!938 BitStream!720) (_2!938 Bool)) )
))
(declare-fun lt!22956 () tuple2!1754)

(declare-datatypes ((tuple2!1756 0))(
  ( (tuple2!1757 (_1!939 BitStream!720) (_2!939 BitStream!720)) )
))
(declare-fun lt!22960 () tuple2!1756)

(assert (=> b!15135 (= e!9462 (not (or (not (_2!938 lt!22956)) (not (= (_1!938 lt!22956) (_2!939 lt!22960))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!720 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1754)

(assert (=> b!15135 (= lt!22956 (checkBitsLoopPure!0 (_1!939 lt!22960) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1248 0))(
  ( (Unit!1249) )
))
(declare-datatypes ((tuple2!1758 0))(
  ( (tuple2!1759 (_1!940 Unit!1248) (_2!940 BitStream!720)) )
))
(declare-fun lt!22963 () tuple2!1758)

(declare-fun thiss!1073 () BitStream!720)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15135 (validate_offset_bits!1 ((_ sign_extend 32) (size!380 (buf!737 (_2!940 lt!22963)))) ((_ sign_extend 32) (currentByte!1900 thiss!1073)) ((_ sign_extend 32) (currentBit!1895 thiss!1073)) nBits!313)))

(declare-fun lt!22959 () Unit!1248)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!720 array!899 (_ BitVec 64)) Unit!1248)

(assert (=> b!15135 (= lt!22959 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!737 (_2!940 lt!22963)) nBits!313))))

(declare-fun reader!0 (BitStream!720 BitStream!720) tuple2!1756)

(assert (=> b!15135 (= lt!22960 (reader!0 thiss!1073 (_2!940 lt!22963)))))

(declare-fun b!15136 () Bool)

(declare-fun e!9460 () Bool)

(assert (=> b!15136 (= e!9460 (not true))))

(declare-fun lt!22961 () tuple2!1756)

(assert (=> b!15136 (= lt!22961 (reader!0 thiss!1073 (_2!940 lt!22963)))))

(declare-fun lt!22958 () Bool)

(declare-fun isPrefixOf!0 (BitStream!720 BitStream!720) Bool)

(assert (=> b!15136 (= lt!22958 (isPrefixOf!0 thiss!1073 (_2!940 lt!22963)))))

(declare-fun lt!22957 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15136 (= lt!22957 (bitIndex!0 (size!380 (buf!737 (_2!940 lt!22963))) (currentByte!1900 (_2!940 lt!22963)) (currentBit!1895 (_2!940 lt!22963))))))

(declare-fun lt!22962 () (_ BitVec 64))

(assert (=> b!15136 (= lt!22962 (bitIndex!0 (size!380 (buf!737 thiss!1073)) (currentByte!1900 thiss!1073) (currentBit!1895 thiss!1073)))))

(assert (=> b!15136 e!9462))

(declare-fun res!14115 () Bool)

(assert (=> b!15136 (=> (not res!14115) (not e!9462))))

(assert (=> b!15136 (= res!14115 (= (size!380 (buf!737 thiss!1073)) (size!380 (buf!737 (_2!940 lt!22963)))))))

(declare-fun appendNBits!0 (BitStream!720 (_ BitVec 64) Bool) tuple2!1758)

(assert (=> b!15136 (= lt!22963 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15137 () Bool)

(declare-fun res!14116 () Bool)

(assert (=> b!15137 (=> (not res!14116) (not e!9460))))

(assert (=> b!15137 (= res!14116 (validate_offset_bits!1 ((_ sign_extend 32) (size!380 (buf!737 thiss!1073))) ((_ sign_extend 32) (currentByte!1900 thiss!1073)) ((_ sign_extend 32) (currentBit!1895 thiss!1073)) nBits!313))))

(declare-fun res!14113 () Bool)

(assert (=> start!3492 (=> (not res!14113) (not e!9460))))

(assert (=> start!3492 (= res!14113 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3492 e!9460))

(assert (=> start!3492 true))

(declare-fun e!9461 () Bool)

(declare-fun inv!12 (BitStream!720) Bool)

(assert (=> start!3492 (and (inv!12 thiss!1073) e!9461)))

(declare-fun b!15138 () Bool)

(declare-fun res!14114 () Bool)

(assert (=> b!15138 (=> (not res!14114) (not e!9462))))

(assert (=> b!15138 (= res!14114 (= (bitIndex!0 (size!380 (buf!737 (_2!940 lt!22963))) (currentByte!1900 (_2!940 lt!22963)) (currentBit!1895 (_2!940 lt!22963))) (bvadd (bitIndex!0 (size!380 (buf!737 thiss!1073)) (currentByte!1900 thiss!1073) (currentBit!1895 thiss!1073)) nBits!313)))))

(declare-fun b!15139 () Bool)

(declare-fun array_inv!369 (array!899) Bool)

(assert (=> b!15139 (= e!9461 (array_inv!369 (buf!737 thiss!1073)))))

(declare-fun b!15140 () Bool)

(declare-fun res!14117 () Bool)

(assert (=> b!15140 (=> (not res!14117) (not e!9462))))

(assert (=> b!15140 (= res!14117 (isPrefixOf!0 thiss!1073 (_2!940 lt!22963)))))

(assert (= (and start!3492 res!14113) b!15137))

(assert (= (and b!15137 res!14116) b!15136))

(assert (= (and b!15136 res!14115) b!15138))

(assert (= (and b!15138 res!14114) b!15140))

(assert (= (and b!15140 res!14117) b!15135))

(assert (= start!3492 b!15139))

(declare-fun m!21709 () Bool)

(assert (=> b!15140 m!21709))

(declare-fun m!21711 () Bool)

(assert (=> b!15135 m!21711))

(declare-fun m!21713 () Bool)

(assert (=> b!15135 m!21713))

(declare-fun m!21715 () Bool)

(assert (=> b!15135 m!21715))

(declare-fun m!21717 () Bool)

(assert (=> b!15135 m!21717))

(declare-fun m!21719 () Bool)

(assert (=> b!15137 m!21719))

(declare-fun m!21721 () Bool)

(assert (=> b!15136 m!21721))

(assert (=> b!15136 m!21709))

(declare-fun m!21723 () Bool)

(assert (=> b!15136 m!21723))

(declare-fun m!21725 () Bool)

(assert (=> b!15136 m!21725))

(assert (=> b!15136 m!21717))

(declare-fun m!21727 () Bool)

(assert (=> start!3492 m!21727))

(assert (=> b!15138 m!21723))

(assert (=> b!15138 m!21721))

(declare-fun m!21729 () Bool)

(assert (=> b!15139 m!21729))

(check-sat (not b!15138) (not b!15137) (not b!15135) (not b!15139) (not b!15140) (not b!15136) (not start!3492))
