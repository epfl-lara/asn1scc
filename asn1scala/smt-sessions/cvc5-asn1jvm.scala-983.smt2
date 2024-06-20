; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27486 () Bool)

(assert start!27486)

(declare-fun res!118206 () Bool)

(declare-fun e!94399 () Bool)

(assert (=> start!27486 (=> (not res!118206) (not e!94399))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6501 0))(
  ( (array!6502 (arr!3651 (Array (_ BitVec 32) (_ BitVec 8))) (size!2944 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6501)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27486 (= res!118206 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2944 arr!237))))))

(assert (=> start!27486 e!94399))

(assert (=> start!27486 true))

(declare-fun array_inv!2733 (array!6501) Bool)

(assert (=> start!27486 (array_inv!2733 arr!237)))

(declare-datatypes ((BitStream!5146 0))(
  ( (BitStream!5147 (buf!3365 array!6501) (currentByte!6225 (_ BitVec 32)) (currentBit!6220 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5146)

(declare-fun e!94397 () Bool)

(declare-fun inv!12 (BitStream!5146) Bool)

(assert (=> start!27486 (and (inv!12 thiss!1634) e!94397)))

(declare-fun b!141683 () Bool)

(declare-fun res!118213 () Bool)

(assert (=> b!141683 (=> (not res!118213) (not e!94399))))

(assert (=> b!141683 (= res!118213 (bvslt from!447 to!404))))

(declare-fun b!141684 () Bool)

(declare-fun e!94396 () Bool)

(declare-fun e!94395 () Bool)

(assert (=> b!141684 (= e!94396 e!94395)))

(declare-fun res!118210 () Bool)

(assert (=> b!141684 (=> (not res!118210) (not e!94395))))

(declare-datatypes ((Unit!8870 0))(
  ( (Unit!8871) )
))
(declare-datatypes ((tuple2!12568 0))(
  ( (tuple2!12569 (_1!6614 Unit!8870) (_2!6614 BitStream!5146)) )
))
(declare-fun lt!219720 () tuple2!12568)

(declare-fun lt!219719 () tuple2!12568)

(declare-fun lt!219727 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141684 (= res!118210 (= (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219720))) (currentByte!6225 (_2!6614 lt!219720)) (currentBit!6220 (_2!6614 lt!219720))) (bvadd (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219727))))))

(assert (=> b!141684 (= lt!219727 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141685 () Bool)

(declare-fun e!94393 () Bool)

(assert (=> b!141685 (= e!94395 (not e!94393))))

(declare-fun res!118208 () Bool)

(assert (=> b!141685 (=> res!118208 e!94393)))

(declare-datatypes ((tuple2!12570 0))(
  ( (tuple2!12571 (_1!6615 BitStream!5146) (_2!6615 array!6501)) )
))
(declare-fun lt!219722 () tuple2!12570)

(declare-datatypes ((tuple2!12572 0))(
  ( (tuple2!12573 (_1!6616 BitStream!5146) (_2!6616 BitStream!5146)) )
))
(declare-fun lt!219723 () tuple2!12572)

(assert (=> b!141685 (= res!118208 (or (not (= (size!2944 (_2!6615 lt!219722)) (size!2944 arr!237))) (not (= (_1!6615 lt!219722) (_2!6616 lt!219723)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5146 array!6501 (_ BitVec 32) (_ BitVec 32)) tuple2!12570)

(assert (=> b!141685 (= lt!219722 (readByteArrayLoopPure!0 (_1!6616 lt!219723) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141685 (validate_offset_bits!1 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219720)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719))) lt!219727)))

(declare-fun lt!219725 () Unit!8870)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5146 array!6501 (_ BitVec 64)) Unit!8870)

(assert (=> b!141685 (= lt!219725 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6614 lt!219719) (buf!3365 (_2!6614 lt!219720)) lt!219727))))

(declare-fun reader!0 (BitStream!5146 BitStream!5146) tuple2!12572)

(assert (=> b!141685 (= lt!219723 (reader!0 (_2!6614 lt!219719) (_2!6614 lt!219720)))))

(declare-fun b!141686 () Bool)

(declare-fun res!118209 () Bool)

(declare-fun e!94394 () Bool)

(assert (=> b!141686 (=> (not res!118209) (not e!94394))))

(assert (=> b!141686 (= res!118209 (= (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2944 (buf!3365 thiss!1634)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634)))))))

(declare-fun b!141687 () Bool)

(declare-fun res!118211 () Bool)

(assert (=> b!141687 (=> (not res!118211) (not e!94395))))

(declare-fun isPrefixOf!0 (BitStream!5146 BitStream!5146) Bool)

(assert (=> b!141687 (= res!118211 (isPrefixOf!0 (_2!6614 lt!219719) (_2!6614 lt!219720)))))

(declare-fun b!141688 () Bool)

(declare-fun arrayRangesEq!260 (array!6501 array!6501 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141688 (= e!94393 (not (arrayRangesEq!260 arr!237 (_2!6615 lt!219722) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141689 () Bool)

(assert (=> b!141689 (= e!94399 (not (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719))))))))))

(declare-fun e!94398 () Bool)

(assert (=> b!141689 e!94398))

(declare-fun res!118205 () Bool)

(assert (=> b!141689 (=> (not res!118205) (not e!94398))))

(assert (=> b!141689 (= res!118205 (isPrefixOf!0 thiss!1634 (_2!6614 lt!219720)))))

(declare-fun lt!219726 () Unit!8870)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5146 BitStream!5146 BitStream!5146) Unit!8870)

(assert (=> b!141689 (= lt!219726 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6614 lt!219719) (_2!6614 lt!219720)))))

(assert (=> b!141689 e!94396))

(declare-fun res!118204 () Bool)

(assert (=> b!141689 (=> (not res!118204) (not e!94396))))

