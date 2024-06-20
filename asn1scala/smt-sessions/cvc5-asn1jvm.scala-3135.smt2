; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72062 () Bool)

(assert start!72062)

(declare-fun b!323100 () Bool)

(declare-fun e!232792 () Bool)

(declare-datatypes ((array!20626 0))(
  ( (array!20627 (arr!10069 (Array (_ BitVec 32) (_ BitVec 8))) (size!8977 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14116 0))(
  ( (BitStream!14117 (buf!8119 array!20626) (currentByte!14984 (_ BitVec 32)) (currentBit!14979 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14116)

(declare-fun array_inv!8529 (array!20626) Bool)

(assert (=> b!323100 (= e!232792 (array_inv!8529 (buf!8119 thiss!1793)))))

(declare-fun b!323101 () Bool)

(declare-fun res!265232 () Bool)

(declare-fun e!232794 () Bool)

(assert (=> b!323101 (=> (not res!265232) (not e!232794))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323101 (= res!265232 (validate_offset_bits!1 ((_ sign_extend 32) (size!8977 (buf!8119 thiss!1793))) ((_ sign_extend 32) (currentByte!14984 thiss!1793)) ((_ sign_extend 32) (currentBit!14979 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun res!265231 () Bool)

(assert (=> start!72062 (=> (not res!265231) (not e!232794))))

(assert (=> start!72062 (= res!265231 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72062 e!232794))

(assert (=> start!72062 true))

(declare-fun inv!12 (BitStream!14116) Bool)

(assert (=> start!72062 (and (inv!12 thiss!1793) e!232792)))

(declare-fun b!323102 () Bool)

(declare-fun res!265234 () Bool)

(assert (=> b!323102 (=> (not res!265234) (not e!232794))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323102 (= res!265234 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!323103 () Bool)

(assert (=> b!323103 (= e!232794 (and (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000)))))))

(declare-fun lt!445784 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323103 (= lt!445784 (bitIndex!0 (size!8977 (buf!8119 thiss!1793)) (currentByte!14984 thiss!1793) (currentBit!14979 thiss!1793)))))

(declare-fun b!323104 () Bool)

(declare-fun res!265233 () Bool)

(assert (=> b!323104 (=> (not res!265233) (not e!232794))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323104 (= res!265233 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!72062 res!265231) b!323101))

(assert (= (and b!323101 res!265232) b!323104))

(assert (= (and b!323104 res!265233) b!323102))

(assert (= (and b!323102 res!265234) b!323103))

(assert (= start!72062 b!323100))

(declare-fun m!461289 () Bool)

(assert (=> b!323103 m!461289))

(declare-fun m!461291 () Bool)

(assert (=> b!323104 m!461291))

(declare-fun m!461293 () Bool)

(assert (=> start!72062 m!461293))

(declare-fun m!461295 () Bool)

(assert (=> b!323100 m!461295))

(declare-fun m!461297 () Bool)

(assert (=> b!323101 m!461297))

(push 1)

(assert (not b!323100))

(assert (not start!72062))

(assert (not b!323104))

(assert (not b!323103))

(assert (not b!323101))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

