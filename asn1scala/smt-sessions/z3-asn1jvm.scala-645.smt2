; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18054 () Bool)

(assert start!18054)

(declare-fun b!88846 () Bool)

(declare-fun res!73148 () Bool)

(declare-fun e!58760 () Bool)

(assert (=> b!88846 (=> (not res!73148) (not e!58760))))

(declare-datatypes ((array!4193 0))(
  ( (array!4194 (arr!2530 (Array (_ BitVec 32) (_ BitVec 8))) (size!1893 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3348 0))(
  ( (BitStream!3349 (buf!2283 array!4193) (currentByte!4525 (_ BitVec 32)) (currentBit!4520 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3348)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88846 (= res!73148 (validate_offset_bits!1 ((_ sign_extend 32) (size!1893 (buf!2283 thiss!1151))) ((_ sign_extend 32) (currentByte!4525 thiss!1151)) ((_ sign_extend 32) (currentBit!4520 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88847 () Bool)

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!88847 (= e!58760 (and (bvslt i!576 nBits!336) (or (bvslt ((_ sign_extend 32) i!576) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!576) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun b!88848 () Bool)

(declare-fun res!73147 () Bool)

(assert (=> b!88848 (=> (not res!73147) (not e!58760))))

(assert (=> b!88848 (= res!73147 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88849 () Bool)

(declare-fun e!58758 () Bool)

(declare-fun thiss!1152 () BitStream!3348)

(declare-fun array_inv!1739 (array!4193) Bool)

(assert (=> b!88849 (= e!58758 (array_inv!1739 (buf!2283 thiss!1152)))))

(declare-fun b!88850 () Bool)

(declare-fun res!73145 () Bool)

(assert (=> b!88850 (=> (not res!73145) (not e!58760))))

(assert (=> b!88850 (= res!73145 (validate_offset_bits!1 ((_ sign_extend 32) (size!1893 (buf!2283 thiss!1152))) ((_ sign_extend 32) (currentByte!4525 thiss!1152)) ((_ sign_extend 32) (currentBit!4520 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88851 () Bool)

(declare-fun e!58757 () Bool)

(assert (=> b!88851 (= e!58757 (array_inv!1739 (buf!2283 thiss!1151)))))

(declare-fun res!73146 () Bool)

(assert (=> start!18054 (=> (not res!73146) (not e!58760))))

(assert (=> start!18054 (= res!73146 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18054 e!58760))

(assert (=> start!18054 true))

(declare-fun inv!12 (BitStream!3348) Bool)

(assert (=> start!18054 (and (inv!12 thiss!1151) e!58757)))

(assert (=> start!18054 (and (inv!12 thiss!1152) e!58758)))

(declare-fun b!88852 () Bool)

(declare-fun res!73144 () Bool)

(assert (=> b!88852 (=> (not res!73144) (not e!58760))))

(assert (=> b!88852 (= res!73144 (and (bvsle i!576 nBits!336) (= (size!1893 (buf!2283 thiss!1152)) (size!1893 (buf!2283 thiss!1151)))))))

(declare-fun b!88853 () Bool)

(declare-fun res!73150 () Bool)

(assert (=> b!88853 (=> (not res!73150) (not e!58760))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88853 (= res!73150 (= (bitIndex!0 (size!1893 (buf!2283 thiss!1152)) (currentByte!4525 thiss!1152) (currentBit!4520 thiss!1152)) (bvadd (bitIndex!0 (size!1893 (buf!2283 thiss!1151)) (currentByte!4525 thiss!1151) (currentBit!4520 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88854 () Bool)

(declare-fun res!73143 () Bool)

(assert (=> b!88854 (=> (not res!73143) (not e!58760))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88854 (= res!73143 (invariant!0 (currentBit!4520 thiss!1151) (currentByte!4525 thiss!1151) (size!1893 (buf!2283 thiss!1151))))))

(declare-fun b!88855 () Bool)

(declare-fun res!73149 () Bool)

(assert (=> b!88855 (=> (not res!73149) (not e!58760))))

(assert (=> b!88855 (= res!73149 (invariant!0 (currentBit!4520 thiss!1152) (currentByte!4525 thiss!1152) (size!1893 (buf!2283 thiss!1152))))))

(assert (= (and start!18054 res!73146) b!88846))

(assert (= (and b!88846 res!73148) b!88854))

(assert (= (and b!88854 res!73143) b!88848))

(assert (= (and b!88848 res!73147) b!88855))

(assert (= (and b!88855 res!73149) b!88852))

(assert (= (and b!88852 res!73144) b!88853))

(assert (= (and b!88853 res!73150) b!88850))

(assert (= (and b!88850 res!73145) b!88847))

(assert (= start!18054 b!88851))

(assert (= start!18054 b!88849))

(declare-fun m!133879 () Bool)

(assert (=> b!88854 m!133879))

(declare-fun m!133881 () Bool)

(assert (=> b!88855 m!133881))

(declare-fun m!133883 () Bool)

(assert (=> b!88851 m!133883))

(declare-fun m!133885 () Bool)

(assert (=> start!18054 m!133885))

(declare-fun m!133887 () Bool)

(assert (=> start!18054 m!133887))

(declare-fun m!133889 () Bool)

(assert (=> b!88850 m!133889))

(declare-fun m!133891 () Bool)

(assert (=> b!88846 m!133891))

(declare-fun m!133893 () Bool)

(assert (=> b!88853 m!133893))

(declare-fun m!133895 () Bool)

(assert (=> b!88853 m!133895))

(declare-fun m!133897 () Bool)

(assert (=> b!88849 m!133897))

(check-sat (not b!88853) (not b!88849) (not b!88846) (not b!88850) (not b!88854) (not start!18054) (not b!88855) (not b!88851))
(check-sat)