(assert (=> b!141689 (= res!118204 (= (size!2944 (buf!3365 (_2!6614 lt!219719))) (size!2944 (buf!3365 (_2!6614 lt!219720)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5146 array!6501 (_ BitVec 32) (_ BitVec 32)) tuple2!12568)

(assert (=> b!141689 (= lt!219720 (appendByteArrayLoop!0 (_2!6614 lt!219719) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141689 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219721 () Unit!8870)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5146 BitStream!5146 (_ BitVec 64) (_ BitVec 32)) Unit!8870)

(assert (=> b!141689 (= lt!219721 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6614 lt!219719) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141689 e!94394))

(declare-fun res!118203 () Bool)

(assert (=> b!141689 (=> (not res!118203) (not e!94394))))

(assert (=> b!141689 (= res!118203 (= (size!2944 (buf!3365 thiss!1634)) (size!2944 (buf!3365 (_2!6614 lt!219719)))))))

(declare-fun appendByte!0 (BitStream!5146 (_ BitVec 8)) tuple2!12568)

(assert (=> b!141689 (= lt!219719 (appendByte!0 thiss!1634 (select (arr!3651 arr!237) from!447)))))

(declare-fun b!141690 () Bool)

(declare-fun res!118212 () Bool)

(assert (=> b!141690 (=> (not res!118212) (not e!94394))))

(assert (=> b!141690 (= res!118212 (isPrefixOf!0 thiss!1634 (_2!6614 lt!219719)))))

(declare-fun b!141691 () Bool)

(declare-fun res!118202 () Bool)

(assert (=> b!141691 (=> (not res!118202) (not e!94399))))

(assert (=> b!141691 (= res!118202 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2944 (buf!3365 thiss!1634))) ((_ sign_extend 32) (currentByte!6225 thiss!1634)) ((_ sign_extend 32) (currentBit!6220 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141692 () Bool)

(declare-fun res!118207 () Bool)

(assert (=> b!141692 (=> (not res!118207) (not e!94399))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141692 (= res!118207 (invariant!0 (currentBit!6220 thiss!1634) (currentByte!6225 thiss!1634) (size!2944 (buf!3365 thiss!1634))))))

(declare-fun b!141693 () Bool)

(assert (=> b!141693 (= e!94397 (array_inv!2733 (buf!3365 thiss!1634)))))

(declare-fun b!141694 () Bool)

(assert (=> b!141694 (= e!94398 (invariant!0 (currentBit!6220 thiss!1634) (currentByte!6225 thiss!1634) (size!2944 (buf!3365 (_2!6614 lt!219719)))))))

(declare-fun b!141695 () Bool)

(declare-fun lt!219724 () tuple2!12572)

(declare-datatypes ((tuple2!12574 0))(
  ( (tuple2!12575 (_1!6617 BitStream!5146) (_2!6617 (_ BitVec 8))) )
))
(declare-fun lt!219728 () tuple2!12574)

(assert (=> b!141695 (= e!94394 (and (= (_2!6617 lt!219728) (select (arr!3651 arr!237) from!447)) (= (_1!6617 lt!219728) (_2!6616 lt!219724))))))

(declare-fun readBytePure!0 (BitStream!5146) tuple2!12574)

(assert (=> b!141695 (= lt!219728 (readBytePure!0 (_1!6616 lt!219724)))))

(assert (=> b!141695 (= lt!219724 (reader!0 thiss!1634 (_2!6614 lt!219719)))))

(assert (= (and start!27486 res!118206) b!141691))

(assert (= (and b!141691 res!118202) b!141683))

(assert (= (and b!141683 res!118213) b!141692))

(assert (= (and b!141692 res!118207) b!141689))

(assert (= (and b!141689 res!118203) b!141686))

(assert (= (and b!141686 res!118209) b!141690))

(assert (= (and b!141690 res!118212) b!141695))

(assert (= (and b!141689 res!118204) b!141684))

(assert (= (and b!141684 res!118210) b!141687))

(assert (= (and b!141687 res!118211) b!141685))

(assert (= (and b!141685 (not res!118208)) b!141688))

(assert (= (and b!141689 res!118205) b!141694))

(assert (= start!27486 b!141693))

(declare-fun m!217631 () Bool)

(assert (=> b!141690 m!217631))

(declare-fun m!217633 () Bool)

(assert (=> b!141686 m!217633))

(declare-fun m!217635 () Bool)

(assert (=> b!141686 m!217635))

(declare-fun m!217637 () Bool)

(assert (=> b!141693 m!217637))

(declare-fun m!217639 () Bool)

(assert (=> b!141689 m!217639))

(declare-fun m!217641 () Bool)

(assert (=> b!141689 m!217641))

(declare-fun m!217643 () Bool)

(assert (=> b!141689 m!217643))

(declare-fun m!217645 () Bool)

(assert (=> b!141689 m!217645))

(declare-fun m!217647 () Bool)

(assert (=> b!141689 m!217647))

(declare-fun m!217649 () Bool)

(assert (=> b!141689 m!217649))

(declare-fun m!217651 () Bool)

(assert (=> b!141689 m!217651))

(declare-fun m!217653 () Bool)

(assert (=> b!141689 m!217653))

(assert (=> b!141689 m!217649))

(declare-fun m!217655 () Bool)

(assert (=> start!27486 m!217655))

(declare-fun m!217657 () Bool)

(assert (=> start!27486 m!217657))

(declare-fun m!217659 () Bool)

(assert (=> b!141692 m!217659))

(declare-fun m!217661 () Bool)

(assert (=> b!141694 m!217661))

(declare-fun m!217663 () Bool)

(assert (=> b!141684 m!217663))

(assert (=> b!141684 m!217633))

(declare-fun m!217665 () Bool)

(assert (=> b!141691 m!217665))

(declare-fun m!217667 () Bool)

(assert (=> b!141687 m!217667))

(assert (=> b!141695 m!217649))

(declare-fun m!217669 () Bool)

(assert (=> b!141695 m!217669))

(declare-fun m!217671 () Bool)

(assert (=> b!141695 m!217671))

(declare-fun m!217673 () Bool)

(assert (=> b!141685 m!217673))

(declare-fun m!217675 () Bool)

(assert (=> b!141685 m!217675))

(declare-fun m!217677 () Bool)

(assert (=> b!141685 m!217677))

(declare-fun m!217679 () Bool)

(assert (=> b!141685 m!217679))

(declare-fun m!217681 () Bool)

(assert (=> b!141688 m!217681))

(push 1)

(assert (not b!141695))

(assert (not b!141693))

(assert (not b!141687))

(assert (not b!141685))

(assert (not b!141692))

(assert (not b!141689))

(assert (not start!27486))

(assert (not b!141690))

(assert (not b!141691))

(assert (not b!141684))

(assert (not b!141694))

(assert (not b!141688))

(assert (not b!141686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45436 () Bool)

(assert (=> d!45436 (= (invariant!0 (currentBit!6220 thiss!1634) (currentByte!6225 thiss!1634) (size!2944 (buf!3365 thiss!1634))) (and (bvsge (currentBit!6220 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6220 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6225 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6225 thiss!1634) (size!2944 (buf!3365 thiss!1634))) (and (= (currentBit!6220 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6225 thiss!1634) (size!2944 (buf!3365 thiss!1634)))))))))

(assert (=> b!141692 d!45436))

(declare-fun d!45442 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45442 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2944 (buf!3365 thiss!1634))) ((_ sign_extend 32) (currentByte!6225 thiss!1634)) ((_ sign_extend 32) (currentBit!6220 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2944 (buf!3365 thiss!1634))) ((_ sign_extend 32) (currentByte!6225 thiss!1634)) ((_ sign_extend 32) (currentBit!6220 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11169 () Bool)

(assert (= bs!11169 d!45442))

(declare-fun m!217883 () Bool)

(assert (=> bs!11169 m!217883))

(assert (=> b!141691 d!45442))

(declare-fun d!45444 () Bool)

(assert (=> d!45444 (= (array_inv!2733 arr!237) (bvsge (size!2944 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27486 d!45444))

(declare-fun d!45446 () Bool)

(assert (=> d!45446 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6220 thiss!1634) (currentByte!6225 thiss!1634) (size!2944 (buf!3365 thiss!1634))))))

(declare-fun bs!11172 () Bool)

(assert (= bs!11172 d!45446))

(assert (=> bs!11172 m!217659))

(assert (=> start!27486 d!45446))

(declare-fun d!45452 () Bool)

(declare-fun res!118343 () Bool)

(declare-fun e!94493 () Bool)

(assert (=> d!45452 (=> (not res!118343) (not e!94493))))

(assert (=> d!45452 (= res!118343 (= (size!2944 (buf!3365 thiss!1634)) (size!2944 (buf!3365 (_2!6614 lt!219719)))))))

(assert (=> d!45452 (= (isPrefixOf!0 thiss!1634 (_2!6614 lt!219719)) e!94493)))

(declare-fun b!141838 () Bool)

(declare-fun res!118344 () Bool)

(assert (=> b!141838 (=> (not res!118344) (not e!94493))))

(assert (=> b!141838 (= res!118344 (bvsle (bitIndex!0 (size!2944 (buf!3365 thiss!1634)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634)) (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719)))))))

(declare-fun b!141839 () Bool)

(declare-fun e!94492 () Bool)

(assert (=> b!141839 (= e!94493 e!94492)))

(declare-fun res!118342 () Bool)

(assert (=> b!141839 (=> res!118342 e!94492)))

(assert (=> b!141839 (= res!118342 (= (size!2944 (buf!3365 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!141840 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6501 array!6501 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141840 (= e!94492 (arrayBitRangesEq!0 (buf!3365 thiss!1634) (buf!3365 (_2!6614 lt!219719)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2944 (buf!3365 thiss!1634)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634))))))

(assert (= (and d!45452 res!118343) b!141838))

(assert (= (and b!141838 res!118344) b!141839))

(assert (= (and b!141839 (not res!118342)) b!141840))

(assert (=> b!141838 m!217635))

(assert (=> b!141838 m!217633))

(assert (=> b!141840 m!217635))

(assert (=> b!141840 m!217635))

(declare-fun m!217891 () Bool)

(assert (=> b!141840 m!217891))

(assert (=> b!141690 d!45452))

(declare-fun d!45456 () Bool)

(declare-datatypes ((tuple2!12594 0))(
  ( (tuple2!12595 (_1!6629 (_ BitVec 8)) (_2!6629 BitStream!5146)) )
))
(declare-fun lt!219949 () tuple2!12594)

(declare-fun readByte!0 (BitStream!5146) tuple2!12594)

(assert (=> d!45456 (= lt!219949 (readByte!0 (_1!6616 lt!219724)))))

(assert (=> d!45456 (= (readBytePure!0 (_1!6616 lt!219724)) (tuple2!12575 (_2!6629 lt!219949) (_1!6629 lt!219949)))))

(declare-fun bs!11174 () Bool)

(assert (= bs!11174 d!45456))

(declare-fun m!217893 () Bool)

(assert (=> bs!11174 m!217893))

(assert (=> b!141695 d!45456))

(declare-fun b!141903 () Bool)

(declare-fun e!94528 () Unit!8870)

(declare-fun lt!220111 () Unit!8870)

(assert (=> b!141903 (= e!94528 lt!220111)))

(declare-fun lt!220115 () (_ BitVec 64))

(assert (=> b!141903 (= lt!220115 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!220116 () (_ BitVec 64))

(assert (=> b!141903 (= lt!220116 (bitIndex!0 (size!2944 (buf!3365 thiss!1634)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6501 array!6501 (_ BitVec 64) (_ BitVec 64)) Unit!8870)

(assert (=> b!141903 (= lt!220111 (arrayBitRangesEqSymmetric!0 (buf!3365 thiss!1634) (buf!3365 (_2!6614 lt!219719)) lt!220115 lt!220116))))

(assert (=> b!141903 (arrayBitRangesEq!0 (buf!3365 (_2!6614 lt!219719)) (buf!3365 thiss!1634) lt!220115 lt!220116)))

(declare-fun b!141904 () Bool)

(declare-fun res!118396 () Bool)

(declare-fun e!94530 () Bool)

(assert (=> b!141904 (=> (not res!118396) (not e!94530))))

(declare-fun lt!220125 () tuple2!12572)

(assert (=> b!141904 (= res!118396 (isPrefixOf!0 (_1!6616 lt!220125) thiss!1634))))

(declare-fun b!141905 () Bool)

(declare-fun lt!220114 () (_ BitVec 64))

(declare-fun lt!220126 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5146 (_ BitVec 64)) BitStream!5146)

(assert (=> b!141905 (= e!94530 (= (_1!6616 lt!220125) (withMovedBitIndex!0 (_2!6616 lt!220125) (bvsub lt!220114 lt!220126))))))

(assert (=> b!141905 (or (= (bvand lt!220114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220114 lt!220126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141905 (= lt!220126 (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719))))))

(assert (=> b!141905 (= lt!220114 (bitIndex!0 (size!2944 (buf!3365 thiss!1634)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634)))))

(declare-fun b!141906 () Bool)

(declare-fun Unit!8879 () Unit!8870)

(assert (=> b!141906 (= e!94528 Unit!8879)))

(declare-fun d!45458 () Bool)

(assert (=> d!45458 e!94530))

(declare-fun res!118399 () Bool)

(assert (=> d!45458 (=> (not res!118399) (not e!94530))))

(assert (=> d!45458 (= res!118399 (isPrefixOf!0 (_1!6616 lt!220125) (_2!6616 lt!220125)))))

(declare-fun lt!220105 () BitStream!5146)

(assert (=> d!45458 (= lt!220125 (tuple2!12573 lt!220105 (_2!6614 lt!219719)))))

(declare-fun lt!220124 () Unit!8870)

(declare-fun lt!220119 () Unit!8870)

(assert (=> d!45458 (= lt!220124 lt!220119)))

(assert (=> d!45458 (isPrefixOf!0 lt!220105 (_2!6614 lt!219719))))

(assert (=> d!45458 (= lt!220119 (lemmaIsPrefixTransitive!0 lt!220105 (_2!6614 lt!219719) (_2!6614 lt!219719)))))

(declare-fun lt!220103 () Unit!8870)

(declare-fun lt!220101 () Unit!8870)

(assert (=> d!45458 (= lt!220103 lt!220101)))

(assert (=> d!45458 (isPrefixOf!0 lt!220105 (_2!6614 lt!219719))))

(assert (=> d!45458 (= lt!220101 (lemmaIsPrefixTransitive!0 lt!220105 thiss!1634 (_2!6614 lt!219719)))))

(declare-fun lt!220109 () Unit!8870)

(assert (=> d!45458 (= lt!220109 e!94528)))

(declare-fun c!7809 () Bool)

(assert (=> d!45458 (= c!7809 (not (= (size!2944 (buf!3365 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!220120 () Unit!8870)

(declare-fun lt!220113 () Unit!8870)

(assert (=> d!45458 (= lt!220120 lt!220113)))

(assert (=> d!45458 (isPrefixOf!0 (_2!6614 lt!219719) (_2!6614 lt!219719))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5146) Unit!8870)

(assert (=> d!45458 (= lt!220113 (lemmaIsPrefixRefl!0 (_2!6614 lt!219719)))))

(declare-fun lt!220118 () Unit!8870)

(declare-fun lt!220123 () Unit!8870)

(assert (=> d!45458 (= lt!220118 lt!220123)))

(assert (=> d!45458 (= lt!220123 (lemmaIsPrefixRefl!0 (_2!6614 lt!219719)))))

(declare-fun lt!220122 () Unit!8870)

(declare-fun lt!220117 () Unit!8870)

(assert (=> d!45458 (= lt!220122 lt!220117)))

(assert (=> d!45458 (isPrefixOf!0 lt!220105 lt!220105)))

(assert (=> d!45458 (= lt!220117 (lemmaIsPrefixRefl!0 lt!220105))))

(declare-fun lt!220121 () Unit!8870)

(declare-fun lt!220107 () Unit!8870)

(assert (=> d!45458 (= lt!220121 lt!220107)))

(assert (=> d!45458 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45458 (= lt!220107 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45458 (= lt!220105 (BitStream!5147 (buf!3365 (_2!6614 lt!219719)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634)))))

(assert (=> d!45458 (isPrefixOf!0 thiss!1634 (_2!6614 lt!219719))))

(assert (=> d!45458 (= (reader!0 thiss!1634 (_2!6614 lt!219719)) lt!220125)))

(declare-fun b!141907 () Bool)

(declare-fun res!118395 () Bool)

(assert (=> b!141907 (=> (not res!118395) (not e!94530))))

(assert (=> b!141907 (= res!118395 (isPrefixOf!0 (_2!6616 lt!220125) (_2!6614 lt!219719)))))

(assert (= (and d!45458 c!7809) b!141903))

(assert (= (and d!45458 (not c!7809)) b!141906))

(assert (= (and d!45458 res!118399) b!141904))

(assert (= (and b!141904 res!118396) b!141907))

(assert (= (and b!141907 res!118395) b!141905))

(declare-fun m!217961 () Bool)

(assert (=> b!141904 m!217961))

(declare-fun m!217963 () Bool)

(assert (=> b!141905 m!217963))

(assert (=> b!141905 m!217633))

(assert (=> b!141905 m!217635))

(assert (=> b!141903 m!217635))

(declare-fun m!217965 () Bool)

(assert (=> b!141903 m!217965))

(declare-fun m!217967 () Bool)

(assert (=> b!141903 m!217967))

(assert (=> d!45458 m!217631))

(declare-fun m!217969 () Bool)

(assert (=> d!45458 m!217969))

(declare-fun m!217971 () Bool)

(assert (=> d!45458 m!217971))

(declare-fun m!217973 () Bool)

(assert (=> d!45458 m!217973))

(declare-fun m!217975 () Bool)

(assert (=> d!45458 m!217975))

(declare-fun m!217977 () Bool)

(assert (=> d!45458 m!217977))

(declare-fun m!217979 () Bool)

(assert (=> d!45458 m!217979))

(declare-fun m!217981 () Bool)

(assert (=> d!45458 m!217981))

(declare-fun m!217983 () Bool)

(assert (=> d!45458 m!217983))

(declare-fun m!217985 () Bool)

(assert (=> d!45458 m!217985))

(declare-fun m!217987 () Bool)

(assert (=> d!45458 m!217987))

(declare-fun m!217989 () Bool)

(assert (=> b!141907 m!217989))

(assert (=> b!141695 d!45458))

(declare-fun d!45488 () Bool)

(declare-fun e!94535 () Bool)

(assert (=> d!45488 e!94535))

(declare-fun res!118408 () Bool)

(assert (=> d!45488 (=> (not res!118408) (not e!94535))))

(declare-fun lt!220144 () (_ BitVec 64))

(declare-fun lt!220141 () (_ BitVec 64))

(declare-fun lt!220143 () (_ BitVec 64))

(assert (=> d!45488 (= res!118408 (= lt!220144 (bvsub lt!220143 lt!220141)))))

(assert (=> d!45488 (or (= (bvand lt!220143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220141 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220143 lt!220141) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45488 (= lt!220141 (remainingBits!0 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219720)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219720))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219720)))))))

(declare-fun lt!220139 () (_ BitVec 64))

(declare-fun lt!220142 () (_ BitVec 64))

(assert (=> d!45488 (= lt!220143 (bvmul lt!220139 lt!220142))))

(assert (=> d!45488 (or (= lt!220139 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220142 (bvsdiv (bvmul lt!220139 lt!220142) lt!220139)))))

(assert (=> d!45488 (= lt!220142 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45488 (= lt!220139 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219720)))))))

(assert (=> d!45488 (= lt!220144 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219720))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219720)))))))

(assert (=> d!45488 (invariant!0 (currentBit!6220 (_2!6614 lt!219720)) (currentByte!6225 (_2!6614 lt!219720)) (size!2944 (buf!3365 (_2!6614 lt!219720))))))

(assert (=> d!45488 (= (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219720))) (currentByte!6225 (_2!6614 lt!219720)) (currentBit!6220 (_2!6614 lt!219720))) lt!220144)))

(declare-fun b!141915 () Bool)

(declare-fun res!118407 () Bool)

(assert (=> b!141915 (=> (not res!118407) (not e!94535))))

(assert (=> b!141915 (= res!118407 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220144))))

(declare-fun b!141916 () Bool)

(declare-fun lt!220140 () (_ BitVec 64))

(assert (=> b!141916 (= e!94535 (bvsle lt!220144 (bvmul lt!220140 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141916 (or (= lt!220140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220140)))))

(assert (=> b!141916 (= lt!220140 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219720)))))))

(assert (= (and d!45488 res!118408) b!141915))

(assert (= (and b!141915 res!118407) b!141916))

(declare-fun m!217991 () Bool)

(assert (=> d!45488 m!217991))

(declare-fun m!217993 () Bool)

(assert (=> d!45488 m!217993))

(assert (=> b!141684 d!45488))

(declare-fun d!45492 () Bool)

(declare-fun e!94538 () Bool)

(assert (=> d!45492 e!94538))

(declare-fun res!118414 () Bool)

(assert (=> d!45492 (=> (not res!118414) (not e!94538))))

(declare-fun lt!220153 () (_ BitVec 64))

(declare-fun lt!220155 () (_ BitVec 64))

(declare-fun lt!220156 () (_ BitVec 64))

(assert (=> d!45492 (= res!118414 (= lt!220156 (bvsub lt!220155 lt!220153)))))

(assert (=> d!45492 (or (= (bvand lt!220155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220153 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220155 lt!220153) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45492 (= lt!220153 (remainingBits!0 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719)))))))

