; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72064 () Bool)

(assert start!72064)

(declare-fun b!323115 () Bool)

(declare-fun e!232801 () Bool)

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!323115 (= e!232801 (and (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000)))))))

(declare-fun lt!445787 () (_ BitVec 64))

(declare-datatypes ((array!20628 0))(
  ( (array!20629 (arr!10070 (Array (_ BitVec 32) (_ BitVec 8))) (size!8978 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14118 0))(
  ( (BitStream!14119 (buf!8120 array!20628) (currentByte!14985 (_ BitVec 32)) (currentBit!14980 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14118)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323115 (= lt!445787 (bitIndex!0 (size!8978 (buf!8120 thiss!1793)) (currentByte!14985 thiss!1793) (currentBit!14980 thiss!1793)))))

(declare-fun res!265246 () Bool)

(assert (=> start!72064 (=> (not res!265246) (not e!232801))))

(assert (=> start!72064 (= res!265246 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72064 e!232801))

(assert (=> start!72064 true))

(declare-fun e!232803 () Bool)

(declare-fun inv!12 (BitStream!14118) Bool)

(assert (=> start!72064 (and (inv!12 thiss!1793) e!232803)))

(declare-fun b!323116 () Bool)

(declare-fun res!265245 () Bool)

(assert (=> b!323116 (=> (not res!265245) (not e!232801))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323116 (= res!265245 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323117 () Bool)

(declare-fun res!265244 () Bool)

(assert (=> b!323117 (=> (not res!265244) (not e!232801))))

(assert (=> b!323117 (= res!265244 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!323118 () Bool)

(declare-fun res!265243 () Bool)

(assert (=> b!323118 (=> (not res!265243) (not e!232801))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323118 (= res!265243 (validate_offset_bits!1 ((_ sign_extend 32) (size!8978 (buf!8120 thiss!1793))) ((_ sign_extend 32) (currentByte!14985 thiss!1793)) ((_ sign_extend 32) (currentBit!14980 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323119 () Bool)

(declare-fun array_inv!8530 (array!20628) Bool)

(assert (=> b!323119 (= e!232803 (array_inv!8530 (buf!8120 thiss!1793)))))

(assert (= (and start!72064 res!265246) b!323118))

(assert (= (and b!323118 res!265243) b!323116))

(assert (= (and b!323116 res!265245) b!323117))

(assert (= (and b!323117 res!265244) b!323115))

(assert (= start!72064 b!323119))

(declare-fun m!461299 () Bool)

(assert (=> b!323116 m!461299))

(declare-fun m!461301 () Bool)

(assert (=> b!323118 m!461301))

(declare-fun m!461303 () Bool)

(assert (=> b!323119 m!461303))

(declare-fun m!461305 () Bool)

(assert (=> b!323115 m!461305))

(declare-fun m!461307 () Bool)

(assert (=> start!72064 m!461307))

(check-sat (not b!323119) (not b!323118) (not b!323115) (not start!72064) (not b!323116))
