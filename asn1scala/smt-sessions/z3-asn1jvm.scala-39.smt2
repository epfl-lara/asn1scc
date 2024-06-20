; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!802 () Bool)

(assert start!802)

(declare-fun b!2751 () Bool)

(declare-fun res!4414 () Bool)

(declare-fun e!1912 () Bool)

(assert (=> b!2751 (=> (not res!4414) (not e!1912))))

(declare-datatypes ((array!248 0))(
  ( (array!249 (arr!488 (Array (_ BitVec 32) (_ BitVec 8))) (size!101 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!180 0))(
  ( (BitStream!181 (buf!413 array!248) (currentByte!1374 (_ BitVec 32)) (currentBit!1369 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!180)

(declare-datatypes ((Unit!180 0))(
  ( (Unit!181) )
))
(declare-datatypes ((tuple2!238 0))(
  ( (tuple2!239 (_1!126 Unit!180) (_2!126 BitStream!180)) )
))
(declare-fun lt!2569 () tuple2!238)

(declare-fun isPrefixOf!0 (BitStream!180 BitStream!180) Bool)

(assert (=> b!2751 (= res!4414 (isPrefixOf!0 thiss!1486 (_2!126 lt!2569)))))

(declare-fun b!2752 () Bool)

(declare-fun e!1911 () Bool)

(declare-fun array_inv!96 (array!248) Bool)

(assert (=> b!2752 (= e!1911 (array_inv!96 (buf!413 thiss!1486)))))

(declare-fun b!2753 () Bool)

(declare-fun e!1913 () Bool)

(assert (=> b!2753 (= e!1913 e!1912)))

(declare-fun res!4412 () Bool)

(assert (=> b!2753 (=> (not res!4412) (not e!1912))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2753 (= res!4412 (invariant!0 (currentBit!1369 (_2!126 lt!2569)) (currentByte!1374 (_2!126 lt!2569)) (size!101 (buf!413 (_2!126 lt!2569)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!248)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!180 array!248 (_ BitVec 64) (_ BitVec 64)) tuple2!238)

(assert (=> b!2753 (= lt!2569 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2754 () Bool)

(declare-fun res!4409 () Bool)

(assert (=> b!2754 (=> (not res!4409) (not e!1913))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2754 (= res!4409 (validate_offset_bits!1 ((_ sign_extend 32) (size!101 (buf!413 thiss!1486))) ((_ sign_extend 32) (currentByte!1374 thiss!1486)) ((_ sign_extend 32) (currentBit!1369 thiss!1486)) nBits!460))))

(declare-fun res!4413 () Bool)

(assert (=> start!802 (=> (not res!4413) (not e!1913))))

(assert (=> start!802 (= res!4413 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!101 srcBuffer!6))))))))

(assert (=> start!802 e!1913))

(assert (=> start!802 true))

(assert (=> start!802 (array_inv!96 srcBuffer!6)))

(declare-fun inv!12 (BitStream!180) Bool)

(assert (=> start!802 (and (inv!12 thiss!1486) e!1911)))

(declare-fun b!2755 () Bool)

(declare-fun res!4411 () Bool)

(assert (=> b!2755 (=> (not res!4411) (not e!1912))))

(assert (=> b!2755 (= res!4411 (= (size!101 (buf!413 thiss!1486)) (size!101 (buf!413 (_2!126 lt!2569)))))))

(declare-fun b!2756 () Bool)

(assert (=> b!2756 (= e!1912 (not true))))

(declare-datatypes ((tuple2!240 0))(
  ( (tuple2!241 (_1!127 array!248) (_2!127 BitStream!180)) )
))
(declare-fun lt!2570 () tuple2!240)

(declare-datatypes ((tuple2!242 0))(
  ( (tuple2!243 (_1!128 BitStream!180) (_2!128 BitStream!180)) )
))
(declare-fun lt!2567 () tuple2!242)

(declare-fun readBits!0 (BitStream!180 (_ BitVec 64)) tuple2!240)

(assert (=> b!2756 (= lt!2570 (readBits!0 (_1!128 lt!2567) nBits!460))))

(assert (=> b!2756 (validate_offset_bits!1 ((_ sign_extend 32) (size!101 (buf!413 (_2!126 lt!2569)))) ((_ sign_extend 32) (currentByte!1374 thiss!1486)) ((_ sign_extend 32) (currentBit!1369 thiss!1486)) nBits!460)))

(declare-fun lt!2568 () Unit!180)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!180 array!248 (_ BitVec 64)) Unit!180)

(assert (=> b!2756 (= lt!2568 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!413 (_2!126 lt!2569)) nBits!460))))

(declare-fun reader!0 (BitStream!180 BitStream!180) tuple2!242)

(assert (=> b!2756 (= lt!2567 (reader!0 thiss!1486 (_2!126 lt!2569)))))

(declare-fun b!2757 () Bool)

(declare-fun res!4410 () Bool)

(assert (=> b!2757 (=> (not res!4410) (not e!1912))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2757 (= res!4410 (= (bitIndex!0 (size!101 (buf!413 (_2!126 lt!2569))) (currentByte!1374 (_2!126 lt!2569)) (currentBit!1369 (_2!126 lt!2569))) (bvadd (bitIndex!0 (size!101 (buf!413 thiss!1486)) (currentByte!1374 thiss!1486) (currentBit!1369 thiss!1486)) nBits!460)))))

(assert (= (and start!802 res!4413) b!2754))

(assert (= (and b!2754 res!4409) b!2753))

(assert (= (and b!2753 res!4412) b!2755))

(assert (= (and b!2755 res!4411) b!2757))

(assert (= (and b!2757 res!4410) b!2751))

(assert (= (and b!2751 res!4414) b!2756))

(assert (= start!802 b!2752))

(declare-fun m!2639 () Bool)

(assert (=> b!2752 m!2639))

(declare-fun m!2641 () Bool)

(assert (=> b!2757 m!2641))

(declare-fun m!2643 () Bool)

(assert (=> b!2757 m!2643))

(declare-fun m!2645 () Bool)

(assert (=> b!2751 m!2645))

(declare-fun m!2647 () Bool)

(assert (=> b!2754 m!2647))

(declare-fun m!2649 () Bool)

(assert (=> b!2753 m!2649))

(declare-fun m!2651 () Bool)

(assert (=> b!2753 m!2651))

(declare-fun m!2653 () Bool)

(assert (=> b!2756 m!2653))

(declare-fun m!2655 () Bool)

(assert (=> b!2756 m!2655))

(declare-fun m!2657 () Bool)

(assert (=> b!2756 m!2657))

(declare-fun m!2659 () Bool)

(assert (=> b!2756 m!2659))

(declare-fun m!2661 () Bool)

(assert (=> start!802 m!2661))

(declare-fun m!2663 () Bool)

(assert (=> start!802 m!2663))

(check-sat (not b!2752) (not b!2757) (not b!2756) (not start!802) (not b!2754) (not b!2751) (not b!2753))
