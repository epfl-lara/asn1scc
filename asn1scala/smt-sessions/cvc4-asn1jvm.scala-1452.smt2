; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39750 () Bool)

(assert start!39750)

(declare-fun b!180518 () Bool)

(declare-fun res!149911 () Bool)

(declare-fun e!125455 () Bool)

(assert (=> b!180518 (=> res!149911 e!125455)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9684 0))(
  ( (array!9685 (arr!5202 (Array (_ BitVec 32) (_ BitVec 8))) (size!4272 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7652 0))(
  ( (BitStream!7653 (buf!4715 array!9684) (currentByte!8925 (_ BitVec 32)) (currentBit!8920 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12963 0))(
  ( (Unit!12964) )
))
(declare-datatypes ((tuple2!15578 0))(
  ( (tuple2!15579 (_1!8434 Unit!12963) (_2!8434 BitStream!7652)) )
))
(declare-fun lt!276651 () tuple2!15578)

(declare-fun lt!276654 () (_ BitVec 64))

(declare-fun thiss!1204 () BitStream!7652)

(declare-fun lt!276656 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!180518 (= res!149911 (or (not (= (size!4272 (buf!4715 (_2!8434 lt!276651))) (size!4272 (buf!4715 thiss!1204)))) (not (= lt!276656 (bvsub (bvadd lt!276654 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!149901 () Bool)

(declare-fun e!125456 () Bool)

(assert (=> start!39750 (=> (not res!149901) (not e!125456))))

(assert (=> start!39750 (= res!149901 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39750 e!125456))

(assert (=> start!39750 true))

(declare-fun e!125454 () Bool)

(declare-fun inv!12 (BitStream!7652) Bool)

(assert (=> start!39750 (and (inv!12 thiss!1204) e!125454)))

(declare-fun b!180519 () Bool)

(declare-fun e!125448 () Bool)

(declare-fun e!125450 () Bool)

(assert (=> b!180519 (= e!125448 (not e!125450))))

(declare-fun res!149903 () Bool)

(assert (=> b!180519 (=> res!149903 e!125450)))

(declare-fun lt!276645 () (_ BitVec 64))

(assert (=> b!180519 (= res!149903 (not (= lt!276645 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276654))))))

(declare-fun lt!276643 () tuple2!15578)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180519 (= lt!276645 (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))))))

(assert (=> b!180519 (= lt!276654 (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)))))

(declare-fun e!125449 () Bool)

(assert (=> b!180519 e!125449))

(declare-fun res!149905 () Bool)

(assert (=> b!180519 (=> (not res!149905) (not e!125449))))

(assert (=> b!180519 (= res!149905 (= (size!4272 (buf!4715 thiss!1204)) (size!4272 (buf!4715 (_2!8434 lt!276643)))))))

(declare-fun lt!276655 () Bool)

(declare-fun appendBit!0 (BitStream!7652 Bool) tuple2!15578)

(assert (=> b!180519 (= lt!276643 (appendBit!0 thiss!1204 lt!276655))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!180519 (= lt!276655 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180520 () Bool)

(declare-fun res!149908 () Bool)

(assert (=> b!180520 (=> (not res!149908) (not e!125448))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180520 (= res!149908 (invariant!0 (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204) (size!4272 (buf!4715 thiss!1204))))))

(declare-fun b!180521 () Bool)

(declare-fun e!125457 () Bool)

(declare-fun e!125451 () Bool)

(assert (=> b!180521 (= e!125457 e!125451)))

(declare-fun res!149913 () Bool)

(assert (=> b!180521 (=> (not res!149913) (not e!125451))))

(declare-datatypes ((tuple2!15580 0))(
  ( (tuple2!15581 (_1!8435 BitStream!7652) (_2!8435 Bool)) )
))
(declare-fun lt!276644 () tuple2!15580)

(assert (=> b!180521 (= res!149913 (and (= (_2!8435 lt!276644) lt!276655) (= (_1!8435 lt!276644) (_2!8434 lt!276643))))))

(declare-fun readBitPure!0 (BitStream!7652) tuple2!15580)

(declare-fun readerFrom!0 (BitStream!7652 (_ BitVec 32) (_ BitVec 32)) BitStream!7652)

(assert (=> b!180521 (= lt!276644 (readBitPure!0 (readerFrom!0 (_2!8434 lt!276643) (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204))))))

(declare-fun b!180522 () Bool)

(declare-fun res!149909 () Bool)

(assert (=> b!180522 (=> res!149909 e!125455)))

(assert (=> b!180522 (= res!149909 (not (invariant!0 (currentBit!8920 (_2!8434 lt!276651)) (currentByte!8925 (_2!8434 lt!276651)) (size!4272 (buf!4715 (_2!8434 lt!276651))))))))

(declare-fun b!180523 () Bool)

(declare-datatypes ((tuple2!15582 0))(
  ( (tuple2!15583 (_1!8436 BitStream!7652) (_2!8436 BitStream!7652)) )
))
(declare-fun lt!276649 () tuple2!15582)

(declare-fun lt!276647 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180523 (= e!125455 (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8436 lt!276649)))) ((_ sign_extend 32) (currentByte!8925 (_1!8436 lt!276649))) ((_ sign_extend 32) (currentBit!8920 (_1!8436 lt!276649))) lt!276647))))

(assert (=> b!180523 (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276651)))) ((_ sign_extend 32) (currentByte!8925 thiss!1204)) ((_ sign_extend 32) (currentBit!8920 thiss!1204)) lt!276647)))

(declare-fun lt!276646 () Unit!12963)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7652 array!9684 (_ BitVec 64)) Unit!12963)

(assert (=> b!180523 (= lt!276646 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4715 (_2!8434 lt!276651)) lt!276647))))

(assert (=> b!180523 (= (_2!8435 (readBitPure!0 (_1!8436 lt!276649))) lt!276655)))

(declare-fun lt!276657 () tuple2!15582)

(declare-fun reader!0 (BitStream!7652 BitStream!7652) tuple2!15582)

(assert (=> b!180523 (= lt!276657 (reader!0 (_2!8434 lt!276643) (_2!8434 lt!276651)))))

(assert (=> b!180523 (= lt!276649 (reader!0 thiss!1204 (_2!8434 lt!276651)))))

(declare-fun e!125452 () Bool)

(assert (=> b!180523 e!125452))

(declare-fun res!149912 () Bool)

(assert (=> b!180523 (=> (not res!149912) (not e!125452))))

(declare-fun lt!276659 () tuple2!15580)

(declare-fun lt!276653 () tuple2!15580)

(assert (=> b!180523 (= res!149912 (= (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!276659))) (currentByte!8925 (_1!8435 lt!276659)) (currentBit!8920 (_1!8435 lt!276659))) (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!276653))) (currentByte!8925 (_1!8435 lt!276653)) (currentBit!8920 (_1!8435 lt!276653)))))))

(declare-fun lt!276642 () Unit!12963)

(declare-fun lt!276658 () BitStream!7652)

(declare-fun readBitPrefixLemma!0 (BitStream!7652 BitStream!7652) Unit!12963)

(assert (=> b!180523 (= lt!276642 (readBitPrefixLemma!0 lt!276658 (_2!8434 lt!276651)))))

(assert (=> b!180523 (= lt!276653 (readBitPure!0 (BitStream!7653 (buf!4715 (_2!8434 lt!276651)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204))))))

(assert (=> b!180523 (= lt!276659 (readBitPure!0 lt!276658))))

(declare-fun e!125453 () Bool)

(assert (=> b!180523 e!125453))

(declare-fun res!149904 () Bool)

(assert (=> b!180523 (=> (not res!149904) (not e!125453))))

(assert (=> b!180523 (= res!149904 (invariant!0 (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204) (size!4272 (buf!4715 (_2!8434 lt!276643)))))))

(assert (=> b!180523 (= lt!276658 (BitStream!7653 (buf!4715 (_2!8434 lt!276643)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)))))

(declare-fun b!180524 () Bool)

(declare-fun res!149900 () Bool)

(assert (=> b!180524 (=> (not res!149900) (not e!125457))))

(declare-fun isPrefixOf!0 (BitStream!7652 BitStream!7652) Bool)

(assert (=> b!180524 (= res!149900 (isPrefixOf!0 thiss!1204 (_2!8434 lt!276643)))))

(declare-fun b!180525 () Bool)

(assert (=> b!180525 (= e!125449 e!125457)))

(declare-fun res!149907 () Bool)

(assert (=> b!180525 (=> (not res!149907) (not e!125457))))

(declare-fun lt!276652 () (_ BitVec 64))

(declare-fun lt!276648 () (_ BitVec 64))

(assert (=> b!180525 (= res!149907 (= lt!276652 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276648)))))

(assert (=> b!180525 (= lt!276652 (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))))))

(assert (=> b!180525 (= lt!276648 (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)))))

(declare-fun b!180526 () Bool)

(assert (=> b!180526 (= e!125453 (invariant!0 (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204) (size!4272 (buf!4715 (_2!8434 lt!276651)))))))

(declare-fun b!180527 () Bool)

(assert (=> b!180527 (= e!125452 (= (_2!8435 lt!276659) (_2!8435 lt!276653)))))

(declare-fun b!180528 () Bool)

(assert (=> b!180528 (= e!125451 (= (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!276644))) (currentByte!8925 (_1!8435 lt!276644)) (currentBit!8920 (_1!8435 lt!276644))) lt!276652))))

(declare-fun b!180529 () Bool)

(assert (=> b!180529 (= e!125456 e!125448)))

(declare-fun res!149906 () Bool)

(assert (=> b!180529 (=> (not res!149906) (not e!125448))))

(assert (=> b!180529 (= res!149906 (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 thiss!1204))) ((_ sign_extend 32) (currentByte!8925 thiss!1204)) ((_ sign_extend 32) (currentBit!8920 thiss!1204)) lt!276647))))

