; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72138 () Bool)

(assert start!72138)

(declare-fun b!323436 () Bool)

(declare-fun e!233009 () Bool)

(declare-datatypes ((array!20669 0))(
  ( (array!20670 (arr!10089 (Array (_ BitVec 32) (_ BitVec 8))) (size!8997 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14156 0))(
  ( (BitStream!14157 (buf!8139 array!20669) (currentByte!15010 (_ BitVec 32)) (currentBit!15005 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14156)

(declare-fun array_inv!8549 (array!20669) Bool)

(assert (=> b!323436 (= e!233009 (array_inv!8549 (buf!8139 thiss!1793)))))

(declare-fun res!265509 () Bool)

(declare-fun e!233008 () Bool)

(assert (=> start!72138 (=> (not res!265509) (not e!233008))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72138 (= res!265509 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72138 e!233008))

(assert (=> start!72138 true))

(declare-fun inv!12 (BitStream!14156) Bool)

(assert (=> start!72138 (and (inv!12 thiss!1793) e!233009)))

(declare-fun b!323437 () Bool)

(declare-fun res!265510 () Bool)

(assert (=> b!323437 (=> (not res!265510) (not e!233008))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323437 (= res!265510 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323438 () Bool)

(assert (=> b!323438 (= e!233008 (bvsge (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) (bvsub nBits!548 i!743)))))

(declare-datatypes ((tuple2!23670 0))(
  ( (tuple2!23671 (_1!13464 Bool) (_2!13464 BitStream!14156)) )
))
(declare-fun lt!445916 () tuple2!23670)

(declare-fun readBit!0 (BitStream!14156) tuple2!23670)

(assert (=> b!323438 (= lt!445916 (readBit!0 thiss!1793))))

(declare-fun b!323439 () Bool)

(declare-fun res!265507 () Bool)

(assert (=> b!323439 (=> (not res!265507) (not e!233008))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323439 (= res!265507 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323440 () Bool)

(declare-fun res!265508 () Bool)

(assert (=> b!323440 (=> (not res!265508) (not e!233008))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323440 (= res!265508 (validate_offset_bits!1 ((_ sign_extend 32) (size!8997 (buf!8139 thiss!1793))) ((_ sign_extend 32) (currentByte!15010 thiss!1793)) ((_ sign_extend 32) (currentBit!15005 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(assert (= (and start!72138 res!265509) b!323440))

(assert (= (and b!323440 res!265508) b!323439))

(assert (= (and b!323439 res!265507) b!323437))

(assert (= (and b!323437 res!265510) b!323438))

(assert (= start!72138 b!323436))

(declare-fun m!461507 () Bool)

(assert (=> start!72138 m!461507))

(declare-fun m!461509 () Bool)

(assert (=> b!323438 m!461509))

(declare-fun m!461511 () Bool)

(assert (=> b!323436 m!461511))

(declare-fun m!461513 () Bool)

(assert (=> b!323439 m!461513))

(declare-fun m!461515 () Bool)

(assert (=> b!323440 m!461515))

(push 1)

(assert (not b!323438))

(assert (not b!323440))

(assert (not b!323436))

(assert (not start!72138))

(assert (not b!323439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

