; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72058 () Bool)

(assert start!72058)

(declare-fun res!265213 () Bool)

(declare-fun e!232776 () Bool)

(assert (=> start!72058 (=> (not res!265213) (not e!232776))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72058 (= res!265213 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72058 e!232776))

(assert (=> start!72058 true))

(declare-datatypes ((array!20622 0))(
  ( (array!20623 (arr!10067 (Array (_ BitVec 32) (_ BitVec 8))) (size!8975 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14112 0))(
  ( (BitStream!14113 (buf!8117 array!20622) (currentByte!14982 (_ BitVec 32)) (currentBit!14977 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14112)

(declare-fun e!232774 () Bool)

(declare-fun inv!12 (BitStream!14112) Bool)

(assert (=> start!72058 (and (inv!12 thiss!1793) e!232774)))

(declare-fun b!323074 () Bool)

(declare-fun res!265211 () Bool)

(assert (=> b!323074 (=> (not res!265211) (not e!232776))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323074 (= res!265211 (validate_offset_bits!1 ((_ sign_extend 32) (size!8975 (buf!8117 thiss!1793))) ((_ sign_extend 32) (currentByte!14982 thiss!1793)) ((_ sign_extend 32) (currentBit!14977 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323077 () Bool)

(declare-fun array_inv!8527 (array!20622) Bool)

(assert (=> b!323077 (= e!232774 (array_inv!8527 (buf!8117 thiss!1793)))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun b!323076 () Bool)

(assert (=> b!323076 (= e!232776 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000)))))))

(declare-fun b!323075 () Bool)

(declare-fun res!265212 () Bool)

(assert (=> b!323075 (=> (not res!265212) (not e!232776))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323075 (= res!265212 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!72058 res!265213) b!323074))

(assert (= (and b!323074 res!265211) b!323075))

(assert (= (and b!323075 res!265212) b!323076))

(assert (= start!72058 b!323077))

(declare-fun m!461273 () Bool)

(assert (=> start!72058 m!461273))

(declare-fun m!461275 () Bool)

(assert (=> b!323074 m!461275))

(declare-fun m!461277 () Bool)

(assert (=> b!323077 m!461277))

(declare-fun m!461279 () Bool)

(assert (=> b!323075 m!461279))

(check-sat (not b!323077) (not b!323074) (not start!72058) (not b!323075))
(check-sat)