(assert (=> b!180529 (= lt!276647 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!180530 () Bool)

(declare-fun array_inv!4013 (array!9684) Bool)

(assert (=> b!180530 (= e!125454 (array_inv!4013 (buf!4715 thiss!1204)))))

(declare-fun b!180531 () Bool)

(declare-fun res!149898 () Bool)

(assert (=> b!180531 (=> res!149898 e!125455)))

(assert (=> b!180531 (= res!149898 (not (isPrefixOf!0 (_2!8434 lt!276643) (_2!8434 lt!276651))))))

(declare-fun b!180532 () Bool)

(declare-fun res!149899 () Bool)

(assert (=> b!180532 (=> (not res!149899) (not e!125448))))

(assert (=> b!180532 (= res!149899 (not (= i!590 nBits!348)))))

(declare-fun b!180533 () Bool)

(assert (=> b!180533 (= e!125450 e!125455)))

(declare-fun res!149910 () Bool)

(assert (=> b!180533 (=> res!149910 e!125455)))

(assert (=> b!180533 (= res!149910 (not (= lt!276656 (bvsub (bvsub (bvadd lt!276645 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180533 (= lt!276656 (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276651))) (currentByte!8925 (_2!8434 lt!276651)) (currentBit!8920 (_2!8434 lt!276651))))))

(assert (=> b!180533 (isPrefixOf!0 thiss!1204 (_2!8434 lt!276651))))

(declare-fun lt!276650 () Unit!12963)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7652 BitStream!7652 BitStream!7652) Unit!12963)

(assert (=> b!180533 (= lt!276650 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8434 lt!276643) (_2!8434 lt!276651)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15578)

(assert (=> b!180533 (= lt!276651 (appendBitsLSBFirstLoopTR!0 (_2!8434 lt!276643) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180534 () Bool)

(declare-fun res!149902 () Bool)

(assert (=> b!180534 (=> res!149902 e!125455)))

(assert (=> b!180534 (= res!149902 (not (isPrefixOf!0 thiss!1204 (_2!8434 lt!276643))))))

(assert (= (and start!39750 res!149901) b!180529))

(assert (= (and b!180529 res!149906) b!180520))

(assert (= (and b!180520 res!149908) b!180532))

(assert (= (and b!180532 res!149899) b!180519))

(assert (= (and b!180519 res!149905) b!180525))

(assert (= (and b!180525 res!149907) b!180524))

(assert (= (and b!180524 res!149900) b!180521))

(assert (= (and b!180521 res!149913) b!180528))

(assert (= (and b!180519 (not res!149903)) b!180533))

(assert (= (and b!180533 (not res!149910)) b!180522))

(assert (= (and b!180522 (not res!149909)) b!180518))

(assert (= (and b!180518 (not res!149911)) b!180531))

(assert (= (and b!180531 (not res!149898)) b!180534))

(assert (= (and b!180534 (not res!149902)) b!180523))

(assert (= (and b!180523 res!149904) b!180526))

(assert (= (and b!180523 res!149912) b!180527))

(assert (= start!39750 b!180530))

(declare-fun m!280945 () Bool)

(assert (=> b!180526 m!280945))

(declare-fun m!280947 () Bool)

(assert (=> b!180529 m!280947))

(declare-fun m!280949 () Bool)

(assert (=> start!39750 m!280949))

(declare-fun m!280951 () Bool)

(assert (=> b!180519 m!280951))

(declare-fun m!280953 () Bool)

(assert (=> b!180519 m!280953))

(declare-fun m!280955 () Bool)

(assert (=> b!180519 m!280955))

(declare-fun m!280957 () Bool)

(assert (=> b!180534 m!280957))

(declare-fun m!280959 () Bool)

(assert (=> b!180533 m!280959))

(declare-fun m!280961 () Bool)

(assert (=> b!180533 m!280961))

(declare-fun m!280963 () Bool)

(assert (=> b!180533 m!280963))

(declare-fun m!280965 () Bool)

(assert (=> b!180533 m!280965))

(declare-fun m!280967 () Bool)

(assert (=> b!180520 m!280967))

(declare-fun m!280969 () Bool)

(assert (=> b!180528 m!280969))

(declare-fun m!280971 () Bool)

(assert (=> b!180522 m!280971))

(declare-fun m!280973 () Bool)

(assert (=> b!180521 m!280973))

(assert (=> b!180521 m!280973))

(declare-fun m!280975 () Bool)

(assert (=> b!180521 m!280975))

(declare-fun m!280977 () Bool)

(assert (=> b!180523 m!280977))

(declare-fun m!280979 () Bool)

(assert (=> b!180523 m!280979))

(declare-fun m!280981 () Bool)

(assert (=> b!180523 m!280981))

(declare-fun m!280983 () Bool)

(assert (=> b!180523 m!280983))

(declare-fun m!280985 () Bool)

(assert (=> b!180523 m!280985))

(declare-fun m!280987 () Bool)

(assert (=> b!180523 m!280987))

(declare-fun m!280989 () Bool)

(assert (=> b!180523 m!280989))

(declare-fun m!280991 () Bool)

(assert (=> b!180523 m!280991))

(declare-fun m!280993 () Bool)

(assert (=> b!180523 m!280993))

(declare-fun m!280995 () Bool)

(assert (=> b!180523 m!280995))

(declare-fun m!280997 () Bool)

(assert (=> b!180523 m!280997))

(declare-fun m!280999 () Bool)

(assert (=> b!180523 m!280999))

(assert (=> b!180524 m!280957))

(declare-fun m!281001 () Bool)

(assert (=> b!180531 m!281001))

(assert (=> b!180525 m!280951))

(assert (=> b!180525 m!280953))

(declare-fun m!281003 () Bool)

(assert (=> b!180530 m!281003))

(push 1)

(assert (not b!180525))

(assert (not b!180519))

(assert (not b!180524))

(assert (not b!180520))

(assert (not b!180530))

(assert (not b!180526))

(assert (not b!180522))

(assert (not b!180529))

(assert (not b!180523))

(assert (not b!180531))

(assert (not b!180528))

(assert (not b!180534))

(assert (not b!180533))

(assert (not start!39750))

(assert (not b!180521))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62933 () Bool)

(assert (=> d!62933 (= (invariant!0 (currentBit!8920 (_2!8434 lt!276651)) (currentByte!8925 (_2!8434 lt!276651)) (size!4272 (buf!4715 (_2!8434 lt!276651)))) (and (bvsge (currentBit!8920 (_2!8434 lt!276651)) #b00000000000000000000000000000000) (bvslt (currentBit!8920 (_2!8434 lt!276651)) #b00000000000000000000000000001000) (bvsge (currentByte!8925 (_2!8434 lt!276651)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8925 (_2!8434 lt!276651)) (size!4272 (buf!4715 (_2!8434 lt!276651)))) (and (= (currentBit!8920 (_2!8434 lt!276651)) #b00000000000000000000000000000000) (= (currentByte!8925 (_2!8434 lt!276651)) (size!4272 (buf!4715 (_2!8434 lt!276651))))))))))

(assert (=> b!180522 d!62933))

(declare-fun d!62935 () Bool)

(declare-fun e!125535 () Bool)

(assert (=> d!62935 e!125535))

(declare-fun res!150039 () Bool)

(assert (=> d!62935 (=> (not res!150039) (not e!125535))))

(declare-fun lt!277004 () (_ BitVec 64))

(declare-fun lt!277005 () (_ BitVec 64))

(declare-fun lt!277001 () (_ BitVec 64))

(assert (=> d!62935 (= res!150039 (= lt!277001 (bvsub lt!277004 lt!277005)))))

(assert (=> d!62935 (or (= (bvand lt!277004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277005 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277004 lt!277005) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62935 (= lt!277005 (remainingBits!0 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276651)))) ((_ sign_extend 32) (currentByte!8925 (_2!8434 lt!276651))) ((_ sign_extend 32) (currentBit!8920 (_2!8434 lt!276651)))))))

(declare-fun lt!277002 () (_ BitVec 64))

(declare-fun lt!277003 () (_ BitVec 64))

(assert (=> d!62935 (= lt!277004 (bvmul lt!277002 lt!277003))))

(assert (=> d!62935 (or (= lt!277002 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277003 (bvsdiv (bvmul lt!277002 lt!277003) lt!277002)))))

(assert (=> d!62935 (= lt!277003 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62935 (= lt!277002 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276651)))))))

(assert (=> d!62935 (= lt!277001 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8925 (_2!8434 lt!276651))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8920 (_2!8434 lt!276651)))))))

(assert (=> d!62935 (invariant!0 (currentBit!8920 (_2!8434 lt!276651)) (currentByte!8925 (_2!8434 lt!276651)) (size!4272 (buf!4715 (_2!8434 lt!276651))))))

(assert (=> d!62935 (= (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276651))) (currentByte!8925 (_2!8434 lt!276651)) (currentBit!8920 (_2!8434 lt!276651))) lt!277001)))

(declare-fun b!180676 () Bool)

(declare-fun res!150040 () Bool)

(assert (=> b!180676 (=> (not res!150040) (not e!125535))))

(assert (=> b!180676 (= res!150040 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277001))))

(declare-fun b!180677 () Bool)

(declare-fun lt!277000 () (_ BitVec 64))

(assert (=> b!180677 (= e!125535 (bvsle lt!277001 (bvmul lt!277000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180677 (or (= lt!277000 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277000 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277000)))))

(assert (=> b!180677 (= lt!277000 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276651)))))))

(assert (= (and d!62935 res!150039) b!180676))

(assert (= (and b!180676 res!150040) b!180677))

(declare-fun m!281247 () Bool)

(assert (=> d!62935 m!281247))

(assert (=> d!62935 m!280971))

(assert (=> b!180533 d!62935))

(declare-fun d!62937 () Bool)

(declare-fun res!150047 () Bool)

(declare-fun e!125540 () Bool)

(assert (=> d!62937 (=> (not res!150047) (not e!125540))))

(assert (=> d!62937 (= res!150047 (= (size!4272 (buf!4715 thiss!1204)) (size!4272 (buf!4715 (_2!8434 lt!276651)))))))

(assert (=> d!62937 (= (isPrefixOf!0 thiss!1204 (_2!8434 lt!276651)) e!125540)))

(declare-fun b!180684 () Bool)

(declare-fun res!150048 () Bool)

(assert (=> b!180684 (=> (not res!150048) (not e!125540))))

(assert (=> b!180684 (= res!150048 (bvsle (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)) (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276651))) (currentByte!8925 (_2!8434 lt!276651)) (currentBit!8920 (_2!8434 lt!276651)))))))

(declare-fun b!180685 () Bool)

(declare-fun e!125541 () Bool)

(assert (=> b!180685 (= e!125540 e!125541)))

(declare-fun res!150049 () Bool)

(assert (=> b!180685 (=> res!150049 e!125541)))

(assert (=> b!180685 (= res!150049 (= (size!4272 (buf!4715 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!180686 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9684 array!9684 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180686 (= e!125541 (arrayBitRangesEq!0 (buf!4715 thiss!1204) (buf!4715 (_2!8434 lt!276651)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204))))))

(assert (= (and d!62937 res!150047) b!180684))

(assert (= (and b!180684 res!150048) b!180685))

(assert (= (and b!180685 (not res!150049)) b!180686))

(assert (=> b!180684 m!280953))

(assert (=> b!180684 m!280959))

(assert (=> b!180686 m!280953))

(assert (=> b!180686 m!280953))

(declare-fun m!281249 () Bool)

(assert (=> b!180686 m!281249))

(assert (=> b!180533 d!62937))

(declare-fun d!62939 () Bool)

(assert (=> d!62939 (isPrefixOf!0 thiss!1204 (_2!8434 lt!276651))))

(declare-fun lt!277008 () Unit!12963)

(declare-fun choose!30 (BitStream!7652 BitStream!7652 BitStream!7652) Unit!12963)

(assert (=> d!62939 (= lt!277008 (choose!30 thiss!1204 (_2!8434 lt!276643) (_2!8434 lt!276651)))))

(assert (=> d!62939 (isPrefixOf!0 thiss!1204 (_2!8434 lt!276643))))

(assert (=> d!62939 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8434 lt!276643) (_2!8434 lt!276651)) lt!277008)))

(declare-fun bs!15686 () Bool)

(assert (= bs!15686 d!62939))

(assert (=> bs!15686 m!280961))

(declare-fun m!281251 () Bool)

(assert (=> bs!15686 m!281251))

(assert (=> bs!15686 m!280957))

(assert (=> b!180533 d!62939))

(declare-fun b!180818 () Bool)

(declare-fun lt!277489 () tuple2!15580)

(declare-fun lt!277460 () tuple2!15578)

(assert (=> b!180818 (= lt!277489 (readBitPure!0 (readerFrom!0 (_2!8434 lt!277460) (currentBit!8920 (_2!8434 lt!276643)) (currentByte!8925 (_2!8434 lt!276643)))))))

(declare-fun res!150153 () Bool)

(declare-fun lt!277486 () Bool)

(assert (=> b!180818 (= res!150153 (and (= (_2!8435 lt!277489) lt!277486) (= (_1!8435 lt!277489) (_2!8434 lt!277460))))))

(declare-fun e!125620 () Bool)

(assert (=> b!180818 (=> (not res!150153) (not e!125620))))

(declare-fun e!125616 () Bool)

(assert (=> b!180818 (= e!125616 e!125620)))

(declare-fun b!180819 () Bool)

(declare-fun e!125619 () Bool)

(declare-fun e!125618 () Bool)

(assert (=> b!180819 (= e!125619 e!125618)))

(declare-fun res!150156 () Bool)

(assert (=> b!180819 (=> (not res!150156) (not e!125618))))

(declare-datatypes ((tuple2!15592 0))(
  ( (tuple2!15593 (_1!8441 BitStream!7652) (_2!8441 (_ BitVec 64))) )
))
(declare-fun lt!277485 () tuple2!15592)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180819 (= res!150156 (= (_2!8441 lt!277485) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!277490 () tuple2!15582)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15592)

(assert (=> b!180819 (= lt!277485 (readNBitsLSBFirstsLoopPure!0 (_1!8436 lt!277490) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!277495 () Unit!12963)

(declare-fun lt!277473 () Unit!12963)

(assert (=> b!180819 (= lt!277495 lt!277473)))

(declare-fun lt!277487 () tuple2!15578)

(declare-fun lt!277464 () (_ BitVec 64))

(assert (=> b!180819 (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!277487)))) ((_ sign_extend 32) (currentByte!8925 (_2!8434 lt!276643))) ((_ sign_extend 32) (currentBit!8920 (_2!8434 lt!276643))) lt!277464)))

