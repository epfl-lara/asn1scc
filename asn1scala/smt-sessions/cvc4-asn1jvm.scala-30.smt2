; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!666 () Bool)

(assert start!666)

(declare-fun res!3777 () Bool)

(declare-fun e!1411 () Bool)

(assert (=> start!666 (=> (not res!3777) (not e!1411))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!190 0))(
  ( (array!191 (arr!462 (Array (_ BitVec 32) (_ BitVec 8))) (size!75 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!190)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!666 (= res!3777 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!75 srcBuffer!6))))))))

(assert (=> start!666 e!1411))

(assert (=> start!666 true))

(declare-fun array_inv!70 (array!190) Bool)

(assert (=> start!666 (array_inv!70 srcBuffer!6)))

(declare-datatypes ((BitStream!128 0))(
  ( (BitStream!129 (buf!384 array!190) (currentByte!1333 (_ BitVec 32)) (currentBit!1328 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!128)

(declare-fun e!1409 () Bool)

(declare-fun inv!12 (BitStream!128) Bool)

(assert (=> start!666 (and (inv!12 thiss!1486) e!1409)))

(declare-fun b!1987 () Bool)

(declare-fun res!3778 () Bool)

(assert (=> b!1987 (=> (not res!3778) (not e!1411))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1987 (= res!3778 (validate_offset_bits!1 ((_ sign_extend 32) (size!75 (buf!384 thiss!1486))) ((_ sign_extend 32) (currentByte!1333 thiss!1486)) ((_ sign_extend 32) (currentBit!1328 thiss!1486)) nBits!460))))

(declare-fun b!1988 () Bool)

(assert (=> b!1988 (= e!1411 false)))

(declare-datatypes ((Unit!83 0))(
  ( (Unit!84) )
))
(declare-datatypes ((tuple2!122 0))(
  ( (tuple2!123 (_1!68 Unit!83) (_2!68 BitStream!128)) )
))
(declare-fun lt!1322 () tuple2!122)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!128 array!190 (_ BitVec 64) (_ BitVec 64)) tuple2!122)

(assert (=> b!1988 (= lt!1322 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!1989 () Bool)

(assert (=> b!1989 (= e!1409 (array_inv!70 (buf!384 thiss!1486)))))

(assert (= (and start!666 res!3777) b!1987))

(assert (= (and b!1987 res!3778) b!1988))

(assert (= start!666 b!1989))

(declare-fun m!1427 () Bool)

(assert (=> start!666 m!1427))

(declare-fun m!1429 () Bool)

(assert (=> start!666 m!1429))

(declare-fun m!1431 () Bool)

(assert (=> b!1987 m!1431))

(declare-fun m!1433 () Bool)

(assert (=> b!1988 m!1433))

(declare-fun m!1435 () Bool)

(assert (=> b!1989 m!1435))

(push 1)

(assert (not b!1989))

(assert (not start!666))

(assert (not b!1987))

(assert (not b!1988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