(declare-fun lt!220151 () (_ BitVec 64))

(declare-fun lt!220154 () (_ BitVec 64))

(assert (=> d!45492 (= lt!220155 (bvmul lt!220151 lt!220154))))

(assert (=> d!45492 (or (= lt!220151 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220154 (bvsdiv (bvmul lt!220151 lt!220154) lt!220151)))))

(assert (=> d!45492 (= lt!220154 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45492 (= lt!220151 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))))))

(assert (=> d!45492 (= lt!220156 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719)))))))

(assert (=> d!45492 (invariant!0 (currentBit!6220 (_2!6614 lt!219719)) (currentByte!6225 (_2!6614 lt!219719)) (size!2944 (buf!3365 (_2!6614 lt!219719))))))

(assert (=> d!45492 (= (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719))) lt!220156)))

(declare-fun b!141919 () Bool)

(declare-fun res!118413 () Bool)

(assert (=> b!141919 (=> (not res!118413) (not e!94538))))

(assert (=> b!141919 (= res!118413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220156))))

(declare-fun b!141920 () Bool)

(declare-fun lt!220152 () (_ BitVec 64))

(assert (=> b!141920 (= e!94538 (bvsle lt!220156 (bvmul lt!220152 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141920 (or (= lt!220152 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220152 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220152)))))

(assert (=> b!141920 (= lt!220152 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))))))