(assert (=> b!180819 (= lt!277473 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8434 lt!276643) (buf!4715 (_2!8434 lt!277487)) lt!277464))))

(declare-fun e!125624 () Bool)

(assert (=> b!180819 e!125624))

(declare-fun res!150160 () Bool)

(assert (=> b!180819 (=> (not res!150160) (not e!125624))))

(assert (=> b!180819 (= res!150160 (and (= (size!4272 (buf!4715 (_2!8434 lt!276643))) (size!4272 (buf!4715 (_2!8434 lt!277487)))) (bvsge lt!277464 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180819 (= lt!277464 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!180819 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!180819 (= lt!277490 (reader!0 (_2!8434 lt!276643) (_2!8434 lt!277487)))))

(declare-fun b!180820 () Bool)

(declare-fun res!150158 () Bool)

(declare-fun call!2945 () Bool)

(assert (=> b!180820 (= res!150158 call!2945)))

(assert (=> b!180820 (=> (not res!150158) (not e!125616))))

(declare-fun b!180821 () Bool)

(declare-fun e!125623 () Bool)

(declare-fun lt!277471 () tuple2!15580)

(declare-fun lt!277498 () tuple2!15580)

(assert (=> b!180821 (= e!125623 (= (_2!8435 lt!277471) (_2!8435 lt!277498)))))

(declare-fun b!180822 () Bool)

(assert (=> b!180822 (= e!125618 (= (_1!8441 lt!277485) (_2!8436 lt!277490)))))

(declare-fun b!180823 () Bool)

(declare-fun e!125617 () tuple2!15578)

(declare-fun lt!277465 () tuple2!15578)

(assert (=> b!180823 (= e!125617 (tuple2!15579 (_1!8434 lt!277465) (_2!8434 lt!277465)))))

(assert (=> b!180823 (= lt!277486 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180823 (= lt!277460 (appendBit!0 (_2!8434 lt!276643) lt!277486))))

(declare-fun res!150150 () Bool)

(assert (=> b!180823 (= res!150150 (= (size!4272 (buf!4715 (_2!8434 lt!276643))) (size!4272 (buf!4715 (_2!8434 lt!277460)))))))

(assert (=> b!180823 (=> (not res!150150) (not e!125616))))

(assert (=> b!180823 e!125616))

(declare-fun lt!277506 () tuple2!15578)

(assert (=> b!180823 (= lt!277506 lt!277460)))

(assert (=> b!180823 (= lt!277465 (appendBitsLSBFirstLoopTR!0 (_2!8434 lt!277506) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!277501 () Unit!12963)

(assert (=> b!180823 (= lt!277501 (lemmaIsPrefixTransitive!0 (_2!8434 lt!276643) (_2!8434 lt!277506) (_2!8434 lt!277465)))))

(assert (=> b!180823 (isPrefixOf!0 (_2!8434 lt!276643) (_2!8434 lt!277465))))

(declare-fun lt!277462 () Unit!12963)

(assert (=> b!180823 (= lt!277462 lt!277501)))

(assert (=> b!180823 (invariant!0 (currentBit!8920 (_2!8434 lt!276643)) (currentByte!8925 (_2!8434 lt!276643)) (size!4272 (buf!4715 (_2!8434 lt!277506))))))

(declare-fun lt!277484 () BitStream!7652)

(assert (=> b!180823 (= lt!277484 (BitStream!7653 (buf!4715 (_2!8434 lt!277506)) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))))))

(assert (=> b!180823 (invariant!0 (currentBit!8920 lt!277484) (currentByte!8925 lt!277484) (size!4272 (buf!4715 (_2!8434 lt!277465))))))

(declare-fun lt!277469 () BitStream!7652)

(assert (=> b!180823 (= lt!277469 (BitStream!7653 (buf!4715 (_2!8434 lt!277465)) (currentByte!8925 lt!277484) (currentBit!8920 lt!277484)))))

(assert (=> b!180823 (= lt!277471 (readBitPure!0 lt!277484))))

(assert (=> b!180823 (= lt!277498 (readBitPure!0 lt!277469))))

(declare-fun lt!277488 () Unit!12963)

(assert (=> b!180823 (= lt!277488 (readBitPrefixLemma!0 lt!277484 (_2!8434 lt!277465)))))

(declare-fun res!150157 () Bool)

(assert (=> b!180823 (= res!150157 (= (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!277471))) (currentByte!8925 (_1!8435 lt!277471)) (currentBit!8920 (_1!8435 lt!277471))) (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!277498))) (currentByte!8925 (_1!8435 lt!277498)) (currentBit!8920 (_1!8435 lt!277498)))))))

(assert (=> b!180823 (=> (not res!150157) (not e!125623))))

(assert (=> b!180823 e!125623))

(declare-fun lt!277470 () Unit!12963)

(assert (=> b!180823 (= lt!277470 lt!277488)))

(declare-fun lt!277512 () tuple2!15582)

(assert (=> b!180823 (= lt!277512 (reader!0 (_2!8434 lt!276643) (_2!8434 lt!277465)))))

(declare-fun lt!277510 () tuple2!15582)

(assert (=> b!180823 (= lt!277510 (reader!0 (_2!8434 lt!277506) (_2!8434 lt!277465)))))

(declare-fun lt!277500 () tuple2!15580)

(assert (=> b!180823 (= lt!277500 (readBitPure!0 (_1!8436 lt!277512)))))

(assert (=> b!180823 (= (_2!8435 lt!277500) lt!277486)))

(declare-fun lt!277458 () Unit!12963)

(declare-fun Unit!12991 () Unit!12963)

(assert (=> b!180823 (= lt!277458 Unit!12991)))

(declare-fun lt!277492 () (_ BitVec 64))

(assert (=> b!180823 (= lt!277492 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277499 () (_ BitVec 64))

(assert (=> b!180823 (= lt!277499 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277509 () Unit!12963)

(assert (=> b!180823 (= lt!277509 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8434 lt!276643) (buf!4715 (_2!8434 lt!277465)) lt!277499))))

(assert (=> b!180823 (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!277465)))) ((_ sign_extend 32) (currentByte!8925 (_2!8434 lt!276643))) ((_ sign_extend 32) (currentBit!8920 (_2!8434 lt!276643))) lt!277499)))

(declare-fun lt!277505 () Unit!12963)

(assert (=> b!180823 (= lt!277505 lt!277509)))

(declare-fun lt!277468 () tuple2!15592)

(assert (=> b!180823 (= lt!277468 (readNBitsLSBFirstsLoopPure!0 (_1!8436 lt!277512) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!277492))))

(declare-fun lt!277503 () (_ BitVec 64))

(assert (=> b!180823 (= lt!277503 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!277474 () Unit!12963)

(assert (=> b!180823 (= lt!277474 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8434 lt!277506) (buf!4715 (_2!8434 lt!277465)) lt!277503))))

(assert (=> b!180823 (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!277465)))) ((_ sign_extend 32) (currentByte!8925 (_2!8434 lt!277506))) ((_ sign_extend 32) (currentBit!8920 (_2!8434 lt!277506))) lt!277503)))

(declare-fun lt!277493 () Unit!12963)

(assert (=> b!180823 (= lt!277493 lt!277474)))

(declare-fun lt!277480 () tuple2!15592)

(assert (=> b!180823 (= lt!277480 (readNBitsLSBFirstsLoopPure!0 (_1!8436 lt!277510) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!277492 (ite (_2!8435 lt!277500) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!277466 () tuple2!15592)

(assert (=> b!180823 (= lt!277466 (readNBitsLSBFirstsLoopPure!0 (_1!8436 lt!277512) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!277492))))

(declare-fun c!9331 () Bool)

(assert (=> b!180823 (= c!9331 (_2!8435 (readBitPure!0 (_1!8436 lt!277512))))))

(declare-fun e!125621 () (_ BitVec 64))

(declare-fun lt!277504 () tuple2!15592)

(declare-fun withMovedBitIndex!0 (BitStream!7652 (_ BitVec 64)) BitStream!7652)

(assert (=> b!180823 (= lt!277504 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8436 lt!277512) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!277492 e!125621)))))

(declare-fun lt!277497 () Unit!12963)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12963)

(assert (=> b!180823 (= lt!277497 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8436 lt!277512) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!277492))))

(assert (=> b!180823 (and (= (_2!8441 lt!277466) (_2!8441 lt!277504)) (= (_1!8441 lt!277466) (_1!8441 lt!277504)))))

(declare-fun lt!277479 () Unit!12963)

(assert (=> b!180823 (= lt!277479 lt!277497)))

(assert (=> b!180823 (= (_1!8436 lt!277512) (withMovedBitIndex!0 (_2!8436 lt!277512) (bvsub (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))) (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277465))) (currentByte!8925 (_2!8434 lt!277465)) (currentBit!8920 (_2!8434 lt!277465))))))))

(declare-fun lt!277502 () Unit!12963)

(declare-fun Unit!12992 () Unit!12963)

(assert (=> b!180823 (= lt!277502 Unit!12992)))

(assert (=> b!180823 (= (_1!8436 lt!277510) (withMovedBitIndex!0 (_2!8436 lt!277510) (bvsub (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277506))) (currentByte!8925 (_2!8434 lt!277506)) (currentBit!8920 (_2!8434 lt!277506))) (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277465))) (currentByte!8925 (_2!8434 lt!277465)) (currentBit!8920 (_2!8434 lt!277465))))))))

(declare-fun lt!277507 () Unit!12963)

(declare-fun Unit!12993 () Unit!12963)

(assert (=> b!180823 (= lt!277507 Unit!12993)))

(assert (=> b!180823 (= (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))) (bvsub (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277506))) (currentByte!8925 (_2!8434 lt!277506)) (currentBit!8920 (_2!8434 lt!277506))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!277459 () Unit!12963)

(declare-fun Unit!12994 () Unit!12963)

(assert (=> b!180823 (= lt!277459 Unit!12994)))

(assert (=> b!180823 (= (_2!8441 lt!277468) (_2!8441 lt!277480))))

(declare-fun lt!277475 () Unit!12963)

(declare-fun Unit!12995 () Unit!12963)

(assert (=> b!180823 (= lt!277475 Unit!12995)))

(assert (=> b!180823 (invariant!0 (currentBit!8920 (_2!8434 lt!277465)) (currentByte!8925 (_2!8434 lt!277465)) (size!4272 (buf!4715 (_2!8434 lt!277465))))))

(declare-fun lt!277491 () Unit!12963)

(declare-fun Unit!12996 () Unit!12963)

(assert (=> b!180823 (= lt!277491 Unit!12996)))

(assert (=> b!180823 (= (size!4272 (buf!4715 (_2!8434 lt!276643))) (size!4272 (buf!4715 (_2!8434 lt!277465))))))

(declare-fun lt!277472 () Unit!12963)

(declare-fun Unit!12997 () Unit!12963)

(assert (=> b!180823 (= lt!277472 Unit!12997)))

(assert (=> b!180823 (= (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277465))) (currentByte!8925 (_2!8434 lt!277465)) (currentBit!8920 (_2!8434 lt!277465))) (bvsub (bvadd (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277467 () Unit!12963)

(declare-fun Unit!12998 () Unit!12963)

(assert (=> b!180823 (= lt!277467 Unit!12998)))

(declare-fun lt!277481 () Unit!12963)

(declare-fun Unit!12999 () Unit!12963)

(assert (=> b!180823 (= lt!277481 Unit!12999)))

(declare-fun lt!277483 () tuple2!15582)

(assert (=> b!180823 (= lt!277483 (reader!0 (_2!8434 lt!276643) (_2!8434 lt!277465)))))

(declare-fun lt!277477 () (_ BitVec 64))

(assert (=> b!180823 (= lt!277477 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277496 () Unit!12963)

(assert (=> b!180823 (= lt!277496 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8434 lt!276643) (buf!4715 (_2!8434 lt!277465)) lt!277477))))

(assert (=> b!180823 (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!277465)))) ((_ sign_extend 32) (currentByte!8925 (_2!8434 lt!276643))) ((_ sign_extend 32) (currentBit!8920 (_2!8434 lt!276643))) lt!277477)))

