; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45372 () Bool)

(assert start!45372)

(declare-fun b!220080 () Bool)

(declare-fun e!149469 () Bool)

(declare-datatypes ((array!10713 0))(
  ( (array!10714 (arr!5636 (Array (_ BitVec 32) (_ BitVec 8))) (size!4706 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8520 0))(
  ( (BitStream!8521 (buf!5253 array!10713) (currentByte!9856 (_ BitVec 32)) (currentBit!9851 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8520)

(declare-fun array_inv!4447 (array!10713) Bool)

(assert (=> b!220080 (= e!149469 (array_inv!4447 (buf!5253 bs!62)))))

(declare-fun b!220078 () Bool)

(declare-fun res!185401 () Bool)

(declare-fun e!149467 () Bool)

(assert (=> b!220078 (=> (not res!185401) (not e!149467))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220078 (= res!185401 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!185402 () Bool)

(assert (=> start!45372 (=> (not res!185402) (not e!149467))))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45372 (= res!185402 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45372 e!149467))

(assert (=> start!45372 true))

(declare-fun inv!12 (BitStream!8520) Bool)

(assert (=> start!45372 (and (inv!12 bs!62) e!149469)))

(declare-fun b!220077 () Bool)

(declare-fun res!185400 () Bool)

(assert (=> b!220077 (=> (not res!185400) (not e!149467))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220077 (= res!185400 (validate_offset_bits!1 ((_ sign_extend 32) (size!4706 (buf!5253 bs!62))) ((_ sign_extend 32) (currentByte!9856 bs!62)) ((_ sign_extend 32) (currentBit!9851 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220079 () Bool)

(assert (=> b!220079 (= e!149467 (and (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113) (bvsgt i!541 nBits!265)))))

(assert (= (and start!45372 res!185402) b!220077))

(assert (= (and b!220077 res!185400) b!220078))

(assert (= (and b!220078 res!185401) b!220079))

(assert (= start!45372 b!220080))

(declare-fun m!338799 () Bool)

(assert (=> b!220080 m!338799))

(declare-fun m!338801 () Bool)

(assert (=> b!220078 m!338801))

(declare-fun m!338803 () Bool)

(assert (=> start!45372 m!338803))

(declare-fun m!338805 () Bool)

(assert (=> b!220077 m!338805))

(check-sat (not b!220080) (not start!45372) (not b!220077) (not b!220078))
(check-sat)
