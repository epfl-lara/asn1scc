; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2260 () Bool)

(assert start!2260)

(declare-fun b!10587 () Bool)

(declare-fun res!10542 () Bool)

(declare-fun e!6484 () Bool)

(assert (=> b!10587 (=> (not res!10542) (not e!6484))))

(declare-datatypes ((array!632 0))(
  ( (array!633 (arr!689 (Array (_ BitVec 32) (_ BitVec 8))) (size!272 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!510 0))(
  ( (BitStream!511 (buf!614 array!632) (currentByte!1680 (_ BitVec 32)) (currentBit!1675 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!510)

(declare-datatypes ((Unit!916 0))(
  ( (Unit!917) )
))
(declare-datatypes ((tuple2!1298 0))(
  ( (tuple2!1299 (_1!692 Unit!916) (_2!692 BitStream!510)) )
))
(declare-fun lt!16642 () tuple2!1298)

(declare-fun isPrefixOf!0 (BitStream!510 BitStream!510) Bool)

(assert (=> b!10587 (= res!10542 (isPrefixOf!0 thiss!1486 (_2!692 lt!16642)))))

(declare-fun b!10588 () Bool)

(declare-fun res!10541 () Bool)

(assert (=> b!10588 (=> (not res!10541) (not e!6484))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10588 (= res!10541 (= (bitIndex!0 (size!272 (buf!614 (_2!692 lt!16642))) (currentByte!1680 (_2!692 lt!16642)) (currentBit!1675 (_2!692 lt!16642))) (bvadd (bitIndex!0 (size!272 (buf!614 thiss!1486)) (currentByte!1680 thiss!1486) (currentBit!1675 thiss!1486)) nBits!460)))))

(declare-fun b!10589 () Bool)

(declare-fun res!10543 () Bool)

(declare-fun e!6485 () Bool)

(assert (=> b!10589 (=> (not res!10543) (not e!6485))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10589 (= res!10543 (validate_offset_bits!1 ((_ sign_extend 32) (size!272 (buf!614 thiss!1486))) ((_ sign_extend 32) (currentByte!1680 thiss!1486)) ((_ sign_extend 32) (currentBit!1675 thiss!1486)) nBits!460))))

(declare-fun b!10591 () Bool)

(declare-fun res!10545 () Bool)

(assert (=> b!10591 (=> (not res!10545) (not e!6484))))

(assert (=> b!10591 (= res!10545 (= (size!272 (buf!614 thiss!1486)) (size!272 (buf!614 (_2!692 lt!16642)))))))

(declare-fun b!10592 () Bool)

(assert (=> b!10592 (= e!6484 false)))

(declare-datatypes ((tuple2!1300 0))(
  ( (tuple2!1301 (_1!693 BitStream!510) (_2!693 BitStream!510)) )
))
(declare-fun lt!16643 () tuple2!1300)

(declare-fun reader!0 (BitStream!510 BitStream!510) tuple2!1300)

(assert (=> b!10592 (= lt!16643 (reader!0 thiss!1486 (_2!692 lt!16642)))))

(declare-fun b!10593 () Bool)

(declare-fun e!6486 () Bool)

(declare-fun array_inv!264 (array!632) Bool)

(assert (=> b!10593 (= e!6486 (array_inv!264 (buf!614 thiss!1486)))))

(declare-fun res!10546 () Bool)

(assert (=> start!2260 (=> (not res!10546) (not e!6485))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!632)

(assert (=> start!2260 (= res!10546 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!272 srcBuffer!6))))))))

(assert (=> start!2260 e!6485))

(assert (=> start!2260 true))

(assert (=> start!2260 (array_inv!264 srcBuffer!6)))

(declare-fun inv!12 (BitStream!510) Bool)

(assert (=> start!2260 (and (inv!12 thiss!1486) e!6486)))

(declare-fun b!10590 () Bool)

(assert (=> b!10590 (= e!6485 e!6484)))

(declare-fun res!10544 () Bool)

(assert (=> b!10590 (=> (not res!10544) (not e!6484))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10590 (= res!10544 (invariant!0 (currentBit!1675 (_2!692 lt!16642)) (currentByte!1680 (_2!692 lt!16642)) (size!272 (buf!614 (_2!692 lt!16642)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!510 array!632 (_ BitVec 64) (_ BitVec 64)) tuple2!1298)

(assert (=> b!10590 (= lt!16642 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!2260 res!10546) b!10589))

(assert (= (and b!10589 res!10543) b!10590))

(assert (= (and b!10590 res!10544) b!10591))

(assert (= (and b!10591 res!10545) b!10588))

(assert (= (and b!10588 res!10541) b!10587))

(assert (= (and b!10587 res!10542) b!10592))

(assert (= start!2260 b!10593))

(declare-fun m!15493 () Bool)

(assert (=> b!10593 m!15493))

(declare-fun m!15495 () Bool)

(assert (=> b!10590 m!15495))

(declare-fun m!15497 () Bool)

(assert (=> b!10590 m!15497))

(declare-fun m!15499 () Bool)

(assert (=> b!10587 m!15499))

(declare-fun m!15501 () Bool)

(assert (=> start!2260 m!15501))

(declare-fun m!15503 () Bool)

(assert (=> start!2260 m!15503))

(declare-fun m!15505 () Bool)

(assert (=> b!10592 m!15505))

(declare-fun m!15507 () Bool)

(assert (=> b!10588 m!15507))

(declare-fun m!15509 () Bool)

(assert (=> b!10588 m!15509))

(declare-fun m!15511 () Bool)

(assert (=> b!10589 m!15511))

(check-sat (not b!10587) (not b!10588) (not b!10590) (not b!10592) (not b!10589) (not start!2260) (not b!10593))