(declare-fun lt!277478 () Unit!12963)

(assert (=> b!180823 (= lt!277478 lt!277496)))

(declare-fun lt!277457 () tuple2!15592)

(assert (=> b!180823 (= lt!277457 (readNBitsLSBFirstsLoopPure!0 (_1!8436 lt!277483) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!150152 () Bool)

(assert (=> b!180823 (= res!150152 (= (_2!8441 lt!277457) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!125622 () Bool)

(assert (=> b!180823 (=> (not res!150152) (not e!125622))))

(assert (=> b!180823 e!125622))

(declare-fun lt!277482 () Unit!12963)

(declare-fun Unit!13000 () Unit!12963)

(assert (=> b!180823 (= lt!277482 Unit!13000)))

(declare-fun b!180824 () Bool)

(declare-fun res!150159 () Bool)

(assert (=> b!180824 (= res!150159 (= (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277460))) (currentByte!8925 (_2!8434 lt!277460)) (currentBit!8920 (_2!8434 lt!277460))) (bvadd (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!180824 (=> (not res!150159) (not e!125616))))

(declare-fun b!180825 () Bool)

(declare-fun res!150154 () Bool)

(assert (=> b!180825 (=> (not res!150154) (not e!125619))))

(assert (=> b!180825 (= res!150154 (isPrefixOf!0 (_2!8434 lt!276643) (_2!8434 lt!277487)))))

(declare-fun b!180826 () Bool)

(assert (=> b!180826 (= e!125621 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun d!62941 () Bool)

(assert (=> d!62941 e!125619))

(declare-fun res!150149 () Bool)

(assert (=> d!62941 (=> (not res!150149) (not e!125619))))

(assert (=> d!62941 (= res!150149 (invariant!0 (currentBit!8920 (_2!8434 lt!277487)) (currentByte!8925 (_2!8434 lt!277487)) (size!4272 (buf!4715 (_2!8434 lt!277487)))))))

(assert (=> d!62941 (= lt!277487 e!125617)))

(declare-fun c!9332 () Bool)

(assert (=> d!62941 (= c!9332 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62941 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62941 (= (appendBitsLSBFirstLoopTR!0 (_2!8434 lt!276643) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!277487)))

(declare-fun b!180827 () Bool)

(assert (=> b!180827 (= e!125620 (= (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!277489))) (currentByte!8925 (_1!8435 lt!277489)) (currentBit!8920 (_1!8435 lt!277489))) (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277460))) (currentByte!8925 (_2!8434 lt!277460)) (currentBit!8920 (_2!8434 lt!277460)))))))

(declare-fun b!180828 () Bool)

(assert (=> b!180828 (= e!125621 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!180829 () Bool)

(assert (=> b!180829 (= e!125622 (= (_1!8441 lt!277457) (_2!8436 lt!277483)))))

(declare-fun b!180830 () Bool)

(declare-fun res!150151 () Bool)

(assert (=> b!180830 (=> (not res!150151) (not e!125619))))

(assert (=> b!180830 (= res!150151 (= (size!4272 (buf!4715 (_2!8434 lt!276643))) (size!4272 (buf!4715 (_2!8434 lt!277487)))))))

(declare-fun bm!2942 () Bool)

(assert (=> bm!2942 (= call!2945 (isPrefixOf!0 (_2!8434 lt!276643) (ite c!9332 (_2!8434 lt!276643) (_2!8434 lt!277460))))))

(declare-fun b!180831 () Bool)

(declare-fun Unit!13001 () Unit!12963)

(assert (=> b!180831 (= e!125617 (tuple2!15579 Unit!13001 (_2!8434 lt!276643)))))

(declare-fun lt!277508 () Unit!12963)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7652) Unit!12963)

(assert (=> b!180831 (= lt!277508 (lemmaIsPrefixRefl!0 (_2!8434 lt!276643)))))

(assert (=> b!180831 call!2945))

(declare-fun lt!277494 () Unit!12963)

(assert (=> b!180831 (= lt!277494 lt!277508)))

(declare-fun b!180832 () Bool)

(declare-fun res!150155 () Bool)

(assert (=> b!180832 (=> (not res!150155) (not e!125619))))

(declare-fun lt!277476 () (_ BitVec 64))

(declare-fun lt!277511 () (_ BitVec 64))

(assert (=> b!180832 (= res!150155 (= (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277487))) (currentByte!8925 (_2!8434 lt!277487)) (currentBit!8920 (_2!8434 lt!277487))) (bvsub lt!277476 lt!277511)))))

(assert (=> b!180832 (or (= (bvand lt!277476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277511 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277476 lt!277511) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180832 (= lt!277511 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!277463 () (_ BitVec 64))

(declare-fun lt!277461 () (_ BitVec 64))

(assert (=> b!180832 (= lt!277476 (bvadd lt!277463 lt!277461))))

(assert (=> b!180832 (or (not (= (bvand lt!277463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277461 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!277463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!277463 lt!277461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180832 (= lt!277461 ((_ sign_extend 32) nBits!348))))

(assert (=> b!180832 (= lt!277463 (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))))))

(declare-fun b!180833 () Bool)

(assert (=> b!180833 (= e!125624 (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276643)))) ((_ sign_extend 32) (currentByte!8925 (_2!8434 lt!276643))) ((_ sign_extend 32) (currentBit!8920 (_2!8434 lt!276643))) lt!277464))))

(assert (= (and d!62941 c!9332) b!180831))

(assert (= (and d!62941 (not c!9332)) b!180823))

(assert (= (and b!180823 res!150150) b!180824))

(assert (= (and b!180824 res!150159) b!180820))

(assert (= (and b!180820 res!150158) b!180818))

(assert (= (and b!180818 res!150153) b!180827))

(assert (= (and b!180823 res!150157) b!180821))

(assert (= (and b!180823 c!9331) b!180826))

(assert (= (and b!180823 (not c!9331)) b!180828))

(assert (= (and b!180823 res!150152) b!180829))

(assert (= (or b!180831 b!180820) bm!2942))

(assert (= (and d!62941 res!150149) b!180830))

(assert (= (and b!180830 res!150151) b!180832))

(assert (= (and b!180832 res!150155) b!180825))

(assert (= (and b!180825 res!150154) b!180819))

(assert (= (and b!180819 res!150160) b!180833))

(assert (= (and b!180819 res!150156) b!180822))

(declare-fun m!281439 () Bool)

(assert (=> b!180833 m!281439))

(declare-fun m!281441 () Bool)

(assert (=> b!180831 m!281441))

(declare-fun m!281443 () Bool)

(assert (=> b!180832 m!281443))

(assert (=> b!180832 m!280951))

(declare-fun m!281445 () Bool)

(assert (=> b!180825 m!281445))

(declare-fun m!281447 () Bool)

(assert (=> b!180823 m!281447))

(declare-fun m!281449 () Bool)

(assert (=> b!180823 m!281449))

(declare-fun m!281451 () Bool)

(assert (=> b!180823 m!281451))

(declare-fun m!281453 () Bool)

(assert (=> b!180823 m!281453))

(declare-fun m!281455 () Bool)

(assert (=> b!180823 m!281455))

(declare-fun m!281457 () Bool)

(assert (=> b!180823 m!281457))

(declare-fun m!281459 () Bool)

(assert (=> b!180823 m!281459))

(declare-fun m!281461 () Bool)

(assert (=> b!180823 m!281461))

(assert (=> b!180823 m!280951))

(declare-fun m!281463 () Bool)

(assert (=> b!180823 m!281463))

(declare-fun m!281465 () Bool)

(assert (=> b!180823 m!281465))

(declare-fun m!281467 () Bool)

(assert (=> b!180823 m!281467))

(declare-fun m!281469 () Bool)

(assert (=> b!180823 m!281469))

(declare-fun m!281471 () Bool)

(assert (=> b!180823 m!281471))

(declare-fun m!281473 () Bool)

(assert (=> b!180823 m!281473))

(declare-fun m!281475 () Bool)

(assert (=> b!180823 m!281475))

(declare-fun m!281477 () Bool)

(assert (=> b!180823 m!281477))

(declare-fun m!281479 () Bool)

(assert (=> b!180823 m!281479))

(declare-fun m!281481 () Bool)

(assert (=> b!180823 m!281481))

(declare-fun m!281483 () Bool)

(assert (=> b!180823 m!281483))

(declare-fun m!281485 () Bool)

(assert (=> b!180823 m!281485))

(declare-fun m!281487 () Bool)

(assert (=> b!180823 m!281487))

(declare-fun m!281489 () Bool)

(assert (=> b!180823 m!281489))

(declare-fun m!281491 () Bool)

(assert (=> b!180823 m!281491))

(declare-fun m!281493 () Bool)

(assert (=> b!180823 m!281493))

(declare-fun m!281495 () Bool)

(assert (=> b!180823 m!281495))

(declare-fun m!281497 () Bool)

(assert (=> b!180823 m!281497))

(declare-fun m!281499 () Bool)

(assert (=> b!180823 m!281499))

(declare-fun m!281501 () Bool)

(assert (=> b!180823 m!281501))

(declare-fun m!281503 () Bool)

(assert (=> b!180823 m!281503))

(declare-fun m!281505 () Bool)

(assert (=> b!180823 m!281505))

(declare-fun m!281507 () Bool)

(assert (=> b!180823 m!281507))

(assert (=> b!180823 m!281495))

(declare-fun m!281509 () Bool)

(assert (=> b!180823 m!281509))

(declare-fun m!281511 () Bool)

(assert (=> b!180823 m!281511))

(declare-fun m!281513 () Bool)

(assert (=> d!62941 m!281513))

(declare-fun m!281515 () Bool)

(assert (=> bm!2942 m!281515))

(declare-fun m!281517 () Bool)

(assert (=> b!180827 m!281517))

(declare-fun m!281519 () Bool)

(assert (=> b!180827 m!281519))

(assert (=> b!180824 m!281519))

(assert (=> b!180824 m!280951))

(declare-fun m!281521 () Bool)

(assert (=> b!180819 m!281521))

(declare-fun m!281523 () Bool)

(assert (=> b!180819 m!281523))

(assert (=> b!180819 m!281459))

(declare-fun m!281525 () Bool)

(assert (=> b!180819 m!281525))

(declare-fun m!281527 () Bool)

(assert (=> b!180819 m!281527))

(assert (=> b!180819 m!281505))

(declare-fun m!281529 () Bool)

(assert (=> b!180818 m!281529))

(assert (=> b!180818 m!281529))

(declare-fun m!281531 () Bool)

(assert (=> b!180818 m!281531))

(assert (=> b!180533 d!62941))

(declare-fun d!62947 () Bool)

(declare-datatypes ((tuple2!15594 0))(
  ( (tuple2!15595 (_1!8442 Bool) (_2!8442 BitStream!7652)) )
))
(declare-fun lt!277515 () tuple2!15594)

(declare-fun readBit!0 (BitStream!7652) tuple2!15594)

(assert (=> d!62947 (= lt!277515 (readBit!0 lt!276658))))

(assert (=> d!62947 (= (readBitPure!0 lt!276658) (tuple2!15581 (_2!8442 lt!277515) (_1!8442 lt!277515)))))

(declare-fun bs!15688 () Bool)

(assert (= bs!15688 d!62947))

(declare-fun m!281533 () Bool)

(assert (=> bs!15688 m!281533))

(assert (=> b!180523 d!62947))

(declare-fun d!62949 () Bool)

(assert (=> d!62949 (= (invariant!0 (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204) (size!4272 (buf!4715 (_2!8434 lt!276643)))) (and (bvsge (currentBit!8920 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8920 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8925 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8925 thiss!1204) (size!4272 (buf!4715 (_2!8434 lt!276643)))) (and (= (currentBit!8920 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8925 thiss!1204) (size!4272 (buf!4715 (_2!8434 lt!276643))))))))))

(assert (=> b!180523 d!62949))

(declare-fun d!62951 () Bool)

(assert (=> d!62951 (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276651)))) ((_ sign_extend 32) (currentByte!8925 thiss!1204)) ((_ sign_extend 32) (currentBit!8920 thiss!1204)) lt!276647)))

