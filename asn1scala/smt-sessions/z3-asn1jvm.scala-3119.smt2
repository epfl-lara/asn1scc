; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71674 () Bool)

(assert start!71674)

(declare-fun b!321918 () Bool)

(declare-fun res!264241 () Bool)

(declare-fun e!232000 () Bool)

(assert (=> b!321918 (=> (not res!264241) (not e!232000))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321918 (= res!264241 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264243 () Bool)

(declare-fun e!232001 () Bool)

(assert (=> start!71674 (=> (not res!264243) (not e!232001))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71674 (= res!264243 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71674 e!232001))

(assert (=> start!71674 true))

(declare-datatypes ((array!20520 0))(
  ( (array!20521 (arr!10025 (Array (_ BitVec 32) (_ BitVec 8))) (size!8933 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14028 0))(
  ( (BitStream!14029 (buf!8075 array!20520) (currentByte!14886 (_ BitVec 32)) (currentBit!14881 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14028)

(declare-fun e!232002 () Bool)

(declare-fun inv!12 (BitStream!14028) Bool)

(assert (=> start!71674 (and (inv!12 thiss!1793) e!232002)))

(declare-fun b!321919 () Bool)

(declare-fun res!264244 () Bool)

(assert (=> b!321919 (=> (not res!264244) (not e!232000))))

(assert (=> b!321919 (= res!264244 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321920 () Bool)

(assert (=> b!321920 (= e!232001 e!232000)))

(declare-fun res!264242 () Bool)

(assert (=> b!321920 (=> (not res!264242) (not e!232000))))

(declare-fun lt!444692 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321920 (= res!264242 (validate_offset_bits!1 ((_ sign_extend 32) (size!8933 (buf!8075 thiss!1793))) ((_ sign_extend 32) (currentByte!14886 thiss!1793)) ((_ sign_extend 32) (currentBit!14881 thiss!1793)) lt!444692))))

(assert (=> b!321920 (= lt!444692 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!321921 () Bool)

(declare-fun array_inv!8485 (array!20520) Bool)

(assert (=> b!321921 (= e!232002 (array_inv!8485 (buf!8075 thiss!1793)))))

(declare-fun b!321922 () Bool)

(declare-fun lt!444691 () (_ BitVec 64))

(assert (=> b!321922 (= e!232000 (and (= lt!444691 (bvadd lt!444691 lt!444692)) (bvsgt #b00000000000000000000000000000000 nBits!548)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321922 (= lt!444691 (bitIndex!0 (size!8933 (buf!8075 thiss!1793)) (currentByte!14886 thiss!1793) (currentBit!14881 thiss!1793)))))

(assert (= (and start!71674 res!264243) b!321920))

(assert (= (and b!321920 res!264242) b!321918))

(assert (= (and b!321918 res!264241) b!321919))

(assert (= (and b!321919 res!264244) b!321922))

(assert (= start!71674 b!321921))

(declare-fun m!460201 () Bool)

(assert (=> start!71674 m!460201))

(declare-fun m!460203 () Bool)

(assert (=> b!321918 m!460203))

(declare-fun m!460205 () Bool)

(assert (=> b!321920 m!460205))

(declare-fun m!460207 () Bool)

(assert (=> b!321921 m!460207))

(declare-fun m!460209 () Bool)

(assert (=> b!321922 m!460209))

(check-sat (not b!321918) (not b!321922) (not b!321921) (not b!321920) (not start!71674))
(check-sat)
