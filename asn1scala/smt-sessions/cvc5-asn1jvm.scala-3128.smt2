; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71966 () Bool)

(assert start!71966)

(declare-fun b!322666 () Bool)

(declare-fun e!232494 () Bool)

(declare-fun e!232493 () Bool)

(assert (=> b!322666 (= e!232494 e!232493)))

(declare-fun res!264874 () Bool)

(assert (=> b!322666 (=> (not res!264874) (not e!232493))))

(declare-datatypes ((array!20587 0))(
  ( (array!20588 (arr!10051 (Array (_ BitVec 32) (_ BitVec 8))) (size!8959 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14080 0))(
  ( (BitStream!14081 (buf!8101 array!20587) (currentByte!14957 (_ BitVec 32)) (currentBit!14952 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14080)

(declare-fun lt!445474 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322666 (= res!264874 (validate_offset_bits!1 ((_ sign_extend 32) (size!8959 (buf!8101 thiss!1793))) ((_ sign_extend 32) (currentByte!14957 thiss!1793)) ((_ sign_extend 32) (currentBit!14952 thiss!1793)) lt!445474))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!322666 (= lt!445474 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!322667 () Bool)

(declare-fun res!264871 () Bool)

(assert (=> b!322667 (=> (not res!264871) (not e!232493))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322667 (= res!264871 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322668 () Bool)

(declare-fun res!264870 () Bool)

(declare-fun e!232495 () Bool)

(assert (=> b!322668 (=> (not res!264870) (not e!232495))))

(declare-datatypes ((tuple2!23594 0))(
  ( (tuple2!23595 (_1!13426 (_ BitVec 64)) (_2!13426 BitStream!14080)) )
))
(declare-fun lt!445475 () tuple2!23594)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322668 (= res!264870 (= (bitIndex!0 (size!8959 (buf!8101 (_2!13426 lt!445475))) (currentByte!14957 (_2!13426 lt!445475)) (currentBit!14952 (_2!13426 lt!445475))) (bvadd (bitIndex!0 (size!8959 (buf!8101 thiss!1793)) (currentByte!14957 thiss!1793) (currentBit!14952 thiss!1793)) lt!445474)))))

(declare-fun b!322669 () Bool)

(declare-fun e!232497 () Bool)

(declare-fun array_inv!8511 (array!20587) Bool)

(assert (=> b!322669 (= e!232497 (array_inv!8511 (buf!8101 thiss!1793)))))

(declare-fun res!264873 () Bool)

(assert (=> start!71966 (=> (not res!264873) (not e!232494))))

(assert (=> start!71966 (= res!264873 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71966 e!232494))

(assert (=> start!71966 true))

(declare-fun inv!12 (BitStream!14080) Bool)

(assert (=> start!71966 (and (inv!12 thiss!1793) e!232497)))

(declare-fun b!322670 () Bool)

(declare-fun res!264869 () Bool)

(assert (=> b!322670 (=> (not res!264869) (not e!232493))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322670 (= res!264869 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322671 () Bool)

(assert (=> b!322671 (= e!232493 e!232495)))

(declare-fun res!264872 () Bool)

(assert (=> b!322671 (=> (not res!264872) (not e!232495))))

(assert (=> b!322671 (= res!264872 (= (buf!8101 (_2!13426 lt!445475)) (buf!8101 thiss!1793)))))

(declare-datatypes ((tuple2!23596 0))(
  ( (tuple2!23597 (_1!13427 Bool) (_2!13427 BitStream!14080)) )
))
(declare-fun lt!445473 () tuple2!23596)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23594)

(assert (=> b!322671 (= lt!445475 (readNBitsLSBFirstsLoop!0 (_2!13427 lt!445473) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13427 lt!445473) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14080) tuple2!23596)

(assert (=> b!322671 (= lt!445473 (readBit!0 thiss!1793))))

(declare-fun b!322672 () Bool)

(assert (=> b!322672 (= e!232495 (bvsgt i!743 #b00000000000000000000000001000000))))

(assert (= (and start!71966 res!264873) b!322666))

(assert (= (and b!322666 res!264874) b!322670))

(assert (= (and b!322670 res!264869) b!322667))

(assert (= (and b!322667 res!264871) b!322671))

(assert (= (and b!322671 res!264872) b!322668))

(assert (= (and b!322668 res!264870) b!322672))

(assert (= start!71966 b!322669))

(declare-fun m!460947 () Bool)

(assert (=> b!322669 m!460947))

(declare-fun m!460949 () Bool)

(assert (=> b!322666 m!460949))

(declare-fun m!460951 () Bool)

(assert (=> b!322668 m!460951))

(declare-fun m!460953 () Bool)

(assert (=> b!322668 m!460953))

(declare-fun m!460955 () Bool)

(assert (=> b!322671 m!460955))

(declare-fun m!460957 () Bool)

(assert (=> b!322671 m!460957))

(declare-fun m!460959 () Bool)

(assert (=> start!71966 m!460959))

(declare-fun m!460961 () Bool)

(assert (=> b!322670 m!460961))

(push 1)

(assert (not b!322666))

(assert (not b!322668))

(assert (not b!322670))

(assert (not b!322671))

(assert (not start!71966))

(assert (not b!322669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

