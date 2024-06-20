; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3510 () Bool)

(assert start!3510)

(declare-fun b!15297 () Bool)

(declare-fun res!14251 () Bool)

(declare-fun e!9569 () Bool)

(assert (=> b!15297 (=> (not res!14251) (not e!9569))))

(declare-datatypes ((array!917 0))(
  ( (array!918 (arr!818 (Array (_ BitVec 32) (_ BitVec 8))) (size!389 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!738 0))(
  ( (BitStream!739 (buf!746 array!917) (currentByte!1909 (_ BitVec 32)) (currentBit!1904 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!738)

(declare-datatypes ((Unit!1266 0))(
  ( (Unit!1267) )
))
(declare-datatypes ((tuple2!1808 0))(
  ( (tuple2!1809 (_1!965 Unit!1266) (_2!965 BitStream!738)) )
))
(declare-fun lt!23181 () tuple2!1808)

(declare-fun isPrefixOf!0 (BitStream!738 BitStream!738) Bool)

(assert (=> b!15297 (= res!14251 (isPrefixOf!0 thiss!1073 (_2!965 lt!23181)))))

(declare-fun res!14249 () Bool)

(declare-fun e!9567 () Bool)

(assert (=> start!3510 (=> (not res!14249) (not e!9567))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3510 (= res!14249 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3510 e!9567))

(assert (=> start!3510 true))

(declare-fun e!9570 () Bool)

(declare-fun inv!12 (BitStream!738) Bool)

(assert (=> start!3510 (and (inv!12 thiss!1073) e!9570)))

(declare-fun b!15298 () Bool)

(declare-fun res!14252 () Bool)

(assert (=> b!15298 (=> (not res!14252) (not e!9567))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15298 (= res!14252 (validate_offset_bits!1 ((_ sign_extend 32) (size!389 (buf!746 thiss!1073))) ((_ sign_extend 32) (currentByte!1909 thiss!1073)) ((_ sign_extend 32) (currentBit!1904 thiss!1073)) nBits!313))))

(declare-fun b!15299 () Bool)

(assert (=> b!15299 (= e!9567 (not true))))

(assert (=> b!15299 (validate_offset_bits!1 ((_ sign_extend 32) (size!389 (buf!746 (_2!965 lt!23181)))) ((_ sign_extend 32) (currentByte!1909 thiss!1073)) ((_ sign_extend 32) (currentBit!1904 thiss!1073)) nBits!313)))

(declare-fun lt!23182 () Unit!1266)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!738 array!917 (_ BitVec 64)) Unit!1266)

(assert (=> b!15299 (= lt!23182 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!746 (_2!965 lt!23181)) nBits!313))))

(declare-datatypes ((tuple2!1810 0))(
  ( (tuple2!1811 (_1!966 BitStream!738) (_2!966 BitStream!738)) )
))
(declare-fun lt!23184 () tuple2!1810)

(declare-fun reader!0 (BitStream!738 BitStream!738) tuple2!1810)

(assert (=> b!15299 (= lt!23184 (reader!0 thiss!1073 (_2!965 lt!23181)))))

(declare-fun lt!23179 () Bool)

(assert (=> b!15299 (= lt!23179 (isPrefixOf!0 thiss!1073 (_2!965 lt!23181)))))

(declare-fun lt!23185 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15299 (= lt!23185 (bitIndex!0 (size!389 (buf!746 (_2!965 lt!23181))) (currentByte!1909 (_2!965 lt!23181)) (currentBit!1904 (_2!965 lt!23181))))))

(declare-fun lt!23177 () (_ BitVec 64))

(assert (=> b!15299 (= lt!23177 (bitIndex!0 (size!389 (buf!746 thiss!1073)) (currentByte!1909 thiss!1073) (currentBit!1904 thiss!1073)))))

(assert (=> b!15299 e!9569))

(declare-fun res!14250 () Bool)

(assert (=> b!15299 (=> (not res!14250) (not e!9569))))

(assert (=> b!15299 (= res!14250 (= (size!389 (buf!746 thiss!1073)) (size!389 (buf!746 (_2!965 lt!23181)))))))

(declare-fun appendNBits!0 (BitStream!738 (_ BitVec 64) Bool) tuple2!1808)

(assert (=> b!15299 (= lt!23181 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15300 () Bool)

(declare-fun res!14248 () Bool)

(assert (=> b!15300 (=> (not res!14248) (not e!9569))))

(assert (=> b!15300 (= res!14248 (= (bitIndex!0 (size!389 (buf!746 (_2!965 lt!23181))) (currentByte!1909 (_2!965 lt!23181)) (currentBit!1904 (_2!965 lt!23181))) (bvadd (bitIndex!0 (size!389 (buf!746 thiss!1073)) (currentByte!1909 thiss!1073) (currentBit!1904 thiss!1073)) nBits!313)))))

(declare-fun b!15301 () Bool)

(declare-datatypes ((tuple2!1812 0))(
  ( (tuple2!1813 (_1!967 BitStream!738) (_2!967 Bool)) )
))
(declare-fun lt!23178 () tuple2!1812)

(declare-fun lt!23180 () tuple2!1810)

(assert (=> b!15301 (= e!9569 (not (or (not (_2!967 lt!23178)) (not (= (_1!967 lt!23178) (_2!966 lt!23180))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!738 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1812)

(assert (=> b!15301 (= lt!23178 (checkBitsLoopPure!0 (_1!966 lt!23180) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15301 (validate_offset_bits!1 ((_ sign_extend 32) (size!389 (buf!746 (_2!965 lt!23181)))) ((_ sign_extend 32) (currentByte!1909 thiss!1073)) ((_ sign_extend 32) (currentBit!1904 thiss!1073)) nBits!313)))

(declare-fun lt!23183 () Unit!1266)

(assert (=> b!15301 (= lt!23183 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!746 (_2!965 lt!23181)) nBits!313))))

(assert (=> b!15301 (= lt!23180 (reader!0 thiss!1073 (_2!965 lt!23181)))))

(declare-fun b!15302 () Bool)

(declare-fun array_inv!378 (array!917) Bool)

(assert (=> b!15302 (= e!9570 (array_inv!378 (buf!746 thiss!1073)))))

(assert (= (and start!3510 res!14249) b!15298))

(assert (= (and b!15298 res!14252) b!15299))

(assert (= (and b!15299 res!14250) b!15300))

(assert (= (and b!15300 res!14248) b!15297))

(assert (= (and b!15297 res!14251) b!15301))

(assert (= start!3510 b!15302))

(declare-fun m!21907 () Bool)

(assert (=> b!15300 m!21907))

(declare-fun m!21909 () Bool)

(assert (=> b!15300 m!21909))

(declare-fun m!21911 () Bool)

(assert (=> b!15297 m!21911))

(declare-fun m!21913 () Bool)

(assert (=> b!15301 m!21913))

(declare-fun m!21915 () Bool)

(assert (=> b!15301 m!21915))

(declare-fun m!21917 () Bool)

(assert (=> b!15301 m!21917))

(declare-fun m!21919 () Bool)

(assert (=> b!15301 m!21919))

(assert (=> b!15299 m!21919))

(assert (=> b!15299 m!21911))

(assert (=> b!15299 m!21909))

(assert (=> b!15299 m!21915))

(assert (=> b!15299 m!21907))

(assert (=> b!15299 m!21917))

(declare-fun m!21921 () Bool)

(assert (=> b!15299 m!21921))

(declare-fun m!21923 () Bool)

(assert (=> start!3510 m!21923))

(declare-fun m!21925 () Bool)

(assert (=> b!15298 m!21925))

(declare-fun m!21927 () Bool)

(assert (=> b!15302 m!21927))

(check-sat (not b!15298) (not b!15297) (not b!15301) (not b!15302) (not b!15300) (not b!15299) (not start!3510))
