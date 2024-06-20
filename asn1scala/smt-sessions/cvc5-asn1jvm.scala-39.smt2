; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!800 () Bool)

(assert start!800)

(declare-fun b!2730 () Bool)

(declare-fun res!4392 () Bool)

(declare-fun e!1898 () Bool)

(assert (=> b!2730 (=> (not res!4392) (not e!1898))))

(declare-datatypes ((array!246 0))(
  ( (array!247 (arr!487 (Array (_ BitVec 32) (_ BitVec 8))) (size!100 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!178 0))(
  ( (BitStream!179 (buf!412 array!246) (currentByte!1373 (_ BitVec 32)) (currentBit!1368 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!178)

(declare-datatypes ((Unit!178 0))(
  ( (Unit!179) )
))
(declare-datatypes ((tuple2!232 0))(
  ( (tuple2!233 (_1!123 Unit!178) (_2!123 BitStream!178)) )
))
(declare-fun lt!2558 () tuple2!232)

(assert (=> b!2730 (= res!4392 (= (size!100 (buf!412 thiss!1486)) (size!100 (buf!412 (_2!123 lt!2558)))))))

(declare-fun b!2731 () Bool)

(declare-fun res!4391 () Bool)

(assert (=> b!2731 (=> (not res!4391) (not e!1898))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2731 (= res!4391 (= (bitIndex!0 (size!100 (buf!412 (_2!123 lt!2558))) (currentByte!1373 (_2!123 lt!2558)) (currentBit!1368 (_2!123 lt!2558))) (bvadd (bitIndex!0 (size!100 (buf!412 thiss!1486)) (currentByte!1373 thiss!1486) (currentBit!1368 thiss!1486)) nBits!460)))))

(declare-fun res!4396 () Bool)

(declare-fun e!1895 () Bool)

(assert (=> start!800 (=> (not res!4396) (not e!1895))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!246)

(assert (=> start!800 (= res!4396 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!100 srcBuffer!6))))))))

(assert (=> start!800 e!1895))

(assert (=> start!800 true))

(declare-fun array_inv!95 (array!246) Bool)

(assert (=> start!800 (array_inv!95 srcBuffer!6)))

(declare-fun e!1896 () Bool)

(declare-fun inv!12 (BitStream!178) Bool)

(assert (=> start!800 (and (inv!12 thiss!1486) e!1896)))

(declare-fun b!2732 () Bool)

(assert (=> b!2732 (= e!1898 (not true))))

(declare-datatypes ((tuple2!234 0))(
  ( (tuple2!235 (_1!124 array!246) (_2!124 BitStream!178)) )
))
(declare-fun lt!2556 () tuple2!234)

(declare-datatypes ((tuple2!236 0))(
  ( (tuple2!237 (_1!125 BitStream!178) (_2!125 BitStream!178)) )
))
(declare-fun lt!2557 () tuple2!236)

(declare-fun readBits!0 (BitStream!178 (_ BitVec 64)) tuple2!234)

(assert (=> b!2732 (= lt!2556 (readBits!0 (_1!125 lt!2557) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2732 (validate_offset_bits!1 ((_ sign_extend 32) (size!100 (buf!412 (_2!123 lt!2558)))) ((_ sign_extend 32) (currentByte!1373 thiss!1486)) ((_ sign_extend 32) (currentBit!1368 thiss!1486)) nBits!460)))

(declare-fun lt!2555 () Unit!178)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!178 array!246 (_ BitVec 64)) Unit!178)

(assert (=> b!2732 (= lt!2555 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!412 (_2!123 lt!2558)) nBits!460))))

(declare-fun reader!0 (BitStream!178 BitStream!178) tuple2!236)

(assert (=> b!2732 (= lt!2557 (reader!0 thiss!1486 (_2!123 lt!2558)))))

(declare-fun b!2733 () Bool)

(assert (=> b!2733 (= e!1895 e!1898)))

(declare-fun res!4393 () Bool)

(assert (=> b!2733 (=> (not res!4393) (not e!1898))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2733 (= res!4393 (invariant!0 (currentBit!1368 (_2!123 lt!2558)) (currentByte!1373 (_2!123 lt!2558)) (size!100 (buf!412 (_2!123 lt!2558)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!178 array!246 (_ BitVec 64) (_ BitVec 64)) tuple2!232)

(assert (=> b!2733 (= lt!2558 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2734 () Bool)

(declare-fun res!4394 () Bool)

(assert (=> b!2734 (=> (not res!4394) (not e!1895))))

(assert (=> b!2734 (= res!4394 (validate_offset_bits!1 ((_ sign_extend 32) (size!100 (buf!412 thiss!1486))) ((_ sign_extend 32) (currentByte!1373 thiss!1486)) ((_ sign_extend 32) (currentBit!1368 thiss!1486)) nBits!460))))

(declare-fun b!2735 () Bool)

(declare-fun res!4395 () Bool)

(assert (=> b!2735 (=> (not res!4395) (not e!1898))))

(declare-fun isPrefixOf!0 (BitStream!178 BitStream!178) Bool)

(assert (=> b!2735 (= res!4395 (isPrefixOf!0 thiss!1486 (_2!123 lt!2558)))))

(declare-fun b!2736 () Bool)

(assert (=> b!2736 (= e!1896 (array_inv!95 (buf!412 thiss!1486)))))

(assert (= (and start!800 res!4396) b!2734))

(assert (= (and b!2734 res!4394) b!2733))

(assert (= (and b!2733 res!4393) b!2730))

(assert (= (and b!2730 res!4392) b!2731))

(assert (= (and b!2731 res!4391) b!2735))

(assert (= (and b!2735 res!4395) b!2732))

(assert (= start!800 b!2736))

(declare-fun m!2613 () Bool)

(assert (=> b!2731 m!2613))

(declare-fun m!2615 () Bool)

(assert (=> b!2731 m!2615))

(declare-fun m!2617 () Bool)

(assert (=> b!2734 m!2617))

(declare-fun m!2619 () Bool)

(assert (=> b!2732 m!2619))

(declare-fun m!2621 () Bool)

(assert (=> b!2732 m!2621))

(declare-fun m!2623 () Bool)

(assert (=> b!2732 m!2623))

(declare-fun m!2625 () Bool)

(assert (=> b!2732 m!2625))

(declare-fun m!2627 () Bool)

(assert (=> start!800 m!2627))

(declare-fun m!2629 () Bool)

(assert (=> start!800 m!2629))

(declare-fun m!2631 () Bool)

(assert (=> b!2736 m!2631))

(declare-fun m!2633 () Bool)

(assert (=> b!2735 m!2633))

(declare-fun m!2635 () Bool)

(assert (=> b!2733 m!2635))

(declare-fun m!2637 () Bool)

(assert (=> b!2733 m!2637))

(push 1)

(assert (not b!2732))

(assert (not b!2733))

(assert (not b!2735))

(assert (not start!800))

(assert (not b!2731))

(assert (not b!2734))

(assert (not b!2736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

