; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!662 () Bool)

(assert start!662)

(declare-fun res!3766 () Bool)

(declare-fun e!1386 () Bool)

(assert (=> start!662 (=> (not res!3766) (not e!1386))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!186 0))(
  ( (array!187 (arr!460 (Array (_ BitVec 32) (_ BitVec 8))) (size!73 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!186)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!662 (= res!3766 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!73 srcBuffer!6))))))))

(assert (=> start!662 e!1386))

(assert (=> start!662 true))

(declare-fun array_inv!68 (array!186) Bool)

(assert (=> start!662 (array_inv!68 srcBuffer!6)))

(declare-datatypes ((BitStream!124 0))(
  ( (BitStream!125 (buf!382 array!186) (currentByte!1331 (_ BitVec 32)) (currentBit!1326 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!124)

(declare-fun e!1387 () Bool)

(declare-fun inv!12 (BitStream!124) Bool)

(assert (=> start!662 (and (inv!12 thiss!1486) e!1387)))

(declare-fun b!1969 () Bool)

(declare-fun res!3765 () Bool)

(assert (=> b!1969 (=> (not res!3765) (not e!1386))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1969 (= res!3765 (validate_offset_bits!1 ((_ sign_extend 32) (size!73 (buf!382 thiss!1486))) ((_ sign_extend 32) (currentByte!1331 thiss!1486)) ((_ sign_extend 32) (currentBit!1326 thiss!1486)) nBits!460))))

(declare-fun b!1970 () Bool)

(assert (=> b!1970 (= e!1386 false)))

(declare-datatypes ((Unit!79 0))(
  ( (Unit!80) )
))
(declare-datatypes ((tuple2!118 0))(
  ( (tuple2!119 (_1!66 Unit!79) (_2!66 BitStream!124)) )
))
(declare-fun lt!1316 () tuple2!118)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!124 array!186 (_ BitVec 64) (_ BitVec 64)) tuple2!118)

(assert (=> b!1970 (= lt!1316 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!1971 () Bool)

(assert (=> b!1971 (= e!1387 (array_inv!68 (buf!382 thiss!1486)))))

(assert (= (and start!662 res!3766) b!1969))

(assert (= (and b!1969 res!3765) b!1970))

(assert (= start!662 b!1971))

(declare-fun m!1407 () Bool)

(assert (=> start!662 m!1407))

(declare-fun m!1409 () Bool)

(assert (=> start!662 m!1409))

(declare-fun m!1411 () Bool)

(assert (=> b!1969 m!1411))

(declare-fun m!1413 () Bool)

(assert (=> b!1970 m!1413))

(declare-fun m!1415 () Bool)

(assert (=> b!1971 m!1415))

(push 1)

(assert (not b!1970))

(assert (not b!1971))

(assert (not start!662))

(assert (not b!1969))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

