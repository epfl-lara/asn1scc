; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71980 () Bool)

(assert start!71980)

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun e!232599 () Bool)

(declare-datatypes ((array!20601 0))(
  ( (array!20602 (arr!10058 (Array (_ BitVec 32) (_ BitVec 8))) (size!8966 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14094 0))(
  ( (BitStream!14095 (buf!8108 array!20601) (currentByte!14964 (_ BitVec 32)) (currentBit!14959 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23622 0))(
  ( (tuple2!23623 (_1!13440 (_ BitVec 64)) (_2!13440 BitStream!14094)) )
))
(declare-fun lt!445543 () tuple2!23622)

(declare-fun lt!445544 () (_ BitVec 64))

(declare-fun b!322813 () Bool)

(assert (=> b!322813 (= e!232599 (and (= (bvand (_1!13440 lt!445543) lt!445544) (bvand acc!161 lt!445544)) (bvsgt #b00000000000000000000000000000000 nBits!548)))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322813 (= lt!445544 (onesLSBLong!0 i!743))))

(declare-fun b!322814 () Bool)

(declare-fun res!264998 () Bool)

(declare-fun e!232602 () Bool)

(assert (=> b!322814 (=> (not res!264998) (not e!232602))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322814 (= res!264998 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322815 () Bool)

(declare-fun res!264996 () Bool)

(assert (=> b!322815 (=> (not res!264996) (not e!232602))))

(assert (=> b!322815 (= res!264996 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322816 () Bool)

(declare-fun res!265000 () Bool)

(assert (=> b!322816 (=> (not res!265000) (not e!232599))))

(declare-fun thiss!1793 () BitStream!14094)

(declare-fun lt!445542 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322816 (= res!265000 (= (bitIndex!0 (size!8966 (buf!8108 (_2!13440 lt!445543))) (currentByte!14964 (_2!13440 lt!445543)) (currentBit!14959 (_2!13440 lt!445543))) (bvadd (bitIndex!0 (size!8966 (buf!8108 thiss!1793)) (currentByte!14964 thiss!1793) (currentBit!14959 thiss!1793)) lt!445542)))))

(declare-fun b!322817 () Bool)

(assert (=> b!322817 (= e!232602 e!232599)))

(declare-fun res!264995 () Bool)

(assert (=> b!322817 (=> (not res!264995) (not e!232599))))

(assert (=> b!322817 (= res!264995 (= (buf!8108 (_2!13440 lt!445543)) (buf!8108 thiss!1793)))))

(declare-datatypes ((tuple2!23624 0))(
  ( (tuple2!23625 (_1!13441 Bool) (_2!13441 BitStream!14094)) )
))
(declare-fun lt!445541 () tuple2!23624)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23622)

(assert (=> b!322817 (= lt!445543 (readNBitsLSBFirstsLoop!0 (_2!13441 lt!445541) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13441 lt!445541) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14094) tuple2!23624)

(assert (=> b!322817 (= lt!445541 (readBit!0 thiss!1793))))

(declare-fun b!322818 () Bool)

(declare-fun e!232601 () Bool)

(declare-fun array_inv!8518 (array!20601) Bool)

(assert (=> b!322818 (= e!232601 (array_inv!8518 (buf!8108 thiss!1793)))))

(declare-fun res!264997 () Bool)

(declare-fun e!232598 () Bool)

(assert (=> start!71980 (=> (not res!264997) (not e!232598))))

(assert (=> start!71980 (= res!264997 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71980 e!232598))

(assert (=> start!71980 true))

(declare-fun inv!12 (BitStream!14094) Bool)

(assert (=> start!71980 (and (inv!12 thiss!1793) e!232601)))

(declare-fun b!322819 () Bool)

(assert (=> b!322819 (= e!232598 e!232602)))

(declare-fun res!264999 () Bool)

(assert (=> b!322819 (=> (not res!264999) (not e!232602))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322819 (= res!264999 (validate_offset_bits!1 ((_ sign_extend 32) (size!8966 (buf!8108 thiss!1793))) ((_ sign_extend 32) (currentByte!14964 thiss!1793)) ((_ sign_extend 32) (currentBit!14959 thiss!1793)) lt!445542))))

(assert (=> b!322819 (= lt!445542 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(assert (= (and start!71980 res!264997) b!322819))

(assert (= (and b!322819 res!264999) b!322814))

(assert (= (and b!322814 res!264998) b!322815))

(assert (= (and b!322815 res!264996) b!322817))

(assert (= (and b!322817 res!264995) b!322816))

(assert (= (and b!322816 res!265000) b!322813))

(assert (= start!71980 b!322818))

(declare-fun m!461061 () Bool)

(assert (=> start!71980 m!461061))

(declare-fun m!461063 () Bool)

(assert (=> b!322819 m!461063))

(declare-fun m!461065 () Bool)

(assert (=> b!322813 m!461065))

(declare-fun m!461067 () Bool)

(assert (=> b!322816 m!461067))

(declare-fun m!461069 () Bool)

(assert (=> b!322816 m!461069))

(declare-fun m!461071 () Bool)

(assert (=> b!322814 m!461071))

(declare-fun m!461073 () Bool)

(assert (=> b!322817 m!461073))

(declare-fun m!461075 () Bool)

(assert (=> b!322817 m!461075))

(declare-fun m!461077 () Bool)

(assert (=> b!322818 m!461077))

(check-sat (not b!322818) (not b!322817) (not b!322813) (not b!322814) (not b!322816) (not b!322819) (not start!71980))
(check-sat)
