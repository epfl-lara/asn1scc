; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39716 () Bool)

(assert start!39716)

(declare-fun b!179651 () Bool)

(declare-fun res!149083 () Bool)

(declare-fun e!124926 () Bool)

(assert (=> b!179651 (=> res!149083 e!124926)))

(declare-datatypes ((array!9650 0))(
  ( (array!9651 (arr!5185 (Array (_ BitVec 32) (_ BitVec 8))) (size!4255 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7618 0))(
  ( (BitStream!7619 (buf!4698 array!9650) (currentByte!8908 (_ BitVec 32)) (currentBit!8903 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12929 0))(
  ( (Unit!12930) )
))
(declare-datatypes ((tuple2!15476 0))(
  ( (tuple2!15477 (_1!8383 Unit!12929) (_2!8383 BitStream!7618)) )
))
(declare-fun lt!275804 () tuple2!15476)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179651 (= res!149083 (not (invariant!0 (currentBit!8903 (_2!8383 lt!275804)) (currentByte!8908 (_2!8383 lt!275804)) (size!4255 (buf!4698 (_2!8383 lt!275804))))))))

(declare-fun b!179652 () Bool)

(declare-fun e!124928 () Bool)

(declare-datatypes ((tuple2!15478 0))(
  ( (tuple2!15479 (_1!8384 BitStream!7618) (_2!8384 Bool)) )
))
(declare-fun lt!275803 () tuple2!15478)

(declare-fun lt!275793 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179652 (= e!124928 (= (bitIndex!0 (size!4255 (buf!4698 (_1!8384 lt!275803))) (currentByte!8908 (_1!8384 lt!275803)) (currentBit!8903 (_1!8384 lt!275803))) lt!275793))))

(declare-fun b!179653 () Bool)

(declare-fun res!149095 () Bool)

(declare-fun e!124924 () Bool)

(assert (=> b!179653 (=> (not res!149095) (not e!124924))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!7618)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179653 (= res!149095 (validate_offset_bits!1 ((_ sign_extend 32) (size!4255 (buf!4698 thiss!1204))) ((_ sign_extend 32) (currentByte!8908 thiss!1204)) ((_ sign_extend 32) (currentBit!8903 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179654 () Bool)

(declare-fun e!124922 () Bool)

(assert (=> b!179654 (= e!124922 (invariant!0 (currentBit!8903 thiss!1204) (currentByte!8908 thiss!1204) (size!4255 (buf!4698 (_2!8383 lt!275804)))))))

(declare-fun b!179655 () Bool)

(declare-fun res!149090 () Bool)

(declare-fun e!124923 () Bool)

(assert (=> b!179655 (=> (not res!149090) (not e!124923))))

(declare-fun lt!275795 () tuple2!15476)

(declare-fun isPrefixOf!0 (BitStream!7618 BitStream!7618) Bool)

(assert (=> b!179655 (= res!149090 (isPrefixOf!0 thiss!1204 (_2!8383 lt!275795)))))

(declare-fun b!179656 () Bool)

(declare-fun e!124927 () Bool)

(declare-fun lt!275792 () tuple2!15478)

(declare-fun lt!275794 () tuple2!15478)

(assert (=> b!179656 (= e!124927 (= (_2!8384 lt!275792) (_2!8384 lt!275794)))))

(declare-fun b!179657 () Bool)

(assert (=> b!179657 (= e!124923 e!124928)))

(declare-fun res!149086 () Bool)

(assert (=> b!179657 (=> (not res!149086) (not e!124928))))

(declare-fun lt!275796 () Bool)

(assert (=> b!179657 (= res!149086 (and (= (_2!8384 lt!275803) lt!275796) (= (_1!8384 lt!275803) (_2!8383 lt!275795))))))

(declare-fun readBitPure!0 (BitStream!7618) tuple2!15478)

(declare-fun readerFrom!0 (BitStream!7618 (_ BitVec 32) (_ BitVec 32)) BitStream!7618)

(assert (=> b!179657 (= lt!275803 (readBitPure!0 (readerFrom!0 (_2!8383 lt!275795) (currentBit!8903 thiss!1204) (currentByte!8908 thiss!1204))))))

(declare-fun b!179658 () Bool)

(declare-fun res!149091 () Bool)

(assert (=> b!179658 (=> res!149091 e!124926)))

(assert (=> b!179658 (= res!149091 (not (isPrefixOf!0 (_2!8383 lt!275795) (_2!8383 lt!275804))))))

(declare-fun b!179659 () Bool)

(declare-fun res!149097 () Bool)

(assert (=> b!179659 (=> (not res!149097) (not e!124924))))

(assert (=> b!179659 (= res!149097 (invariant!0 (currentBit!8903 thiss!1204) (currentByte!8908 thiss!1204) (size!4255 (buf!4698 thiss!1204))))))

(declare-fun b!179661 () Bool)

(assert (=> b!179661 (= e!124926 (bvsle i!590 #b00000000000000000000000001000000))))

(declare-datatypes ((tuple2!15480 0))(
  ( (tuple2!15481 (_1!8385 BitStream!7618) (_2!8385 BitStream!7618)) )
))
(declare-fun lt!275807 () tuple2!15480)

(assert (=> b!179661 (= (_2!8384 (readBitPure!0 (_1!8385 lt!275807))) lt!275796)))

(declare-fun lt!275799 () tuple2!15480)

(declare-fun reader!0 (BitStream!7618 BitStream!7618) tuple2!15480)

(assert (=> b!179661 (= lt!275799 (reader!0 (_2!8383 lt!275795) (_2!8383 lt!275804)))))

(assert (=> b!179661 (= lt!275807 (reader!0 thiss!1204 (_2!8383 lt!275804)))))

(assert (=> b!179661 e!124927))

(declare-fun res!149085 () Bool)

(assert (=> b!179661 (=> (not res!149085) (not e!124927))))

(assert (=> b!179661 (= res!149085 (= (bitIndex!0 (size!4255 (buf!4698 (_1!8384 lt!275792))) (currentByte!8908 (_1!8384 lt!275792)) (currentBit!8903 (_1!8384 lt!275792))) (bitIndex!0 (size!4255 (buf!4698 (_1!8384 lt!275794))) (currentByte!8908 (_1!8384 lt!275794)) (currentBit!8903 (_1!8384 lt!275794)))))))

(declare-fun lt!275805 () Unit!12929)

(declare-fun lt!275802 () BitStream!7618)

(declare-fun readBitPrefixLemma!0 (BitStream!7618 BitStream!7618) Unit!12929)

(assert (=> b!179661 (= lt!275805 (readBitPrefixLemma!0 lt!275802 (_2!8383 lt!275804)))))

(assert (=> b!179661 (= lt!275794 (readBitPure!0 (BitStream!7619 (buf!4698 (_2!8383 lt!275804)) (currentByte!8908 thiss!1204) (currentBit!8903 thiss!1204))))))

(assert (=> b!179661 (= lt!275792 (readBitPure!0 lt!275802))))

(assert (=> b!179661 e!124922))

(declare-fun res!149094 () Bool)

(assert (=> b!179661 (=> (not res!149094) (not e!124922))))

(assert (=> b!179661 (= res!149094 (invariant!0 (currentBit!8903 thiss!1204) (currentByte!8908 thiss!1204) (size!4255 (buf!4698 (_2!8383 lt!275795)))))))

(assert (=> b!179661 (= lt!275802 (BitStream!7619 (buf!4698 (_2!8383 lt!275795)) (currentByte!8908 thiss!1204) (currentBit!8903 thiss!1204)))))

(declare-fun b!179662 () Bool)

(declare-fun e!124929 () Bool)

(assert (=> b!179662 (= e!124924 (not e!124929))))

(declare-fun res!149082 () Bool)

(assert (=> b!179662 (=> res!149082 e!124929)))

(declare-fun lt!275801 () (_ BitVec 64))

(declare-fun lt!275806 () (_ BitVec 64))

(assert (=> b!179662 (= res!149082 (not (= lt!275801 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275806))))))

(assert (=> b!179662 (= lt!275801 (bitIndex!0 (size!4255 (buf!4698 (_2!8383 lt!275795))) (currentByte!8908 (_2!8383 lt!275795)) (currentBit!8903 (_2!8383 lt!275795))))))

(assert (=> b!179662 (= lt!275806 (bitIndex!0 (size!4255 (buf!4698 thiss!1204)) (currentByte!8908 thiss!1204) (currentBit!8903 thiss!1204)))))

(declare-fun e!124930 () Bool)

(assert (=> b!179662 e!124930))

(declare-fun res!149093 () Bool)

(assert (=> b!179662 (=> (not res!149093) (not e!124930))))

(assert (=> b!179662 (= res!149093 (= (size!4255 (buf!4698 thiss!1204)) (size!4255 (buf!4698 (_2!8383 lt!275795)))))))

(declare-fun appendBit!0 (BitStream!7618 Bool) tuple2!15476)

(assert (=> b!179662 (= lt!275795 (appendBit!0 thiss!1204 lt!275796))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!179662 (= lt!275796 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179663 () Bool)

(assert (=> b!179663 (= e!124930 e!124923)))

(declare-fun res!149084 () Bool)

(assert (=> b!179663 (=> (not res!149084) (not e!124923))))

(declare-fun lt!275798 () (_ BitVec 64))

(assert (=> b!179663 (= res!149084 (= lt!275793 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275798)))))

(assert (=> b!179663 (= lt!275793 (bitIndex!0 (size!4255 (buf!4698 (_2!8383 lt!275795))) (currentByte!8908 (_2!8383 lt!275795)) (currentBit!8903 (_2!8383 lt!275795))))))

(assert (=> b!179663 (= lt!275798 (bitIndex!0 (size!4255 (buf!4698 thiss!1204)) (currentByte!8908 thiss!1204) (currentBit!8903 thiss!1204)))))

(declare-fun b!179664 () Bool)

(assert (=> b!179664 (= e!124929 e!124926)))

(declare-fun res!149089 () Bool)

(assert (=> b!179664 (=> res!149089 e!124926)))

(declare-fun lt!275797 () (_ BitVec 64))

(assert (=> b!179664 (= res!149089 (not (= lt!275797 (bvsub (bvsub (bvadd lt!275801 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!179664 (= lt!275797 (bitIndex!0 (size!4255 (buf!4698 (_2!8383 lt!275804))) (currentByte!8908 (_2!8383 lt!275804)) (currentBit!8903 (_2!8383 lt!275804))))))

(assert (=> b!179664 (isPrefixOf!0 thiss!1204 (_2!8383 lt!275804))))

(declare-fun lt!275800 () Unit!12929)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7618 BitStream!7618 BitStream!7618) Unit!12929)

(assert (=> b!179664 (= lt!275800 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8383 lt!275795) (_2!8383 lt!275804)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7618 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15476)

(assert (=> b!179664 (= lt!275804 (appendBitsLSBFirstLoopTR!0 (_2!8383 lt!275795) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179665 () Bool)

(declare-fun res!149088 () Bool)

(assert (=> b!179665 (=> res!149088 e!124926)))

(assert (=> b!179665 (= res!149088 (or (not (= (size!4255 (buf!4698 (_2!8383 lt!275804))) (size!4255 (buf!4698 thiss!1204)))) (not (= lt!275797 (bvsub (bvadd lt!275806 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179666 () Bool)

(declare-fun e!124925 () Bool)

(declare-fun array_inv!3996 (array!9650) Bool)

(assert (=> b!179666 (= e!124925 (array_inv!3996 (buf!4698 thiss!1204)))))

(declare-fun b!179667 () Bool)

(declare-fun res!149092 () Bool)

(assert (=> b!179667 (=> res!149092 e!124926)))

(assert (=> b!179667 (= res!149092 (not (isPrefixOf!0 thiss!1204 (_2!8383 lt!275795))))))

(declare-fun b!179660 () Bool)

(declare-fun res!149096 () Bool)

(assert (=> b!179660 (=> (not res!149096) (not e!124924))))

(assert (=> b!179660 (= res!149096 (not (= i!590 nBits!348)))))

(declare-fun res!149087 () Bool)

(assert (=> start!39716 (=> (not res!149087) (not e!124924))))

(assert (=> start!39716 (= res!149087 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39716 e!124924))

(assert (=> start!39716 true))

(declare-fun inv!12 (BitStream!7618) Bool)

(assert (=> start!39716 (and (inv!12 thiss!1204) e!124925)))

(assert (= (and start!39716 res!149087) b!179653))

(assert (= (and b!179653 res!149095) b!179659))

(assert (= (and b!179659 res!149097) b!179660))

(assert (= (and b!179660 res!149096) b!179662))

(assert (= (and b!179662 res!149093) b!179663))

(assert (= (and b!179663 res!149084) b!179655))

(assert (= (and b!179655 res!149090) b!179657))

(assert (= (and b!179657 res!149086) b!179652))

(assert (= (and b!179662 (not res!149082)) b!179664))

(assert (= (and b!179664 (not res!149089)) b!179651))

(assert (= (and b!179651 (not res!149083)) b!179665))

(assert (= (and b!179665 (not res!149088)) b!179658))

(assert (= (and b!179658 (not res!149091)) b!179667))

(assert (= (and b!179667 (not res!149092)) b!179661))

(assert (= (and b!179661 res!149094) b!179654))

(assert (= (and b!179661 res!149085) b!179656))

(assert (= start!39716 b!179666))

(declare-fun m!280003 () Bool)

(assert (=> b!179666 m!280003))

(declare-fun m!280005 () Bool)

(assert (=> b!179653 m!280005))

(declare-fun m!280007 () Bool)

(assert (=> b!179662 m!280007))

(declare-fun m!280009 () Bool)

(assert (=> b!179662 m!280009))

(declare-fun m!280011 () Bool)

(assert (=> b!179662 m!280011))

(declare-fun m!280013 () Bool)

(assert (=> b!179667 m!280013))

(assert (=> b!179663 m!280007))

(assert (=> b!179663 m!280009))

(declare-fun m!280015 () Bool)

(assert (=> b!179652 m!280015))

(declare-fun m!280017 () Bool)

(assert (=> b!179661 m!280017))

(declare-fun m!280019 () Bool)

(assert (=> b!179661 m!280019))

(declare-fun m!280021 () Bool)

(assert (=> b!179661 m!280021))

(declare-fun m!280023 () Bool)

(assert (=> b!179661 m!280023))

(declare-fun m!280025 () Bool)

(assert (=> b!179661 m!280025))

(declare-fun m!280027 () Bool)

(assert (=> b!179661 m!280027))

(declare-fun m!280029 () Bool)

(assert (=> b!179661 m!280029))

(declare-fun m!280031 () Bool)

(assert (=> b!179661 m!280031))

(declare-fun m!280033 () Bool)

(assert (=> b!179661 m!280033))

(declare-fun m!280035 () Bool)

(assert (=> b!179664 m!280035))

(declare-fun m!280037 () Bool)

(assert (=> b!179664 m!280037))

(declare-fun m!280039 () Bool)

(assert (=> b!179664 m!280039))

(declare-fun m!280041 () Bool)

(assert (=> b!179664 m!280041))

(declare-fun m!280043 () Bool)

(assert (=> b!179654 m!280043))

(declare-fun m!280045 () Bool)

(assert (=> start!39716 m!280045))

(declare-fun m!280047 () Bool)

(assert (=> b!179651 m!280047))

(declare-fun m!280049 () Bool)

(assert (=> b!179658 m!280049))

(declare-fun m!280051 () Bool)

(assert (=> b!179657 m!280051))

(assert (=> b!179657 m!280051))

(declare-fun m!280053 () Bool)

(assert (=> b!179657 m!280053))

(assert (=> b!179655 m!280013))

(declare-fun m!280055 () Bool)

(assert (=> b!179659 m!280055))

(push 1)

(assert (not b!179652))

(assert (not start!39716))

(assert (not b!179663))

(assert (not b!179664))

(assert (not b!179654))

(assert (not b!179658))

(assert (not b!179662))

(assert (not b!179653))

(assert (not b!179661))

(assert (not b!179651))

(assert (not b!179655))

(assert (not b!179667))

(assert (not b!179657))

(assert (not b!179659))

(assert (not b!179666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

