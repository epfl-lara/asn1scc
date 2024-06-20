; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3486 () Bool)

(assert start!3486)

(declare-fun b!15081 () Bool)

(declare-fun res!14070 () Bool)

(declare-fun e!9425 () Bool)

(assert (=> b!15081 (=> (not res!14070) (not e!9425))))

(declare-datatypes ((array!893 0))(
  ( (array!894 (arr!806 (Array (_ BitVec 32) (_ BitVec 8))) (size!377 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!714 0))(
  ( (BitStream!715 (buf!734 array!893) (currentByte!1897 (_ BitVec 32)) (currentBit!1892 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1242 0))(
  ( (Unit!1243) )
))
(declare-datatypes ((tuple2!1736 0))(
  ( (tuple2!1737 (_1!929 Unit!1242) (_2!929 BitStream!714)) )
))
(declare-fun lt!22892 () tuple2!1736)

(declare-fun thiss!1073 () BitStream!714)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15081 (= res!14070 (= (bitIndex!0 (size!377 (buf!734 (_2!929 lt!22892))) (currentByte!1897 (_2!929 lt!22892)) (currentBit!1892 (_2!929 lt!22892))) (bvadd (bitIndex!0 (size!377 (buf!734 thiss!1073)) (currentByte!1897 thiss!1073) (currentBit!1892 thiss!1073)) nBits!313)))))

(declare-fun res!14071 () Bool)

(declare-fun e!9424 () Bool)

(assert (=> start!3486 (=> (not res!14071) (not e!9424))))

(assert (=> start!3486 (= res!14071 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3486 e!9424))

(assert (=> start!3486 true))

(declare-fun e!9423 () Bool)

(declare-fun inv!12 (BitStream!714) Bool)

(assert (=> start!3486 (and (inv!12 thiss!1073) e!9423)))

(declare-fun b!15082 () Bool)

(declare-fun array_inv!366 (array!893) Bool)

(assert (=> b!15082 (= e!9423 (array_inv!366 (buf!734 thiss!1073)))))

(declare-fun b!15083 () Bool)

(declare-fun res!14072 () Bool)

(assert (=> b!15083 (=> (not res!14072) (not e!9425))))

(declare-fun isPrefixOf!0 (BitStream!714 BitStream!714) Bool)

(assert (=> b!15083 (= res!14072 (isPrefixOf!0 thiss!1073 (_2!929 lt!22892)))))

(declare-fun b!15084 () Bool)

(declare-datatypes ((tuple2!1738 0))(
  ( (tuple2!1739 (_1!930 BitStream!714) (_2!930 Bool)) )
))
(declare-fun lt!22894 () tuple2!1738)

(declare-datatypes ((tuple2!1740 0))(
  ( (tuple2!1741 (_1!931 BitStream!714) (_2!931 BitStream!714)) )
))
(declare-fun lt!22891 () tuple2!1740)

(assert (=> b!15084 (= e!9425 (not (or (not (_2!930 lt!22894)) (not (= (_1!930 lt!22894) (_2!931 lt!22891))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!714 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1738)

(assert (=> b!15084 (= lt!22894 (checkBitsLoopPure!0 (_1!931 lt!22891) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15084 (validate_offset_bits!1 ((_ sign_extend 32) (size!377 (buf!734 (_2!929 lt!22892)))) ((_ sign_extend 32) (currentByte!1897 thiss!1073)) ((_ sign_extend 32) (currentBit!1892 thiss!1073)) nBits!313)))

(declare-fun lt!22893 () Unit!1242)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!714 array!893 (_ BitVec 64)) Unit!1242)

(assert (=> b!15084 (= lt!22893 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!734 (_2!929 lt!22892)) nBits!313))))

(declare-fun reader!0 (BitStream!714 BitStream!714) tuple2!1740)

(assert (=> b!15084 (= lt!22891 (reader!0 thiss!1073 (_2!929 lt!22892)))))

(declare-fun b!15085 () Bool)

(assert (=> b!15085 (= e!9424 (not true))))

(declare-fun lt!22890 () Bool)

(assert (=> b!15085 (= lt!22890 (isPrefixOf!0 thiss!1073 (_2!929 lt!22892)))))

(declare-fun lt!22889 () (_ BitVec 64))

(assert (=> b!15085 (= lt!22889 (bitIndex!0 (size!377 (buf!734 (_2!929 lt!22892))) (currentByte!1897 (_2!929 lt!22892)) (currentBit!1892 (_2!929 lt!22892))))))

(declare-fun lt!22888 () (_ BitVec 64))

(assert (=> b!15085 (= lt!22888 (bitIndex!0 (size!377 (buf!734 thiss!1073)) (currentByte!1897 thiss!1073) (currentBit!1892 thiss!1073)))))

(assert (=> b!15085 e!9425))

(declare-fun res!14068 () Bool)

(assert (=> b!15085 (=> (not res!14068) (not e!9425))))

(assert (=> b!15085 (= res!14068 (= (size!377 (buf!734 thiss!1073)) (size!377 (buf!734 (_2!929 lt!22892)))))))

(declare-fun appendNBits!0 (BitStream!714 (_ BitVec 64) Bool) tuple2!1736)

(assert (=> b!15085 (= lt!22892 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15086 () Bool)

(declare-fun res!14069 () Bool)

(assert (=> b!15086 (=> (not res!14069) (not e!9424))))

(assert (=> b!15086 (= res!14069 (validate_offset_bits!1 ((_ sign_extend 32) (size!377 (buf!734 thiss!1073))) ((_ sign_extend 32) (currentByte!1897 thiss!1073)) ((_ sign_extend 32) (currentBit!1892 thiss!1073)) nBits!313))))

(assert (= (and start!3486 res!14071) b!15086))

(assert (= (and b!15086 res!14069) b!15085))

(assert (= (and b!15085 res!14068) b!15081))

(assert (= (and b!15081 res!14070) b!15083))

(assert (= (and b!15083 res!14072) b!15084))

(assert (= start!3486 b!15082))

(declare-fun m!21643 () Bool)

(assert (=> b!15082 m!21643))

(declare-fun m!21645 () Bool)

(assert (=> b!15086 m!21645))

(declare-fun m!21647 () Bool)

(assert (=> b!15083 m!21647))

(declare-fun m!21649 () Bool)

(assert (=> start!3486 m!21649))

(declare-fun m!21651 () Bool)

(assert (=> b!15081 m!21651))

(declare-fun m!21653 () Bool)

(assert (=> b!15081 m!21653))

(assert (=> b!15085 m!21647))

(assert (=> b!15085 m!21651))

(assert (=> b!15085 m!21653))

(declare-fun m!21655 () Bool)

(assert (=> b!15085 m!21655))

(declare-fun m!21657 () Bool)

(assert (=> b!15084 m!21657))

(declare-fun m!21659 () Bool)

(assert (=> b!15084 m!21659))

(declare-fun m!21661 () Bool)

(assert (=> b!15084 m!21661))

(declare-fun m!21663 () Bool)

(assert (=> b!15084 m!21663))

(check-sat (not b!15082) (not b!15085) (not b!15086) (not b!15081) (not b!15083) (not b!15084) (not start!3486))
