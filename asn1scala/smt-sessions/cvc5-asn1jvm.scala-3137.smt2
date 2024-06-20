; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72074 () Bool)

(assert start!72074)

(declare-fun b!323190 () Bool)

(declare-fun res!265304 () Bool)

(declare-fun e!232857 () Bool)

(assert (=> b!323190 (=> (not res!265304) (not e!232857))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20638 0))(
  ( (array!20639 (arr!10075 (Array (_ BitVec 32) (_ BitVec 8))) (size!8983 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14128 0))(
  ( (BitStream!14129 (buf!8125 array!20638) (currentByte!14990 (_ BitVec 32)) (currentBit!14985 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14128)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323190 (= res!265304 (validate_offset_bits!1 ((_ sign_extend 32) (size!8983 (buf!8125 thiss!1793))) ((_ sign_extend 32) (currentByte!14990 thiss!1793)) ((_ sign_extend 32) (currentBit!14985 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323191 () Bool)

(assert (=> b!323191 (= e!232857 false)))

(declare-fun lt!445820 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323191 (= lt!445820 (bitIndex!0 (size!8983 (buf!8125 thiss!1793)) (currentByte!14990 thiss!1793) (currentBit!14985 thiss!1793)))))

(declare-fun b!323192 () Bool)

(declare-fun e!232855 () Bool)

(declare-fun array_inv!8535 (array!20638) Bool)

(assert (=> b!323192 (= e!232855 (array_inv!8535 (buf!8125 thiss!1793)))))

(declare-fun b!323193 () Bool)

(declare-fun res!265306 () Bool)

(assert (=> b!323193 (=> (not res!265306) (not e!232857))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323193 (= res!265306 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun res!265305 () Bool)

(assert (=> start!72074 (=> (not res!265305) (not e!232857))))

(assert (=> start!72074 (= res!265305 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72074 e!232857))

(assert (=> start!72074 true))

(declare-fun inv!12 (BitStream!14128) Bool)

(assert (=> start!72074 (and (inv!12 thiss!1793) e!232855)))

(declare-fun b!323194 () Bool)

(declare-fun res!265303 () Bool)

(assert (=> b!323194 (=> (not res!265303) (not e!232857))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323194 (= res!265303 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!72074 res!265305) b!323190))

(assert (= (and b!323190 res!265304) b!323194))

(assert (= (and b!323194 res!265303) b!323193))

(assert (= (and b!323193 res!265306) b!323191))

(assert (= start!72074 b!323192))

(declare-fun m!461349 () Bool)

(assert (=> start!72074 m!461349))

(declare-fun m!461351 () Bool)

(assert (=> b!323194 m!461351))

(declare-fun m!461353 () Bool)

(assert (=> b!323190 m!461353))

(declare-fun m!461355 () Bool)

(assert (=> b!323191 m!461355))

(declare-fun m!461357 () Bool)

(assert (=> b!323192 m!461357))

(push 1)

(assert (not start!72074))

(assert (not b!323190))

(assert (not b!323194))

(assert (not b!323191))

(assert (not b!323192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

