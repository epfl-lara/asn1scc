; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71720 () Bool)

(assert start!71720)

(declare-fun b!322038 () Bool)

(declare-fun e!232077 () Bool)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!322038 (= e!232077 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsgt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-datatypes ((array!20539 0))(
  ( (array!20540 (arr!10033 (Array (_ BitVec 32) (_ BitVec 8))) (size!8941 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14044 0))(
  ( (BitStream!14045 (buf!8083 array!20539) (currentByte!14900 (_ BitVec 32)) (currentBit!14895 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23514 0))(
  ( (tuple2!23515 (_1!13386 Bool) (_2!13386 BitStream!14044)) )
))
(declare-fun lt!444710 () tuple2!23514)

(declare-fun thiss!1793 () BitStream!14044)

(declare-fun readBit!0 (BitStream!14044) tuple2!23514)

(assert (=> b!322038 (= lt!444710 (readBit!0 thiss!1793))))

(declare-fun b!322039 () Bool)

(declare-fun e!232076 () Bool)

(declare-fun array_inv!8493 (array!20539) Bool)

(assert (=> b!322039 (= e!232076 (array_inv!8493 (buf!8083 thiss!1793)))))

(declare-fun res!264338 () Bool)

(assert (=> start!71720 (=> (not res!264338) (not e!232077))))

(assert (=> start!71720 (= res!264338 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71720 e!232077))

(assert (=> start!71720 true))

(declare-fun inv!12 (BitStream!14044) Bool)

(assert (=> start!71720 (and (inv!12 thiss!1793) e!232076)))

(declare-fun b!322040 () Bool)

(declare-fun res!264339 () Bool)

(assert (=> b!322040 (=> (not res!264339) (not e!232077))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322040 (= res!264339 (validate_offset_bits!1 ((_ sign_extend 32) (size!8941 (buf!8083 thiss!1793))) ((_ sign_extend 32) (currentByte!14900 thiss!1793)) ((_ sign_extend 32) (currentBit!14895 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322041 () Bool)

(declare-fun res!264337 () Bool)

(assert (=> b!322041 (=> (not res!264337) (not e!232077))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322041 (= res!264337 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322042 () Bool)

(declare-fun res!264340 () Bool)

(assert (=> b!322042 (=> (not res!264340) (not e!232077))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322042 (= res!264340 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!71720 res!264338) b!322040))

(assert (= (and b!322040 res!264339) b!322042))

(assert (= (and b!322042 res!264340) b!322041))

(assert (= (and b!322041 res!264337) b!322038))

(assert (= start!71720 b!322039))

(declare-fun m!460293 () Bool)

(assert (=> b!322038 m!460293))

(declare-fun m!460295 () Bool)

(assert (=> start!71720 m!460295))

(declare-fun m!460297 () Bool)

(assert (=> b!322040 m!460297))

(declare-fun m!460299 () Bool)

(assert (=> b!322039 m!460299))

(declare-fun m!460301 () Bool)

(assert (=> b!322042 m!460301))

(push 1)

(assert (not start!71720))

(assert (not b!322038))

(assert (not b!322039))

(assert (not b!322042))

(assert (not b!322040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

