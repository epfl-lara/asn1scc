; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27484 () Bool)

(assert start!27484)

(declare-fun b!141644 () Bool)

(declare-fun e!94366 () Bool)

(declare-datatypes ((array!6499 0))(
  ( (array!6500 (arr!3650 (Array (_ BitVec 32) (_ BitVec 8))) (size!2943 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5144 0))(
  ( (BitStream!5145 (buf!3364 array!6499) (currentByte!6224 (_ BitVec 32)) (currentBit!6219 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5144)

(declare-fun array_inv!2732 (array!6499) Bool)

(assert (=> b!141644 (= e!94366 (array_inv!2732 (buf!3364 thiss!1634)))))

(declare-fun b!141645 () Bool)

(declare-fun res!118176 () Bool)

(declare-fun e!94369 () Bool)

(assert (=> b!141645 (=> (not res!118176) (not e!94369))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!141645 (= res!118176 (bvslt from!447 to!404))))

(declare-fun b!141646 () Bool)

(declare-datatypes ((tuple2!12560 0))(
  ( (tuple2!12561 (_1!6610 BitStream!5144) (_2!6610 array!6499)) )
))
(declare-fun lt!219694 () tuple2!12560)

(declare-fun arr!237 () array!6499)

(declare-fun e!94371 () Bool)

(declare-fun arrayRangesEq!259 (array!6499 array!6499 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141646 (= e!94371 (not (arrayRangesEq!259 arr!237 (_2!6610 lt!219694) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141647 () Bool)

(declare-fun res!118173 () Bool)

(declare-fun e!94368 () Bool)

(assert (=> b!141647 (=> (not res!118173) (not e!94368))))

(declare-datatypes ((Unit!8868 0))(
  ( (Unit!8869) )
))
(declare-datatypes ((tuple2!12562 0))(
  ( (tuple2!12563 (_1!6611 Unit!8868) (_2!6611 BitStream!5144)) )
))
(declare-fun lt!219698 () tuple2!12562)

(declare-fun lt!219689 () tuple2!12562)

(declare-fun isPrefixOf!0 (BitStream!5144 BitStream!5144) Bool)

(assert (=> b!141647 (= res!118173 (isPrefixOf!0 (_2!6611 lt!219698) (_2!6611 lt!219689)))))

(declare-fun b!141648 () Bool)

(assert (=> b!141648 (= e!94368 (not e!94371))))

(declare-fun res!118167 () Bool)

(assert (=> b!141648 (=> res!118167 e!94371)))

(declare-datatypes ((tuple2!12564 0))(
  ( (tuple2!12565 (_1!6612 BitStream!5144) (_2!6612 BitStream!5144)) )
))
(declare-fun lt!219697 () tuple2!12564)

(assert (=> b!141648 (= res!118167 (or (not (= (size!2943 (_2!6610 lt!219694)) (size!2943 arr!237))) (not (= (_1!6610 lt!219694) (_2!6612 lt!219697)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5144 array!6499 (_ BitVec 32) (_ BitVec 32)) tuple2!12560)

(assert (=> b!141648 (= lt!219694 (readByteArrayLoopPure!0 (_1!6612 lt!219697) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!219690 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141648 (validate_offset_bits!1 ((_ sign_extend 32) (size!2943 (buf!3364 (_2!6611 lt!219689)))) ((_ sign_extend 32) (currentByte!6224 (_2!6611 lt!219698))) ((_ sign_extend 32) (currentBit!6219 (_2!6611 lt!219698))) lt!219690)))

(declare-fun lt!219691 () Unit!8868)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5144 array!6499 (_ BitVec 64)) Unit!8868)

(assert (=> b!141648 (= lt!219691 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6611 lt!219698) (buf!3364 (_2!6611 lt!219689)) lt!219690))))

(declare-fun reader!0 (BitStream!5144 BitStream!5144) tuple2!12564)

(assert (=> b!141648 (= lt!219697 (reader!0 (_2!6611 lt!219698) (_2!6611 lt!219689)))))

(declare-fun res!118171 () Bool)

(assert (=> start!27484 (=> (not res!118171) (not e!94369))))

(assert (=> start!27484 (= res!118171 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2943 arr!237))))))

(assert (=> start!27484 e!94369))

(assert (=> start!27484 true))

(assert (=> start!27484 (array_inv!2732 arr!237)))

(declare-fun inv!12 (BitStream!5144) Bool)

(assert (=> start!27484 (and (inv!12 thiss!1634) e!94366)))

(declare-fun b!141649 () Bool)

(declare-fun res!118168 () Bool)

(assert (=> b!141649 (=> (not res!118168) (not e!94369))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141649 (= res!118168 (invariant!0 (currentBit!6219 thiss!1634) (currentByte!6224 thiss!1634) (size!2943 (buf!3364 thiss!1634))))))

(declare-fun b!141650 () Bool)

(assert (=> b!141650 (= e!94369 (not true))))

(declare-fun e!94374 () Bool)

(assert (=> b!141650 e!94374))

(declare-fun res!118170 () Bool)

(assert (=> b!141650 (=> (not res!118170) (not e!94374))))

(assert (=> b!141650 (= res!118170 (isPrefixOf!0 thiss!1634 (_2!6611 lt!219689)))))

(declare-fun lt!219693 () Unit!8868)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5144 BitStream!5144 BitStream!5144) Unit!8868)

(assert (=> b!141650 (= lt!219693 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6611 lt!219698) (_2!6611 lt!219689)))))

(declare-fun e!94372 () Bool)

(assert (=> b!141650 e!94372))

(declare-fun res!118177 () Bool)

(assert (=> b!141650 (=> (not res!118177) (not e!94372))))

(assert (=> b!141650 (= res!118177 (= (size!2943 (buf!3364 (_2!6611 lt!219698))) (size!2943 (buf!3364 (_2!6611 lt!219689)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5144 array!6499 (_ BitVec 32) (_ BitVec 32)) tuple2!12562)

(assert (=> b!141650 (= lt!219689 (appendByteArrayLoop!0 (_2!6611 lt!219698) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141650 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2943 (buf!3364 (_2!6611 lt!219698)))) ((_ sign_extend 32) (currentByte!6224 (_2!6611 lt!219698))) ((_ sign_extend 32) (currentBit!6219 (_2!6611 lt!219698))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219692 () Unit!8868)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5144 BitStream!5144 (_ BitVec 64) (_ BitVec 32)) Unit!8868)

(assert (=> b!141650 (= lt!219692 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6611 lt!219698) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94367 () Bool)

(assert (=> b!141650 e!94367))

(declare-fun res!118174 () Bool)

(assert (=> b!141650 (=> (not res!118174) (not e!94367))))

(assert (=> b!141650 (= res!118174 (= (size!2943 (buf!3364 thiss!1634)) (size!2943 (buf!3364 (_2!6611 lt!219698)))))))

(declare-fun appendByte!0 (BitStream!5144 (_ BitVec 8)) tuple2!12562)

(assert (=> b!141650 (= lt!219698 (appendByte!0 thiss!1634 (select (arr!3650 arr!237) from!447)))))

(declare-fun b!141651 () Bool)

(assert (=> b!141651 (= e!94372 e!94368)))

(declare-fun res!118172 () Bool)

(assert (=> b!141651 (=> (not res!118172) (not e!94368))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141651 (= res!118172 (= (bitIndex!0 (size!2943 (buf!3364 (_2!6611 lt!219689))) (currentByte!6224 (_2!6611 lt!219689)) (currentBit!6219 (_2!6611 lt!219689))) (bvadd (bitIndex!0 (size!2943 (buf!3364 (_2!6611 lt!219698))) (currentByte!6224 (_2!6611 lt!219698)) (currentBit!6219 (_2!6611 lt!219698))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219690))))))

(assert (=> b!141651 (= lt!219690 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141652 () Bool)

(declare-fun res!118175 () Bool)

(assert (=> b!141652 (=> (not res!118175) (not e!94367))))

(assert (=> b!141652 (= res!118175 (= (bitIndex!0 (size!2943 (buf!3364 (_2!6611 lt!219698))) (currentByte!6224 (_2!6611 lt!219698)) (currentBit!6219 (_2!6611 lt!219698))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2943 (buf!3364 thiss!1634)) (currentByte!6224 thiss!1634) (currentBit!6219 thiss!1634)))))))

(declare-datatypes ((tuple2!12566 0))(
  ( (tuple2!12567 (_1!6613 BitStream!5144) (_2!6613 (_ BitVec 8))) )
))
(declare-fun lt!219695 () tuple2!12566)

(declare-fun b!141653 () Bool)

(declare-fun lt!219696 () tuple2!12564)

(assert (=> b!141653 (= e!94367 (and (= (_2!6613 lt!219695) (select (arr!3650 arr!237) from!447)) (= (_1!6613 lt!219695) (_2!6612 lt!219696))))))

(declare-fun readBytePure!0 (BitStream!5144) tuple2!12566)

(assert (=> b!141653 (= lt!219695 (readBytePure!0 (_1!6612 lt!219696)))))

(assert (=> b!141653 (= lt!219696 (reader!0 thiss!1634 (_2!6611 lt!219698)))))

(declare-fun b!141654 () Bool)

(assert (=> b!141654 (= e!94374 (invariant!0 (currentBit!6219 thiss!1634) (currentByte!6224 thiss!1634) (size!2943 (buf!3364 (_2!6611 lt!219698)))))))

(declare-fun b!141655 () Bool)

(declare-fun res!118169 () Bool)

(assert (=> b!141655 (=> (not res!118169) (not e!94367))))

(assert (=> b!141655 (= res!118169 (isPrefixOf!0 thiss!1634 (_2!6611 lt!219698)))))

(declare-fun b!141656 () Bool)

(declare-fun res!118166 () Bool)

(assert (=> b!141656 (=> (not res!118166) (not e!94369))))

(assert (=> b!141656 (= res!118166 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2943 (buf!3364 thiss!1634))) ((_ sign_extend 32) (currentByte!6224 thiss!1634)) ((_ sign_extend 32) (currentBit!6219 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27484 res!118171) b!141656))

(assert (= (and b!141656 res!118166) b!141645))

(assert (= (and b!141645 res!118176) b!141649))

(assert (= (and b!141649 res!118168) b!141650))

(assert (= (and b!141650 res!118174) b!141652))

(assert (= (and b!141652 res!118175) b!141655))

(assert (= (and b!141655 res!118169) b!141653))

(assert (= (and b!141650 res!118177) b!141651))

(assert (= (and b!141651 res!118172) b!141647))

(assert (= (and b!141647 res!118173) b!141648))

(assert (= (and b!141648 (not res!118167)) b!141646))

(assert (= (and b!141650 res!118170) b!141654))

(assert (= start!27484 b!141644))

(declare-fun m!217581 () Bool)

(assert (=> b!141650 m!217581))

(declare-fun m!217583 () Bool)

(assert (=> b!141650 m!217583))

(declare-fun m!217585 () Bool)

(assert (=> b!141650 m!217585))

(declare-fun m!217587 () Bool)

(assert (=> b!141650 m!217587))

(declare-fun m!217589 () Bool)

(assert (=> b!141650 m!217589))

(declare-fun m!217591 () Bool)

(assert (=> b!141650 m!217591))

(declare-fun m!217593 () Bool)

(assert (=> b!141650 m!217593))

(assert (=> b!141650 m!217591))

(declare-fun m!217595 () Bool)

(assert (=> b!141652 m!217595))

(declare-fun m!217597 () Bool)

(assert (=> b!141652 m!217597))

(declare-fun m!217599 () Bool)

(assert (=> b!141647 m!217599))

(declare-fun m!217601 () Bool)

(assert (=> b!141649 m!217601))

(assert (=> b!141653 m!217591))

(declare-fun m!217603 () Bool)

(assert (=> b!141653 m!217603))

(declare-fun m!217605 () Bool)

(assert (=> b!141653 m!217605))

(declare-fun m!217607 () Bool)

(assert (=> b!141651 m!217607))

(assert (=> b!141651 m!217595))

(declare-fun m!217609 () Bool)

(assert (=> b!141654 m!217609))

(declare-fun m!217611 () Bool)

(assert (=> start!27484 m!217611))

(declare-fun m!217613 () Bool)

(assert (=> start!27484 m!217613))

(declare-fun m!217615 () Bool)

(assert (=> b!141655 m!217615))

(declare-fun m!217617 () Bool)

(assert (=> b!141656 m!217617))

(declare-fun m!217619 () Bool)

(assert (=> b!141646 m!217619))

(declare-fun m!217621 () Bool)

(assert (=> b!141644 m!217621))

(declare-fun m!217623 () Bool)

(assert (=> b!141648 m!217623))

(declare-fun m!217625 () Bool)

(assert (=> b!141648 m!217625))

(declare-fun m!217627 () Bool)

(assert (=> b!141648 m!217627))

(declare-fun m!217629 () Bool)

(assert (=> b!141648 m!217629))

(push 1)

(assert (not b!141652))

(assert (not b!141646))

(assert (not b!141650))

(assert (not start!27484))

(assert (not b!141655))

(assert (not b!141651))

(assert (not b!141647))

(assert (not b!141653))

(assert (not b!141654))

(assert (not b!141656))

(assert (not b!141644))

(assert (not b!141648))

(assert (not b!141649))

(check-sat)

