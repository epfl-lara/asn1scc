; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72060 () Bool)

(assert start!72060)

(declare-fun b!323087 () Bool)

(declare-fun res!265220 () Bool)

(declare-fun e!232785 () Bool)

(assert (=> b!323087 (=> (not res!265220) (not e!232785))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323087 (= res!265220 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323086 () Bool)

(declare-fun res!265222 () Bool)

(assert (=> b!323086 (=> (not res!265222) (not e!232785))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20624 0))(
  ( (array!20625 (arr!10068 (Array (_ BitVec 32) (_ BitVec 8))) (size!8976 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14114 0))(
  ( (BitStream!14115 (buf!8118 array!20624) (currentByte!14983 (_ BitVec 32)) (currentBit!14978 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14114)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323086 (= res!265222 (validate_offset_bits!1 ((_ sign_extend 32) (size!8976 (buf!8118 thiss!1793))) ((_ sign_extend 32) (currentByte!14983 thiss!1793)) ((_ sign_extend 32) (currentBit!14978 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323089 () Bool)

(declare-fun e!232783 () Bool)

(declare-fun array_inv!8528 (array!20624) Bool)

(assert (=> b!323089 (= e!232783 (array_inv!8528 (buf!8118 thiss!1793)))))

(declare-fun b!323088 () Bool)

(assert (=> b!323088 (= e!232785 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000)))))))

(declare-fun res!265221 () Bool)

(assert (=> start!72060 (=> (not res!265221) (not e!232785))))

(assert (=> start!72060 (= res!265221 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72060 e!232785))

(assert (=> start!72060 true))

(declare-fun inv!12 (BitStream!14114) Bool)

(assert (=> start!72060 (and (inv!12 thiss!1793) e!232783)))

(assert (= (and start!72060 res!265221) b!323086))

(assert (= (and b!323086 res!265222) b!323087))

(assert (= (and b!323087 res!265220) b!323088))

(assert (= start!72060 b!323089))

(declare-fun m!461281 () Bool)

(assert (=> b!323087 m!461281))

(declare-fun m!461283 () Bool)

(assert (=> b!323086 m!461283))

(declare-fun m!461285 () Bool)

(assert (=> b!323089 m!461285))

(declare-fun m!461287 () Bool)

(assert (=> start!72060 m!461287))

(push 1)

(assert (not b!323087))

(assert (not b!323086))

(assert (not b!323089))

(assert (not start!72060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