(assert (= (and d!45492 res!118414) b!141919))

(assert (= (and b!141919 res!118413) b!141920))

(declare-fun m!217995 () Bool)

(assert (=> d!45492 m!217995))

(declare-fun m!217997 () Bool)

(assert (=> d!45492 m!217997))

(assert (=> b!141684 d!45492))

(declare-fun d!45494 () Bool)

(assert (=> d!45494 (= (invariant!0 (currentBit!6220 thiss!1634) (currentByte!6225 thiss!1634) (size!2944 (buf!3365 (_2!6614 lt!219719)))) (and (bvsge (currentBit!6220 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6220 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6225 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6225 thiss!1634) (size!2944 (buf!3365 (_2!6614 lt!219719)))) (and (= (currentBit!6220 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6225 thiss!1634) (size!2944 (buf!3365 (_2!6614 lt!219719))))))))))

(assert (=> b!141694 d!45494))

(declare-fun d!45496 () Bool)

(assert (=> d!45496 (= (array_inv!2733 (buf!3365 thiss!1634)) (bvsge (size!2944 (buf!3365 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!141693 d!45496))

(declare-fun d!45498 () Bool)

(declare-fun res!118418 () Bool)

(declare-fun e!94540 () Bool)

(assert (=> d!45498 (=> (not res!118418) (not e!94540))))

(assert (=> d!45498 (= res!118418 (= (size!2944 (buf!3365 (_2!6614 lt!219719))) (size!2944 (buf!3365 (_2!6614 lt!219720)))))))

(assert (=> d!45498 (= (isPrefixOf!0 (_2!6614 lt!219719) (_2!6614 lt!219720)) e!94540)))

(declare-fun b!141925 () Bool)

(declare-fun res!118419 () Bool)

(assert (=> b!141925 (=> (not res!118419) (not e!94540))))

(assert (=> b!141925 (= res!118419 (bvsle (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719))) (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219720))) (currentByte!6225 (_2!6614 lt!219720)) (currentBit!6220 (_2!6614 lt!219720)))))))

(declare-fun b!141926 () Bool)

(declare-fun e!94539 () Bool)

(assert (=> b!141926 (= e!94540 e!94539)))

(declare-fun res!118417 () Bool)

(assert (=> b!141926 (=> res!118417 e!94539)))

