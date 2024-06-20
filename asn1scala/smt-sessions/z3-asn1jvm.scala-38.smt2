; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!796 () Bool)

(assert start!796)

(declare-fun b!2688 () Bool)

(declare-fun res!4355 () Bool)

(declare-fun e!1867 () Bool)

(assert (=> b!2688 (=> (not res!4355) (not e!1867))))

(declare-datatypes ((array!242 0))(
  ( (array!243 (arr!485 (Array (_ BitVec 32) (_ BitVec 8))) (size!98 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!174 0))(
  ( (BitStream!175 (buf!410 array!242) (currentByte!1371 (_ BitVec 32)) (currentBit!1366 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!174)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2688 (= res!4355 (validate_offset_bits!1 ((_ sign_extend 32) (size!98 (buf!410 thiss!1486))) ((_ sign_extend 32) (currentByte!1371 thiss!1486)) ((_ sign_extend 32) (currentBit!1366 thiss!1486)) nBits!460))))

(declare-fun b!2689 () Bool)

(declare-fun res!4357 () Bool)

(declare-fun e!1865 () Bool)

(assert (=> b!2689 (=> (not res!4357) (not e!1865))))

(declare-datatypes ((Unit!174 0))(
  ( (Unit!175) )
))
(declare-datatypes ((tuple2!220 0))(
  ( (tuple2!221 (_1!117 Unit!174) (_2!117 BitStream!174)) )
))
(declare-fun lt!2532 () tuple2!220)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2689 (= res!4357 (= (bitIndex!0 (size!98 (buf!410 (_2!117 lt!2532))) (currentByte!1371 (_2!117 lt!2532)) (currentBit!1366 (_2!117 lt!2532))) (bvadd (bitIndex!0 (size!98 (buf!410 thiss!1486)) (currentByte!1371 thiss!1486) (currentBit!1366 thiss!1486)) nBits!460)))))

(declare-fun res!4358 () Bool)

(assert (=> start!796 (=> (not res!4358) (not e!1867))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!242)

(assert (=> start!796 (= res!4358 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!98 srcBuffer!6))))))))

(assert (=> start!796 e!1867))

(assert (=> start!796 true))

(declare-fun array_inv!93 (array!242) Bool)

(assert (=> start!796 (array_inv!93 srcBuffer!6)))

(declare-fun e!1868 () Bool)

(declare-fun inv!12 (BitStream!174) Bool)

(assert (=> start!796 (and (inv!12 thiss!1486) e!1868)))

(declare-fun b!2690 () Bool)

(declare-fun res!4360 () Bool)

(assert (=> b!2690 (=> (not res!4360) (not e!1865))))

(declare-fun isPrefixOf!0 (BitStream!174 BitStream!174) Bool)

(assert (=> b!2690 (= res!4360 (isPrefixOf!0 thiss!1486 (_2!117 lt!2532)))))

(declare-fun b!2691 () Bool)

(declare-fun res!4356 () Bool)

(assert (=> b!2691 (=> (not res!4356) (not e!1865))))

(assert (=> b!2691 (= res!4356 (= (size!98 (buf!410 thiss!1486)) (size!98 (buf!410 (_2!117 lt!2532)))))))

(declare-fun b!2692 () Bool)

(assert (=> b!2692 (= e!1867 e!1865)))

(declare-fun res!4359 () Bool)

(assert (=> b!2692 (=> (not res!4359) (not e!1865))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2692 (= res!4359 (invariant!0 (currentBit!1366 (_2!117 lt!2532)) (currentByte!1371 (_2!117 lt!2532)) (size!98 (buf!410 (_2!117 lt!2532)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!174 array!242 (_ BitVec 64) (_ BitVec 64)) tuple2!220)

(assert (=> b!2692 (= lt!2532 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2693 () Bool)

(assert (=> b!2693 (= e!1868 (array_inv!93 (buf!410 thiss!1486)))))

(declare-fun b!2694 () Bool)

(assert (=> b!2694 (= e!1865 (not true))))

(declare-datatypes ((tuple2!222 0))(
  ( (tuple2!223 (_1!118 array!242) (_2!118 BitStream!174)) )
))
(declare-fun lt!2534 () tuple2!222)

(declare-datatypes ((tuple2!224 0))(
  ( (tuple2!225 (_1!119 BitStream!174) (_2!119 BitStream!174)) )
))
(declare-fun lt!2531 () tuple2!224)

(declare-fun readBits!0 (BitStream!174 (_ BitVec 64)) tuple2!222)

(assert (=> b!2694 (= lt!2534 (readBits!0 (_1!119 lt!2531) nBits!460))))

(assert (=> b!2694 (validate_offset_bits!1 ((_ sign_extend 32) (size!98 (buf!410 (_2!117 lt!2532)))) ((_ sign_extend 32) (currentByte!1371 thiss!1486)) ((_ sign_extend 32) (currentBit!1366 thiss!1486)) nBits!460)))

(declare-fun lt!2533 () Unit!174)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!174 array!242 (_ BitVec 64)) Unit!174)

(assert (=> b!2694 (= lt!2533 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!410 (_2!117 lt!2532)) nBits!460))))

(declare-fun reader!0 (BitStream!174 BitStream!174) tuple2!224)

(assert (=> b!2694 (= lt!2531 (reader!0 thiss!1486 (_2!117 lt!2532)))))

(assert (= (and start!796 res!4358) b!2688))

(assert (= (and b!2688 res!4355) b!2692))

(assert (= (and b!2692 res!4359) b!2691))

(assert (= (and b!2691 res!4356) b!2689))

(assert (= (and b!2689 res!4357) b!2690))

(assert (= (and b!2690 res!4360) b!2694))

(assert (= start!796 b!2693))

(declare-fun m!2561 () Bool)

(assert (=> b!2688 m!2561))

(declare-fun m!2563 () Bool)

(assert (=> b!2690 m!2563))

(declare-fun m!2565 () Bool)

(assert (=> start!796 m!2565))

(declare-fun m!2567 () Bool)

(assert (=> start!796 m!2567))

(declare-fun m!2569 () Bool)

(assert (=> b!2692 m!2569))

(declare-fun m!2571 () Bool)

(assert (=> b!2692 m!2571))

(declare-fun m!2573 () Bool)

(assert (=> b!2693 m!2573))

(declare-fun m!2575 () Bool)

(assert (=> b!2689 m!2575))

(declare-fun m!2577 () Bool)

(assert (=> b!2689 m!2577))

(declare-fun m!2579 () Bool)

(assert (=> b!2694 m!2579))

(declare-fun m!2581 () Bool)

(assert (=> b!2694 m!2581))

(declare-fun m!2583 () Bool)

(assert (=> b!2694 m!2583))

(declare-fun m!2585 () Bool)

(assert (=> b!2694 m!2585))

(check-sat (not b!2690) (not b!2692) (not b!2694) (not b!2688) (not b!2689) (not start!796) (not b!2693))
