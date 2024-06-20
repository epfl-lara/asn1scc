; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72124 () Bool)

(assert start!72124)

(declare-fun b!323327 () Bool)

(declare-fun res!265423 () Bool)

(declare-fun e!232945 () Bool)

(assert (=> b!323327 (=> (not res!265423) (not e!232945))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323327 (= res!265423 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun res!265419 () Bool)

(assert (=> start!72124 (=> (not res!265419) (not e!232945))))

(assert (=> start!72124 (= res!265419 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72124 e!232945))

(assert (=> start!72124 true))

(declare-datatypes ((array!20655 0))(
  ( (array!20656 (arr!10082 (Array (_ BitVec 32) (_ BitVec 8))) (size!8990 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14142 0))(
  ( (BitStream!14143 (buf!8132 array!20655) (currentByte!15003 (_ BitVec 32)) (currentBit!14998 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14142)

(declare-fun e!232947 () Bool)

(declare-fun inv!12 (BitStream!14142) Bool)

(assert (=> start!72124 (and (inv!12 thiss!1793) e!232947)))

(declare-fun b!323328 () Bool)

(assert (=> b!323328 (= e!232945 (or (bvslt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun b!323329 () Bool)

(declare-fun array_inv!8542 (array!20655) Bool)

(assert (=> b!323329 (= e!232947 (array_inv!8542 (buf!8132 thiss!1793)))))

(declare-fun b!323330 () Bool)

(declare-fun res!265420 () Bool)

(assert (=> b!323330 (=> (not res!265420) (not e!232945))))

(declare-datatypes ((tuple2!23656 0))(
  ( (tuple2!23657 (_1!13457 Bool) (_2!13457 BitStream!14142)) )
))
(declare-fun readBit!0 (BitStream!14142) tuple2!23656)

(assert (=> b!323330 (= res!265420 (_1!13457 (readBit!0 thiss!1793)))))

(declare-fun b!323331 () Bool)

(declare-fun res!265421 () Bool)

(assert (=> b!323331 (=> (not res!265421) (not e!232945))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323331 (= res!265421 (validate_offset_bits!1 ((_ sign_extend 32) (size!8990 (buf!8132 thiss!1793))) ((_ sign_extend 32) (currentByte!15003 thiss!1793)) ((_ sign_extend 32) (currentBit!14998 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323332 () Bool)

(declare-fun res!265422 () Bool)

(assert (=> b!323332 (=> (not res!265422) (not e!232945))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323332 (= res!265422 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!72124 res!265419) b!323331))

(assert (= (and b!323331 res!265421) b!323332))

(assert (= (and b!323332 res!265422) b!323327))

(assert (= (and b!323327 res!265423) b!323330))

(assert (= (and b!323330 res!265420) b!323328))

(assert (= start!72124 b!323329))

(declare-fun m!461437 () Bool)

(assert (=> b!323329 m!461437))

(declare-fun m!461439 () Bool)

(assert (=> b!323331 m!461439))

(declare-fun m!461441 () Bool)

(assert (=> b!323332 m!461441))

(declare-fun m!461443 () Bool)

(assert (=> start!72124 m!461443))

(declare-fun m!461445 () Bool)

(assert (=> b!323330 m!461445))

(check-sat (not b!323331) (not b!323329) (not b!323332) (not start!72124) (not b!323330))
(check-sat)
