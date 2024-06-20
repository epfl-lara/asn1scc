; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3490 () Bool)

(assert start!3490)

(declare-fun b!15117 () Bool)

(declare-fun res!14099 () Bool)

(declare-fun e!9449 () Bool)

(assert (=> b!15117 (=> (not res!14099) (not e!9449))))

(declare-datatypes ((array!897 0))(
  ( (array!898 (arr!808 (Array (_ BitVec 32) (_ BitVec 8))) (size!379 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!718 0))(
  ( (BitStream!719 (buf!736 array!897) (currentByte!1899 (_ BitVec 32)) (currentBit!1894 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1246 0))(
  ( (Unit!1247) )
))
(declare-datatypes ((tuple2!1748 0))(
  ( (tuple2!1749 (_1!935 Unit!1246) (_2!935 BitStream!718)) )
))
(declare-fun lt!22937 () tuple2!1748)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun thiss!1073 () BitStream!718)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15117 (= res!14099 (= (bitIndex!0 (size!379 (buf!736 (_2!935 lt!22937))) (currentByte!1899 (_2!935 lt!22937)) (currentBit!1894 (_2!935 lt!22937))) (bvadd (bitIndex!0 (size!379 (buf!736 thiss!1073)) (currentByte!1899 thiss!1073) (currentBit!1894 thiss!1073)) nBits!313)))))

(declare-fun b!15118 () Bool)

(declare-fun e!9447 () Bool)

(declare-fun array_inv!368 (array!897) Bool)

(assert (=> b!15118 (= e!9447 (array_inv!368 (buf!736 thiss!1073)))))

(declare-fun b!15119 () Bool)

(declare-fun res!14098 () Bool)

(declare-fun e!9448 () Bool)

(assert (=> b!15119 (=> (not res!14098) (not e!9448))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15119 (= res!14098 (validate_offset_bits!1 ((_ sign_extend 32) (size!379 (buf!736 thiss!1073))) ((_ sign_extend 32) (currentByte!1899 thiss!1073)) ((_ sign_extend 32) (currentBit!1894 thiss!1073)) nBits!313))))

(declare-fun res!14102 () Bool)

(assert (=> start!3490 (=> (not res!14102) (not e!9448))))

(assert (=> start!3490 (= res!14102 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3490 e!9448))

(assert (=> start!3490 true))

(declare-fun inv!12 (BitStream!718) Bool)

(assert (=> start!3490 (and (inv!12 thiss!1073) e!9447)))

(declare-fun b!15120 () Bool)

(declare-datatypes ((tuple2!1750 0))(
  ( (tuple2!1751 (_1!936 BitStream!718) (_2!936 Bool)) )
))
(declare-fun lt!22939 () tuple2!1750)

(declare-datatypes ((tuple2!1752 0))(
  ( (tuple2!1753 (_1!937 BitStream!718) (_2!937 BitStream!718)) )
))
(declare-fun lt!22934 () tuple2!1752)

(assert (=> b!15120 (= e!9449 (not (or (not (_2!936 lt!22939)) (not (= (_1!936 lt!22939) (_2!937 lt!22934))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!718 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1750)

(assert (=> b!15120 (= lt!22939 (checkBitsLoopPure!0 (_1!937 lt!22934) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15120 (validate_offset_bits!1 ((_ sign_extend 32) (size!379 (buf!736 (_2!935 lt!22937)))) ((_ sign_extend 32) (currentByte!1899 thiss!1073)) ((_ sign_extend 32) (currentBit!1894 thiss!1073)) nBits!313)))

(declare-fun lt!22932 () Unit!1246)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!718 array!897 (_ BitVec 64)) Unit!1246)

(assert (=> b!15120 (= lt!22932 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!736 (_2!935 lt!22937)) nBits!313))))

(declare-fun reader!0 (BitStream!718 BitStream!718) tuple2!1752)

(assert (=> b!15120 (= lt!22934 (reader!0 thiss!1073 (_2!935 lt!22937)))))

(declare-fun b!15121 () Bool)

(assert (=> b!15121 (= e!9448 (not true))))

(declare-fun lt!22936 () tuple2!1752)

(assert (=> b!15121 (= lt!22936 (reader!0 thiss!1073 (_2!935 lt!22937)))))

(declare-fun lt!22935 () Bool)

(declare-fun isPrefixOf!0 (BitStream!718 BitStream!718) Bool)

(assert (=> b!15121 (= lt!22935 (isPrefixOf!0 thiss!1073 (_2!935 lt!22937)))))

(declare-fun lt!22933 () (_ BitVec 64))

(assert (=> b!15121 (= lt!22933 (bitIndex!0 (size!379 (buf!736 (_2!935 lt!22937))) (currentByte!1899 (_2!935 lt!22937)) (currentBit!1894 (_2!935 lt!22937))))))

(declare-fun lt!22938 () (_ BitVec 64))

(assert (=> b!15121 (= lt!22938 (bitIndex!0 (size!379 (buf!736 thiss!1073)) (currentByte!1899 thiss!1073) (currentBit!1894 thiss!1073)))))

(assert (=> b!15121 e!9449))

(declare-fun res!14101 () Bool)

(assert (=> b!15121 (=> (not res!14101) (not e!9449))))

(assert (=> b!15121 (= res!14101 (= (size!379 (buf!736 thiss!1073)) (size!379 (buf!736 (_2!935 lt!22937)))))))

(declare-fun appendNBits!0 (BitStream!718 (_ BitVec 64) Bool) tuple2!1748)

(assert (=> b!15121 (= lt!22937 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15122 () Bool)

(declare-fun res!14100 () Bool)

(assert (=> b!15122 (=> (not res!14100) (not e!9449))))

(assert (=> b!15122 (= res!14100 (isPrefixOf!0 thiss!1073 (_2!935 lt!22937)))))

(assert (= (and start!3490 res!14102) b!15119))

(assert (= (and b!15119 res!14098) b!15121))

(assert (= (and b!15121 res!14101) b!15117))

(assert (= (and b!15117 res!14099) b!15122))

(assert (= (and b!15122 res!14100) b!15120))

(assert (= start!3490 b!15118))

(declare-fun m!21687 () Bool)

(assert (=> b!15120 m!21687))

(declare-fun m!21689 () Bool)

(assert (=> b!15120 m!21689))

(declare-fun m!21691 () Bool)

(assert (=> b!15120 m!21691))

(declare-fun m!21693 () Bool)

(assert (=> b!15120 m!21693))

(declare-fun m!21695 () Bool)

(assert (=> b!15122 m!21695))

(assert (=> b!15121 m!21693))

(declare-fun m!21697 () Bool)

(assert (=> b!15121 m!21697))

(assert (=> b!15121 m!21695))

(declare-fun m!21699 () Bool)

(assert (=> b!15121 m!21699))

(declare-fun m!21701 () Bool)

(assert (=> b!15121 m!21701))

(declare-fun m!21703 () Bool)

(assert (=> start!3490 m!21703))

(assert (=> b!15117 m!21699))

(assert (=> b!15117 m!21697))

(declare-fun m!21705 () Bool)

(assert (=> b!15119 m!21705))

(declare-fun m!21707 () Bool)

(assert (=> b!15118 m!21707))

(push 1)

(assert (not b!15117))

(assert (not b!15121))

(assert (not b!15118))

(assert (not start!3490))

(assert (not b!15122))

(assert (not b!15120))

(assert (not b!15119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

