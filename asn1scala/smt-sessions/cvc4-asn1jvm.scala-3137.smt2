; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72078 () Bool)

(assert start!72078)

(declare-fun b!323220 () Bool)

(declare-fun e!232875 () Bool)

(declare-datatypes ((array!20642 0))(
  ( (array!20643 (arr!10077 (Array (_ BitVec 32) (_ BitVec 8))) (size!8985 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14132 0))(
  ( (BitStream!14133 (buf!8127 array!20642) (currentByte!14992 (_ BitVec 32)) (currentBit!14987 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14132)

(declare-fun array_inv!8537 (array!20642) Bool)

(assert (=> b!323220 (= e!232875 (array_inv!8537 (buf!8127 thiss!1793)))))

(declare-fun b!323221 () Bool)

(declare-fun e!232874 () Bool)

(assert (=> b!323221 (= e!232874 false)))

(declare-fun lt!445826 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323221 (= lt!445826 (bitIndex!0 (size!8985 (buf!8127 thiss!1793)) (currentByte!14992 thiss!1793) (currentBit!14987 thiss!1793)))))

(declare-fun res!265327 () Bool)

(assert (=> start!72078 (=> (not res!265327) (not e!232874))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72078 (= res!265327 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72078 e!232874))

(assert (=> start!72078 true))

(declare-fun inv!12 (BitStream!14132) Bool)

(assert (=> start!72078 (and (inv!12 thiss!1793) e!232875)))

(declare-fun b!323222 () Bool)

(declare-fun res!265330 () Bool)

(assert (=> b!323222 (=> (not res!265330) (not e!232874))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323222 (= res!265330 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!323223 () Bool)

(declare-fun res!265328 () Bool)

(assert (=> b!323223 (=> (not res!265328) (not e!232874))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323223 (= res!265328 (validate_offset_bits!1 ((_ sign_extend 32) (size!8985 (buf!8127 thiss!1793))) ((_ sign_extend 32) (currentByte!14992 thiss!1793)) ((_ sign_extend 32) (currentBit!14987 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323224 () Bool)

(declare-fun res!265329 () Bool)

(assert (=> b!323224 (=> (not res!265329) (not e!232874))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323224 (= res!265329 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!72078 res!265327) b!323223))

(assert (= (and b!323223 res!265328) b!323224))

(assert (= (and b!323224 res!265329) b!323222))

(assert (= (and b!323222 res!265330) b!323221))

(assert (= start!72078 b!323220))

(declare-fun m!461369 () Bool)

(assert (=> b!323223 m!461369))

(declare-fun m!461371 () Bool)

(assert (=> start!72078 m!461371))

(declare-fun m!461373 () Bool)

(assert (=> b!323220 m!461373))

(declare-fun m!461375 () Bool)

(assert (=> b!323224 m!461375))

(declare-fun m!461377 () Bool)

(assert (=> b!323221 m!461377))

(push 1)

(assert (not b!323220))

(assert (not b!323221))

(assert (not b!323223))

(assert (not b!323224))

(assert (not start!72078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

