; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2258 () Bool)

(assert start!2258)

(declare-fun b!10566 () Bool)

(declare-fun res!10523 () Bool)

(declare-fun e!6472 () Bool)

(assert (=> b!10566 (=> (not res!10523) (not e!6472))))

(declare-datatypes ((array!630 0))(
  ( (array!631 (arr!688 (Array (_ BitVec 32) (_ BitVec 8))) (size!271 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!508 0))(
  ( (BitStream!509 (buf!613 array!630) (currentByte!1679 (_ BitVec 32)) (currentBit!1674 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!508)

(declare-datatypes ((Unit!914 0))(
  ( (Unit!915) )
))
(declare-datatypes ((tuple2!1294 0))(
  ( (tuple2!1295 (_1!690 Unit!914) (_2!690 BitStream!508)) )
))
(declare-fun lt!16637 () tuple2!1294)

(assert (=> b!10566 (= res!10523 (= (size!271 (buf!613 thiss!1486)) (size!271 (buf!613 (_2!690 lt!16637)))))))

(declare-fun b!10567 () Bool)

(declare-fun e!6471 () Bool)

(declare-fun array_inv!263 (array!630) Bool)

(assert (=> b!10567 (= e!6471 (array_inv!263 (buf!613 thiss!1486)))))

(declare-fun b!10568 () Bool)

(declare-fun e!6473 () Bool)

(assert (=> b!10568 (= e!6473 e!6472)))

(declare-fun res!10527 () Bool)

(assert (=> b!10568 (=> (not res!10527) (not e!6472))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10568 (= res!10527 (invariant!0 (currentBit!1674 (_2!690 lt!16637)) (currentByte!1679 (_2!690 lt!16637)) (size!271 (buf!613 (_2!690 lt!16637)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!630)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!508 array!630 (_ BitVec 64) (_ BitVec 64)) tuple2!1294)

(assert (=> b!10568 (= lt!16637 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!10569 () Bool)

(declare-fun res!10526 () Bool)

(assert (=> b!10569 (=> (not res!10526) (not e!6473))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10569 (= res!10526 (validate_offset_bits!1 ((_ sign_extend 32) (size!271 (buf!613 thiss!1486))) ((_ sign_extend 32) (currentByte!1679 thiss!1486)) ((_ sign_extend 32) (currentBit!1674 thiss!1486)) nBits!460))))

(declare-fun b!10570 () Bool)

(declare-fun res!10528 () Bool)

(assert (=> b!10570 (=> (not res!10528) (not e!6472))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10570 (= res!10528 (= (bitIndex!0 (size!271 (buf!613 (_2!690 lt!16637))) (currentByte!1679 (_2!690 lt!16637)) (currentBit!1674 (_2!690 lt!16637))) (bvadd (bitIndex!0 (size!271 (buf!613 thiss!1486)) (currentByte!1679 thiss!1486) (currentBit!1674 thiss!1486)) nBits!460)))))

(declare-fun b!10571 () Bool)

(declare-fun res!10525 () Bool)

(assert (=> b!10571 (=> (not res!10525) (not e!6472))))

(declare-fun isPrefixOf!0 (BitStream!508 BitStream!508) Bool)

(assert (=> b!10571 (= res!10525 (isPrefixOf!0 thiss!1486 (_2!690 lt!16637)))))

(declare-fun res!10524 () Bool)

(assert (=> start!2258 (=> (not res!10524) (not e!6473))))

(assert (=> start!2258 (= res!10524 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!271 srcBuffer!6))))))))

(assert (=> start!2258 e!6473))

(assert (=> start!2258 true))

(assert (=> start!2258 (array_inv!263 srcBuffer!6)))

(declare-fun inv!12 (BitStream!508) Bool)

(assert (=> start!2258 (and (inv!12 thiss!1486) e!6471)))

(declare-fun b!10572 () Bool)

(assert (=> b!10572 (= e!6472 false)))

(declare-datatypes ((tuple2!1296 0))(
  ( (tuple2!1297 (_1!691 BitStream!508) (_2!691 BitStream!508)) )
))
(declare-fun lt!16636 () tuple2!1296)

(declare-fun reader!0 (BitStream!508 BitStream!508) tuple2!1296)

(assert (=> b!10572 (= lt!16636 (reader!0 thiss!1486 (_2!690 lt!16637)))))

(assert (= (and start!2258 res!10524) b!10569))

(assert (= (and b!10569 res!10526) b!10568))

(assert (= (and b!10568 res!10527) b!10566))

(assert (= (and b!10566 res!10523) b!10570))

(assert (= (and b!10570 res!10528) b!10571))

(assert (= (and b!10571 res!10525) b!10572))

(assert (= start!2258 b!10567))

(declare-fun m!15473 () Bool)

(assert (=> b!10569 m!15473))

(declare-fun m!15475 () Bool)

(assert (=> b!10568 m!15475))

(declare-fun m!15477 () Bool)

(assert (=> b!10568 m!15477))

(declare-fun m!15479 () Bool)

(assert (=> b!10571 m!15479))

(declare-fun m!15481 () Bool)

(assert (=> b!10570 m!15481))

(declare-fun m!15483 () Bool)

(assert (=> b!10570 m!15483))

(declare-fun m!15485 () Bool)

(assert (=> b!10567 m!15485))

(declare-fun m!15487 () Bool)

(assert (=> b!10572 m!15487))

(declare-fun m!15489 () Bool)

(assert (=> start!2258 m!15489))

(declare-fun m!15491 () Bool)

(assert (=> start!2258 m!15491))

(push 1)

(assert (not b!10570))

(assert (not start!2258))

(assert (not b!10572))

(assert (not b!10571))

(assert (not b!10569))

(assert (not b!10567))

(assert (not b!10568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

