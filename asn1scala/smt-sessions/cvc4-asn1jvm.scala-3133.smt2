; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72054 () Bool)

(assert start!72054)

(declare-fun res!265194 () Bool)

(declare-fun e!232757 () Bool)

(assert (=> start!72054 (=> (not res!265194) (not e!232757))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72054 (= res!265194 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72054 e!232757))

(assert (=> start!72054 true))

(declare-datatypes ((array!20618 0))(
  ( (array!20619 (arr!10065 (Array (_ BitVec 32) (_ BitVec 8))) (size!8973 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14108 0))(
  ( (BitStream!14109 (buf!8115 array!20618) (currentByte!14980 (_ BitVec 32)) (currentBit!14975 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14108)

(declare-fun e!232756 () Bool)

(declare-fun inv!12 (BitStream!14108) Bool)

(assert (=> start!72054 (and (inv!12 thiss!1793) e!232756)))

(declare-fun b!323051 () Bool)

(declare-fun res!265195 () Bool)

(assert (=> b!323051 (=> (not res!265195) (not e!232757))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323051 (= res!265195 (validate_offset_bits!1 ((_ sign_extend 32) (size!8973 (buf!8115 thiss!1793))) ((_ sign_extend 32) (currentByte!14980 thiss!1793)) ((_ sign_extend 32) (currentBit!14975 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323052 () Bool)

(assert (=> b!323052 (= e!232757 (and (not (= #b00000000000000000000000000000000 (bvand i!743 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 i!743) #b10000000000000000000000000000000)))))))

(declare-fun b!323053 () Bool)

(declare-fun array_inv!8525 (array!20618) Bool)

(assert (=> b!323053 (= e!232756 (array_inv!8525 (buf!8115 thiss!1793)))))

(assert (= (and start!72054 res!265194) b!323051))

(assert (= (and b!323051 res!265195) b!323052))

(assert (= start!72054 b!323053))

(declare-fun m!461259 () Bool)

(assert (=> start!72054 m!461259))

(declare-fun m!461261 () Bool)

(assert (=> b!323051 m!461261))

(declare-fun m!461263 () Bool)

(assert (=> b!323053 m!461263))

(push 1)

(assert (not start!72054))

(assert (not b!323051))

(assert (not b!323053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

