; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72140 () Bool)

(assert start!72140)

(declare-fun b!323453 () Bool)

(declare-fun e!233021 () Bool)

(declare-datatypes ((array!20671 0))(
  ( (array!20672 (arr!10090 (Array (_ BitVec 32) (_ BitVec 8))) (size!8998 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14158 0))(
  ( (BitStream!14159 (buf!8140 array!20671) (currentByte!15011 (_ BitVec 32)) (currentBit!15006 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14158)

(declare-fun array_inv!8550 (array!20671) Bool)

(assert (=> b!323453 (= e!233021 (array_inv!8550 (buf!8140 thiss!1793)))))

(declare-fun b!323454 () Bool)

(declare-fun res!265525 () Bool)

(declare-fun e!233019 () Bool)

(assert (=> b!323454 (=> (not res!265525) (not e!233019))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323454 (= res!265525 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun res!265524 () Bool)

(assert (=> start!72140 (=> (not res!265524) (not e!233019))))

(assert (=> start!72140 (= res!265524 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72140 e!233019))

(assert (=> start!72140 true))

(declare-fun inv!12 (BitStream!14158) Bool)

(assert (=> start!72140 (and (inv!12 thiss!1793) e!233021)))

(declare-fun b!323455 () Bool)

(declare-fun res!265521 () Bool)

(assert (=> b!323455 (=> (not res!265521) (not e!233019))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323455 (= res!265521 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323456 () Bool)

(declare-fun e!233022 () Bool)

(assert (=> b!323456 (= e!233022 (and (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000)))))))

(declare-fun lt!445922 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323456 (= lt!445922 (bitIndex!0 (size!8998 (buf!8140 thiss!1793)) (currentByte!15011 thiss!1793) (currentBit!15006 thiss!1793)))))

(declare-fun b!323457 () Bool)

(assert (=> b!323457 (= e!233019 e!233022)))

(declare-fun res!265523 () Bool)

(assert (=> b!323457 (=> (not res!265523) (not e!233022))))

(declare-datatypes ((tuple2!23672 0))(
  ( (tuple2!23673 (_1!13465 Bool) (_2!13465 BitStream!14158)) )
))
(declare-fun lt!445921 () tuple2!23672)

(declare-datatypes ((tuple2!23674 0))(
  ( (tuple2!23675 (_1!13466 (_ BitVec 64)) (_2!13466 BitStream!14158)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23674)

(assert (=> b!323457 (= res!265523 (= (buf!8140 (_2!13466 (readNBitsLSBFirstsLoop!0 (_2!13465 lt!445921) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13465 lt!445921) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!8140 thiss!1793)))))

(declare-fun readBit!0 (BitStream!14158) tuple2!23672)

(assert (=> b!323457 (= lt!445921 (readBit!0 thiss!1793))))

(declare-fun b!323458 () Bool)

(declare-fun res!265522 () Bool)

(assert (=> b!323458 (=> (not res!265522) (not e!233019))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323458 (= res!265522 (validate_offset_bits!1 ((_ sign_extend 32) (size!8998 (buf!8140 thiss!1793))) ((_ sign_extend 32) (currentByte!15011 thiss!1793)) ((_ sign_extend 32) (currentBit!15006 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(assert (= (and start!72140 res!265524) b!323458))

(assert (= (and b!323458 res!265522) b!323455))

(assert (= (and b!323455 res!265521) b!323454))

(assert (= (and b!323454 res!265525) b!323457))

(assert (= (and b!323457 res!265523) b!323456))

(assert (= start!72140 b!323453))

(declare-fun m!461517 () Bool)

(assert (=> b!323455 m!461517))

(declare-fun m!461519 () Bool)

(assert (=> b!323457 m!461519))

(declare-fun m!461521 () Bool)

(assert (=> b!323457 m!461521))

(declare-fun m!461523 () Bool)

(assert (=> b!323453 m!461523))

(declare-fun m!461525 () Bool)

(assert (=> b!323458 m!461525))

(declare-fun m!461527 () Bool)

(assert (=> b!323456 m!461527))

(declare-fun m!461529 () Bool)

(assert (=> start!72140 m!461529))

(push 1)

(assert (not start!72140))

(assert (not b!323455))

(assert (not b!323456))

(assert (not b!323453))

(assert (not b!323457))

(assert (not b!323458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

