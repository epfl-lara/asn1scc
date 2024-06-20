; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71536 () Bool)

(assert start!71536)

(declare-fun res!264024 () Bool)

(declare-fun e!231725 () Bool)

(assert (=> start!71536 (=> (not res!264024) (not e!231725))))

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(assert (=> start!71536 (= res!264024 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000)))))

(assert (=> start!71536 e!231725))

(assert (=> start!71536 true))

(declare-datatypes ((array!20450 0))(
  ( (array!20451 (arr!9995 (Array (_ BitVec 32) (_ BitVec 8))) (size!8903 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13968 0))(
  ( (BitStream!13969 (buf!8045 array!20450) (currentByte!14842 (_ BitVec 32)) (currentBit!14837 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13968)

(declare-fun e!231726 () Bool)

(declare-fun inv!12 (BitStream!13968) Bool)

(assert (=> start!71536 (and (inv!12 thiss!1811) e!231726)))

(declare-fun b!321611 () Bool)

(declare-fun res!264025 () Bool)

(assert (=> b!321611 (=> (not res!264025) (not e!231725))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321611 (= res!264025 (validate_offset_bits!1 ((_ sign_extend 32) (size!8903 (buf!8045 thiss!1811))) ((_ sign_extend 32) (currentByte!14842 thiss!1811)) ((_ sign_extend 32) (currentBit!14837 thiss!1811)) ((_ sign_extend 32) (bvsub nBits!568 i!747))))))

(declare-fun b!321612 () Bool)

(assert (=> b!321612 (= e!231725 (and (not (= #b00000000000000000000000000000000 (bvand i!747 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 i!747) #b10000000000000000000000000000000)))))))

(declare-fun b!321613 () Bool)

(declare-fun array_inv!8455 (array!20450) Bool)

(assert (=> b!321613 (= e!231726 (array_inv!8455 (buf!8045 thiss!1811)))))

(assert (= (and start!71536 res!264024) b!321611))

(assert (= (and b!321611 res!264025) b!321612))

(assert (= start!71536 b!321613))

(declare-fun m!459963 () Bool)

(assert (=> start!71536 m!459963))

(declare-fun m!459965 () Bool)

(assert (=> b!321611 m!459965))

(declare-fun m!459967 () Bool)

(assert (=> b!321613 m!459967))

(check-sat (not b!321611) (not start!71536) (not b!321613))
(check-sat)