(declare-fun lt!277518 () Unit!12963)

(declare-fun choose!9 (BitStream!7652 array!9684 (_ BitVec 64) BitStream!7652) Unit!12963)

(assert (=> d!62951 (= lt!277518 (choose!9 thiss!1204 (buf!4715 (_2!8434 lt!276651)) lt!276647 (BitStream!7653 (buf!4715 (_2!8434 lt!276651)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204))))))

(assert (=> d!62951 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4715 (_2!8434 lt!276651)) lt!276647) lt!277518)))

(declare-fun bs!15689 () Bool)

(assert (= bs!15689 d!62951))

(assert (=> bs!15689 m!280985))

(declare-fun m!281535 () Bool)

(assert (=> bs!15689 m!281535))

(assert (=> b!180523 d!62951))

(declare-fun d!62953 () Bool)

(declare-fun e!125627 () Bool)

(assert (=> d!62953 e!125627))

(declare-fun res!150163 () Bool)

(assert (=> d!62953 (=> (not res!150163) (not e!125627))))

(declare-fun lt!277528 () tuple2!15580)

(declare-fun lt!277529 () tuple2!15580)

(assert (=> d!62953 (= res!150163 (= (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!277528))) (currentByte!8925 (_1!8435 lt!277528)) (currentBit!8920 (_1!8435 lt!277528))) (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!277529))) (currentByte!8925 (_1!8435 lt!277529)) (currentBit!8920 (_1!8435 lt!277529)))))))

(declare-fun lt!277530 () BitStream!7652)

(declare-fun lt!277527 () Unit!12963)

(declare-fun choose!50 (BitStream!7652 BitStream!7652 BitStream!7652 tuple2!15580 tuple2!15580 BitStream!7652 Bool tuple2!15580 tuple2!15580 BitStream!7652 Bool) Unit!12963)

(assert (=> d!62953 (= lt!277527 (choose!50 lt!276658 (_2!8434 lt!276651) lt!277530 lt!277528 (tuple2!15581 (_1!8435 lt!277528) (_2!8435 lt!277528)) (_1!8435 lt!277528) (_2!8435 lt!277528) lt!277529 (tuple2!15581 (_1!8435 lt!277529) (_2!8435 lt!277529)) (_1!8435 lt!277529) (_2!8435 lt!277529)))))

(assert (=> d!62953 (= lt!277529 (readBitPure!0 lt!277530))))

(assert (=> d!62953 (= lt!277528 (readBitPure!0 lt!276658))))

(assert (=> d!62953 (= lt!277530 (BitStream!7653 (buf!4715 (_2!8434 lt!276651)) (currentByte!8925 lt!276658) (currentBit!8920 lt!276658)))))

(assert (=> d!62953 (invariant!0 (currentBit!8920 lt!276658) (currentByte!8925 lt!276658) (size!4272 (buf!4715 (_2!8434 lt!276651))))))

(assert (=> d!62953 (= (readBitPrefixLemma!0 lt!276658 (_2!8434 lt!276651)) lt!277527)))

(declare-fun b!180836 () Bool)

(assert (=> b!180836 (= e!125627 (= (_2!8435 lt!277528) (_2!8435 lt!277529)))))

(assert (= (and d!62953 res!150163) b!180836))

(declare-fun m!281537 () Bool)

(assert (=> d!62953 m!281537))

(assert (=> d!62953 m!280983))

(declare-fun m!281539 () Bool)

(assert (=> d!62953 m!281539))

(declare-fun m!281541 () Bool)

(assert (=> d!62953 m!281541))

(declare-fun m!281543 () Bool)

(assert (=> d!62953 m!281543))

(declare-fun m!281545 () Bool)

(assert (=> d!62953 m!281545))

(assert (=> b!180523 d!62953))

(declare-fun d!62955 () Bool)

(assert (=> d!62955 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8436 lt!276649)))) ((_ sign_extend 32) (currentByte!8925 (_1!8436 lt!276649))) ((_ sign_extend 32) (currentBit!8920 (_1!8436 lt!276649))) lt!276647) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8436 lt!276649)))) ((_ sign_extend 32) (currentByte!8925 (_1!8436 lt!276649))) ((_ sign_extend 32) (currentBit!8920 (_1!8436 lt!276649)))) lt!276647))))

(declare-fun bs!15690 () Bool)

(assert (= bs!15690 d!62955))

(declare-fun m!281547 () Bool)

(assert (=> bs!15690 m!281547))

(assert (=> b!180523 d!62955))

(declare-fun d!62957 () Bool)

(assert (=> d!62957 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276651)))) ((_ sign_extend 32) (currentByte!8925 thiss!1204)) ((_ sign_extend 32) (currentBit!8920 thiss!1204)) lt!276647) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276651)))) ((_ sign_extend 32) (currentByte!8925 thiss!1204)) ((_ sign_extend 32) (currentBit!8920 thiss!1204))) lt!276647))))

(declare-fun bs!15691 () Bool)

(assert (= bs!15691 d!62957))

(declare-fun m!281549 () Bool)

(assert (=> bs!15691 m!281549))

(assert (=> b!180523 d!62957))

(declare-fun d!62959 () Bool)

(declare-fun lt!277531 () tuple2!15594)

(assert (=> d!62959 (= lt!277531 (readBit!0 (BitStream!7653 (buf!4715 (_2!8434 lt!276651)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204))))))

(assert (=> d!62959 (= (readBitPure!0 (BitStream!7653 (buf!4715 (_2!8434 lt!276651)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204))) (tuple2!15581 (_2!8442 lt!277531) (_1!8442 lt!277531)))))

(declare-fun bs!15692 () Bool)

(assert (= bs!15692 d!62959))

(declare-fun m!281551 () Bool)

(assert (=> bs!15692 m!281551))

(assert (=> b!180523 d!62959))

(declare-fun b!180847 () Bool)

(declare-fun e!125632 () Unit!12963)

(declare-fun Unit!13002 () Unit!12963)

(assert (=> b!180847 (= e!125632 Unit!13002)))

(declare-fun b!180848 () Bool)

(declare-fun res!150170 () Bool)

(declare-fun e!125633 () Bool)

(assert (=> b!180848 (=> (not res!150170) (not e!125633))))

(declare-fun lt!277576 () tuple2!15582)

(assert (=> b!180848 (= res!150170 (isPrefixOf!0 (_1!8436 lt!277576) (_2!8434 lt!276643)))))

(declare-fun d!62961 () Bool)

(assert (=> d!62961 e!125633))

(declare-fun res!150172 () Bool)

(assert (=> d!62961 (=> (not res!150172) (not e!125633))))

(assert (=> d!62961 (= res!150172 (isPrefixOf!0 (_1!8436 lt!277576) (_2!8436 lt!277576)))))

(declare-fun lt!277582 () BitStream!7652)

(assert (=> d!62961 (= lt!277576 (tuple2!15583 lt!277582 (_2!8434 lt!276651)))))

(declare-fun lt!277588 () Unit!12963)

(declare-fun lt!277574 () Unit!12963)

(assert (=> d!62961 (= lt!277588 lt!277574)))

(assert (=> d!62961 (isPrefixOf!0 lt!277582 (_2!8434 lt!276651))))

(assert (=> d!62961 (= lt!277574 (lemmaIsPrefixTransitive!0 lt!277582 (_2!8434 lt!276651) (_2!8434 lt!276651)))))

(declare-fun lt!277586 () Unit!12963)

(declare-fun lt!277572 () Unit!12963)

(assert (=> d!62961 (= lt!277586 lt!277572)))

(assert (=> d!62961 (isPrefixOf!0 lt!277582 (_2!8434 lt!276651))))

(assert (=> d!62961 (= lt!277572 (lemmaIsPrefixTransitive!0 lt!277582 (_2!8434 lt!276643) (_2!8434 lt!276651)))))

(declare-fun lt!277580 () Unit!12963)

(assert (=> d!62961 (= lt!277580 e!125632)))

(declare-fun c!9335 () Bool)

(assert (=> d!62961 (= c!9335 (not (= (size!4272 (buf!4715 (_2!8434 lt!276643))) #b00000000000000000000000000000000)))))

(declare-fun lt!277590 () Unit!12963)

(declare-fun lt!277575 () Unit!12963)

(assert (=> d!62961 (= lt!277590 lt!277575)))

(assert (=> d!62961 (isPrefixOf!0 (_2!8434 lt!276651) (_2!8434 lt!276651))))

(assert (=> d!62961 (= lt!277575 (lemmaIsPrefixRefl!0 (_2!8434 lt!276651)))))

(declare-fun lt!277573 () Unit!12963)

(declare-fun lt!277589 () Unit!12963)

(assert (=> d!62961 (= lt!277573 lt!277589)))

(assert (=> d!62961 (= lt!277589 (lemmaIsPrefixRefl!0 (_2!8434 lt!276651)))))

(declare-fun lt!277591 () Unit!12963)

(declare-fun lt!277578 () Unit!12963)

(assert (=> d!62961 (= lt!277591 lt!277578)))

(assert (=> d!62961 (isPrefixOf!0 lt!277582 lt!277582)))

(assert (=> d!62961 (= lt!277578 (lemmaIsPrefixRefl!0 lt!277582))))

(declare-fun lt!277585 () Unit!12963)

(declare-fun lt!277583 () Unit!12963)

(assert (=> d!62961 (= lt!277585 lt!277583)))

(assert (=> d!62961 (isPrefixOf!0 (_2!8434 lt!276643) (_2!8434 lt!276643))))

(assert (=> d!62961 (= lt!277583 (lemmaIsPrefixRefl!0 (_2!8434 lt!276643)))))

(assert (=> d!62961 (= lt!277582 (BitStream!7653 (buf!4715 (_2!8434 lt!276651)) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))))))

(assert (=> d!62961 (isPrefixOf!0 (_2!8434 lt!276643) (_2!8434 lt!276651))))

(assert (=> d!62961 (= (reader!0 (_2!8434 lt!276643) (_2!8434 lt!276651)) lt!277576)))

(declare-fun b!180849 () Bool)

(declare-fun lt!277587 () Unit!12963)

(assert (=> b!180849 (= e!125632 lt!277587)))

(declare-fun lt!277584 () (_ BitVec 64))

(assert (=> b!180849 (= lt!277584 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!277579 () (_ BitVec 64))

(assert (=> b!180849 (= lt!277579 (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9684 array!9684 (_ BitVec 64) (_ BitVec 64)) Unit!12963)

(assert (=> b!180849 (= lt!277587 (arrayBitRangesEqSymmetric!0 (buf!4715 (_2!8434 lt!276643)) (buf!4715 (_2!8434 lt!276651)) lt!277584 lt!277579))))

(assert (=> b!180849 (arrayBitRangesEq!0 (buf!4715 (_2!8434 lt!276651)) (buf!4715 (_2!8434 lt!276643)) lt!277584 lt!277579)))

(declare-fun b!180850 () Bool)

(declare-fun lt!277577 () (_ BitVec 64))

(declare-fun lt!277581 () (_ BitVec 64))

(assert (=> b!180850 (= e!125633 (= (_1!8436 lt!277576) (withMovedBitIndex!0 (_2!8436 lt!277576) (bvsub lt!277577 lt!277581))))))

(assert (=> b!180850 (or (= (bvand lt!277577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277581 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277577 lt!277581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180850 (= lt!277581 (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276651))) (currentByte!8925 (_2!8434 lt!276651)) (currentBit!8920 (_2!8434 lt!276651))))))

(assert (=> b!180850 (= lt!277577 (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))))))

(declare-fun b!180851 () Bool)

(declare-fun res!150171 () Bool)

(assert (=> b!180851 (=> (not res!150171) (not e!125633))))

(assert (=> b!180851 (= res!150171 (isPrefixOf!0 (_2!8436 lt!277576) (_2!8434 lt!276651)))))

(assert (= (and d!62961 c!9335) b!180849))

(assert (= (and d!62961 (not c!9335)) b!180847))

(assert (= (and d!62961 res!150172) b!180848))

(assert (= (and b!180848 res!150170) b!180851))

(assert (= (and b!180851 res!150171) b!180850))

(declare-fun m!281553 () Bool)

(assert (=> d!62961 m!281553))

(declare-fun m!281555 () Bool)

(assert (=> d!62961 m!281555))

(assert (=> d!62961 m!281001))

(declare-fun m!281557 () Bool)

(assert (=> d!62961 m!281557))

(assert (=> d!62961 m!281441))

(declare-fun m!281559 () Bool)

(assert (=> d!62961 m!281559))

(declare-fun m!281561 () Bool)

(assert (=> d!62961 m!281561))

(declare-fun m!281563 () Bool)

(assert (=> d!62961 m!281563))

(declare-fun m!281565 () Bool)

(assert (=> d!62961 m!281565))

(declare-fun m!281567 () Bool)

(assert (=> d!62961 m!281567))

(declare-fun m!281569 () Bool)

(assert (=> d!62961 m!281569))

(declare-fun m!281571 () Bool)

(assert (=> b!180850 m!281571))

(assert (=> b!180850 m!280959))

(assert (=> b!180850 m!280951))

(declare-fun m!281573 () Bool)

(assert (=> b!180851 m!281573))

(assert (=> b!180849 m!280951))

(declare-fun m!281575 () Bool)

(assert (=> b!180849 m!281575))

(declare-fun m!281577 () Bool)

(assert (=> b!180849 m!281577))

(declare-fun m!281579 () Bool)

(assert (=> b!180848 m!281579))

(assert (=> b!180523 d!62961))

(declare-fun d!62963 () Bool)

(declare-fun e!125634 () Bool)

(assert (=> d!62963 e!125634))

(declare-fun res!150173 () Bool)

(assert (=> d!62963 (=> (not res!150173) (not e!125634))))

(declare-fun lt!277597 () (_ BitVec 64))

(declare-fun lt!277596 () (_ BitVec 64))

(declare-fun lt!277593 () (_ BitVec 64))

(assert (=> d!62963 (= res!150173 (= lt!277593 (bvsub lt!277596 lt!277597)))))

(assert (=> d!62963 (or (= (bvand lt!277596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277597 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277596 lt!277597) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62963 (= lt!277597 (remainingBits!0 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8435 lt!276659)))) ((_ sign_extend 32) (currentByte!8925 (_1!8435 lt!276659))) ((_ sign_extend 32) (currentBit!8920 (_1!8435 lt!276659)))))))

(declare-fun lt!277594 () (_ BitVec 64))

(declare-fun lt!277595 () (_ BitVec 64))

(assert (=> d!62963 (= lt!277596 (bvmul lt!277594 lt!277595))))

(assert (=> d!62963 (or (= lt!277594 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277595 (bvsdiv (bvmul lt!277594 lt!277595) lt!277594)))))

(assert (=> d!62963 (= lt!277595 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62963 (= lt!277594 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8435 lt!276659)))))))

