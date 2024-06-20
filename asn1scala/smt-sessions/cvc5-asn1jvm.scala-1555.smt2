; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43626 () Bool)

(assert start!43626)

(declare-fun res!173580 () Bool)

(declare-fun e!141481 () Bool)

(assert (=> start!43626 (=> (not res!173580) (not e!141481))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43626 (= res!173580 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43626 e!141481))

(assert (=> start!43626 true))

(declare-datatypes ((array!10409 0))(
  ( (array!10410 (arr!5506 (Array (_ BitVec 32) (_ BitVec 8))) (size!4576 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8260 0))(
  ( (BitStream!8261 (buf!5081 array!10409) (currentByte!9599 (_ BitVec 32)) (currentBit!9594 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8260)

(declare-fun e!141479 () Bool)

(declare-fun inv!12 (BitStream!8260) Bool)

(assert (=> start!43626 (and (inv!12 thiss!1204) e!141479)))

(declare-fun b!206951 () Bool)

(declare-fun e!141480 () Bool)

(declare-fun e!141485 () Bool)

(assert (=> b!206951 (= e!141480 (not e!141485))))

(declare-fun res!173583 () Bool)

(assert (=> b!206951 (=> res!173583 e!141485)))

(declare-fun lt!323187 () (_ BitVec 64))

(declare-fun lt!323179 () (_ BitVec 64))

(assert (=> b!206951 (= res!173583 (not (= lt!323187 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323179))))))

(declare-datatypes ((Unit!14746 0))(
  ( (Unit!14747) )
))
(declare-datatypes ((tuple2!17714 0))(
  ( (tuple2!17715 (_1!9512 Unit!14746) (_2!9512 BitStream!8260)) )
))
(declare-fun lt!323184 () tuple2!17714)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206951 (= lt!323187 (bitIndex!0 (size!4576 (buf!5081 (_2!9512 lt!323184))) (currentByte!9599 (_2!9512 lt!323184)) (currentBit!9594 (_2!9512 lt!323184))))))

(assert (=> b!206951 (= lt!323179 (bitIndex!0 (size!4576 (buf!5081 thiss!1204)) (currentByte!9599 thiss!1204) (currentBit!9594 thiss!1204)))))

(declare-fun e!141482 () Bool)

(assert (=> b!206951 e!141482))

(declare-fun res!173594 () Bool)

(assert (=> b!206951 (=> (not res!173594) (not e!141482))))

(assert (=> b!206951 (= res!173594 (= (size!4576 (buf!5081 thiss!1204)) (size!4576 (buf!5081 (_2!9512 lt!323184)))))))

(declare-fun lt!323175 () Bool)

(declare-fun appendBit!0 (BitStream!8260 Bool) tuple2!17714)

(assert (=> b!206951 (= lt!323184 (appendBit!0 thiss!1204 lt!323175))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!206951 (= lt!323175 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206952 () Bool)

(declare-fun res!173591 () Bool)

(declare-fun e!141476 () Bool)

(assert (=> b!206952 (=> res!173591 e!141476)))

(declare-fun isPrefixOf!0 (BitStream!8260 BitStream!8260) Bool)

(assert (=> b!206952 (= res!173591 (not (isPrefixOf!0 thiss!1204 (_2!9512 lt!323184))))))

(declare-fun b!206953 () Bool)

(declare-fun res!173588 () Bool)

(assert (=> b!206953 (=> (not res!173588) (not e!141480))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206953 (= res!173588 (invariant!0 (currentBit!9594 thiss!1204) (currentByte!9599 thiss!1204) (size!4576 (buf!5081 thiss!1204))))))

(declare-fun b!206954 () Bool)

(declare-fun res!173590 () Bool)

(assert (=> b!206954 (=> (not res!173590) (not e!141480))))

(assert (=> b!206954 (= res!173590 (not (= i!590 nBits!348)))))

(declare-fun b!206955 () Bool)

(declare-fun res!173592 () Bool)

(declare-fun e!141478 () Bool)

(assert (=> b!206955 (=> (not res!173592) (not e!141478))))

(assert (=> b!206955 (= res!173592 (isPrefixOf!0 thiss!1204 (_2!9512 lt!323184)))))

(declare-fun b!206956 () Bool)

(declare-fun array_inv!4317 (array!10409) Bool)

(assert (=> b!206956 (= e!141479 (array_inv!4317 (buf!5081 thiss!1204)))))

(declare-fun b!206957 () Bool)

(declare-fun res!173587 () Bool)

(assert (=> b!206957 (=> res!173587 e!141476)))

(declare-fun lt!323182 () tuple2!17714)

(assert (=> b!206957 (= res!173587 (not (isPrefixOf!0 (_2!9512 lt!323184) (_2!9512 lt!323182))))))

(declare-fun b!206958 () Bool)

(assert (=> b!206958 (= e!141482 e!141478)))

(declare-fun res!173579 () Bool)

(assert (=> b!206958 (=> (not res!173579) (not e!141478))))

(declare-fun lt!323177 () (_ BitVec 64))

(declare-fun lt!323185 () (_ BitVec 64))

(assert (=> b!206958 (= res!173579 (= lt!323177 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323185)))))

(assert (=> b!206958 (= lt!323177 (bitIndex!0 (size!4576 (buf!5081 (_2!9512 lt!323184))) (currentByte!9599 (_2!9512 lt!323184)) (currentBit!9594 (_2!9512 lt!323184))))))

(assert (=> b!206958 (= lt!323185 (bitIndex!0 (size!4576 (buf!5081 thiss!1204)) (currentByte!9599 thiss!1204) (currentBit!9594 thiss!1204)))))

(declare-fun b!206959 () Bool)

(assert (=> b!206959 (= e!141485 e!141476)))

(declare-fun res!173585 () Bool)

(assert (=> b!206959 (=> res!173585 e!141476)))

(declare-fun lt!323176 () (_ BitVec 64))

(assert (=> b!206959 (= res!173585 (not (= lt!323176 (bvsub (bvsub (bvadd lt!323187 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206959 (= lt!323176 (bitIndex!0 (size!4576 (buf!5081 (_2!9512 lt!323182))) (currentByte!9599 (_2!9512 lt!323182)) (currentBit!9594 (_2!9512 lt!323182))))))

(assert (=> b!206959 (isPrefixOf!0 thiss!1204 (_2!9512 lt!323182))))

(declare-fun lt!323180 () Unit!14746)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8260 BitStream!8260 BitStream!8260) Unit!14746)

(assert (=> b!206959 (= lt!323180 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9512 lt!323184) (_2!9512 lt!323182)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8260 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17714)

(assert (=> b!206959 (= lt!323182 (appendBitsLSBFirstLoopTR!0 (_2!9512 lt!323184) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206960 () Bool)

(declare-fun res!173584 () Bool)

(assert (=> b!206960 (=> res!173584 e!141476)))

(assert (=> b!206960 (= res!173584 (or (not (= (size!4576 (buf!5081 (_2!9512 lt!323182))) (size!4576 (buf!5081 thiss!1204)))) (not (= lt!323176 (bvsub (bvadd lt!323179 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun lt!323183 () (_ BitVec 32))

(declare-fun b!206961 () Bool)

(assert (=> b!206961 (= e!141476 (or (= lt!323183 #b00000000000000000000000000000000) (= lt!323183 (bvand (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> b!206961 (= lt!323183 (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))

(declare-datatypes ((tuple2!17716 0))(
  ( (tuple2!17717 (_1!9513 BitStream!8260) (_2!9513 (_ BitVec 64))) )
))
(declare-fun lt!323181 () tuple2!17716)

(declare-datatypes ((tuple2!17718 0))(
  ( (tuple2!17719 (_1!9514 BitStream!8260) (_2!9514 BitStream!8260)) )
))
(declare-fun lt!323178 () tuple2!17718)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17716)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206961 (= lt!323181 (readNBitsLSBFirstsLoopPure!0 (_1!9514 lt!323178) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!323174 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206961 (validate_offset_bits!1 ((_ sign_extend 32) (size!4576 (buf!5081 (_2!9512 lt!323182)))) ((_ sign_extend 32) (currentByte!9599 thiss!1204)) ((_ sign_extend 32) (currentBit!9594 thiss!1204)) lt!323174)))

(declare-fun lt!323192 () Unit!14746)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8260 array!10409 (_ BitVec 64)) Unit!14746)

(assert (=> b!206961 (= lt!323192 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5081 (_2!9512 lt!323182)) lt!323174))))

(declare-datatypes ((tuple2!17720 0))(
  ( (tuple2!17721 (_1!9515 BitStream!8260) (_2!9515 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8260) tuple2!17720)

(assert (=> b!206961 (= (_2!9515 (readBitPure!0 (_1!9514 lt!323178))) lt!323175)))

(declare-fun lt!323190 () tuple2!17718)

(declare-fun reader!0 (BitStream!8260 BitStream!8260) tuple2!17718)

(assert (=> b!206961 (= lt!323190 (reader!0 (_2!9512 lt!323184) (_2!9512 lt!323182)))))

(assert (=> b!206961 (= lt!323178 (reader!0 thiss!1204 (_2!9512 lt!323182)))))

(declare-fun e!141486 () Bool)

(assert (=> b!206961 e!141486))

(declare-fun res!173582 () Bool)

(assert (=> b!206961 (=> (not res!173582) (not e!141486))))

(declare-fun lt!323191 () tuple2!17720)

(declare-fun lt!323186 () tuple2!17720)

(assert (=> b!206961 (= res!173582 (= (bitIndex!0 (size!4576 (buf!5081 (_1!9515 lt!323191))) (currentByte!9599 (_1!9515 lt!323191)) (currentBit!9594 (_1!9515 lt!323191))) (bitIndex!0 (size!4576 (buf!5081 (_1!9515 lt!323186))) (currentByte!9599 (_1!9515 lt!323186)) (currentBit!9594 (_1!9515 lt!323186)))))))

(declare-fun lt!323173 () Unit!14746)

(declare-fun lt!323188 () BitStream!8260)

(declare-fun readBitPrefixLemma!0 (BitStream!8260 BitStream!8260) Unit!14746)

(assert (=> b!206961 (= lt!323173 (readBitPrefixLemma!0 lt!323188 (_2!9512 lt!323182)))))

(assert (=> b!206961 (= lt!323186 (readBitPure!0 (BitStream!8261 (buf!5081 (_2!9512 lt!323182)) (currentByte!9599 thiss!1204) (currentBit!9594 thiss!1204))))))

(assert (=> b!206961 (= lt!323191 (readBitPure!0 lt!323188))))

(declare-fun e!141484 () Bool)

(assert (=> b!206961 e!141484))

(declare-fun res!173593 () Bool)

(assert (=> b!206961 (=> (not res!173593) (not e!141484))))

(assert (=> b!206961 (= res!173593 (invariant!0 (currentBit!9594 thiss!1204) (currentByte!9599 thiss!1204) (size!4576 (buf!5081 (_2!9512 lt!323184)))))))

(assert (=> b!206961 (= lt!323188 (BitStream!8261 (buf!5081 (_2!9512 lt!323184)) (currentByte!9599 thiss!1204) (currentBit!9594 thiss!1204)))))

(declare-fun b!206962 () Bool)

(assert (=> b!206962 (= e!141481 e!141480)))

(declare-fun res!173581 () Bool)

(assert (=> b!206962 (=> (not res!173581) (not e!141480))))

(assert (=> b!206962 (= res!173581 (validate_offset_bits!1 ((_ sign_extend 32) (size!4576 (buf!5081 thiss!1204))) ((_ sign_extend 32) (currentByte!9599 thiss!1204)) ((_ sign_extend 32) (currentBit!9594 thiss!1204)) lt!323174))))

(assert (=> b!206962 (= lt!323174 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!206963 () Bool)

(declare-fun e!141477 () Bool)

(assert (=> b!206963 (= e!141478 e!141477)))

(declare-fun res!173589 () Bool)

(assert (=> b!206963 (=> (not res!173589) (not e!141477))))

(declare-fun lt!323189 () tuple2!17720)

(assert (=> b!206963 (= res!173589 (and (= (_2!9515 lt!323189) lt!323175) (= (_1!9515 lt!323189) (_2!9512 lt!323184))))))

(declare-fun readerFrom!0 (BitStream!8260 (_ BitVec 32) (_ BitVec 32)) BitStream!8260)

(assert (=> b!206963 (= lt!323189 (readBitPure!0 (readerFrom!0 (_2!9512 lt!323184) (currentBit!9594 thiss!1204) (currentByte!9599 thiss!1204))))))

(declare-fun b!206964 () Bool)

(declare-fun res!173586 () Bool)

(assert (=> b!206964 (=> res!173586 e!141476)))

(assert (=> b!206964 (= res!173586 (not (invariant!0 (currentBit!9594 (_2!9512 lt!323182)) (currentByte!9599 (_2!9512 lt!323182)) (size!4576 (buf!5081 (_2!9512 lt!323182))))))))

(declare-fun b!206965 () Bool)

(assert (=> b!206965 (= e!141484 (invariant!0 (currentBit!9594 thiss!1204) (currentByte!9599 thiss!1204) (size!4576 (buf!5081 (_2!9512 lt!323182)))))))

(declare-fun b!206966 () Bool)

(assert (=> b!206966 (= e!141477 (= (bitIndex!0 (size!4576 (buf!5081 (_1!9515 lt!323189))) (currentByte!9599 (_1!9515 lt!323189)) (currentBit!9594 (_1!9515 lt!323189))) lt!323177))))

(declare-fun b!206967 () Bool)

(assert (=> b!206967 (= e!141486 (= (_2!9515 lt!323191) (_2!9515 lt!323186)))))

(assert (= (and start!43626 res!173580) b!206962))

(assert (= (and b!206962 res!173581) b!206953))

(assert (= (and b!206953 res!173588) b!206954))

(assert (= (and b!206954 res!173590) b!206951))

(assert (= (and b!206951 res!173594) b!206958))

(assert (= (and b!206958 res!173579) b!206955))

(assert (= (and b!206955 res!173592) b!206963))

(assert (= (and b!206963 res!173589) b!206966))

(assert (= (and b!206951 (not res!173583)) b!206959))

(assert (= (and b!206959 (not res!173585)) b!206964))

(assert (= (and b!206964 (not res!173586)) b!206960))

(assert (= (and b!206960 (not res!173584)) b!206957))

(assert (= (and b!206957 (not res!173587)) b!206952))

(assert (= (and b!206952 (not res!173591)) b!206961))

(assert (= (and b!206961 res!173593) b!206965))

(assert (= (and b!206961 res!173582) b!206967))

(assert (= start!43626 b!206956))

(declare-fun m!318591 () Bool)

(assert (=> b!206955 m!318591))

(declare-fun m!318593 () Bool)

(assert (=> b!206953 m!318593))

(declare-fun m!318595 () Bool)

(assert (=> b!206966 m!318595))

(declare-fun m!318597 () Bool)

(assert (=> b!206964 m!318597))

(declare-fun m!318599 () Bool)

(assert (=> b!206951 m!318599))

(declare-fun m!318601 () Bool)

(assert (=> b!206951 m!318601))

(declare-fun m!318603 () Bool)

(assert (=> b!206951 m!318603))

(assert (=> b!206952 m!318591))

(declare-fun m!318605 () Bool)

(assert (=> b!206963 m!318605))

(assert (=> b!206963 m!318605))

(declare-fun m!318607 () Bool)

(assert (=> b!206963 m!318607))

(declare-fun m!318609 () Bool)

(assert (=> b!206965 m!318609))

(assert (=> b!206958 m!318599))

(assert (=> b!206958 m!318601))

(declare-fun m!318611 () Bool)

(assert (=> b!206961 m!318611))

(declare-fun m!318613 () Bool)

(assert (=> b!206961 m!318613))

(declare-fun m!318615 () Bool)

(assert (=> b!206961 m!318615))

(declare-fun m!318617 () Bool)

(assert (=> b!206961 m!318617))

(declare-fun m!318619 () Bool)

(assert (=> b!206961 m!318619))

(declare-fun m!318621 () Bool)

(assert (=> b!206961 m!318621))

(declare-fun m!318623 () Bool)

(assert (=> b!206961 m!318623))

(declare-fun m!318625 () Bool)

(assert (=> b!206961 m!318625))

(declare-fun m!318627 () Bool)

(assert (=> b!206961 m!318627))

(declare-fun m!318629 () Bool)

(assert (=> b!206961 m!318629))

(declare-fun m!318631 () Bool)

(assert (=> b!206961 m!318631))

(declare-fun m!318633 () Bool)

(assert (=> b!206961 m!318633))

(declare-fun m!318635 () Bool)

(assert (=> b!206961 m!318635))

(declare-fun m!318637 () Bool)

(assert (=> b!206959 m!318637))

(declare-fun m!318639 () Bool)

(assert (=> b!206959 m!318639))

(declare-fun m!318641 () Bool)

(assert (=> b!206959 m!318641))

(declare-fun m!318643 () Bool)

(assert (=> b!206959 m!318643))

(declare-fun m!318645 () Bool)

(assert (=> b!206956 m!318645))

(declare-fun m!318647 () Bool)

(assert (=> b!206957 m!318647))

(declare-fun m!318649 () Bool)

(assert (=> b!206962 m!318649))

(declare-fun m!318651 () Bool)

(assert (=> start!43626 m!318651))

(push 1)

(assert (not b!206964))

(assert (not b!206962))

(assert (not b!206963))

(assert (not b!206957))

(assert (not b!206953))

(assert (not b!206955))

(assert (not b!206952))

(assert (not b!206958))

(assert (not b!206961))

(assert (not b!206951))

(assert (not b!206959))

(assert (not start!43626))

(assert (not b!206956))

(assert (not b!206965))

(assert (not b!206966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

