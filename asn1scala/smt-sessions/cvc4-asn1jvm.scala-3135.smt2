; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72066 () Bool)

(assert start!72066)

(declare-fun b!323130 () Bool)

(declare-fun e!232812 () Bool)

(declare-datatypes ((array!20630 0))(
  ( (array!20631 (arr!10071 (Array (_ BitVec 32) (_ BitVec 8))) (size!8979 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14120 0))(
  ( (BitStream!14121 (buf!8121 array!20630) (currentByte!14986 (_ BitVec 32)) (currentBit!14981 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14120)

(declare-fun array_inv!8531 (array!20630) Bool)

(assert (=> b!323130 (= e!232812 (array_inv!8531 (buf!8121 thiss!1793)))))

(declare-fun b!323131 () Bool)

(declare-fun res!265256 () Bool)

(declare-fun e!232811 () Bool)

(assert (=> b!323131 (=> (not res!265256) (not e!232811))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323131 (= res!265256 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!323132 () Bool)

(assert (=> b!323132 (= e!232811 (and (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000)))))))

(declare-fun lt!445790 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323132 (= lt!445790 (bitIndex!0 (size!8979 (buf!8121 thiss!1793)) (currentByte!14986 thiss!1793) (currentBit!14981 thiss!1793)))))

(declare-fun res!265257 () Bool)

(assert (=> start!72066 (=> (not res!265257) (not e!232811))))

(assert (=> start!72066 (= res!265257 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72066 e!232811))

(assert (=> start!72066 true))

(declare-fun inv!12 (BitStream!14120) Bool)

(assert (=> start!72066 (and (inv!12 thiss!1793) e!232812)))

(declare-fun b!323133 () Bool)

(declare-fun res!265255 () Bool)

(assert (=> b!323133 (=> (not res!265255) (not e!232811))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323133 (= res!265255 (validate_offset_bits!1 ((_ sign_extend 32) (size!8979 (buf!8121 thiss!1793))) ((_ sign_extend 32) (currentByte!14986 thiss!1793)) ((_ sign_extend 32) (currentBit!14981 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323134 () Bool)

(declare-fun res!265258 () Bool)

(assert (=> b!323134 (=> (not res!265258) (not e!232811))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323134 (= res!265258 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!72066 res!265257) b!323133))

(assert (= (and b!323133 res!265255) b!323134))

(assert (= (and b!323134 res!265258) b!323131))

(assert (= (and b!323131 res!265256) b!323132))

(assert (= start!72066 b!323130))

(declare-fun m!461309 () Bool)

(assert (=> start!72066 m!461309))

(declare-fun m!461311 () Bool)

(assert (=> b!323133 m!461311))

(declare-fun m!461313 () Bool)

(assert (=> b!323130 m!461313))

(declare-fun m!461315 () Bool)

(assert (=> b!323134 m!461315))

(declare-fun m!461317 () Bool)

(assert (=> b!323132 m!461317))

(push 1)

(assert (not b!323133))

(assert (not start!72066))

(assert (not b!323130))

(assert (not b!323134))

(assert (not b!323132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

