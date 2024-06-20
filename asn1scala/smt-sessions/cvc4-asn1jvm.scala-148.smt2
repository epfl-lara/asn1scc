; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3506 () Bool)

(assert start!3506)

(declare-fun res!14220 () Bool)

(declare-fun e!9546 () Bool)

(assert (=> start!3506 (=> (not res!14220) (not e!9546))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3506 (= res!14220 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3506 e!9546))

(assert (=> start!3506 true))

(declare-datatypes ((array!913 0))(
  ( (array!914 (arr!816 (Array (_ BitVec 32) (_ BitVec 8))) (size!387 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!734 0))(
  ( (BitStream!735 (buf!744 array!913) (currentByte!1907 (_ BitVec 32)) (currentBit!1902 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!734)

(declare-fun e!9543 () Bool)

(declare-fun inv!12 (BitStream!734) Bool)

(assert (=> start!3506 (and (inv!12 thiss!1073) e!9543)))

(declare-fun b!15261 () Bool)

(declare-fun res!14218 () Bool)

(assert (=> b!15261 (=> (not res!14218) (not e!9546))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15261 (= res!14218 (validate_offset_bits!1 ((_ sign_extend 32) (size!387 (buf!744 thiss!1073))) ((_ sign_extend 32) (currentByte!1907 thiss!1073)) ((_ sign_extend 32) (currentBit!1902 thiss!1073)) nBits!313))))

(declare-fun b!15262 () Bool)

(declare-fun res!14222 () Bool)

(declare-fun e!9545 () Bool)

(assert (=> b!15262 (=> (not res!14222) (not e!9545))))

(declare-datatypes ((Unit!1262 0))(
  ( (Unit!1263) )
))
(declare-datatypes ((tuple2!1796 0))(
  ( (tuple2!1797 (_1!959 Unit!1262) (_2!959 BitStream!734)) )
))
(declare-fun lt!23128 () tuple2!1796)

(declare-fun isPrefixOf!0 (BitStream!734 BitStream!734) Bool)

(assert (=> b!15262 (= res!14222 (isPrefixOf!0 thiss!1073 (_2!959 lt!23128)))))

(declare-fun b!15263 () Bool)

(declare-datatypes ((tuple2!1798 0))(
  ( (tuple2!1799 (_1!960 BitStream!734) (_2!960 Bool)) )
))
(declare-fun lt!23126 () tuple2!1798)

(declare-datatypes ((tuple2!1800 0))(
  ( (tuple2!1801 (_1!961 BitStream!734) (_2!961 BitStream!734)) )
))
(declare-fun lt!23127 () tuple2!1800)

(assert (=> b!15263 (= e!9545 (not (or (not (_2!960 lt!23126)) (not (= (_1!960 lt!23126) (_2!961 lt!23127))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!734 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1798)

(assert (=> b!15263 (= lt!23126 (checkBitsLoopPure!0 (_1!961 lt!23127) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15263 (validate_offset_bits!1 ((_ sign_extend 32) (size!387 (buf!744 (_2!959 lt!23128)))) ((_ sign_extend 32) (currentByte!1907 thiss!1073)) ((_ sign_extend 32) (currentBit!1902 thiss!1073)) nBits!313)))

(declare-fun lt!23129 () Unit!1262)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!734 array!913 (_ BitVec 64)) Unit!1262)

(assert (=> b!15263 (= lt!23129 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!744 (_2!959 lt!23128)) nBits!313))))

(declare-fun reader!0 (BitStream!734 BitStream!734) tuple2!1800)

(assert (=> b!15263 (= lt!23127 (reader!0 thiss!1073 (_2!959 lt!23128)))))

(declare-fun b!15264 () Bool)

(declare-fun res!14219 () Bool)

(assert (=> b!15264 (=> (not res!14219) (not e!9545))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15264 (= res!14219 (= (bitIndex!0 (size!387 (buf!744 (_2!959 lt!23128))) (currentByte!1907 (_2!959 lt!23128)) (currentBit!1902 (_2!959 lt!23128))) (bvadd (bitIndex!0 (size!387 (buf!744 thiss!1073)) (currentByte!1907 thiss!1073) (currentBit!1902 thiss!1073)) nBits!313)))))

(declare-fun b!15265 () Bool)

(declare-fun array_inv!376 (array!913) Bool)

(assert (=> b!15265 (= e!9543 (array_inv!376 (buf!744 thiss!1073)))))

(declare-fun b!15266 () Bool)

(assert (=> b!15266 (= e!9546 (not true))))

(declare-fun lt!23130 () tuple2!1800)

(assert (=> b!15266 (= lt!23130 (reader!0 thiss!1073 (_2!959 lt!23128)))))

(declare-fun lt!23131 () Bool)

(assert (=> b!15266 (= lt!23131 (isPrefixOf!0 thiss!1073 (_2!959 lt!23128)))))

(declare-fun lt!23125 () (_ BitVec 64))

(assert (=> b!15266 (= lt!23125 (bitIndex!0 (size!387 (buf!744 (_2!959 lt!23128))) (currentByte!1907 (_2!959 lt!23128)) (currentBit!1902 (_2!959 lt!23128))))))

(declare-fun lt!23124 () (_ BitVec 64))

(assert (=> b!15266 (= lt!23124 (bitIndex!0 (size!387 (buf!744 thiss!1073)) (currentByte!1907 thiss!1073) (currentBit!1902 thiss!1073)))))

(assert (=> b!15266 e!9545))

(declare-fun res!14221 () Bool)

(assert (=> b!15266 (=> (not res!14221) (not e!9545))))

(assert (=> b!15266 (= res!14221 (= (size!387 (buf!744 thiss!1073)) (size!387 (buf!744 (_2!959 lt!23128)))))))

(declare-fun appendNBits!0 (BitStream!734 (_ BitVec 64) Bool) tuple2!1796)

(assert (=> b!15266 (= lt!23128 (appendNBits!0 thiss!1073 nBits!313 true))))

(assert (= (and start!3506 res!14220) b!15261))

(assert (= (and b!15261 res!14218) b!15266))

(assert (= (and b!15266 res!14221) b!15264))

(assert (= (and b!15264 res!14219) b!15262))

(assert (= (and b!15262 res!14222) b!15263))

(assert (= start!3506 b!15265))

(declare-fun m!21863 () Bool)

(assert (=> b!15264 m!21863))

(declare-fun m!21865 () Bool)

(assert (=> b!15264 m!21865))

(declare-fun m!21867 () Bool)

(assert (=> b!15263 m!21867))

(declare-fun m!21869 () Bool)

(assert (=> b!15263 m!21869))

(declare-fun m!21871 () Bool)

(assert (=> b!15263 m!21871))

(declare-fun m!21873 () Bool)

(assert (=> b!15263 m!21873))

(declare-fun m!21875 () Bool)

(assert (=> start!3506 m!21875))

(assert (=> b!15266 m!21865))

(declare-fun m!21877 () Bool)

(assert (=> b!15266 m!21877))

(assert (=> b!15266 m!21873))

(assert (=> b!15266 m!21863))

(declare-fun m!21879 () Bool)

(assert (=> b!15266 m!21879))

(declare-fun m!21881 () Bool)

(assert (=> b!15261 m!21881))

(assert (=> b!15262 m!21877))

(declare-fun m!21883 () Bool)

(assert (=> b!15265 m!21883))

(push 1)

(assert (not b!15262))

(assert (not start!3506))

(assert (not b!15265))

(assert (not b!15266))

(assert (not b!15264))

(assert (not b!15263))

(assert (not b!15261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