(assert (=> b!141926 (= res!118417 (= (size!2944 (buf!3365 (_2!6614 lt!219719))) #b00000000000000000000000000000000))))

(declare-fun b!141927 () Bool)

(assert (=> b!141927 (= e!94539 (arrayBitRangesEq!0 (buf!3365 (_2!6614 lt!219719)) (buf!3365 (_2!6614 lt!219720)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719)))))))

(assert (= (and d!45498 res!118418) b!141925))

(assert (= (and b!141925 res!118419) b!141926))

(assert (= (and b!141926 (not res!118417)) b!141927))

(assert (=> b!141925 m!217633))

(assert (=> b!141925 m!217663))

(assert (=> b!141927 m!217633))

(assert (=> b!141927 m!217633))

(declare-fun m!217999 () Bool)

(assert (=> b!141927 m!217999))

(assert (=> b!141687 d!45498))

(assert (=> b!141686 d!45492))

(declare-fun d!45500 () Bool)

(declare-fun e!94541 () Bool)

(assert (=> d!45500 e!94541))

(declare-fun res!118421 () Bool)

(assert (=> d!45500 (=> (not res!118421) (not e!94541))))

(declare-fun lt!220163 () (_ BitVec 64))

(declare-fun lt!220165 () (_ BitVec 64))

(declare-fun lt!220166 () (_ BitVec 64))

(assert (=> d!45500 (= res!118421 (= lt!220166 (bvsub lt!220165 lt!220163)))))

(assert (=> d!45500 (or (= (bvand lt!220165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220163 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220165 lt!220163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45500 (= lt!220163 (remainingBits!0 ((_ sign_extend 32) (size!2944 (buf!3365 thiss!1634))) ((_ sign_extend 32) (currentByte!6225 thiss!1634)) ((_ sign_extend 32) (currentBit!6220 thiss!1634))))))

(declare-fun lt!220161 () (_ BitVec 64))

(declare-fun lt!220164 () (_ BitVec 64))

(assert (=> d!45500 (= lt!220165 (bvmul lt!220161 lt!220164))))

(assert (=> d!45500 (or (= lt!220161 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220164 (bvsdiv (bvmul lt!220161 lt!220164) lt!220161)))))

(assert (=> d!45500 (= lt!220164 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45500 (= lt!220161 ((_ sign_extend 32) (size!2944 (buf!3365 thiss!1634))))))

(assert (=> d!45500 (= lt!220166 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6225 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6220 thiss!1634))))))

(assert (=> d!45500 (invariant!0 (currentBit!6220 thiss!1634) (currentByte!6225 thiss!1634) (size!2944 (buf!3365 thiss!1634)))))

(assert (=> d!45500 (= (bitIndex!0 (size!2944 (buf!3365 thiss!1634)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634)) lt!220166)))

(declare-fun b!141928 () Bool)

(declare-fun res!118420 () Bool)

(assert (=> b!141928 (=> (not res!118420) (not e!94541))))

(assert (=> b!141928 (= res!118420 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220166))))

(declare-fun b!141929 () Bool)

(declare-fun lt!220162 () (_ BitVec 64))

(assert (=> b!141929 (= e!94541 (bvsle lt!220166 (bvmul lt!220162 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141929 (or (= lt!220162 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220162 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220162)))))

(assert (=> b!141929 (= lt!220162 ((_ sign_extend 32) (size!2944 (buf!3365 thiss!1634))))))

(assert (= (and d!45500 res!118421) b!141928))

(assert (= (and b!141928 res!118420) b!141929))

(assert (=> d!45500 m!217883))

(assert (=> d!45500 m!217659))

(assert (=> b!141686 d!45500))

(declare-fun d!45502 () Bool)

(declare-datatypes ((tuple3!540 0))(
  ( (tuple3!541 (_1!6630 Unit!8870) (_2!6630 BitStream!5146) (_3!332 array!6501)) )
))
(declare-fun lt!220174 () tuple3!540)

(declare-fun readByteArrayLoop!0 (BitStream!5146 array!6501 (_ BitVec 32) (_ BitVec 32)) tuple3!540)

(assert (=> d!45502 (= lt!220174 (readByteArrayLoop!0 (_1!6616 lt!219723) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45502 (= (readByteArrayLoopPure!0 (_1!6616 lt!219723) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12571 (_2!6630 lt!220174) (_3!332 lt!220174)))))

(declare-fun bs!11178 () Bool)

(assert (= bs!11178 d!45502))

(declare-fun m!218013 () Bool)

(assert (=> bs!11178 m!218013))

(assert (=> b!141685 d!45502))

(declare-fun d!45506 () Bool)

(assert (=> d!45506 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219720)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719))) lt!219727) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219720)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719)))) lt!219727))))

(declare-fun bs!11179 () Bool)

(assert (= bs!11179 d!45506))

(declare-fun m!218015 () Bool)

(assert (=> bs!11179 m!218015))

(assert (=> b!141685 d!45506))

(declare-fun d!45508 () Bool)

(assert (=> d!45508 (validate_offset_bits!1 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219720)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719))) lt!219727)))

(declare-fun lt!220177 () Unit!8870)

(declare-fun choose!9 (BitStream!5146 array!6501 (_ BitVec 64) BitStream!5146) Unit!8870)

(assert (=> d!45508 (= lt!220177 (choose!9 (_2!6614 lt!219719) (buf!3365 (_2!6614 lt!219720)) lt!219727 (BitStream!5147 (buf!3365 (_2!6614 lt!219720)) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719)))))))

(assert (=> d!45508 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6614 lt!219719) (buf!3365 (_2!6614 lt!219720)) lt!219727) lt!220177)))

(declare-fun bs!11180 () Bool)

(assert (= bs!11180 d!45508))

(assert (=> bs!11180 m!217675))

(declare-fun m!218017 () Bool)

(assert (=> bs!11180 m!218017))

(assert (=> b!141685 d!45508))

(declare-fun b!141933 () Bool)

(declare-fun e!94543 () Unit!8870)

(declare-fun lt!220183 () Unit!8870)

(assert (=> b!141933 (= e!94543 lt!220183)))

(declare-fun lt!220186 () (_ BitVec 64))

(assert (=> b!141933 (= lt!220186 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!220187 () (_ BitVec 64))

(assert (=> b!141933 (= lt!220187 (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719))))))

(assert (=> b!141933 (= lt!220183 (arrayBitRangesEqSymmetric!0 (buf!3365 (_2!6614 lt!219719)) (buf!3365 (_2!6614 lt!219720)) lt!220186 lt!220187))))

(assert (=> b!141933 (arrayBitRangesEq!0 (buf!3365 (_2!6614 lt!219720)) (buf!3365 (_2!6614 lt!219719)) lt!220186 lt!220187)))

(declare-fun b!141934 () Bool)

(declare-fun res!118426 () Bool)

(declare-fun e!94544 () Bool)

(assert (=> b!141934 (=> (not res!118426) (not e!94544))))

(declare-fun lt!220196 () tuple2!12572)

(assert (=> b!141934 (= res!118426 (isPrefixOf!0 (_1!6616 lt!220196) (_2!6614 lt!219719)))))

(declare-fun lt!220197 () (_ BitVec 64))

(declare-fun b!141935 () Bool)

(declare-fun lt!220185 () (_ BitVec 64))

(assert (=> b!141935 (= e!94544 (= (_1!6616 lt!220196) (withMovedBitIndex!0 (_2!6616 lt!220196) (bvsub lt!220185 lt!220197))))))

(assert (=> b!141935 (or (= (bvand lt!220185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220197 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220185 lt!220197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141935 (= lt!220197 (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219720))) (currentByte!6225 (_2!6614 lt!219720)) (currentBit!6220 (_2!6614 lt!219720))))))

(assert (=> b!141935 (= lt!220185 (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719))))))

(declare-fun b!141936 () Bool)

(declare-fun Unit!8880 () Unit!8870)

(assert (=> b!141936 (= e!94543 Unit!8880)))

(declare-fun d!45510 () Bool)

(assert (=> d!45510 e!94544))

(declare-fun res!118427 () Bool)

(assert (=> d!45510 (=> (not res!118427) (not e!94544))))

(assert (=> d!45510 (= res!118427 (isPrefixOf!0 (_1!6616 lt!220196) (_2!6616 lt!220196)))))

(declare-fun lt!220180 () BitStream!5146)

(assert (=> d!45510 (= lt!220196 (tuple2!12573 lt!220180 (_2!6614 lt!219720)))))

(declare-fun lt!220195 () Unit!8870)

(declare-fun lt!220190 () Unit!8870)

(assert (=> d!45510 (= lt!220195 lt!220190)))

