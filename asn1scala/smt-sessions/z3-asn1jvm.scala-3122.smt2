; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71722 () Bool)

(assert start!71722)

(declare-fun b!322053 () Bool)

(declare-fun res!264351 () Bool)

(declare-fun e!232084 () Bool)

(assert (=> b!322053 (=> (not res!264351) (not e!232084))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322053 (= res!264351 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322054 () Bool)

(declare-fun e!232086 () Bool)

(declare-datatypes ((array!20541 0))(
  ( (array!20542 (arr!10034 (Array (_ BitVec 32) (_ BitVec 8))) (size!8942 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14046 0))(
  ( (BitStream!14047 (buf!8084 array!20541) (currentByte!14901 (_ BitVec 32)) (currentBit!14896 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14046)

(declare-fun array_inv!8494 (array!20541) Bool)

(assert (=> b!322054 (= e!232086 (array_inv!8494 (buf!8084 thiss!1793)))))

(declare-fun res!264350 () Bool)

(assert (=> start!71722 (=> (not res!264350) (not e!232084))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71722 (= res!264350 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71722 e!232084))

(assert (=> start!71722 true))

(declare-fun inv!12 (BitStream!14046) Bool)

(assert (=> start!71722 (and (inv!12 thiss!1793) e!232086)))

(declare-fun b!322055 () Bool)

(declare-fun res!264349 () Bool)

(assert (=> b!322055 (=> (not res!264349) (not e!232084))))

(assert (=> b!322055 (= res!264349 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322056 () Bool)

(declare-fun res!264352 () Bool)

(assert (=> b!322056 (=> (not res!264352) (not e!232084))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322056 (= res!264352 (validate_offset_bits!1 ((_ sign_extend 32) (size!8942 (buf!8084 thiss!1793))) ((_ sign_extend 32) (currentByte!14901 thiss!1793)) ((_ sign_extend 32) (currentBit!14896 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322057 () Bool)

(assert (=> b!322057 (= e!232084 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsgt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-datatypes ((tuple2!23516 0))(
  ( (tuple2!23517 (_1!13387 Bool) (_2!13387 BitStream!14046)) )
))
(declare-fun lt!444713 () tuple2!23516)

(declare-fun readBit!0 (BitStream!14046) tuple2!23516)

(assert (=> b!322057 (= lt!444713 (readBit!0 thiss!1793))))

(assert (= (and start!71722 res!264350) b!322056))

(assert (= (and b!322056 res!264352) b!322053))

(assert (= (and b!322053 res!264351) b!322055))

(assert (= (and b!322055 res!264349) b!322057))

(assert (= start!71722 b!322054))

(declare-fun m!460303 () Bool)

(assert (=> b!322057 m!460303))

(declare-fun m!460305 () Bool)

(assert (=> start!71722 m!460305))

(declare-fun m!460307 () Bool)

(assert (=> b!322054 m!460307))

(declare-fun m!460309 () Bool)

(assert (=> b!322056 m!460309))

(declare-fun m!460311 () Bool)

(assert (=> b!322053 m!460311))

(check-sat (not start!71722) (not b!322054) (not b!322056) (not b!322057) (not b!322053))
(check-sat)
