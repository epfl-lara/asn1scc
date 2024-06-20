; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3500 () Bool)

(assert start!3500)

(declare-fun b!15207 () Bool)

(declare-fun res!14176 () Bool)

(declare-fun e!9507 () Bool)

(assert (=> b!15207 (=> (not res!14176) (not e!9507))))

(declare-datatypes ((array!907 0))(
  ( (array!908 (arr!813 (Array (_ BitVec 32) (_ BitVec 8))) (size!384 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!728 0))(
  ( (BitStream!729 (buf!741 array!907) (currentByte!1904 (_ BitVec 32)) (currentBit!1899 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!728)

(declare-datatypes ((Unit!1256 0))(
  ( (Unit!1257) )
))
(declare-datatypes ((tuple2!1778 0))(
  ( (tuple2!1779 (_1!950 Unit!1256) (_2!950 BitStream!728)) )
))
(declare-fun lt!23056 () tuple2!1778)

(declare-fun isPrefixOf!0 (BitStream!728 BitStream!728) Bool)

(assert (=> b!15207 (= res!14176 (isPrefixOf!0 thiss!1073 (_2!950 lt!23056)))))

(declare-fun b!15208 () Bool)

(declare-fun e!9509 () Bool)

(declare-fun array_inv!373 (array!907) Bool)

(assert (=> b!15208 (= e!9509 (array_inv!373 (buf!741 thiss!1073)))))

(declare-fun b!15209 () Bool)

(declare-datatypes ((tuple2!1780 0))(
  ( (tuple2!1781 (_1!951 BitStream!728) (_2!951 Bool)) )
))
(declare-fun lt!23058 () tuple2!1780)

(declare-datatypes ((tuple2!1782 0))(
  ( (tuple2!1783 (_1!952 BitStream!728) (_2!952 BitStream!728)) )
))
(declare-fun lt!23059 () tuple2!1782)

(assert (=> b!15209 (= e!9507 (not (or (not (_2!951 lt!23058)) (not (= (_1!951 lt!23058) (_2!952 lt!23059))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!728 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1780)

(assert (=> b!15209 (= lt!23058 (checkBitsLoopPure!0 (_1!952 lt!23059) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15209 (validate_offset_bits!1 ((_ sign_extend 32) (size!384 (buf!741 (_2!950 lt!23056)))) ((_ sign_extend 32) (currentByte!1904 thiss!1073)) ((_ sign_extend 32) (currentBit!1899 thiss!1073)) nBits!313)))

(declare-fun lt!23053 () Unit!1256)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!728 array!907 (_ BitVec 64)) Unit!1256)

(assert (=> b!15209 (= lt!23053 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!741 (_2!950 lt!23056)) nBits!313))))

(declare-fun reader!0 (BitStream!728 BitStream!728) tuple2!1782)

(assert (=> b!15209 (= lt!23059 (reader!0 thiss!1073 (_2!950 lt!23056)))))

(declare-fun b!15211 () Bool)

(declare-fun res!14173 () Bool)

(assert (=> b!15211 (=> (not res!14173) (not e!9507))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15211 (= res!14173 (= (bitIndex!0 (size!384 (buf!741 (_2!950 lt!23056))) (currentByte!1904 (_2!950 lt!23056)) (currentBit!1899 (_2!950 lt!23056))) (bvadd (bitIndex!0 (size!384 (buf!741 thiss!1073)) (currentByte!1904 thiss!1073) (currentBit!1899 thiss!1073)) nBits!313)))))

(declare-fun b!15212 () Bool)

(declare-fun res!14177 () Bool)

(declare-fun e!9510 () Bool)

(assert (=> b!15212 (=> (not res!14177) (not e!9510))))

(assert (=> b!15212 (= res!14177 (validate_offset_bits!1 ((_ sign_extend 32) (size!384 (buf!741 thiss!1073))) ((_ sign_extend 32) (currentByte!1904 thiss!1073)) ((_ sign_extend 32) (currentBit!1899 thiss!1073)) nBits!313))))

(declare-fun b!15210 () Bool)

(assert (=> b!15210 (= e!9510 (not true))))

(declare-fun lt!23054 () tuple2!1782)

(assert (=> b!15210 (= lt!23054 (reader!0 thiss!1073 (_2!950 lt!23056)))))

(declare-fun lt!23057 () Bool)

(assert (=> b!15210 (= lt!23057 (isPrefixOf!0 thiss!1073 (_2!950 lt!23056)))))

(declare-fun lt!23055 () (_ BitVec 64))

(assert (=> b!15210 (= lt!23055 (bitIndex!0 (size!384 (buf!741 (_2!950 lt!23056))) (currentByte!1904 (_2!950 lt!23056)) (currentBit!1899 (_2!950 lt!23056))))))

(declare-fun lt!23052 () (_ BitVec 64))

(assert (=> b!15210 (= lt!23052 (bitIndex!0 (size!384 (buf!741 thiss!1073)) (currentByte!1904 thiss!1073) (currentBit!1899 thiss!1073)))))

(assert (=> b!15210 e!9507))

(declare-fun res!14174 () Bool)

(assert (=> b!15210 (=> (not res!14174) (not e!9507))))

(assert (=> b!15210 (= res!14174 (= (size!384 (buf!741 thiss!1073)) (size!384 (buf!741 (_2!950 lt!23056)))))))

(declare-fun appendNBits!0 (BitStream!728 (_ BitVec 64) Bool) tuple2!1778)

(assert (=> b!15210 (= lt!23056 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun res!14175 () Bool)

(assert (=> start!3500 (=> (not res!14175) (not e!9510))))

(assert (=> start!3500 (= res!14175 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3500 e!9510))

(assert (=> start!3500 true))

(declare-fun inv!12 (BitStream!728) Bool)

(assert (=> start!3500 (and (inv!12 thiss!1073) e!9509)))

(assert (= (and start!3500 res!14175) b!15212))

(assert (= (and b!15212 res!14177) b!15210))

(assert (= (and b!15210 res!14174) b!15211))

(assert (= (and b!15211 res!14173) b!15207))

(assert (= (and b!15207 res!14176) b!15209))

(assert (= start!3500 b!15208))

(declare-fun m!21797 () Bool)

(assert (=> b!15208 m!21797))

(declare-fun m!21799 () Bool)

(assert (=> b!15210 m!21799))

(declare-fun m!21801 () Bool)

(assert (=> b!15210 m!21801))

(declare-fun m!21803 () Bool)

(assert (=> b!15210 m!21803))

(declare-fun m!21805 () Bool)

(assert (=> b!15210 m!21805))

(declare-fun m!21807 () Bool)

(assert (=> b!15210 m!21807))

(declare-fun m!21809 () Bool)

(assert (=> b!15209 m!21809))

(declare-fun m!21811 () Bool)

(assert (=> b!15209 m!21811))

(declare-fun m!21813 () Bool)

(assert (=> b!15209 m!21813))

(assert (=> b!15209 m!21799))

(declare-fun m!21815 () Bool)

(assert (=> start!3500 m!21815))

(declare-fun m!21817 () Bool)

(assert (=> b!15212 m!21817))

(assert (=> b!15211 m!21801))

(assert (=> b!15211 m!21805))

(assert (=> b!15207 m!21807))

(push 1)

(assert (not b!15207))

(assert (not b!15211))

(assert (not b!15212))

(assert (not b!15210))

(assert (not b!15208))

(assert (not b!15209))

(assert (not start!3500))

(check-sat)

