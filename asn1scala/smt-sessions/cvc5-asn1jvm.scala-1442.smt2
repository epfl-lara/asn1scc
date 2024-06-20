; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39602 () Bool)

(assert start!39602)

(declare-fun b!178516 () Bool)

(declare-fun res!148054 () Bool)

(declare-fun e!124294 () Bool)

(assert (=> b!178516 (=> res!148054 e!124294)))

(declare-datatypes ((array!9617 0))(
  ( (array!9618 (arr!5170 (Array (_ BitVec 32) (_ BitVec 8))) (size!4240 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7588 0))(
  ( (BitStream!7589 (buf!4683 array!9617) (currentByte!8881 (_ BitVec 32)) (currentBit!8876 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12860 0))(
  ( (Unit!12861) )
))
(declare-datatypes ((tuple2!15392 0))(
  ( (tuple2!15393 (_1!8341 Unit!12860) (_2!8341 BitStream!7588)) )
))
(declare-fun lt!274190 () tuple2!15392)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178516 (= res!148054 (not (invariant!0 (currentBit!8876 (_2!8341 lt!274190)) (currentByte!8881 (_2!8341 lt!274190)) (size!4240 (buf!4683 (_2!8341 lt!274190))))))))

(declare-fun b!178518 () Bool)

(declare-fun res!148064 () Bool)

(declare-fun e!124296 () Bool)

(assert (=> b!178518 (=> (not res!148064) (not e!124296))))

(declare-fun thiss!1204 () BitStream!7588)

(declare-fun lt!274185 () tuple2!15392)

(declare-fun isPrefixOf!0 (BitStream!7588 BitStream!7588) Bool)

(assert (=> b!178518 (= res!148064 (isPrefixOf!0 thiss!1204 (_2!8341 lt!274185)))))

(declare-fun b!178519 () Bool)

(declare-fun e!124293 () Bool)

(assert (=> b!178519 (= e!124294 e!124293)))

(declare-fun res!148063 () Bool)

(assert (=> b!178519 (=> res!148063 e!124293)))

(assert (=> b!178519 (= res!148063 (not (= (size!4240 (buf!4683 (_2!8341 lt!274185))) (size!4240 (buf!4683 (_2!8341 lt!274190))))))))

(assert (=> b!178519 (invariant!0 (currentBit!8876 thiss!1204) (currentByte!8881 thiss!1204) (size!4240 (buf!4683 (_2!8341 lt!274185))))))

(declare-fun b!178520 () Bool)

(assert (=> b!178520 (= e!124293 true)))

(declare-datatypes ((tuple2!15394 0))(
  ( (tuple2!15395 (_1!8342 BitStream!7588) (_2!8342 Bool)) )
))
(declare-fun lt!274188 () tuple2!15394)

(declare-fun readBitPure!0 (BitStream!7588) tuple2!15394)

(assert (=> b!178520 (= lt!274188 (readBitPure!0 (BitStream!7589 (buf!4683 (_2!8341 lt!274190)) (currentByte!8881 thiss!1204) (currentBit!8876 thiss!1204))))))

(declare-fun lt!274184 () tuple2!15394)

(assert (=> b!178520 (= lt!274184 (readBitPure!0 (BitStream!7589 (buf!4683 (_2!8341 lt!274185)) (currentByte!8881 thiss!1204) (currentBit!8876 thiss!1204))))))

(assert (=> b!178520 (invariant!0 (currentBit!8876 thiss!1204) (currentByte!8881 thiss!1204) (size!4240 (buf!4683 (_2!8341 lt!274190))))))

(declare-fun b!178521 () Bool)

(declare-fun res!148060 () Bool)

(declare-fun e!124300 () Bool)

(assert (=> b!178521 (=> (not res!148060) (not e!124300))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!178521 (= res!148060 (not (= i!590 nBits!348)))))

(declare-fun b!178522 () Bool)

(declare-fun res!148062 () Bool)

(assert (=> b!178522 (=> res!148062 e!124293)))

(declare-fun arrayBitRangesEq!0 (array!9617 array!9617 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178522 (= res!148062 (not (arrayBitRangesEq!0 (buf!4683 (_2!8341 lt!274185)) (buf!4683 (_2!8341 lt!274190)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4240 (buf!4683 (_2!8341 lt!274185))) (currentByte!8881 thiss!1204) (currentBit!8876 thiss!1204))))))))

(declare-fun b!178523 () Bool)

(declare-fun e!124295 () Bool)

(assert (=> b!178523 (= e!124295 e!124296)))

(declare-fun res!148067 () Bool)

(assert (=> b!178523 (=> (not res!148067) (not e!124296))))

(declare-fun lt!274187 () (_ BitVec 64))

(declare-fun lt!274183 () (_ BitVec 64))

(assert (=> b!178523 (= res!148067 (= lt!274187 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274183)))))

(assert (=> b!178523 (= lt!274187 (bitIndex!0 (size!4240 (buf!4683 (_2!8341 lt!274185))) (currentByte!8881 (_2!8341 lt!274185)) (currentBit!8876 (_2!8341 lt!274185))))))

