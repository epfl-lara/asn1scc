; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2262 () Bool)

(assert start!2262)

(declare-fun res!10564 () Bool)

(declare-fun e!6503 () Bool)

(assert (=> start!2262 (=> (not res!10564) (not e!6503))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!634 0))(
  ( (array!635 (arr!690 (Array (_ BitVec 32) (_ BitVec 8))) (size!273 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!634)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2262 (= res!10564 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!273 srcBuffer!6))))))))

(assert (=> start!2262 e!6503))

(assert (=> start!2262 true))

(declare-fun array_inv!265 (array!634) Bool)

(assert (=> start!2262 (array_inv!265 srcBuffer!6)))

(declare-datatypes ((BitStream!512 0))(
  ( (BitStream!513 (buf!615 array!634) (currentByte!1681 (_ BitVec 32)) (currentBit!1676 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!512)

(declare-fun e!6502 () Bool)

(declare-fun inv!12 (BitStream!512) Bool)

(assert (=> start!2262 (and (inv!12 thiss!1486) e!6502)))

(declare-fun b!10608 () Bool)

(declare-fun res!10559 () Bool)

(declare-fun e!6499 () Bool)

(assert (=> b!10608 (=> (not res!10559) (not e!6499))))

(declare-datatypes ((Unit!918 0))(
  ( (Unit!919) )
))
(declare-datatypes ((tuple2!1302 0))(
  ( (tuple2!1303 (_1!694 Unit!918) (_2!694 BitStream!512)) )
))
(declare-fun lt!16649 () tuple2!1302)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10608 (= res!10559 (= (bitIndex!0 (size!273 (buf!615 (_2!694 lt!16649))) (currentByte!1681 (_2!694 lt!16649)) (currentBit!1676 (_2!694 lt!16649))) (bvadd (bitIndex!0 (size!273 (buf!615 thiss!1486)) (currentByte!1681 thiss!1486) (currentBit!1676 thiss!1486)) nBits!460)))))

(declare-fun b!10609 () Bool)

(declare-fun res!10560 () Bool)

(assert (=> b!10609 (=> (not res!10560) (not e!6503))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10609 (= res!10560 (validate_offset_bits!1 ((_ sign_extend 32) (size!273 (buf!615 thiss!1486))) ((_ sign_extend 32) (currentByte!1681 thiss!1486)) ((_ sign_extend 32) (currentBit!1676 thiss!1486)) nBits!460))))

(declare-fun b!10610 () Bool)

(assert (=> b!10610 (= e!6499 false)))

(declare-datatypes ((tuple2!1304 0))(
  ( (tuple2!1305 (_1!695 BitStream!512) (_2!695 BitStream!512)) )
))
(declare-fun lt!16648 () tuple2!1304)

(declare-fun reader!0 (BitStream!512 BitStream!512) tuple2!1304)

(assert (=> b!10610 (= lt!16648 (reader!0 thiss!1486 (_2!694 lt!16649)))))

(declare-fun b!10611 () Bool)

(declare-fun res!10561 () Bool)

(assert (=> b!10611 (=> (not res!10561) (not e!6499))))

(declare-fun isPrefixOf!0 (BitStream!512 BitStream!512) Bool)

(assert (=> b!10611 (= res!10561 (isPrefixOf!0 thiss!1486 (_2!694 lt!16649)))))

(declare-fun b!10612 () Bool)

(declare-fun res!10562 () Bool)

(assert (=> b!10612 (=> (not res!10562) (not e!6499))))

(assert (=> b!10612 (= res!10562 (= (size!273 (buf!615 thiss!1486)) (size!273 (buf!615 (_2!694 lt!16649)))))))

(declare-fun b!10613 () Bool)

(assert (=> b!10613 (= e!6502 (array_inv!265 (buf!615 thiss!1486)))))

(declare-fun b!10614 () Bool)

(assert (=> b!10614 (= e!6503 e!6499)))

(declare-fun res!10563 () Bool)

(assert (=> b!10614 (=> (not res!10563) (not e!6499))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10614 (= res!10563 (invariant!0 (currentBit!1676 (_2!694 lt!16649)) (currentByte!1681 (_2!694 lt!16649)) (size!273 (buf!615 (_2!694 lt!16649)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!512 array!634 (_ BitVec 64) (_ BitVec 64)) tuple2!1302)

(assert (=> b!10614 (= lt!16649 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!2262 res!10564) b!10609))

(assert (= (and b!10609 res!10560) b!10614))

(assert (= (and b!10614 res!10563) b!10612))

(assert (= (and b!10612 res!10562) b!10608))

(assert (= (and b!10608 res!10559) b!10611))

(assert (= (and b!10611 res!10561) b!10610))

(assert (= start!2262 b!10613))

(declare-fun m!15513 () Bool)

(assert (=> b!10611 m!15513))

(declare-fun m!15515 () Bool)

(assert (=> b!10614 m!15515))

(declare-fun m!15517 () Bool)

(assert (=> b!10614 m!15517))

(declare-fun m!15519 () Bool)

(assert (=> start!2262 m!15519))

(declare-fun m!15521 () Bool)

(assert (=> start!2262 m!15521))

(declare-fun m!15523 () Bool)

(assert (=> b!10613 m!15523))

(declare-fun m!15525 () Bool)

(assert (=> b!10608 m!15525))

(declare-fun m!15527 () Bool)

(assert (=> b!10608 m!15527))

(declare-fun m!15529 () Bool)

(assert (=> b!10610 m!15529))

(declare-fun m!15531 () Bool)

(assert (=> b!10609 m!15531))

(push 1)