(assert (=> d!62963 (= lt!277593 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8925 (_1!8435 lt!276659))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8920 (_1!8435 lt!276659)))))))

(assert (=> d!62963 (invariant!0 (currentBit!8920 (_1!8435 lt!276659)) (currentByte!8925 (_1!8435 lt!276659)) (size!4272 (buf!4715 (_1!8435 lt!276659))))))

(assert (=> d!62963 (= (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!276659))) (currentByte!8925 (_1!8435 lt!276659)) (currentBit!8920 (_1!8435 lt!276659))) lt!277593)))

(declare-fun b!180852 () Bool)

(declare-fun res!150174 () Bool)

(assert (=> b!180852 (=> (not res!150174) (not e!125634))))

(assert (=> b!180852 (= res!150174 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277593))))

(declare-fun b!180853 () Bool)

(declare-fun lt!277592 () (_ BitVec 64))

(assert (=> b!180853 (= e!125634 (bvsle lt!277593 (bvmul lt!277592 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180853 (or (= lt!277592 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277592 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277592)))))

(assert (=> b!180853 (= lt!277592 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8435 lt!276659)))))))

(assert (= (and d!62963 res!150173) b!180852))

(assert (= (and b!180852 res!150174) b!180853))

(declare-fun m!281581 () Bool)

(assert (=> d!62963 m!281581))

(declare-fun m!281583 () Bool)

(assert (=> d!62963 m!281583))

(assert (=> b!180523 d!62963))

(declare-fun d!62965 () Bool)

(declare-fun lt!277598 () tuple2!15594)

(assert (=> d!62965 (= lt!277598 (readBit!0 (_1!8436 lt!276649)))))

(assert (=> d!62965 (= (readBitPure!0 (_1!8436 lt!276649)) (tuple2!15581 (_2!8442 lt!277598) (_1!8442 lt!277598)))))

(declare-fun bs!15693 () Bool)

(assert (= bs!15693 d!62965))

(declare-fun m!281585 () Bool)

(assert (=> bs!15693 m!281585))

(assert (=> b!180523 d!62965))

(declare-fun d!62967 () Bool)

(declare-fun e!125635 () Bool)

(assert (=> d!62967 e!125635))

(declare-fun res!150175 () Bool)

(assert (=> d!62967 (=> (not res!150175) (not e!125635))))

(declare-fun lt!277603 () (_ BitVec 64))

(declare-fun lt!277604 () (_ BitVec 64))

(declare-fun lt!277600 () (_ BitVec 64))

(assert (=> d!62967 (= res!150175 (= lt!277600 (bvsub lt!277603 lt!277604)))))

(assert (=> d!62967 (or (= (bvand lt!277603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277604 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277603 lt!277604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62967 (= lt!277604 (remainingBits!0 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8435 lt!276653)))) ((_ sign_extend 32) (currentByte!8925 (_1!8435 lt!276653))) ((_ sign_extend 32) (currentBit!8920 (_1!8435 lt!276653)))))))

(declare-fun lt!277601 () (_ BitVec 64))

(declare-fun lt!277602 () (_ BitVec 64))

(assert (=> d!62967 (= lt!277603 (bvmul lt!277601 lt!277602))))

(assert (=> d!62967 (or (= lt!277601 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277602 (bvsdiv (bvmul lt!277601 lt!277602) lt!277601)))))

(assert (=> d!62967 (= lt!277602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62967 (= lt!277601 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8435 lt!276653)))))))

(assert (=> d!62967 (= lt!277600 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8925 (_1!8435 lt!276653))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8920 (_1!8435 lt!276653)))))))

(assert (=> d!62967 (invariant!0 (currentBit!8920 (_1!8435 lt!276653)) (currentByte!8925 (_1!8435 lt!276653)) (size!4272 (buf!4715 (_1!8435 lt!276653))))))

(assert (=> d!62967 (= (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!276653))) (currentByte!8925 (_1!8435 lt!276653)) (currentBit!8920 (_1!8435 lt!276653))) lt!277600)))

(declare-fun b!180854 () Bool)

(declare-fun res!150176 () Bool)

(assert (=> b!180854 (=> (not res!150176) (not e!125635))))

(assert (=> b!180854 (= res!150176 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277600))))

(declare-fun b!180855 () Bool)

(declare-fun lt!277599 () (_ BitVec 64))

(assert (=> b!180855 (= e!125635 (bvsle lt!277600 (bvmul lt!277599 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180855 (or (= lt!277599 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277599 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277599)))))

(assert (=> b!180855 (= lt!277599 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8435 lt!276653)))))))

(assert (= (and d!62967 res!150175) b!180854))

(assert (= (and b!180854 res!150176) b!180855))

(declare-fun m!281587 () Bool)

(assert (=> d!62967 m!281587))

(declare-fun m!281589 () Bool)

(assert (=> d!62967 m!281589))

(assert (=> b!180523 d!62967))

(declare-fun b!180856 () Bool)

(declare-fun e!125636 () Unit!12963)

(declare-fun Unit!13003 () Unit!12963)

(assert (=> b!180856 (= e!125636 Unit!13003)))

(declare-fun b!180857 () Bool)

(declare-fun res!150177 () Bool)

(declare-fun e!125637 () Bool)

(assert (=> b!180857 (=> (not res!150177) (not e!125637))))

(declare-fun lt!277609 () tuple2!15582)

(assert (=> b!180857 (= res!150177 (isPrefixOf!0 (_1!8436 lt!277609) thiss!1204))))

(declare-fun d!62969 () Bool)

(assert (=> d!62969 e!125637))

(declare-fun res!150179 () Bool)

(assert (=> d!62969 (=> (not res!150179) (not e!125637))))

(assert (=> d!62969 (= res!150179 (isPrefixOf!0 (_1!8436 lt!277609) (_2!8436 lt!277609)))))

(declare-fun lt!277615 () BitStream!7652)

(assert (=> d!62969 (= lt!277609 (tuple2!15583 lt!277615 (_2!8434 lt!276651)))))

(declare-fun lt!277621 () Unit!12963)

(declare-fun lt!277607 () Unit!12963)

(assert (=> d!62969 (= lt!277621 lt!277607)))

(assert (=> d!62969 (isPrefixOf!0 lt!277615 (_2!8434 lt!276651))))

(assert (=> d!62969 (= lt!277607 (lemmaIsPrefixTransitive!0 lt!277615 (_2!8434 lt!276651) (_2!8434 lt!276651)))))

(declare-fun lt!277619 () Unit!12963)

(declare-fun lt!277605 () Unit!12963)

(assert (=> d!62969 (= lt!277619 lt!277605)))

(assert (=> d!62969 (isPrefixOf!0 lt!277615 (_2!8434 lt!276651))))

(assert (=> d!62969 (= lt!277605 (lemmaIsPrefixTransitive!0 lt!277615 thiss!1204 (_2!8434 lt!276651)))))

(declare-fun lt!277613 () Unit!12963)

(assert (=> d!62969 (= lt!277613 e!125636)))

(declare-fun c!9336 () Bool)

