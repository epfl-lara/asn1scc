; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71978 () Bool)

(assert start!71978)

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((array!20599 0))(
  ( (array!20600 (arr!10057 (Array (_ BitVec 32) (_ BitVec 8))) (size!8965 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14092 0))(
  ( (BitStream!14093 (buf!8107 array!20599) (currentByte!14963 (_ BitVec 32)) (currentBit!14958 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23618 0))(
  ( (tuple2!23619 (_1!13438 (_ BitVec 64)) (_2!13438 BitStream!14092)) )
))
(declare-fun lt!445531 () tuple2!23618)

(declare-fun e!232586 () Bool)

(declare-fun b!322793 () Bool)

(declare-fun lt!445530 () (_ BitVec 64))

(assert (=> b!322793 (= e!232586 (and (= (bvand (_1!13438 lt!445531) lt!445530) (bvand acc!161 lt!445530)) (bvsgt #b00000000000000000000000000000000 nBits!548)))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322793 (= lt!445530 (onesLSBLong!0 i!743))))

(declare-fun b!322794 () Bool)

(declare-fun e!232585 () Bool)

(declare-fun e!232583 () Bool)

(assert (=> b!322794 (= e!232585 e!232583)))

(declare-fun res!264978 () Bool)

(assert (=> b!322794 (=> (not res!264978) (not e!232583))))

(declare-fun thiss!1793 () BitStream!14092)

(declare-fun lt!445529 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322794 (= res!264978 (validate_offset_bits!1 ((_ sign_extend 32) (size!8965 (buf!8107 thiss!1793))) ((_ sign_extend 32) (currentByte!14963 thiss!1793)) ((_ sign_extend 32) (currentBit!14958 thiss!1793)) lt!445529))))

(assert (=> b!322794 (= lt!445529 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!322792 () Bool)

(declare-fun res!264979 () Bool)

(assert (=> b!322792 (=> (not res!264979) (not e!232586))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322792 (= res!264979 (= (bitIndex!0 (size!8965 (buf!8107 (_2!13438 lt!445531))) (currentByte!14963 (_2!13438 lt!445531)) (currentBit!14958 (_2!13438 lt!445531))) (bvadd (bitIndex!0 (size!8965 (buf!8107 thiss!1793)) (currentByte!14963 thiss!1793) (currentBit!14958 thiss!1793)) lt!445529)))))

(declare-fun res!264982 () Bool)

(assert (=> start!71978 (=> (not res!264982) (not e!232585))))

(assert (=> start!71978 (= res!264982 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71978 e!232585))

(assert (=> start!71978 true))

(declare-fun e!232584 () Bool)

(declare-fun inv!12 (BitStream!14092) Bool)

(assert (=> start!71978 (and (inv!12 thiss!1793) e!232584)))

(declare-fun b!322795 () Bool)

(declare-fun res!264981 () Bool)

(assert (=> b!322795 (=> (not res!264981) (not e!232583))))

(assert (=> b!322795 (= res!264981 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322796 () Bool)

(assert (=> b!322796 (= e!232583 e!232586)))

(declare-fun res!264977 () Bool)

(assert (=> b!322796 (=> (not res!264977) (not e!232586))))

(assert (=> b!322796 (= res!264977 (= (buf!8107 (_2!13438 lt!445531)) (buf!8107 thiss!1793)))))

(declare-datatypes ((tuple2!23620 0))(
  ( (tuple2!23621 (_1!13439 Bool) (_2!13439 BitStream!14092)) )
))
(declare-fun lt!445532 () tuple2!23620)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23618)

(assert (=> b!322796 (= lt!445531 (readNBitsLSBFirstsLoop!0 (_2!13439 lt!445532) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13439 lt!445532) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14092) tuple2!23620)

(assert (=> b!322796 (= lt!445532 (readBit!0 thiss!1793))))

(declare-fun b!322797 () Bool)

(declare-fun res!264980 () Bool)

(assert (=> b!322797 (=> (not res!264980) (not e!232583))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322797 (= res!264980 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322798 () Bool)

(declare-fun array_inv!8517 (array!20599) Bool)

(assert (=> b!322798 (= e!232584 (array_inv!8517 (buf!8107 thiss!1793)))))

(assert (= (and start!71978 res!264982) b!322794))

(assert (= (and b!322794 res!264978) b!322797))

(assert (= (and b!322797 res!264980) b!322795))

(assert (= (and b!322795 res!264981) b!322796))

(assert (= (and b!322796 res!264977) b!322792))

(assert (= (and b!322792 res!264979) b!322793))

(assert (= start!71978 b!322798))

(declare-fun m!461043 () Bool)

(assert (=> b!322794 m!461043))

(declare-fun m!461045 () Bool)

(assert (=> b!322798 m!461045))

(declare-fun m!461047 () Bool)

(assert (=> b!322792 m!461047))

(declare-fun m!461049 () Bool)

(assert (=> b!322792 m!461049))

(declare-fun m!461051 () Bool)

(assert (=> b!322793 m!461051))

(declare-fun m!461053 () Bool)

(assert (=> b!322797 m!461053))

(declare-fun m!461055 () Bool)

(assert (=> start!71978 m!461055))

(declare-fun m!461057 () Bool)

(assert (=> b!322796 m!461057))

(declare-fun m!461059 () Bool)

(assert (=> b!322796 m!461059))

(push 1)

(assert (not b!322797))

(assert (not b!322793))

(assert (not b!322796))

(assert (not start!71978))

(assert (not b!322798))

(assert (not b!322792))

(assert (not b!322794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