(assert (=> d!45510 (isPrefixOf!0 lt!220180 (_2!6614 lt!219720))))

(assert (=> d!45510 (= lt!220190 (lemmaIsPrefixTransitive!0 lt!220180 (_2!6614 lt!219720) (_2!6614 lt!219720)))))

(declare-fun lt!220179 () Unit!8870)

(declare-fun lt!220178 () Unit!8870)

(assert (=> d!45510 (= lt!220179 lt!220178)))

(assert (=> d!45510 (isPrefixOf!0 lt!220180 (_2!6614 lt!219720))))

(assert (=> d!45510 (= lt!220178 (lemmaIsPrefixTransitive!0 lt!220180 (_2!6614 lt!219719) (_2!6614 lt!219720)))))

(declare-fun lt!220182 () Unit!8870)

(assert (=> d!45510 (= lt!220182 e!94543)))

(declare-fun c!7810 () Bool)

(assert (=> d!45510 (= c!7810 (not (= (size!2944 (buf!3365 (_2!6614 lt!219719))) #b00000000000000000000000000000000)))))

(declare-fun lt!220191 () Unit!8870)

(declare-fun lt!220184 () Unit!8870)

(assert (=> d!45510 (= lt!220191 lt!220184)))

(assert (=> d!45510 (isPrefixOf!0 (_2!6614 lt!219720) (_2!6614 lt!219720))))

(assert (=> d!45510 (= lt!220184 (lemmaIsPrefixRefl!0 (_2!6614 lt!219720)))))

(declare-fun lt!220189 () Unit!8870)

(declare-fun lt!220194 () Unit!8870)

(assert (=> d!45510 (= lt!220189 lt!220194)))

(assert (=> d!45510 (= lt!220194 (lemmaIsPrefixRefl!0 (_2!6614 lt!219720)))))

(declare-fun lt!220193 () Unit!8870)

(declare-fun lt!220188 () Unit!8870)

(assert (=> d!45510 (= lt!220193 lt!220188)))

(assert (=> d!45510 (isPrefixOf!0 lt!220180 lt!220180)))

(assert (=> d!45510 (= lt!220188 (lemmaIsPrefixRefl!0 lt!220180))))

(declare-fun lt!220192 () Unit!8870)

(declare-fun lt!220181 () Unit!8870)

(assert (=> d!45510 (= lt!220192 lt!220181)))

(assert (=> d!45510 (isPrefixOf!0 (_2!6614 lt!219719) (_2!6614 lt!219719))))

(assert (=> d!45510 (= lt!220181 (lemmaIsPrefixRefl!0 (_2!6614 lt!219719)))))

(assert (=> d!45510 (= lt!220180 (BitStream!5147 (buf!3365 (_2!6614 lt!219720)) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719))))))

(assert (=> d!45510 (isPrefixOf!0 (_2!6614 lt!219719) (_2!6614 lt!219720))))

(assert (=> d!45510 (= (reader!0 (_2!6614 lt!219719) (_2!6614 lt!219720)) lt!220196)))

(declare-fun b!141937 () Bool)

(declare-fun res!118425 () Bool)

(assert (=> b!141937 (=> (not res!118425) (not e!94544))))

(assert (=> b!141937 (= res!118425 (isPrefixOf!0 (_2!6616 lt!220196) (_2!6614 lt!219720)))))

(assert (= (and d!45510 c!7810) b!141933))

(assert (= (and d!45510 (not c!7810)) b!141936))

(assert (= (and d!45510 res!118427) b!141934))

(assert (= (and b!141934 res!118426) b!141937))

(assert (= (and b!141937 res!118425) b!141935))

(declare-fun m!218019 () Bool)

(assert (=> b!141934 m!218019))

(declare-fun m!218021 () Bool)

(assert (=> b!141935 m!218021))

(assert (=> b!141935 m!217663))

(assert (=> b!141935 m!217633))

(assert (=> b!141933 m!217633))

(declare-fun m!218023 () Bool)

(assert (=> b!141933 m!218023))

(declare-fun m!218025 () Bool)

(assert (=> b!141933 m!218025))

(assert (=> d!45510 m!217667))

(declare-fun m!218027 () Bool)

(assert (=> d!45510 m!218027))

(declare-fun m!218029 () Bool)

(assert (=> d!45510 m!218029))

(declare-fun m!218031 () Bool)

(assert (=> d!45510 m!218031))

(declare-fun m!218033 () Bool)

(assert (=> d!45510 m!218033))

(declare-fun m!218035 () Bool)

(assert (=> d!45510 m!218035))

(declare-fun m!218037 () Bool)

(assert (=> d!45510 m!218037))

(assert (=> d!45510 m!217973))

(assert (=> d!45510 m!217971))

(declare-fun m!218039 () Bool)

(assert (=> d!45510 m!218039))

(declare-fun m!218041 () Bool)

(assert (=> d!45510 m!218041))

(declare-fun m!218043 () Bool)

(assert (=> b!141937 m!218043))

(assert (=> b!141685 d!45510))

(declare-fun d!45512 () Bool)

(declare-fun e!94547 () Bool)

(assert (=> d!45512 e!94547))

(declare-fun res!118430 () Bool)

(assert (=> d!45512 (=> (not res!118430) (not e!94547))))

(assert (=> d!45512 (= res!118430 (and (or (let ((rhs!3182 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3182 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3182) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45513 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45513 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45513 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3181 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3181 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3181) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!220205 () Unit!8870)

(declare-fun choose!57 (BitStream!5146 BitStream!5146 (_ BitVec 64) (_ BitVec 32)) Unit!8870)

(assert (=> d!45512 (= lt!220205 (choose!57 thiss!1634 (_2!6614 lt!219719) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45512 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6614 lt!219719) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!220205)))

(declare-fun lt!220204 () (_ BitVec 32))

(declare-fun b!141940 () Bool)

(assert (=> b!141940 (= e!94547 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719))) (bvsub (bvsub to!404 from!447) lt!220204)))))

(assert (=> b!141940 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!220204 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!220204) #b10000000000000000000000000000000)))))

(declare-fun lt!220206 () (_ BitVec 64))

(assert (=> b!141940 (= lt!220204 ((_ extract 31 0) lt!220206))))

(assert (=> b!141940 (and (bvslt lt!220206 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!220206 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!141940 (= lt!220206 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45512 res!118430) b!141940))

(declare-fun m!218045 () Bool)

(assert (=> d!45512 m!218045))

(declare-fun m!218047 () Bool)

(assert (=> b!141940 m!218047))

(assert (=> b!141689 d!45512))

(declare-fun b!141989 () Bool)

(declare-fun e!94578 () Bool)

(declare-fun lt!220301 () (_ BitVec 64))

(assert (=> b!141989 (= e!94578 (validate_offset_bits!1 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719))) lt!220301))))

(declare-fun b!141990 () Bool)

(declare-fun e!94576 () Bool)

(declare-fun e!94577 () Bool)

(assert (=> b!141990 (= e!94576 e!94577)))

(declare-fun res!118480 () Bool)

(assert (=> b!141990 (=> (not res!118480) (not e!94577))))

(declare-fun lt!220293 () tuple2!12570)

(declare-fun lt!220300 () tuple2!12572)

(assert (=> b!141990 (= res!118480 (and (= (size!2944 (_2!6615 lt!220293)) (size!2944 arr!237)) (= (_1!6615 lt!220293) (_2!6616 lt!220300))))))

(assert (=> b!141990 (= lt!220293 (readByteArrayLoopPure!0 (_1!6616 lt!220300) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!220296 () Unit!8870)

(declare-fun lt!220295 () Unit!8870)

(assert (=> b!141990 (= lt!220296 lt!220295)))

(declare-fun lt!220298 () tuple2!12568)

(assert (=> b!141990 (validate_offset_bits!1 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!220298)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719))) lt!220301)))

(assert (=> b!141990 (= lt!220295 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6614 lt!219719) (buf!3365 (_2!6614 lt!220298)) lt!220301))))

(assert (=> b!141990 e!94578))

(declare-fun res!118481 () Bool)

(assert (=> b!141990 (=> (not res!118481) (not e!94578))))

(assert (=> b!141990 (= res!118481 (and (= (size!2944 (buf!3365 (_2!6614 lt!219719))) (size!2944 (buf!3365 (_2!6614 lt!220298)))) (bvsge lt!220301 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141990 (= lt!220301 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!141990 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!141990 (= lt!220300 (reader!0 (_2!6614 lt!219719) (_2!6614 lt!220298)))))

(declare-fun d!45515 () Bool)

(assert (=> d!45515 e!94576))

(declare-fun res!118477 () Bool)

(assert (=> d!45515 (=> (not res!118477) (not e!94576))))

(assert (=> d!45515 (= res!118477 (= (size!2944 (buf!3365 (_2!6614 lt!219719))) (size!2944 (buf!3365 (_2!6614 lt!220298)))))))

(declare-fun choose!64 (BitStream!5146 array!6501 (_ BitVec 32) (_ BitVec 32)) tuple2!12568)

(assert (=> d!45515 (= lt!220298 (choose!64 (_2!6614 lt!219719) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45515 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2944 arr!237)))))

(assert (=> d!45515 (= (appendByteArrayLoop!0 (_2!6614 lt!219719) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!220298)))

(declare-fun b!141991 () Bool)

(assert (=> b!141991 (= e!94577 (arrayRangesEq!260 arr!237 (_2!6615 lt!220293) #b00000000000000000000000000000000 to!404))))

(declare-fun b!141992 () Bool)

(declare-fun res!118479 () Bool)

(assert (=> b!141992 (=> (not res!118479) (not e!94576))))

(assert (=> b!141992 (= res!118479 (isPrefixOf!0 (_2!6614 lt!219719) (_2!6614 lt!220298)))))

(declare-fun b!141993 () Bool)

(declare-fun res!118478 () Bool)

(assert (=> b!141993 (=> (not res!118478) (not e!94576))))

(declare-fun lt!220294 () (_ BitVec 64))

(declare-fun lt!220297 () (_ BitVec 64))

(assert (=> b!141993 (= res!118478 (= (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!220298))) (currentByte!6225 (_2!6614 lt!220298)) (currentBit!6220 (_2!6614 lt!220298))) (bvadd lt!220294 lt!220297)))))

(assert (=> b!141993 (or (not (= (bvand lt!220294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220294 lt!220297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!220299 () (_ BitVec 64))

(assert (=> b!141993 (= lt!220297 (bvmul lt!220299 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!141993 (or (= lt!220299 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220299 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220299)))))

(assert (=> b!141993 (= lt!220299 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!141993 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!141993 (= lt!220294 (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 (_2!6614 lt!219719)) (currentBit!6220 (_2!6614 lt!219719))))))

(assert (= (and d!45515 res!118477) b!141993))

(assert (= (and b!141993 res!118478) b!141992))

(assert (= (and b!141992 res!118479) b!141990))

(assert (= (and b!141990 res!118481) b!141989))

(assert (= (and b!141990 res!118480) b!141991))

(declare-fun m!218117 () Bool)

(assert (=> b!141991 m!218117))

(declare-fun m!218119 () Bool)

(assert (=> b!141989 m!218119))

(declare-fun m!218121 () Bool)

(assert (=> b!141992 m!218121))

(declare-fun m!218123 () Bool)

(assert (=> d!45515 m!218123))

(declare-fun m!218125 () Bool)

(assert (=> b!141990 m!218125))

(declare-fun m!218127 () Bool)

(assert (=> b!141990 m!218127))

(declare-fun m!218129 () Bool)

(assert (=> b!141990 m!218129))

(declare-fun m!218131 () Bool)

(assert (=> b!141990 m!218131))

(declare-fun m!218133 () Bool)

(assert (=> b!141993 m!218133))

(assert (=> b!141993 m!217633))

(assert (=> b!141689 d!45515))

(declare-fun d!45533 () Bool)

(assert (=> d!45533 (isPrefixOf!0 thiss!1634 (_2!6614 lt!219720))))

(declare-fun lt!220304 () Unit!8870)

(declare-fun choose!30 (BitStream!5146 BitStream!5146 BitStream!5146) Unit!8870)

(assert (=> d!45533 (= lt!220304 (choose!30 thiss!1634 (_2!6614 lt!219719) (_2!6614 lt!219720)))))

(assert (=> d!45533 (isPrefixOf!0 thiss!1634 (_2!6614 lt!219719))))

(assert (=> d!45533 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6614 lt!219719) (_2!6614 lt!219720)) lt!220304)))

(declare-fun bs!11184 () Bool)

(assert (= bs!11184 d!45533))

(assert (=> bs!11184 m!217643))

(declare-fun m!218135 () Bool)

(assert (=> bs!11184 m!218135))

(assert (=> bs!11184 m!217631))

(assert (=> b!141689 d!45533))

(declare-fun d!45535 () Bool)

(declare-fun e!94579 () Bool)

(assert (=> d!45535 e!94579))

(declare-fun res!118483 () Bool)

(assert (=> d!45535 (=> (not res!118483) (not e!94579))))

(declare-fun lt!220310 () (_ BitVec 64))

(declare-fun lt!220307 () (_ BitVec 64))

(declare-fun lt!220309 () (_ BitVec 64))

(assert (=> d!45535 (= res!118483 (= lt!220310 (bvsub lt!220309 lt!220307)))))

(assert (=> d!45535 (or (= (bvand lt!220309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220309 lt!220307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45535 (= lt!220307 (remainingBits!0 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))) ((_ sign_extend 32) (currentByte!6225 thiss!1634)) ((_ sign_extend 32) (currentBit!6220 thiss!1634))))))

(declare-fun lt!220305 () (_ BitVec 64))

(declare-fun lt!220308 () (_ BitVec 64))

(assert (=> d!45535 (= lt!220309 (bvmul lt!220305 lt!220308))))

(assert (=> d!45535 (or (= lt!220305 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220308 (bvsdiv (bvmul lt!220305 lt!220308) lt!220305)))))

(assert (=> d!45535 (= lt!220308 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45535 (= lt!220305 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))))))

(assert (=> d!45535 (= lt!220310 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6225 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6220 thiss!1634))))))

(assert (=> d!45535 (invariant!0 (currentBit!6220 thiss!1634) (currentByte!6225 thiss!1634) (size!2944 (buf!3365 (_2!6614 lt!219719))))))

(assert (=> d!45535 (= (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219719))) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634)) lt!220310)))

