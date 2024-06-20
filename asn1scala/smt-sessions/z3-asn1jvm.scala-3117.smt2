; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71662 () Bool)

(assert start!71662)

(declare-fun b!321828 () Bool)

(declare-fun e!231929 () Bool)

(declare-fun e!231928 () Bool)

(assert (=> b!321828 (= e!231929 e!231928)))

(declare-fun res!264170 () Bool)

(assert (=> b!321828 (=> (not res!264170) (not e!231928))))

(declare-datatypes ((array!20508 0))(
  ( (array!20509 (arr!10019 (Array (_ BitVec 32) (_ BitVec 8))) (size!8927 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14016 0))(
  ( (BitStream!14017 (buf!8069 array!20508) (currentByte!14880 (_ BitVec 32)) (currentBit!14875 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14016)

(declare-fun lt!444655 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321828 (= res!264170 (validate_offset_bits!1 ((_ sign_extend 32) (size!8927 (buf!8069 thiss!1793))) ((_ sign_extend 32) (currentByte!14880 thiss!1793)) ((_ sign_extend 32) (currentBit!14875 thiss!1793)) lt!444655))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!321828 (= lt!444655 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!321829 () Bool)

(declare-fun e!231930 () Bool)

(declare-fun array_inv!8479 (array!20508) Bool)

(assert (=> b!321829 (= e!231930 (array_inv!8479 (buf!8069 thiss!1793)))))

(declare-fun b!321830 () Bool)

(declare-fun res!264169 () Bool)

(assert (=> b!321830 (=> (not res!264169) (not e!231928))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321830 (= res!264169 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264172 () Bool)

(assert (=> start!71662 (=> (not res!264172) (not e!231929))))

(assert (=> start!71662 (= res!264172 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71662 e!231929))

(assert (=> start!71662 true))

(declare-fun inv!12 (BitStream!14016) Bool)

(assert (=> start!71662 (and (inv!12 thiss!1793) e!231930)))

(declare-fun b!321831 () Bool)

(declare-fun lt!444656 () (_ BitVec 64))

(assert (=> b!321831 (= e!231928 (and (= lt!444656 (bvadd lt!444656 lt!444655)) (bvsgt i!743 #b00000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321831 (= lt!444656 (bitIndex!0 (size!8927 (buf!8069 thiss!1793)) (currentByte!14880 thiss!1793) (currentBit!14875 thiss!1793)))))

(declare-fun b!321832 () Bool)

(declare-fun res!264171 () Bool)

(assert (=> b!321832 (=> (not res!264171) (not e!231928))))

(assert (=> b!321832 (= res!264171 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(assert (= (and start!71662 res!264172) b!321828))

(assert (= (and b!321828 res!264170) b!321830))

(assert (= (and b!321830 res!264169) b!321832))

(assert (= (and b!321832 res!264171) b!321831))

(assert (= start!71662 b!321829))

(declare-fun m!460141 () Bool)

(assert (=> b!321829 m!460141))

(declare-fun m!460143 () Bool)

(assert (=> start!71662 m!460143))

(declare-fun m!460145 () Bool)

(assert (=> b!321828 m!460145))

(declare-fun m!460147 () Bool)

(assert (=> b!321830 m!460147))

(declare-fun m!460149 () Bool)

(assert (=> b!321831 m!460149))

(check-sat (not b!321829) (not b!321831) (not start!71662) (not b!321828) (not b!321830))
(check-sat)
