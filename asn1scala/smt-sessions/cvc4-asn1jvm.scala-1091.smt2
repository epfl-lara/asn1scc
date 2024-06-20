; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31388 () Bool)

(assert start!31388)

(declare-fun b!157623 () Bool)

(declare-fun e!106857 () Bool)

(declare-fun from!240 () (_ BitVec 32))

(declare-datatypes ((array!7291 0))(
  ( (array!7292 (arr!4195 (Array (_ BitVec 32) (_ BitVec 8))) (size!3300 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7291)

(assert (=> b!157623 (= e!106857 (bvsge from!240 (size!3300 arr!153)))))

(declare-datatypes ((BitStream!5792 0))(
  ( (BitStream!5793 (buf!3770 array!7291) (currentByte!6924 (_ BitVec 32)) (currentBit!6919 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14262 0))(
  ( (tuple2!14263 (_1!7584 BitStream!5792) (_2!7584 (_ BitVec 8))) )
))
(declare-fun lt!247894 () tuple2!14262)

(declare-fun lt!247891 () BitStream!5792)

(declare-fun readBytePure!0 (BitStream!5792) tuple2!14262)

(assert (=> b!157623 (= lt!247894 (readBytePure!0 lt!247891))))

(declare-fun b!157624 () Bool)

(declare-fun e!106859 () Bool)

(declare-fun bs!65 () BitStream!5792)

(declare-fun array_inv!3059 (array!7291) Bool)

(assert (=> b!157624 (= e!106859 (array_inv!3059 (buf!3770 bs!65)))))

(declare-fun b!157622 () Bool)

(declare-fun e!106856 () Bool)

(assert (=> b!157622 (= e!106856 e!106857)))

(declare-fun res!131697 () Bool)

(assert (=> b!157622 (=> (not res!131697) (not e!106857))))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!157622 (= res!131697 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14264 0))(
  ( (tuple2!14265 (_1!7585 BitStream!5792) (_2!7585 array!7291)) )
))
(declare-fun lt!247892 () tuple2!14264)

(declare-fun readByteArrayLoopPure!0 (BitStream!5792 array!7291 (_ BitVec 32) (_ BitVec 32)) tuple2!14264)

(assert (=> b!157622 (= lt!247892 (readByteArrayLoopPure!0 lt!247891 (array!7292 (store (arr!4195 arr!153) from!240 (_2!7584 (readBytePure!0 bs!65))) (size!3300 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5792 (_ BitVec 32)) BitStream!5792)

(assert (=> b!157622 (= lt!247891 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!247893 () tuple2!14264)

(assert (=> b!157622 (= lt!247893 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun res!131699 () Bool)

(assert (=> start!31388 (=> (not res!131699) (not e!106856))))

(assert (=> start!31388 (= res!131699 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3300 arr!153))))))

(assert (=> start!31388 e!106856))

(assert (=> start!31388 true))

(assert (=> start!31388 (array_inv!3059 arr!153)))

(declare-fun inv!12 (BitStream!5792) Bool)

(assert (=> start!31388 (and (inv!12 bs!65) e!106859)))

(declare-fun b!157621 () Bool)

(declare-fun res!131698 () Bool)

(assert (=> b!157621 (=> (not res!131698) (not e!106856))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157621 (= res!131698 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3300 (buf!3770 bs!65))) ((_ sign_extend 32) (currentByte!6924 bs!65)) ((_ sign_extend 32) (currentBit!6919 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31388 res!131699) b!157621))

(assert (= (and b!157621 res!131698) b!157622))

(assert (= (and b!157622 res!131697) b!157623))

(assert (= start!31388 b!157624))

(declare-fun m!246823 () Bool)

(assert (=> b!157621 m!246823))

(declare-fun m!246825 () Bool)

(assert (=> b!157624 m!246825))

(declare-fun m!246827 () Bool)

(assert (=> start!31388 m!246827))

(declare-fun m!246829 () Bool)

(assert (=> start!31388 m!246829))

(declare-fun m!246831 () Bool)

(assert (=> b!157622 m!246831))

(declare-fun m!246833 () Bool)

(assert (=> b!157622 m!246833))

(declare-fun m!246835 () Bool)

(assert (=> b!157622 m!246835))

(declare-fun m!246837 () Bool)

(assert (=> b!157622 m!246837))

(declare-fun m!246839 () Bool)

(assert (=> b!157622 m!246839))

(declare-fun m!246841 () Bool)

(assert (=> b!157623 m!246841))

(push 1)

(assert (not b!157622))

(assert (not start!31388))

(assert (not b!157623))

(assert (not b!157621))

(assert (not b!157624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

