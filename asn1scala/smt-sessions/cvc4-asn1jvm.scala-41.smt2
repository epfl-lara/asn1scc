; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!816 () Bool)

(assert start!816)

(declare-fun b!2898 () Bool)

(declare-fun e!2017 () Bool)

(declare-datatypes ((array!262 0))(
  ( (array!263 (arr!495 (Array (_ BitVec 32) (_ BitVec 8))) (size!108 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!194 0))(
  ( (BitStream!195 (buf!420 array!262) (currentByte!1381 (_ BitVec 32)) (currentBit!1376 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!194)

(declare-fun array_inv!103 (array!262) Bool)

(assert (=> b!2898 (= e!2017 (array_inv!103 (buf!420 thiss!1486)))))

(declare-fun b!2899 () Bool)

(declare-fun res!4535 () Bool)

(declare-fun e!2018 () Bool)

(assert (=> b!2899 (=> (not res!4535) (not e!2018))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2899 (= res!4535 (validate_offset_bits!1 ((_ sign_extend 32) (size!108 (buf!420 thiss!1486))) ((_ sign_extend 32) (currentByte!1381 thiss!1486)) ((_ sign_extend 32) (currentBit!1376 thiss!1486)) nBits!460))))

(declare-fun res!4538 () Bool)

(assert (=> start!816 (=> (not res!4538) (not e!2018))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!262)

(assert (=> start!816 (= res!4538 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!108 srcBuffer!6))))))))

(assert (=> start!816 e!2018))

(assert (=> start!816 true))

(assert (=> start!816 (array_inv!103 srcBuffer!6)))

(declare-fun inv!12 (BitStream!194) Bool)

(assert (=> start!816 (and (inv!12 thiss!1486) e!2017)))

(declare-fun b!2900 () Bool)

(declare-fun e!2014 () Bool)

(assert (=> b!2900 (= e!2014 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460))))))

(declare-datatypes ((tuple2!280 0))(
  ( (tuple2!281 (_1!147 array!262) (_2!147 BitStream!194)) )
))
(declare-fun lt!2652 () tuple2!280)

(declare-datatypes ((tuple2!282 0))(
  ( (tuple2!283 (_1!148 BitStream!194) (_2!148 BitStream!194)) )
))
(declare-fun lt!2654 () tuple2!282)

(declare-fun readBits!0 (BitStream!194 (_ BitVec 64)) tuple2!280)

(assert (=> b!2900 (= lt!2652 (readBits!0 (_1!148 lt!2654) nBits!460))))

(declare-datatypes ((Unit!194 0))(
  ( (Unit!195) )
))
(declare-datatypes ((tuple2!284 0))(
  ( (tuple2!285 (_1!149 Unit!194) (_2!149 BitStream!194)) )
))
(declare-fun lt!2651 () tuple2!284)

(assert (=> b!2900 (validate_offset_bits!1 ((_ sign_extend 32) (size!108 (buf!420 (_2!149 lt!2651)))) ((_ sign_extend 32) (currentByte!1381 thiss!1486)) ((_ sign_extend 32) (currentBit!1376 thiss!1486)) nBits!460)))

(declare-fun lt!2653 () Unit!194)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!194 array!262 (_ BitVec 64)) Unit!194)

(assert (=> b!2900 (= lt!2653 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!420 (_2!149 lt!2651)) nBits!460))))

(declare-fun reader!0 (BitStream!194 BitStream!194) tuple2!282)

(assert (=> b!2900 (= lt!2654 (reader!0 thiss!1486 (_2!149 lt!2651)))))

(declare-fun b!2901 () Bool)

(declare-fun res!4540 () Bool)

(assert (=> b!2901 (=> (not res!4540) (not e!2014))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2901 (= res!4540 (= (bitIndex!0 (size!108 (buf!420 (_2!149 lt!2651))) (currentByte!1381 (_2!149 lt!2651)) (currentBit!1376 (_2!149 lt!2651))) (bvadd (bitIndex!0 (size!108 (buf!420 thiss!1486)) (currentByte!1381 thiss!1486) (currentBit!1376 thiss!1486)) nBits!460)))))

(declare-fun b!2902 () Bool)

(declare-fun res!4536 () Bool)

(assert (=> b!2902 (=> (not res!4536) (not e!2014))))

(declare-fun isPrefixOf!0 (BitStream!194 BitStream!194) Bool)

(assert (=> b!2902 (= res!4536 (isPrefixOf!0 thiss!1486 (_2!149 lt!2651)))))

(declare-fun b!2903 () Bool)

(declare-fun res!4539 () Bool)

(assert (=> b!2903 (=> (not res!4539) (not e!2014))))

(assert (=> b!2903 (= res!4539 (= (size!108 (buf!420 thiss!1486)) (size!108 (buf!420 (_2!149 lt!2651)))))))

(declare-fun b!2904 () Bool)

(assert (=> b!2904 (= e!2018 e!2014)))

(declare-fun res!4537 () Bool)

(assert (=> b!2904 (=> (not res!4537) (not e!2014))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2904 (= res!4537 (invariant!0 (currentBit!1376 (_2!149 lt!2651)) (currentByte!1381 (_2!149 lt!2651)) (size!108 (buf!420 (_2!149 lt!2651)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!194 array!262 (_ BitVec 64) (_ BitVec 64)) tuple2!284)

(assert (=> b!2904 (= lt!2651 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!816 res!4538) b!2899))

(assert (= (and b!2899 res!4535) b!2904))

(assert (= (and b!2904 res!4537) b!2903))

(assert (= (and b!2903 res!4539) b!2901))

(assert (= (and b!2901 res!4540) b!2902))

(assert (= (and b!2902 res!4536) b!2900))

(assert (= start!816 b!2898))

(declare-fun m!2821 () Bool)

(assert (=> b!2898 m!2821))

(declare-fun m!2823 () Bool)

(assert (=> b!2899 m!2823))

(declare-fun m!2825 () Bool)

(assert (=> b!2901 m!2825))

(declare-fun m!2827 () Bool)

(assert (=> b!2901 m!2827))

(declare-fun m!2829 () Bool)

(assert (=> start!816 m!2829))

(declare-fun m!2831 () Bool)

(assert (=> start!816 m!2831))

(declare-fun m!2833 () Bool)

(assert (=> b!2900 m!2833))

(declare-fun m!2835 () Bool)

(assert (=> b!2900 m!2835))

(declare-fun m!2837 () Bool)

(assert (=> b!2900 m!2837))

(declare-fun m!2839 () Bool)

(assert (=> b!2900 m!2839))

(declare-fun m!2841 () Bool)

(assert (=> b!2904 m!2841))

(declare-fun m!2843 () Bool)

(assert (=> b!2904 m!2843))

(declare-fun m!2845 () Bool)

(assert (=> b!2902 m!2845))

(push 1)

(assert (not b!2904))

(assert (not b!2898))

(assert (not start!816))

(assert (not b!2899))

(assert (not b!2901))

(assert (not b!2900))

(assert (not b!2902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

