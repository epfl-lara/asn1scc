; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3504 () Bool)

(assert start!3504)

(declare-fun b!15243 () Bool)

(declare-fun res!14206 () Bool)

(declare-fun e!9534 () Bool)

(assert (=> b!15243 (=> (not res!14206) (not e!9534))))

(declare-datatypes ((array!911 0))(
  ( (array!912 (arr!815 (Array (_ BitVec 32) (_ BitVec 8))) (size!386 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!732 0))(
  ( (BitStream!733 (buf!743 array!911) (currentByte!1906 (_ BitVec 32)) (currentBit!1901 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!732)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15243 (= res!14206 (validate_offset_bits!1 ((_ sign_extend 32) (size!386 (buf!743 thiss!1073))) ((_ sign_extend 32) (currentByte!1906 thiss!1073)) ((_ sign_extend 32) (currentBit!1901 thiss!1073)) nBits!313))))

(declare-fun b!15244 () Bool)

(declare-fun e!9533 () Bool)

(declare-fun array_inv!375 (array!911) Bool)

(assert (=> b!15244 (= e!9533 (array_inv!375 (buf!743 thiss!1073)))))

(declare-fun b!15246 () Bool)

(declare-fun res!14207 () Bool)

(declare-fun e!9532 () Bool)

(assert (=> b!15246 (=> (not res!14207) (not e!9532))))

(declare-datatypes ((Unit!1260 0))(
  ( (Unit!1261) )
))
(declare-datatypes ((tuple2!1790 0))(
  ( (tuple2!1791 (_1!956 Unit!1260) (_2!956 BitStream!732)) )
))
(declare-fun lt!23106 () tuple2!1790)

(declare-fun isPrefixOf!0 (BitStream!732 BitStream!732) Bool)

(assert (=> b!15246 (= res!14207 (isPrefixOf!0 thiss!1073 (_2!956 lt!23106)))))

(declare-fun b!15247 () Bool)

(assert (=> b!15247 (= e!9534 (not true))))

(declare-datatypes ((tuple2!1792 0))(
  ( (tuple2!1793 (_1!957 BitStream!732) (_2!957 BitStream!732)) )
))
(declare-fun lt!23102 () tuple2!1792)

(declare-fun reader!0 (BitStream!732 BitStream!732) tuple2!1792)

(assert (=> b!15247 (= lt!23102 (reader!0 thiss!1073 (_2!956 lt!23106)))))

(declare-fun lt!23103 () Bool)

(assert (=> b!15247 (= lt!23103 (isPrefixOf!0 thiss!1073 (_2!956 lt!23106)))))

(declare-fun lt!23105 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15247 (= lt!23105 (bitIndex!0 (size!386 (buf!743 (_2!956 lt!23106))) (currentByte!1906 (_2!956 lt!23106)) (currentBit!1901 (_2!956 lt!23106))))))

(declare-fun lt!23100 () (_ BitVec 64))

(assert (=> b!15247 (= lt!23100 (bitIndex!0 (size!386 (buf!743 thiss!1073)) (currentByte!1906 thiss!1073) (currentBit!1901 thiss!1073)))))

(assert (=> b!15247 e!9532))

(declare-fun res!14203 () Bool)

(assert (=> b!15247 (=> (not res!14203) (not e!9532))))

(assert (=> b!15247 (= res!14203 (= (size!386 (buf!743 thiss!1073)) (size!386 (buf!743 (_2!956 lt!23106)))))))

(declare-fun appendNBits!0 (BitStream!732 (_ BitVec 64) Bool) tuple2!1790)

(assert (=> b!15247 (= lt!23106 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15248 () Bool)

(declare-datatypes ((tuple2!1794 0))(
  ( (tuple2!1795 (_1!958 BitStream!732) (_2!958 Bool)) )
))
(declare-fun lt!23107 () tuple2!1794)

(declare-fun lt!23104 () tuple2!1792)

(assert (=> b!15248 (= e!9532 (not (or (not (_2!958 lt!23107)) (not (= (_1!958 lt!23107) (_2!957 lt!23104))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!732 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1794)

(assert (=> b!15248 (= lt!23107 (checkBitsLoopPure!0 (_1!957 lt!23104) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15248 (validate_offset_bits!1 ((_ sign_extend 32) (size!386 (buf!743 (_2!956 lt!23106)))) ((_ sign_extend 32) (currentByte!1906 thiss!1073)) ((_ sign_extend 32) (currentBit!1901 thiss!1073)) nBits!313)))

(declare-fun lt!23101 () Unit!1260)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!732 array!911 (_ BitVec 64)) Unit!1260)

(assert (=> b!15248 (= lt!23101 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!743 (_2!956 lt!23106)) nBits!313))))

(assert (=> b!15248 (= lt!23104 (reader!0 thiss!1073 (_2!956 lt!23106)))))

(declare-fun res!14204 () Bool)

(assert (=> start!3504 (=> (not res!14204) (not e!9534))))

(assert (=> start!3504 (= res!14204 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3504 e!9534))

(assert (=> start!3504 true))

(declare-fun inv!12 (BitStream!732) Bool)

(assert (=> start!3504 (and (inv!12 thiss!1073) e!9533)))

(declare-fun b!15245 () Bool)

(declare-fun res!14205 () Bool)

(assert (=> b!15245 (=> (not res!14205) (not e!9532))))

(assert (=> b!15245 (= res!14205 (= (bitIndex!0 (size!386 (buf!743 (_2!956 lt!23106))) (currentByte!1906 (_2!956 lt!23106)) (currentBit!1901 (_2!956 lt!23106))) (bvadd (bitIndex!0 (size!386 (buf!743 thiss!1073)) (currentByte!1906 thiss!1073) (currentBit!1901 thiss!1073)) nBits!313)))))

(assert (= (and start!3504 res!14204) b!15243))

(assert (= (and b!15243 res!14206) b!15247))

(assert (= (and b!15247 res!14203) b!15245))

(assert (= (and b!15245 res!14205) b!15246))

(assert (= (and b!15246 res!14207) b!15248))

(assert (= start!3504 b!15244))

(declare-fun m!21841 () Bool)

(assert (=> b!15244 m!21841))

(declare-fun m!21843 () Bool)

(assert (=> b!15243 m!21843))

(declare-fun m!21845 () Bool)

(assert (=> b!15245 m!21845))

(declare-fun m!21847 () Bool)

(assert (=> b!15245 m!21847))

(declare-fun m!21849 () Bool)

(assert (=> b!15247 m!21849))

(declare-fun m!21851 () Bool)

(assert (=> b!15247 m!21851))

(declare-fun m!21853 () Bool)

(assert (=> b!15247 m!21853))

(assert (=> b!15247 m!21845))

(assert (=> b!15247 m!21847))

(assert (=> b!15246 m!21851))

(declare-fun m!21855 () Bool)

(assert (=> start!3504 m!21855))

(declare-fun m!21857 () Bool)

(assert (=> b!15248 m!21857))

(declare-fun m!21859 () Bool)

(assert (=> b!15248 m!21859))

(declare-fun m!21861 () Bool)

(assert (=> b!15248 m!21861))

(assert (=> b!15248 m!21849))

(check-sat (not b!15247) (not b!15248) (not b!15245) (not b!15243) (not b!15246) (not start!3504) (not b!15244))
