; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25054 () Bool)

(assert start!25054)

(declare-fun b!126879 () Bool)

(declare-fun e!83670 () Bool)

(declare-fun e!83674 () Bool)

(assert (=> b!126879 (= e!83670 e!83674)))

(declare-fun res!105168 () Bool)

(assert (=> b!126879 (=> (not res!105168) (not e!83674))))

(declare-datatypes ((array!5742 0))(
  ( (array!5743 (arr!3209 (Array (_ BitVec 32) (_ BitVec 8))) (size!2598 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4520 0))(
  ( (BitStream!4521 (buf!2983 array!5742) (currentByte!5722 (_ BitVec 32)) (currentBit!5717 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4520)

(declare-datatypes ((Unit!7802 0))(
  ( (Unit!7803) )
))
(declare-datatypes ((tuple2!10654 0))(
  ( (tuple2!10655 (_1!5612 Unit!7802) (_2!5612 BitStream!4520)) )
))
(declare-fun lt!198166 () tuple2!10654)

(declare-fun lt!198170 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126879 (= res!105168 (= (bitIndex!0 (size!2598 (buf!2983 (_2!5612 lt!198166))) (currentByte!5722 (_2!5612 lt!198166)) (currentBit!5717 (_2!5612 lt!198166))) (bvadd (bitIndex!0 (size!2598 (buf!2983 thiss!1614)) (currentByte!5722 thiss!1614) (currentBit!5717 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198170))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!126879 (= lt!198170 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126880 () Bool)

(declare-fun e!83671 () Bool)

(assert (=> b!126880 (= e!83671 true)))

(declare-datatypes ((tuple2!10656 0))(
  ( (tuple2!10657 (_1!5613 BitStream!4520) (_2!5613 array!5742)) )
))
(declare-fun lt!198164 () tuple2!10656)

(declare-datatypes ((tuple2!10658 0))(
  ( (tuple2!10659 (_1!5614 BitStream!4520) (_2!5614 BitStream!4520)) )
))
(declare-fun lt!198165 () tuple2!10658)

(declare-fun arr!227 () array!5742)

(declare-fun readByteArrayLoopPure!0 (BitStream!4520 array!5742 (_ BitVec 32) (_ BitVec 32)) tuple2!10656)

(assert (=> b!126880 (= lt!198164 (readByteArrayLoopPure!0 (_1!5614 lt!198165) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126880 (validate_offset_bits!1 ((_ sign_extend 32) (size!2598 (buf!2983 (_2!5612 lt!198166)))) ((_ sign_extend 32) (currentByte!5722 thiss!1614)) ((_ sign_extend 32) (currentBit!5717 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198169 () Unit!7802)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4520 array!5742 (_ BitVec 64)) Unit!7802)

(assert (=> b!126880 (= lt!198169 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2983 (_2!5612 lt!198166)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4520 BitStream!4520) tuple2!10658)

(assert (=> b!126880 (= lt!198165 (reader!0 thiss!1614 (_2!5612 lt!198166)))))

(declare-fun b!126881 () Bool)

(declare-fun res!105169 () Bool)

(assert (=> b!126881 (=> (not res!105169) (not e!83674))))

(declare-fun isPrefixOf!0 (BitStream!4520 BitStream!4520) Bool)

(assert (=> b!126881 (= res!105169 (isPrefixOf!0 thiss!1614 (_2!5612 lt!198166)))))

(declare-fun b!126882 () Bool)

(declare-fun e!83673 () Bool)

(assert (=> b!126882 (= e!83674 (not e!83673))))

(declare-fun res!105165 () Bool)

(assert (=> b!126882 (=> res!105165 e!83673)))

(declare-fun lt!198163 () tuple2!10656)

(declare-fun lt!198168 () tuple2!10658)

(assert (=> b!126882 (= res!105165 (or (not (= (size!2598 (_2!5613 lt!198163)) (size!2598 arr!227))) (not (= (_1!5613 lt!198163) (_2!5614 lt!198168)))))))

(assert (=> b!126882 (= lt!198163 (readByteArrayLoopPure!0 (_1!5614 lt!198168) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!126882 (validate_offset_bits!1 ((_ sign_extend 32) (size!2598 (buf!2983 (_2!5612 lt!198166)))) ((_ sign_extend 32) (currentByte!5722 thiss!1614)) ((_ sign_extend 32) (currentBit!5717 thiss!1614)) lt!198170)))

(declare-fun lt!198167 () Unit!7802)

(assert (=> b!126882 (= lt!198167 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2983 (_2!5612 lt!198166)) lt!198170))))

(assert (=> b!126882 (= lt!198168 (reader!0 thiss!1614 (_2!5612 lt!198166)))))

(declare-fun b!126883 () Bool)

(declare-fun arrayRangesEq!85 (array!5742 array!5742 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126883 (= e!83673 (not (arrayRangesEq!85 arr!227 (_2!5613 lt!198163) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126884 () Bool)

(declare-fun e!83672 () Bool)

(assert (=> b!126884 (= e!83672 (not e!83671))))

(declare-fun res!105167 () Bool)

(assert (=> b!126884 (=> res!105167 e!83671)))

(assert (=> b!126884 (= res!105167 (not (= (bitIndex!0 (size!2598 (buf!2983 (_2!5612 lt!198166))) (currentByte!5722 (_2!5612 lt!198166)) (currentBit!5717 (_2!5612 lt!198166))) (bvadd (bitIndex!0 (size!2598 (buf!2983 thiss!1614)) (currentByte!5722 thiss!1614) (currentBit!5717 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126884 e!83670))

(declare-fun res!105166 () Bool)

(assert (=> b!126884 (=> (not res!105166) (not e!83670))))

(assert (=> b!126884 (= res!105166 (= (size!2598 (buf!2983 thiss!1614)) (size!2598 (buf!2983 (_2!5612 lt!198166)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4520 array!5742 (_ BitVec 32) (_ BitVec 32)) tuple2!10654)

(assert (=> b!126884 (= lt!198166 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126886 () Bool)

(declare-fun res!105164 () Bool)

(assert (=> b!126886 (=> res!105164 e!83671)))

(assert (=> b!126886 (= res!105164 (not (isPrefixOf!0 thiss!1614 (_2!5612 lt!198166))))))

(declare-fun b!126887 () Bool)

(declare-fun e!83675 () Bool)

(declare-fun array_inv!2387 (array!5742) Bool)

(assert (=> b!126887 (= e!83675 (array_inv!2387 (buf!2983 thiss!1614)))))

(declare-fun b!126885 () Bool)

(declare-fun res!105163 () Bool)

(assert (=> b!126885 (=> (not res!105163) (not e!83672))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126885 (= res!105163 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2598 (buf!2983 thiss!1614))) ((_ sign_extend 32) (currentByte!5722 thiss!1614)) ((_ sign_extend 32) (currentBit!5717 thiss!1614)) noOfBytes!1))))

(declare-fun res!105162 () Bool)

(assert (=> start!25054 (=> (not res!105162) (not e!83672))))

(assert (=> start!25054 (= res!105162 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2598 arr!227))))))

(assert (=> start!25054 e!83672))

(assert (=> start!25054 true))

(assert (=> start!25054 (array_inv!2387 arr!227)))

(declare-fun inv!12 (BitStream!4520) Bool)

(assert (=> start!25054 (and (inv!12 thiss!1614) e!83675)))

(assert (= (and start!25054 res!105162) b!126885))

(assert (= (and b!126885 res!105163) b!126884))

(assert (= (and b!126884 res!105166) b!126879))

(assert (= (and b!126879 res!105168) b!126881))

(assert (= (and b!126881 res!105169) b!126882))

(assert (= (and b!126882 (not res!105165)) b!126883))

(assert (= (and b!126884 (not res!105167)) b!126886))

(assert (= (and b!126886 (not res!105164)) b!126880))

(assert (= start!25054 b!126887))

(declare-fun m!192481 () Bool)

(assert (=> b!126884 m!192481))

(declare-fun m!192483 () Bool)

(assert (=> b!126884 m!192483))

(declare-fun m!192485 () Bool)

(assert (=> b!126884 m!192485))

(declare-fun m!192487 () Bool)

(assert (=> b!126886 m!192487))

(declare-fun m!192489 () Bool)

(assert (=> b!126883 m!192489))

(declare-fun m!192491 () Bool)

(assert (=> b!126882 m!192491))

(declare-fun m!192493 () Bool)

(assert (=> b!126882 m!192493))

(declare-fun m!192495 () Bool)

(assert (=> b!126882 m!192495))

(declare-fun m!192497 () Bool)

(assert (=> b!126882 m!192497))

(declare-fun m!192499 () Bool)

(assert (=> b!126885 m!192499))

(declare-fun m!192501 () Bool)

(assert (=> b!126880 m!192501))

(declare-fun m!192503 () Bool)

(assert (=> b!126880 m!192503))

(declare-fun m!192505 () Bool)

(assert (=> b!126880 m!192505))

(assert (=> b!126880 m!192497))

(declare-fun m!192507 () Bool)

(assert (=> b!126887 m!192507))

(assert (=> b!126879 m!192481))

(assert (=> b!126879 m!192483))

(declare-fun m!192509 () Bool)

(assert (=> start!25054 m!192509))

(declare-fun m!192511 () Bool)

(assert (=> start!25054 m!192511))

(assert (=> b!126881 m!192487))

(push 1)

(assert (not b!126881))

(assert (not b!126885))

(assert (not b!126887))

(assert (not b!126880))

(assert (not start!25054))

(assert (not b!126882))

(assert (not b!126883))

(assert (not b!126879))

(assert (not b!126886))

(assert (not b!126884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

