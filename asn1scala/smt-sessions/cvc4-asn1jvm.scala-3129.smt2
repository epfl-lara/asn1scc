; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71976 () Bool)

(assert start!71976)

(declare-fun b!322771 () Bool)

(declare-fun res!264962 () Bool)

(declare-fun e!232571 () Bool)

(assert (=> b!322771 (=> (not res!264962) (not e!232571))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322771 (= res!264962 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322772 () Bool)

(declare-fun e!232570 () Bool)

(assert (=> b!322772 (= e!232571 e!232570)))

(declare-fun res!264964 () Bool)

(assert (=> b!322772 (=> (not res!264964) (not e!232570))))

(declare-datatypes ((array!20597 0))(
  ( (array!20598 (arr!10056 (Array (_ BitVec 32) (_ BitVec 8))) (size!8964 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14090 0))(
  ( (BitStream!14091 (buf!8106 array!20597) (currentByte!14962 (_ BitVec 32)) (currentBit!14957 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23614 0))(
  ( (tuple2!23615 (_1!13436 (_ BitVec 64)) (_2!13436 BitStream!14090)) )
))
(declare-fun lt!445519 () tuple2!23614)

(declare-fun thiss!1793 () BitStream!14090)

(assert (=> b!322772 (= res!264964 (= (buf!8106 (_2!13436 lt!445519)) (buf!8106 thiss!1793)))))

(declare-datatypes ((tuple2!23616 0))(
  ( (tuple2!23617 (_1!13437 Bool) (_2!13437 BitStream!14090)) )
))
(declare-fun lt!445518 () tuple2!23616)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23614)

(assert (=> b!322772 (= lt!445519 (readNBitsLSBFirstsLoop!0 (_2!13437 lt!445518) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13437 lt!445518) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14090) tuple2!23616)

(assert (=> b!322772 (= lt!445518 (readBit!0 thiss!1793))))

(declare-fun b!322773 () Bool)

(declare-fun res!264959 () Bool)

(assert (=> b!322773 (=> (not res!264959) (not e!232570))))

(declare-fun lt!445520 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322773 (= res!264959 (= (bitIndex!0 (size!8964 (buf!8106 (_2!13436 lt!445519))) (currentByte!14962 (_2!13436 lt!445519)) (currentBit!14957 (_2!13436 lt!445519))) (bvadd (bitIndex!0 (size!8964 (buf!8106 thiss!1793)) (currentByte!14962 thiss!1793) (currentBit!14957 thiss!1793)) lt!445520)))))

(declare-fun res!264963 () Bool)

(declare-fun e!232568 () Bool)

(assert (=> start!71976 (=> (not res!264963) (not e!232568))))

(assert (=> start!71976 (= res!264963 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71976 e!232568))

(assert (=> start!71976 true))

(declare-fun e!232572 () Bool)

(declare-fun inv!12 (BitStream!14090) Bool)

(assert (=> start!71976 (and (inv!12 thiss!1793) e!232572)))

(declare-fun b!322774 () Bool)

(assert (=> b!322774 (= e!232570 (bvsgt i!743 #b00000000000000000000000001000000))))

(declare-fun b!322775 () Bool)

(declare-fun res!264960 () Bool)

(assert (=> b!322775 (=> (not res!264960) (not e!232571))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322775 (= res!264960 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322776 () Bool)

(declare-fun array_inv!8516 (array!20597) Bool)

(assert (=> b!322776 (= e!232572 (array_inv!8516 (buf!8106 thiss!1793)))))

(declare-fun b!322777 () Bool)

(assert (=> b!322777 (= e!232568 e!232571)))

(declare-fun res!264961 () Bool)

(assert (=> b!322777 (=> (not res!264961) (not e!232571))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322777 (= res!264961 (validate_offset_bits!1 ((_ sign_extend 32) (size!8964 (buf!8106 thiss!1793))) ((_ sign_extend 32) (currentByte!14962 thiss!1793)) ((_ sign_extend 32) (currentBit!14957 thiss!1793)) lt!445520))))

(assert (=> b!322777 (= lt!445520 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(assert (= (and start!71976 res!264963) b!322777))

(assert (= (and b!322777 res!264961) b!322775))

(assert (= (and b!322775 res!264960) b!322771))

(assert (= (and b!322771 res!264962) b!322772))

(assert (= (and b!322772 res!264964) b!322773))

(assert (= (and b!322773 res!264959) b!322774))

(assert (= start!71976 b!322776))

(declare-fun m!461027 () Bool)

(assert (=> start!71976 m!461027))

(declare-fun m!461029 () Bool)

(assert (=> b!322777 m!461029))

(declare-fun m!461031 () Bool)

(assert (=> b!322775 m!461031))

(declare-fun m!461033 () Bool)

(assert (=> b!322773 m!461033))

(declare-fun m!461035 () Bool)

(assert (=> b!322773 m!461035))

(declare-fun m!461037 () Bool)

(assert (=> b!322772 m!461037))

(declare-fun m!461039 () Bool)

(assert (=> b!322772 m!461039))

(declare-fun m!461041 () Bool)

(assert (=> b!322776 m!461041))

(push 1)

(assert (not b!322776))

(assert (not b!322772))

(assert (not start!71976))

(assert (not b!322775))

(assert (not b!322777))

(assert (not b!322773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

