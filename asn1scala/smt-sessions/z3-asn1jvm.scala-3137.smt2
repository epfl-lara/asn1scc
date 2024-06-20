; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72076 () Bool)

(assert start!72076)

(declare-fun b!323205 () Bool)

(declare-fun e!232864 () Bool)

(declare-datatypes ((array!20640 0))(
  ( (array!20641 (arr!10076 (Array (_ BitVec 32) (_ BitVec 8))) (size!8984 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14130 0))(
  ( (BitStream!14131 (buf!8126 array!20640) (currentByte!14991 (_ BitVec 32)) (currentBit!14986 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14130)

(declare-fun array_inv!8536 (array!20640) Bool)

(assert (=> b!323205 (= e!232864 (array_inv!8536 (buf!8126 thiss!1793)))))

(declare-fun b!323206 () Bool)

(declare-fun res!265317 () Bool)

(declare-fun e!232866 () Bool)

(assert (=> b!323206 (=> (not res!265317) (not e!232866))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323206 (= res!265317 (validate_offset_bits!1 ((_ sign_extend 32) (size!8984 (buf!8126 thiss!1793))) ((_ sign_extend 32) (currentByte!14991 thiss!1793)) ((_ sign_extend 32) (currentBit!14986 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323207 () Bool)

(assert (=> b!323207 (= e!232866 false)))

(declare-fun lt!445823 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323207 (= lt!445823 (bitIndex!0 (size!8984 (buf!8126 thiss!1793)) (currentByte!14991 thiss!1793) (currentBit!14986 thiss!1793)))))

(declare-fun b!323208 () Bool)

(declare-fun res!265315 () Bool)

(assert (=> b!323208 (=> (not res!265315) (not e!232866))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323208 (= res!265315 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!323209 () Bool)

(declare-fun res!265318 () Bool)

(assert (=> b!323209 (=> (not res!265318) (not e!232866))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323209 (= res!265318 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!265316 () Bool)

(assert (=> start!72076 (=> (not res!265316) (not e!232866))))

(assert (=> start!72076 (= res!265316 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72076 e!232866))

(assert (=> start!72076 true))

(declare-fun inv!12 (BitStream!14130) Bool)

(assert (=> start!72076 (and (inv!12 thiss!1793) e!232864)))

(assert (= (and start!72076 res!265316) b!323206))

(assert (= (and b!323206 res!265317) b!323209))

(assert (= (and b!323209 res!265318) b!323208))

(assert (= (and b!323208 res!265315) b!323207))

(assert (= start!72076 b!323205))

(declare-fun m!461359 () Bool)

(assert (=> start!72076 m!461359))

(declare-fun m!461361 () Bool)

(assert (=> b!323207 m!461361))

(declare-fun m!461363 () Bool)

(assert (=> b!323206 m!461363))

(declare-fun m!461365 () Bool)

(assert (=> b!323205 m!461365))

(declare-fun m!461367 () Bool)

(assert (=> b!323209 m!461367))

(check-sat (not b!323206) (not b!323205) (not start!72076) (not b!323209) (not b!323207))
