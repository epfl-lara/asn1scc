; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71970 () Bool)

(assert start!71970)

(declare-fun b!322708 () Bool)

(declare-fun res!264909 () Bool)

(declare-fun e!232526 () Bool)

(assert (=> b!322708 (=> (not res!264909) (not e!232526))))

(declare-datatypes ((array!20591 0))(
  ( (array!20592 (arr!10053 (Array (_ BitVec 32) (_ BitVec 8))) (size!8961 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14084 0))(
  ( (BitStream!14085 (buf!8103 array!20591) (currentByte!14959 (_ BitVec 32)) (currentBit!14954 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14084)

(declare-datatypes ((tuple2!23602 0))(
  ( (tuple2!23603 (_1!13430 (_ BitVec 64)) (_2!13430 BitStream!14084)) )
))
(declare-fun lt!445491 () tuple2!23602)

(declare-fun lt!445493 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322708 (= res!264909 (= (bitIndex!0 (size!8961 (buf!8103 (_2!13430 lt!445491))) (currentByte!14959 (_2!13430 lt!445491)) (currentBit!14954 (_2!13430 lt!445491))) (bvadd (bitIndex!0 (size!8961 (buf!8103 thiss!1793)) (currentByte!14959 thiss!1793) (currentBit!14954 thiss!1793)) lt!445493)))))

(declare-fun b!322709 () Bool)

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!322709 (= e!232526 (bvsgt i!743 #b00000000000000000000000001000000))))

(declare-fun res!264910 () Bool)

(declare-fun e!232524 () Bool)

(assert (=> start!71970 (=> (not res!264910) (not e!232524))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71970 (= res!264910 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71970 e!232524))

(assert (=> start!71970 true))

(declare-fun e!232527 () Bool)

(declare-fun inv!12 (BitStream!14084) Bool)

(assert (=> start!71970 (and (inv!12 thiss!1793) e!232527)))

(declare-fun b!322710 () Bool)

(declare-fun e!232523 () Bool)

(assert (=> b!322710 (= e!232523 e!232526)))

(declare-fun res!264907 () Bool)

(assert (=> b!322710 (=> (not res!264907) (not e!232526))))

(assert (=> b!322710 (= res!264907 (= (buf!8103 (_2!13430 lt!445491)) (buf!8103 thiss!1793)))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((tuple2!23604 0))(
  ( (tuple2!23605 (_1!13431 Bool) (_2!13431 BitStream!14084)) )
))
(declare-fun lt!445492 () tuple2!23604)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23602)

(assert (=> b!322710 (= lt!445491 (readNBitsLSBFirstsLoop!0 (_2!13431 lt!445492) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13431 lt!445492) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14084) tuple2!23604)

(assert (=> b!322710 (= lt!445492 (readBit!0 thiss!1793))))

(declare-fun b!322711 () Bool)

(declare-fun array_inv!8513 (array!20591) Bool)

(assert (=> b!322711 (= e!232527 (array_inv!8513 (buf!8103 thiss!1793)))))

(declare-fun b!322712 () Bool)

(declare-fun res!264908 () Bool)

(assert (=> b!322712 (=> (not res!264908) (not e!232523))))

(assert (=> b!322712 (= res!264908 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322713 () Bool)

(assert (=> b!322713 (= e!232524 e!232523)))

(declare-fun res!264905 () Bool)

(assert (=> b!322713 (=> (not res!264905) (not e!232523))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322713 (= res!264905 (validate_offset_bits!1 ((_ sign_extend 32) (size!8961 (buf!8103 thiss!1793))) ((_ sign_extend 32) (currentByte!14959 thiss!1793)) ((_ sign_extend 32) (currentBit!14954 thiss!1793)) lt!445493))))

(assert (=> b!322713 (= lt!445493 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!322714 () Bool)

(declare-fun res!264906 () Bool)

(assert (=> b!322714 (=> (not res!264906) (not e!232523))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322714 (= res!264906 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!71970 res!264910) b!322713))

(assert (= (and b!322713 res!264905) b!322714))

(assert (= (and b!322714 res!264906) b!322712))

(assert (= (and b!322712 res!264908) b!322710))

(assert (= (and b!322710 res!264907) b!322708))

(assert (= (and b!322708 res!264909) b!322709))

(assert (= start!71970 b!322711))

(declare-fun m!460979 () Bool)

(assert (=> start!71970 m!460979))

(declare-fun m!460981 () Bool)

(assert (=> b!322708 m!460981))

(declare-fun m!460983 () Bool)

(assert (=> b!322708 m!460983))

(declare-fun m!460985 () Bool)

(assert (=> b!322714 m!460985))

(declare-fun m!460987 () Bool)

(assert (=> b!322710 m!460987))

(declare-fun m!460989 () Bool)

(assert (=> b!322710 m!460989))

(declare-fun m!460991 () Bool)

(assert (=> b!322713 m!460991))

(declare-fun m!460993 () Bool)

(assert (=> b!322711 m!460993))

(push 1)

(assert (not b!322711))

(assert (not start!71970))

(assert (not b!322714))

(assert (not b!322713))

(assert (not b!322708))

(assert (not b!322710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

