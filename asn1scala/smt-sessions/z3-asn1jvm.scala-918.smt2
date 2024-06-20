; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25800 () Bool)

(assert start!25800)

(declare-fun res!109173 () Bool)

(declare-fun e!87218 () Bool)

(assert (=> start!25800 (=> (not res!109173) (not e!87218))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6075 0))(
  ( (array!6076 (arr!3379 (Array (_ BitVec 32) (_ BitVec 8))) (size!2750 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6075)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25800 (= res!109173 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2750 arr!237))))))

(assert (=> start!25800 e!87218))

(assert (=> start!25800 true))

(declare-fun array_inv!2539 (array!6075) Bool)

(assert (=> start!25800 (array_inv!2539 arr!237)))

(declare-datatypes ((BitStream!4764 0))(
  ( (BitStream!4765 (buf!3117 array!6075) (currentByte!5896 (_ BitVec 32)) (currentBit!5891 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4764)

(declare-fun e!87211 () Bool)

(declare-fun inv!12 (BitStream!4764) Bool)

(assert (=> start!25800 (and (inv!12 thiss!1634) e!87211)))

(declare-fun b!131583 () Bool)

(declare-fun e!87212 () Bool)

(declare-fun e!87220 () Bool)

(assert (=> b!131583 (= e!87212 (not e!87220))))

(declare-fun res!109172 () Bool)

(assert (=> b!131583 (=> res!109172 e!87220)))

(declare-datatypes ((tuple2!11370 0))(
  ( (tuple2!11371 (_1!5988 BitStream!4764) (_2!5988 array!6075)) )
))
(declare-fun lt!203089 () tuple2!11370)

(declare-datatypes ((tuple2!11372 0))(
  ( (tuple2!11373 (_1!5989 BitStream!4764) (_2!5989 BitStream!4764)) )
))
(declare-fun lt!203088 () tuple2!11372)

(assert (=> b!131583 (= res!109172 (or (not (= (size!2750 (_2!5988 lt!203089)) (size!2750 arr!237))) (not (= (_1!5988 lt!203089) (_2!5989 lt!203088)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4764 array!6075 (_ BitVec 32) (_ BitVec 32)) tuple2!11370)

(assert (=> b!131583 (= lt!203089 (readByteArrayLoopPure!0 (_1!5989 lt!203088) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8123 0))(
  ( (Unit!8124) )
))
(declare-datatypes ((tuple2!11374 0))(
  ( (tuple2!11375 (_1!5990 Unit!8123) (_2!5990 BitStream!4764)) )
))
(declare-fun lt!203081 () tuple2!11374)

(declare-fun lt!203090 () tuple2!11374)

(declare-fun lt!203083 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131583 (validate_offset_bits!1 ((_ sign_extend 32) (size!2750 (buf!3117 (_2!5990 lt!203081)))) ((_ sign_extend 32) (currentByte!5896 (_2!5990 lt!203090))) ((_ sign_extend 32) (currentBit!5891 (_2!5990 lt!203090))) lt!203083)))

(declare-fun lt!203084 () Unit!8123)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4764 array!6075 (_ BitVec 64)) Unit!8123)

(assert (=> b!131583 (= lt!203084 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5990 lt!203090) (buf!3117 (_2!5990 lt!203081)) lt!203083))))

(declare-fun reader!0 (BitStream!4764 BitStream!4764) tuple2!11372)

(assert (=> b!131583 (= lt!203088 (reader!0 (_2!5990 lt!203090) (_2!5990 lt!203081)))))

(declare-fun b!131584 () Bool)

(declare-fun e!87221 () Bool)

(declare-datatypes ((tuple2!11376 0))(
  ( (tuple2!11377 (_1!5991 BitStream!4764) (_2!5991 (_ BitVec 8))) )
))
(declare-fun lt!203077 () tuple2!11376)

(declare-fun lt!203087 () tuple2!11376)

(assert (=> b!131584 (= e!87221 (= (_2!5991 lt!203077) (_2!5991 lt!203087)))))

(declare-fun b!131585 () Bool)

(declare-fun e!87214 () Bool)

(assert (=> b!131585 (= e!87214 e!87212)))

(declare-fun res!109177 () Bool)

(assert (=> b!131585 (=> (not res!109177) (not e!87212))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131585 (= res!109177 (= (bitIndex!0 (size!2750 (buf!3117 (_2!5990 lt!203081))) (currentByte!5896 (_2!5990 lt!203081)) (currentBit!5891 (_2!5990 lt!203081))) (bvadd (bitIndex!0 (size!2750 (buf!3117 (_2!5990 lt!203090))) (currentByte!5896 (_2!5990 lt!203090)) (currentBit!5891 (_2!5990 lt!203090))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203083))))))

(assert (=> b!131585 (= lt!203083 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131586 () Bool)

(declare-fun res!109170 () Bool)

(assert (=> b!131586 (=> (not res!109170) (not e!87218))))

(assert (=> b!131586 (= res!109170 (bvslt from!447 to!404))))

(declare-fun b!131587 () Bool)

(declare-fun res!109183 () Bool)

(assert (=> b!131587 (=> (not res!109183) (not e!87218))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131587 (= res!109183 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2750 (buf!3117 thiss!1634))) ((_ sign_extend 32) (currentByte!5896 thiss!1634)) ((_ sign_extend 32) (currentBit!5891 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203080 () tuple2!11372)

(declare-fun b!131588 () Bool)

(declare-fun e!87219 () Bool)

(declare-fun lt!203082 () tuple2!11376)

(assert (=> b!131588 (= e!87219 (and (= (_2!5991 lt!203082) (select (arr!3379 arr!237) from!447)) (= (_1!5991 lt!203082) (_2!5989 lt!203080))))))

(declare-fun readBytePure!0 (BitStream!4764) tuple2!11376)

(assert (=> b!131588 (= lt!203082 (readBytePure!0 (_1!5989 lt!203080)))))

(assert (=> b!131588 (= lt!203080 (reader!0 thiss!1634 (_2!5990 lt!203090)))))

(declare-fun b!131589 () Bool)

(declare-fun res!109179 () Bool)

(assert (=> b!131589 (=> (not res!109179) (not e!87212))))

(declare-fun isPrefixOf!0 (BitStream!4764 BitStream!4764) Bool)

(assert (=> b!131589 (= res!109179 (isPrefixOf!0 (_2!5990 lt!203090) (_2!5990 lt!203081)))))

(declare-fun b!131590 () Bool)

(declare-fun res!109180 () Bool)

(assert (=> b!131590 (=> (not res!109180) (not e!87219))))

(assert (=> b!131590 (= res!109180 (isPrefixOf!0 thiss!1634 (_2!5990 lt!203090)))))

(declare-fun b!131591 () Bool)

(declare-fun e!87216 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131591 (= e!87216 (invariant!0 (currentBit!5891 thiss!1634) (currentByte!5896 thiss!1634) (size!2750 (buf!3117 (_2!5990 lt!203090)))))))

(declare-fun b!131592 () Bool)

(assert (=> b!131592 (= e!87218 (not true))))

(declare-fun e!87213 () Bool)

(assert (=> b!131592 e!87213))

(declare-fun res!109175 () Bool)

(assert (=> b!131592 (=> (not res!109175) (not e!87213))))

(assert (=> b!131592 (= res!109175 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2750 (buf!3117 (_2!5990 lt!203081)))) ((_ sign_extend 32) (currentByte!5896 thiss!1634)) ((_ sign_extend 32) (currentBit!5891 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203075 () Unit!8123)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4764 array!6075 (_ BitVec 32)) Unit!8123)

(assert (=> b!131592 (= lt!203075 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3117 (_2!5990 lt!203081)) (bvsub to!404 from!447)))))

(declare-fun lt!203079 () tuple2!11372)

(assert (=> b!131592 (= (_2!5991 (readBytePure!0 (_1!5989 lt!203079))) (select (arr!3379 arr!237) from!447))))

(declare-fun lt!203076 () tuple2!11372)

(assert (=> b!131592 (= lt!203076 (reader!0 (_2!5990 lt!203090) (_2!5990 lt!203081)))))

(assert (=> b!131592 (= lt!203079 (reader!0 thiss!1634 (_2!5990 lt!203081)))))

(assert (=> b!131592 e!87221))

(declare-fun res!109181 () Bool)

(assert (=> b!131592 (=> (not res!109181) (not e!87221))))

(assert (=> b!131592 (= res!109181 (= (bitIndex!0 (size!2750 (buf!3117 (_1!5991 lt!203077))) (currentByte!5896 (_1!5991 lt!203077)) (currentBit!5891 (_1!5991 lt!203077))) (bitIndex!0 (size!2750 (buf!3117 (_1!5991 lt!203087))) (currentByte!5896 (_1!5991 lt!203087)) (currentBit!5891 (_1!5991 lt!203087)))))))

(declare-fun lt!203086 () Unit!8123)

(declare-fun lt!203085 () BitStream!4764)

(declare-fun readBytePrefixLemma!0 (BitStream!4764 BitStream!4764) Unit!8123)

(assert (=> b!131592 (= lt!203086 (readBytePrefixLemma!0 lt!203085 (_2!5990 lt!203081)))))

(assert (=> b!131592 (= lt!203087 (readBytePure!0 (BitStream!4765 (buf!3117 (_2!5990 lt!203081)) (currentByte!5896 thiss!1634) (currentBit!5891 thiss!1634))))))

(assert (=> b!131592 (= lt!203077 (readBytePure!0 lt!203085))))

(assert (=> b!131592 (= lt!203085 (BitStream!4765 (buf!3117 (_2!5990 lt!203090)) (currentByte!5896 thiss!1634) (currentBit!5891 thiss!1634)))))

(assert (=> b!131592 e!87216))

(declare-fun res!109174 () Bool)

(assert (=> b!131592 (=> (not res!109174) (not e!87216))))

(assert (=> b!131592 (= res!109174 (isPrefixOf!0 thiss!1634 (_2!5990 lt!203081)))))

(declare-fun lt!203078 () Unit!8123)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4764 BitStream!4764 BitStream!4764) Unit!8123)

(assert (=> b!131592 (= lt!203078 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5990 lt!203090) (_2!5990 lt!203081)))))

(assert (=> b!131592 e!87214))

(declare-fun res!109171 () Bool)

(assert (=> b!131592 (=> (not res!109171) (not e!87214))))

(assert (=> b!131592 (= res!109171 (= (size!2750 (buf!3117 (_2!5990 lt!203090))) (size!2750 (buf!3117 (_2!5990 lt!203081)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4764 array!6075 (_ BitVec 32) (_ BitVec 32)) tuple2!11374)

(assert (=> b!131592 (= lt!203081 (appendByteArrayLoop!0 (_2!5990 lt!203090) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131592 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2750 (buf!3117 (_2!5990 lt!203090)))) ((_ sign_extend 32) (currentByte!5896 (_2!5990 lt!203090))) ((_ sign_extend 32) (currentBit!5891 (_2!5990 lt!203090))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203074 () Unit!8123)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4764 BitStream!4764 (_ BitVec 64) (_ BitVec 32)) Unit!8123)

(assert (=> b!131592 (= lt!203074 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5990 lt!203090) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131592 e!87219))

(declare-fun res!109178 () Bool)

(assert (=> b!131592 (=> (not res!109178) (not e!87219))))

(assert (=> b!131592 (= res!109178 (= (size!2750 (buf!3117 thiss!1634)) (size!2750 (buf!3117 (_2!5990 lt!203090)))))))

(declare-fun appendByte!0 (BitStream!4764 (_ BitVec 8)) tuple2!11374)

(assert (=> b!131592 (= lt!203090 (appendByte!0 thiss!1634 (select (arr!3379 arr!237) from!447)))))

(declare-fun b!131593 () Bool)

(declare-fun res!109182 () Bool)

(assert (=> b!131593 (=> (not res!109182) (not e!87218))))

(assert (=> b!131593 (= res!109182 (invariant!0 (currentBit!5891 thiss!1634) (currentByte!5896 thiss!1634) (size!2750 (buf!3117 thiss!1634))))))

(declare-fun b!131594 () Bool)

(assert (=> b!131594 (= e!87213 (= (_1!5988 (readByteArrayLoopPure!0 (_1!5989 lt!203079) arr!237 from!447 to!404)) (_2!5989 lt!203079)))))

(declare-fun b!131595 () Bool)

(declare-fun arrayRangesEq!153 (array!6075 array!6075 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131595 (= e!87220 (not (arrayRangesEq!153 arr!237 (_2!5988 lt!203089) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131596 () Bool)

(declare-fun res!109176 () Bool)

(assert (=> b!131596 (=> (not res!109176) (not e!87219))))

(assert (=> b!131596 (= res!109176 (= (bitIndex!0 (size!2750 (buf!3117 (_2!5990 lt!203090))) (currentByte!5896 (_2!5990 lt!203090)) (currentBit!5891 (_2!5990 lt!203090))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2750 (buf!3117 thiss!1634)) (currentByte!5896 thiss!1634) (currentBit!5891 thiss!1634)))))))

(declare-fun b!131597 () Bool)

(assert (=> b!131597 (= e!87211 (array_inv!2539 (buf!3117 thiss!1634)))))

(assert (= (and start!25800 res!109173) b!131587))

(assert (= (and b!131587 res!109183) b!131586))

(assert (= (and b!131586 res!109170) b!131593))

(assert (= (and b!131593 res!109182) b!131592))

(assert (= (and b!131592 res!109178) b!131596))

(assert (= (and b!131596 res!109176) b!131590))

(assert (= (and b!131590 res!109180) b!131588))

(assert (= (and b!131592 res!109171) b!131585))

(assert (= (and b!131585 res!109177) b!131589))

(assert (= (and b!131589 res!109179) b!131583))

(assert (= (and b!131583 (not res!109172)) b!131595))

(assert (= (and b!131592 res!109174) b!131591))

(assert (= (and b!131592 res!109181) b!131584))

(assert (= (and b!131592 res!109175) b!131594))

(assert (= start!25800 b!131597))

(declare-fun m!198623 () Bool)

(assert (=> b!131588 m!198623))

(declare-fun m!198625 () Bool)

(assert (=> b!131588 m!198625))

(declare-fun m!198627 () Bool)

(assert (=> b!131588 m!198627))

(declare-fun m!198629 () Bool)

(assert (=> b!131594 m!198629))

(declare-fun m!198631 () Bool)

(assert (=> b!131591 m!198631))

(declare-fun m!198633 () Bool)

(assert (=> b!131583 m!198633))

(declare-fun m!198635 () Bool)

(assert (=> b!131583 m!198635))

(declare-fun m!198637 () Bool)

(assert (=> b!131583 m!198637))

(declare-fun m!198639 () Bool)

(assert (=> b!131583 m!198639))

(declare-fun m!198641 () Bool)

(assert (=> b!131596 m!198641))

(declare-fun m!198643 () Bool)

(assert (=> b!131596 m!198643))

(declare-fun m!198645 () Bool)

(assert (=> b!131595 m!198645))

(declare-fun m!198647 () Bool)

(assert (=> b!131597 m!198647))

(declare-fun m!198649 () Bool)

(assert (=> b!131589 m!198649))

(declare-fun m!198651 () Bool)

(assert (=> b!131585 m!198651))

(assert (=> b!131585 m!198641))

(declare-fun m!198653 () Bool)

(assert (=> b!131587 m!198653))

(declare-fun m!198655 () Bool)

(assert (=> b!131590 m!198655))

(declare-fun m!198657 () Bool)

(assert (=> b!131592 m!198657))

(declare-fun m!198659 () Bool)

(assert (=> b!131592 m!198659))

(declare-fun m!198661 () Bool)

(assert (=> b!131592 m!198661))

(declare-fun m!198663 () Bool)

(assert (=> b!131592 m!198663))

(declare-fun m!198665 () Bool)

(assert (=> b!131592 m!198665))

(declare-fun m!198667 () Bool)

(assert (=> b!131592 m!198667))

(declare-fun m!198669 () Bool)

(assert (=> b!131592 m!198669))

(assert (=> b!131592 m!198623))

(declare-fun m!198671 () Bool)

(assert (=> b!131592 m!198671))

(declare-fun m!198673 () Bool)

(assert (=> b!131592 m!198673))

(assert (=> b!131592 m!198623))

(declare-fun m!198675 () Bool)

(assert (=> b!131592 m!198675))

(declare-fun m!198677 () Bool)

(assert (=> b!131592 m!198677))

(declare-fun m!198679 () Bool)

(assert (=> b!131592 m!198679))

(declare-fun m!198681 () Bool)

(assert (=> b!131592 m!198681))

(assert (=> b!131592 m!198639))

(declare-fun m!198683 () Bool)

(assert (=> b!131592 m!198683))

(declare-fun m!198685 () Bool)

(assert (=> b!131592 m!198685))

(declare-fun m!198687 () Bool)

(assert (=> b!131593 m!198687))

(declare-fun m!198689 () Bool)

(assert (=> start!25800 m!198689))

(declare-fun m!198691 () Bool)

(assert (=> start!25800 m!198691))

(check-sat (not b!131588) (not b!131587) (not b!131594) (not b!131583) (not b!131591) (not b!131597) (not b!131585) (not b!131589) (not b!131595) (not b!131590) (not b!131593) (not b!131592) (not start!25800) (not b!131596))
