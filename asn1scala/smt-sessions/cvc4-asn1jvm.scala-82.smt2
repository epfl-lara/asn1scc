; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1656 () Bool)

(assert start!1656)

(declare-fun res!8692 () Bool)

(declare-fun e!5035 () Bool)

(assert (=> start!1656 (=> (not res!8692) (not e!5035))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!532 0))(
  ( (array!533 (arr!636 (Array (_ BitVec 32) (_ BitVec 8))) (size!231 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!532)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1656 (= res!8692 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!231 srcBuffer!6))))))))

(assert (=> start!1656 e!5035))

(assert (=> start!1656 true))

(declare-fun array_inv!226 (array!532) Bool)

(assert (=> start!1656 (array_inv!226 srcBuffer!6)))

(declare-datatypes ((BitStream!440 0))(
  ( (BitStream!441 (buf!567 array!532) (currentByte!1576 (_ BitVec 32)) (currentBit!1571 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!440)

(declare-fun e!5034 () Bool)

(declare-fun inv!12 (BitStream!440) Bool)

(assert (=> start!1656 (and (inv!12 thiss!1486) e!5034)))

(declare-fun b!8065 () Bool)

(declare-fun res!8691 () Bool)

(assert (=> b!8065 (=> (not res!8691) (not e!5035))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8065 (= res!8691 (validate_offset_bits!1 ((_ sign_extend 32) (size!231 (buf!567 thiss!1486))) ((_ sign_extend 32) (currentByte!1576 thiss!1486)) ((_ sign_extend 32) (currentBit!1571 thiss!1486)) nBits!460))))

(declare-fun b!8066 () Bool)

(assert (=> b!8066 (= e!5035 false)))

(declare-datatypes ((Unit!632 0))(
  ( (Unit!633) )
))
(declare-datatypes ((tuple2!1082 0))(
  ( (tuple2!1083 (_1!572 Unit!632) (_2!572 BitStream!440)) )
))
(declare-fun lt!10736 () tuple2!1082)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!440 array!532 (_ BitVec 64) (_ BitVec 64)) tuple2!1082)

(assert (=> b!8066 (= lt!10736 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8067 () Bool)

(assert (=> b!8067 (= e!5034 (array_inv!226 (buf!567 thiss!1486)))))

(assert (= (and start!1656 res!8692) b!8065))

(assert (= (and b!8065 res!8691) b!8066))

(assert (= start!1656 b!8067))

(declare-fun m!10433 () Bool)

(assert (=> start!1656 m!10433))

(declare-fun m!10435 () Bool)

(assert (=> start!1656 m!10435))

(declare-fun m!10437 () Bool)

(assert (=> b!8065 m!10437))

(declare-fun m!10439 () Bool)

(assert (=> b!8066 m!10439))

(declare-fun m!10441 () Bool)

(assert (=> b!8067 m!10441))

(push 1)

(assert (not b!8067))

(assert (not b!8066))

(assert (not b!8065))

(assert (not start!1656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

