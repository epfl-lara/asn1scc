; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18040 () Bool)

(assert start!18040)

(declare-fun b!88645 () Bool)

(declare-fun res!72989 () Bool)

(declare-fun e!58645 () Bool)

(assert (=> b!88645 (=> (not res!72989) (not e!58645))))

(declare-datatypes ((array!4179 0))(
  ( (array!4180 (arr!2523 (Array (_ BitVec 32) (_ BitVec 8))) (size!1886 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3334 0))(
  ( (BitStream!3335 (buf!2276 array!4179) (currentByte!4518 (_ BitVec 32)) (currentBit!4513 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3334)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88645 (= res!72989 (invariant!0 (currentBit!4513 thiss!1152) (currentByte!4518 thiss!1152) (size!1886 (buf!2276 thiss!1152))))))

(declare-fun b!88646 () Bool)

(declare-fun e!58643 () Bool)

(declare-fun array_inv!1732 (array!4179) Bool)

(assert (=> b!88646 (= e!58643 (array_inv!1732 (buf!2276 thiss!1152)))))

(declare-fun b!88647 () Bool)

(declare-fun res!72985 () Bool)

(assert (=> b!88647 (=> (not res!72985) (not e!58645))))

(declare-fun thiss!1151 () BitStream!3334)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88647 (= res!72985 (and (bvsle i!576 nBits!336) (= (size!1886 (buf!2276 thiss!1152)) (size!1886 (buf!2276 thiss!1151)))))))

(declare-fun res!72991 () Bool)

(assert (=> start!18040 (=> (not res!72991) (not e!58645))))

(assert (=> start!18040 (= res!72991 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18040 e!58645))

(assert (=> start!18040 true))

(declare-fun e!58644 () Bool)

(declare-fun inv!12 (BitStream!3334) Bool)

(assert (=> start!18040 (and (inv!12 thiss!1151) e!58644)))

(assert (=> start!18040 (and (inv!12 thiss!1152) e!58643)))

(declare-fun b!88648 () Bool)

(assert (=> b!88648 (= e!58645 (and (bvslt i!576 nBits!336) (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand i!576 #b10000000000000000000000000000000))) (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 i!576) #b10000000000000000000000000000000)))))))

(declare-fun b!88649 () Bool)

(declare-fun res!72986 () Bool)

(assert (=> b!88649 (=> (not res!72986) (not e!58645))))

(assert (=> b!88649 (= res!72986 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88650 () Bool)

(declare-fun res!72984 () Bool)

(assert (=> b!88650 (=> (not res!72984) (not e!58645))))

(assert (=> b!88650 (= res!72984 (invariant!0 (currentBit!4513 thiss!1151) (currentByte!4518 thiss!1151) (size!1886 (buf!2276 thiss!1151))))))

(declare-fun b!88651 () Bool)

(declare-fun res!72987 () Bool)

(assert (=> b!88651 (=> (not res!72987) (not e!58645))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88651 (= res!72987 (validate_offset_bits!1 ((_ sign_extend 32) (size!1886 (buf!2276 thiss!1151))) ((_ sign_extend 32) (currentByte!4518 thiss!1151)) ((_ sign_extend 32) (currentBit!4513 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88652 () Bool)

(declare-fun res!72990 () Bool)

(assert (=> b!88652 (=> (not res!72990) (not e!58645))))

(assert (=> b!88652 (= res!72990 (validate_offset_bits!1 ((_ sign_extend 32) (size!1886 (buf!2276 thiss!1152))) ((_ sign_extend 32) (currentByte!4518 thiss!1152)) ((_ sign_extend 32) (currentBit!4513 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88653 () Bool)

(assert (=> b!88653 (= e!58644 (array_inv!1732 (buf!2276 thiss!1151)))))

(declare-fun b!88654 () Bool)

(declare-fun res!72988 () Bool)

(assert (=> b!88654 (=> (not res!72988) (not e!58645))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88654 (= res!72988 (= (bitIndex!0 (size!1886 (buf!2276 thiss!1152)) (currentByte!4518 thiss!1152) (currentBit!4513 thiss!1152)) (bvadd (bitIndex!0 (size!1886 (buf!2276 thiss!1151)) (currentByte!4518 thiss!1151) (currentBit!4513 thiss!1151)) ((_ sign_extend 32) i!576))))))

(assert (= (and start!18040 res!72991) b!88651))

(assert (= (and b!88651 res!72987) b!88650))

(assert (= (and b!88650 res!72984) b!88649))

(assert (= (and b!88649 res!72986) b!88645))

(assert (= (and b!88645 res!72989) b!88647))

(assert (= (and b!88647 res!72985) b!88654))

(assert (= (and b!88654 res!72988) b!88652))

(assert (= (and b!88652 res!72990) b!88648))

(assert (= start!18040 b!88653))

(assert (= start!18040 b!88646))

(declare-fun m!133745 () Bool)

(assert (=> b!88646 m!133745))

(declare-fun m!133747 () Bool)

(assert (=> start!18040 m!133747))

(declare-fun m!133749 () Bool)

(assert (=> start!18040 m!133749))

(declare-fun m!133751 () Bool)

(assert (=> b!88654 m!133751))

(declare-fun m!133753 () Bool)

(assert (=> b!88654 m!133753))

(declare-fun m!133755 () Bool)

(assert (=> b!88651 m!133755))

(declare-fun m!133757 () Bool)

(assert (=> b!88653 m!133757))

(declare-fun m!133759 () Bool)

(assert (=> b!88652 m!133759))

(declare-fun m!133761 () Bool)

(assert (=> b!88650 m!133761))

(declare-fun m!133763 () Bool)

(assert (=> b!88645 m!133763))

(push 1)

(assert (not b!88650))

(assert (not b!88653))

(assert (not b!88651))

(assert (not start!18040))

(assert (not b!88645))

(assert (not b!88652))

(assert (not b!88646))

(assert (not b!88654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

