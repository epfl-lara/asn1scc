; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2254 () Bool)

(assert start!2254)

(declare-fun b!10524 () Bool)

(declare-fun res!10489 () Bool)

(declare-fun e!6439 () Bool)

(assert (=> b!10524 (=> (not res!10489) (not e!6439))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!626 0))(
  ( (array!627 (arr!686 (Array (_ BitVec 32) (_ BitVec 8))) (size!269 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!504 0))(
  ( (BitStream!505 (buf!611 array!626) (currentByte!1677 (_ BitVec 32)) (currentBit!1672 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!910 0))(
  ( (Unit!911) )
))
(declare-datatypes ((tuple2!1286 0))(
  ( (tuple2!1287 (_1!686 Unit!910) (_2!686 BitStream!504)) )
))
(declare-fun lt!16624 () tuple2!1286)

(declare-fun thiss!1486 () BitStream!504)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10524 (= res!10489 (= (bitIndex!0 (size!269 (buf!611 (_2!686 lt!16624))) (currentByte!1677 (_2!686 lt!16624)) (currentBit!1672 (_2!686 lt!16624))) (bvadd (bitIndex!0 (size!269 (buf!611 thiss!1486)) (currentByte!1677 thiss!1486) (currentBit!1672 thiss!1486)) nBits!460)))))

(declare-fun b!10525 () Bool)

(declare-fun e!6441 () Bool)

(assert (=> b!10525 (= e!6441 e!6439)))

(declare-fun res!10488 () Bool)

(assert (=> b!10525 (=> (not res!10488) (not e!6439))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10525 (= res!10488 (invariant!0 (currentBit!1672 (_2!686 lt!16624)) (currentByte!1677 (_2!686 lt!16624)) (size!269 (buf!611 (_2!686 lt!16624)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!626)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!504 array!626 (_ BitVec 64) (_ BitVec 64)) tuple2!1286)

(assert (=> b!10525 (= lt!16624 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!10526 () Bool)

(assert (=> b!10526 (= e!6439 false)))

(declare-datatypes ((tuple2!1288 0))(
  ( (tuple2!1289 (_1!687 BitStream!504) (_2!687 BitStream!504)) )
))
(declare-fun lt!16625 () tuple2!1288)

(declare-fun reader!0 (BitStream!504 BitStream!504) tuple2!1288)

(assert (=> b!10526 (= lt!16625 (reader!0 thiss!1486 (_2!686 lt!16624)))))

(declare-fun b!10527 () Bool)

(declare-fun res!10492 () Bool)

(assert (=> b!10527 (=> (not res!10492) (not e!6441))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10527 (= res!10492 (validate_offset_bits!1 ((_ sign_extend 32) (size!269 (buf!611 thiss!1486))) ((_ sign_extend 32) (currentByte!1677 thiss!1486)) ((_ sign_extend 32) (currentBit!1672 thiss!1486)) nBits!460))))

(declare-fun b!10528 () Bool)

(declare-fun e!6440 () Bool)

(declare-fun array_inv!261 (array!626) Bool)

(assert (=> b!10528 (= e!6440 (array_inv!261 (buf!611 thiss!1486)))))

(declare-fun b!10529 () Bool)

(declare-fun res!10491 () Bool)

(assert (=> b!10529 (=> (not res!10491) (not e!6439))))

(declare-fun isPrefixOf!0 (BitStream!504 BitStream!504) Bool)

(assert (=> b!10529 (= res!10491 (isPrefixOf!0 thiss!1486 (_2!686 lt!16624)))))

(declare-fun b!10530 () Bool)

(declare-fun res!10490 () Bool)

(assert (=> b!10530 (=> (not res!10490) (not e!6439))))

(assert (=> b!10530 (= res!10490 (= (size!269 (buf!611 thiss!1486)) (size!269 (buf!611 (_2!686 lt!16624)))))))

(declare-fun res!10487 () Bool)

(assert (=> start!2254 (=> (not res!10487) (not e!6441))))

(assert (=> start!2254 (= res!10487 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!269 srcBuffer!6))))))))

(assert (=> start!2254 e!6441))

(assert (=> start!2254 true))

(assert (=> start!2254 (array_inv!261 srcBuffer!6)))

(declare-fun inv!12 (BitStream!504) Bool)

(assert (=> start!2254 (and (inv!12 thiss!1486) e!6440)))

(assert (= (and start!2254 res!10487) b!10527))

(assert (= (and b!10527 res!10492) b!10525))

(assert (= (and b!10525 res!10488) b!10530))

(assert (= (and b!10530 res!10490) b!10524))

(assert (= (and b!10524 res!10489) b!10529))

(assert (= (and b!10529 res!10491) b!10526))

(assert (= start!2254 b!10528))

(declare-fun m!15433 () Bool)

(assert (=> b!10527 m!15433))

(declare-fun m!15435 () Bool)

(assert (=> b!10526 m!15435))

(declare-fun m!15437 () Bool)

(assert (=> b!10524 m!15437))

(declare-fun m!15439 () Bool)

(assert (=> b!10524 m!15439))

(declare-fun m!15441 () Bool)

(assert (=> b!10525 m!15441))

(declare-fun m!15443 () Bool)

(assert (=> b!10525 m!15443))

(declare-fun m!15445 () Bool)

(assert (=> b!10529 m!15445))

(declare-fun m!15447 () Bool)

(assert (=> b!10528 m!15447))

(declare-fun m!15449 () Bool)

(assert (=> start!2254 m!15449))

(declare-fun m!15451 () Bool)

(assert (=> start!2254 m!15451))

(check-sat (not b!10525) (not b!10526) (not b!10524) (not b!10529) (not start!2254) (not b!10528) (not b!10527))
