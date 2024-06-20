; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!810 () Bool)

(assert start!810)

(declare-fun res!4484 () Bool)

(declare-fun e!1972 () Bool)

(assert (=> start!810 (=> (not res!4484) (not e!1972))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!256 0))(
  ( (array!257 (arr!492 (Array (_ BitVec 32) (_ BitVec 8))) (size!105 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!256)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!810 (= res!4484 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!105 srcBuffer!6))))))))

(assert (=> start!810 e!1972))

(assert (=> start!810 true))

(declare-fun array_inv!100 (array!256) Bool)

(assert (=> start!810 (array_inv!100 srcBuffer!6)))

(declare-datatypes ((BitStream!188 0))(
  ( (BitStream!189 (buf!417 array!256) (currentByte!1378 (_ BitVec 32)) (currentBit!1373 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!188)

(declare-fun e!1973 () Bool)

(declare-fun inv!12 (BitStream!188) Bool)

(assert (=> start!810 (and (inv!12 thiss!1486) e!1973)))

(declare-fun b!2835 () Bool)

(declare-fun res!4482 () Bool)

(declare-fun e!1970 () Bool)

(assert (=> b!2835 (=> (not res!4482) (not e!1970))))

(declare-datatypes ((Unit!188 0))(
  ( (Unit!189) )
))
(declare-datatypes ((tuple2!262 0))(
  ( (tuple2!263 (_1!138 Unit!188) (_2!138 BitStream!188)) )
))
(declare-fun lt!2618 () tuple2!262)

(assert (=> b!2835 (= res!4482 (= (size!105 (buf!417 thiss!1486)) (size!105 (buf!417 (_2!138 lt!2618)))))))

(declare-fun b!2836 () Bool)

(assert (=> b!2836 (= e!1970 (not true))))

(declare-datatypes ((tuple2!264 0))(
  ( (tuple2!265 (_1!139 array!256) (_2!139 BitStream!188)) )
))
(declare-fun lt!2615 () tuple2!264)

(declare-datatypes ((tuple2!266 0))(
  ( (tuple2!267 (_1!140 BitStream!188) (_2!140 BitStream!188)) )
))
(declare-fun lt!2617 () tuple2!266)

(declare-fun readBits!0 (BitStream!188 (_ BitVec 64)) tuple2!264)

(assert (=> b!2836 (= lt!2615 (readBits!0 (_1!140 lt!2617) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2836 (validate_offset_bits!1 ((_ sign_extend 32) (size!105 (buf!417 (_2!138 lt!2618)))) ((_ sign_extend 32) (currentByte!1378 thiss!1486)) ((_ sign_extend 32) (currentBit!1373 thiss!1486)) nBits!460)))

(declare-fun lt!2616 () Unit!188)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!188 array!256 (_ BitVec 64)) Unit!188)

(assert (=> b!2836 (= lt!2616 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!417 (_2!138 lt!2618)) nBits!460))))

(declare-fun reader!0 (BitStream!188 BitStream!188) tuple2!266)

(assert (=> b!2836 (= lt!2617 (reader!0 thiss!1486 (_2!138 lt!2618)))))

(declare-fun b!2837 () Bool)

(assert (=> b!2837 (= e!1972 e!1970)))

(declare-fun res!4486 () Bool)

(assert (=> b!2837 (=> (not res!4486) (not e!1970))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2837 (= res!4486 (invariant!0 (currentBit!1373 (_2!138 lt!2618)) (currentByte!1378 (_2!138 lt!2618)) (size!105 (buf!417 (_2!138 lt!2618)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!188 array!256 (_ BitVec 64) (_ BitVec 64)) tuple2!262)

(assert (=> b!2837 (= lt!2618 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2838 () Bool)

(declare-fun res!4483 () Bool)

(assert (=> b!2838 (=> (not res!4483) (not e!1970))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2838 (= res!4483 (= (bitIndex!0 (size!105 (buf!417 (_2!138 lt!2618))) (currentByte!1378 (_2!138 lt!2618)) (currentBit!1373 (_2!138 lt!2618))) (bvadd (bitIndex!0 (size!105 (buf!417 thiss!1486)) (currentByte!1378 thiss!1486) (currentBit!1373 thiss!1486)) nBits!460)))))

(declare-fun b!2839 () Bool)

(assert (=> b!2839 (= e!1973 (array_inv!100 (buf!417 thiss!1486)))))

(declare-fun b!2840 () Bool)

(declare-fun res!4485 () Bool)

(assert (=> b!2840 (=> (not res!4485) (not e!1972))))

(assert (=> b!2840 (= res!4485 (validate_offset_bits!1 ((_ sign_extend 32) (size!105 (buf!417 thiss!1486))) ((_ sign_extend 32) (currentByte!1378 thiss!1486)) ((_ sign_extend 32) (currentBit!1373 thiss!1486)) nBits!460))))

(declare-fun b!2841 () Bool)

(declare-fun res!4481 () Bool)

(assert (=> b!2841 (=> (not res!4481) (not e!1970))))

(declare-fun isPrefixOf!0 (BitStream!188 BitStream!188) Bool)

(assert (=> b!2841 (= res!4481 (isPrefixOf!0 thiss!1486 (_2!138 lt!2618)))))

(assert (= (and start!810 res!4484) b!2840))

(assert (= (and b!2840 res!4485) b!2837))

(assert (= (and b!2837 res!4486) b!2835))

(assert (= (and b!2835 res!4482) b!2838))

(assert (= (and b!2838 res!4483) b!2841))

(assert (= (and b!2841 res!4481) b!2836))

(assert (= start!810 b!2839))

(declare-fun m!2743 () Bool)

(assert (=> b!2837 m!2743))

(declare-fun m!2745 () Bool)

(assert (=> b!2837 m!2745))

(declare-fun m!2747 () Bool)

(assert (=> b!2839 m!2747))

(declare-fun m!2749 () Bool)

(assert (=> b!2838 m!2749))

(declare-fun m!2751 () Bool)

(assert (=> b!2838 m!2751))

(declare-fun m!2753 () Bool)

(assert (=> b!2840 m!2753))

(declare-fun m!2755 () Bool)

(assert (=> b!2836 m!2755))

(declare-fun m!2757 () Bool)

(assert (=> b!2836 m!2757))

(declare-fun m!2759 () Bool)

(assert (=> b!2836 m!2759))

(declare-fun m!2761 () Bool)

(assert (=> b!2836 m!2761))

(declare-fun m!2763 () Bool)

(assert (=> b!2841 m!2763))

(declare-fun m!2765 () Bool)

(assert (=> start!810 m!2765))

(declare-fun m!2767 () Bool)

(assert (=> start!810 m!2767))

(push 1)

(assert (not b!2839))

(assert (not b!2841))

(assert (not start!810))

(assert (not b!2840))

(assert (not b!2836))

(assert (not b!2837))

(assert (not b!2838))

(check-sat)

(pop 1)

