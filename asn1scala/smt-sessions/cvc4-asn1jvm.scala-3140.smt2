; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72132 () Bool)

(assert start!72132)

(declare-fun b!323391 () Bool)

(declare-fun res!265472 () Bool)

(declare-fun e!232983 () Bool)

(assert (=> b!323391 (=> (not res!265472) (not e!232983))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323391 (= res!265472 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323392 () Bool)

(declare-fun res!265471 () Bool)

(assert (=> b!323392 (=> (not res!265471) (not e!232983))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!323392 (= res!265471 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323393 () Bool)

(declare-fun res!265473 () Bool)

(assert (=> b!323393 (=> (not res!265473) (not e!232983))))

(declare-datatypes ((array!20663 0))(
  ( (array!20664 (arr!10086 (Array (_ BitVec 32) (_ BitVec 8))) (size!8994 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14150 0))(
  ( (BitStream!14151 (buf!8136 array!20663) (currentByte!15007 (_ BitVec 32)) (currentBit!15002 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14150)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323393 (= res!265473 (validate_offset_bits!1 ((_ sign_extend 32) (size!8994 (buf!8136 thiss!1793))) ((_ sign_extend 32) (currentByte!15007 thiss!1793)) ((_ sign_extend 32) (currentBit!15002 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323394 () Bool)

(assert (=> b!323394 (= e!232983 (and (= (bvand i!743 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!743 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23664 0))(
  ( (tuple2!23665 (_1!13461 Bool) (_2!13461 BitStream!14150)) )
))
(declare-fun lt!445907 () tuple2!23664)

(declare-fun readBit!0 (BitStream!14150) tuple2!23664)

(assert (=> b!323394 (= lt!445907 (readBit!0 thiss!1793))))

(declare-fun b!323395 () Bool)

(declare-fun e!232982 () Bool)

(declare-fun array_inv!8546 (array!20663) Bool)

(assert (=> b!323395 (= e!232982 (array_inv!8546 (buf!8136 thiss!1793)))))

(declare-fun res!265474 () Bool)

(assert (=> start!72132 (=> (not res!265474) (not e!232983))))

(assert (=> start!72132 (= res!265474 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72132 e!232983))

(assert (=> start!72132 true))

(declare-fun inv!12 (BitStream!14150) Bool)

(assert (=> start!72132 (and (inv!12 thiss!1793) e!232982)))

(assert (= (and start!72132 res!265474) b!323393))

(assert (= (and b!323393 res!265473) b!323391))

(assert (= (and b!323391 res!265472) b!323392))

(assert (= (and b!323392 res!265471) b!323394))

(assert (= start!72132 b!323395))

(declare-fun m!461477 () Bool)

(assert (=> b!323391 m!461477))

(declare-fun m!461479 () Bool)

(assert (=> b!323393 m!461479))

(declare-fun m!461481 () Bool)

(assert (=> b!323394 m!461481))

(declare-fun m!461483 () Bool)

(assert (=> start!72132 m!461483))

(declare-fun m!461485 () Bool)

(assert (=> b!323395 m!461485))

(push 1)

(assert (not start!72132))

(assert (not b!323394))

(assert (not b!323393))

(assert (not b!323395))

(assert (not b!323391))

(check-sat)

(pop 1)

(push 1)

(check-sat)

