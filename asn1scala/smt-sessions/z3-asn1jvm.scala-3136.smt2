; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72070 () Bool)

(assert start!72070)

(declare-fun b!323160 () Bool)

(declare-fun res!265282 () Bool)

(declare-fun e!232833 () Bool)

(assert (=> b!323160 (=> (not res!265282) (not e!232833))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323160 (= res!265282 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun lt!445808 () (_ BitVec 64))

(declare-fun lt!445806 () (_ BitVec 64))

(declare-fun b!323161 () Bool)

(declare-fun lt!445807 () (_ BitVec 64))

(assert (=> b!323161 (= e!232833 (and (= lt!445808 (bvand lt!445807 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!445808 (bvand (bvadd lt!445806 lt!445807) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!323161 (= lt!445808 (bvand lt!445806 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!20634 0))(
  ( (array!20635 (arr!10073 (Array (_ BitVec 32) (_ BitVec 8))) (size!8981 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14124 0))(
  ( (BitStream!14125 (buf!8123 array!20634) (currentByte!14988 (_ BitVec 32)) (currentBit!14983 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14124)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323161 (= lt!445806 (bitIndex!0 (size!8981 (buf!8123 thiss!1793)) (currentByte!14988 thiss!1793) (currentBit!14983 thiss!1793)))))

(declare-fun b!323162 () Bool)

(declare-fun e!232834 () Bool)

(declare-fun array_inv!8533 (array!20634) Bool)

(assert (=> b!323162 (= e!232834 (array_inv!8533 (buf!8123 thiss!1793)))))

(declare-fun b!323163 () Bool)

(declare-fun e!232836 () Bool)

(assert (=> b!323163 (= e!232836 e!232833)))

(declare-fun res!265279 () Bool)

(assert (=> b!323163 (=> (not res!265279) (not e!232833))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323163 (= res!265279 (validate_offset_bits!1 ((_ sign_extend 32) (size!8981 (buf!8123 thiss!1793))) ((_ sign_extend 32) (currentByte!14988 thiss!1793)) ((_ sign_extend 32) (currentBit!14983 thiss!1793)) lt!445807))))

(assert (=> b!323163 (= lt!445807 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun res!265281 () Bool)

(assert (=> start!72070 (=> (not res!265281) (not e!232836))))

(assert (=> start!72070 (= res!265281 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72070 e!232836))

(assert (=> start!72070 true))

(declare-fun inv!12 (BitStream!14124) Bool)

(assert (=> start!72070 (and (inv!12 thiss!1793) e!232834)))

(declare-fun b!323164 () Bool)

(declare-fun res!265280 () Bool)

(assert (=> b!323164 (=> (not res!265280) (not e!232833))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323164 (= res!265280 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!72070 res!265281) b!323163))

(assert (= (and b!323163 res!265279) b!323164))

(assert (= (and b!323164 res!265280) b!323160))

(assert (= (and b!323160 res!265282) b!323161))

(assert (= start!72070 b!323162))

(declare-fun m!461329 () Bool)

(assert (=> b!323164 m!461329))

(declare-fun m!461331 () Bool)

(assert (=> b!323161 m!461331))

(declare-fun m!461333 () Bool)

(assert (=> start!72070 m!461333))

(declare-fun m!461335 () Bool)

(assert (=> b!323162 m!461335))

(declare-fun m!461337 () Bool)

(assert (=> b!323163 m!461337))

(check-sat (not b!323164) (not b!323163) (not b!323161) (not start!72070) (not b!323162))
(check-sat)
