; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72122 () Bool)

(assert start!72122)

(declare-fun b!323309 () Bool)

(declare-fun e!232937 () Bool)

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!323309 (= e!232937 (or (bvslt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun b!323311 () Bool)

(declare-fun res!265406 () Bool)

(assert (=> b!323311 (=> (not res!265406) (not e!232937))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20653 0))(
  ( (array!20654 (arr!10081 (Array (_ BitVec 32) (_ BitVec 8))) (size!8989 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14140 0))(
  ( (BitStream!14141 (buf!8131 array!20653) (currentByte!15002 (_ BitVec 32)) (currentBit!14997 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14140)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323311 (= res!265406 (validate_offset_bits!1 ((_ sign_extend 32) (size!8989 (buf!8131 thiss!1793))) ((_ sign_extend 32) (currentByte!15002 thiss!1793)) ((_ sign_extend 32) (currentBit!14997 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323312 () Bool)

(declare-fun res!265407 () Bool)

(assert (=> b!323312 (=> (not res!265407) (not e!232937))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323312 (= res!265407 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323313 () Bool)

(declare-fun res!265408 () Bool)

(assert (=> b!323313 (=> (not res!265408) (not e!232937))))

(declare-datatypes ((tuple2!23654 0))(
  ( (tuple2!23655 (_1!13456 Bool) (_2!13456 BitStream!14140)) )
))
(declare-fun readBit!0 (BitStream!14140) tuple2!23654)

(assert (=> b!323313 (= res!265408 (_1!13456 (readBit!0 thiss!1793)))))

(declare-fun b!323314 () Bool)

(declare-fun res!265404 () Bool)

(assert (=> b!323314 (=> (not res!265404) (not e!232937))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323314 (= res!265404 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!265405 () Bool)

(assert (=> start!72122 (=> (not res!265405) (not e!232937))))

(assert (=> start!72122 (= res!265405 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72122 e!232937))

(assert (=> start!72122 true))

(declare-fun e!232936 () Bool)

(declare-fun inv!12 (BitStream!14140) Bool)

(assert (=> start!72122 (and (inv!12 thiss!1793) e!232936)))

(declare-fun b!323310 () Bool)

(declare-fun array_inv!8541 (array!20653) Bool)

(assert (=> b!323310 (= e!232936 (array_inv!8541 (buf!8131 thiss!1793)))))

(assert (= (and start!72122 res!265405) b!323311))

(assert (= (and b!323311 res!265406) b!323314))

(assert (= (and b!323314 res!265404) b!323312))

(assert (= (and b!323312 res!265407) b!323313))

(assert (= (and b!323313 res!265408) b!323309))

(assert (= start!72122 b!323310))

(declare-fun m!461427 () Bool)

(assert (=> b!323313 m!461427))

(declare-fun m!461429 () Bool)

(assert (=> b!323311 m!461429))

(declare-fun m!461431 () Bool)

(assert (=> b!323310 m!461431))

(declare-fun m!461433 () Bool)

(assert (=> start!72122 m!461433))

(declare-fun m!461435 () Bool)

(assert (=> b!323314 m!461435))

(push 1)

(assert (not start!72122))

(assert (not b!323311))

(assert (not b!323310))

(assert (not b!323314))

(assert (not b!323313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

