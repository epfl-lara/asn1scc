; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45640 () Bool)

(assert start!45640)

(declare-fun b!220607 () Bool)

(declare-fun e!149814 () Bool)

(declare-datatypes ((array!10759 0))(
  ( (array!10760 (arr!5653 (Array (_ BitVec 32) (_ BitVec 8))) (size!4723 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8554 0))(
  ( (BitStream!8555 (buf!5270 array!10759) (currentByte!9906 (_ BitVec 32)) (currentBit!9901 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8554)

(declare-fun array_inv!4464 (array!10759) Bool)

(assert (=> b!220607 (= e!149814 (array_inv!4464 (buf!5270 bs!62)))))

(declare-fun res!185842 () Bool)

(declare-fun e!149813 () Bool)

(assert (=> start!45640 (=> (not res!185842) (not e!149813))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45640 (= res!185842 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45640 e!149813))

(assert (=> start!45640 true))

(declare-fun inv!12 (BitStream!8554) Bool)

(assert (=> start!45640 (and (inv!12 bs!62) e!149814)))

(declare-fun b!220608 () Bool)

(declare-fun res!185840 () Bool)

(assert (=> b!220608 (=> (not res!185840) (not e!149813))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220608 (= res!185840 (validate_offset_bits!1 ((_ sign_extend 32) (size!4723 (buf!5270 bs!62))) ((_ sign_extend 32) (currentByte!9906 bs!62)) ((_ sign_extend 32) (currentBit!9901 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220609 () Bool)

(declare-fun res!185837 () Bool)

(declare-fun e!149815 () Bool)

(assert (=> b!220609 (=> (not res!185837) (not e!149815))))

(declare-fun lt!348540 () BitStream!8554)

(assert (=> b!220609 (= res!185837 (validate_offset_bits!1 ((_ sign_extend 32) (size!4723 (buf!5270 lt!348540))) ((_ sign_extend 32) (currentByte!9906 lt!348540)) ((_ sign_extend 32) (currentBit!9901 lt!348540)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun b!220610 () Bool)

(declare-fun res!185843 () Bool)

(assert (=> b!220610 (=> (not res!185843) (not e!149815))))

(declare-fun lt!348539 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220610 (= res!185843 (= (bvand lt!348539 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220611 () Bool)

(declare-fun e!149816 () Bool)

(assert (=> b!220611 (= e!149813 e!149816)))

(declare-fun res!185838 () Bool)

(assert (=> b!220611 (=> (not res!185838) (not e!149816))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun lt!348542 () (_ BitVec 64))

(assert (=> b!220611 (= res!185838 (= (bvand acc!113 lt!348542) acc!113))))

(assert (=> b!220611 (= lt!348542 #b1111111111111111111111111111111111111111111111111111111111111111)))

(declare-fun b!220612 () Bool)

(assert (=> b!220612 (= e!149816 e!149815)))

(declare-fun res!185839 () Bool)

(assert (=> b!220612 (=> (not res!185839) (not e!149815))))

(assert (=> b!220612 (= res!185839 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-datatypes ((tuple2!18896 0))(
  ( (tuple2!18897 (_1!10106 BitStream!8554) (_2!10106 Bool)) )
))
(declare-fun lt!348541 () tuple2!18896)

(assert (=> b!220612 (= lt!348539 (bvor acc!113 (ite (_2!10106 lt!348541) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun withMovedBitIndex!0 (BitStream!8554 (_ BitVec 64)) BitStream!8554)

(assert (=> b!220612 (= lt!348540 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!8554) tuple2!18896)

(assert (=> b!220612 (= lt!348541 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18898 0))(
  ( (tuple2!18899 (_1!10107 BitStream!8554) (_2!10107 (_ BitVec 64))) )
))
(declare-fun lt!348538 () tuple2!18898)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18898)

(assert (=> b!220612 (= lt!348538 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220613 () Bool)

(assert (=> b!220613 (= e!149815 (not (= (bvand lt!348539 lt!348542) lt!348539)))))

(declare-fun b!220614 () Bool)

(declare-fun res!185841 () Bool)

(assert (=> b!220614 (=> (not res!185841) (not e!149813))))

(assert (=> b!220614 (= res!185841 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!45640 res!185842) b!220608))

(assert (= (and b!220608 res!185840) b!220614))

(assert (= (and b!220614 res!185841) b!220611))

(assert (= (and b!220611 res!185838) b!220612))

(assert (= (and b!220612 res!185839) b!220609))

(assert (= (and b!220609 res!185837) b!220610))

(assert (= (and b!220610 res!185843) b!220613))

(assert (= start!45640 b!220607))

(declare-fun m!339319 () Bool)

(assert (=> b!220612 m!339319))

(declare-fun m!339321 () Bool)

(assert (=> b!220612 m!339321))

(declare-fun m!339323 () Bool)

(assert (=> b!220612 m!339323))

(declare-fun m!339325 () Bool)

(assert (=> b!220607 m!339325))

(declare-fun m!339327 () Bool)

(assert (=> b!220609 m!339327))

(declare-fun m!339329 () Bool)

(assert (=> b!220610 m!339329))

(declare-fun m!339331 () Bool)

(assert (=> b!220608 m!339331))

(declare-fun m!339333 () Bool)

(assert (=> b!220614 m!339333))

(declare-fun m!339335 () Bool)

(assert (=> start!45640 m!339335))

(push 1)

(assert (not start!45640))

(assert (not b!220609))

(assert (not b!220607))

(assert (not b!220614))

(assert (not b!220608))

(assert (not b!220612))

(assert (not b!220610))

(check-sat)

(pop 1)