(declare-fun b!141994 () Bool)

(declare-fun res!118482 () Bool)

(assert (=> b!141994 (=> (not res!118482) (not e!94579))))

(assert (=> b!141994 (= res!118482 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220310))))

(declare-fun b!141995 () Bool)

(declare-fun lt!220306 () (_ BitVec 64))

(assert (=> b!141995 (= e!94579 (bvsle lt!220310 (bvmul lt!220306 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141995 (or (= lt!220306 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220306 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220306)))))

(assert (=> b!141995 (= lt!220306 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))))))

(assert (= (and d!45535 res!118483) b!141994))

(assert (= (and b!141994 res!118482) b!141995))

(declare-fun m!218137 () Bool)

(assert (=> d!45535 m!218137))

(assert (=> d!45535 m!217661))

(assert (=> b!141689 d!45535))

(declare-fun d!45537 () Bool)

(assert (=> d!45537 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2944 (buf!3365 (_2!6614 lt!219719)))) ((_ sign_extend 32) (currentByte!6225 (_2!6614 lt!219719))) ((_ sign_extend 32) (currentBit!6220 (_2!6614 lt!219719)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11185 () Bool)

(assert (= bs!11185 d!45537))

(assert (=> bs!11185 m!217995))

(assert (=> b!141689 d!45537))

(declare-fun d!45539 () Bool)

(declare-fun e!94582 () Bool)

(assert (=> d!45539 e!94582))

(declare-fun res!118490 () Bool)

(assert (=> d!45539 (=> (not res!118490) (not e!94582))))

(declare-fun lt!220325 () tuple2!12568)

(assert (=> d!45539 (= res!118490 (= (size!2944 (buf!3365 thiss!1634)) (size!2944 (buf!3365 (_2!6614 lt!220325)))))))

(declare-fun choose!6 (BitStream!5146 (_ BitVec 8)) tuple2!12568)

(assert (=> d!45539 (= lt!220325 (choose!6 thiss!1634 (select (arr!3651 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45539 (validate_offset_byte!0 ((_ sign_extend 32) (size!2944 (buf!3365 thiss!1634))) ((_ sign_extend 32) (currentByte!6225 thiss!1634)) ((_ sign_extend 32) (currentBit!6220 thiss!1634)))))

(assert (=> d!45539 (= (appendByte!0 thiss!1634 (select (arr!3651 arr!237) from!447)) lt!220325)))

(declare-fun b!142002 () Bool)

(declare-fun res!118491 () Bool)

(assert (=> b!142002 (=> (not res!118491) (not e!94582))))

(declare-fun lt!220321 () (_ BitVec 64))

(declare-fun lt!220322 () (_ BitVec 64))

(assert (=> b!142002 (= res!118491 (= (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!220325))) (currentByte!6225 (_2!6614 lt!220325)) (currentBit!6220 (_2!6614 lt!220325))) (bvadd lt!220321 lt!220322)))))

(assert (=> b!142002 (or (not (= (bvand lt!220321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220321 lt!220322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142002 (= lt!220322 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!142002 (= lt!220321 (bitIndex!0 (size!2944 (buf!3365 thiss!1634)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634)))))

(declare-fun b!142003 () Bool)

(declare-fun res!118492 () Bool)

(assert (=> b!142003 (=> (not res!118492) (not e!94582))))

(assert (=> b!142003 (= res!118492 (isPrefixOf!0 thiss!1634 (_2!6614 lt!220325)))))

(declare-fun lt!220324 () tuple2!12572)

(declare-fun b!142004 () Bool)

(declare-fun lt!220323 () tuple2!12574)

(assert (=> b!142004 (= e!94582 (and (= (_2!6617 lt!220323) (select (arr!3651 arr!237) from!447)) (= (_1!6617 lt!220323) (_2!6616 lt!220324))))))

(assert (=> b!142004 (= lt!220323 (readBytePure!0 (_1!6616 lt!220324)))))

(assert (=> b!142004 (= lt!220324 (reader!0 thiss!1634 (_2!6614 lt!220325)))))

(assert (= (and d!45539 res!118490) b!142002))

(assert (= (and b!142002 res!118491) b!142003))

(assert (= (and b!142003 res!118492) b!142004))

(assert (=> d!45539 m!217649))

(declare-fun m!218139 () Bool)

(assert (=> d!45539 m!218139))

(declare-fun m!218141 () Bool)

(assert (=> d!45539 m!218141))

(declare-fun m!218143 () Bool)

(assert (=> b!142002 m!218143))

(assert (=> b!142002 m!217635))

(declare-fun m!218145 () Bool)

(assert (=> b!142003 m!218145))

(declare-fun m!218147 () Bool)

(assert (=> b!142004 m!218147))

(declare-fun m!218149 () Bool)

(assert (=> b!142004 m!218149))

(assert (=> b!141689 d!45539))

(declare-fun d!45541 () Bool)

(declare-fun res!118494 () Bool)

(declare-fun e!94584 () Bool)

(assert (=> d!45541 (=> (not res!118494) (not e!94584))))

(assert (=> d!45541 (= res!118494 (= (size!2944 (buf!3365 thiss!1634)) (size!2944 (buf!3365 (_2!6614 lt!219720)))))))

(assert (=> d!45541 (= (isPrefixOf!0 thiss!1634 (_2!6614 lt!219720)) e!94584)))

(declare-fun b!142005 () Bool)

(declare-fun res!118495 () Bool)

(assert (=> b!142005 (=> (not res!118495) (not e!94584))))

(assert (=> b!142005 (= res!118495 (bvsle (bitIndex!0 (size!2944 (buf!3365 thiss!1634)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634)) (bitIndex!0 (size!2944 (buf!3365 (_2!6614 lt!219720))) (currentByte!6225 (_2!6614 lt!219720)) (currentBit!6220 (_2!6614 lt!219720)))))))

(declare-fun b!142006 () Bool)

(declare-fun e!94583 () Bool)

(assert (=> b!142006 (= e!94584 e!94583)))

(declare-fun res!118493 () Bool)

(assert (=> b!142006 (=> res!118493 e!94583)))

(assert (=> b!142006 (= res!118493 (= (size!2944 (buf!3365 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142007 () Bool)

(assert (=> b!142007 (= e!94583 (arrayBitRangesEq!0 (buf!3365 thiss!1634) (buf!3365 (_2!6614 lt!219720)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2944 (buf!3365 thiss!1634)) (currentByte!6225 thiss!1634) (currentBit!6220 thiss!1634))))))

(assert (= (and d!45541 res!118494) b!142005))

(assert (= (and b!142005 res!118495) b!142006))

(assert (= (and b!142006 (not res!118493)) b!142007))

(assert (=> b!142005 m!217635))

(assert (=> b!142005 m!217663))

(assert (=> b!142007 m!217635))

(assert (=> b!142007 m!217635))

(declare-fun m!218151 () Bool)

(assert (=> b!142007 m!218151))

(assert (=> b!141689 d!45541))

(declare-fun d!45543 () Bool)

(declare-fun res!118500 () Bool)

(declare-fun e!94589 () Bool)

(assert (=> d!45543 (=> res!118500 e!94589)))

(assert (=> d!45543 (= res!118500 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45543 (= (arrayRangesEq!260 arr!237 (_2!6615 lt!219722) #b00000000000000000000000000000000 to!404) e!94589)))

(declare-fun b!142012 () Bool)

(declare-fun e!94590 () Bool)

(assert (=> b!142012 (= e!94589 e!94590)))

(declare-fun res!118501 () Bool)

(assert (=> b!142012 (=> (not res!118501) (not e!94590))))

(assert (=> b!142012 (= res!118501 (= (select (arr!3651 arr!237) #b00000000000000000000000000000000) (select (arr!3651 (_2!6615 lt!219722)) #b00000000000000000000000000000000)))))

(declare-fun b!142013 () Bool)

(assert (=> b!142013 (= e!94590 (arrayRangesEq!260 arr!237 (_2!6615 lt!219722) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45543 (not res!118500)) b!142012))

(assert (= (and b!142012 res!118501) b!142013))

(declare-fun m!218153 () Bool)

(assert (=> b!142012 m!218153))

(declare-fun m!218155 () Bool)

(assert (=> b!142012 m!218155))

(declare-fun m!218157 () Bool)

(assert (=> b!142013 m!218157))

(assert (=> b!141688 d!45543))

(push 1)

(assert (not d!45537))

(assert (not d!45502))

(assert (not b!142005))

(assert (not d!45446))

(assert (not d!45488))

(assert (not d!45456))

(assert (not d!45506))

(assert (not b!141903))

(assert (not b!142007))

(assert (not d!45512))

(assert (not d!45533))

(assert (not b!141935))

(assert (not d!45492))

(assert (not b!141840))

(assert (not d!45539))

(assert (not b!141989))

(assert (not b!141927))

(assert (not b!142013))

(assert (not d!45515))

(assert (not b!141925))

(assert (not d!45508))

(assert (not b!141838))

(assert (not b!142004))

(assert (not b!141907))

(assert (not b!141991))

(assert (not b!141993))

(assert (not d!45535))

(assert (not d!45442))

(assert (not d!45458))

(assert (not b!141933))

(assert (not b!142002))

(assert (not d!45510))

(assert (not b!141992))

(assert (not d!45500))

(assert (not b!142003))

(assert (not b!141990))

(assert (not b!141934))

(assert (not b!141940))

(assert (not b!141937))

(assert (not b!141904))

(assert (not b!141905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