(assert (=> b!178523 (= lt!274183 (bitIndex!0 (size!4240 (buf!4683 thiss!1204)) (currentByte!8881 thiss!1204) (currentBit!8876 thiss!1204)))))

(declare-fun b!178524 () Bool)

(declare-fun res!148053 () Bool)

(assert (=> b!178524 (=> res!148053 e!124294)))

(declare-fun lt!274186 () (_ BitVec 64))

(declare-fun lt!274189 () (_ BitVec 64))

(assert (=> b!178524 (= res!148053 (or (not (= (size!4240 (buf!4683 (_2!8341 lt!274190))) (size!4240 (buf!4683 thiss!1204)))) (not (= lt!274189 (bvsub (bvadd lt!274186 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178525 () Bool)

(declare-fun e!124298 () Bool)

(declare-fun array_inv!3981 (array!9617) Bool)

(assert (=> b!178525 (= e!124298 (array_inv!3981 (buf!4683 thiss!1204)))))

(declare-fun b!178526 () Bool)

(declare-fun res!148055 () Bool)

(assert (=> b!178526 (=> res!148055 e!124294)))

(assert (=> b!178526 (= res!148055 (not (isPrefixOf!0 (_2!8341 lt!274185) (_2!8341 lt!274190))))))

(declare-fun b!178527 () Bool)

(declare-fun res!148058 () Bool)

(assert (=> b!178527 (=> res!148058 e!124294)))

(assert (=> b!178527 (= res!148058 (not (isPrefixOf!0 thiss!1204 (_2!8341 lt!274185))))))

(declare-fun res!148068 () Bool)

(assert (=> start!39602 (=> (not res!148068) (not e!124300))))

(assert (=> start!39602 (= res!148068 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39602 e!124300))

(assert (=> start!39602 true))

(declare-fun inv!12 (BitStream!7588) Bool)

(assert (=> start!39602 (and (inv!12 thiss!1204) e!124298)))

(declare-fun b!178517 () Bool)

(declare-fun e!124299 () Bool)

(assert (=> b!178517 (= e!124296 e!124299)))

(declare-fun res!148061 () Bool)

(assert (=> b!178517 (=> (not res!148061) (not e!124299))))

(declare-fun lt!274180 () Bool)

(declare-fun lt!274182 () tuple2!15394)

(assert (=> b!178517 (= res!148061 (and (= (_2!8342 lt!274182) lt!274180) (= (_1!8342 lt!274182) (_2!8341 lt!274185))))))

(declare-fun readerFrom!0 (BitStream!7588 (_ BitVec 32) (_ BitVec 32)) BitStream!7588)

(assert (=> b!178517 (= lt!274182 (readBitPure!0 (readerFrom!0 (_2!8341 lt!274185) (currentBit!8876 thiss!1204) (currentByte!8881 thiss!1204))))))

(declare-fun b!178528 () Bool)

(assert (=> b!178528 (= e!124299 (= (bitIndex!0 (size!4240 (buf!4683 (_1!8342 lt!274182))) (currentByte!8881 (_1!8342 lt!274182)) (currentBit!8876 (_1!8342 lt!274182))) lt!274187))))

(declare-fun b!178529 () Bool)

(declare-fun e!124297 () Bool)

(assert (=> b!178529 (= e!124300 (not e!124297))))

(declare-fun res!148066 () Bool)

(assert (=> b!178529 (=> res!148066 e!124297)))

(declare-fun lt!274181 () (_ BitVec 64))

(assert (=> b!178529 (= res!148066 (not (= lt!274181 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274186))))))

(assert (=> b!178529 (= lt!274181 (bitIndex!0 (size!4240 (buf!4683 (_2!8341 lt!274185))) (currentByte!8881 (_2!8341 lt!274185)) (currentBit!8876 (_2!8341 lt!274185))))))

(assert (=> b!178529 (= lt!274186 (bitIndex!0 (size!4240 (buf!4683 thiss!1204)) (currentByte!8881 thiss!1204) (currentBit!8876 thiss!1204)))))

(assert (=> b!178529 e!124295))

(declare-fun res!148059 () Bool)

(assert (=> b!178529 (=> (not res!148059) (not e!124295))))

(assert (=> b!178529 (= res!148059 (= (size!4240 (buf!4683 thiss!1204)) (size!4240 (buf!4683 (_2!8341 lt!274185)))))))

(declare-fun appendBit!0 (BitStream!7588 Bool) tuple2!15392)

(assert (=> b!178529 (= lt!274185 (appendBit!0 thiss!1204 lt!274180))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178529 (= lt!274180 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178530 () Bool)

(declare-fun res!148056 () Bool)

(assert (=> b!178530 (=> (not res!148056) (not e!124300))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178530 (= res!148056 (validate_offset_bits!1 ((_ sign_extend 32) (size!4240 (buf!4683 thiss!1204))) ((_ sign_extend 32) (currentByte!8881 thiss!1204)) ((_ sign_extend 32) (currentBit!8876 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178531 () Bool)

(declare-fun res!148065 () Bool)

(assert (=> b!178531 (=> res!148065 e!124293)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178531 (= res!148065 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4240 (buf!4683 (_2!8341 lt!274185)))) ((_ sign_extend 32) (currentByte!8881 thiss!1204)) ((_ sign_extend 32) (currentBit!8876 thiss!1204)))))))

(declare-fun b!178532 () Bool)

(declare-fun res!148057 () Bool)

(assert (=> b!178532 (=> (not res!148057) (not e!124300))))

(assert (=> b!178532 (= res!148057 (invariant!0 (currentBit!8876 thiss!1204) (currentByte!8881 thiss!1204) (size!4240 (buf!4683 thiss!1204))))))

(declare-fun b!178533 () Bool)

(assert (=> b!178533 (= e!124297 e!124294)))

(declare-fun res!148052 () Bool)

(assert (=> b!178533 (=> res!148052 e!124294)))

(assert (=> b!178533 (= res!148052 (not (= lt!274189 (bvsub (bvsub (bvadd lt!274181 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!178533 (= lt!274189 (bitIndex!0 (size!4240 (buf!4683 (_2!8341 lt!274190))) (currentByte!8881 (_2!8341 lt!274190)) (currentBit!8876 (_2!8341 lt!274190))))))

(assert (=> b!178533 (isPrefixOf!0 thiss!1204 (_2!8341 lt!274190))))

(declare-fun lt!274179 () Unit!12860)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7588 BitStream!7588 BitStream!7588) Unit!12860)

(assert (=> b!178533 (= lt!274179 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8341 lt!274185) (_2!8341 lt!274190)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7588 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15392)

(assert (=> b!178533 (= lt!274190 (appendBitsLSBFirstLoopTR!0 (_2!8341 lt!274185) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!39602 res!148068) b!178530))

(assert (= (and b!178530 res!148056) b!178532))

(assert (= (and b!178532 res!148057) b!178521))

(assert (= (and b!178521 res!148060) b!178529))

(assert (= (and b!178529 res!148059) b!178523))

(assert (= (and b!178523 res!148067) b!178518))

(assert (= (and b!178518 res!148064) b!178517))

(assert (= (and b!178517 res!148061) b!178528))

(assert (= (and b!178529 (not res!148066)) b!178533))

(assert (= (and b!178533 (not res!148052)) b!178516))

(assert (= (and b!178516 (not res!148054)) b!178524))

(assert (= (and b!178524 (not res!148053)) b!178526))

(assert (= (and b!178526 (not res!148055)) b!178527))

(assert (= (and b!178527 (not res!148058)) b!178519))

(assert (= (and b!178519 (not res!148063)) b!178531))

(assert (= (and b!178531 (not res!148065)) b!178522))

(assert (= (and b!178522 (not res!148062)) b!178520))

(assert (= start!39602 b!178525))

(declare-fun m!278635 () Bool)

(assert (=> b!178532 m!278635))

(declare-fun m!278637 () Bool)

(assert (=> b!178530 m!278637))

(declare-fun m!278639 () Bool)

(assert (=> b!178528 m!278639))

(declare-fun m!278641 () Bool)

(assert (=> b!178526 m!278641))

(declare-fun m!278643 () Bool)

(assert (=> b!178518 m!278643))

(assert (=> b!178527 m!278643))

(declare-fun m!278645 () Bool)

(assert (=> b!178525 m!278645))

(declare-fun m!278647 () Bool)

(assert (=> b!178522 m!278647))

(declare-fun m!278649 () Bool)

(assert (=> b!178522 m!278649))

(declare-fun m!278651 () Bool)

(assert (=> b!178523 m!278651))

(declare-fun m!278653 () Bool)

(assert (=> b!178523 m!278653))

(declare-fun m!278655 () Bool)

(assert (=> b!178516 m!278655))

(declare-fun m!278657 () Bool)

(assert (=> b!178520 m!278657))

(declare-fun m!278659 () Bool)

(assert (=> b!178520 m!278659))

(declare-fun m!278661 () Bool)

(assert (=> b!178520 m!278661))

(declare-fun m!278663 () Bool)

(assert (=> start!39602 m!278663))

(declare-fun m!278665 () Bool)

(assert (=> b!178519 m!278665))

(declare-fun m!278667 () Bool)

(assert (=> b!178533 m!278667))

(declare-fun m!278669 () Bool)

(assert (=> b!178533 m!278669))

(declare-fun m!278671 () Bool)

(assert (=> b!178533 m!278671))

(declare-fun m!278673 () Bool)

(assert (=> b!178533 m!278673))

(declare-fun m!278675 () Bool)

(assert (=> b!178517 m!278675))

(assert (=> b!178517 m!278675))

(declare-fun m!278677 () Bool)

(assert (=> b!178517 m!278677))

(declare-fun m!278679 () Bool)

(assert (=> b!178531 m!278679))

(assert (=> b!178529 m!278651))

(assert (=> b!178529 m!278653))

(declare-fun m!278681 () Bool)

(assert (=> b!178529 m!278681))

(push 1)

