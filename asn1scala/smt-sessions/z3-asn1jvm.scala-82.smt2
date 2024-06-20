; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1654 () Bool)

(assert start!1654)

(declare-fun res!8686 () Bool)

(declare-fun e!5023 () Bool)

(assert (=> start!1654 (=> (not res!8686) (not e!5023))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!530 0))(
  ( (array!531 (arr!635 (Array (_ BitVec 32) (_ BitVec 8))) (size!230 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!530)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1654 (= res!8686 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!230 srcBuffer!6))))))))

(assert (=> start!1654 e!5023))

(assert (=> start!1654 true))

(declare-fun array_inv!225 (array!530) Bool)

(assert (=> start!1654 (array_inv!225 srcBuffer!6)))

(declare-datatypes ((BitStream!438 0))(
  ( (BitStream!439 (buf!566 array!530) (currentByte!1575 (_ BitVec 32)) (currentBit!1570 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!438)

(declare-fun e!5021 () Bool)

(declare-fun inv!12 (BitStream!438) Bool)

(assert (=> start!1654 (and (inv!12 thiss!1486) e!5021)))

(declare-fun b!8056 () Bool)

(declare-fun res!8685 () Bool)

(assert (=> b!8056 (=> (not res!8685) (not e!5023))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8056 (= res!8685 (validate_offset_bits!1 ((_ sign_extend 32) (size!230 (buf!566 thiss!1486))) ((_ sign_extend 32) (currentByte!1575 thiss!1486)) ((_ sign_extend 32) (currentBit!1570 thiss!1486)) nBits!460))))

(declare-fun b!8057 () Bool)

(assert (=> b!8057 (= e!5023 false)))

(declare-datatypes ((Unit!630 0))(
  ( (Unit!631) )
))
(declare-datatypes ((tuple2!1080 0))(
  ( (tuple2!1081 (_1!571 Unit!630) (_2!571 BitStream!438)) )
))
(declare-fun lt!10733 () tuple2!1080)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!438 array!530 (_ BitVec 64) (_ BitVec 64)) tuple2!1080)

(assert (=> b!8057 (= lt!10733 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8058 () Bool)

(assert (=> b!8058 (= e!5021 (array_inv!225 (buf!566 thiss!1486)))))

(assert (= (and start!1654 res!8686) b!8056))

(assert (= (and b!8056 res!8685) b!8057))

(assert (= start!1654 b!8058))

(declare-fun m!10423 () Bool)

(assert (=> start!1654 m!10423))

(declare-fun m!10425 () Bool)

(assert (=> start!1654 m!10425))

(declare-fun m!10427 () Bool)

(assert (=> b!8056 m!10427))

(declare-fun m!10429 () Bool)

(assert (=> b!8057 m!10429))

(declare-fun m!10431 () Bool)

(assert (=> b!8058 m!10431))

(check-sat (not b!8057) (not b!8058) (not b!8056) (not start!1654))
