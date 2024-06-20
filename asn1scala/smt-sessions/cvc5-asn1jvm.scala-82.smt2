; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1652 () Bool)

(assert start!1652)

(declare-fun res!8679 () Bool)

(declare-fun e!5011 () Bool)

(assert (=> start!1652 (=> (not res!8679) (not e!5011))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!528 0))(
  ( (array!529 (arr!634 (Array (_ BitVec 32) (_ BitVec 8))) (size!229 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!528)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1652 (= res!8679 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!229 srcBuffer!6))))))))

(assert (=> start!1652 e!5011))

(assert (=> start!1652 true))

(declare-fun array_inv!224 (array!528) Bool)

(assert (=> start!1652 (array_inv!224 srcBuffer!6)))

(declare-datatypes ((BitStream!436 0))(
  ( (BitStream!437 (buf!565 array!528) (currentByte!1574 (_ BitVec 32)) (currentBit!1569 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!436)

(declare-fun e!5009 () Bool)

(declare-fun inv!12 (BitStream!436) Bool)

(assert (=> start!1652 (and (inv!12 thiss!1486) e!5009)))

(declare-fun b!8047 () Bool)

(declare-fun res!8680 () Bool)

(assert (=> b!8047 (=> (not res!8680) (not e!5011))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8047 (= res!8680 (validate_offset_bits!1 ((_ sign_extend 32) (size!229 (buf!565 thiss!1486))) ((_ sign_extend 32) (currentByte!1574 thiss!1486)) ((_ sign_extend 32) (currentBit!1569 thiss!1486)) nBits!460))))

(declare-fun b!8048 () Bool)

(assert (=> b!8048 (= e!5011 false)))

(declare-datatypes ((Unit!628 0))(
  ( (Unit!629) )
))
(declare-datatypes ((tuple2!1078 0))(
  ( (tuple2!1079 (_1!570 Unit!628) (_2!570 BitStream!436)) )
))
(declare-fun lt!10730 () tuple2!1078)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!436 array!528 (_ BitVec 64) (_ BitVec 64)) tuple2!1078)

(assert (=> b!8048 (= lt!10730 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8049 () Bool)

(assert (=> b!8049 (= e!5009 (array_inv!224 (buf!565 thiss!1486)))))

(assert (= (and start!1652 res!8679) b!8047))

(assert (= (and b!8047 res!8680) b!8048))

(assert (= start!1652 b!8049))

(declare-fun m!10413 () Bool)

(assert (=> start!1652 m!10413))

(declare-fun m!10415 () Bool)

(assert (=> start!1652 m!10415))

(declare-fun m!10417 () Bool)

(assert (=> b!8047 m!10417))

(declare-fun m!10419 () Bool)

(assert (=> b!8048 m!10419))

(declare-fun m!10421 () Bool)

(assert (=> b!8049 m!10421))

(push 1)

(assert (not b!8048))

(assert (not b!8047))

(assert (not start!1652))

(assert (not b!8049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

