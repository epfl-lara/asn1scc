; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3494 () Bool)

(assert start!3494)

(declare-fun res!14129 () Bool)

(declare-fun e!9474 () Bool)

(assert (=> start!3494 (=> (not res!14129) (not e!9474))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3494 (= res!14129 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3494 e!9474))

(assert (=> start!3494 true))

(declare-datatypes ((array!901 0))(
  ( (array!902 (arr!810 (Array (_ BitVec 32) (_ BitVec 8))) (size!381 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!722 0))(
  ( (BitStream!723 (buf!738 array!901) (currentByte!1901 (_ BitVec 32)) (currentBit!1896 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!722)

(declare-fun e!9472 () Bool)

(declare-fun inv!12 (BitStream!722) Bool)

(assert (=> start!3494 (and (inv!12 thiss!1073) e!9472)))

(declare-fun b!15153 () Bool)

(declare-fun res!14130 () Bool)

(declare-fun e!9471 () Bool)

(assert (=> b!15153 (=> (not res!14130) (not e!9471))))

(declare-datatypes ((Unit!1250 0))(
  ( (Unit!1251) )
))
(declare-datatypes ((tuple2!1760 0))(
  ( (tuple2!1761 (_1!941 Unit!1250) (_2!941 BitStream!722)) )
))
(declare-fun lt!22980 () tuple2!1760)

(declare-fun isPrefixOf!0 (BitStream!722 BitStream!722) Bool)

(assert (=> b!15153 (= res!14130 (isPrefixOf!0 thiss!1073 (_2!941 lt!22980)))))

(declare-fun b!15154 () Bool)

(declare-fun res!14131 () Bool)

(assert (=> b!15154 (=> (not res!14131) (not e!9471))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15154 (= res!14131 (= (bitIndex!0 (size!381 (buf!738 (_2!941 lt!22980))) (currentByte!1901 (_2!941 lt!22980)) (currentBit!1896 (_2!941 lt!22980))) (bvadd (bitIndex!0 (size!381 (buf!738 thiss!1073)) (currentByte!1901 thiss!1073) (currentBit!1896 thiss!1073)) nBits!313)))))

(declare-fun b!15155 () Bool)

(declare-datatypes ((tuple2!1762 0))(
  ( (tuple2!1763 (_1!942 BitStream!722) (_2!942 Bool)) )
))
(declare-fun lt!22985 () tuple2!1762)

(declare-datatypes ((tuple2!1764 0))(
  ( (tuple2!1765 (_1!943 BitStream!722) (_2!943 BitStream!722)) )
))
(declare-fun lt!22982 () tuple2!1764)

(assert (=> b!15155 (= e!9471 (not (or (not (_2!942 lt!22985)) (not (= (_1!942 lt!22985) (_2!943 lt!22982))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!722 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1762)

(assert (=> b!15155 (= lt!22985 (checkBitsLoopPure!0 (_1!943 lt!22982) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15155 (validate_offset_bits!1 ((_ sign_extend 32) (size!381 (buf!738 (_2!941 lt!22980)))) ((_ sign_extend 32) (currentByte!1901 thiss!1073)) ((_ sign_extend 32) (currentBit!1896 thiss!1073)) nBits!313)))

(declare-fun lt!22987 () Unit!1250)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!722 array!901 (_ BitVec 64)) Unit!1250)

(assert (=> b!15155 (= lt!22987 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!738 (_2!941 lt!22980)) nBits!313))))

(declare-fun reader!0 (BitStream!722 BitStream!722) tuple2!1764)

(assert (=> b!15155 (= lt!22982 (reader!0 thiss!1073 (_2!941 lt!22980)))))

(declare-fun b!15156 () Bool)

(declare-fun array_inv!370 (array!901) Bool)

(assert (=> b!15156 (= e!9472 (array_inv!370 (buf!738 thiss!1073)))))

(declare-fun b!15157 () Bool)

(assert (=> b!15157 (= e!9474 (not true))))

(declare-fun lt!22983 () tuple2!1764)

(assert (=> b!15157 (= lt!22983 (reader!0 thiss!1073 (_2!941 lt!22980)))))

(declare-fun lt!22984 () Bool)

(assert (=> b!15157 (= lt!22984 (isPrefixOf!0 thiss!1073 (_2!941 lt!22980)))))

(declare-fun lt!22986 () (_ BitVec 64))

(assert (=> b!15157 (= lt!22986 (bitIndex!0 (size!381 (buf!738 (_2!941 lt!22980))) (currentByte!1901 (_2!941 lt!22980)) (currentBit!1896 (_2!941 lt!22980))))))

(declare-fun lt!22981 () (_ BitVec 64))

(assert (=> b!15157 (= lt!22981 (bitIndex!0 (size!381 (buf!738 thiss!1073)) (currentByte!1901 thiss!1073) (currentBit!1896 thiss!1073)))))

(assert (=> b!15157 e!9471))

(declare-fun res!14128 () Bool)

(assert (=> b!15157 (=> (not res!14128) (not e!9471))))

(assert (=> b!15157 (= res!14128 (= (size!381 (buf!738 thiss!1073)) (size!381 (buf!738 (_2!941 lt!22980)))))))

(declare-fun appendNBits!0 (BitStream!722 (_ BitVec 64) Bool) tuple2!1760)

(assert (=> b!15157 (= lt!22980 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15158 () Bool)

(declare-fun res!14132 () Bool)

(assert (=> b!15158 (=> (not res!14132) (not e!9474))))

(assert (=> b!15158 (= res!14132 (validate_offset_bits!1 ((_ sign_extend 32) (size!381 (buf!738 thiss!1073))) ((_ sign_extend 32) (currentByte!1901 thiss!1073)) ((_ sign_extend 32) (currentBit!1896 thiss!1073)) nBits!313))))

(assert (= (and start!3494 res!14129) b!15158))

(assert (= (and b!15158 res!14132) b!15157))

(assert (= (and b!15157 res!14128) b!15154))

(assert (= (and b!15154 res!14131) b!15153))

(assert (= (and b!15153 res!14130) b!15155))

(assert (= start!3494 b!15156))

(declare-fun m!21731 () Bool)

(assert (=> b!15157 m!21731))

(declare-fun m!21733 () Bool)

(assert (=> b!15157 m!21733))

(declare-fun m!21735 () Bool)

(assert (=> b!15157 m!21735))

(declare-fun m!21737 () Bool)

(assert (=> b!15157 m!21737))

(declare-fun m!21739 () Bool)

(assert (=> b!15157 m!21739))

(declare-fun m!21741 () Bool)

(assert (=> b!15158 m!21741))

(assert (=> b!15153 m!21739))

(declare-fun m!21743 () Bool)

(assert (=> b!15156 m!21743))

(declare-fun m!21745 () Bool)

(assert (=> b!15155 m!21745))

(declare-fun m!21747 () Bool)

(assert (=> b!15155 m!21747))

(declare-fun m!21749 () Bool)

(assert (=> b!15155 m!21749))

(assert (=> b!15155 m!21733))

(declare-fun m!21751 () Bool)

(assert (=> start!3494 m!21751))

(assert (=> b!15154 m!21735))

(assert (=> b!15154 m!21731))

(push 1)

(assert (not b!15157))

(assert (not b!15155))

(assert (not b!15154))

(assert (not b!15153))

(assert (not b!15158))

(assert (not b!15156))

(assert (not start!3494))

(check-sat)

(pop 1)