(assert (=> d!62969 (= c!9336 (not (= (size!4272 (buf!4715 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!277623 () Unit!12963)

(declare-fun lt!277608 () Unit!12963)

(assert (=> d!62969 (= lt!277623 lt!277608)))

(assert (=> d!62969 (isPrefixOf!0 (_2!8434 lt!276651) (_2!8434 lt!276651))))

(assert (=> d!62969 (= lt!277608 (lemmaIsPrefixRefl!0 (_2!8434 lt!276651)))))

(declare-fun lt!277606 () Unit!12963)

(declare-fun lt!277622 () Unit!12963)

(assert (=> d!62969 (= lt!277606 lt!277622)))

(assert (=> d!62969 (= lt!277622 (lemmaIsPrefixRefl!0 (_2!8434 lt!276651)))))

(declare-fun lt!277624 () Unit!12963)

(declare-fun lt!277611 () Unit!12963)

(assert (=> d!62969 (= lt!277624 lt!277611)))

(assert (=> d!62969 (isPrefixOf!0 lt!277615 lt!277615)))

(assert (=> d!62969 (= lt!277611 (lemmaIsPrefixRefl!0 lt!277615))))

(declare-fun lt!277618 () Unit!12963)

(declare-fun lt!277616 () Unit!12963)

(assert (=> d!62969 (= lt!277618 lt!277616)))

(assert (=> d!62969 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62969 (= lt!277616 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!62969 (= lt!277615 (BitStream!7653 (buf!4715 (_2!8434 lt!276651)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)))))

(assert (=> d!62969 (isPrefixOf!0 thiss!1204 (_2!8434 lt!276651))))

(assert (=> d!62969 (= (reader!0 thiss!1204 (_2!8434 lt!276651)) lt!277609)))

(declare-fun b!180858 () Bool)

(declare-fun lt!277620 () Unit!12963)

(assert (=> b!180858 (= e!125636 lt!277620)))

(declare-fun lt!277617 () (_ BitVec 64))

(assert (=> b!180858 (= lt!277617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!277612 () (_ BitVec 64))

(assert (=> b!180858 (= lt!277612 (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)))))

(assert (=> b!180858 (= lt!277620 (arrayBitRangesEqSymmetric!0 (buf!4715 thiss!1204) (buf!4715 (_2!8434 lt!276651)) lt!277617 lt!277612))))

(assert (=> b!180858 (arrayBitRangesEq!0 (buf!4715 (_2!8434 lt!276651)) (buf!4715 thiss!1204) lt!277617 lt!277612)))

(declare-fun lt!277610 () (_ BitVec 64))

(declare-fun b!180859 () Bool)

(declare-fun lt!277614 () (_ BitVec 64))

(assert (=> b!180859 (= e!125637 (= (_1!8436 lt!277609) (withMovedBitIndex!0 (_2!8436 lt!277609) (bvsub lt!277610 lt!277614))))))

(assert (=> b!180859 (or (= (bvand lt!277610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277614 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277610 lt!277614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180859 (= lt!277614 (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276651))) (currentByte!8925 (_2!8434 lt!276651)) (currentBit!8920 (_2!8434 lt!276651))))))

(assert (=> b!180859 (= lt!277610 (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)))))

(declare-fun b!180860 () Bool)

(declare-fun res!150178 () Bool)

(assert (=> b!180860 (=> (not res!150178) (not e!125637))))

(assert (=> b!180860 (= res!150178 (isPrefixOf!0 (_2!8436 lt!277609) (_2!8434 lt!276651)))))

(assert (= (and d!62969 c!9336) b!180858))

(assert (= (and d!62969 (not c!9336)) b!180856))

(assert (= (and d!62969 res!150179) b!180857))

(assert (= (and b!180857 res!150177) b!180860))

(assert (= (and b!180860 res!150178) b!180859))

(declare-fun m!281591 () Bool)

(assert (=> d!62969 m!281591))

(declare-fun m!281593 () Bool)

(assert (=> d!62969 m!281593))

(assert (=> d!62969 m!280961))

(declare-fun m!281595 () Bool)

(assert (=> d!62969 m!281595))

(declare-fun m!281597 () Bool)

(assert (=> d!62969 m!281597))

(declare-fun m!281599 () Bool)

(assert (=> d!62969 m!281599))

(declare-fun m!281601 () Bool)

(assert (=> d!62969 m!281601))

(declare-fun m!281603 () Bool)

(assert (=> d!62969 m!281603))

(assert (=> d!62969 m!281565))

(assert (=> d!62969 m!281567))

(declare-fun m!281605 () Bool)

(assert (=> d!62969 m!281605))

(declare-fun m!281607 () Bool)

(assert (=> b!180859 m!281607))

(assert (=> b!180859 m!280959))

(assert (=> b!180859 m!280953))

(declare-fun m!281609 () Bool)

(assert (=> b!180860 m!281609))

(assert (=> b!180858 m!280953))

(declare-fun m!281611 () Bool)

(assert (=> b!180858 m!281611))

(declare-fun m!281613 () Bool)

(assert (=> b!180858 m!281613))

(declare-fun m!281615 () Bool)

(assert (=> b!180857 m!281615))

(assert (=> b!180523 d!62969))

(declare-fun d!62971 () Bool)

(declare-fun res!150180 () Bool)

(declare-fun e!125638 () Bool)

(assert (=> d!62971 (=> (not res!150180) (not e!125638))))

(assert (=> d!62971 (= res!150180 (= (size!4272 (buf!4715 thiss!1204)) (size!4272 (buf!4715 (_2!8434 lt!276643)))))))

(assert (=> d!62971 (= (isPrefixOf!0 thiss!1204 (_2!8434 lt!276643)) e!125638)))

(declare-fun b!180861 () Bool)

(declare-fun res!150181 () Bool)

(assert (=> b!180861 (=> (not res!150181) (not e!125638))))

(assert (=> b!180861 (= res!150181 (bvsle (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)) (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643)))))))

(declare-fun b!180862 () Bool)

(declare-fun e!125639 () Bool)

(assert (=> b!180862 (= e!125638 e!125639)))

(declare-fun res!150182 () Bool)

(assert (=> b!180862 (=> res!150182 e!125639)))

(assert (=> b!180862 (= res!150182 (= (size!4272 (buf!4715 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!180863 () Bool)

(assert (=> b!180863 (= e!125639 (arrayBitRangesEq!0 (buf!4715 thiss!1204) (buf!4715 (_2!8434 lt!276643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204))))))

(assert (= (and d!62971 res!150180) b!180861))

(assert (= (and b!180861 res!150181) b!180862))

(assert (= (and b!180862 (not res!150182)) b!180863))

(assert (=> b!180861 m!280953))

(assert (=> b!180861 m!280951))

(assert (=> b!180863 m!280953))

(assert (=> b!180863 m!280953))

(declare-fun m!281617 () Bool)

(assert (=> b!180863 m!281617))

(assert (=> b!180534 d!62971))

(assert (=> b!180524 d!62971))

(declare-fun d!62973 () Bool)

(declare-fun e!125640 () Bool)

(assert (=> d!62973 e!125640))

(declare-fun res!150183 () Bool)

(assert (=> d!62973 (=> (not res!150183) (not e!125640))))

(declare-fun lt!277629 () (_ BitVec 64))

(declare-fun lt!277626 () (_ BitVec 64))

(declare-fun lt!277630 () (_ BitVec 64))

(assert (=> d!62973 (= res!150183 (= lt!277626 (bvsub lt!277629 lt!277630)))))

(assert (=> d!62973 (or (= (bvand lt!277629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277629 lt!277630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62973 (= lt!277630 (remainingBits!0 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276643)))) ((_ sign_extend 32) (currentByte!8925 (_2!8434 lt!276643))) ((_ sign_extend 32) (currentBit!8920 (_2!8434 lt!276643)))))))

(declare-fun lt!277627 () (_ BitVec 64))

(declare-fun lt!277628 () (_ BitVec 64))

(assert (=> d!62973 (= lt!277629 (bvmul lt!277627 lt!277628))))

(assert (=> d!62973 (or (= lt!277627 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277628 (bvsdiv (bvmul lt!277627 lt!277628) lt!277627)))))

(assert (=> d!62973 (= lt!277628 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62973 (= lt!277627 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276643)))))))

(assert (=> d!62973 (= lt!277626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8925 (_2!8434 lt!276643))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8920 (_2!8434 lt!276643)))))))

(assert (=> d!62973 (invariant!0 (currentBit!8920 (_2!8434 lt!276643)) (currentByte!8925 (_2!8434 lt!276643)) (size!4272 (buf!4715 (_2!8434 lt!276643))))))

(assert (=> d!62973 (= (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))) lt!277626)))

(declare-fun b!180864 () Bool)

(declare-fun res!150184 () Bool)

(assert (=> b!180864 (=> (not res!150184) (not e!125640))))

(assert (=> b!180864 (= res!150184 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277626))))

(declare-fun b!180865 () Bool)

(declare-fun lt!277625 () (_ BitVec 64))

(assert (=> b!180865 (= e!125640 (bvsle lt!277626 (bvmul lt!277625 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180865 (or (= lt!277625 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277625 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277625)))))

(assert (=> b!180865 (= lt!277625 ((_ sign_extend 32) (size!4272 (buf!4715 (_2!8434 lt!276643)))))))

(assert (= (and d!62973 res!150183) b!180864))

(assert (= (and b!180864 res!150184) b!180865))

(declare-fun m!281619 () Bool)

(assert (=> d!62973 m!281619))

(declare-fun m!281621 () Bool)

(assert (=> d!62973 m!281621))

(assert (=> b!180525 d!62973))

(declare-fun d!62975 () Bool)

(declare-fun e!125641 () Bool)

(assert (=> d!62975 e!125641))

(declare-fun res!150185 () Bool)

(assert (=> d!62975 (=> (not res!150185) (not e!125641))))

(declare-fun lt!277635 () (_ BitVec 64))

(declare-fun lt!277636 () (_ BitVec 64))

(declare-fun lt!277632 () (_ BitVec 64))

(assert (=> d!62975 (= res!150185 (= lt!277632 (bvsub lt!277635 lt!277636)))))

(assert (=> d!62975 (or (= (bvand lt!277635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277636 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277635 lt!277636) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62975 (= lt!277636 (remainingBits!0 ((_ sign_extend 32) (size!4272 (buf!4715 thiss!1204))) ((_ sign_extend 32) (currentByte!8925 thiss!1204)) ((_ sign_extend 32) (currentBit!8920 thiss!1204))))))

(declare-fun lt!277633 () (_ BitVec 64))

(declare-fun lt!277634 () (_ BitVec 64))

(assert (=> d!62975 (= lt!277635 (bvmul lt!277633 lt!277634))))

(assert (=> d!62975 (or (= lt!277633 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277634 (bvsdiv (bvmul lt!277633 lt!277634) lt!277633)))))

(assert (=> d!62975 (= lt!277634 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62975 (= lt!277633 ((_ sign_extend 32) (size!4272 (buf!4715 thiss!1204))))))

(assert (=> d!62975 (= lt!277632 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8925 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8920 thiss!1204))))))

(assert (=> d!62975 (invariant!0 (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204) (size!4272 (buf!4715 thiss!1204)))))

(assert (=> d!62975 (= (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)) lt!277632)))

(declare-fun b!180866 () Bool)

(declare-fun res!150186 () Bool)

(assert (=> b!180866 (=> (not res!150186) (not e!125641))))

(assert (=> b!180866 (= res!150186 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277632))))

(declare-fun b!180867 () Bool)

(declare-fun lt!277631 () (_ BitVec 64))

(assert (=> b!180867 (= e!125641 (bvsle lt!277632 (bvmul lt!277631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180867 (or (= lt!277631 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277631 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277631)))))

(assert (=> b!180867 (= lt!277631 ((_ sign_extend 32) (size!4272 (buf!4715 thiss!1204))))))

(assert (= (and d!62975 res!150185) b!180866))

(assert (= (and b!180866 res!150186) b!180867))

(declare-fun m!281623 () Bool)

(assert (=> d!62975 m!281623))

(assert (=> d!62975 m!280967))

(assert (=> b!180525 d!62975))

(declare-fun d!62977 () Bool)

(assert (=> d!62977 (= (invariant!0 (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204) (size!4272 (buf!4715 (_2!8434 lt!276651)))) (and (bvsge (currentBit!8920 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8920 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8925 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8925 thiss!1204) (size!4272 (buf!4715 (_2!8434 lt!276651)))) (and (= (currentBit!8920 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8925 thiss!1204) (size!4272 (buf!4715 (_2!8434 lt!276651))))))))))

(assert (=> b!180526 d!62977))

(declare-fun d!62979 () Bool)

(declare-fun e!125642 () Bool)

(assert (=> d!62979 e!125642))

(declare-fun res!150187 () Bool)

(assert (=> d!62979 (=> (not res!150187) (not e!125642))))

(declare-fun lt!277642 () (_ BitVec 64))

(declare-fun lt!277641 () (_ BitVec 64))

(declare-fun lt!277638 () (_ BitVec 64))

(assert (=> d!62979 (= res!150187 (= lt!277638 (bvsub lt!277641 lt!277642)))))

(assert (=> d!62979 (or (= (bvand lt!277641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277642 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277641 lt!277642) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62979 (= lt!277642 (remainingBits!0 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8435 lt!276644)))) ((_ sign_extend 32) (currentByte!8925 (_1!8435 lt!276644))) ((_ sign_extend 32) (currentBit!8920 (_1!8435 lt!276644)))))))

(declare-fun lt!277639 () (_ BitVec 64))

(declare-fun lt!277640 () (_ BitVec 64))

(assert (=> d!62979 (= lt!277641 (bvmul lt!277639 lt!277640))))

(assert (=> d!62979 (or (= lt!277639 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277640 (bvsdiv (bvmul lt!277639 lt!277640) lt!277639)))))

(assert (=> d!62979 (= lt!277640 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62979 (= lt!277639 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8435 lt!276644)))))))

(assert (=> d!62979 (= lt!277638 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8925 (_1!8435 lt!276644))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8920 (_1!8435 lt!276644)))))))

(assert (=> d!62979 (invariant!0 (currentBit!8920 (_1!8435 lt!276644)) (currentByte!8925 (_1!8435 lt!276644)) (size!4272 (buf!4715 (_1!8435 lt!276644))))))

(assert (=> d!62979 (= (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!276644))) (currentByte!8925 (_1!8435 lt!276644)) (currentBit!8920 (_1!8435 lt!276644))) lt!277638)))

(declare-fun b!180868 () Bool)

