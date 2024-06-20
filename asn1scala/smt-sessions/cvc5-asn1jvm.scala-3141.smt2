; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72134 () Bool)

(assert start!72134)

(declare-fun b!323406 () Bool)

(declare-fun res!265486 () Bool)

(declare-fun e!232990 () Bool)

(assert (=> b!323406 (=> (not res!265486) (not e!232990))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323406 (= res!265486 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323407 () Bool)

(declare-fun res!265485 () Bool)

(assert (=> b!323407 (=> (not res!265485) (not e!232990))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!323407 (= res!265485 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323408 () Bool)

(assert (=> b!323408 (= e!232990 (bvsge (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) (bvsub nBits!548 i!743)))))

(declare-datatypes ((array!20665 0))(
  ( (array!20666 (arr!10087 (Array (_ BitVec 32) (_ BitVec 8))) (size!8995 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14152 0))(
  ( (BitStream!14153 (buf!8137 array!20665) (currentByte!15008 (_ BitVec 32)) (currentBit!15003 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23666 0))(
  ( (tuple2!23667 (_1!13462 Bool) (_2!13462 BitStream!14152)) )
))
(declare-fun lt!445910 () tuple2!23666)

(declare-fun thiss!1793 () BitStream!14152)

(declare-fun readBit!0 (BitStream!14152) tuple2!23666)

(assert (=> b!323408 (= lt!445910 (readBit!0 thiss!1793))))

(declare-fun b!323409 () Bool)

(declare-fun res!265484 () Bool)

(assert (=> b!323409 (=> (not res!265484) (not e!232990))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323409 (= res!265484 (validate_offset_bits!1 ((_ sign_extend 32) (size!8995 (buf!8137 thiss!1793))) ((_ sign_extend 32) (currentByte!15008 thiss!1793)) ((_ sign_extend 32) (currentBit!15003 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun res!265483 () Bool)

(assert (=> start!72134 (=> (not res!265483) (not e!232990))))

(assert (=> start!72134 (= res!265483 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72134 e!232990))

(assert (=> start!72134 true))

(declare-fun e!232991 () Bool)

(declare-fun inv!12 (BitStream!14152) Bool)

(assert (=> start!72134 (and (inv!12 thiss!1793) e!232991)))

(declare-fun b!323410 () Bool)

(declare-fun array_inv!8547 (array!20665) Bool)

(assert (=> b!323410 (= e!232991 (array_inv!8547 (buf!8137 thiss!1793)))))

(assert (= (and start!72134 res!265483) b!323409))

(assert (= (and b!323409 res!265484) b!323406))

(assert (= (and b!323406 res!265486) b!323407))

(assert (= (and b!323407 res!265485) b!323408))

(assert (= start!72134 b!323410))

(declare-fun m!461487 () Bool)

(assert (=> b!323410 m!461487))

(declare-fun m!461489 () Bool)

(assert (=> b!323406 m!461489))

(declare-fun m!461491 () Bool)

(assert (=> start!72134 m!461491))

(declare-fun m!461493 () Bool)

(assert (=> b!323409 m!461493))

(declare-fun m!461495 () Bool)

(assert (=> b!323408 m!461495))

(push 1)

(assert (not b!323408))

(assert (not b!323409))

(assert (not b!323410))

(assert (not start!72134))

(assert (not b!323406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

