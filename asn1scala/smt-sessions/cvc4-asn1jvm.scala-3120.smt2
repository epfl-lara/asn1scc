; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71682 () Bool)

(assert start!71682)

(declare-fun b!321978 () Bool)

(declare-fun res!264291 () Bool)

(declare-fun e!232039 () Bool)

(assert (=> b!321978 (=> (not res!264291) (not e!232039))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20528 0))(
  ( (array!20529 (arr!10029 (Array (_ BitVec 32) (_ BitVec 8))) (size!8937 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14036 0))(
  ( (BitStream!14037 (buf!8079 array!20528) (currentByte!14890 (_ BitVec 32)) (currentBit!14885 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14036)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321978 (= res!264291 (validate_offset_bits!1 ((_ sign_extend 32) (size!8937 (buf!8079 thiss!1793))) ((_ sign_extend 32) (currentByte!14890 thiss!1793)) ((_ sign_extend 32) (currentBit!14885 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun res!264292 () Bool)

(assert (=> start!71682 (=> (not res!264292) (not e!232039))))

(assert (=> start!71682 (= res!264292 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71682 e!232039))

(assert (=> start!71682 true))

(declare-fun e!232041 () Bool)

(declare-fun inv!12 (BitStream!14036) Bool)

(assert (=> start!71682 (and (inv!12 thiss!1793) e!232041)))

(declare-fun b!321979 () Bool)

(declare-fun array_inv!8489 (array!20528) Bool)

(assert (=> b!321979 (= e!232041 (array_inv!8489 (buf!8079 thiss!1793)))))

(declare-fun b!321980 () Bool)

(declare-fun res!264289 () Bool)

(assert (=> b!321980 (=> (not res!264289) (not e!232039))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321980 (= res!264289 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321981 () Bool)

(declare-fun res!264290 () Bool)

(assert (=> b!321981 (=> (not res!264290) (not e!232039))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321981 (= res!264290 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321982 () Bool)

(assert (=> b!321982 (= e!232039 false)))

(declare-fun lt!444707 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321982 (= lt!444707 (bitIndex!0 (size!8937 (buf!8079 thiss!1793)) (currentByte!14890 thiss!1793) (currentBit!14885 thiss!1793)))))

(assert (= (and start!71682 res!264292) b!321978))

(assert (= (and b!321978 res!264291) b!321981))

(assert (= (and b!321981 res!264290) b!321980))

(assert (= (and b!321980 res!264289) b!321982))

(assert (= start!71682 b!321979))

(declare-fun m!460241 () Bool)

(assert (=> b!321982 m!460241))

(declare-fun m!460243 () Bool)

(assert (=> b!321978 m!460243))

(declare-fun m!460245 () Bool)

(assert (=> b!321979 m!460245))

(declare-fun m!460247 () Bool)

(assert (=> start!71682 m!460247))

(declare-fun m!460249 () Bool)

(assert (=> b!321981 m!460249))

(push 1)

(assert (not b!321981))

(assert (not b!321982))

(assert (not b!321979))

(assert (not b!321978))

(assert (not start!71682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

