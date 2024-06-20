; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!804 () Bool)

(assert start!804)

(declare-fun res!4431 () Bool)

(declare-fun e!1926 () Bool)

(assert (=> start!804 (=> (not res!4431) (not e!1926))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!250 0))(
  ( (array!251 (arr!489 (Array (_ BitVec 32) (_ BitVec 8))) (size!102 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!250)

(assert (=> start!804 (= res!4431 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!102 srcBuffer!6))))))))

(assert (=> start!804 e!1926))

(assert (=> start!804 true))

(declare-fun array_inv!97 (array!250) Bool)

(assert (=> start!804 (array_inv!97 srcBuffer!6)))

(declare-datatypes ((BitStream!182 0))(
  ( (BitStream!183 (buf!414 array!250) (currentByte!1375 (_ BitVec 32)) (currentBit!1370 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!182)

(declare-fun e!1924 () Bool)

(declare-fun inv!12 (BitStream!182) Bool)

(assert (=> start!804 (and (inv!12 thiss!1486) e!1924)))

(declare-fun b!2772 () Bool)

(declare-fun res!4428 () Bool)

(declare-fun e!1925 () Bool)

(assert (=> b!2772 (=> (not res!4428) (not e!1925))))

(declare-datatypes ((Unit!182 0))(
  ( (Unit!183) )
))
(declare-datatypes ((tuple2!244 0))(
  ( (tuple2!245 (_1!129 Unit!182) (_2!129 BitStream!182)) )
))
(declare-fun lt!2581 () tuple2!244)

(assert (=> b!2772 (= res!4428 (= (size!102 (buf!414 thiss!1486)) (size!102 (buf!414 (_2!129 lt!2581)))))))

(declare-fun b!2773 () Bool)

(assert (=> b!2773 (= e!1925 (not true))))

(declare-datatypes ((tuple2!246 0))(
  ( (tuple2!247 (_1!130 array!250) (_2!130 BitStream!182)) )
))
(declare-fun lt!2580 () tuple2!246)

(declare-datatypes ((tuple2!248 0))(
  ( (tuple2!249 (_1!131 BitStream!182) (_2!131 BitStream!182)) )
))
(declare-fun lt!2579 () tuple2!248)

(declare-fun readBits!0 (BitStream!182 (_ BitVec 64)) tuple2!246)

(assert (=> b!2773 (= lt!2580 (readBits!0 (_1!131 lt!2579) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2773 (validate_offset_bits!1 ((_ sign_extend 32) (size!102 (buf!414 (_2!129 lt!2581)))) ((_ sign_extend 32) (currentByte!1375 thiss!1486)) ((_ sign_extend 32) (currentBit!1370 thiss!1486)) nBits!460)))

(declare-fun lt!2582 () Unit!182)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!182 array!250 (_ BitVec 64)) Unit!182)

(assert (=> b!2773 (= lt!2582 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!414 (_2!129 lt!2581)) nBits!460))))

(declare-fun reader!0 (BitStream!182 BitStream!182) tuple2!248)

(assert (=> b!2773 (= lt!2579 (reader!0 thiss!1486 (_2!129 lt!2581)))))

(declare-fun b!2774 () Bool)

(assert (=> b!2774 (= e!1926 e!1925)))

(declare-fun res!4427 () Bool)

(assert (=> b!2774 (=> (not res!4427) (not e!1925))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2774 (= res!4427 (invariant!0 (currentBit!1370 (_2!129 lt!2581)) (currentByte!1375 (_2!129 lt!2581)) (size!102 (buf!414 (_2!129 lt!2581)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!182 array!250 (_ BitVec 64) (_ BitVec 64)) tuple2!244)

(assert (=> b!2774 (= lt!2581 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2775 () Bool)

(declare-fun res!4430 () Bool)

(assert (=> b!2775 (=> (not res!4430) (not e!1925))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2775 (= res!4430 (= (bitIndex!0 (size!102 (buf!414 (_2!129 lt!2581))) (currentByte!1375 (_2!129 lt!2581)) (currentBit!1370 (_2!129 lt!2581))) (bvadd (bitIndex!0 (size!102 (buf!414 thiss!1486)) (currentByte!1375 thiss!1486) (currentBit!1370 thiss!1486)) nBits!460)))))

(declare-fun b!2776 () Bool)

(declare-fun res!4429 () Bool)

(assert (=> b!2776 (=> (not res!4429) (not e!1926))))

(assert (=> b!2776 (= res!4429 (validate_offset_bits!1 ((_ sign_extend 32) (size!102 (buf!414 thiss!1486))) ((_ sign_extend 32) (currentByte!1375 thiss!1486)) ((_ sign_extend 32) (currentBit!1370 thiss!1486)) nBits!460))))

(declare-fun b!2777 () Bool)

(declare-fun res!4432 () Bool)

(assert (=> b!2777 (=> (not res!4432) (not e!1925))))

(declare-fun isPrefixOf!0 (BitStream!182 BitStream!182) Bool)

(assert (=> b!2777 (= res!4432 (isPrefixOf!0 thiss!1486 (_2!129 lt!2581)))))

(declare-fun b!2778 () Bool)

(assert (=> b!2778 (= e!1924 (array_inv!97 (buf!414 thiss!1486)))))

(assert (= (and start!804 res!4431) b!2776))

(assert (= (and b!2776 res!4429) b!2774))

(assert (= (and b!2774 res!4427) b!2772))

(assert (= (and b!2772 res!4428) b!2775))

(assert (= (and b!2775 res!4430) b!2777))

(assert (= (and b!2777 res!4432) b!2773))

(assert (= start!804 b!2778))

(declare-fun m!2665 () Bool)

(assert (=> b!2778 m!2665))

(declare-fun m!2667 () Bool)

(assert (=> start!804 m!2667))

(declare-fun m!2669 () Bool)

(assert (=> start!804 m!2669))

(declare-fun m!2671 () Bool)

(assert (=> b!2773 m!2671))

(declare-fun m!2673 () Bool)

(assert (=> b!2773 m!2673))

(declare-fun m!2675 () Bool)

(assert (=> b!2773 m!2675))

(declare-fun m!2677 () Bool)

(assert (=> b!2773 m!2677))

(declare-fun m!2679 () Bool)

(assert (=> b!2776 m!2679))

(declare-fun m!2681 () Bool)

(assert (=> b!2775 m!2681))

(declare-fun m!2683 () Bool)

(assert (=> b!2775 m!2683))

(declare-fun m!2685 () Bool)

(assert (=> b!2774 m!2685))

(declare-fun m!2687 () Bool)

(assert (=> b!2774 m!2687))

(declare-fun m!2689 () Bool)

(assert (=> b!2777 m!2689))

(push 1)

