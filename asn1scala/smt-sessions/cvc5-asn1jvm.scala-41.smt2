; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!812 () Bool)

(assert start!812)

(declare-fun b!2856 () Bool)

(declare-fun e!1988 () Bool)

(declare-datatypes ((array!258 0))(
  ( (array!259 (arr!493 (Array (_ BitVec 32) (_ BitVec 8))) (size!106 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!190 0))(
  ( (BitStream!191 (buf!418 array!258) (currentByte!1379 (_ BitVec 32)) (currentBit!1374 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!190)

(declare-fun array_inv!101 (array!258) Bool)

(assert (=> b!2856 (= e!1988 (array_inv!101 (buf!418 thiss!1486)))))

(declare-fun b!2857 () Bool)

(declare-fun e!1984 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> b!2857 (= e!1984 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460))))))

(declare-datatypes ((tuple2!268 0))(
  ( (tuple2!269 (_1!141 array!258) (_2!141 BitStream!190)) )
))
(declare-fun lt!2627 () tuple2!268)

(declare-datatypes ((tuple2!270 0))(
  ( (tuple2!271 (_1!142 BitStream!190) (_2!142 BitStream!190)) )
))
(declare-fun lt!2629 () tuple2!270)

(declare-fun readBits!0 (BitStream!190 (_ BitVec 64)) tuple2!268)

(assert (=> b!2857 (= lt!2627 (readBits!0 (_1!142 lt!2629) nBits!460))))

(declare-datatypes ((Unit!190 0))(
  ( (Unit!191) )
))
(declare-datatypes ((tuple2!272 0))(
  ( (tuple2!273 (_1!143 Unit!190) (_2!143 BitStream!190)) )
))
(declare-fun lt!2630 () tuple2!272)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2857 (validate_offset_bits!1 ((_ sign_extend 32) (size!106 (buf!418 (_2!143 lt!2630)))) ((_ sign_extend 32) (currentByte!1379 thiss!1486)) ((_ sign_extend 32) (currentBit!1374 thiss!1486)) nBits!460)))

(declare-fun lt!2628 () Unit!190)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!190 array!258 (_ BitVec 64)) Unit!190)

(assert (=> b!2857 (= lt!2628 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!418 (_2!143 lt!2630)) nBits!460))))

(declare-fun reader!0 (BitStream!190 BitStream!190) tuple2!270)

(assert (=> b!2857 (= lt!2629 (reader!0 thiss!1486 (_2!143 lt!2630)))))

(declare-fun res!4502 () Bool)

(declare-fun e!1986 () Bool)

(assert (=> start!812 (=> (not res!4502) (not e!1986))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!258)

(assert (=> start!812 (= res!4502 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!106 srcBuffer!6))))))))

(assert (=> start!812 e!1986))

(assert (=> start!812 true))

(assert (=> start!812 (array_inv!101 srcBuffer!6)))

(declare-fun inv!12 (BitStream!190) Bool)

(assert (=> start!812 (and (inv!12 thiss!1486) e!1988)))

(declare-fun b!2858 () Bool)

(declare-fun res!4503 () Bool)

(assert (=> b!2858 (=> (not res!4503) (not e!1984))))

(declare-fun isPrefixOf!0 (BitStream!190 BitStream!190) Bool)

(assert (=> b!2858 (= res!4503 (isPrefixOf!0 thiss!1486 (_2!143 lt!2630)))))

(declare-fun b!2859 () Bool)

(declare-fun res!4501 () Bool)

(assert (=> b!2859 (=> (not res!4501) (not e!1986))))

(assert (=> b!2859 (= res!4501 (validate_offset_bits!1 ((_ sign_extend 32) (size!106 (buf!418 thiss!1486))) ((_ sign_extend 32) (currentByte!1379 thiss!1486)) ((_ sign_extend 32) (currentBit!1374 thiss!1486)) nBits!460))))

(declare-fun b!2860 () Bool)

(declare-fun res!4504 () Bool)

(assert (=> b!2860 (=> (not res!4504) (not e!1984))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2860 (= res!4504 (= (bitIndex!0 (size!106 (buf!418 (_2!143 lt!2630))) (currentByte!1379 (_2!143 lt!2630)) (currentBit!1374 (_2!143 lt!2630))) (bvadd (bitIndex!0 (size!106 (buf!418 thiss!1486)) (currentByte!1379 thiss!1486) (currentBit!1374 thiss!1486)) nBits!460)))))

(declare-fun b!2861 () Bool)

(declare-fun res!4500 () Bool)

(assert (=> b!2861 (=> (not res!4500) (not e!1984))))

(assert (=> b!2861 (= res!4500 (= (size!106 (buf!418 thiss!1486)) (size!106 (buf!418 (_2!143 lt!2630)))))))

(declare-fun b!2862 () Bool)

(assert (=> b!2862 (= e!1986 e!1984)))

(declare-fun res!4499 () Bool)

(assert (=> b!2862 (=> (not res!4499) (not e!1984))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2862 (= res!4499 (invariant!0 (currentBit!1374 (_2!143 lt!2630)) (currentByte!1379 (_2!143 lt!2630)) (size!106 (buf!418 (_2!143 lt!2630)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!190 array!258 (_ BitVec 64) (_ BitVec 64)) tuple2!272)

(assert (=> b!2862 (= lt!2630 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!812 res!4502) b!2859))

(assert (= (and b!2859 res!4501) b!2862))

(assert (= (and b!2862 res!4499) b!2861))

(assert (= (and b!2861 res!4500) b!2860))

(assert (= (and b!2860 res!4504) b!2858))

(assert (= (and b!2858 res!4503) b!2857))

(assert (= start!812 b!2856))

(declare-fun m!2769 () Bool)

(assert (=> b!2858 m!2769))

(declare-fun m!2771 () Bool)

(assert (=> start!812 m!2771))

(declare-fun m!2773 () Bool)

(assert (=> start!812 m!2773))

(declare-fun m!2775 () Bool)

(assert (=> b!2860 m!2775))

(declare-fun m!2777 () Bool)

(assert (=> b!2860 m!2777))

(declare-fun m!2779 () Bool)

(assert (=> b!2862 m!2779))

(declare-fun m!2781 () Bool)

(assert (=> b!2862 m!2781))

(declare-fun m!2783 () Bool)

(assert (=> b!2859 m!2783))

(declare-fun m!2785 () Bool)

(assert (=> b!2856 m!2785))

(declare-fun m!2787 () Bool)

(assert (=> b!2857 m!2787))

(declare-fun m!2789 () Bool)

(assert (=> b!2857 m!2789))

(declare-fun m!2791 () Bool)

(assert (=> b!2857 m!2791))

(declare-fun m!2793 () Bool)

(assert (=> b!2857 m!2793))

(push 1)

(assert (not b!2857))

(assert (not b!2858))

(assert (not b!2860))

(assert (not start!812))

(assert (not b!2856))

(assert (not b!2859))

(assert (not b!2862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

