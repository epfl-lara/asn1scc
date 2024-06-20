; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72130 () Bool)

(assert start!72130)

(declare-fun b!323376 () Bool)

(declare-fun res!265459 () Bool)

(declare-fun e!232974 () Bool)

(assert (=> b!323376 (=> (not res!265459) (not e!232974))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323376 (= res!265459 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323377 () Bool)

(declare-fun res!265462 () Bool)

(assert (=> b!323377 (=> (not res!265462) (not e!232974))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20661 0))(
  ( (array!20662 (arr!10085 (Array (_ BitVec 32) (_ BitVec 8))) (size!8993 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14148 0))(
  ( (BitStream!14149 (buf!8135 array!20661) (currentByte!15006 (_ BitVec 32)) (currentBit!15001 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14148)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323377 (= res!265462 (validate_offset_bits!1 ((_ sign_extend 32) (size!8993 (buf!8135 thiss!1793))) ((_ sign_extend 32) (currentByte!15006 thiss!1793)) ((_ sign_extend 32) (currentBit!15001 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323378 () Bool)

(declare-fun e!232973 () Bool)

(declare-fun array_inv!8545 (array!20661) Bool)

(assert (=> b!323378 (= e!232973 (array_inv!8545 (buf!8135 thiss!1793)))))

(declare-fun b!323379 () Bool)

(declare-fun res!265461 () Bool)

(assert (=> b!323379 (=> (not res!265461) (not e!232974))))

(assert (=> b!323379 (= res!265461 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun res!265460 () Bool)

(assert (=> start!72130 (=> (not res!265460) (not e!232974))))

(assert (=> start!72130 (= res!265460 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72130 e!232974))

(assert (=> start!72130 true))

(declare-fun inv!12 (BitStream!14148) Bool)

(assert (=> start!72130 (and (inv!12 thiss!1793) e!232973)))

(declare-fun b!323380 () Bool)

(assert (=> b!323380 (= e!232974 (and (= (bvand i!743 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!743 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23662 0))(
  ( (tuple2!23663 (_1!13460 Bool) (_2!13460 BitStream!14148)) )
))
(declare-fun lt!445904 () tuple2!23662)

(declare-fun readBit!0 (BitStream!14148) tuple2!23662)

(assert (=> b!323380 (= lt!445904 (readBit!0 thiss!1793))))

(assert (= (and start!72130 res!265460) b!323377))

(assert (= (and b!323377 res!265462) b!323376))

(assert (= (and b!323376 res!265459) b!323379))

(assert (= (and b!323379 res!265461) b!323380))

(assert (= start!72130 b!323378))

(declare-fun m!461467 () Bool)

(assert (=> b!323377 m!461467))

(declare-fun m!461469 () Bool)

(assert (=> b!323378 m!461469))

(declare-fun m!461471 () Bool)

(assert (=> b!323376 m!461471))

(declare-fun m!461473 () Bool)

(assert (=> start!72130 m!461473))

(declare-fun m!461475 () Bool)

(assert (=> b!323380 m!461475))

(check-sat (not b!323377) (not start!72130) (not b!323376) (not b!323378) (not b!323380))
(check-sat)
