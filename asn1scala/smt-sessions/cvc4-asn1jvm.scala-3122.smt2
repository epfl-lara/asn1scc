; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71724 () Bool)

(assert start!71724)

(declare-fun b!322068 () Bool)

(declare-fun e!232095 () Bool)

(declare-datatypes ((array!20543 0))(
  ( (array!20544 (arr!10035 (Array (_ BitVec 32) (_ BitVec 8))) (size!8943 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14048 0))(
  ( (BitStream!14049 (buf!8085 array!20543) (currentByte!14902 (_ BitVec 32)) (currentBit!14897 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14048)

(declare-fun array_inv!8495 (array!20543) Bool)

(assert (=> b!322068 (= e!232095 (array_inv!8495 (buf!8085 thiss!1793)))))

(declare-fun res!264363 () Bool)

(declare-fun e!232093 () Bool)

(assert (=> start!71724 (=> (not res!264363) (not e!232093))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71724 (= res!264363 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71724 e!232093))

(assert (=> start!71724 true))

(declare-fun inv!12 (BitStream!14048) Bool)

(assert (=> start!71724 (and (inv!12 thiss!1793) e!232095)))

(declare-fun b!322069 () Bool)

(declare-fun res!264361 () Bool)

(assert (=> b!322069 (=> (not res!264361) (not e!232093))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322069 (= res!264361 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322070 () Bool)

(assert (=> b!322070 (= e!232093 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsgt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-datatypes ((tuple2!23518 0))(
  ( (tuple2!23519 (_1!13388 Bool) (_2!13388 BitStream!14048)) )
))
(declare-fun lt!444716 () tuple2!23518)

(declare-fun readBit!0 (BitStream!14048) tuple2!23518)

(assert (=> b!322070 (= lt!444716 (readBit!0 thiss!1793))))

(declare-fun b!322071 () Bool)

(declare-fun res!264364 () Bool)

(assert (=> b!322071 (=> (not res!264364) (not e!232093))))

(assert (=> b!322071 (= res!264364 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322072 () Bool)

(declare-fun res!264362 () Bool)

(assert (=> b!322072 (=> (not res!264362) (not e!232093))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322072 (= res!264362 (validate_offset_bits!1 ((_ sign_extend 32) (size!8943 (buf!8085 thiss!1793))) ((_ sign_extend 32) (currentByte!14902 thiss!1793)) ((_ sign_extend 32) (currentBit!14897 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(assert (= (and start!71724 res!264363) b!322072))

(assert (= (and b!322072 res!264362) b!322069))

(assert (= (and b!322069 res!264361) b!322071))

(assert (= (and b!322071 res!264364) b!322070))

(assert (= start!71724 b!322068))

(declare-fun m!460313 () Bool)

(assert (=> b!322069 m!460313))

(declare-fun m!460315 () Bool)

(assert (=> start!71724 m!460315))

(declare-fun m!460317 () Bool)

(assert (=> b!322070 m!460317))

(declare-fun m!460319 () Bool)

(assert (=> b!322068 m!460319))

(declare-fun m!460321 () Bool)

(assert (=> b!322072 m!460321))

(push 1)

(assert (not start!71724))

(assert (not b!322070))

(assert (not b!322072))

(assert (not b!322069))

(assert (not b!322068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

