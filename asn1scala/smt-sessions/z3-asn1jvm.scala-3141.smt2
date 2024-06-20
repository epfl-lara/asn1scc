; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72136 () Bool)

(assert start!72136)

(declare-fun res!265497 () Bool)

(declare-fun e!232999 () Bool)

(assert (=> start!72136 (=> (not res!265497) (not e!232999))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72136 (= res!265497 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72136 e!232999))

(assert (=> start!72136 true))

(declare-datatypes ((array!20667 0))(
  ( (array!20668 (arr!10088 (Array (_ BitVec 32) (_ BitVec 8))) (size!8996 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14154 0))(
  ( (BitStream!14155 (buf!8138 array!20667) (currentByte!15009 (_ BitVec 32)) (currentBit!15004 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14154)

(declare-fun e!233000 () Bool)

(declare-fun inv!12 (BitStream!14154) Bool)

(assert (=> start!72136 (and (inv!12 thiss!1793) e!233000)))

(declare-fun b!323421 () Bool)

(declare-fun res!265495 () Bool)

(assert (=> b!323421 (=> (not res!265495) (not e!232999))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323421 (= res!265495 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323422 () Bool)

(declare-fun res!265496 () Bool)

(assert (=> b!323422 (=> (not res!265496) (not e!232999))))

(assert (=> b!323422 (= res!265496 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323423 () Bool)

(declare-fun array_inv!8548 (array!20667) Bool)

(assert (=> b!323423 (= e!233000 (array_inv!8548 (buf!8138 thiss!1793)))))

(declare-fun b!323424 () Bool)

(assert (=> b!323424 (= e!232999 (bvsge (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) (bvsub nBits!548 i!743)))))

(declare-datatypes ((tuple2!23668 0))(
  ( (tuple2!23669 (_1!13463 Bool) (_2!13463 BitStream!14154)) )
))
(declare-fun lt!445913 () tuple2!23668)

(declare-fun readBit!0 (BitStream!14154) tuple2!23668)

(assert (=> b!323424 (= lt!445913 (readBit!0 thiss!1793))))

(declare-fun b!323425 () Bool)

(declare-fun res!265498 () Bool)

(assert (=> b!323425 (=> (not res!265498) (not e!232999))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323425 (= res!265498 (validate_offset_bits!1 ((_ sign_extend 32) (size!8996 (buf!8138 thiss!1793))) ((_ sign_extend 32) (currentByte!15009 thiss!1793)) ((_ sign_extend 32) (currentBit!15004 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(assert (= (and start!72136 res!265497) b!323425))

(assert (= (and b!323425 res!265498) b!323421))

(assert (= (and b!323421 res!265495) b!323422))

(assert (= (and b!323422 res!265496) b!323424))

(assert (= start!72136 b!323423))

(declare-fun m!461497 () Bool)

(assert (=> b!323421 m!461497))

(declare-fun m!461499 () Bool)

(assert (=> b!323425 m!461499))

(declare-fun m!461501 () Bool)

(assert (=> start!72136 m!461501))

(declare-fun m!461503 () Bool)

(assert (=> b!323424 m!461503))

(declare-fun m!461505 () Bool)

(assert (=> b!323423 m!461505))

(check-sat (not b!323425) (not b!323423) (not b!323421) (not b!323424) (not start!72136))
(check-sat)