(declare-fun res!150188 () Bool)

(assert (=> b!180868 (=> (not res!150188) (not e!125642))))

(assert (=> b!180868 (= res!150188 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277638))))

(declare-fun b!180869 () Bool)

(declare-fun lt!277637 () (_ BitVec 64))

(assert (=> b!180869 (= e!125642 (bvsle lt!277638 (bvmul lt!277637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180869 (or (= lt!277637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277637)))))

(assert (=> b!180869 (= lt!277637 ((_ sign_extend 32) (size!4272 (buf!4715 (_1!8435 lt!276644)))))))

(assert (= (and d!62979 res!150187) b!180868))

(assert (= (and b!180868 res!150188) b!180869))

(declare-fun m!281625 () Bool)

(assert (=> d!62979 m!281625))

(declare-fun m!281627 () Bool)

(assert (=> d!62979 m!281627))

(assert (=> b!180528 d!62979))

(declare-fun d!62981 () Bool)

(assert (=> d!62981 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4272 (buf!4715 thiss!1204))) ((_ sign_extend 32) (currentByte!8925 thiss!1204)) ((_ sign_extend 32) (currentBit!8920 thiss!1204)) lt!276647) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4272 (buf!4715 thiss!1204))) ((_ sign_extend 32) (currentByte!8925 thiss!1204)) ((_ sign_extend 32) (currentBit!8920 thiss!1204))) lt!276647))))

(declare-fun bs!15694 () Bool)

(assert (= bs!15694 d!62981))

(assert (=> bs!15694 m!281623))

(assert (=> b!180529 d!62981))

(declare-fun d!62983 () Bool)

(assert (=> d!62983 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204) (size!4272 (buf!4715 thiss!1204))))))

(declare-fun bs!15695 () Bool)

(assert (= bs!15695 d!62983))

(assert (=> bs!15695 m!280967))

(assert (=> start!39750 d!62983))

(assert (=> b!180519 d!62973))

(assert (=> b!180519 d!62975))

(declare-fun b!180882 () Bool)

(declare-fun e!125647 () Bool)

(declare-fun lt!277654 () tuple2!15580)

(declare-fun lt!277653 () tuple2!15578)

(assert (=> b!180882 (= e!125647 (= (bitIndex!0 (size!4272 (buf!4715 (_1!8435 lt!277654))) (currentByte!8925 (_1!8435 lt!277654)) (currentBit!8920 (_1!8435 lt!277654))) (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277653))) (currentByte!8925 (_2!8434 lt!277653)) (currentBit!8920 (_2!8434 lt!277653)))))))

(declare-fun d!62985 () Bool)

(declare-fun e!125648 () Bool)

(assert (=> d!62985 e!125648))

(declare-fun res!150199 () Bool)

(assert (=> d!62985 (=> (not res!150199) (not e!125648))))

(assert (=> d!62985 (= res!150199 (= (size!4272 (buf!4715 thiss!1204)) (size!4272 (buf!4715 (_2!8434 lt!277653)))))))

(declare-fun choose!16 (BitStream!7652 Bool) tuple2!15578)

(assert (=> d!62985 (= lt!277653 (choose!16 thiss!1204 lt!276655))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62985 (validate_offset_bit!0 ((_ sign_extend 32) (size!4272 (buf!4715 thiss!1204))) ((_ sign_extend 32) (currentByte!8925 thiss!1204)) ((_ sign_extend 32) (currentBit!8920 thiss!1204)))))

(assert (=> d!62985 (= (appendBit!0 thiss!1204 lt!276655) lt!277653)))

(declare-fun b!180881 () Bool)

(assert (=> b!180881 (= e!125648 e!125647)))

(declare-fun res!150200 () Bool)

(assert (=> b!180881 (=> (not res!150200) (not e!125647))))

(assert (=> b!180881 (= res!150200 (and (= (_2!8435 lt!277654) lt!276655) (= (_1!8435 lt!277654) (_2!8434 lt!277653))))))

(assert (=> b!180881 (= lt!277654 (readBitPure!0 (readerFrom!0 (_2!8434 lt!277653) (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204))))))

(declare-fun b!180879 () Bool)

(declare-fun res!150198 () Bool)

(assert (=> b!180879 (=> (not res!150198) (not e!125648))))

(declare-fun lt!277652 () (_ BitVec 64))

(declare-fun lt!277651 () (_ BitVec 64))

(assert (=> b!180879 (= res!150198 (= (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!277653))) (currentByte!8925 (_2!8434 lt!277653)) (currentBit!8920 (_2!8434 lt!277653))) (bvadd lt!277651 lt!277652)))))

(assert (=> b!180879 (or (not (= (bvand lt!277651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277652 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!277651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!277651 lt!277652) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180879 (= lt!277652 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!180879 (= lt!277651 (bitIndex!0 (size!4272 (buf!4715 thiss!1204)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)))))

(declare-fun b!180880 () Bool)

(declare-fun res!150197 () Bool)

(assert (=> b!180880 (=> (not res!150197) (not e!125648))))

(assert (=> b!180880 (= res!150197 (isPrefixOf!0 thiss!1204 (_2!8434 lt!277653)))))

(assert (= (and d!62985 res!150199) b!180879))

(assert (= (and b!180879 res!150198) b!180880))

(assert (= (and b!180880 res!150197) b!180881))

(assert (= (and b!180881 res!150200) b!180882))

(declare-fun m!281629 () Bool)

(assert (=> b!180880 m!281629))

(declare-fun m!281631 () Bool)

(assert (=> b!180881 m!281631))

(assert (=> b!180881 m!281631))

(declare-fun m!281633 () Bool)

(assert (=> b!180881 m!281633))

(declare-fun m!281635 () Bool)

(assert (=> d!62985 m!281635))

(declare-fun m!281637 () Bool)

(assert (=> d!62985 m!281637))

(declare-fun m!281639 () Bool)

(assert (=> b!180882 m!281639))

(declare-fun m!281641 () Bool)

(assert (=> b!180882 m!281641))

(assert (=> b!180879 m!281641))

(assert (=> b!180879 m!280953))

(assert (=> b!180519 d!62985))

(declare-fun d!62987 () Bool)

(assert (=> d!62987 (= (array_inv!4013 (buf!4715 thiss!1204)) (bvsge (size!4272 (buf!4715 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!180530 d!62987))

(declare-fun d!62989 () Bool)

(assert (=> d!62989 (= (invariant!0 (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204) (size!4272 (buf!4715 thiss!1204))) (and (bvsge (currentBit!8920 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8920 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8925 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8925 thiss!1204) (size!4272 (buf!4715 thiss!1204))) (and (= (currentBit!8920 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8925 thiss!1204) (size!4272 (buf!4715 thiss!1204)))))))))

(assert (=> b!180520 d!62989))

(declare-fun d!62991 () Bool)

(declare-fun res!150201 () Bool)

(declare-fun e!125649 () Bool)

(assert (=> d!62991 (=> (not res!150201) (not e!125649))))

(assert (=> d!62991 (= res!150201 (= (size!4272 (buf!4715 (_2!8434 lt!276643))) (size!4272 (buf!4715 (_2!8434 lt!276651)))))))

(assert (=> d!62991 (= (isPrefixOf!0 (_2!8434 lt!276643) (_2!8434 lt!276651)) e!125649)))

(declare-fun b!180883 () Bool)

(declare-fun res!150202 () Bool)

(assert (=> b!180883 (=> (not res!150202) (not e!125649))))

(assert (=> b!180883 (= res!150202 (bvsle (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643))) (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276651))) (currentByte!8925 (_2!8434 lt!276651)) (currentBit!8920 (_2!8434 lt!276651)))))))

(declare-fun b!180884 () Bool)

(declare-fun e!125650 () Bool)

(assert (=> b!180884 (= e!125649 e!125650)))

(declare-fun res!150203 () Bool)

(assert (=> b!180884 (=> res!150203 e!125650)))

(assert (=> b!180884 (= res!150203 (= (size!4272 (buf!4715 (_2!8434 lt!276643))) #b00000000000000000000000000000000))))

(declare-fun b!180885 () Bool)

(assert (=> b!180885 (= e!125650 (arrayBitRangesEq!0 (buf!4715 (_2!8434 lt!276643)) (buf!4715 (_2!8434 lt!276651)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4272 (buf!4715 (_2!8434 lt!276643))) (currentByte!8925 (_2!8434 lt!276643)) (currentBit!8920 (_2!8434 lt!276643)))))))

(assert (= (and d!62991 res!150201) b!180883))

(assert (= (and b!180883 res!150202) b!180884))

(assert (= (and b!180884 (not res!150203)) b!180885))

(assert (=> b!180883 m!280951))

(assert (=> b!180883 m!280959))

(assert (=> b!180885 m!280951))

(assert (=> b!180885 m!280951))

(declare-fun m!281643 () Bool)

(assert (=> b!180885 m!281643))

(assert (=> b!180531 d!62991))

(declare-fun d!62993 () Bool)

(declare-fun lt!277655 () tuple2!15594)

(assert (=> d!62993 (= lt!277655 (readBit!0 (readerFrom!0 (_2!8434 lt!276643) (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204))))))

(assert (=> d!62993 (= (readBitPure!0 (readerFrom!0 (_2!8434 lt!276643) (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204))) (tuple2!15581 (_2!8442 lt!277655) (_1!8442 lt!277655)))))

(declare-fun bs!15696 () Bool)

(assert (= bs!15696 d!62993))

(assert (=> bs!15696 m!280973))

(declare-fun m!281645 () Bool)

(assert (=> bs!15696 m!281645))

(assert (=> b!180521 d!62993))

(declare-fun d!62995 () Bool)

(declare-fun e!125653 () Bool)

(assert (=> d!62995 e!125653))

(declare-fun res!150207 () Bool)

(assert (=> d!62995 (=> (not res!150207) (not e!125653))))

(assert (=> d!62995 (= res!150207 (invariant!0 (currentBit!8920 (_2!8434 lt!276643)) (currentByte!8925 (_2!8434 lt!276643)) (size!4272 (buf!4715 (_2!8434 lt!276643)))))))

(assert (=> d!62995 (= (readerFrom!0 (_2!8434 lt!276643) (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204)) (BitStream!7653 (buf!4715 (_2!8434 lt!276643)) (currentByte!8925 thiss!1204) (currentBit!8920 thiss!1204)))))

(declare-fun b!180888 () Bool)

(assert (=> b!180888 (= e!125653 (invariant!0 (currentBit!8920 thiss!1204) (currentByte!8925 thiss!1204) (size!4272 (buf!4715 (_2!8434 lt!276643)))))))

(assert (= (and d!62995 res!150207) b!180888))

(assert (=> d!62995 m!281621))

(assert (=> b!180888 m!280999))

(assert (=> b!180521 d!62995))

(push 1)

(assert (not d!62947))

(assert (not b!180819))

(assert (not d!62965))

(assert (not b!180888))

(assert (not b!180831))

(assert (not b!180882))

(assert (not b!180850))

(assert (not bm!2942))

(assert (not d!62955))

(assert (not b!180857))

(assert (not b!180684))

(assert (not b!180686))

(assert (not d!62983))

(assert (not b!180832))

(assert (not d!62961))

(assert (not d!62969))

(assert (not b!180861))

(assert (not d!62981))

(assert (not d!62985))

(assert (not d!62951))

(assert (not b!180881))

(assert (not d!62957))

(assert (not d!62993))

(assert (not b!180858))

(assert (not d!62953))

(assert (not d!62939))

(assert (not b!180879))

(assert (not b!180827))

(assert (not b!180885))

(assert (not b!180823))

(assert (not d!62967))

(assert (not d!62963))

(assert (not d!62979))

(assert (not b!180825))

(assert (not b!180860))

(assert (not b!180859))

(assert (not b!180849))

(assert (not d!62975))

(assert (not b!180824))

(assert (not d!62973))

(assert (not b!180851))

(assert (not d!62935))

(assert (not b!180880))

(assert (not b!180883))

(assert (not d!62995))

(assert (not b!180818))

(assert (not d!62941))

(assert (not b!180848))

(assert (not b!180863))

(assert (not d!62959))

(assert (not b!180833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

