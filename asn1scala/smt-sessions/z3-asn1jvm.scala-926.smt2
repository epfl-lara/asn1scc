; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26144 () Bool)

(assert start!26144)

(declare-datatypes ((array!6129 0))(
  ( (array!6130 (arr!3424 (Array (_ BitVec 32) (_ BitVec 8))) (size!2774 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4812 0))(
  ( (BitStream!4813 (buf!3157 array!6129) (currentByte!5948 (_ BitVec 32)) (currentBit!5943 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11578 0))(
  ( (tuple2!11579 (_1!6100 BitStream!4812) (_2!6100 (_ BitVec 8))) )
))
(declare-fun lt!206856 () tuple2!11578)

(declare-fun b!133657 () Bool)

(declare-fun arr!237 () array!6129)

(declare-fun e!88659 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11580 0))(
  ( (tuple2!11581 (_1!6101 BitStream!4812) (_2!6101 BitStream!4812)) )
))
(declare-fun lt!206839 () tuple2!11580)

(assert (=> b!133657 (= e!88659 (and (= (_2!6100 lt!206856) (select (arr!3424 arr!237) from!447)) (= (_1!6100 lt!206856) (_2!6101 lt!206839))))))

(declare-fun readBytePure!0 (BitStream!4812) tuple2!11578)

(assert (=> b!133657 (= lt!206856 (readBytePure!0 (_1!6101 lt!206839)))))

(declare-fun thiss!1634 () BitStream!4812)

(declare-datatypes ((Unit!8283 0))(
  ( (Unit!8284) )
))
(declare-datatypes ((tuple2!11582 0))(
  ( (tuple2!11583 (_1!6102 Unit!8283) (_2!6102 BitStream!4812)) )
))
(declare-fun lt!206848 () tuple2!11582)

(declare-fun reader!0 (BitStream!4812 BitStream!4812) tuple2!11580)

(assert (=> b!133657 (= lt!206839 (reader!0 thiss!1634 (_2!6102 lt!206848)))))

(declare-fun b!133658 () Bool)

(declare-fun res!111045 () Bool)

(declare-fun e!88651 () Bool)

(assert (=> b!133658 (=> (not res!111045) (not e!88651))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!133658 (= res!111045 (invariant!0 (currentBit!5943 thiss!1634) (currentByte!5948 thiss!1634) (size!2774 (buf!3157 thiss!1634))))))

(declare-fun e!88652 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!11584 0))(
  ( (tuple2!11585 (_1!6103 BitStream!4812) (_2!6103 array!6129)) )
))
(declare-fun lt!206832 () tuple2!11584)

(declare-fun b!133659 () Bool)

(declare-fun arrayRangesEq!177 (array!6129 array!6129 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!133659 (= e!88652 (not (arrayRangesEq!177 arr!237 (_2!6103 lt!206832) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!133660 () Bool)

(declare-fun e!88656 () Bool)

(declare-fun array_inv!2563 (array!6129) Bool)

(assert (=> b!133660 (= e!88656 (array_inv!2563 (buf!3157 thiss!1634)))))

(declare-fun b!133661 () Bool)

(declare-fun res!111049 () Bool)

(assert (=> b!133661 (=> (not res!111049) (not e!88651))))

(assert (=> b!133661 (= res!111049 (bvslt from!447 to!404))))

(declare-fun b!133662 () Bool)

(declare-fun res!111039 () Bool)

(assert (=> b!133662 (=> (not res!111039) (not e!88651))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!133662 (= res!111039 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!133663 () Bool)

(declare-fun res!111042 () Bool)

(declare-fun e!88660 () Bool)

(assert (=> b!133663 (=> (not res!111042) (not e!88660))))

(declare-fun lt!206855 () tuple2!11582)

(declare-fun isPrefixOf!0 (BitStream!4812 BitStream!4812) Bool)

(assert (=> b!133663 (= res!111042 (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!206855)))))

(declare-fun lt!206841 () tuple2!11584)

(declare-fun lt!206852 () tuple2!11584)

(declare-fun b!133664 () Bool)

(assert (=> b!133664 (= e!88651 (not (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt (size!2774 (_2!6103 lt!206841)) (size!2774 (_2!6103 lt!206852))) (bvsle to!404 (size!2774 (_2!6103 lt!206841))))))))

(declare-fun lt!206849 () tuple2!11584)

(assert (=> b!133664 (arrayRangesEq!177 (_2!6103 lt!206841) (_2!6103 lt!206849) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!206837 () Unit!8283)

(declare-fun lt!206843 () tuple2!11580)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4812 array!6129 (_ BitVec 32) (_ BitVec 32)) Unit!8283)

(assert (=> b!133664 (= lt!206837 (readByteArrayLoopArrayPrefixLemma!0 (_1!6101 lt!206843) arr!237 from!447 to!404))))

(declare-fun lt!206847 () array!6129)

(declare-fun readByteArrayLoopPure!0 (BitStream!4812 array!6129 (_ BitVec 32) (_ BitVec 32)) tuple2!11584)

(declare-fun withMovedByteIndex!0 (BitStream!4812 (_ BitVec 32)) BitStream!4812)

(assert (=> b!133664 (= lt!206849 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001) lt!206847 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206842 () tuple2!11580)

(assert (=> b!133664 (= lt!206852 (readByteArrayLoopPure!0 (_1!6101 lt!206842) lt!206847 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206846 () tuple2!11578)

(assert (=> b!133664 (= lt!206847 (array!6130 (store (arr!3424 arr!237) from!447 (_2!6100 lt!206846)) (size!2774 arr!237)))))

(declare-fun lt!206850 () (_ BitVec 32))

(assert (=> b!133664 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206850)))

(declare-fun lt!206836 () Unit!8283)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4812 array!6129 (_ BitVec 32)) Unit!8283)

(assert (=> b!133664 (= lt!206836 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!206855)) lt!206850))))

(assert (=> b!133664 (= (_1!6103 lt!206841) (_2!6101 lt!206843))))

(assert (=> b!133664 (= lt!206841 (readByteArrayLoopPure!0 (_1!6101 lt!206843) arr!237 from!447 to!404))))

(assert (=> b!133664 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!206844 () Unit!8283)

(assert (=> b!133664 (= lt!206844 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3157 (_2!6102 lt!206855)) (bvsub to!404 from!447)))))

(assert (=> b!133664 (= (_2!6100 lt!206846) (select (arr!3424 arr!237) from!447))))

(assert (=> b!133664 (= lt!206846 (readBytePure!0 (_1!6101 lt!206843)))))

(assert (=> b!133664 (= lt!206842 (reader!0 (_2!6102 lt!206848) (_2!6102 lt!206855)))))

(assert (=> b!133664 (= lt!206843 (reader!0 thiss!1634 (_2!6102 lt!206855)))))

(declare-fun e!88654 () Bool)

(assert (=> b!133664 e!88654))

(declare-fun res!111040 () Bool)

(assert (=> b!133664 (=> (not res!111040) (not e!88654))))

(declare-fun lt!206838 () tuple2!11578)

(declare-fun lt!206853 () tuple2!11578)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!133664 (= res!111040 (= (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!206838))) (currentByte!5948 (_1!6100 lt!206838)) (currentBit!5943 (_1!6100 lt!206838))) (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!206853))) (currentByte!5948 (_1!6100 lt!206853)) (currentBit!5943 (_1!6100 lt!206853)))))))

(declare-fun lt!206835 () Unit!8283)

(declare-fun lt!206833 () BitStream!4812)

(declare-fun readBytePrefixLemma!0 (BitStream!4812 BitStream!4812) Unit!8283)

(assert (=> b!133664 (= lt!206835 (readBytePrefixLemma!0 lt!206833 (_2!6102 lt!206855)))))

(assert (=> b!133664 (= lt!206853 (readBytePure!0 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (=> b!133664 (= lt!206838 (readBytePure!0 lt!206833))))

(assert (=> b!133664 (= lt!206833 (BitStream!4813 (buf!3157 (_2!6102 lt!206848)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(declare-fun e!88658 () Bool)

(assert (=> b!133664 e!88658))

(declare-fun res!111043 () Bool)

(assert (=> b!133664 (=> (not res!111043) (not e!88658))))

(assert (=> b!133664 (= res!111043 (isPrefixOf!0 thiss!1634 (_2!6102 lt!206855)))))

(declare-fun lt!206840 () Unit!8283)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4812 BitStream!4812 BitStream!4812) Unit!8283)

(assert (=> b!133664 (= lt!206840 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6102 lt!206848) (_2!6102 lt!206855)))))

(declare-fun e!88657 () Bool)

(assert (=> b!133664 e!88657))

(declare-fun res!111041 () Bool)

(assert (=> b!133664 (=> (not res!111041) (not e!88657))))

(assert (=> b!133664 (= res!111041 (= (size!2774 (buf!3157 (_2!6102 lt!206848))) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4812 array!6129 (_ BitVec 32) (_ BitVec 32)) tuple2!11582)

(assert (=> b!133664 (= lt!206855 (appendByteArrayLoop!0 (_2!6102 lt!206848) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!133664 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206850)))

(assert (=> b!133664 (= lt!206850 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!206854 () Unit!8283)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4812 BitStream!4812 (_ BitVec 64) (_ BitVec 32)) Unit!8283)

(assert (=> b!133664 (= lt!206854 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6102 lt!206848) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!133664 e!88659))

(declare-fun res!111047 () Bool)

(assert (=> b!133664 (=> (not res!111047) (not e!88659))))

(assert (=> b!133664 (= res!111047 (= (size!2774 (buf!3157 thiss!1634)) (size!2774 (buf!3157 (_2!6102 lt!206848)))))))

(declare-fun appendByte!0 (BitStream!4812 (_ BitVec 8)) tuple2!11582)

(assert (=> b!133664 (= lt!206848 (appendByte!0 thiss!1634 (select (arr!3424 arr!237) from!447)))))

(declare-fun b!133665 () Bool)

(assert (=> b!133665 (= e!88654 (= (_2!6100 lt!206838) (_2!6100 lt!206853)))))

(declare-fun b!133666 () Bool)

(declare-fun res!111048 () Bool)

(assert (=> b!133666 (=> (not res!111048) (not e!88659))))

(assert (=> b!133666 (= res!111048 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))))

(declare-fun b!133667 () Bool)

(assert (=> b!133667 (= e!88660 (not e!88652))))

(declare-fun res!111038 () Bool)

(assert (=> b!133667 (=> res!111038 e!88652)))

(declare-fun lt!206834 () tuple2!11580)

(assert (=> b!133667 (= res!111038 (or (not (= (size!2774 (_2!6103 lt!206832)) (size!2774 arr!237))) (not (= (_1!6103 lt!206832) (_2!6101 lt!206834)))))))

(assert (=> b!133667 (= lt!206832 (readByteArrayLoopPure!0 (_1!6101 lt!206834) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206845 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!133667 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206845)))

(declare-fun lt!206851 () Unit!8283)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4812 array!6129 (_ BitVec 64)) Unit!8283)

(assert (=> b!133667 (= lt!206851 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!206855)) lt!206845))))

(assert (=> b!133667 (= lt!206834 (reader!0 (_2!6102 lt!206848) (_2!6102 lt!206855)))))

(declare-fun b!133668 () Bool)

(declare-fun res!111050 () Bool)

(assert (=> b!133668 (=> (not res!111050) (not e!88659))))

(assert (=> b!133668 (= res!111050 (isPrefixOf!0 thiss!1634 (_2!6102 lt!206848)))))

(declare-fun res!111044 () Bool)

(assert (=> start!26144 (=> (not res!111044) (not e!88651))))

(assert (=> start!26144 (= res!111044 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2774 arr!237))))))

(assert (=> start!26144 e!88651))

(assert (=> start!26144 true))

(assert (=> start!26144 (array_inv!2563 arr!237)))

(declare-fun inv!12 (BitStream!4812) Bool)

(assert (=> start!26144 (and (inv!12 thiss!1634) e!88656)))

(declare-fun b!133669 () Bool)

(assert (=> b!133669 (= e!88658 (invariant!0 (currentBit!5943 thiss!1634) (currentByte!5948 thiss!1634) (size!2774 (buf!3157 (_2!6102 lt!206848)))))))

(declare-fun b!133670 () Bool)

(assert (=> b!133670 (= e!88657 e!88660)))

(declare-fun res!111046 () Bool)

(assert (=> b!133670 (=> (not res!111046) (not e!88660))))

(assert (=> b!133670 (= res!111046 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855))) (bvadd (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!206845))))))

(assert (=> b!133670 (= lt!206845 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!26144 res!111044) b!133662))

(assert (= (and b!133662 res!111039) b!133661))

(assert (= (and b!133661 res!111049) b!133658))

(assert (= (and b!133658 res!111045) b!133664))

(assert (= (and b!133664 res!111047) b!133666))

(assert (= (and b!133666 res!111048) b!133668))

(assert (= (and b!133668 res!111050) b!133657))

(assert (= (and b!133664 res!111041) b!133670))

(assert (= (and b!133670 res!111046) b!133663))

(assert (= (and b!133663 res!111042) b!133667))

(assert (= (and b!133667 (not res!111038)) b!133659))

(assert (= (and b!133664 res!111043) b!133669))

(assert (= (and b!133664 res!111040) b!133665))

(assert (= start!26144 b!133660))

(declare-fun m!202755 () Bool)

(assert (=> b!133657 m!202755))

(declare-fun m!202757 () Bool)

(assert (=> b!133657 m!202757))

(declare-fun m!202759 () Bool)

(assert (=> b!133657 m!202759))

(declare-fun m!202761 () Bool)

(assert (=> b!133668 m!202761))

(declare-fun m!202763 () Bool)

(assert (=> b!133663 m!202763))

(declare-fun m!202765 () Bool)

(assert (=> b!133667 m!202765))

(declare-fun m!202767 () Bool)

(assert (=> b!133667 m!202767))

(declare-fun m!202769 () Bool)

(assert (=> b!133667 m!202769))

(declare-fun m!202771 () Bool)

(assert (=> b!133667 m!202771))

(declare-fun m!202773 () Bool)

(assert (=> b!133669 m!202773))

(declare-fun m!202775 () Bool)

(assert (=> b!133662 m!202775))

(declare-fun m!202777 () Bool)

(assert (=> b!133664 m!202777))

(declare-fun m!202779 () Bool)

(assert (=> b!133664 m!202779))

(declare-fun m!202781 () Bool)

(assert (=> b!133664 m!202781))

(declare-fun m!202783 () Bool)

(assert (=> b!133664 m!202783))

(declare-fun m!202785 () Bool)

(assert (=> b!133664 m!202785))

(declare-fun m!202787 () Bool)

(assert (=> b!133664 m!202787))

(declare-fun m!202789 () Bool)

(assert (=> b!133664 m!202789))

(declare-fun m!202791 () Bool)

(assert (=> b!133664 m!202791))

(declare-fun m!202793 () Bool)

(assert (=> b!133664 m!202793))

(declare-fun m!202795 () Bool)

(assert (=> b!133664 m!202795))

(declare-fun m!202797 () Bool)

(assert (=> b!133664 m!202797))

(declare-fun m!202799 () Bool)

(assert (=> b!133664 m!202799))

(declare-fun m!202801 () Bool)

(assert (=> b!133664 m!202801))

(declare-fun m!202803 () Bool)

(assert (=> b!133664 m!202803))

(declare-fun m!202805 () Bool)

(assert (=> b!133664 m!202805))

(assert (=> b!133664 m!202787))

(assert (=> b!133664 m!202771))

(declare-fun m!202807 () Bool)

(assert (=> b!133664 m!202807))

(declare-fun m!202809 () Bool)

(assert (=> b!133664 m!202809))

(declare-fun m!202811 () Bool)

(assert (=> b!133664 m!202811))

(declare-fun m!202813 () Bool)

(assert (=> b!133664 m!202813))

(declare-fun m!202815 () Bool)

(assert (=> b!133664 m!202815))

(declare-fun m!202817 () Bool)

(assert (=> b!133664 m!202817))

(assert (=> b!133664 m!202755))

(declare-fun m!202819 () Bool)

(assert (=> b!133664 m!202819))

(declare-fun m!202821 () Bool)

(assert (=> b!133664 m!202821))

(declare-fun m!202823 () Bool)

(assert (=> b!133664 m!202823))

(assert (=> b!133664 m!202755))

(declare-fun m!202825 () Bool)

(assert (=> b!133670 m!202825))

(declare-fun m!202827 () Bool)

(assert (=> b!133670 m!202827))

(declare-fun m!202829 () Bool)

(assert (=> b!133659 m!202829))

(declare-fun m!202831 () Bool)

(assert (=> start!26144 m!202831))

(declare-fun m!202833 () Bool)

(assert (=> start!26144 m!202833))

(declare-fun m!202835 () Bool)

(assert (=> b!133660 m!202835))

(declare-fun m!202837 () Bool)

(assert (=> b!133658 m!202837))

(assert (=> b!133666 m!202827))

(declare-fun m!202839 () Bool)

(assert (=> b!133666 m!202839))

(check-sat (not b!133659) (not b!133657) (not b!133658) (not b!133664) (not start!26144) (not b!133663) (not b!133660) (not b!133668) (not b!133669) (not b!133662) (not b!133666) (not b!133667) (not b!133670))
(check-sat)
(get-model)

(declare-fun d!42952 () Bool)

(assert (=> d!42952 (= (array_inv!2563 arr!237) (bvsge (size!2774 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26144 d!42952))

(declare-fun d!42954 () Bool)

(assert (=> d!42954 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5943 thiss!1634) (currentByte!5948 thiss!1634) (size!2774 (buf!3157 thiss!1634))))))

(declare-fun bs!10480 () Bool)

(assert (= bs!10480 d!42954))

(assert (=> bs!10480 m!202837))

(assert (=> start!26144 d!42954))

(declare-fun d!42956 () Bool)

(declare-fun res!111258 () Bool)

(declare-fun e!88801 () Bool)

(assert (=> d!42956 (=> res!111258 e!88801)))

(assert (=> d!42956 (= res!111258 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42956 (= (arrayRangesEq!177 (_2!6103 lt!206841) (_2!6103 lt!206849) #b00000000000000000000000000000000 to!404) e!88801)))

(declare-fun b!133901 () Bool)

(declare-fun e!88802 () Bool)

(assert (=> b!133901 (= e!88801 e!88802)))

(declare-fun res!111259 () Bool)

(assert (=> b!133901 (=> (not res!111259) (not e!88802))))

(assert (=> b!133901 (= res!111259 (= (select (arr!3424 (_2!6103 lt!206841)) #b00000000000000000000000000000000) (select (arr!3424 (_2!6103 lt!206849)) #b00000000000000000000000000000000)))))

(declare-fun b!133902 () Bool)

(assert (=> b!133902 (= e!88802 (arrayRangesEq!177 (_2!6103 lt!206841) (_2!6103 lt!206849) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42956 (not res!111258)) b!133901))

(assert (= (and b!133901 res!111259) b!133902))

(declare-fun m!203315 () Bool)

(assert (=> b!133901 m!203315))

(declare-fun m!203317 () Bool)

(assert (=> b!133901 m!203317))

(declare-fun m!203319 () Bool)

(assert (=> b!133902 m!203319))

(assert (=> b!133664 d!42956))

(declare-fun d!42958 () Bool)

(declare-fun e!88811 () Bool)

(assert (=> d!42958 e!88811))

(declare-fun res!111271 () Bool)

(assert (=> d!42958 (=> (not res!111271) (not e!88811))))

(declare-fun lt!207428 () tuple2!11582)

(assert (=> d!42958 (= res!111271 (= (size!2774 (buf!3157 (_2!6102 lt!206848))) (size!2774 (buf!3157 (_2!6102 lt!207428)))))))

(declare-fun choose!64 (BitStream!4812 array!6129 (_ BitVec 32) (_ BitVec 32)) tuple2!11582)

(assert (=> d!42958 (= lt!207428 (choose!64 (_2!6102 lt!206848) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42958 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2774 arr!237)))))

(assert (=> d!42958 (= (appendByteArrayLoop!0 (_2!6102 lt!206848) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!207428)))

(declare-fun b!133913 () Bool)

(declare-fun e!88809 () Bool)

(assert (=> b!133913 (= e!88811 e!88809)))

(declare-fun res!111274 () Bool)

(assert (=> b!133913 (=> (not res!111274) (not e!88809))))

(declare-fun lt!207433 () tuple2!11584)

(declare-fun lt!207429 () tuple2!11580)

(assert (=> b!133913 (= res!111274 (and (= (size!2774 (_2!6103 lt!207433)) (size!2774 arr!237)) (= (_1!6103 lt!207433) (_2!6101 lt!207429))))))

(assert (=> b!133913 (= lt!207433 (readByteArrayLoopPure!0 (_1!6101 lt!207429) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!207435 () Unit!8283)

(declare-fun lt!207436 () Unit!8283)

(assert (=> b!133913 (= lt!207435 lt!207436)))

(declare-fun lt!207434 () (_ BitVec 64))

(assert (=> b!133913 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207428)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!207434)))

(assert (=> b!133913 (= lt!207436 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!207428)) lt!207434))))

(declare-fun e!88810 () Bool)

(assert (=> b!133913 e!88810))

(declare-fun res!111273 () Bool)

(assert (=> b!133913 (=> (not res!111273) (not e!88810))))

(assert (=> b!133913 (= res!111273 (and (= (size!2774 (buf!3157 (_2!6102 lt!206848))) (size!2774 (buf!3157 (_2!6102 lt!207428)))) (bvsge lt!207434 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133913 (= lt!207434 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133913 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133913 (= lt!207429 (reader!0 (_2!6102 lt!206848) (_2!6102 lt!207428)))))

(declare-fun b!133914 () Bool)

(assert (=> b!133914 (= e!88810 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!207434))))

(declare-fun b!133915 () Bool)

(declare-fun res!111270 () Bool)

(assert (=> b!133915 (=> (not res!111270) (not e!88811))))

(assert (=> b!133915 (= res!111270 (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!207428)))))

(declare-fun b!133916 () Bool)

(declare-fun res!111272 () Bool)

(assert (=> b!133916 (=> (not res!111272) (not e!88811))))

(declare-fun lt!207431 () (_ BitVec 64))

(declare-fun lt!207430 () (_ BitVec 64))

(assert (=> b!133916 (= res!111272 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!207428))) (currentByte!5948 (_2!6102 lt!207428)) (currentBit!5943 (_2!6102 lt!207428))) (bvadd lt!207431 lt!207430)))))

(assert (=> b!133916 (or (not (= (bvand lt!207431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207430 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207431 lt!207430) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!207432 () (_ BitVec 64))

(assert (=> b!133916 (= lt!207430 (bvmul lt!207432 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!133916 (or (= lt!207432 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207432 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207432)))))

(assert (=> b!133916 (= lt!207432 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133916 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133916 (= lt!207431 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))))))

(declare-fun b!133917 () Bool)

(assert (=> b!133917 (= e!88809 (arrayRangesEq!177 arr!237 (_2!6103 lt!207433) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!42958 res!111271) b!133916))

(assert (= (and b!133916 res!111272) b!133915))

(assert (= (and b!133915 res!111270) b!133913))

(assert (= (and b!133913 res!111273) b!133914))

(assert (= (and b!133913 res!111274) b!133917))

(declare-fun m!203321 () Bool)

(assert (=> b!133917 m!203321))

(declare-fun m!203323 () Bool)

(assert (=> b!133916 m!203323))

(assert (=> b!133916 m!202827))

(declare-fun m!203325 () Bool)

(assert (=> b!133915 m!203325))

(declare-fun m!203327 () Bool)

(assert (=> b!133914 m!203327))

(declare-fun m!203329 () Bool)

(assert (=> b!133913 m!203329))

(declare-fun m!203331 () Bool)

(assert (=> b!133913 m!203331))

(declare-fun m!203333 () Bool)

(assert (=> b!133913 m!203333))

(declare-fun m!203335 () Bool)

(assert (=> b!133913 m!203335))

(declare-fun m!203337 () Bool)

(assert (=> d!42958 m!203337))

(assert (=> b!133664 d!42958))

(declare-fun d!42960 () Bool)

(assert (=> d!42960 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!207439 () Unit!8283)

(declare-fun choose!26 (BitStream!4812 array!6129 (_ BitVec 32) BitStream!4812) Unit!8283)

(assert (=> d!42960 (= lt!207439 (choose!26 thiss!1634 (buf!3157 (_2!6102 lt!206855)) (bvsub to!404 from!447) (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (=> d!42960 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3157 (_2!6102 lt!206855)) (bvsub to!404 from!447)) lt!207439)))

(declare-fun bs!10481 () Bool)

(assert (= bs!10481 d!42960))

(assert (=> bs!10481 m!202799))

(declare-fun m!203339 () Bool)

(assert (=> bs!10481 m!203339))

(assert (=> b!133664 d!42960))

(declare-fun d!42962 () Bool)

(declare-fun res!111281 () Bool)

(declare-fun e!88817 () Bool)

(assert (=> d!42962 (=> (not res!111281) (not e!88817))))

(assert (=> d!42962 (= res!111281 (= (size!2774 (buf!3157 thiss!1634)) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(assert (=> d!42962 (= (isPrefixOf!0 thiss!1634 (_2!6102 lt!206855)) e!88817)))

(declare-fun b!133924 () Bool)

(declare-fun res!111283 () Bool)

(assert (=> b!133924 (=> (not res!111283) (not e!88817))))

(assert (=> b!133924 (= res!111283 (bvsle (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855)))))))

(declare-fun b!133925 () Bool)

(declare-fun e!88816 () Bool)

(assert (=> b!133925 (= e!88817 e!88816)))

(declare-fun res!111282 () Bool)

(assert (=> b!133925 (=> res!111282 e!88816)))

(assert (=> b!133925 (= res!111282 (= (size!2774 (buf!3157 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133926 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6129 array!6129 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!133926 (= e!88816 (arrayBitRangesEq!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (= (and d!42962 res!111281) b!133924))

(assert (= (and b!133924 res!111283) b!133925))

(assert (= (and b!133925 (not res!111282)) b!133926))

(assert (=> b!133924 m!202839))

(assert (=> b!133924 m!202825))

(assert (=> b!133926 m!202839))

(assert (=> b!133926 m!202839))

(declare-fun m!203341 () Bool)

(assert (=> b!133926 m!203341))

(assert (=> b!133664 d!42962))

(declare-fun d!42964 () Bool)

(declare-datatypes ((tuple2!11598 0))(
  ( (tuple2!11599 (_1!6112 (_ BitVec 8)) (_2!6112 BitStream!4812)) )
))
(declare-fun lt!207442 () tuple2!11598)

(declare-fun readByte!0 (BitStream!4812) tuple2!11598)

(assert (=> d!42964 (= lt!207442 (readByte!0 lt!206833))))

(assert (=> d!42964 (= (readBytePure!0 lt!206833) (tuple2!11579 (_2!6112 lt!207442) (_1!6112 lt!207442)))))

(declare-fun bs!10482 () Bool)

(assert (= bs!10482 d!42964))

(declare-fun m!203343 () Bool)

(assert (=> bs!10482 m!203343))

(assert (=> b!133664 d!42964))

(declare-fun d!42966 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!42966 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10483 () Bool)

(assert (= bs!10483 d!42966))

(declare-fun m!203345 () Bool)

(assert (=> bs!10483 m!203345))

(assert (=> b!133664 d!42966))

(declare-fun d!42968 () Bool)

(declare-fun e!88820 () Bool)

(assert (=> d!42968 e!88820))

(declare-fun res!111289 () Bool)

(assert (=> d!42968 (=> (not res!111289) (not e!88820))))

(declare-fun lt!207459 () (_ BitVec 64))

(declare-fun lt!207457 () (_ BitVec 64))

(declare-fun lt!207460 () (_ BitVec 64))

(assert (=> d!42968 (= res!111289 (= lt!207459 (bvsub lt!207457 lt!207460)))))

(assert (=> d!42968 (or (= (bvand lt!207457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207460 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207457 lt!207460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42968 (= lt!207460 (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206853)))) ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!206853))) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!206853)))))))

(declare-fun lt!207458 () (_ BitVec 64))

(declare-fun lt!207455 () (_ BitVec 64))

(assert (=> d!42968 (= lt!207457 (bvmul lt!207458 lt!207455))))

(assert (=> d!42968 (or (= lt!207458 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207455 (bvsdiv (bvmul lt!207458 lt!207455) lt!207458)))))

(assert (=> d!42968 (= lt!207455 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42968 (= lt!207458 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206853)))))))

(assert (=> d!42968 (= lt!207459 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!206853))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!206853)))))))

(assert (=> d!42968 (invariant!0 (currentBit!5943 (_1!6100 lt!206853)) (currentByte!5948 (_1!6100 lt!206853)) (size!2774 (buf!3157 (_1!6100 lt!206853))))))

(assert (=> d!42968 (= (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!206853))) (currentByte!5948 (_1!6100 lt!206853)) (currentBit!5943 (_1!6100 lt!206853))) lt!207459)))

(declare-fun b!133931 () Bool)

(declare-fun res!111288 () Bool)

(assert (=> b!133931 (=> (not res!111288) (not e!88820))))

(assert (=> b!133931 (= res!111288 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207459))))

(declare-fun b!133932 () Bool)

(declare-fun lt!207456 () (_ BitVec 64))

(assert (=> b!133932 (= e!88820 (bvsle lt!207459 (bvmul lt!207456 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133932 (or (= lt!207456 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207456 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207456)))))

(assert (=> b!133932 (= lt!207456 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206853)))))))

(assert (= (and d!42968 res!111289) b!133931))

(assert (= (and b!133931 res!111288) b!133932))

(declare-fun m!203347 () Bool)

(assert (=> d!42968 m!203347))

(declare-fun m!203349 () Bool)

(assert (=> d!42968 m!203349))

(assert (=> b!133664 d!42968))

(declare-fun d!42970 () Bool)

(declare-fun e!88823 () Bool)

(assert (=> d!42970 e!88823))

(declare-fun res!111292 () Bool)

(assert (=> d!42970 (=> (not res!111292) (not e!88823))))

(declare-fun lt!207472 () tuple2!11578)

(declare-fun lt!207471 () tuple2!11578)

(assert (=> d!42970 (= res!111292 (= (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!207472))) (currentByte!5948 (_1!6100 lt!207472)) (currentBit!5943 (_1!6100 lt!207472))) (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!207471))) (currentByte!5948 (_1!6100 lt!207471)) (currentBit!5943 (_1!6100 lt!207471)))))))

(declare-fun lt!207469 () Unit!8283)

(declare-fun lt!207470 () BitStream!4812)

(declare-fun choose!14 (BitStream!4812 BitStream!4812 BitStream!4812 tuple2!11578 tuple2!11578 BitStream!4812 (_ BitVec 8) tuple2!11578 tuple2!11578 BitStream!4812 (_ BitVec 8)) Unit!8283)

(assert (=> d!42970 (= lt!207469 (choose!14 lt!206833 (_2!6102 lt!206855) lt!207470 lt!207472 (tuple2!11579 (_1!6100 lt!207472) (_2!6100 lt!207472)) (_1!6100 lt!207472) (_2!6100 lt!207472) lt!207471 (tuple2!11579 (_1!6100 lt!207471) (_2!6100 lt!207471)) (_1!6100 lt!207471) (_2!6100 lt!207471)))))

(assert (=> d!42970 (= lt!207471 (readBytePure!0 lt!207470))))

(assert (=> d!42970 (= lt!207472 (readBytePure!0 lt!206833))))

(assert (=> d!42970 (= lt!207470 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 lt!206833) (currentBit!5943 lt!206833)))))

(assert (=> d!42970 (= (readBytePrefixLemma!0 lt!206833 (_2!6102 lt!206855)) lt!207469)))

(declare-fun b!133935 () Bool)

(assert (=> b!133935 (= e!88823 (= (_2!6100 lt!207472) (_2!6100 lt!207471)))))

(assert (= (and d!42970 res!111292) b!133935))

(declare-fun m!203351 () Bool)

(assert (=> d!42970 m!203351))

(assert (=> d!42970 m!202823))

(declare-fun m!203353 () Bool)

(assert (=> d!42970 m!203353))

(declare-fun m!203355 () Bool)

(assert (=> d!42970 m!203355))

(declare-fun m!203357 () Bool)

(assert (=> d!42970 m!203357))

(assert (=> b!133664 d!42970))

(declare-fun d!42972 () Bool)

(assert (=> d!42972 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206850) (bvsle ((_ sign_extend 32) lt!206850) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10484 () Bool)

(assert (= bs!10484 d!42972))

(declare-fun m!203359 () Bool)

(assert (=> bs!10484 m!203359))

(assert (=> b!133664 d!42972))

(declare-fun d!42974 () Bool)

(declare-datatypes ((tuple3!512 0))(
  ( (tuple3!513 (_1!6113 Unit!8283) (_2!6113 BitStream!4812) (_3!313 array!6129)) )
))
(declare-fun lt!207475 () tuple3!512)

(declare-fun readByteArrayLoop!0 (BitStream!4812 array!6129 (_ BitVec 32) (_ BitVec 32)) tuple3!512)

(assert (=> d!42974 (= lt!207475 (readByteArrayLoop!0 (_1!6101 lt!206842) lt!206847 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42974 (= (readByteArrayLoopPure!0 (_1!6101 lt!206842) lt!206847 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11585 (_2!6113 lt!207475) (_3!313 lt!207475)))))

(declare-fun bs!10485 () Bool)

(assert (= bs!10485 d!42974))

(declare-fun m!203361 () Bool)

(assert (=> bs!10485 m!203361))

(assert (=> b!133664 d!42974))

(declare-fun d!42976 () Bool)

(declare-fun lt!207476 () tuple2!11598)

(assert (=> d!42976 (= lt!207476 (readByte!0 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (=> d!42976 (= (readBytePure!0 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) (tuple2!11579 (_2!6112 lt!207476) (_1!6112 lt!207476)))))

(declare-fun bs!10486 () Bool)

(assert (= bs!10486 d!42976))

(declare-fun m!203363 () Bool)

(assert (=> bs!10486 m!203363))

(assert (=> b!133664 d!42976))

(declare-fun d!42978 () Bool)

(declare-fun lt!207485 () tuple2!11584)

(declare-fun lt!207487 () tuple2!11584)

(assert (=> d!42978 (arrayRangesEq!177 (_2!6103 lt!207485) (_2!6103 lt!207487) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!207486 () BitStream!4812)

(declare-fun lt!207488 () Unit!8283)

(declare-fun choose!35 (BitStream!4812 array!6129 (_ BitVec 32) (_ BitVec 32) tuple2!11584 array!6129 BitStream!4812 tuple2!11584 array!6129) Unit!8283)

(assert (=> d!42978 (= lt!207488 (choose!35 (_1!6101 lt!206843) arr!237 from!447 to!404 lt!207485 (_2!6103 lt!207485) lt!207486 lt!207487 (_2!6103 lt!207487)))))

(assert (=> d!42978 (= lt!207487 (readByteArrayLoopPure!0 lt!207486 (array!6130 (store (arr!3424 arr!237) from!447 (_2!6100 (readBytePure!0 (_1!6101 lt!206843)))) (size!2774 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42978 (= lt!207486 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001))))

(assert (=> d!42978 (= lt!207485 (readByteArrayLoopPure!0 (_1!6101 lt!206843) arr!237 from!447 to!404))))

(assert (=> d!42978 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6101 lt!206843) arr!237 from!447 to!404) lt!207488)))

(declare-fun bs!10488 () Bool)

(assert (= bs!10488 d!42978))

(declare-fun m!203365 () Bool)

(assert (=> bs!10488 m!203365))

(assert (=> bs!10488 m!202787))

(assert (=> bs!10488 m!202779))

(assert (=> bs!10488 m!202785))

(declare-fun m!203367 () Bool)

(assert (=> bs!10488 m!203367))

(declare-fun m!203369 () Bool)

(assert (=> bs!10488 m!203369))

(declare-fun m!203371 () Bool)

(assert (=> bs!10488 m!203371))

(assert (=> b!133664 d!42978))

(declare-fun lt!207489 () tuple3!512)

(declare-fun d!42980 () Bool)

(assert (=> d!42980 (= lt!207489 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001) lt!206847 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42980 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001) lt!206847 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11585 (_2!6113 lt!207489) (_3!313 lt!207489)))))

(declare-fun bs!10489 () Bool)

(assert (= bs!10489 d!42980))

(assert (=> bs!10489 m!202787))

(declare-fun m!203373 () Bool)

(assert (=> bs!10489 m!203373))

(assert (=> b!133664 d!42980))

(declare-fun d!42982 () Bool)

(assert (=> d!42982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206850)))

(declare-fun lt!207490 () Unit!8283)

(assert (=> d!42982 (= lt!207490 (choose!26 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!206855)) lt!206850 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(assert (=> d!42982 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!206855)) lt!206850) lt!207490)))

(declare-fun bs!10490 () Bool)

(assert (= bs!10490 d!42982))

(assert (=> bs!10490 m!202811))

(declare-fun m!203375 () Bool)

(assert (=> bs!10490 m!203375))

(assert (=> b!133664 d!42982))

(declare-fun d!42984 () Bool)

(declare-fun e!88828 () Bool)

(assert (=> d!42984 e!88828))

(declare-fun res!111299 () Bool)

(assert (=> d!42984 (=> (not res!111299) (not e!88828))))

(declare-fun lt!207531 () tuple2!11580)

(assert (=> d!42984 (= res!111299 (isPrefixOf!0 (_1!6101 lt!207531) (_2!6101 lt!207531)))))

(declare-fun lt!207533 () BitStream!4812)

(assert (=> d!42984 (= lt!207531 (tuple2!11581 lt!207533 (_2!6102 lt!206855)))))

(declare-fun lt!207549 () Unit!8283)

(declare-fun lt!207538 () Unit!8283)

(assert (=> d!42984 (= lt!207549 lt!207538)))

(assert (=> d!42984 (isPrefixOf!0 lt!207533 (_2!6102 lt!206855))))

(assert (=> d!42984 (= lt!207538 (lemmaIsPrefixTransitive!0 lt!207533 (_2!6102 lt!206855) (_2!6102 lt!206855)))))

(declare-fun lt!207540 () Unit!8283)

(declare-fun lt!207535 () Unit!8283)

(assert (=> d!42984 (= lt!207540 lt!207535)))

(assert (=> d!42984 (isPrefixOf!0 lt!207533 (_2!6102 lt!206855))))

(assert (=> d!42984 (= lt!207535 (lemmaIsPrefixTransitive!0 lt!207533 thiss!1634 (_2!6102 lt!206855)))))

(declare-fun lt!207548 () Unit!8283)

(declare-fun e!88829 () Unit!8283)

(assert (=> d!42984 (= lt!207548 e!88829)))

(declare-fun c!7644 () Bool)

(assert (=> d!42984 (= c!7644 (not (= (size!2774 (buf!3157 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!207546 () Unit!8283)

(declare-fun lt!207536 () Unit!8283)

(assert (=> d!42984 (= lt!207546 lt!207536)))

(assert (=> d!42984 (isPrefixOf!0 (_2!6102 lt!206855) (_2!6102 lt!206855))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4812) Unit!8283)

(assert (=> d!42984 (= lt!207536 (lemmaIsPrefixRefl!0 (_2!6102 lt!206855)))))

(declare-fun lt!207550 () Unit!8283)

(declare-fun lt!207545 () Unit!8283)

(assert (=> d!42984 (= lt!207550 lt!207545)))

(assert (=> d!42984 (= lt!207545 (lemmaIsPrefixRefl!0 (_2!6102 lt!206855)))))

(declare-fun lt!207537 () Unit!8283)

(declare-fun lt!207547 () Unit!8283)

(assert (=> d!42984 (= lt!207537 lt!207547)))

(assert (=> d!42984 (isPrefixOf!0 lt!207533 lt!207533)))

(assert (=> d!42984 (= lt!207547 (lemmaIsPrefixRefl!0 lt!207533))))

(declare-fun lt!207541 () Unit!8283)

(declare-fun lt!207532 () Unit!8283)

(assert (=> d!42984 (= lt!207541 lt!207532)))

(assert (=> d!42984 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42984 (= lt!207532 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42984 (= lt!207533 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(assert (=> d!42984 (isPrefixOf!0 thiss!1634 (_2!6102 lt!206855))))

(assert (=> d!42984 (= (reader!0 thiss!1634 (_2!6102 lt!206855)) lt!207531)))

(declare-fun b!133946 () Bool)

(declare-fun lt!207544 () Unit!8283)

(assert (=> b!133946 (= e!88829 lt!207544)))

(declare-fun lt!207534 () (_ BitVec 64))

(assert (=> b!133946 (= lt!207534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207543 () (_ BitVec 64))

(assert (=> b!133946 (= lt!207543 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6129 array!6129 (_ BitVec 64) (_ BitVec 64)) Unit!8283)

(assert (=> b!133946 (= lt!207544 (arrayBitRangesEqSymmetric!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206855)) lt!207534 lt!207543))))

(assert (=> b!133946 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206855)) (buf!3157 thiss!1634) lt!207534 lt!207543)))

(declare-fun b!133947 () Bool)

(declare-fun res!111300 () Bool)

(assert (=> b!133947 (=> (not res!111300) (not e!88828))))

(assert (=> b!133947 (= res!111300 (isPrefixOf!0 (_1!6101 lt!207531) thiss!1634))))

(declare-fun b!133948 () Bool)

(declare-fun res!111301 () Bool)

(assert (=> b!133948 (=> (not res!111301) (not e!88828))))

(assert (=> b!133948 (= res!111301 (isPrefixOf!0 (_2!6101 lt!207531) (_2!6102 lt!206855)))))

(declare-fun b!133949 () Bool)

(declare-fun lt!207539 () (_ BitVec 64))

(declare-fun lt!207542 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4812 (_ BitVec 64)) BitStream!4812)

(assert (=> b!133949 (= e!88828 (= (_1!6101 lt!207531) (withMovedBitIndex!0 (_2!6101 lt!207531) (bvsub lt!207542 lt!207539))))))

(assert (=> b!133949 (or (= (bvand lt!207542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207542 lt!207539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133949 (= lt!207539 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855))))))

(assert (=> b!133949 (= lt!207542 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(declare-fun b!133950 () Bool)

(declare-fun Unit!8293 () Unit!8283)

(assert (=> b!133950 (= e!88829 Unit!8293)))

(assert (= (and d!42984 c!7644) b!133946))

(assert (= (and d!42984 (not c!7644)) b!133950))

(assert (= (and d!42984 res!111299) b!133947))

(assert (= (and b!133947 res!111300) b!133948))

(assert (= (and b!133948 res!111301) b!133949))

(declare-fun m!203377 () Bool)

(assert (=> d!42984 m!203377))

(declare-fun m!203379 () Bool)

(assert (=> d!42984 m!203379))

(declare-fun m!203381 () Bool)

(assert (=> d!42984 m!203381))

(declare-fun m!203383 () Bool)

(assert (=> d!42984 m!203383))

(declare-fun m!203385 () Bool)

(assert (=> d!42984 m!203385))

(declare-fun m!203387 () Bool)

(assert (=> d!42984 m!203387))

(declare-fun m!203389 () Bool)

(assert (=> d!42984 m!203389))

(declare-fun m!203391 () Bool)

(assert (=> d!42984 m!203391))

(assert (=> d!42984 m!202777))

(declare-fun m!203393 () Bool)

(assert (=> d!42984 m!203393))

(declare-fun m!203395 () Bool)

(assert (=> d!42984 m!203395))

(declare-fun m!203397 () Bool)

(assert (=> b!133947 m!203397))

(declare-fun m!203399 () Bool)

(assert (=> b!133949 m!203399))

(assert (=> b!133949 m!202825))

(assert (=> b!133949 m!202839))

(declare-fun m!203401 () Bool)

(assert (=> b!133948 m!203401))

(assert (=> b!133946 m!202839))

(declare-fun m!203403 () Bool)

(assert (=> b!133946 m!203403))

(declare-fun m!203405 () Bool)

(assert (=> b!133946 m!203405))

(assert (=> b!133664 d!42984))

(declare-fun d!42986 () Bool)

(assert (=> d!42986 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206850) (bvsle ((_ sign_extend 32) lt!206850) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10491 () Bool)

(assert (= bs!10491 d!42986))

(declare-fun m!203407 () Bool)

(assert (=> bs!10491 m!203407))

(assert (=> b!133664 d!42986))

(declare-fun d!42988 () Bool)

(declare-fun e!88830 () Bool)

(assert (=> d!42988 e!88830))

(declare-fun res!111303 () Bool)

(assert (=> d!42988 (=> (not res!111303) (not e!88830))))

(declare-fun lt!207553 () (_ BitVec 64))

(declare-fun lt!207555 () (_ BitVec 64))

(declare-fun lt!207556 () (_ BitVec 64))

(assert (=> d!42988 (= res!111303 (= lt!207555 (bvsub lt!207553 lt!207556)))))

(assert (=> d!42988 (or (= (bvand lt!207553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207553 lt!207556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42988 (= lt!207556 (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206838)))) ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!206838))) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!206838)))))))

(declare-fun lt!207554 () (_ BitVec 64))

(declare-fun lt!207551 () (_ BitVec 64))

(assert (=> d!42988 (= lt!207553 (bvmul lt!207554 lt!207551))))

(assert (=> d!42988 (or (= lt!207554 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207551 (bvsdiv (bvmul lt!207554 lt!207551) lt!207554)))))

(assert (=> d!42988 (= lt!207551 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42988 (= lt!207554 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206838)))))))

(assert (=> d!42988 (= lt!207555 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!206838))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!206838)))))))

(assert (=> d!42988 (invariant!0 (currentBit!5943 (_1!6100 lt!206838)) (currentByte!5948 (_1!6100 lt!206838)) (size!2774 (buf!3157 (_1!6100 lt!206838))))))

(assert (=> d!42988 (= (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!206838))) (currentByte!5948 (_1!6100 lt!206838)) (currentBit!5943 (_1!6100 lt!206838))) lt!207555)))

(declare-fun b!133951 () Bool)

(declare-fun res!111302 () Bool)

(assert (=> b!133951 (=> (not res!111302) (not e!88830))))

(assert (=> b!133951 (= res!111302 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207555))))

(declare-fun b!133952 () Bool)

(declare-fun lt!207552 () (_ BitVec 64))

(assert (=> b!133952 (= e!88830 (bvsle lt!207555 (bvmul lt!207552 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133952 (or (= lt!207552 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207552 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207552)))))

(assert (=> b!133952 (= lt!207552 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206838)))))))

(assert (= (and d!42988 res!111303) b!133951))

(assert (= (and b!133951 res!111302) b!133952))

(declare-fun m!203409 () Bool)

(assert (=> d!42988 m!203409))

(declare-fun m!203411 () Bool)

(assert (=> d!42988 m!203411))

(assert (=> b!133664 d!42988))

(declare-fun lt!207557 () tuple3!512)

(declare-fun d!42990 () Bool)

(assert (=> d!42990 (= lt!207557 (readByteArrayLoop!0 (_1!6101 lt!206843) arr!237 from!447 to!404))))

(assert (=> d!42990 (= (readByteArrayLoopPure!0 (_1!6101 lt!206843) arr!237 from!447 to!404) (tuple2!11585 (_2!6113 lt!207557) (_3!313 lt!207557)))))

(declare-fun bs!10492 () Bool)

(assert (= bs!10492 d!42990))

(declare-fun m!203413 () Bool)

(assert (=> bs!10492 m!203413))

(assert (=> b!133664 d!42990))

(declare-fun d!42992 () Bool)

(declare-fun e!88833 () Bool)

(assert (=> d!42992 e!88833))

(declare-fun res!111306 () Bool)

(assert (=> d!42992 (=> (not res!111306) (not e!88833))))

(assert (=> d!42992 (= res!111306 (and (or (let ((rhs!3120 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3120 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!42993 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!42993 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!42993 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3119 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3119 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3119) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!207565 () Unit!8283)

(declare-fun choose!57 (BitStream!4812 BitStream!4812 (_ BitVec 64) (_ BitVec 32)) Unit!8283)

(assert (=> d!42992 (= lt!207565 (choose!57 thiss!1634 (_2!6102 lt!206848) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!42992 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6102 lt!206848) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!207565)))

(declare-fun lt!207566 () (_ BitVec 32))

(declare-fun b!133955 () Bool)

(assert (=> b!133955 (= e!88833 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) (bvsub (bvsub to!404 from!447) lt!207566)))))

(assert (=> b!133955 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!207566 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!207566) #b10000000000000000000000000000000)))))

(declare-fun lt!207564 () (_ BitVec 64))

(assert (=> b!133955 (= lt!207566 ((_ extract 31 0) lt!207564))))

(assert (=> b!133955 (and (bvslt lt!207564 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!207564 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!133955 (= lt!207564 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!42992 res!111306) b!133955))

(declare-fun m!203415 () Bool)

(assert (=> d!42992 m!203415))

(declare-fun m!203417 () Bool)

(assert (=> b!133955 m!203417))

(assert (=> b!133664 d!42992))

(declare-fun d!42995 () Bool)

(declare-fun lt!207567 () tuple2!11598)

(assert (=> d!42995 (= lt!207567 (readByte!0 (_1!6101 lt!206843)))))

(assert (=> d!42995 (= (readBytePure!0 (_1!6101 lt!206843)) (tuple2!11579 (_2!6112 lt!207567) (_1!6112 lt!207567)))))

(declare-fun bs!10493 () Bool)

(assert (= bs!10493 d!42995))

(declare-fun m!203419 () Bool)

(assert (=> bs!10493 m!203419))

(assert (=> b!133664 d!42995))

(declare-fun d!42997 () Bool)

(assert (=> d!42997 (isPrefixOf!0 thiss!1634 (_2!6102 lt!206855))))

(declare-fun lt!207570 () Unit!8283)

(declare-fun choose!30 (BitStream!4812 BitStream!4812 BitStream!4812) Unit!8283)

(assert (=> d!42997 (= lt!207570 (choose!30 thiss!1634 (_2!6102 lt!206848) (_2!6102 lt!206855)))))

(assert (=> d!42997 (isPrefixOf!0 thiss!1634 (_2!6102 lt!206848))))

(assert (=> d!42997 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6102 lt!206848) (_2!6102 lt!206855)) lt!207570)))

(declare-fun bs!10494 () Bool)

(assert (= bs!10494 d!42997))

(assert (=> bs!10494 m!202777))

(declare-fun m!203421 () Bool)

(assert (=> bs!10494 m!203421))

(assert (=> bs!10494 m!202761))

(assert (=> b!133664 d!42997))

(declare-fun d!42999 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4812 (_ BitVec 32)) tuple2!11582)

(assert (=> d!42999 (= (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001) (_2!6102 (moveByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001)))))

(declare-fun bs!10495 () Bool)

(assert (= bs!10495 d!42999))

(declare-fun m!203423 () Bool)

(assert (=> bs!10495 m!203423))

(assert (=> b!133664 d!42999))

(declare-fun d!43001 () Bool)

(declare-fun e!88834 () Bool)

(assert (=> d!43001 e!88834))

(declare-fun res!111307 () Bool)

(assert (=> d!43001 (=> (not res!111307) (not e!88834))))

(declare-fun lt!207571 () tuple2!11580)

(assert (=> d!43001 (= res!111307 (isPrefixOf!0 (_1!6101 lt!207571) (_2!6101 lt!207571)))))

(declare-fun lt!207573 () BitStream!4812)

(assert (=> d!43001 (= lt!207571 (tuple2!11581 lt!207573 (_2!6102 lt!206855)))))

(declare-fun lt!207589 () Unit!8283)

(declare-fun lt!207578 () Unit!8283)

(assert (=> d!43001 (= lt!207589 lt!207578)))

(assert (=> d!43001 (isPrefixOf!0 lt!207573 (_2!6102 lt!206855))))

(assert (=> d!43001 (= lt!207578 (lemmaIsPrefixTransitive!0 lt!207573 (_2!6102 lt!206855) (_2!6102 lt!206855)))))

(declare-fun lt!207580 () Unit!8283)

(declare-fun lt!207575 () Unit!8283)

(assert (=> d!43001 (= lt!207580 lt!207575)))

(assert (=> d!43001 (isPrefixOf!0 lt!207573 (_2!6102 lt!206855))))

(assert (=> d!43001 (= lt!207575 (lemmaIsPrefixTransitive!0 lt!207573 (_2!6102 lt!206848) (_2!6102 lt!206855)))))

(declare-fun lt!207588 () Unit!8283)

(declare-fun e!88835 () Unit!8283)

(assert (=> d!43001 (= lt!207588 e!88835)))

(declare-fun c!7645 () Bool)

(assert (=> d!43001 (= c!7645 (not (= (size!2774 (buf!3157 (_2!6102 lt!206848))) #b00000000000000000000000000000000)))))

(declare-fun lt!207586 () Unit!8283)

(declare-fun lt!207576 () Unit!8283)

(assert (=> d!43001 (= lt!207586 lt!207576)))

(assert (=> d!43001 (isPrefixOf!0 (_2!6102 lt!206855) (_2!6102 lt!206855))))

(assert (=> d!43001 (= lt!207576 (lemmaIsPrefixRefl!0 (_2!6102 lt!206855)))))

(declare-fun lt!207590 () Unit!8283)

(declare-fun lt!207585 () Unit!8283)

(assert (=> d!43001 (= lt!207590 lt!207585)))

(assert (=> d!43001 (= lt!207585 (lemmaIsPrefixRefl!0 (_2!6102 lt!206855)))))

(declare-fun lt!207577 () Unit!8283)

(declare-fun lt!207587 () Unit!8283)

(assert (=> d!43001 (= lt!207577 lt!207587)))

(assert (=> d!43001 (isPrefixOf!0 lt!207573 lt!207573)))

(assert (=> d!43001 (= lt!207587 (lemmaIsPrefixRefl!0 lt!207573))))

(declare-fun lt!207581 () Unit!8283)

(declare-fun lt!207572 () Unit!8283)

(assert (=> d!43001 (= lt!207581 lt!207572)))

(assert (=> d!43001 (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!206848))))

(assert (=> d!43001 (= lt!207572 (lemmaIsPrefixRefl!0 (_2!6102 lt!206848)))))

(assert (=> d!43001 (= lt!207573 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))))))

(assert (=> d!43001 (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!206855))))

(assert (=> d!43001 (= (reader!0 (_2!6102 lt!206848) (_2!6102 lt!206855)) lt!207571)))

(declare-fun b!133956 () Bool)

(declare-fun lt!207584 () Unit!8283)

(assert (=> b!133956 (= e!88835 lt!207584)))

(declare-fun lt!207574 () (_ BitVec 64))

(assert (=> b!133956 (= lt!207574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207583 () (_ BitVec 64))

(assert (=> b!133956 (= lt!207583 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))))))

(assert (=> b!133956 (= lt!207584 (arrayBitRangesEqSymmetric!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 (_2!6102 lt!206855)) lt!207574 lt!207583))))

(assert (=> b!133956 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206855)) (buf!3157 (_2!6102 lt!206848)) lt!207574 lt!207583)))

(declare-fun b!133957 () Bool)

(declare-fun res!111308 () Bool)

(assert (=> b!133957 (=> (not res!111308) (not e!88834))))

(assert (=> b!133957 (= res!111308 (isPrefixOf!0 (_1!6101 lt!207571) (_2!6102 lt!206848)))))

(declare-fun b!133958 () Bool)

(declare-fun res!111309 () Bool)

(assert (=> b!133958 (=> (not res!111309) (not e!88834))))

(assert (=> b!133958 (= res!111309 (isPrefixOf!0 (_2!6101 lt!207571) (_2!6102 lt!206855)))))

(declare-fun lt!207582 () (_ BitVec 64))

(declare-fun b!133959 () Bool)

(declare-fun lt!207579 () (_ BitVec 64))

(assert (=> b!133959 (= e!88834 (= (_1!6101 lt!207571) (withMovedBitIndex!0 (_2!6101 lt!207571) (bvsub lt!207582 lt!207579))))))

(assert (=> b!133959 (or (= (bvand lt!207582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207582 lt!207579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133959 (= lt!207579 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855))))))

(assert (=> b!133959 (= lt!207582 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))))))

(declare-fun b!133960 () Bool)

(declare-fun Unit!8294 () Unit!8283)

(assert (=> b!133960 (= e!88835 Unit!8294)))

(assert (= (and d!43001 c!7645) b!133956))

(assert (= (and d!43001 (not c!7645)) b!133960))

(assert (= (and d!43001 res!111307) b!133957))

(assert (= (and b!133957 res!111308) b!133958))

(assert (= (and b!133958 res!111309) b!133959))

(declare-fun m!203425 () Bool)

(assert (=> d!43001 m!203425))

(declare-fun m!203427 () Bool)

(assert (=> d!43001 m!203427))

(declare-fun m!203429 () Bool)

(assert (=> d!43001 m!203429))

(assert (=> d!43001 m!203383))

(declare-fun m!203431 () Bool)

(assert (=> d!43001 m!203431))

(declare-fun m!203433 () Bool)

(assert (=> d!43001 m!203433))

(declare-fun m!203435 () Bool)

(assert (=> d!43001 m!203435))

(declare-fun m!203437 () Bool)

(assert (=> d!43001 m!203437))

(assert (=> d!43001 m!202763))

(declare-fun m!203439 () Bool)

(assert (=> d!43001 m!203439))

(assert (=> d!43001 m!203395))

(declare-fun m!203441 () Bool)

(assert (=> b!133957 m!203441))

(declare-fun m!203443 () Bool)

(assert (=> b!133959 m!203443))

(assert (=> b!133959 m!202825))

(assert (=> b!133959 m!202827))

(declare-fun m!203445 () Bool)

(assert (=> b!133958 m!203445))

(assert (=> b!133956 m!202827))

(declare-fun m!203447 () Bool)

(assert (=> b!133956 m!203447))

(declare-fun m!203449 () Bool)

(assert (=> b!133956 m!203449))

(assert (=> b!133664 d!43001))

(declare-fun d!43003 () Bool)

(declare-fun e!88838 () Bool)

(assert (=> d!43003 e!88838))

(declare-fun res!111316 () Bool)

(assert (=> d!43003 (=> (not res!111316) (not e!88838))))

(declare-fun lt!207603 () tuple2!11582)

(assert (=> d!43003 (= res!111316 (= (size!2774 (buf!3157 thiss!1634)) (size!2774 (buf!3157 (_2!6102 lt!207603)))))))

(declare-fun choose!6 (BitStream!4812 (_ BitVec 8)) tuple2!11582)

(assert (=> d!43003 (= lt!207603 (choose!6 thiss!1634 (select (arr!3424 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!43003 (validate_offset_byte!0 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634)))))

(assert (=> d!43003 (= (appendByte!0 thiss!1634 (select (arr!3424 arr!237) from!447)) lt!207603)))

(declare-fun b!133967 () Bool)

(declare-fun res!111317 () Bool)

(assert (=> b!133967 (=> (not res!111317) (not e!88838))))

(declare-fun lt!207605 () (_ BitVec 64))

(declare-fun lt!207601 () (_ BitVec 64))

(assert (=> b!133967 (= res!111317 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!207603))) (currentByte!5948 (_2!6102 lt!207603)) (currentBit!5943 (_2!6102 lt!207603))) (bvadd lt!207605 lt!207601)))))

(assert (=> b!133967 (or (not (= (bvand lt!207605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207601 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207605 lt!207601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133967 (= lt!207601 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133967 (= lt!207605 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(declare-fun b!133968 () Bool)

(declare-fun res!111318 () Bool)

(assert (=> b!133968 (=> (not res!111318) (not e!88838))))

(assert (=> b!133968 (= res!111318 (isPrefixOf!0 thiss!1634 (_2!6102 lt!207603)))))

(declare-fun lt!207604 () tuple2!11580)

(declare-fun lt!207602 () tuple2!11578)

(declare-fun b!133969 () Bool)

(assert (=> b!133969 (= e!88838 (and (= (_2!6100 lt!207602) (select (arr!3424 arr!237) from!447)) (= (_1!6100 lt!207602) (_2!6101 lt!207604))))))

(assert (=> b!133969 (= lt!207602 (readBytePure!0 (_1!6101 lt!207604)))))

(assert (=> b!133969 (= lt!207604 (reader!0 thiss!1634 (_2!6102 lt!207603)))))

(assert (= (and d!43003 res!111316) b!133967))

(assert (= (and b!133967 res!111317) b!133968))

(assert (= (and b!133968 res!111318) b!133969))

(assert (=> d!43003 m!202755))

(declare-fun m!203451 () Bool)

(assert (=> d!43003 m!203451))

(declare-fun m!203453 () Bool)

(assert (=> d!43003 m!203453))

(declare-fun m!203455 () Bool)

(assert (=> b!133967 m!203455))

(assert (=> b!133967 m!202839))

(declare-fun m!203457 () Bool)

(assert (=> b!133968 m!203457))

(declare-fun m!203459 () Bool)

(assert (=> b!133969 m!203459))

(declare-fun m!203461 () Bool)

(assert (=> b!133969 m!203461))

(assert (=> b!133664 d!43003))

(declare-fun d!43005 () Bool)

(declare-fun res!111319 () Bool)

(declare-fun e!88840 () Bool)

(assert (=> d!43005 (=> (not res!111319) (not e!88840))))

(assert (=> d!43005 (= res!111319 (= (size!2774 (buf!3157 (_2!6102 lt!206848))) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(assert (=> d!43005 (= (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!206855)) e!88840)))

(declare-fun b!133970 () Bool)

(declare-fun res!111321 () Bool)

(assert (=> b!133970 (=> (not res!111321) (not e!88840))))

(assert (=> b!133970 (= res!111321 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855)))))))

(declare-fun b!133971 () Bool)

(declare-fun e!88839 () Bool)

(assert (=> b!133971 (= e!88840 e!88839)))

(declare-fun res!111320 () Bool)

(assert (=> b!133971 (=> res!111320 e!88839)))

(assert (=> b!133971 (= res!111320 (= (size!2774 (buf!3157 (_2!6102 lt!206848))) #b00000000000000000000000000000000))))

(declare-fun b!133972 () Bool)

(assert (=> b!133972 (= e!88839 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 (_2!6102 lt!206855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(assert (= (and d!43005 res!111319) b!133970))

(assert (= (and b!133970 res!111321) b!133971))

(assert (= (and b!133971 (not res!111320)) b!133972))

(assert (=> b!133970 m!202827))

(assert (=> b!133970 m!202825))

(assert (=> b!133972 m!202827))

(assert (=> b!133972 m!202827))

(declare-fun m!203463 () Bool)

(assert (=> b!133972 m!203463))

(assert (=> b!133663 d!43005))

(declare-fun lt!207606 () tuple3!512)

(declare-fun d!43007 () Bool)

(assert (=> d!43007 (= lt!207606 (readByteArrayLoop!0 (_1!6101 lt!206834) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43007 (= (readByteArrayLoopPure!0 (_1!6101 lt!206834) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11585 (_2!6113 lt!207606) (_3!313 lt!207606)))))

(declare-fun bs!10496 () Bool)

(assert (= bs!10496 d!43007))

(declare-fun m!203465 () Bool)

(assert (=> bs!10496 m!203465))

(assert (=> b!133667 d!43007))

(declare-fun d!43009 () Bool)

(assert (=> d!43009 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206845) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))) lt!206845))))

(declare-fun bs!10497 () Bool)

(assert (= bs!10497 d!43009))

(assert (=> bs!10497 m!203407))

(assert (=> b!133667 d!43009))

(declare-fun d!43011 () Bool)

(assert (=> d!43011 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206845)))

(declare-fun lt!207609 () Unit!8283)

(declare-fun choose!9 (BitStream!4812 array!6129 (_ BitVec 64) BitStream!4812) Unit!8283)

(assert (=> d!43011 (= lt!207609 (choose!9 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!206855)) lt!206845 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(assert (=> d!43011 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!206855)) lt!206845) lt!207609)))

(declare-fun bs!10498 () Bool)

(assert (= bs!10498 d!43011))

(assert (=> bs!10498 m!202767))

(declare-fun m!203467 () Bool)

(assert (=> bs!10498 m!203467))

(assert (=> b!133667 d!43011))

(assert (=> b!133667 d!43001))

(declare-fun d!43013 () Bool)

(declare-fun e!88841 () Bool)

(assert (=> d!43013 e!88841))

(declare-fun res!111323 () Bool)

(assert (=> d!43013 (=> (not res!111323) (not e!88841))))

(declare-fun lt!207612 () (_ BitVec 64))

(declare-fun lt!207615 () (_ BitVec 64))

(declare-fun lt!207614 () (_ BitVec 64))

(assert (=> d!43013 (= res!111323 (= lt!207614 (bvsub lt!207612 lt!207615)))))

(assert (=> d!43013 (or (= (bvand lt!207612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207615 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207612 lt!207615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43013 (= lt!207615 (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))))))

(declare-fun lt!207613 () (_ BitVec 64))

(declare-fun lt!207610 () (_ BitVec 64))

(assert (=> d!43013 (= lt!207612 (bvmul lt!207613 lt!207610))))

(assert (=> d!43013 (or (= lt!207613 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207610 (bvsdiv (bvmul lt!207613 lt!207610) lt!207613)))))

(assert (=> d!43013 (= lt!207610 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43013 (= lt!207613 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))))))

(assert (=> d!43013 (= lt!207614 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))))))

(assert (=> d!43013 (invariant!0 (currentBit!5943 (_2!6102 lt!206848)) (currentByte!5948 (_2!6102 lt!206848)) (size!2774 (buf!3157 (_2!6102 lt!206848))))))

(assert (=> d!43013 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))) lt!207614)))

(declare-fun b!133973 () Bool)

(declare-fun res!111322 () Bool)

(assert (=> b!133973 (=> (not res!111322) (not e!88841))))

(assert (=> b!133973 (= res!111322 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207614))))

(declare-fun b!133974 () Bool)

(declare-fun lt!207611 () (_ BitVec 64))

(assert (=> b!133974 (= e!88841 (bvsle lt!207614 (bvmul lt!207611 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133974 (or (= lt!207611 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207611 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207611)))))

(assert (=> b!133974 (= lt!207611 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))))))

(assert (= (and d!43013 res!111323) b!133973))

(assert (= (and b!133973 res!111322) b!133974))

(assert (=> d!43013 m!203359))

(declare-fun m!203469 () Bool)

(assert (=> d!43013 m!203469))

(assert (=> b!133666 d!43013))

(declare-fun d!43015 () Bool)

(declare-fun e!88842 () Bool)

(assert (=> d!43015 e!88842))

(declare-fun res!111325 () Bool)

(assert (=> d!43015 (=> (not res!111325) (not e!88842))))

(declare-fun lt!207621 () (_ BitVec 64))

(declare-fun lt!207618 () (_ BitVec 64))

(declare-fun lt!207620 () (_ BitVec 64))

(assert (=> d!43015 (= res!111325 (= lt!207620 (bvsub lt!207618 lt!207621)))))

(assert (=> d!43015 (or (= (bvand lt!207618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207618 lt!207621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43015 (= lt!207621 (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634))))))

(declare-fun lt!207619 () (_ BitVec 64))

(declare-fun lt!207616 () (_ BitVec 64))

(assert (=> d!43015 (= lt!207618 (bvmul lt!207619 lt!207616))))

(assert (=> d!43015 (or (= lt!207619 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207616 (bvsdiv (bvmul lt!207619 lt!207616) lt!207619)))))

(assert (=> d!43015 (= lt!207616 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43015 (= lt!207619 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))))))

(assert (=> d!43015 (= lt!207620 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 thiss!1634))))))

(assert (=> d!43015 (invariant!0 (currentBit!5943 thiss!1634) (currentByte!5948 thiss!1634) (size!2774 (buf!3157 thiss!1634)))))

(assert (=> d!43015 (= (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)) lt!207620)))

(declare-fun b!133975 () Bool)

(declare-fun res!111324 () Bool)

(assert (=> b!133975 (=> (not res!111324) (not e!88842))))

(assert (=> b!133975 (= res!111324 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207620))))

(declare-fun b!133976 () Bool)

(declare-fun lt!207617 () (_ BitVec 64))

(assert (=> b!133976 (= e!88842 (bvsle lt!207620 (bvmul lt!207617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133976 (or (= lt!207617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207617)))))

(assert (=> b!133976 (= lt!207617 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))))))

(assert (= (and d!43015 res!111325) b!133975))

(assert (= (and b!133975 res!111324) b!133976))

(declare-fun m!203471 () Bool)

(assert (=> d!43015 m!203471))

(assert (=> d!43015 m!202837))

(assert (=> b!133666 d!43015))

(declare-fun d!43017 () Bool)

(declare-fun e!88843 () Bool)

(assert (=> d!43017 e!88843))

(declare-fun res!111327 () Bool)

(assert (=> d!43017 (=> (not res!111327) (not e!88843))))

(declare-fun lt!207627 () (_ BitVec 64))

(declare-fun lt!207624 () (_ BitVec 64))

(declare-fun lt!207626 () (_ BitVec 64))

(assert (=> d!43017 (= res!111327 (= lt!207626 (bvsub lt!207624 lt!207627)))))

(assert (=> d!43017 (or (= (bvand lt!207624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207624 lt!207627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43017 (= lt!207627 (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206855))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206855)))))))

(declare-fun lt!207625 () (_ BitVec 64))

(declare-fun lt!207622 () (_ BitVec 64))

(assert (=> d!43017 (= lt!207624 (bvmul lt!207625 lt!207622))))

(assert (=> d!43017 (or (= lt!207625 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207622 (bvsdiv (bvmul lt!207625 lt!207622) lt!207625)))))

(assert (=> d!43017 (= lt!207622 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43017 (= lt!207625 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(assert (=> d!43017 (= lt!207626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206855))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206855)))))))

(assert (=> d!43017 (invariant!0 (currentBit!5943 (_2!6102 lt!206855)) (currentByte!5948 (_2!6102 lt!206855)) (size!2774 (buf!3157 (_2!6102 lt!206855))))))

(assert (=> d!43017 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855))) lt!207626)))

(declare-fun b!133977 () Bool)

(declare-fun res!111326 () Bool)

(assert (=> b!133977 (=> (not res!111326) (not e!88843))))

(assert (=> b!133977 (= res!111326 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207626))))

(declare-fun b!133978 () Bool)

(declare-fun lt!207623 () (_ BitVec 64))

(assert (=> b!133978 (= e!88843 (bvsle lt!207626 (bvmul lt!207623 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133978 (or (= lt!207623 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207623 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207623)))))

(assert (=> b!133978 (= lt!207623 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(assert (= (and d!43017 res!111327) b!133977))

(assert (= (and b!133977 res!111326) b!133978))

(declare-fun m!203473 () Bool)

(assert (=> d!43017 m!203473))

(declare-fun m!203475 () Bool)

(assert (=> d!43017 m!203475))

(assert (=> b!133670 d!43017))

(assert (=> b!133670 d!43013))

(declare-fun d!43019 () Bool)

(declare-fun res!111328 () Bool)

(declare-fun e!88844 () Bool)

(assert (=> d!43019 (=> res!111328 e!88844)))

(assert (=> d!43019 (= res!111328 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43019 (= (arrayRangesEq!177 arr!237 (_2!6103 lt!206832) #b00000000000000000000000000000000 to!404) e!88844)))

(declare-fun b!133979 () Bool)

(declare-fun e!88845 () Bool)

(assert (=> b!133979 (= e!88844 e!88845)))

(declare-fun res!111329 () Bool)

(assert (=> b!133979 (=> (not res!111329) (not e!88845))))

(assert (=> b!133979 (= res!111329 (= (select (arr!3424 arr!237) #b00000000000000000000000000000000) (select (arr!3424 (_2!6103 lt!206832)) #b00000000000000000000000000000000)))))

(declare-fun b!133980 () Bool)

(assert (=> b!133980 (= e!88845 (arrayRangesEq!177 arr!237 (_2!6103 lt!206832) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43019 (not res!111328)) b!133979))

(assert (= (and b!133979 res!111329) b!133980))

(declare-fun m!203477 () Bool)

(assert (=> b!133979 m!203477))

(declare-fun m!203479 () Bool)

(assert (=> b!133979 m!203479))

(declare-fun m!203481 () Bool)

(assert (=> b!133980 m!203481))

(assert (=> b!133659 d!43019))

(declare-fun d!43021 () Bool)

(assert (=> d!43021 (= (invariant!0 (currentBit!5943 thiss!1634) (currentByte!5948 thiss!1634) (size!2774 (buf!3157 (_2!6102 lt!206848)))) (and (bvsge (currentBit!5943 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5943 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5948 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5948 thiss!1634) (size!2774 (buf!3157 (_2!6102 lt!206848)))) (and (= (currentBit!5943 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5948 thiss!1634) (size!2774 (buf!3157 (_2!6102 lt!206848))))))))))

(assert (=> b!133669 d!43021))

(declare-fun d!43023 () Bool)

(assert (=> d!43023 (= (invariant!0 (currentBit!5943 thiss!1634) (currentByte!5948 thiss!1634) (size!2774 (buf!3157 thiss!1634))) (and (bvsge (currentBit!5943 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5943 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5948 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5948 thiss!1634) (size!2774 (buf!3157 thiss!1634))) (and (= (currentBit!5943 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5948 thiss!1634) (size!2774 (buf!3157 thiss!1634)))))))))

(assert (=> b!133658 d!43023))

(declare-fun d!43025 () Bool)

(declare-fun res!111330 () Bool)

(declare-fun e!88847 () Bool)

(assert (=> d!43025 (=> (not res!111330) (not e!88847))))

(assert (=> d!43025 (= res!111330 (= (size!2774 (buf!3157 thiss!1634)) (size!2774 (buf!3157 (_2!6102 lt!206848)))))))

(assert (=> d!43025 (= (isPrefixOf!0 thiss!1634 (_2!6102 lt!206848)) e!88847)))

(declare-fun b!133981 () Bool)

(declare-fun res!111332 () Bool)

(assert (=> b!133981 (=> (not res!111332) (not e!88847))))

(assert (=> b!133981 (= res!111332 (bvsle (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(declare-fun b!133982 () Bool)

(declare-fun e!88846 () Bool)

(assert (=> b!133982 (= e!88847 e!88846)))

(declare-fun res!111331 () Bool)

(assert (=> b!133982 (=> res!111331 e!88846)))

(assert (=> b!133982 (= res!111331 (= (size!2774 (buf!3157 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133983 () Bool)

(assert (=> b!133983 (= e!88846 (arrayBitRangesEq!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206848)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (= (and d!43025 res!111330) b!133981))

(assert (= (and b!133981 res!111332) b!133982))

(assert (= (and b!133982 (not res!111331)) b!133983))

(assert (=> b!133981 m!202839))

(assert (=> b!133981 m!202827))

(assert (=> b!133983 m!202839))

(assert (=> b!133983 m!202839))

(declare-fun m!203483 () Bool)

(assert (=> b!133983 m!203483))

(assert (=> b!133668 d!43025))

(declare-fun d!43027 () Bool)

(declare-fun lt!207628 () tuple2!11598)

(assert (=> d!43027 (= lt!207628 (readByte!0 (_1!6101 lt!206839)))))

(assert (=> d!43027 (= (readBytePure!0 (_1!6101 lt!206839)) (tuple2!11579 (_2!6112 lt!207628) (_1!6112 lt!207628)))))

(declare-fun bs!10499 () Bool)

(assert (= bs!10499 d!43027))

(declare-fun m!203485 () Bool)

(assert (=> bs!10499 m!203485))

(assert (=> b!133657 d!43027))

(declare-fun d!43029 () Bool)

(declare-fun e!88848 () Bool)

(assert (=> d!43029 e!88848))

(declare-fun res!111333 () Bool)

(assert (=> d!43029 (=> (not res!111333) (not e!88848))))

(declare-fun lt!207629 () tuple2!11580)

(assert (=> d!43029 (= res!111333 (isPrefixOf!0 (_1!6101 lt!207629) (_2!6101 lt!207629)))))

(declare-fun lt!207631 () BitStream!4812)

(assert (=> d!43029 (= lt!207629 (tuple2!11581 lt!207631 (_2!6102 lt!206848)))))

(declare-fun lt!207647 () Unit!8283)

(declare-fun lt!207636 () Unit!8283)

(assert (=> d!43029 (= lt!207647 lt!207636)))

(assert (=> d!43029 (isPrefixOf!0 lt!207631 (_2!6102 lt!206848))))

(assert (=> d!43029 (= lt!207636 (lemmaIsPrefixTransitive!0 lt!207631 (_2!6102 lt!206848) (_2!6102 lt!206848)))))

(declare-fun lt!207638 () Unit!8283)

(declare-fun lt!207633 () Unit!8283)

(assert (=> d!43029 (= lt!207638 lt!207633)))

(assert (=> d!43029 (isPrefixOf!0 lt!207631 (_2!6102 lt!206848))))

(assert (=> d!43029 (= lt!207633 (lemmaIsPrefixTransitive!0 lt!207631 thiss!1634 (_2!6102 lt!206848)))))

(declare-fun lt!207646 () Unit!8283)

(declare-fun e!88849 () Unit!8283)

(assert (=> d!43029 (= lt!207646 e!88849)))

(declare-fun c!7646 () Bool)

(assert (=> d!43029 (= c!7646 (not (= (size!2774 (buf!3157 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!207644 () Unit!8283)

(declare-fun lt!207634 () Unit!8283)

(assert (=> d!43029 (= lt!207644 lt!207634)))

(assert (=> d!43029 (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!206848))))

(assert (=> d!43029 (= lt!207634 (lemmaIsPrefixRefl!0 (_2!6102 lt!206848)))))

(declare-fun lt!207648 () Unit!8283)

(declare-fun lt!207643 () Unit!8283)

(assert (=> d!43029 (= lt!207648 lt!207643)))

(assert (=> d!43029 (= lt!207643 (lemmaIsPrefixRefl!0 (_2!6102 lt!206848)))))

(declare-fun lt!207635 () Unit!8283)

(declare-fun lt!207645 () Unit!8283)

(assert (=> d!43029 (= lt!207635 lt!207645)))

(assert (=> d!43029 (isPrefixOf!0 lt!207631 lt!207631)))

(assert (=> d!43029 (= lt!207645 (lemmaIsPrefixRefl!0 lt!207631))))

(declare-fun lt!207639 () Unit!8283)

(declare-fun lt!207630 () Unit!8283)

(assert (=> d!43029 (= lt!207639 lt!207630)))

(assert (=> d!43029 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43029 (= lt!207630 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43029 (= lt!207631 (BitStream!4813 (buf!3157 (_2!6102 lt!206848)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(assert (=> d!43029 (isPrefixOf!0 thiss!1634 (_2!6102 lt!206848))))

(assert (=> d!43029 (= (reader!0 thiss!1634 (_2!6102 lt!206848)) lt!207629)))

(declare-fun b!133984 () Bool)

(declare-fun lt!207642 () Unit!8283)

(assert (=> b!133984 (= e!88849 lt!207642)))

(declare-fun lt!207632 () (_ BitVec 64))

(assert (=> b!133984 (= lt!207632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207641 () (_ BitVec 64))

(assert (=> b!133984 (= lt!207641 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(assert (=> b!133984 (= lt!207642 (arrayBitRangesEqSymmetric!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206848)) lt!207632 lt!207641))))

(assert (=> b!133984 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 thiss!1634) lt!207632 lt!207641)))

(declare-fun b!133985 () Bool)

(declare-fun res!111334 () Bool)

(assert (=> b!133985 (=> (not res!111334) (not e!88848))))

(assert (=> b!133985 (= res!111334 (isPrefixOf!0 (_1!6101 lt!207629) thiss!1634))))

(declare-fun b!133986 () Bool)

(declare-fun res!111335 () Bool)

(assert (=> b!133986 (=> (not res!111335) (not e!88848))))

(assert (=> b!133986 (= res!111335 (isPrefixOf!0 (_2!6101 lt!207629) (_2!6102 lt!206848)))))

(declare-fun b!133987 () Bool)

(declare-fun lt!207640 () (_ BitVec 64))

(declare-fun lt!207637 () (_ BitVec 64))

(assert (=> b!133987 (= e!88848 (= (_1!6101 lt!207629) (withMovedBitIndex!0 (_2!6101 lt!207629) (bvsub lt!207640 lt!207637))))))

(assert (=> b!133987 (or (= (bvand lt!207640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207637 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207640 lt!207637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133987 (= lt!207637 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))))))

(assert (=> b!133987 (= lt!207640 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(declare-fun b!133988 () Bool)

(declare-fun Unit!8295 () Unit!8283)

(assert (=> b!133988 (= e!88849 Unit!8295)))

(assert (= (and d!43029 c!7646) b!133984))

(assert (= (and d!43029 (not c!7646)) b!133988))

(assert (= (and d!43029 res!111333) b!133985))

(assert (= (and b!133985 res!111334) b!133986))

(assert (= (and b!133986 res!111335) b!133987))

(assert (=> d!43029 m!203377))

(declare-fun m!203487 () Bool)

(assert (=> d!43029 m!203487))

(declare-fun m!203489 () Bool)

(assert (=> d!43029 m!203489))

(assert (=> d!43029 m!203435))

(declare-fun m!203491 () Bool)

(assert (=> d!43029 m!203491))

(declare-fun m!203493 () Bool)

(assert (=> d!43029 m!203493))

(assert (=> d!43029 m!203389))

(declare-fun m!203495 () Bool)

(assert (=> d!43029 m!203495))

(assert (=> d!43029 m!202761))

(declare-fun m!203497 () Bool)

(assert (=> d!43029 m!203497))

(assert (=> d!43029 m!203425))

(declare-fun m!203499 () Bool)

(assert (=> b!133985 m!203499))

(declare-fun m!203501 () Bool)

(assert (=> b!133987 m!203501))

(assert (=> b!133987 m!202827))

(assert (=> b!133987 m!202839))

(declare-fun m!203503 () Bool)

(assert (=> b!133986 m!203503))

(assert (=> b!133984 m!202839))

(declare-fun m!203505 () Bool)

(assert (=> b!133984 m!203505))

(declare-fun m!203507 () Bool)

(assert (=> b!133984 m!203507))

(assert (=> b!133657 d!43029))

(declare-fun d!43031 () Bool)

(assert (=> d!43031 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10500 () Bool)

(assert (= bs!10500 d!43031))

(assert (=> bs!10500 m!203471))

(assert (=> b!133662 d!43031))

(declare-fun d!43033 () Bool)

(assert (=> d!43033 (= (array_inv!2563 (buf!3157 thiss!1634)) (bvsge (size!2774 (buf!3157 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!133660 d!43033))

(check-sat (not d!42984) (not d!43027) (not d!43009) (not b!133913) (not b!133983) (not d!42997) (not d!42990) (not d!43003) (not b!133969) (not b!133972) (not d!42974) (not d!42988) (not b!133949) (not d!42976) (not d!42958) (not b!133915) (not b!133970) (not b!133981) (not b!133916) (not d!43007) (not b!133914) (not b!133926) (not b!133959) (not d!43013) (not d!42968) (not b!133902) (not d!42986) (not d!42966) (not b!133987) (not d!42982) (not b!133956) (not d!42964) (not b!133984) (not d!42972) (not b!133947) (not b!133948) (not d!42995) (not d!42954) (not d!42980) (not b!133955) (not d!42970) (not d!42999) (not d!43015) (not b!133968) (not d!43011) (not d!42978) (not b!133917) (not b!133967) (not b!133924) (not b!133957) (not d!43017) (not d!43001) (not b!133986) (not d!42992) (not b!133946) (not d!43029) (not b!133985) (not b!133980) (not b!133958) (not d!43031) (not d!42960))
(check-sat)
(get-model)

(declare-fun d!43035 () Bool)

(assert (=> d!43035 (= (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206853)))) ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!206853))) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!206853)))) (bvsub (bvmul ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206853)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!206853))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!206853))))))))

(assert (=> d!42968 d!43035))

(declare-fun d!43037 () Bool)

(assert (=> d!43037 (= (invariant!0 (currentBit!5943 (_1!6100 lt!206853)) (currentByte!5948 (_1!6100 lt!206853)) (size!2774 (buf!3157 (_1!6100 lt!206853)))) (and (bvsge (currentBit!5943 (_1!6100 lt!206853)) #b00000000000000000000000000000000) (bvslt (currentBit!5943 (_1!6100 lt!206853)) #b00000000000000000000000000001000) (bvsge (currentByte!5948 (_1!6100 lt!206853)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5948 (_1!6100 lt!206853)) (size!2774 (buf!3157 (_1!6100 lt!206853)))) (and (= (currentBit!5943 (_1!6100 lt!206853)) #b00000000000000000000000000000000) (= (currentByte!5948 (_1!6100 lt!206853)) (size!2774 (buf!3157 (_1!6100 lt!206853))))))))))

(assert (=> d!42968 d!43037))

(declare-fun b!134003 () Bool)

(declare-fun e!88865 () Bool)

(declare-fun e!88866 () Bool)

(assert (=> b!134003 (= e!88865 e!88866)))

(declare-datatypes ((tuple4!114 0))(
  ( (tuple4!115 (_1!6114 (_ BitVec 32)) (_2!6114 (_ BitVec 32)) (_3!314 (_ BitVec 32)) (_4!57 (_ BitVec 32))) )
))
(declare-fun lt!207655 () tuple4!114)

(declare-fun res!111347 () Bool)

(declare-fun lt!207657 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134003 (= res!111347 (byteRangesEq!0 (select (arr!3424 (buf!3157 thiss!1634)) (_3!314 lt!207655)) (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_3!314 lt!207655)) lt!207657 #b00000000000000000000000000001000))))

(assert (=> b!134003 (=> (not res!111347) (not e!88866))))

(declare-fun b!134004 () Bool)

(declare-fun e!88862 () Bool)

(assert (=> b!134004 (= e!88862 e!88865)))

(declare-fun c!7649 () Bool)

(assert (=> b!134004 (= c!7649 (= (_3!314 lt!207655) (_4!57 lt!207655)))))

(declare-fun b!134005 () Bool)

(declare-fun call!1718 () Bool)

(assert (=> b!134005 (= e!88865 call!1718)))

(declare-fun d!43039 () Bool)

(declare-fun res!111349 () Bool)

(declare-fun e!88867 () Bool)

(assert (=> d!43039 (=> res!111349 e!88867)))

(assert (=> d!43039 (= res!111349 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (=> d!43039 (= (arrayBitRangesEq!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206848)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) e!88867)))

(declare-fun lt!207656 () (_ BitVec 32))

(declare-fun bm!1715 () Bool)

(assert (=> bm!1715 (= call!1718 (byteRangesEq!0 (ite c!7649 (select (arr!3424 (buf!3157 thiss!1634)) (_3!314 lt!207655)) (select (arr!3424 (buf!3157 thiss!1634)) (_4!57 lt!207655))) (ite c!7649 (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_3!314 lt!207655)) (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_4!57 lt!207655))) (ite c!7649 lt!207657 #b00000000000000000000000000000000) lt!207656))))

(declare-fun b!134006 () Bool)

(declare-fun e!88863 () Bool)

(assert (=> b!134006 (= e!88863 (arrayRangesEq!177 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206848)) (_1!6114 lt!207655) (_2!6114 lt!207655)))))

(declare-fun b!134007 () Bool)

(declare-fun e!88864 () Bool)

(assert (=> b!134007 (= e!88864 call!1718)))

(declare-fun b!134008 () Bool)

(declare-fun res!111350 () Bool)

(assert (=> b!134008 (= res!111350 (= lt!207656 #b00000000000000000000000000000000))))

(assert (=> b!134008 (=> res!111350 e!88864)))

(assert (=> b!134008 (= e!88866 e!88864)))

(declare-fun b!134009 () Bool)

(assert (=> b!134009 (= e!88867 e!88862)))

(declare-fun res!111348 () Bool)

(assert (=> b!134009 (=> (not res!111348) (not e!88862))))

(assert (=> b!134009 (= res!111348 e!88863)))

(declare-fun res!111346 () Bool)

(assert (=> b!134009 (=> res!111346 e!88863)))

(assert (=> b!134009 (= res!111346 (bvsge (_1!6114 lt!207655) (_2!6114 lt!207655)))))

(assert (=> b!134009 (= lt!207656 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134009 (= lt!207657 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!114)

(assert (=> b!134009 (= lt!207655 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (= (and d!43039 (not res!111349)) b!134009))

(assert (= (and b!134009 (not res!111346)) b!134006))

(assert (= (and b!134009 res!111348) b!134004))

(assert (= (and b!134004 c!7649) b!134005))

(assert (= (and b!134004 (not c!7649)) b!134003))

(assert (= (and b!134003 res!111347) b!134008))

(assert (= (and b!134008 (not res!111350)) b!134007))

(assert (= (or b!134005 b!134007) bm!1715))

(declare-fun m!203509 () Bool)

(assert (=> b!134003 m!203509))

(declare-fun m!203511 () Bool)

(assert (=> b!134003 m!203511))

(assert (=> b!134003 m!203509))

(assert (=> b!134003 m!203511))

(declare-fun m!203513 () Bool)

(assert (=> b!134003 m!203513))

(declare-fun m!203515 () Bool)

(assert (=> bm!1715 m!203515))

(declare-fun m!203517 () Bool)

(assert (=> bm!1715 m!203517))

(declare-fun m!203519 () Bool)

(assert (=> bm!1715 m!203519))

(assert (=> bm!1715 m!203511))

(assert (=> bm!1715 m!203509))

(declare-fun m!203521 () Bool)

(assert (=> b!134006 m!203521))

(assert (=> b!134009 m!202839))

(declare-fun m!203523 () Bool)

(assert (=> b!134009 m!203523))

(assert (=> b!133983 d!43039))

(assert (=> b!133983 d!43015))

(declare-fun lt!207761 () tuple3!512)

(declare-fun e!88874 () Bool)

(declare-fun b!134020 () Bool)

(assert (=> b!134020 (= e!88874 (= (select (arr!3424 (_3!313 lt!207761)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6100 (readBytePure!0 (_1!6101 lt!206842)))))))

(assert (=> b!134020 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2774 (_3!313 lt!207761))))))

(declare-fun e!88876 () Bool)

(declare-fun b!134021 () Bool)

(assert (=> b!134021 (= e!88876 (arrayRangesEq!177 lt!206847 (_3!313 lt!207761) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!134022 () Bool)

(declare-fun e!88875 () tuple3!512)

(declare-fun lt!207765 () Unit!8283)

(declare-fun lt!207762 () tuple3!512)

(assert (=> b!134022 (= e!88875 (tuple3!513 lt!207765 (_2!6113 lt!207762) (_3!313 lt!207762)))))

(declare-fun lt!207736 () tuple2!11598)

(assert (=> b!134022 (= lt!207736 (readByte!0 (_1!6101 lt!206842)))))

(declare-fun lt!207742 () array!6129)

(assert (=> b!134022 (= lt!207742 (array!6130 (store (arr!3424 lt!206847) (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207736)) (size!2774 lt!206847)))))

(declare-fun lt!207763 () (_ BitVec 64))

(assert (=> b!134022 (= lt!207763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!207759 () (_ BitVec 32))

(assert (=> b!134022 (= lt!207759 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!207757 () Unit!8283)

(assert (=> b!134022 (= lt!207757 (validateOffsetBytesFromBitIndexLemma!0 (_1!6101 lt!206842) (_2!6112 lt!207736) lt!207763 lt!207759))))

(assert (=> b!134022 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6112 lt!207736)))) ((_ sign_extend 32) (currentByte!5948 (_2!6112 lt!207736))) ((_ sign_extend 32) (currentBit!5943 (_2!6112 lt!207736))) (bvsub lt!207759 ((_ extract 31 0) (bvsdiv (bvadd lt!207763 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!207747 () Unit!8283)

(assert (=> b!134022 (= lt!207747 lt!207757)))

(assert (=> b!134022 (= lt!207762 (readByteArrayLoop!0 (_2!6112 lt!207736) lt!207742 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1726 () (_ BitVec 64))

(assert (=> b!134022 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207736))) (currentByte!5948 (_2!6112 lt!207736)) (currentBit!5943 (_2!6112 lt!207736))) (bvadd call!1726 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!207752 () Unit!8283)

(declare-fun Unit!8296 () Unit!8283)

(assert (=> b!134022 (= lt!207752 Unit!8296)))

(assert (=> b!134022 (= (bvadd (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207736))) (currentByte!5948 (_2!6112 lt!207736)) (currentBit!5943 (_2!6112 lt!207736))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!207762))) (currentByte!5948 (_2!6113 lt!207762)) (currentBit!5943 (_2!6113 lt!207762))))))

(declare-fun lt!207733 () Unit!8283)

(declare-fun Unit!8297 () Unit!8283)

(assert (=> b!134022 (= lt!207733 Unit!8297)))

(assert (=> b!134022 (= (bvadd call!1726 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!207762))) (currentByte!5948 (_2!6113 lt!207762)) (currentBit!5943 (_2!6113 lt!207762))))))

(declare-fun lt!207746 () Unit!8283)

(declare-fun Unit!8298 () Unit!8283)

(assert (=> b!134022 (= lt!207746 Unit!8298)))

(assert (=> b!134022 (and (= (buf!3157 (_1!6101 lt!206842)) (buf!3157 (_2!6113 lt!207762))) (= (size!2774 lt!206847) (size!2774 (_3!313 lt!207762))))))

(declare-fun lt!207743 () Unit!8283)

(declare-fun Unit!8299 () Unit!8283)

(assert (=> b!134022 (= lt!207743 Unit!8299)))

(declare-fun lt!207764 () Unit!8283)

(declare-fun arrayUpdatedAtPrefixLemma!3 (array!6129 (_ BitVec 32) (_ BitVec 8)) Unit!8283)

(assert (=> b!134022 (= lt!207764 (arrayUpdatedAtPrefixLemma!3 lt!206847 (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207736)))))

(assert (=> b!134022 (arrayRangesEq!177 lt!206847 (array!6130 (store (arr!3424 lt!206847) (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207736)) (size!2774 lt!206847)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!207745 () Unit!8283)

(assert (=> b!134022 (= lt!207745 lt!207764)))

(declare-fun lt!207749 () (_ BitVec 32))

(assert (=> b!134022 (= lt!207749 #b00000000000000000000000000000000)))

(declare-fun lt!207734 () Unit!8283)

(declare-fun arrayRangesEqTransitive!3 (array!6129 array!6129 array!6129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8283)

(assert (=> b!134022 (= lt!207734 (arrayRangesEqTransitive!3 lt!206847 lt!207742 (_3!313 lt!207762) lt!207749 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(declare-fun call!1725 () Bool)

(assert (=> b!134022 call!1725))

(declare-fun lt!207748 () Unit!8283)

(assert (=> b!134022 (= lt!207748 lt!207734)))

(declare-fun call!1727 () Bool)

(assert (=> b!134022 call!1727))

(declare-fun lt!207737 () Unit!8283)

(declare-fun Unit!8300 () Unit!8283)

(assert (=> b!134022 (= lt!207737 Unit!8300)))

(declare-fun lt!207741 () Unit!8283)

(declare-fun arrayRangesEqImpliesEq!3 (array!6129 array!6129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8283)

(assert (=> b!134022 (= lt!207741 (arrayRangesEqImpliesEq!3 lt!207742 (_3!313 lt!207762) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134022 (= (select (store (arr!3424 lt!206847) (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207736)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3424 (_3!313 lt!207762)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!207753 () Unit!8283)

(assert (=> b!134022 (= lt!207753 lt!207741)))

(declare-fun lt!207750 () Bool)

(assert (=> b!134022 (= lt!207750 (= (select (arr!3424 (_3!313 lt!207762)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6112 lt!207736)))))

(declare-fun Unit!8301 () Unit!8283)

(assert (=> b!134022 (= lt!207765 Unit!8301)))

(assert (=> b!134022 lt!207750))

(declare-fun bm!1722 () Bool)

(assert (=> bm!1722 (= call!1726 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!206842))) (currentByte!5948 (_1!6101 lt!206842)) (currentBit!5943 (_1!6101 lt!206842))))))

(declare-fun c!7652 () Bool)

(declare-fun bm!1723 () Bool)

(assert (=> bm!1723 (= call!1727 (arrayRangesEq!177 lt!206847 (ite c!7652 (_3!313 lt!207762) lt!206847) #b00000000000000000000000000000000 (ite c!7652 (bvadd #b00000000000000000000000000000001 from!447) (size!2774 lt!206847))))))

(declare-fun lt!207731 () array!6129)

(declare-fun bm!1724 () Bool)

(declare-fun lt!207735 () (_ BitVec 32))

(declare-fun lt!207751 () (_ BitVec 32))

(declare-fun lt!207740 () array!6129)

(assert (=> bm!1724 (= call!1725 (arrayRangesEq!177 (ite c!7652 lt!206847 lt!207731) (ite c!7652 (_3!313 lt!207762) lt!207740) (ite c!7652 lt!207749 lt!207735) (ite c!7652 (bvadd #b00000000000000000000000000000001 from!447) lt!207751)))))

(declare-fun b!134024 () Bool)

(declare-fun res!111359 () Bool)

(assert (=> b!134024 (=> (not res!111359) (not e!88876))))

(assert (=> b!134024 (= res!111359 (and (= (buf!3157 (_1!6101 lt!206842)) (buf!3157 (_2!6113 lt!207761))) (= (size!2774 lt!206847) (size!2774 (_3!313 lt!207761)))))))

(declare-fun lt!207758 () Unit!8283)

(declare-fun b!134023 () Bool)

(assert (=> b!134023 (= e!88875 (tuple3!513 lt!207758 (_1!6101 lt!206842) lt!206847))))

(assert (=> b!134023 (= call!1726 call!1726)))

(declare-fun lt!207760 () Unit!8283)

(declare-fun Unit!8302 () Unit!8283)

(assert (=> b!134023 (= lt!207760 Unit!8302)))

(declare-fun lt!207754 () Unit!8283)

(declare-fun arrayRangesEqReflexiveLemma!3 (array!6129) Unit!8283)

(assert (=> b!134023 (= lt!207754 (arrayRangesEqReflexiveLemma!3 lt!206847))))

(assert (=> b!134023 call!1727))

(declare-fun lt!207738 () Unit!8283)

(assert (=> b!134023 (= lt!207738 lt!207754)))

(assert (=> b!134023 (= lt!207731 lt!206847)))

(assert (=> b!134023 (= lt!207740 lt!206847)))

(declare-fun lt!207732 () (_ BitVec 32))

(assert (=> b!134023 (= lt!207732 #b00000000000000000000000000000000)))

(declare-fun lt!207730 () (_ BitVec 32))

(assert (=> b!134023 (= lt!207730 (size!2774 lt!206847))))

(assert (=> b!134023 (= lt!207735 #b00000000000000000000000000000000)))

(assert (=> b!134023 (= lt!207751 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!3 (array!6129 array!6129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8283)

(assert (=> b!134023 (= lt!207758 (arrayRangesEqSlicedLemma!3 lt!207731 lt!207740 lt!207732 lt!207730 lt!207735 lt!207751))))

(assert (=> b!134023 call!1725))

(declare-fun d!43041 () Bool)

(assert (=> d!43041 e!88874))

(declare-fun res!111358 () Bool)

(assert (=> d!43041 (=> res!111358 e!88874)))

(assert (=> d!43041 (= res!111358 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!207744 () Bool)

(assert (=> d!43041 (= lt!207744 e!88876)))

(declare-fun res!111357 () Bool)

(assert (=> d!43041 (=> (not res!111357) (not e!88876))))

(declare-fun lt!207739 () (_ BitVec 64))

(declare-fun lt!207756 () (_ BitVec 64))

(assert (=> d!43041 (= res!111357 (= (bvadd lt!207756 lt!207739) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!207761))) (currentByte!5948 (_2!6113 lt!207761)) (currentBit!5943 (_2!6113 lt!207761)))))))

(assert (=> d!43041 (or (not (= (bvand lt!207756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207739 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207756 lt!207739) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!207755 () (_ BitVec 64))

(assert (=> d!43041 (= lt!207739 (bvmul lt!207755 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43041 (or (= lt!207755 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207755 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207755)))))

(assert (=> d!43041 (= lt!207755 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43041 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43041 (= lt!207756 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!206842))) (currentByte!5948 (_1!6101 lt!206842)) (currentBit!5943 (_1!6101 lt!206842))))))

(assert (=> d!43041 (= lt!207761 e!88875)))

(assert (=> d!43041 (= c!7652 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43041 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2774 lt!206847)))))

(assert (=> d!43041 (= (readByteArrayLoop!0 (_1!6101 lt!206842) lt!206847 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!207761)))

(assert (= (and d!43041 c!7652) b!134022))

(assert (= (and d!43041 (not c!7652)) b!134023))

(assert (= (or b!134022 b!134023) bm!1724))

(assert (= (or b!134022 b!134023) bm!1723))

(assert (= (or b!134022 b!134023) bm!1722))

(assert (= (and d!43041 res!111357) b!134024))

(assert (= (and b!134024 res!111359) b!134021))

(assert (= (and d!43041 (not res!111358)) b!134020))

(declare-fun m!203525 () Bool)

(assert (=> bm!1724 m!203525))

(declare-fun m!203527 () Bool)

(assert (=> b!134023 m!203527))

(declare-fun m!203529 () Bool)

(assert (=> b!134023 m!203529))

(declare-fun m!203531 () Bool)

(assert (=> b!134021 m!203531))

(declare-fun m!203533 () Bool)

(assert (=> b!134022 m!203533))

(declare-fun m!203535 () Bool)

(assert (=> b!134022 m!203535))

(declare-fun m!203537 () Bool)

(assert (=> b!134022 m!203537))

(declare-fun m!203539 () Bool)

(assert (=> b!134022 m!203539))

(declare-fun m!203541 () Bool)

(assert (=> b!134022 m!203541))

(declare-fun m!203543 () Bool)

(assert (=> b!134022 m!203543))

(declare-fun m!203545 () Bool)

(assert (=> b!134022 m!203545))

(declare-fun m!203547 () Bool)

(assert (=> b!134022 m!203547))

(declare-fun m!203549 () Bool)

(assert (=> b!134022 m!203549))

(declare-fun m!203551 () Bool)

(assert (=> b!134022 m!203551))

(declare-fun m!203553 () Bool)

(assert (=> b!134022 m!203553))

(declare-fun m!203555 () Bool)

(assert (=> b!134022 m!203555))

(declare-fun m!203557 () Bool)

(assert (=> b!134022 m!203557))

(declare-fun m!203559 () Bool)

(assert (=> bm!1722 m!203559))

(declare-fun m!203561 () Bool)

(assert (=> bm!1723 m!203561))

(declare-fun m!203563 () Bool)

(assert (=> d!43041 m!203563))

(assert (=> d!43041 m!203559))

(declare-fun m!203565 () Bool)

(assert (=> b!134020 m!203565))

(declare-fun m!203567 () Bool)

(assert (=> b!134020 m!203567))

(assert (=> d!42974 d!43041))

(declare-fun d!43043 () Bool)

(assert (=> d!43043 (= (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 thiss!1634)))))))

(assert (=> d!43031 d!43043))

(assert (=> d!43015 d!43043))

(assert (=> d!43015 d!43023))

(declare-fun d!43045 () Bool)

(declare-fun lt!207782 () (_ BitVec 8))

(declare-fun lt!207786 () (_ BitVec 8))

(assert (=> d!43045 (= lt!207782 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3424 (buf!3157 (_1!6101 lt!206839))) (currentByte!5948 (_1!6101 lt!206839)))) ((_ sign_extend 24) lt!207786))))))

(assert (=> d!43045 (= lt!207786 ((_ extract 7 0) (currentBit!5943 (_1!6101 lt!206839))))))

(declare-fun e!88881 () Bool)

(assert (=> d!43045 e!88881))

(declare-fun res!111365 () Bool)

(assert (=> d!43045 (=> (not res!111365) (not e!88881))))

(assert (=> d!43045 (= res!111365 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6101 lt!206839)))) ((_ sign_extend 32) (currentByte!5948 (_1!6101 lt!206839))) ((_ sign_extend 32) (currentBit!5943 (_1!6101 lt!206839))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!11600 0))(
  ( (tuple2!11601 (_1!6115 Unit!8283) (_2!6115 (_ BitVec 8))) )
))
(declare-fun Unit!8303 () Unit!8283)

(declare-fun Unit!8304 () Unit!8283)

(assert (=> d!43045 (= (readByte!0 (_1!6101 lt!206839)) (tuple2!11599 (_2!6115 (ite (bvsgt ((_ sign_extend 24) lt!207786) #b00000000000000000000000000000000) (tuple2!11601 Unit!8303 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!207782) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3424 (buf!3157 (_1!6101 lt!206839))) (bvadd (currentByte!5948 (_1!6101 lt!206839)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!207786)))))))) (tuple2!11601 Unit!8304 lt!207782))) (BitStream!4813 (buf!3157 (_1!6101 lt!206839)) (bvadd (currentByte!5948 (_1!6101 lt!206839)) #b00000000000000000000000000000001) (currentBit!5943 (_1!6101 lt!206839)))))))

(declare-fun b!134029 () Bool)

(declare-fun e!88882 () Bool)

(assert (=> b!134029 (= e!88881 e!88882)))

(declare-fun res!111366 () Bool)

(assert (=> b!134029 (=> (not res!111366) (not e!88882))))

(declare-fun lt!207780 () tuple2!11598)

(assert (=> b!134029 (= res!111366 (= (buf!3157 (_2!6112 lt!207780)) (buf!3157 (_1!6101 lt!206839))))))

(declare-fun lt!207783 () (_ BitVec 8))

(declare-fun lt!207784 () (_ BitVec 8))

(declare-fun Unit!8305 () Unit!8283)

(declare-fun Unit!8306 () Unit!8283)

(assert (=> b!134029 (= lt!207780 (tuple2!11599 (_2!6115 (ite (bvsgt ((_ sign_extend 24) lt!207784) #b00000000000000000000000000000000) (tuple2!11601 Unit!8305 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!207783) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3424 (buf!3157 (_1!6101 lt!206839))) (bvadd (currentByte!5948 (_1!6101 lt!206839)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!207784)))))))) (tuple2!11601 Unit!8306 lt!207783))) (BitStream!4813 (buf!3157 (_1!6101 lt!206839)) (bvadd (currentByte!5948 (_1!6101 lt!206839)) #b00000000000000000000000000000001) (currentBit!5943 (_1!6101 lt!206839)))))))

(assert (=> b!134029 (= lt!207783 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3424 (buf!3157 (_1!6101 lt!206839))) (currentByte!5948 (_1!6101 lt!206839)))) ((_ sign_extend 24) lt!207784))))))

(assert (=> b!134029 (= lt!207784 ((_ extract 7 0) (currentBit!5943 (_1!6101 lt!206839))))))

(declare-fun b!134030 () Bool)

(declare-fun lt!207785 () (_ BitVec 64))

(declare-fun lt!207781 () (_ BitVec 64))

(assert (=> b!134030 (= e!88882 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207780))) (currentByte!5948 (_2!6112 lt!207780)) (currentBit!5943 (_2!6112 lt!207780))) (bvadd lt!207785 lt!207781)))))

(assert (=> b!134030 (or (not (= (bvand lt!207785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207781 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207785 lt!207781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134030 (= lt!207781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!134030 (= lt!207785 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!206839))) (currentByte!5948 (_1!6101 lt!206839)) (currentBit!5943 (_1!6101 lt!206839))))))

(assert (= (and d!43045 res!111365) b!134029))

(assert (= (and b!134029 res!111366) b!134030))

(declare-fun m!203569 () Bool)

(assert (=> d!43045 m!203569))

(declare-fun m!203571 () Bool)

(assert (=> d!43045 m!203571))

(declare-fun m!203573 () Bool)

(assert (=> d!43045 m!203573))

(assert (=> b!134029 m!203573))

(assert (=> b!134029 m!203569))

(declare-fun m!203575 () Bool)

(assert (=> b!134030 m!203575))

(declare-fun m!203577 () Bool)

(assert (=> b!134030 m!203577))

(assert (=> d!43027 d!43045))

(declare-fun d!43047 () Bool)

(assert (=> d!43047 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!43047 true))

(declare-fun _$7!52 () Unit!8283)

(assert (=> d!43047 (= (choose!57 thiss!1634 (_2!6102 lt!206848) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!52)))

(declare-fun bs!10501 () Bool)

(assert (= bs!10501 d!43047))

(declare-fun m!203579 () Bool)

(assert (=> bs!10501 m!203579))

(assert (=> d!42992 d!43047))

(declare-fun d!43049 () Bool)

(declare-fun lt!207787 () tuple2!11598)

(assert (=> d!43049 (= lt!207787 (readByte!0 lt!207470))))

(assert (=> d!43049 (= (readBytePure!0 lt!207470) (tuple2!11579 (_2!6112 lt!207787) (_1!6112 lt!207787)))))

(declare-fun bs!10502 () Bool)

(assert (= bs!10502 d!43049))

(declare-fun m!203581 () Bool)

(assert (=> bs!10502 m!203581))

(assert (=> d!42970 d!43049))

(declare-fun d!43051 () Bool)

(declare-fun e!88885 () Bool)

(assert (=> d!43051 e!88885))

(declare-fun res!111369 () Bool)

(assert (=> d!43051 (=> (not res!111369) (not e!88885))))

(declare-fun lt!207793 () tuple2!11578)

(declare-fun lt!207792 () tuple2!11578)

(assert (=> d!43051 (= res!111369 (= (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!207793))) (currentByte!5948 (_1!6100 lt!207793)) (currentBit!5943 (_1!6100 lt!207793))) (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!207792))) (currentByte!5948 (_1!6100 lt!207792)) (currentBit!5943 (_1!6100 lt!207792)))))))

(assert (=> d!43051 (= lt!207792 (readBytePure!0 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 lt!206833) (currentBit!5943 lt!206833))))))

(assert (=> d!43051 (= lt!207793 (readBytePure!0 lt!206833))))

(assert (=> d!43051 true))

(declare-fun _$8!60 () Unit!8283)

(assert (=> d!43051 (= (choose!14 lt!206833 (_2!6102 lt!206855) lt!207470 lt!207472 (tuple2!11579 (_1!6100 lt!207472) (_2!6100 lt!207472)) (_1!6100 lt!207472) (_2!6100 lt!207472) lt!207471 (tuple2!11579 (_1!6100 lt!207471) (_2!6100 lt!207471)) (_1!6100 lt!207471) (_2!6100 lt!207471)) _$8!60)))

(declare-fun b!134033 () Bool)

(assert (=> b!134033 (= e!88885 (= (_2!6100 lt!207793) (_2!6100 lt!207792)))))

(assert (= (and d!43051 res!111369) b!134033))

(declare-fun m!203583 () Bool)

(assert (=> d!43051 m!203583))

(declare-fun m!203585 () Bool)

(assert (=> d!43051 m!203585))

(declare-fun m!203587 () Bool)

(assert (=> d!43051 m!203587))

(assert (=> d!43051 m!202823))

(assert (=> d!42970 d!43051))

(assert (=> d!42970 d!42964))

(declare-fun d!43053 () Bool)

(declare-fun e!88886 () Bool)

(assert (=> d!43053 e!88886))

(declare-fun res!111371 () Bool)

(assert (=> d!43053 (=> (not res!111371) (not e!88886))))

(declare-fun lt!207796 () (_ BitVec 64))

(declare-fun lt!207799 () (_ BitVec 64))

(declare-fun lt!207798 () (_ BitVec 64))

(assert (=> d!43053 (= res!111371 (= lt!207798 (bvsub lt!207796 lt!207799)))))

(assert (=> d!43053 (or (= (bvand lt!207796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207799 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207796 lt!207799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43053 (= lt!207799 (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!207471)))) ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!207471))) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!207471)))))))

(declare-fun lt!207797 () (_ BitVec 64))

(declare-fun lt!207794 () (_ BitVec 64))

(assert (=> d!43053 (= lt!207796 (bvmul lt!207797 lt!207794))))

(assert (=> d!43053 (or (= lt!207797 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207794 (bvsdiv (bvmul lt!207797 lt!207794) lt!207797)))))

(assert (=> d!43053 (= lt!207794 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43053 (= lt!207797 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!207471)))))))

(assert (=> d!43053 (= lt!207798 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!207471))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!207471)))))))

(assert (=> d!43053 (invariant!0 (currentBit!5943 (_1!6100 lt!207471)) (currentByte!5948 (_1!6100 lt!207471)) (size!2774 (buf!3157 (_1!6100 lt!207471))))))

(assert (=> d!43053 (= (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!207471))) (currentByte!5948 (_1!6100 lt!207471)) (currentBit!5943 (_1!6100 lt!207471))) lt!207798)))

(declare-fun b!134034 () Bool)

(declare-fun res!111370 () Bool)

(assert (=> b!134034 (=> (not res!111370) (not e!88886))))

(assert (=> b!134034 (= res!111370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207798))))

(declare-fun b!134035 () Bool)

(declare-fun lt!207795 () (_ BitVec 64))

(assert (=> b!134035 (= e!88886 (bvsle lt!207798 (bvmul lt!207795 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134035 (or (= lt!207795 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207795 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207795)))))

(assert (=> b!134035 (= lt!207795 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!207471)))))))

(assert (= (and d!43053 res!111371) b!134034))

(assert (= (and b!134034 res!111370) b!134035))

(declare-fun m!203589 () Bool)

(assert (=> d!43053 m!203589))

(declare-fun m!203591 () Bool)

(assert (=> d!43053 m!203591))

(assert (=> d!42970 d!43053))

(declare-fun d!43055 () Bool)

(declare-fun e!88887 () Bool)

(assert (=> d!43055 e!88887))

(declare-fun res!111373 () Bool)

(assert (=> d!43055 (=> (not res!111373) (not e!88887))))

(declare-fun lt!207802 () (_ BitVec 64))

(declare-fun lt!207805 () (_ BitVec 64))

(declare-fun lt!207804 () (_ BitVec 64))

(assert (=> d!43055 (= res!111373 (= lt!207804 (bvsub lt!207802 lt!207805)))))

(assert (=> d!43055 (or (= (bvand lt!207802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207805 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207802 lt!207805) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43055 (= lt!207805 (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!207472)))) ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!207472))) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!207472)))))))

(declare-fun lt!207803 () (_ BitVec 64))

(declare-fun lt!207800 () (_ BitVec 64))

(assert (=> d!43055 (= lt!207802 (bvmul lt!207803 lt!207800))))

(assert (=> d!43055 (or (= lt!207803 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207800 (bvsdiv (bvmul lt!207803 lt!207800) lt!207803)))))

(assert (=> d!43055 (= lt!207800 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43055 (= lt!207803 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!207472)))))))

(assert (=> d!43055 (= lt!207804 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!207472))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!207472)))))))

(assert (=> d!43055 (invariant!0 (currentBit!5943 (_1!6100 lt!207472)) (currentByte!5948 (_1!6100 lt!207472)) (size!2774 (buf!3157 (_1!6100 lt!207472))))))

(assert (=> d!43055 (= (bitIndex!0 (size!2774 (buf!3157 (_1!6100 lt!207472))) (currentByte!5948 (_1!6100 lt!207472)) (currentBit!5943 (_1!6100 lt!207472))) lt!207804)))

(declare-fun b!134036 () Bool)

(declare-fun res!111372 () Bool)

(assert (=> b!134036 (=> (not res!111372) (not e!88887))))

(assert (=> b!134036 (= res!111372 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207804))))

(declare-fun b!134037 () Bool)

(declare-fun lt!207801 () (_ BitVec 64))

(assert (=> b!134037 (= e!88887 (bvsle lt!207804 (bvmul lt!207801 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134037 (or (= lt!207801 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207801 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207801)))))

(assert (=> b!134037 (= lt!207801 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!207472)))))))

(assert (= (and d!43055 res!111373) b!134036))

(assert (= (and b!134036 res!111372) b!134037))

(declare-fun m!203593 () Bool)

(assert (=> d!43055 m!203593))

(declare-fun m!203595 () Bool)

(assert (=> d!43055 m!203595))

(assert (=> d!42970 d!43055))

(declare-fun d!43057 () Bool)

(assert (=> d!43057 (= (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206838)))) ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!206838))) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!206838)))) (bvsub (bvmul ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6100 lt!206838)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_1!6100 lt!206838))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_1!6100 lt!206838))))))))

(assert (=> d!42988 d!43057))

(declare-fun d!43059 () Bool)

(assert (=> d!43059 (= (invariant!0 (currentBit!5943 (_1!6100 lt!206838)) (currentByte!5948 (_1!6100 lt!206838)) (size!2774 (buf!3157 (_1!6100 lt!206838)))) (and (bvsge (currentBit!5943 (_1!6100 lt!206838)) #b00000000000000000000000000000000) (bvslt (currentBit!5943 (_1!6100 lt!206838)) #b00000000000000000000000000001000) (bvsge (currentByte!5948 (_1!6100 lt!206838)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5948 (_1!6100 lt!206838)) (size!2774 (buf!3157 (_1!6100 lt!206838)))) (and (= (currentBit!5943 (_1!6100 lt!206838)) #b00000000000000000000000000000000) (= (currentByte!5948 (_1!6100 lt!206838)) (size!2774 (buf!3157 (_1!6100 lt!206838))))))))))

(assert (=> d!42988 d!43059))

(declare-fun d!43061 () Bool)

(declare-fun res!111374 () Bool)

(declare-fun e!88889 () Bool)

(assert (=> d!43061 (=> (not res!111374) (not e!88889))))

(assert (=> d!43061 (= res!111374 (= (size!2774 (buf!3157 (_2!6102 lt!206848))) (size!2774 (buf!3157 (_2!6102 lt!206848)))))))

(assert (=> d!43061 (= (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!206848)) e!88889)))

(declare-fun b!134038 () Bool)

(declare-fun res!111376 () Bool)

(assert (=> b!134038 (=> (not res!111376) (not e!88889))))

(assert (=> b!134038 (= res!111376 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(declare-fun b!134039 () Bool)

(declare-fun e!88888 () Bool)

(assert (=> b!134039 (= e!88889 e!88888)))

(declare-fun res!111375 () Bool)

(assert (=> b!134039 (=> res!111375 e!88888)))

(assert (=> b!134039 (= res!111375 (= (size!2774 (buf!3157 (_2!6102 lt!206848))) #b00000000000000000000000000000000))))

(declare-fun b!134040 () Bool)

(assert (=> b!134040 (= e!88888 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 (_2!6102 lt!206848)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(assert (= (and d!43061 res!111374) b!134038))

(assert (= (and b!134038 res!111376) b!134039))

(assert (= (and b!134039 (not res!111375)) b!134040))

(assert (=> b!134038 m!202827))

(assert (=> b!134038 m!202827))

(assert (=> b!134040 m!202827))

(assert (=> b!134040 m!202827))

(declare-fun m!203597 () Bool)

(assert (=> b!134040 m!203597))

(assert (=> d!43001 d!43061))

(assert (=> d!43001 d!43005))

(declare-fun d!43063 () Bool)

(declare-fun res!111377 () Bool)

(declare-fun e!88891 () Bool)

(assert (=> d!43063 (=> (not res!111377) (not e!88891))))

(assert (=> d!43063 (= res!111377 (= (size!2774 (buf!3157 lt!207573)) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(assert (=> d!43063 (= (isPrefixOf!0 lt!207573 (_2!6102 lt!206855)) e!88891)))

(declare-fun b!134041 () Bool)

(declare-fun res!111379 () Bool)

(assert (=> b!134041 (=> (not res!111379) (not e!88891))))

(assert (=> b!134041 (= res!111379 (bvsle (bitIndex!0 (size!2774 (buf!3157 lt!207573)) (currentByte!5948 lt!207573) (currentBit!5943 lt!207573)) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855)))))))

(declare-fun b!134042 () Bool)

(declare-fun e!88890 () Bool)

(assert (=> b!134042 (= e!88891 e!88890)))

(declare-fun res!111378 () Bool)

(assert (=> b!134042 (=> res!111378 e!88890)))

(assert (=> b!134042 (= res!111378 (= (size!2774 (buf!3157 lt!207573)) #b00000000000000000000000000000000))))

(declare-fun b!134043 () Bool)

(assert (=> b!134043 (= e!88890 (arrayBitRangesEq!0 (buf!3157 lt!207573) (buf!3157 (_2!6102 lt!206855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 lt!207573)) (currentByte!5948 lt!207573) (currentBit!5943 lt!207573))))))

(assert (= (and d!43063 res!111377) b!134041))

(assert (= (and b!134041 res!111379) b!134042))

(assert (= (and b!134042 (not res!111378)) b!134043))

(declare-fun m!203599 () Bool)

(assert (=> b!134041 m!203599))

(assert (=> b!134041 m!202825))

(assert (=> b!134043 m!203599))

(assert (=> b!134043 m!203599))

(declare-fun m!203601 () Bool)

(assert (=> b!134043 m!203601))

(assert (=> d!43001 d!43063))

(declare-fun d!43065 () Bool)

(assert (=> d!43065 (isPrefixOf!0 (_2!6102 lt!206855) (_2!6102 lt!206855))))

(declare-fun lt!207808 () Unit!8283)

(declare-fun choose!11 (BitStream!4812) Unit!8283)

(assert (=> d!43065 (= lt!207808 (choose!11 (_2!6102 lt!206855)))))

(assert (=> d!43065 (= (lemmaIsPrefixRefl!0 (_2!6102 lt!206855)) lt!207808)))

(declare-fun bs!10504 () Bool)

(assert (= bs!10504 d!43065))

(assert (=> bs!10504 m!203383))

(declare-fun m!203603 () Bool)

(assert (=> bs!10504 m!203603))

(assert (=> d!43001 d!43065))

(declare-fun d!43067 () Bool)

(assert (=> d!43067 (isPrefixOf!0 lt!207573 lt!207573)))

(declare-fun lt!207809 () Unit!8283)

(assert (=> d!43067 (= lt!207809 (choose!11 lt!207573))))

(assert (=> d!43067 (= (lemmaIsPrefixRefl!0 lt!207573) lt!207809)))

(declare-fun bs!10505 () Bool)

(assert (= bs!10505 d!43067))

(assert (=> bs!10505 m!203437))

(declare-fun m!203605 () Bool)

(assert (=> bs!10505 m!203605))

(assert (=> d!43001 d!43067))

(declare-fun d!43069 () Bool)

(assert (=> d!43069 (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!206848))))

(declare-fun lt!207810 () Unit!8283)

(assert (=> d!43069 (= lt!207810 (choose!11 (_2!6102 lt!206848)))))

(assert (=> d!43069 (= (lemmaIsPrefixRefl!0 (_2!6102 lt!206848)) lt!207810)))

(declare-fun bs!10506 () Bool)

(assert (= bs!10506 d!43069))

(assert (=> bs!10506 m!203435))

(declare-fun m!203607 () Bool)

(assert (=> bs!10506 m!203607))

(assert (=> d!43001 d!43069))

(declare-fun d!43071 () Bool)

(declare-fun res!111380 () Bool)

(declare-fun e!88893 () Bool)

(assert (=> d!43071 (=> (not res!111380) (not e!88893))))

(assert (=> d!43071 (= res!111380 (= (size!2774 (buf!3157 (_1!6101 lt!207571))) (size!2774 (buf!3157 (_2!6101 lt!207571)))))))

(assert (=> d!43071 (= (isPrefixOf!0 (_1!6101 lt!207571) (_2!6101 lt!207571)) e!88893)))

(declare-fun b!134044 () Bool)

(declare-fun res!111382 () Bool)

(assert (=> b!134044 (=> (not res!111382) (not e!88893))))

(assert (=> b!134044 (= res!111382 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207571))) (currentByte!5948 (_1!6101 lt!207571)) (currentBit!5943 (_1!6101 lt!207571))) (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207571))) (currentByte!5948 (_2!6101 lt!207571)) (currentBit!5943 (_2!6101 lt!207571)))))))

(declare-fun b!134045 () Bool)

(declare-fun e!88892 () Bool)

(assert (=> b!134045 (= e!88893 e!88892)))

(declare-fun res!111381 () Bool)

(assert (=> b!134045 (=> res!111381 e!88892)))

(assert (=> b!134045 (= res!111381 (= (size!2774 (buf!3157 (_1!6101 lt!207571))) #b00000000000000000000000000000000))))

(declare-fun b!134046 () Bool)

(assert (=> b!134046 (= e!88892 (arrayBitRangesEq!0 (buf!3157 (_1!6101 lt!207571)) (buf!3157 (_2!6101 lt!207571)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207571))) (currentByte!5948 (_1!6101 lt!207571)) (currentBit!5943 (_1!6101 lt!207571)))))))

(assert (= (and d!43071 res!111380) b!134044))

(assert (= (and b!134044 res!111382) b!134045))

(assert (= (and b!134045 (not res!111381)) b!134046))

(declare-fun m!203609 () Bool)

(assert (=> b!134044 m!203609))

(declare-fun m!203611 () Bool)

(assert (=> b!134044 m!203611))

(assert (=> b!134046 m!203609))

(assert (=> b!134046 m!203609))

(declare-fun m!203613 () Bool)

(assert (=> b!134046 m!203613))

(assert (=> d!43001 d!43071))

(declare-fun d!43073 () Bool)

(declare-fun res!111383 () Bool)

(declare-fun e!88895 () Bool)

(assert (=> d!43073 (=> (not res!111383) (not e!88895))))

(assert (=> d!43073 (= res!111383 (= (size!2774 (buf!3157 (_2!6102 lt!206855))) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(assert (=> d!43073 (= (isPrefixOf!0 (_2!6102 lt!206855) (_2!6102 lt!206855)) e!88895)))

(declare-fun b!134047 () Bool)

(declare-fun res!111385 () Bool)

(assert (=> b!134047 (=> (not res!111385) (not e!88895))))

(assert (=> b!134047 (= res!111385 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855))) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855)))))))

(declare-fun b!134048 () Bool)

(declare-fun e!88894 () Bool)

(assert (=> b!134048 (= e!88895 e!88894)))

(declare-fun res!111384 () Bool)

(assert (=> b!134048 (=> res!111384 e!88894)))

(assert (=> b!134048 (= res!111384 (= (size!2774 (buf!3157 (_2!6102 lt!206855))) #b00000000000000000000000000000000))))

(declare-fun b!134049 () Bool)

(assert (=> b!134049 (= e!88894 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206855)) (buf!3157 (_2!6102 lt!206855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855)))))))

(assert (= (and d!43073 res!111383) b!134047))

(assert (= (and b!134047 res!111385) b!134048))

(assert (= (and b!134048 (not res!111384)) b!134049))

(assert (=> b!134047 m!202825))

(assert (=> b!134047 m!202825))

(assert (=> b!134049 m!202825))

(assert (=> b!134049 m!202825))

(declare-fun m!203615 () Bool)

(assert (=> b!134049 m!203615))

(assert (=> d!43001 d!43073))

(declare-fun d!43075 () Bool)

(assert (=> d!43075 (isPrefixOf!0 lt!207573 (_2!6102 lt!206855))))

(declare-fun lt!207811 () Unit!8283)

(assert (=> d!43075 (= lt!207811 (choose!30 lt!207573 (_2!6102 lt!206848) (_2!6102 lt!206855)))))

(assert (=> d!43075 (isPrefixOf!0 lt!207573 (_2!6102 lt!206848))))

(assert (=> d!43075 (= (lemmaIsPrefixTransitive!0 lt!207573 (_2!6102 lt!206848) (_2!6102 lt!206855)) lt!207811)))

(declare-fun bs!10507 () Bool)

(assert (= bs!10507 d!43075))

(assert (=> bs!10507 m!203439))

(declare-fun m!203617 () Bool)

(assert (=> bs!10507 m!203617))

(declare-fun m!203619 () Bool)

(assert (=> bs!10507 m!203619))

(assert (=> d!43001 d!43075))

(declare-fun d!43077 () Bool)

(assert (=> d!43077 (isPrefixOf!0 lt!207573 (_2!6102 lt!206855))))

(declare-fun lt!207812 () Unit!8283)

(assert (=> d!43077 (= lt!207812 (choose!30 lt!207573 (_2!6102 lt!206855) (_2!6102 lt!206855)))))

(assert (=> d!43077 (isPrefixOf!0 lt!207573 (_2!6102 lt!206855))))

(assert (=> d!43077 (= (lemmaIsPrefixTransitive!0 lt!207573 (_2!6102 lt!206855) (_2!6102 lt!206855)) lt!207812)))

(declare-fun bs!10508 () Bool)

(assert (= bs!10508 d!43077))

(assert (=> bs!10508 m!203439))

(declare-fun m!203621 () Bool)

(assert (=> bs!10508 m!203621))

(assert (=> bs!10508 m!203439))

(assert (=> d!43001 d!43077))

(declare-fun d!43079 () Bool)

(declare-fun res!111386 () Bool)

(declare-fun e!88897 () Bool)

(assert (=> d!43079 (=> (not res!111386) (not e!88897))))

(assert (=> d!43079 (= res!111386 (= (size!2774 (buf!3157 lt!207573)) (size!2774 (buf!3157 lt!207573))))))

(assert (=> d!43079 (= (isPrefixOf!0 lt!207573 lt!207573) e!88897)))

(declare-fun b!134050 () Bool)

(declare-fun res!111388 () Bool)

(assert (=> b!134050 (=> (not res!111388) (not e!88897))))

(assert (=> b!134050 (= res!111388 (bvsle (bitIndex!0 (size!2774 (buf!3157 lt!207573)) (currentByte!5948 lt!207573) (currentBit!5943 lt!207573)) (bitIndex!0 (size!2774 (buf!3157 lt!207573)) (currentByte!5948 lt!207573) (currentBit!5943 lt!207573))))))

(declare-fun b!134051 () Bool)

(declare-fun e!88896 () Bool)

(assert (=> b!134051 (= e!88897 e!88896)))

(declare-fun res!111387 () Bool)

(assert (=> b!134051 (=> res!111387 e!88896)))

(assert (=> b!134051 (= res!111387 (= (size!2774 (buf!3157 lt!207573)) #b00000000000000000000000000000000))))

(declare-fun b!134052 () Bool)

(assert (=> b!134052 (= e!88896 (arrayBitRangesEq!0 (buf!3157 lt!207573) (buf!3157 lt!207573) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 lt!207573)) (currentByte!5948 lt!207573) (currentBit!5943 lt!207573))))))

(assert (= (and d!43079 res!111386) b!134050))

(assert (= (and b!134050 res!111388) b!134051))

(assert (= (and b!134051 (not res!111387)) b!134052))

(assert (=> b!134050 m!203599))

(assert (=> b!134050 m!203599))

(assert (=> b!134052 m!203599))

(assert (=> b!134052 m!203599))

(declare-fun m!203623 () Bool)

(assert (=> b!134052 m!203623))

(assert (=> d!43001 d!43079))

(declare-fun d!43081 () Bool)

(assert (=> d!43081 (= (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))) (bvsub (bvmul ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))))))))

(assert (=> d!43013 d!43081))

(declare-fun d!43083 () Bool)

(assert (=> d!43083 (= (invariant!0 (currentBit!5943 (_2!6102 lt!206848)) (currentByte!5948 (_2!6102 lt!206848)) (size!2774 (buf!3157 (_2!6102 lt!206848)))) (and (bvsge (currentBit!5943 (_2!6102 lt!206848)) #b00000000000000000000000000000000) (bvslt (currentBit!5943 (_2!6102 lt!206848)) #b00000000000000000000000000001000) (bvsge (currentByte!5948 (_2!6102 lt!206848)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5948 (_2!6102 lt!206848)) (size!2774 (buf!3157 (_2!6102 lt!206848)))) (and (= (currentBit!5943 (_2!6102 lt!206848)) #b00000000000000000000000000000000) (= (currentByte!5948 (_2!6102 lt!206848)) (size!2774 (buf!3157 (_2!6102 lt!206848))))))))))

(assert (=> d!43013 d!43083))

(declare-fun d!43085 () Bool)

(declare-fun e!88900 () Bool)

(assert (=> d!43085 e!88900))

(declare-fun res!111391 () Bool)

(assert (=> d!43085 (=> (not res!111391) (not e!88900))))

(declare-fun lt!207817 () BitStream!4812)

(declare-fun lt!207818 () (_ BitVec 64))

(assert (=> d!43085 (= res!111391 (= (bvadd lt!207818 (bvsub lt!207542 lt!207539)) (bitIndex!0 (size!2774 (buf!3157 lt!207817)) (currentByte!5948 lt!207817) (currentBit!5943 lt!207817))))))

(assert (=> d!43085 (or (not (= (bvand lt!207818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207542 lt!207539) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207818 (bvsub lt!207542 lt!207539)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43085 (= lt!207818 (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207531))) (currentByte!5948 (_2!6101 lt!207531)) (currentBit!5943 (_2!6101 lt!207531))))))

(declare-fun moveBitIndex!0 (BitStream!4812 (_ BitVec 64)) tuple2!11582)

(assert (=> d!43085 (= lt!207817 (_2!6102 (moveBitIndex!0 (_2!6101 lt!207531) (bvsub lt!207542 lt!207539))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4812 (_ BitVec 64)) Bool)

(assert (=> d!43085 (moveBitIndexPrecond!0 (_2!6101 lt!207531) (bvsub lt!207542 lt!207539))))

(assert (=> d!43085 (= (withMovedBitIndex!0 (_2!6101 lt!207531) (bvsub lt!207542 lt!207539)) lt!207817)))

(declare-fun b!134055 () Bool)

(assert (=> b!134055 (= e!88900 (= (size!2774 (buf!3157 (_2!6101 lt!207531))) (size!2774 (buf!3157 lt!207817))))))

(assert (= (and d!43085 res!111391) b!134055))

(declare-fun m!203625 () Bool)

(assert (=> d!43085 m!203625))

(declare-fun m!203627 () Bool)

(assert (=> d!43085 m!203627))

(declare-fun m!203629 () Bool)

(assert (=> d!43085 m!203629))

(declare-fun m!203631 () Bool)

(assert (=> d!43085 m!203631))

(assert (=> b!133949 d!43085))

(assert (=> b!133949 d!43017))

(assert (=> b!133949 d!43015))

(declare-fun d!43087 () Bool)

(declare-fun res!111392 () Bool)

(declare-fun e!88902 () Bool)

(assert (=> d!43087 (=> (not res!111392) (not e!88902))))

(assert (=> d!43087 (= res!111392 (= (size!2774 (buf!3157 (_1!6101 lt!207531))) (size!2774 (buf!3157 thiss!1634))))))

(assert (=> d!43087 (= (isPrefixOf!0 (_1!6101 lt!207531) thiss!1634) e!88902)))

(declare-fun b!134056 () Bool)

(declare-fun res!111394 () Bool)

(assert (=> b!134056 (=> (not res!111394) (not e!88902))))

(assert (=> b!134056 (= res!111394 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207531))) (currentByte!5948 (_1!6101 lt!207531)) (currentBit!5943 (_1!6101 lt!207531))) (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(declare-fun b!134057 () Bool)

(declare-fun e!88901 () Bool)

(assert (=> b!134057 (= e!88902 e!88901)))

(declare-fun res!111393 () Bool)

(assert (=> b!134057 (=> res!111393 e!88901)))

(assert (=> b!134057 (= res!111393 (= (size!2774 (buf!3157 (_1!6101 lt!207531))) #b00000000000000000000000000000000))))

(declare-fun b!134058 () Bool)

(assert (=> b!134058 (= e!88901 (arrayBitRangesEq!0 (buf!3157 (_1!6101 lt!207531)) (buf!3157 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207531))) (currentByte!5948 (_1!6101 lt!207531)) (currentBit!5943 (_1!6101 lt!207531)))))))

(assert (= (and d!43087 res!111392) b!134056))

(assert (= (and b!134056 res!111394) b!134057))

(assert (= (and b!134057 (not res!111393)) b!134058))

(declare-fun m!203633 () Bool)

(assert (=> b!134056 m!203633))

(assert (=> b!134056 m!202839))

(assert (=> b!134058 m!203633))

(assert (=> b!134058 m!203633))

(declare-fun m!203635 () Bool)

(assert (=> b!134058 m!203635))

(assert (=> b!133947 d!43087))

(assert (=> b!133956 d!43013))

(declare-fun d!43089 () Bool)

(assert (=> d!43089 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206855)) (buf!3157 (_2!6102 lt!206848)) lt!207574 lt!207583)))

(declare-fun lt!207821 () Unit!8283)

(declare-fun choose!8 (array!6129 array!6129 (_ BitVec 64) (_ BitVec 64)) Unit!8283)

(assert (=> d!43089 (= lt!207821 (choose!8 (buf!3157 (_2!6102 lt!206848)) (buf!3157 (_2!6102 lt!206855)) lt!207574 lt!207583))))

(assert (=> d!43089 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207574) (bvsle lt!207574 lt!207583))))

(assert (=> d!43089 (= (arrayBitRangesEqSymmetric!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 (_2!6102 lt!206855)) lt!207574 lt!207583) lt!207821)))

(declare-fun bs!10509 () Bool)

(assert (= bs!10509 d!43089))

(assert (=> bs!10509 m!203449))

(declare-fun m!203637 () Bool)

(assert (=> bs!10509 m!203637))

(assert (=> b!133956 d!43089))

(declare-fun b!134059 () Bool)

(declare-fun e!88906 () Bool)

(declare-fun e!88907 () Bool)

(assert (=> b!134059 (= e!88906 e!88907)))

(declare-fun lt!207824 () (_ BitVec 32))

(declare-fun lt!207822 () tuple4!114)

(declare-fun res!111396 () Bool)

(assert (=> b!134059 (= res!111396 (byteRangesEq!0 (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_3!314 lt!207822)) (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_3!314 lt!207822)) lt!207824 #b00000000000000000000000000001000))))

(assert (=> b!134059 (=> (not res!111396) (not e!88907))))

(declare-fun b!134060 () Bool)

(declare-fun e!88903 () Bool)

(assert (=> b!134060 (= e!88903 e!88906)))

(declare-fun c!7653 () Bool)

(assert (=> b!134060 (= c!7653 (= (_3!314 lt!207822) (_4!57 lt!207822)))))

(declare-fun b!134061 () Bool)

(declare-fun call!1728 () Bool)

(assert (=> b!134061 (= e!88906 call!1728)))

(declare-fun d!43091 () Bool)

(declare-fun res!111398 () Bool)

(declare-fun e!88908 () Bool)

(assert (=> d!43091 (=> res!111398 e!88908)))

(assert (=> d!43091 (= res!111398 (bvsge lt!207574 lt!207583))))

(assert (=> d!43091 (= (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206855)) (buf!3157 (_2!6102 lt!206848)) lt!207574 lt!207583) e!88908)))

(declare-fun lt!207823 () (_ BitVec 32))

(declare-fun bm!1725 () Bool)

(assert (=> bm!1725 (= call!1728 (byteRangesEq!0 (ite c!7653 (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_3!314 lt!207822)) (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_4!57 lt!207822))) (ite c!7653 (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_3!314 lt!207822)) (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_4!57 lt!207822))) (ite c!7653 lt!207824 #b00000000000000000000000000000000) lt!207823))))

(declare-fun b!134062 () Bool)

(declare-fun e!88904 () Bool)

(assert (=> b!134062 (= e!88904 (arrayRangesEq!177 (buf!3157 (_2!6102 lt!206855)) (buf!3157 (_2!6102 lt!206848)) (_1!6114 lt!207822) (_2!6114 lt!207822)))))

(declare-fun b!134063 () Bool)

(declare-fun e!88905 () Bool)

(assert (=> b!134063 (= e!88905 call!1728)))

(declare-fun b!134064 () Bool)

(declare-fun res!111399 () Bool)

(assert (=> b!134064 (= res!111399 (= lt!207823 #b00000000000000000000000000000000))))

(assert (=> b!134064 (=> res!111399 e!88905)))

(assert (=> b!134064 (= e!88907 e!88905)))

(declare-fun b!134065 () Bool)

(assert (=> b!134065 (= e!88908 e!88903)))

(declare-fun res!111397 () Bool)

(assert (=> b!134065 (=> (not res!111397) (not e!88903))))

(assert (=> b!134065 (= res!111397 e!88904)))

(declare-fun res!111395 () Bool)

(assert (=> b!134065 (=> res!111395 e!88904)))

(assert (=> b!134065 (= res!111395 (bvsge (_1!6114 lt!207822) (_2!6114 lt!207822)))))

(assert (=> b!134065 (= lt!207823 ((_ extract 31 0) (bvsrem lt!207583 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134065 (= lt!207824 ((_ extract 31 0) (bvsrem lt!207574 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134065 (= lt!207822 (arrayBitIndices!0 lt!207574 lt!207583))))

(assert (= (and d!43091 (not res!111398)) b!134065))

(assert (= (and b!134065 (not res!111395)) b!134062))

(assert (= (and b!134065 res!111397) b!134060))

(assert (= (and b!134060 c!7653) b!134061))

(assert (= (and b!134060 (not c!7653)) b!134059))

(assert (= (and b!134059 res!111396) b!134064))

(assert (= (and b!134064 (not res!111399)) b!134063))

(assert (= (or b!134061 b!134063) bm!1725))

(declare-fun m!203639 () Bool)

(assert (=> b!134059 m!203639))

(declare-fun m!203641 () Bool)

(assert (=> b!134059 m!203641))

(assert (=> b!134059 m!203639))

(assert (=> b!134059 m!203641))

(declare-fun m!203643 () Bool)

(assert (=> b!134059 m!203643))

(declare-fun m!203645 () Bool)

(assert (=> bm!1725 m!203645))

(declare-fun m!203647 () Bool)

(assert (=> bm!1725 m!203647))

(declare-fun m!203649 () Bool)

(assert (=> bm!1725 m!203649))

(assert (=> bm!1725 m!203641))

(assert (=> bm!1725 m!203639))

(declare-fun m!203651 () Bool)

(assert (=> b!134062 m!203651))

(declare-fun m!203653 () Bool)

(assert (=> b!134065 m!203653))

(assert (=> b!133956 d!43091))

(assert (=> d!43029 d!43061))

(declare-fun d!43093 () Bool)

(declare-fun res!111400 () Bool)

(declare-fun e!88910 () Bool)

(assert (=> d!43093 (=> (not res!111400) (not e!88910))))

(assert (=> d!43093 (= res!111400 (= (size!2774 (buf!3157 (_1!6101 lt!207629))) (size!2774 (buf!3157 (_2!6101 lt!207629)))))))

(assert (=> d!43093 (= (isPrefixOf!0 (_1!6101 lt!207629) (_2!6101 lt!207629)) e!88910)))

(declare-fun b!134066 () Bool)

(declare-fun res!111402 () Bool)

(assert (=> b!134066 (=> (not res!111402) (not e!88910))))

(assert (=> b!134066 (= res!111402 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207629))) (currentByte!5948 (_1!6101 lt!207629)) (currentBit!5943 (_1!6101 lt!207629))) (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207629))) (currentByte!5948 (_2!6101 lt!207629)) (currentBit!5943 (_2!6101 lt!207629)))))))

(declare-fun b!134067 () Bool)

(declare-fun e!88909 () Bool)

(assert (=> b!134067 (= e!88910 e!88909)))

(declare-fun res!111401 () Bool)

(assert (=> b!134067 (=> res!111401 e!88909)))

(assert (=> b!134067 (= res!111401 (= (size!2774 (buf!3157 (_1!6101 lt!207629))) #b00000000000000000000000000000000))))

(declare-fun b!134068 () Bool)

(assert (=> b!134068 (= e!88909 (arrayBitRangesEq!0 (buf!3157 (_1!6101 lt!207629)) (buf!3157 (_2!6101 lt!207629)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207629))) (currentByte!5948 (_1!6101 lt!207629)) (currentBit!5943 (_1!6101 lt!207629)))))))

(assert (= (and d!43093 res!111400) b!134066))

(assert (= (and b!134066 res!111402) b!134067))

(assert (= (and b!134067 (not res!111401)) b!134068))

(declare-fun m!203655 () Bool)

(assert (=> b!134066 m!203655))

(declare-fun m!203657 () Bool)

(assert (=> b!134066 m!203657))

(assert (=> b!134068 m!203655))

(assert (=> b!134068 m!203655))

(declare-fun m!203659 () Bool)

(assert (=> b!134068 m!203659))

(assert (=> d!43029 d!43093))

(declare-fun d!43095 () Bool)

(assert (=> d!43095 (isPrefixOf!0 lt!207631 (_2!6102 lt!206848))))

(declare-fun lt!207825 () Unit!8283)

(assert (=> d!43095 (= lt!207825 (choose!30 lt!207631 thiss!1634 (_2!6102 lt!206848)))))

(assert (=> d!43095 (isPrefixOf!0 lt!207631 thiss!1634)))

(assert (=> d!43095 (= (lemmaIsPrefixTransitive!0 lt!207631 thiss!1634 (_2!6102 lt!206848)) lt!207825)))

(declare-fun bs!10510 () Bool)

(assert (= bs!10510 d!43095))

(assert (=> bs!10510 m!203497))

(declare-fun m!203661 () Bool)

(assert (=> bs!10510 m!203661))

(declare-fun m!203663 () Bool)

(assert (=> bs!10510 m!203663))

(assert (=> d!43029 d!43095))

(declare-fun d!43097 () Bool)

(declare-fun res!111403 () Bool)

(declare-fun e!88912 () Bool)

(assert (=> d!43097 (=> (not res!111403) (not e!88912))))

(assert (=> d!43097 (= res!111403 (= (size!2774 (buf!3157 lt!207631)) (size!2774 (buf!3157 lt!207631))))))

(assert (=> d!43097 (= (isPrefixOf!0 lt!207631 lt!207631) e!88912)))

(declare-fun b!134069 () Bool)

(declare-fun res!111405 () Bool)

(assert (=> b!134069 (=> (not res!111405) (not e!88912))))

(assert (=> b!134069 (= res!111405 (bvsle (bitIndex!0 (size!2774 (buf!3157 lt!207631)) (currentByte!5948 lt!207631) (currentBit!5943 lt!207631)) (bitIndex!0 (size!2774 (buf!3157 lt!207631)) (currentByte!5948 lt!207631) (currentBit!5943 lt!207631))))))

(declare-fun b!134070 () Bool)

(declare-fun e!88911 () Bool)

(assert (=> b!134070 (= e!88912 e!88911)))

(declare-fun res!111404 () Bool)

(assert (=> b!134070 (=> res!111404 e!88911)))

(assert (=> b!134070 (= res!111404 (= (size!2774 (buf!3157 lt!207631)) #b00000000000000000000000000000000))))

(declare-fun b!134071 () Bool)

(assert (=> b!134071 (= e!88911 (arrayBitRangesEq!0 (buf!3157 lt!207631) (buf!3157 lt!207631) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 lt!207631)) (currentByte!5948 lt!207631) (currentBit!5943 lt!207631))))))

(assert (= (and d!43097 res!111403) b!134069))

(assert (= (and b!134069 res!111405) b!134070))

(assert (= (and b!134070 (not res!111404)) b!134071))

(declare-fun m!203665 () Bool)

(assert (=> b!134069 m!203665))

(assert (=> b!134069 m!203665))

(assert (=> b!134071 m!203665))

(assert (=> b!134071 m!203665))

(declare-fun m!203667 () Bool)

(assert (=> b!134071 m!203667))

(assert (=> d!43029 d!43097))

(declare-fun d!43099 () Bool)

(assert (=> d!43099 (isPrefixOf!0 lt!207631 lt!207631)))

(declare-fun lt!207826 () Unit!8283)

(assert (=> d!43099 (= lt!207826 (choose!11 lt!207631))))

(assert (=> d!43099 (= (lemmaIsPrefixRefl!0 lt!207631) lt!207826)))

(declare-fun bs!10511 () Bool)

(assert (= bs!10511 d!43099))

(assert (=> bs!10511 m!203495))

(declare-fun m!203669 () Bool)

(assert (=> bs!10511 m!203669))

(assert (=> d!43029 d!43099))

(assert (=> d!43029 d!43069))

(declare-fun d!43101 () Bool)

(assert (=> d!43101 (isPrefixOf!0 lt!207631 (_2!6102 lt!206848))))

(declare-fun lt!207827 () Unit!8283)

(assert (=> d!43101 (= lt!207827 (choose!30 lt!207631 (_2!6102 lt!206848) (_2!6102 lt!206848)))))

(assert (=> d!43101 (isPrefixOf!0 lt!207631 (_2!6102 lt!206848))))

(assert (=> d!43101 (= (lemmaIsPrefixTransitive!0 lt!207631 (_2!6102 lt!206848) (_2!6102 lt!206848)) lt!207827)))

(declare-fun bs!10512 () Bool)

(assert (= bs!10512 d!43101))

(assert (=> bs!10512 m!203497))

(declare-fun m!203671 () Bool)

(assert (=> bs!10512 m!203671))

(assert (=> bs!10512 m!203497))

(assert (=> d!43029 d!43101))

(declare-fun d!43103 () Bool)

(declare-fun res!111406 () Bool)

(declare-fun e!88914 () Bool)

(assert (=> d!43103 (=> (not res!111406) (not e!88914))))

(assert (=> d!43103 (= res!111406 (= (size!2774 (buf!3157 thiss!1634)) (size!2774 (buf!3157 thiss!1634))))))

(assert (=> d!43103 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!88914)))

(declare-fun b!134072 () Bool)

(declare-fun res!111408 () Bool)

(assert (=> b!134072 (=> (not res!111408) (not e!88914))))

(assert (=> b!134072 (= res!111408 (bvsle (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)) (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(declare-fun b!134073 () Bool)

(declare-fun e!88913 () Bool)

(assert (=> b!134073 (= e!88914 e!88913)))

(declare-fun res!111407 () Bool)

(assert (=> b!134073 (=> res!111407 e!88913)))

(assert (=> b!134073 (= res!111407 (= (size!2774 (buf!3157 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!134074 () Bool)

(assert (=> b!134074 (= e!88913 (arrayBitRangesEq!0 (buf!3157 thiss!1634) (buf!3157 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (= (and d!43103 res!111406) b!134072))

(assert (= (and b!134072 res!111408) b!134073))

(assert (= (and b!134073 (not res!111407)) b!134074))

(assert (=> b!134072 m!202839))

(assert (=> b!134072 m!202839))

(assert (=> b!134074 m!202839))

(assert (=> b!134074 m!202839))

(declare-fun m!203673 () Bool)

(assert (=> b!134074 m!203673))

(assert (=> d!43029 d!43103))

(declare-fun d!43105 () Bool)

(assert (=> d!43105 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!207828 () Unit!8283)

(assert (=> d!43105 (= lt!207828 (choose!11 thiss!1634))))

(assert (=> d!43105 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!207828)))

(declare-fun bs!10513 () Bool)

(assert (= bs!10513 d!43105))

(assert (=> bs!10513 m!203389))

(declare-fun m!203675 () Bool)

(assert (=> bs!10513 m!203675))

(assert (=> d!43029 d!43105))

(declare-fun d!43107 () Bool)

(declare-fun res!111409 () Bool)

(declare-fun e!88916 () Bool)

(assert (=> d!43107 (=> (not res!111409) (not e!88916))))

(assert (=> d!43107 (= res!111409 (= (size!2774 (buf!3157 lt!207631)) (size!2774 (buf!3157 (_2!6102 lt!206848)))))))

(assert (=> d!43107 (= (isPrefixOf!0 lt!207631 (_2!6102 lt!206848)) e!88916)))

(declare-fun b!134075 () Bool)

(declare-fun res!111411 () Bool)

(assert (=> b!134075 (=> (not res!111411) (not e!88916))))

(assert (=> b!134075 (= res!111411 (bvsle (bitIndex!0 (size!2774 (buf!3157 lt!207631)) (currentByte!5948 lt!207631) (currentBit!5943 lt!207631)) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(declare-fun b!134076 () Bool)

(declare-fun e!88915 () Bool)

(assert (=> b!134076 (= e!88916 e!88915)))

(declare-fun res!111410 () Bool)

(assert (=> b!134076 (=> res!111410 e!88915)))

(assert (=> b!134076 (= res!111410 (= (size!2774 (buf!3157 lt!207631)) #b00000000000000000000000000000000))))

(declare-fun b!134077 () Bool)

(assert (=> b!134077 (= e!88915 (arrayBitRangesEq!0 (buf!3157 lt!207631) (buf!3157 (_2!6102 lt!206848)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 lt!207631)) (currentByte!5948 lt!207631) (currentBit!5943 lt!207631))))))

(assert (= (and d!43107 res!111409) b!134075))

(assert (= (and b!134075 res!111411) b!134076))

(assert (= (and b!134076 (not res!111410)) b!134077))

(assert (=> b!134075 m!203665))

(assert (=> b!134075 m!202827))

(assert (=> b!134077 m!203665))

(assert (=> b!134077 m!203665))

(declare-fun m!203677 () Bool)

(assert (=> b!134077 m!203677))

(assert (=> d!43029 d!43107))

(assert (=> d!43029 d!43025))

(declare-fun d!43109 () Bool)

(assert (=> d!43109 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) (bvsub (bvsub to!404 from!447) lt!207566)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!207566)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10514 () Bool)

(assert (= bs!10514 d!43109))

(assert (=> bs!10514 m!203359))

(assert (=> b!133955 d!43109))

(declare-fun d!43111 () Bool)

(assert (=> d!43111 (= (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 thiss!1634)))))))

(assert (=> d!42966 d!43111))

(declare-fun d!43113 () Bool)

(declare-fun res!111412 () Bool)

(declare-fun e!88918 () Bool)

(assert (=> d!43113 (=> (not res!111412) (not e!88918))))

(assert (=> d!43113 (= res!111412 (= (size!2774 (buf!3157 (_2!6101 lt!207571))) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(assert (=> d!43113 (= (isPrefixOf!0 (_2!6101 lt!207571) (_2!6102 lt!206855)) e!88918)))

(declare-fun b!134078 () Bool)

(declare-fun res!111414 () Bool)

(assert (=> b!134078 (=> (not res!111414) (not e!88918))))

(assert (=> b!134078 (= res!111414 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207571))) (currentByte!5948 (_2!6101 lt!207571)) (currentBit!5943 (_2!6101 lt!207571))) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855)))))))

(declare-fun b!134079 () Bool)

(declare-fun e!88917 () Bool)

(assert (=> b!134079 (= e!88918 e!88917)))

(declare-fun res!111413 () Bool)

(assert (=> b!134079 (=> res!111413 e!88917)))

(assert (=> b!134079 (= res!111413 (= (size!2774 (buf!3157 (_2!6101 lt!207571))) #b00000000000000000000000000000000))))

(declare-fun b!134080 () Bool)

(assert (=> b!134080 (= e!88917 (arrayBitRangesEq!0 (buf!3157 (_2!6101 lt!207571)) (buf!3157 (_2!6102 lt!206855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207571))) (currentByte!5948 (_2!6101 lt!207571)) (currentBit!5943 (_2!6101 lt!207571)))))))

(assert (= (and d!43113 res!111412) b!134078))

(assert (= (and b!134078 res!111414) b!134079))

(assert (= (and b!134079 (not res!111413)) b!134080))

(assert (=> b!134078 m!203611))

(assert (=> b!134078 m!202825))

(assert (=> b!134080 m!203611))

(assert (=> b!134080 m!203611))

(declare-fun m!203679 () Bool)

(assert (=> b!134080 m!203679))

(assert (=> b!133958 d!43113))

(assert (=> b!133984 d!43015))

(declare-fun d!43115 () Bool)

(assert (=> d!43115 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 thiss!1634) lt!207632 lt!207641)))

(declare-fun lt!207829 () Unit!8283)

(assert (=> d!43115 (= lt!207829 (choose!8 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206848)) lt!207632 lt!207641))))

(assert (=> d!43115 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207632) (bvsle lt!207632 lt!207641))))

(assert (=> d!43115 (= (arrayBitRangesEqSymmetric!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206848)) lt!207632 lt!207641) lt!207829)))

(declare-fun bs!10515 () Bool)

(assert (= bs!10515 d!43115))

(assert (=> bs!10515 m!203507))

(declare-fun m!203681 () Bool)

(assert (=> bs!10515 m!203681))

(assert (=> b!133984 d!43115))

(declare-fun b!134081 () Bool)

(declare-fun e!88922 () Bool)

(declare-fun e!88923 () Bool)

(assert (=> b!134081 (= e!88922 e!88923)))

(declare-fun lt!207832 () (_ BitVec 32))

(declare-fun res!111416 () Bool)

(declare-fun lt!207830 () tuple4!114)

(assert (=> b!134081 (= res!111416 (byteRangesEq!0 (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_3!314 lt!207830)) (select (arr!3424 (buf!3157 thiss!1634)) (_3!314 lt!207830)) lt!207832 #b00000000000000000000000000001000))))

(assert (=> b!134081 (=> (not res!111416) (not e!88923))))

(declare-fun b!134082 () Bool)

(declare-fun e!88919 () Bool)

(assert (=> b!134082 (= e!88919 e!88922)))

(declare-fun c!7654 () Bool)

(assert (=> b!134082 (= c!7654 (= (_3!314 lt!207830) (_4!57 lt!207830)))))

(declare-fun b!134083 () Bool)

(declare-fun call!1729 () Bool)

(assert (=> b!134083 (= e!88922 call!1729)))

(declare-fun d!43117 () Bool)

(declare-fun res!111418 () Bool)

(declare-fun e!88924 () Bool)

(assert (=> d!43117 (=> res!111418 e!88924)))

(assert (=> d!43117 (= res!111418 (bvsge lt!207632 lt!207641))))

(assert (=> d!43117 (= (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 thiss!1634) lt!207632 lt!207641) e!88924)))

(declare-fun lt!207831 () (_ BitVec 32))

(declare-fun bm!1726 () Bool)

(assert (=> bm!1726 (= call!1729 (byteRangesEq!0 (ite c!7654 (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_3!314 lt!207830)) (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_4!57 lt!207830))) (ite c!7654 (select (arr!3424 (buf!3157 thiss!1634)) (_3!314 lt!207830)) (select (arr!3424 (buf!3157 thiss!1634)) (_4!57 lt!207830))) (ite c!7654 lt!207832 #b00000000000000000000000000000000) lt!207831))))

(declare-fun e!88920 () Bool)

(declare-fun b!134084 () Bool)

(assert (=> b!134084 (= e!88920 (arrayRangesEq!177 (buf!3157 (_2!6102 lt!206848)) (buf!3157 thiss!1634) (_1!6114 lt!207830) (_2!6114 lt!207830)))))

(declare-fun b!134085 () Bool)

(declare-fun e!88921 () Bool)

(assert (=> b!134085 (= e!88921 call!1729)))

(declare-fun b!134086 () Bool)

(declare-fun res!111419 () Bool)

(assert (=> b!134086 (= res!111419 (= lt!207831 #b00000000000000000000000000000000))))

(assert (=> b!134086 (=> res!111419 e!88921)))

(assert (=> b!134086 (= e!88923 e!88921)))

(declare-fun b!134087 () Bool)

(assert (=> b!134087 (= e!88924 e!88919)))

(declare-fun res!111417 () Bool)

(assert (=> b!134087 (=> (not res!111417) (not e!88919))))

(assert (=> b!134087 (= res!111417 e!88920)))

(declare-fun res!111415 () Bool)

(assert (=> b!134087 (=> res!111415 e!88920)))

(assert (=> b!134087 (= res!111415 (bvsge (_1!6114 lt!207830) (_2!6114 lt!207830)))))

(assert (=> b!134087 (= lt!207831 ((_ extract 31 0) (bvsrem lt!207641 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134087 (= lt!207832 ((_ extract 31 0) (bvsrem lt!207632 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134087 (= lt!207830 (arrayBitIndices!0 lt!207632 lt!207641))))

(assert (= (and d!43117 (not res!111418)) b!134087))

(assert (= (and b!134087 (not res!111415)) b!134084))

(assert (= (and b!134087 res!111417) b!134082))

(assert (= (and b!134082 c!7654) b!134083))

(assert (= (and b!134082 (not c!7654)) b!134081))

(assert (= (and b!134081 res!111416) b!134086))

(assert (= (and b!134086 (not res!111419)) b!134085))

(assert (= (or b!134083 b!134085) bm!1726))

(declare-fun m!203683 () Bool)

(assert (=> b!134081 m!203683))

(declare-fun m!203685 () Bool)

(assert (=> b!134081 m!203685))

(assert (=> b!134081 m!203683))

(assert (=> b!134081 m!203685))

(declare-fun m!203687 () Bool)

(assert (=> b!134081 m!203687))

(declare-fun m!203689 () Bool)

(assert (=> bm!1726 m!203689))

(declare-fun m!203691 () Bool)

(assert (=> bm!1726 m!203691))

(declare-fun m!203693 () Bool)

(assert (=> bm!1726 m!203693))

(assert (=> bm!1726 m!203685))

(assert (=> bm!1726 m!203683))

(declare-fun m!203695 () Bool)

(assert (=> b!134084 m!203695))

(declare-fun m!203697 () Bool)

(assert (=> b!134087 m!203697))

(assert (=> b!133984 d!43117))

(assert (=> d!43011 d!43009))

(declare-fun d!43119 () Bool)

(assert (=> d!43119 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206845)))

(assert (=> d!43119 true))

(declare-fun _$6!280 () Unit!8283)

(assert (=> d!43119 (= (choose!9 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!206855)) lt!206845 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))) _$6!280)))

(declare-fun bs!10516 () Bool)

(assert (= bs!10516 d!43119))

(assert (=> bs!10516 m!202767))

(assert (=> d!43011 d!43119))

(declare-fun lt!207835 () (_ BitVec 8))

(declare-fun lt!207839 () (_ BitVec 8))

(declare-fun d!43121 () Bool)

(assert (=> d!43121 (= lt!207835 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3424 (buf!3157 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))) (currentByte!5948 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))) ((_ sign_extend 24) lt!207839))))))

(assert (=> d!43121 (= lt!207839 ((_ extract 7 0) (currentBit!5943 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))))

(declare-fun e!88925 () Bool)

(assert (=> d!43121 e!88925))

(declare-fun res!111420 () Bool)

(assert (=> d!43121 (=> (not res!111420) (not e!88925))))

(assert (=> d!43121 (= res!111420 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))) ((_ sign_extend 32) (currentByte!5948 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))) ((_ sign_extend 32) (currentBit!5943 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8307 () Unit!8283)

(declare-fun Unit!8308 () Unit!8283)

(assert (=> d!43121 (= (readByte!0 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) (tuple2!11599 (_2!6115 (ite (bvsgt ((_ sign_extend 24) lt!207839) #b00000000000000000000000000000000) (tuple2!11601 Unit!8307 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!207835) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3424 (buf!3157 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))) (bvadd (currentByte!5948 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!207839)))))))) (tuple2!11601 Unit!8308 lt!207835))) (BitStream!4813 (buf!3157 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) (bvadd (currentByte!5948 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5943 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))))

(declare-fun b!134088 () Bool)

(declare-fun e!88926 () Bool)

(assert (=> b!134088 (= e!88925 e!88926)))

(declare-fun res!111421 () Bool)

(assert (=> b!134088 (=> (not res!111421) (not e!88926))))

(declare-fun lt!207833 () tuple2!11598)

(assert (=> b!134088 (= res!111421 (= (buf!3157 (_2!6112 lt!207833)) (buf!3157 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))))

(declare-fun lt!207836 () (_ BitVec 8))

(declare-fun lt!207837 () (_ BitVec 8))

(declare-fun Unit!8309 () Unit!8283)

(declare-fun Unit!8310 () Unit!8283)

(assert (=> b!134088 (= lt!207833 (tuple2!11599 (_2!6115 (ite (bvsgt ((_ sign_extend 24) lt!207837) #b00000000000000000000000000000000) (tuple2!11601 Unit!8309 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!207836) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3424 (buf!3157 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))) (bvadd (currentByte!5948 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!207837)))))))) (tuple2!11601 Unit!8310 lt!207836))) (BitStream!4813 (buf!3157 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) (bvadd (currentByte!5948 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5943 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))))

(assert (=> b!134088 (= lt!207836 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3424 (buf!3157 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))) (currentByte!5948 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))) ((_ sign_extend 24) lt!207837))))))

(assert (=> b!134088 (= lt!207837 ((_ extract 7 0) (currentBit!5943 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))))

(declare-fun b!134089 () Bool)

(declare-fun lt!207834 () (_ BitVec 64))

(declare-fun lt!207838 () (_ BitVec 64))

(assert (=> b!134089 (= e!88926 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207833))) (currentByte!5948 (_2!6112 lt!207833)) (currentBit!5943 (_2!6112 lt!207833))) (bvadd lt!207838 lt!207834)))))

(assert (=> b!134089 (or (not (= (bvand lt!207838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207834 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207838 lt!207834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134089 (= lt!207834 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!134089 (= lt!207838 (bitIndex!0 (size!2774 (buf!3157 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))) (currentByte!5948 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) (currentBit!5943 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))))

(assert (= (and d!43121 res!111420) b!134088))

(assert (= (and b!134088 res!111421) b!134089))

(declare-fun m!203699 () Bool)

(assert (=> d!43121 m!203699))

(declare-fun m!203701 () Bool)

(assert (=> d!43121 m!203701))

(declare-fun m!203703 () Bool)

(assert (=> d!43121 m!203703))

(assert (=> b!134088 m!203703))

(assert (=> b!134088 m!203699))

(declare-fun m!203705 () Bool)

(assert (=> b!134089 m!203705))

(declare-fun m!203707 () Bool)

(assert (=> b!134089 m!203707))

(assert (=> d!42976 d!43121))

(declare-fun d!43123 () Bool)

(declare-fun res!111422 () Bool)

(declare-fun e!88928 () Bool)

(assert (=> d!43123 (=> (not res!111422) (not e!88928))))

(assert (=> d!43123 (= res!111422 (= (size!2774 (buf!3157 (_2!6101 lt!207629))) (size!2774 (buf!3157 (_2!6102 lt!206848)))))))

(assert (=> d!43123 (= (isPrefixOf!0 (_2!6101 lt!207629) (_2!6102 lt!206848)) e!88928)))

(declare-fun b!134090 () Bool)

(declare-fun res!111424 () Bool)

(assert (=> b!134090 (=> (not res!111424) (not e!88928))))

(assert (=> b!134090 (= res!111424 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207629))) (currentByte!5948 (_2!6101 lt!207629)) (currentBit!5943 (_2!6101 lt!207629))) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(declare-fun b!134091 () Bool)

(declare-fun e!88927 () Bool)

(assert (=> b!134091 (= e!88928 e!88927)))

(declare-fun res!111423 () Bool)

(assert (=> b!134091 (=> res!111423 e!88927)))

(assert (=> b!134091 (= res!111423 (= (size!2774 (buf!3157 (_2!6101 lt!207629))) #b00000000000000000000000000000000))))

(declare-fun b!134092 () Bool)

(assert (=> b!134092 (= e!88927 (arrayBitRangesEq!0 (buf!3157 (_2!6101 lt!207629)) (buf!3157 (_2!6102 lt!206848)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207629))) (currentByte!5948 (_2!6101 lt!207629)) (currentBit!5943 (_2!6101 lt!207629)))))))

(assert (= (and d!43123 res!111422) b!134090))

(assert (= (and b!134090 res!111424) b!134091))

(assert (= (and b!134091 (not res!111423)) b!134092))

(assert (=> b!134090 m!203657))

(assert (=> b!134090 m!202827))

(assert (=> b!134092 m!203657))

(assert (=> b!134092 m!203657))

(declare-fun m!203709 () Bool)

(assert (=> b!134092 m!203709))

(assert (=> b!133986 d!43123))

(declare-fun b!134093 () Bool)

(declare-fun e!88932 () Bool)

(declare-fun e!88933 () Bool)

(assert (=> b!134093 (= e!88932 e!88933)))

(declare-fun lt!207842 () (_ BitVec 32))

(declare-fun lt!207840 () tuple4!114)

(declare-fun res!111426 () Bool)

(assert (=> b!134093 (= res!111426 (byteRangesEq!0 (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_3!314 lt!207840)) (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_3!314 lt!207840)) lt!207842 #b00000000000000000000000000001000))))

(assert (=> b!134093 (=> (not res!111426) (not e!88933))))

(declare-fun b!134094 () Bool)

(declare-fun e!88929 () Bool)

(assert (=> b!134094 (= e!88929 e!88932)))

(declare-fun c!7655 () Bool)

(assert (=> b!134094 (= c!7655 (= (_3!314 lt!207840) (_4!57 lt!207840)))))

(declare-fun b!134095 () Bool)

(declare-fun call!1730 () Bool)

(assert (=> b!134095 (= e!88932 call!1730)))

(declare-fun d!43125 () Bool)

(declare-fun res!111428 () Bool)

(declare-fun e!88934 () Bool)

(assert (=> d!43125 (=> res!111428 e!88934)))

(assert (=> d!43125 (= res!111428 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(assert (=> d!43125 (= (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 (_2!6102 lt!206855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))) e!88934)))

(declare-fun lt!207841 () (_ BitVec 32))

(declare-fun bm!1727 () Bool)

(assert (=> bm!1727 (= call!1730 (byteRangesEq!0 (ite c!7655 (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_3!314 lt!207840)) (select (arr!3424 (buf!3157 (_2!6102 lt!206848))) (_4!57 lt!207840))) (ite c!7655 (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_3!314 lt!207840)) (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_4!57 lt!207840))) (ite c!7655 lt!207842 #b00000000000000000000000000000000) lt!207841))))

(declare-fun e!88930 () Bool)

(declare-fun b!134096 () Bool)

(assert (=> b!134096 (= e!88930 (arrayRangesEq!177 (buf!3157 (_2!6102 lt!206848)) (buf!3157 (_2!6102 lt!206855)) (_1!6114 lt!207840) (_2!6114 lt!207840)))))

(declare-fun b!134097 () Bool)

(declare-fun e!88931 () Bool)

(assert (=> b!134097 (= e!88931 call!1730)))

(declare-fun b!134098 () Bool)

(declare-fun res!111429 () Bool)

(assert (=> b!134098 (= res!111429 (= lt!207841 #b00000000000000000000000000000000))))

(assert (=> b!134098 (=> res!111429 e!88931)))

(assert (=> b!134098 (= e!88933 e!88931)))

(declare-fun b!134099 () Bool)

(assert (=> b!134099 (= e!88934 e!88929)))

(declare-fun res!111427 () Bool)

(assert (=> b!134099 (=> (not res!111427) (not e!88929))))

(assert (=> b!134099 (= res!111427 e!88930)))

(declare-fun res!111425 () Bool)

(assert (=> b!134099 (=> res!111425 e!88930)))

(assert (=> b!134099 (= res!111425 (bvsge (_1!6114 lt!207840) (_2!6114 lt!207840)))))

(assert (=> b!134099 (= lt!207841 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134099 (= lt!207842 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134099 (= lt!207840 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(assert (= (and d!43125 (not res!111428)) b!134099))

(assert (= (and b!134099 (not res!111425)) b!134096))

(assert (= (and b!134099 res!111427) b!134094))

(assert (= (and b!134094 c!7655) b!134095))

(assert (= (and b!134094 (not c!7655)) b!134093))

(assert (= (and b!134093 res!111426) b!134098))

(assert (= (and b!134098 (not res!111429)) b!134097))

(assert (= (or b!134095 b!134097) bm!1727))

(declare-fun m!203711 () Bool)

(assert (=> b!134093 m!203711))

(declare-fun m!203713 () Bool)

(assert (=> b!134093 m!203713))

(assert (=> b!134093 m!203711))

(assert (=> b!134093 m!203713))

(declare-fun m!203715 () Bool)

(assert (=> b!134093 m!203715))

(declare-fun m!203717 () Bool)

(assert (=> bm!1727 m!203717))

(declare-fun m!203719 () Bool)

(assert (=> bm!1727 m!203719))

(declare-fun m!203721 () Bool)

(assert (=> bm!1727 m!203721))

(assert (=> bm!1727 m!203713))

(assert (=> bm!1727 m!203711))

(declare-fun m!203723 () Bool)

(assert (=> b!134096 m!203723))

(assert (=> b!134099 m!202827))

(declare-fun m!203725 () Bool)

(assert (=> b!134099 m!203725))

(assert (=> b!133972 d!43125))

(assert (=> b!133972 d!43013))

(declare-fun b!134100 () Bool)

(declare-fun e!88938 () Bool)

(declare-fun e!88939 () Bool)

(assert (=> b!134100 (= e!88938 e!88939)))

(declare-fun lt!207843 () tuple4!114)

(declare-fun lt!207845 () (_ BitVec 32))

(declare-fun res!111431 () Bool)

(assert (=> b!134100 (= res!111431 (byteRangesEq!0 (select (arr!3424 (buf!3157 thiss!1634)) (_3!314 lt!207843)) (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_3!314 lt!207843)) lt!207845 #b00000000000000000000000000001000))))

(assert (=> b!134100 (=> (not res!111431) (not e!88939))))

(declare-fun b!134101 () Bool)

(declare-fun e!88935 () Bool)

(assert (=> b!134101 (= e!88935 e!88938)))

(declare-fun c!7656 () Bool)

(assert (=> b!134101 (= c!7656 (= (_3!314 lt!207843) (_4!57 lt!207843)))))

(declare-fun b!134102 () Bool)

(declare-fun call!1731 () Bool)

(assert (=> b!134102 (= e!88938 call!1731)))

(declare-fun d!43127 () Bool)

(declare-fun res!111433 () Bool)

(declare-fun e!88940 () Bool)

(assert (=> d!43127 (=> res!111433 e!88940)))

(assert (=> d!43127 (= res!111433 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (=> d!43127 (= (arrayBitRangesEq!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) e!88940)))

(declare-fun bm!1728 () Bool)

(declare-fun lt!207844 () (_ BitVec 32))

(assert (=> bm!1728 (= call!1731 (byteRangesEq!0 (ite c!7656 (select (arr!3424 (buf!3157 thiss!1634)) (_3!314 lt!207843)) (select (arr!3424 (buf!3157 thiss!1634)) (_4!57 lt!207843))) (ite c!7656 (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_3!314 lt!207843)) (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_4!57 lt!207843))) (ite c!7656 lt!207845 #b00000000000000000000000000000000) lt!207844))))

(declare-fun b!134103 () Bool)

(declare-fun e!88936 () Bool)

(assert (=> b!134103 (= e!88936 (arrayRangesEq!177 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206855)) (_1!6114 lt!207843) (_2!6114 lt!207843)))))

(declare-fun b!134104 () Bool)

(declare-fun e!88937 () Bool)

(assert (=> b!134104 (= e!88937 call!1731)))

(declare-fun b!134105 () Bool)

(declare-fun res!111434 () Bool)

(assert (=> b!134105 (= res!111434 (= lt!207844 #b00000000000000000000000000000000))))

(assert (=> b!134105 (=> res!111434 e!88937)))

(assert (=> b!134105 (= e!88939 e!88937)))

(declare-fun b!134106 () Bool)

(assert (=> b!134106 (= e!88940 e!88935)))

(declare-fun res!111432 () Bool)

(assert (=> b!134106 (=> (not res!111432) (not e!88935))))

(assert (=> b!134106 (= res!111432 e!88936)))

(declare-fun res!111430 () Bool)

(assert (=> b!134106 (=> res!111430 e!88936)))

(assert (=> b!134106 (= res!111430 (bvsge (_1!6114 lt!207843) (_2!6114 lt!207843)))))

(assert (=> b!134106 (= lt!207844 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134106 (= lt!207845 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134106 (= lt!207843 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (= (and d!43127 (not res!111433)) b!134106))

(assert (= (and b!134106 (not res!111430)) b!134103))

(assert (= (and b!134106 res!111432) b!134101))

(assert (= (and b!134101 c!7656) b!134102))

(assert (= (and b!134101 (not c!7656)) b!134100))

(assert (= (and b!134100 res!111431) b!134105))

(assert (= (and b!134105 (not res!111434)) b!134104))

(assert (= (or b!134102 b!134104) bm!1728))

(declare-fun m!203727 () Bool)

(assert (=> b!134100 m!203727))

(declare-fun m!203729 () Bool)

(assert (=> b!134100 m!203729))

(assert (=> b!134100 m!203727))

(assert (=> b!134100 m!203729))

(declare-fun m!203731 () Bool)

(assert (=> b!134100 m!203731))

(declare-fun m!203733 () Bool)

(assert (=> bm!1728 m!203733))

(declare-fun m!203735 () Bool)

(assert (=> bm!1728 m!203735))

(declare-fun m!203737 () Bool)

(assert (=> bm!1728 m!203737))

(assert (=> bm!1728 m!203729))

(assert (=> bm!1728 m!203727))

(declare-fun m!203739 () Bool)

(assert (=> b!134103 m!203739))

(assert (=> b!134106 m!202839))

(assert (=> b!134106 m!203523))

(assert (=> b!133926 d!43127))

(assert (=> b!133926 d!43015))

(declare-fun d!43129 () Bool)

(declare-fun lt!207848 () (_ BitVec 8))

(declare-fun lt!207852 () (_ BitVec 8))

(assert (=> d!43129 (= lt!207848 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3424 (buf!3157 (_1!6101 lt!206843))) (currentByte!5948 (_1!6101 lt!206843)))) ((_ sign_extend 24) lt!207852))))))

(assert (=> d!43129 (= lt!207852 ((_ extract 7 0) (currentBit!5943 (_1!6101 lt!206843))))))

(declare-fun e!88941 () Bool)

(assert (=> d!43129 e!88941))

(declare-fun res!111435 () Bool)

(assert (=> d!43129 (=> (not res!111435) (not e!88941))))

(assert (=> d!43129 (= res!111435 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_1!6101 lt!206843)))) ((_ sign_extend 32) (currentByte!5948 (_1!6101 lt!206843))) ((_ sign_extend 32) (currentBit!5943 (_1!6101 lt!206843))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8311 () Unit!8283)

(declare-fun Unit!8312 () Unit!8283)

(assert (=> d!43129 (= (readByte!0 (_1!6101 lt!206843)) (tuple2!11599 (_2!6115 (ite (bvsgt ((_ sign_extend 24) lt!207852) #b00000000000000000000000000000000) (tuple2!11601 Unit!8311 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!207848) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3424 (buf!3157 (_1!6101 lt!206843))) (bvadd (currentByte!5948 (_1!6101 lt!206843)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!207852)))))))) (tuple2!11601 Unit!8312 lt!207848))) (BitStream!4813 (buf!3157 (_1!6101 lt!206843)) (bvadd (currentByte!5948 (_1!6101 lt!206843)) #b00000000000000000000000000000001) (currentBit!5943 (_1!6101 lt!206843)))))))

(declare-fun b!134107 () Bool)

(declare-fun e!88942 () Bool)

(assert (=> b!134107 (= e!88941 e!88942)))

(declare-fun res!111436 () Bool)

(assert (=> b!134107 (=> (not res!111436) (not e!88942))))

(declare-fun lt!207846 () tuple2!11598)

(assert (=> b!134107 (= res!111436 (= (buf!3157 (_2!6112 lt!207846)) (buf!3157 (_1!6101 lt!206843))))))

(declare-fun lt!207849 () (_ BitVec 8))

(declare-fun lt!207850 () (_ BitVec 8))

(declare-fun Unit!8313 () Unit!8283)

(declare-fun Unit!8314 () Unit!8283)

(assert (=> b!134107 (= lt!207846 (tuple2!11599 (_2!6115 (ite (bvsgt ((_ sign_extend 24) lt!207850) #b00000000000000000000000000000000) (tuple2!11601 Unit!8313 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!207849) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3424 (buf!3157 (_1!6101 lt!206843))) (bvadd (currentByte!5948 (_1!6101 lt!206843)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!207850)))))))) (tuple2!11601 Unit!8314 lt!207849))) (BitStream!4813 (buf!3157 (_1!6101 lt!206843)) (bvadd (currentByte!5948 (_1!6101 lt!206843)) #b00000000000000000000000000000001) (currentBit!5943 (_1!6101 lt!206843)))))))

(assert (=> b!134107 (= lt!207849 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3424 (buf!3157 (_1!6101 lt!206843))) (currentByte!5948 (_1!6101 lt!206843)))) ((_ sign_extend 24) lt!207850))))))

(assert (=> b!134107 (= lt!207850 ((_ extract 7 0) (currentBit!5943 (_1!6101 lt!206843))))))

(declare-fun b!134108 () Bool)

(declare-fun lt!207851 () (_ BitVec 64))

(declare-fun lt!207847 () (_ BitVec 64))

(assert (=> b!134108 (= e!88942 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207846))) (currentByte!5948 (_2!6112 lt!207846)) (currentBit!5943 (_2!6112 lt!207846))) (bvadd lt!207851 lt!207847)))))

(assert (=> b!134108 (or (not (= (bvand lt!207851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207847 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207851 lt!207847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134108 (= lt!207847 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!134108 (= lt!207851 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!206843))) (currentByte!5948 (_1!6101 lt!206843)) (currentBit!5943 (_1!6101 lt!206843))))))

(assert (= (and d!43129 res!111435) b!134107))

(assert (= (and b!134107 res!111436) b!134108))

(declare-fun m!203741 () Bool)

(assert (=> d!43129 m!203741))

(declare-fun m!203743 () Bool)

(assert (=> d!43129 m!203743))

(declare-fun m!203745 () Bool)

(assert (=> d!43129 m!203745))

(assert (=> b!134107 m!203745))

(assert (=> b!134107 m!203741))

(declare-fun m!203747 () Bool)

(assert (=> b!134108 m!203747))

(declare-fun m!203749 () Bool)

(assert (=> b!134108 m!203749))

(assert (=> d!42995 d!43129))

(assert (=> d!42972 d!43081))

(assert (=> b!133970 d!43013))

(assert (=> b!133970 d!43017))

(declare-fun d!43131 () Bool)

(declare-fun e!88945 () Bool)

(assert (=> d!43131 e!88945))

(declare-fun res!111439 () Bool)

(assert (=> d!43131 (=> (not res!111439) (not e!88945))))

(declare-fun moveByteIndexPrecond!0 (BitStream!4812 (_ BitVec 32)) Bool)

(assert (=> d!43131 (= res!111439 (moveByteIndexPrecond!0 (_1!6101 lt!206843) #b00000000000000000000000000000001))))

(declare-fun Unit!8315 () Unit!8283)

(assert (=> d!43131 (= (moveByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001) (tuple2!11583 Unit!8315 (BitStream!4813 (buf!3157 (_1!6101 lt!206843)) (bvadd (currentByte!5948 (_1!6101 lt!206843)) #b00000000000000000000000000000001) (currentBit!5943 (_1!6101 lt!206843)))))))

(declare-fun b!134111 () Bool)

(assert (=> b!134111 (= e!88945 (and (or (not (= (bvand (currentByte!5948 (_1!6101 lt!206843)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!5948 (_1!6101 lt!206843)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!5948 (_1!6101 lt!206843)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!5948 (_1!6101 lt!206843)) #b00000000000000000000000000000001) (bvadd (currentByte!5948 (_1!6101 lt!206843)) #b00000000000000000000000000000001))))))

(assert (= (and d!43131 res!111439) b!134111))

(declare-fun m!203751 () Bool)

(assert (=> d!43131 m!203751))

(assert (=> d!42999 d!43131))

(assert (=> b!133924 d!43015))

(assert (=> b!133924 d!43017))

(declare-fun d!43133 () Bool)

(declare-fun res!111440 () Bool)

(declare-fun e!88947 () Bool)

(assert (=> d!43133 (=> (not res!111440) (not e!88947))))

(assert (=> d!43133 (= res!111440 (= (size!2774 (buf!3157 thiss!1634)) (size!2774 (buf!3157 (_2!6102 lt!207603)))))))

(assert (=> d!43133 (= (isPrefixOf!0 thiss!1634 (_2!6102 lt!207603)) e!88947)))

(declare-fun b!134112 () Bool)

(declare-fun res!111442 () Bool)

(assert (=> b!134112 (=> (not res!111442) (not e!88947))))

(assert (=> b!134112 (= res!111442 (bvsle (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!207603))) (currentByte!5948 (_2!6102 lt!207603)) (currentBit!5943 (_2!6102 lt!207603)))))))

(declare-fun b!134113 () Bool)

(declare-fun e!88946 () Bool)

(assert (=> b!134113 (= e!88947 e!88946)))

(declare-fun res!111441 () Bool)

(assert (=> b!134113 (=> res!111441 e!88946)))

(assert (=> b!134113 (= res!111441 (= (size!2774 (buf!3157 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!134114 () Bool)

(assert (=> b!134114 (= e!88946 (arrayBitRangesEq!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!207603)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(assert (= (and d!43133 res!111440) b!134112))

(assert (= (and b!134112 res!111442) b!134113))

(assert (= (and b!134113 (not res!111441)) b!134114))

(assert (=> b!134112 m!202839))

(assert (=> b!134112 m!203455))

(assert (=> b!134114 m!202839))

(assert (=> b!134114 m!202839))

(declare-fun m!203753 () Bool)

(assert (=> b!134114 m!203753))

(assert (=> b!133968 d!43133))

(declare-fun lt!207853 () tuple3!512)

(declare-fun d!43135 () Bool)

(assert (=> d!43135 (= lt!207853 (readByteArrayLoop!0 (_1!6101 lt!207429) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43135 (= (readByteArrayLoopPure!0 (_1!6101 lt!207429) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11585 (_2!6113 lt!207853) (_3!313 lt!207853)))))

(declare-fun bs!10517 () Bool)

(assert (= bs!10517 d!43135))

(declare-fun m!203755 () Bool)

(assert (=> bs!10517 m!203755))

(assert (=> b!133913 d!43135))

(declare-fun d!43137 () Bool)

(assert (=> d!43137 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207428)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!207434) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207428)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))) lt!207434))))

(declare-fun bs!10518 () Bool)

(assert (= bs!10518 d!43137))

(declare-fun m!203757 () Bool)

(assert (=> bs!10518 m!203757))

(assert (=> b!133913 d!43137))

(declare-fun d!43139 () Bool)

(assert (=> d!43139 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207428)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!207434)))

(declare-fun lt!207854 () Unit!8283)

(assert (=> d!43139 (= lt!207854 (choose!9 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!207428)) lt!207434 (BitStream!4813 (buf!3157 (_2!6102 lt!207428)) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(assert (=> d!43139 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!207428)) lt!207434) lt!207854)))

(declare-fun bs!10519 () Bool)

(assert (= bs!10519 d!43139))

(assert (=> bs!10519 m!203331))

(declare-fun m!203759 () Bool)

(assert (=> bs!10519 m!203759))

(assert (=> b!133913 d!43139))

(declare-fun d!43141 () Bool)

(declare-fun e!88948 () Bool)

(assert (=> d!43141 e!88948))

(declare-fun res!111443 () Bool)

(assert (=> d!43141 (=> (not res!111443) (not e!88948))))

(declare-fun lt!207855 () tuple2!11580)

(assert (=> d!43141 (= res!111443 (isPrefixOf!0 (_1!6101 lt!207855) (_2!6101 lt!207855)))))

(declare-fun lt!207857 () BitStream!4812)

(assert (=> d!43141 (= lt!207855 (tuple2!11581 lt!207857 (_2!6102 lt!207428)))))

(declare-fun lt!207873 () Unit!8283)

(declare-fun lt!207862 () Unit!8283)

(assert (=> d!43141 (= lt!207873 lt!207862)))

(assert (=> d!43141 (isPrefixOf!0 lt!207857 (_2!6102 lt!207428))))

(assert (=> d!43141 (= lt!207862 (lemmaIsPrefixTransitive!0 lt!207857 (_2!6102 lt!207428) (_2!6102 lt!207428)))))

(declare-fun lt!207864 () Unit!8283)

(declare-fun lt!207859 () Unit!8283)

(assert (=> d!43141 (= lt!207864 lt!207859)))

(assert (=> d!43141 (isPrefixOf!0 lt!207857 (_2!6102 lt!207428))))

(assert (=> d!43141 (= lt!207859 (lemmaIsPrefixTransitive!0 lt!207857 (_2!6102 lt!206848) (_2!6102 lt!207428)))))

(declare-fun lt!207872 () Unit!8283)

(declare-fun e!88949 () Unit!8283)

(assert (=> d!43141 (= lt!207872 e!88949)))

(declare-fun c!7657 () Bool)

(assert (=> d!43141 (= c!7657 (not (= (size!2774 (buf!3157 (_2!6102 lt!206848))) #b00000000000000000000000000000000)))))

(declare-fun lt!207870 () Unit!8283)

(declare-fun lt!207860 () Unit!8283)

(assert (=> d!43141 (= lt!207870 lt!207860)))

(assert (=> d!43141 (isPrefixOf!0 (_2!6102 lt!207428) (_2!6102 lt!207428))))

(assert (=> d!43141 (= lt!207860 (lemmaIsPrefixRefl!0 (_2!6102 lt!207428)))))

(declare-fun lt!207874 () Unit!8283)

(declare-fun lt!207869 () Unit!8283)

(assert (=> d!43141 (= lt!207874 lt!207869)))

(assert (=> d!43141 (= lt!207869 (lemmaIsPrefixRefl!0 (_2!6102 lt!207428)))))

(declare-fun lt!207861 () Unit!8283)

(declare-fun lt!207871 () Unit!8283)

(assert (=> d!43141 (= lt!207861 lt!207871)))

(assert (=> d!43141 (isPrefixOf!0 lt!207857 lt!207857)))

(assert (=> d!43141 (= lt!207871 (lemmaIsPrefixRefl!0 lt!207857))))

(declare-fun lt!207865 () Unit!8283)

(declare-fun lt!207856 () Unit!8283)

(assert (=> d!43141 (= lt!207865 lt!207856)))

(assert (=> d!43141 (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!206848))))

(assert (=> d!43141 (= lt!207856 (lemmaIsPrefixRefl!0 (_2!6102 lt!206848)))))

(assert (=> d!43141 (= lt!207857 (BitStream!4813 (buf!3157 (_2!6102 lt!207428)) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))))))

(assert (=> d!43141 (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!207428))))

(assert (=> d!43141 (= (reader!0 (_2!6102 lt!206848) (_2!6102 lt!207428)) lt!207855)))

(declare-fun b!134115 () Bool)

(declare-fun lt!207868 () Unit!8283)

(assert (=> b!134115 (= e!88949 lt!207868)))

(declare-fun lt!207858 () (_ BitVec 64))

(assert (=> b!134115 (= lt!207858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207867 () (_ BitVec 64))

(assert (=> b!134115 (= lt!207867 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))))))

(assert (=> b!134115 (= lt!207868 (arrayBitRangesEqSymmetric!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 (_2!6102 lt!207428)) lt!207858 lt!207867))))

(assert (=> b!134115 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!207428)) (buf!3157 (_2!6102 lt!206848)) lt!207858 lt!207867)))

(declare-fun b!134116 () Bool)

(declare-fun res!111444 () Bool)

(assert (=> b!134116 (=> (not res!111444) (not e!88948))))

(assert (=> b!134116 (= res!111444 (isPrefixOf!0 (_1!6101 lt!207855) (_2!6102 lt!206848)))))

(declare-fun b!134117 () Bool)

(declare-fun res!111445 () Bool)

(assert (=> b!134117 (=> (not res!111445) (not e!88948))))

(assert (=> b!134117 (= res!111445 (isPrefixOf!0 (_2!6101 lt!207855) (_2!6102 lt!207428)))))

(declare-fun b!134118 () Bool)

(declare-fun lt!207866 () (_ BitVec 64))

(declare-fun lt!207863 () (_ BitVec 64))

(assert (=> b!134118 (= e!88948 (= (_1!6101 lt!207855) (withMovedBitIndex!0 (_2!6101 lt!207855) (bvsub lt!207866 lt!207863))))))

(assert (=> b!134118 (or (= (bvand lt!207866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207863 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207866 lt!207863) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134118 (= lt!207863 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!207428))) (currentByte!5948 (_2!6102 lt!207428)) (currentBit!5943 (_2!6102 lt!207428))))))

(assert (=> b!134118 (= lt!207866 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))))))

(declare-fun b!134119 () Bool)

(declare-fun Unit!8316 () Unit!8283)

(assert (=> b!134119 (= e!88949 Unit!8316)))

(assert (= (and d!43141 c!7657) b!134115))

(assert (= (and d!43141 (not c!7657)) b!134119))

(assert (= (and d!43141 res!111443) b!134116))

(assert (= (and b!134116 res!111444) b!134117))

(assert (= (and b!134117 res!111445) b!134118))

(assert (=> d!43141 m!203425))

(declare-fun m!203761 () Bool)

(assert (=> d!43141 m!203761))

(declare-fun m!203763 () Bool)

(assert (=> d!43141 m!203763))

(declare-fun m!203765 () Bool)

(assert (=> d!43141 m!203765))

(declare-fun m!203767 () Bool)

(assert (=> d!43141 m!203767))

(declare-fun m!203769 () Bool)

(assert (=> d!43141 m!203769))

(assert (=> d!43141 m!203435))

(declare-fun m!203771 () Bool)

(assert (=> d!43141 m!203771))

(assert (=> d!43141 m!203325))

(declare-fun m!203773 () Bool)

(assert (=> d!43141 m!203773))

(declare-fun m!203775 () Bool)

(assert (=> d!43141 m!203775))

(declare-fun m!203777 () Bool)

(assert (=> b!134116 m!203777))

(declare-fun m!203779 () Bool)

(assert (=> b!134118 m!203779))

(assert (=> b!134118 m!203323))

(assert (=> b!134118 m!202827))

(declare-fun m!203781 () Bool)

(assert (=> b!134117 m!203781))

(assert (=> b!134115 m!202827))

(declare-fun m!203783 () Bool)

(assert (=> b!134115 m!203783))

(declare-fun m!203785 () Bool)

(assert (=> b!134115 m!203785))

(assert (=> b!133913 d!43141))

(declare-fun d!43143 () Bool)

(assert (=> d!43143 (arrayRangesEq!177 (_2!6103 (readByteArrayLoopPure!0 (_1!6101 lt!206843) arr!237 from!447 to!404)) (_2!6103 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001) (array!6130 (store (arr!3424 arr!237) from!447 (_2!6100 (readBytePure!0 (_1!6101 lt!206843)))) (size!2774 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!43143 true))

(declare-fun _$13!40 () Unit!8283)

(assert (=> d!43143 (= (choose!35 (_1!6101 lt!206843) arr!237 from!447 to!404 lt!207485 (_2!6103 lt!207485) lt!207486 lt!207487 (_2!6103 lt!207487)) _$13!40)))

(declare-fun bs!10521 () Bool)

(assert (= bs!10521 d!43143))

(declare-fun m!203787 () Bool)

(assert (=> bs!10521 m!203787))

(assert (=> bs!10521 m!202787))

(assert (=> bs!10521 m!203369))

(assert (=> bs!10521 m!202779))

(assert (=> bs!10521 m!202785))

(assert (=> bs!10521 m!202787))

(declare-fun m!203789 () Bool)

(assert (=> bs!10521 m!203789))

(assert (=> d!42978 d!43143))

(assert (=> d!42978 d!42990))

(declare-fun d!43145 () Bool)

(declare-fun res!111446 () Bool)

(declare-fun e!88950 () Bool)

(assert (=> d!43145 (=> res!111446 e!88950)))

(assert (=> d!43145 (= res!111446 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43145 (= (arrayRangesEq!177 (_2!6103 lt!207485) (_2!6103 lt!207487) #b00000000000000000000000000000000 to!404) e!88950)))

(declare-fun b!134120 () Bool)

(declare-fun e!88951 () Bool)

(assert (=> b!134120 (= e!88950 e!88951)))

(declare-fun res!111447 () Bool)

(assert (=> b!134120 (=> (not res!111447) (not e!88951))))

(assert (=> b!134120 (= res!111447 (= (select (arr!3424 (_2!6103 lt!207485)) #b00000000000000000000000000000000) (select (arr!3424 (_2!6103 lt!207487)) #b00000000000000000000000000000000)))))

(declare-fun b!134121 () Bool)

(assert (=> b!134121 (= e!88951 (arrayRangesEq!177 (_2!6103 lt!207485) (_2!6103 lt!207487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43145 (not res!111446)) b!134120))

(assert (= (and b!134120 res!111447) b!134121))

(declare-fun m!203791 () Bool)

(assert (=> b!134120 m!203791))

(declare-fun m!203793 () Bool)

(assert (=> b!134120 m!203793))

(declare-fun m!203795 () Bool)

(assert (=> b!134121 m!203795))

(assert (=> d!42978 d!43145))

(assert (=> d!42978 d!42999))

(declare-fun lt!207875 () tuple3!512)

(declare-fun d!43147 () Bool)

(assert (=> d!43147 (= lt!207875 (readByteArrayLoop!0 lt!207486 (array!6130 (store (arr!3424 arr!237) from!447 (_2!6100 (readBytePure!0 (_1!6101 lt!206843)))) (size!2774 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43147 (= (readByteArrayLoopPure!0 lt!207486 (array!6130 (store (arr!3424 arr!237) from!447 (_2!6100 (readBytePure!0 (_1!6101 lt!206843)))) (size!2774 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!11585 (_2!6113 lt!207875) (_3!313 lt!207875)))))

(declare-fun bs!10522 () Bool)

(assert (= bs!10522 d!43147))

(declare-fun m!203797 () Bool)

(assert (=> bs!10522 m!203797))

(assert (=> d!42978 d!43147))

(assert (=> d!42978 d!42995))

(declare-fun d!43149 () Bool)

(declare-fun res!111448 () Bool)

(declare-fun e!88952 () Bool)

(assert (=> d!43149 (=> res!111448 e!88952)))

(assert (=> d!43149 (= res!111448 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43149 (= (arrayRangesEq!177 arr!237 (_2!6103 lt!207433) #b00000000000000000000000000000000 to!404) e!88952)))

(declare-fun b!134122 () Bool)

(declare-fun e!88953 () Bool)

(assert (=> b!134122 (= e!88952 e!88953)))

(declare-fun res!111449 () Bool)

(assert (=> b!134122 (=> (not res!111449) (not e!88953))))

(assert (=> b!134122 (= res!111449 (= (select (arr!3424 arr!237) #b00000000000000000000000000000000) (select (arr!3424 (_2!6103 lt!207433)) #b00000000000000000000000000000000)))))

(declare-fun b!134123 () Bool)

(assert (=> b!134123 (= e!88953 (arrayRangesEq!177 arr!237 (_2!6103 lt!207433) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43149 (not res!111448)) b!134122))

(assert (= (and b!134122 res!111449) b!134123))

(assert (=> b!134122 m!203477))

(declare-fun m!203799 () Bool)

(assert (=> b!134122 m!203799))

(declare-fun m!203801 () Bool)

(assert (=> b!134123 m!203801))

(assert (=> b!133917 d!43149))

(declare-fun d!43151 () Bool)

(declare-fun res!111450 () Bool)

(declare-fun e!88955 () Bool)

(assert (=> d!43151 (=> (not res!111450) (not e!88955))))

(assert (=> d!43151 (= res!111450 (= (size!2774 (buf!3157 (_2!6102 lt!206848))) (size!2774 (buf!3157 (_2!6102 lt!207428)))))))

(assert (=> d!43151 (= (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 lt!207428)) e!88955)))

(declare-fun b!134124 () Bool)

(declare-fun res!111452 () Bool)

(assert (=> b!134124 (=> (not res!111452) (not e!88955))))

(assert (=> b!134124 (= res!111452 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!207428))) (currentByte!5948 (_2!6102 lt!207428)) (currentBit!5943 (_2!6102 lt!207428)))))))

(declare-fun b!134125 () Bool)

(declare-fun e!88954 () Bool)

(assert (=> b!134125 (= e!88955 e!88954)))

(declare-fun res!111451 () Bool)

(assert (=> b!134125 (=> res!111451 e!88954)))

(assert (=> b!134125 (= res!111451 (= (size!2774 (buf!3157 (_2!6102 lt!206848))) #b00000000000000000000000000000000))))

(declare-fun b!134126 () Bool)

(assert (=> b!134126 (= e!88954 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206848)) (buf!3157 (_2!6102 lt!207428)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(assert (= (and d!43151 res!111450) b!134124))

(assert (= (and b!134124 res!111452) b!134125))

(assert (= (and b!134125 (not res!111451)) b!134126))

(assert (=> b!134124 m!202827))

(assert (=> b!134124 m!203323))

(assert (=> b!134126 m!202827))

(assert (=> b!134126 m!202827))

(declare-fun m!203803 () Bool)

(assert (=> b!134126 m!203803))

(assert (=> b!133915 d!43151))

(declare-fun d!43153 () Bool)

(assert (=> d!43153 (= (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))) (bvsub (bvmul ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))))))))

(assert (=> d!42986 d!43153))

(declare-fun e!88956 () Bool)

(declare-fun lt!207907 () tuple3!512)

(declare-fun b!134127 () Bool)

(assert (=> b!134127 (= e!88956 (= (select (arr!3424 (_3!313 lt!207907)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6100 (readBytePure!0 (_1!6101 lt!206834)))))))

(assert (=> b!134127 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2774 (_3!313 lt!207907))))))

(declare-fun b!134128 () Bool)

(declare-fun e!88958 () Bool)

(assert (=> b!134128 (= e!88958 (arrayRangesEq!177 arr!237 (_3!313 lt!207907) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!134129 () Bool)

(declare-fun e!88957 () tuple3!512)

(declare-fun lt!207911 () Unit!8283)

(declare-fun lt!207908 () tuple3!512)

(assert (=> b!134129 (= e!88957 (tuple3!513 lt!207911 (_2!6113 lt!207908) (_3!313 lt!207908)))))

(declare-fun lt!207882 () tuple2!11598)

(assert (=> b!134129 (= lt!207882 (readByte!0 (_1!6101 lt!206834)))))

(declare-fun lt!207888 () array!6129)

(assert (=> b!134129 (= lt!207888 (array!6130 (store (arr!3424 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207882)) (size!2774 arr!237)))))

(declare-fun lt!207909 () (_ BitVec 64))

(assert (=> b!134129 (= lt!207909 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!207905 () (_ BitVec 32))

(assert (=> b!134129 (= lt!207905 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!207903 () Unit!8283)

(assert (=> b!134129 (= lt!207903 (validateOffsetBytesFromBitIndexLemma!0 (_1!6101 lt!206834) (_2!6112 lt!207882) lt!207909 lt!207905))))

(assert (=> b!134129 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6112 lt!207882)))) ((_ sign_extend 32) (currentByte!5948 (_2!6112 lt!207882))) ((_ sign_extend 32) (currentBit!5943 (_2!6112 lt!207882))) (bvsub lt!207905 ((_ extract 31 0) (bvsdiv (bvadd lt!207909 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!207893 () Unit!8283)

(assert (=> b!134129 (= lt!207893 lt!207903)))

(assert (=> b!134129 (= lt!207908 (readByteArrayLoop!0 (_2!6112 lt!207882) lt!207888 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1733 () (_ BitVec 64))

(assert (=> b!134129 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207882))) (currentByte!5948 (_2!6112 lt!207882)) (currentBit!5943 (_2!6112 lt!207882))) (bvadd call!1733 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!207898 () Unit!8283)

(declare-fun Unit!8317 () Unit!8283)

(assert (=> b!134129 (= lt!207898 Unit!8317)))

(assert (=> b!134129 (= (bvadd (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207882))) (currentByte!5948 (_2!6112 lt!207882)) (currentBit!5943 (_2!6112 lt!207882))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!207908))) (currentByte!5948 (_2!6113 lt!207908)) (currentBit!5943 (_2!6113 lt!207908))))))

(declare-fun lt!207879 () Unit!8283)

(declare-fun Unit!8318 () Unit!8283)

(assert (=> b!134129 (= lt!207879 Unit!8318)))

(assert (=> b!134129 (= (bvadd call!1733 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!207908))) (currentByte!5948 (_2!6113 lt!207908)) (currentBit!5943 (_2!6113 lt!207908))))))

(declare-fun lt!207892 () Unit!8283)

(declare-fun Unit!8319 () Unit!8283)

(assert (=> b!134129 (= lt!207892 Unit!8319)))

(assert (=> b!134129 (and (= (buf!3157 (_1!6101 lt!206834)) (buf!3157 (_2!6113 lt!207908))) (= (size!2774 arr!237) (size!2774 (_3!313 lt!207908))))))

(declare-fun lt!207889 () Unit!8283)

(declare-fun Unit!8320 () Unit!8283)

(assert (=> b!134129 (= lt!207889 Unit!8320)))

(declare-fun lt!207910 () Unit!8283)

(assert (=> b!134129 (= lt!207910 (arrayUpdatedAtPrefixLemma!3 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207882)))))

(assert (=> b!134129 (arrayRangesEq!177 arr!237 (array!6130 (store (arr!3424 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207882)) (size!2774 arr!237)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!207891 () Unit!8283)

(assert (=> b!134129 (= lt!207891 lt!207910)))

(declare-fun lt!207895 () (_ BitVec 32))

(assert (=> b!134129 (= lt!207895 #b00000000000000000000000000000000)))

(declare-fun lt!207880 () Unit!8283)

(assert (=> b!134129 (= lt!207880 (arrayRangesEqTransitive!3 arr!237 lt!207888 (_3!313 lt!207908) lt!207895 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(declare-fun call!1732 () Bool)

(assert (=> b!134129 call!1732))

(declare-fun lt!207894 () Unit!8283)

(assert (=> b!134129 (= lt!207894 lt!207880)))

(declare-fun call!1734 () Bool)

(assert (=> b!134129 call!1734))

(declare-fun lt!207883 () Unit!8283)

(declare-fun Unit!8321 () Unit!8283)

(assert (=> b!134129 (= lt!207883 Unit!8321)))

(declare-fun lt!207887 () Unit!8283)

(assert (=> b!134129 (= lt!207887 (arrayRangesEqImpliesEq!3 lt!207888 (_3!313 lt!207908) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134129 (= (select (store (arr!3424 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207882)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3424 (_3!313 lt!207908)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!207899 () Unit!8283)

(assert (=> b!134129 (= lt!207899 lt!207887)))

(declare-fun lt!207896 () Bool)

(assert (=> b!134129 (= lt!207896 (= (select (arr!3424 (_3!313 lt!207908)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6112 lt!207882)))))

(declare-fun Unit!8322 () Unit!8283)

(assert (=> b!134129 (= lt!207911 Unit!8322)))

(assert (=> b!134129 lt!207896))

(declare-fun bm!1729 () Bool)

(assert (=> bm!1729 (= call!1733 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!206834))) (currentByte!5948 (_1!6101 lt!206834)) (currentBit!5943 (_1!6101 lt!206834))))))

(declare-fun bm!1730 () Bool)

(declare-fun c!7658 () Bool)

(assert (=> bm!1730 (= call!1734 (arrayRangesEq!177 arr!237 (ite c!7658 (_3!313 lt!207908) arr!237) #b00000000000000000000000000000000 (ite c!7658 (bvadd #b00000000000000000000000000000001 from!447) (size!2774 arr!237))))))

(declare-fun lt!207886 () array!6129)

(declare-fun bm!1731 () Bool)

(declare-fun lt!207897 () (_ BitVec 32))

(declare-fun lt!207881 () (_ BitVec 32))

(declare-fun lt!207877 () array!6129)

(assert (=> bm!1731 (= call!1732 (arrayRangesEq!177 (ite c!7658 arr!237 lt!207877) (ite c!7658 (_3!313 lt!207908) lt!207886) (ite c!7658 lt!207895 lt!207881) (ite c!7658 (bvadd #b00000000000000000000000000000001 from!447) lt!207897)))))

(declare-fun b!134131 () Bool)

(declare-fun res!111455 () Bool)

(assert (=> b!134131 (=> (not res!111455) (not e!88958))))

(assert (=> b!134131 (= res!111455 (and (= (buf!3157 (_1!6101 lt!206834)) (buf!3157 (_2!6113 lt!207907))) (= (size!2774 arr!237) (size!2774 (_3!313 lt!207907)))))))

(declare-fun b!134130 () Bool)

(declare-fun lt!207904 () Unit!8283)

(assert (=> b!134130 (= e!88957 (tuple3!513 lt!207904 (_1!6101 lt!206834) arr!237))))

(assert (=> b!134130 (= call!1733 call!1733)))

(declare-fun lt!207906 () Unit!8283)

(declare-fun Unit!8323 () Unit!8283)

(assert (=> b!134130 (= lt!207906 Unit!8323)))

(declare-fun lt!207900 () Unit!8283)

(assert (=> b!134130 (= lt!207900 (arrayRangesEqReflexiveLemma!3 arr!237))))

(assert (=> b!134130 call!1734))

(declare-fun lt!207884 () Unit!8283)

(assert (=> b!134130 (= lt!207884 lt!207900)))

(assert (=> b!134130 (= lt!207877 arr!237)))

(assert (=> b!134130 (= lt!207886 arr!237)))

(declare-fun lt!207878 () (_ BitVec 32))

(assert (=> b!134130 (= lt!207878 #b00000000000000000000000000000000)))

(declare-fun lt!207876 () (_ BitVec 32))

(assert (=> b!134130 (= lt!207876 (size!2774 arr!237))))

(assert (=> b!134130 (= lt!207881 #b00000000000000000000000000000000)))

(assert (=> b!134130 (= lt!207897 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!134130 (= lt!207904 (arrayRangesEqSlicedLemma!3 lt!207877 lt!207886 lt!207878 lt!207876 lt!207881 lt!207897))))

(assert (=> b!134130 call!1732))

(declare-fun d!43155 () Bool)

(assert (=> d!43155 e!88956))

(declare-fun res!111454 () Bool)

(assert (=> d!43155 (=> res!111454 e!88956)))

(assert (=> d!43155 (= res!111454 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!207890 () Bool)

(assert (=> d!43155 (= lt!207890 e!88958)))

(declare-fun res!111453 () Bool)

(assert (=> d!43155 (=> (not res!111453) (not e!88958))))

(declare-fun lt!207902 () (_ BitVec 64))

(declare-fun lt!207885 () (_ BitVec 64))

(assert (=> d!43155 (= res!111453 (= (bvadd lt!207902 lt!207885) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!207907))) (currentByte!5948 (_2!6113 lt!207907)) (currentBit!5943 (_2!6113 lt!207907)))))))

(assert (=> d!43155 (or (not (= (bvand lt!207902 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207885 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207902 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207902 lt!207885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!207901 () (_ BitVec 64))

(assert (=> d!43155 (= lt!207885 (bvmul lt!207901 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43155 (or (= lt!207901 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207901 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207901)))))

(assert (=> d!43155 (= lt!207901 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43155 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43155 (= lt!207902 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!206834))) (currentByte!5948 (_1!6101 lt!206834)) (currentBit!5943 (_1!6101 lt!206834))))))

(assert (=> d!43155 (= lt!207907 e!88957)))

(assert (=> d!43155 (= c!7658 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43155 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2774 arr!237)))))

(assert (=> d!43155 (= (readByteArrayLoop!0 (_1!6101 lt!206834) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!207907)))

(assert (= (and d!43155 c!7658) b!134129))

(assert (= (and d!43155 (not c!7658)) b!134130))

(assert (= (or b!134129 b!134130) bm!1731))

(assert (= (or b!134129 b!134130) bm!1730))

(assert (= (or b!134129 b!134130) bm!1729))

(assert (= (and d!43155 res!111453) b!134131))

(assert (= (and b!134131 res!111455) b!134128))

(assert (= (and d!43155 (not res!111454)) b!134127))

(declare-fun m!203805 () Bool)

(assert (=> bm!1731 m!203805))

(declare-fun m!203807 () Bool)

(assert (=> b!134130 m!203807))

(declare-fun m!203809 () Bool)

(assert (=> b!134130 m!203809))

(declare-fun m!203811 () Bool)

(assert (=> b!134128 m!203811))

(declare-fun m!203813 () Bool)

(assert (=> b!134129 m!203813))

(declare-fun m!203815 () Bool)

(assert (=> b!134129 m!203815))

(declare-fun m!203817 () Bool)

(assert (=> b!134129 m!203817))

(declare-fun m!203819 () Bool)

(assert (=> b!134129 m!203819))

(declare-fun m!203821 () Bool)

(assert (=> b!134129 m!203821))

(declare-fun m!203823 () Bool)

(assert (=> b!134129 m!203823))

(declare-fun m!203825 () Bool)

(assert (=> b!134129 m!203825))

(declare-fun m!203827 () Bool)

(assert (=> b!134129 m!203827))

(declare-fun m!203829 () Bool)

(assert (=> b!134129 m!203829))

(declare-fun m!203831 () Bool)

(assert (=> b!134129 m!203831))

(declare-fun m!203833 () Bool)

(assert (=> b!134129 m!203833))

(declare-fun m!203835 () Bool)

(assert (=> b!134129 m!203835))

(declare-fun m!203837 () Bool)

(assert (=> b!134129 m!203837))

(declare-fun m!203839 () Bool)

(assert (=> bm!1729 m!203839))

(declare-fun m!203841 () Bool)

(assert (=> bm!1730 m!203841))

(declare-fun m!203843 () Bool)

(assert (=> d!43155 m!203843))

(assert (=> d!43155 m!203839))

(declare-fun m!203845 () Bool)

(assert (=> b!134127 m!203845))

(declare-fun m!203847 () Bool)

(assert (=> b!134127 m!203847))

(assert (=> d!43007 d!43155))

(declare-fun d!43157 () Bool)

(declare-fun lt!207914 () (_ BitVec 8))

(declare-fun lt!207918 () (_ BitVec 8))

(assert (=> d!43157 (= lt!207914 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3424 (buf!3157 lt!206833)) (currentByte!5948 lt!206833))) ((_ sign_extend 24) lt!207918))))))

(assert (=> d!43157 (= lt!207918 ((_ extract 7 0) (currentBit!5943 lt!206833)))))

(declare-fun e!88959 () Bool)

(assert (=> d!43157 e!88959))

(declare-fun res!111456 () Bool)

(assert (=> d!43157 (=> (not res!111456) (not e!88959))))

(assert (=> d!43157 (= res!111456 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 lt!206833))) ((_ sign_extend 32) (currentByte!5948 lt!206833)) ((_ sign_extend 32) (currentBit!5943 lt!206833)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8324 () Unit!8283)

(declare-fun Unit!8325 () Unit!8283)

(assert (=> d!43157 (= (readByte!0 lt!206833) (tuple2!11599 (_2!6115 (ite (bvsgt ((_ sign_extend 24) lt!207918) #b00000000000000000000000000000000) (tuple2!11601 Unit!8324 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!207914) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3424 (buf!3157 lt!206833)) (bvadd (currentByte!5948 lt!206833) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!207918)))))))) (tuple2!11601 Unit!8325 lt!207914))) (BitStream!4813 (buf!3157 lt!206833) (bvadd (currentByte!5948 lt!206833) #b00000000000000000000000000000001) (currentBit!5943 lt!206833))))))

(declare-fun b!134132 () Bool)

(declare-fun e!88960 () Bool)

(assert (=> b!134132 (= e!88959 e!88960)))

(declare-fun res!111457 () Bool)

(assert (=> b!134132 (=> (not res!111457) (not e!88960))))

(declare-fun lt!207912 () tuple2!11598)

(assert (=> b!134132 (= res!111457 (= (buf!3157 (_2!6112 lt!207912)) (buf!3157 lt!206833)))))

(declare-fun lt!207916 () (_ BitVec 8))

(declare-fun lt!207915 () (_ BitVec 8))

(declare-fun Unit!8326 () Unit!8283)

(declare-fun Unit!8327 () Unit!8283)

(assert (=> b!134132 (= lt!207912 (tuple2!11599 (_2!6115 (ite (bvsgt ((_ sign_extend 24) lt!207916) #b00000000000000000000000000000000) (tuple2!11601 Unit!8326 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!207915) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3424 (buf!3157 lt!206833)) (bvadd (currentByte!5948 lt!206833) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!207916)))))))) (tuple2!11601 Unit!8327 lt!207915))) (BitStream!4813 (buf!3157 lt!206833) (bvadd (currentByte!5948 lt!206833) #b00000000000000000000000000000001) (currentBit!5943 lt!206833))))))

(assert (=> b!134132 (= lt!207915 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3424 (buf!3157 lt!206833)) (currentByte!5948 lt!206833))) ((_ sign_extend 24) lt!207916))))))

(assert (=> b!134132 (= lt!207916 ((_ extract 7 0) (currentBit!5943 lt!206833)))))

(declare-fun lt!207917 () (_ BitVec 64))

(declare-fun lt!207913 () (_ BitVec 64))

(declare-fun b!134133 () Bool)

(assert (=> b!134133 (= e!88960 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207912))) (currentByte!5948 (_2!6112 lt!207912)) (currentBit!5943 (_2!6112 lt!207912))) (bvadd lt!207917 lt!207913)))))

(assert (=> b!134133 (or (not (= (bvand lt!207917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207913 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207917 lt!207913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134133 (= lt!207913 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!134133 (= lt!207917 (bitIndex!0 (size!2774 (buf!3157 lt!206833)) (currentByte!5948 lt!206833) (currentBit!5943 lt!206833)))))

(assert (= (and d!43157 res!111456) b!134132))

(assert (= (and b!134132 res!111457) b!134133))

(declare-fun m!203849 () Bool)

(assert (=> d!43157 m!203849))

(declare-fun m!203851 () Bool)

(assert (=> d!43157 m!203851))

(declare-fun m!203853 () Bool)

(assert (=> d!43157 m!203853))

(assert (=> b!134132 m!203853))

(assert (=> b!134132 m!203849))

(declare-fun m!203855 () Bool)

(assert (=> b!134133 m!203855))

(declare-fun m!203857 () Bool)

(assert (=> b!134133 m!203857))

(assert (=> d!42964 d!43157))

(declare-fun d!43159 () Bool)

(declare-fun res!111458 () Bool)

(declare-fun e!88961 () Bool)

(assert (=> d!43159 (=> res!111458 e!88961)))

(assert (=> d!43159 (= res!111458 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43159 (= (arrayRangesEq!177 (_2!6103 lt!206841) (_2!6103 lt!206849) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!88961)))

(declare-fun b!134134 () Bool)

(declare-fun e!88962 () Bool)

(assert (=> b!134134 (= e!88961 e!88962)))

(declare-fun res!111459 () Bool)

(assert (=> b!134134 (=> (not res!111459) (not e!88962))))

(assert (=> b!134134 (= res!111459 (= (select (arr!3424 (_2!6103 lt!206841)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3424 (_2!6103 lt!206849)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!134135 () Bool)

(assert (=> b!134135 (= e!88962 (arrayRangesEq!177 (_2!6103 lt!206841) (_2!6103 lt!206849) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43159 (not res!111458)) b!134134))

(assert (= (and b!134134 res!111459) b!134135))

(declare-fun m!203859 () Bool)

(assert (=> b!134134 m!203859))

(declare-fun m!203861 () Bool)

(assert (=> b!134134 m!203861))

(declare-fun m!203863 () Bool)

(assert (=> b!134135 m!203863))

(assert (=> b!133902 d!43159))

(assert (=> b!133946 d!43015))

(declare-fun d!43161 () Bool)

(assert (=> d!43161 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206855)) (buf!3157 thiss!1634) lt!207534 lt!207543)))

(declare-fun lt!207919 () Unit!8283)

(assert (=> d!43161 (= lt!207919 (choose!8 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206855)) lt!207534 lt!207543))))

(assert (=> d!43161 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207534) (bvsle lt!207534 lt!207543))))

(assert (=> d!43161 (= (arrayBitRangesEqSymmetric!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!206855)) lt!207534 lt!207543) lt!207919)))

(declare-fun bs!10523 () Bool)

(assert (= bs!10523 d!43161))

(assert (=> bs!10523 m!203405))

(declare-fun m!203865 () Bool)

(assert (=> bs!10523 m!203865))

(assert (=> b!133946 d!43161))

(declare-fun b!134136 () Bool)

(declare-fun e!88966 () Bool)

(declare-fun e!88967 () Bool)

(assert (=> b!134136 (= e!88966 e!88967)))

(declare-fun res!111461 () Bool)

(declare-fun lt!207922 () (_ BitVec 32))

(declare-fun lt!207920 () tuple4!114)

(assert (=> b!134136 (= res!111461 (byteRangesEq!0 (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_3!314 lt!207920)) (select (arr!3424 (buf!3157 thiss!1634)) (_3!314 lt!207920)) lt!207922 #b00000000000000000000000000001000))))

(assert (=> b!134136 (=> (not res!111461) (not e!88967))))

(declare-fun b!134137 () Bool)

(declare-fun e!88963 () Bool)

(assert (=> b!134137 (= e!88963 e!88966)))

(declare-fun c!7659 () Bool)

(assert (=> b!134137 (= c!7659 (= (_3!314 lt!207920) (_4!57 lt!207920)))))

(declare-fun b!134138 () Bool)

(declare-fun call!1735 () Bool)

(assert (=> b!134138 (= e!88966 call!1735)))

(declare-fun d!43163 () Bool)

(declare-fun res!111463 () Bool)

(declare-fun e!88968 () Bool)

(assert (=> d!43163 (=> res!111463 e!88968)))

(assert (=> d!43163 (= res!111463 (bvsge lt!207534 lt!207543))))

(assert (=> d!43163 (= (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!206855)) (buf!3157 thiss!1634) lt!207534 lt!207543) e!88968)))

(declare-fun lt!207921 () (_ BitVec 32))

(declare-fun bm!1732 () Bool)

(assert (=> bm!1732 (= call!1735 (byteRangesEq!0 (ite c!7659 (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_3!314 lt!207920)) (select (arr!3424 (buf!3157 (_2!6102 lt!206855))) (_4!57 lt!207920))) (ite c!7659 (select (arr!3424 (buf!3157 thiss!1634)) (_3!314 lt!207920)) (select (arr!3424 (buf!3157 thiss!1634)) (_4!57 lt!207920))) (ite c!7659 lt!207922 #b00000000000000000000000000000000) lt!207921))))

(declare-fun e!88964 () Bool)

(declare-fun b!134139 () Bool)

(assert (=> b!134139 (= e!88964 (arrayRangesEq!177 (buf!3157 (_2!6102 lt!206855)) (buf!3157 thiss!1634) (_1!6114 lt!207920) (_2!6114 lt!207920)))))

(declare-fun b!134140 () Bool)

(declare-fun e!88965 () Bool)

(assert (=> b!134140 (= e!88965 call!1735)))

(declare-fun b!134141 () Bool)

(declare-fun res!111464 () Bool)

(assert (=> b!134141 (= res!111464 (= lt!207921 #b00000000000000000000000000000000))))

(assert (=> b!134141 (=> res!111464 e!88965)))

(assert (=> b!134141 (= e!88967 e!88965)))

(declare-fun b!134142 () Bool)

(assert (=> b!134142 (= e!88968 e!88963)))

(declare-fun res!111462 () Bool)

(assert (=> b!134142 (=> (not res!111462) (not e!88963))))

(assert (=> b!134142 (= res!111462 e!88964)))

(declare-fun res!111460 () Bool)

(assert (=> b!134142 (=> res!111460 e!88964)))

(assert (=> b!134142 (= res!111460 (bvsge (_1!6114 lt!207920) (_2!6114 lt!207920)))))

(assert (=> b!134142 (= lt!207921 ((_ extract 31 0) (bvsrem lt!207543 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134142 (= lt!207922 ((_ extract 31 0) (bvsrem lt!207534 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134142 (= lt!207920 (arrayBitIndices!0 lt!207534 lt!207543))))

(assert (= (and d!43163 (not res!111463)) b!134142))

(assert (= (and b!134142 (not res!111460)) b!134139))

(assert (= (and b!134142 res!111462) b!134137))

(assert (= (and b!134137 c!7659) b!134138))

(assert (= (and b!134137 (not c!7659)) b!134136))

(assert (= (and b!134136 res!111461) b!134141))

(assert (= (and b!134141 (not res!111464)) b!134140))

(assert (= (or b!134138 b!134140) bm!1732))

(declare-fun m!203867 () Bool)

(assert (=> b!134136 m!203867))

(declare-fun m!203869 () Bool)

(assert (=> b!134136 m!203869))

(assert (=> b!134136 m!203867))

(assert (=> b!134136 m!203869))

(declare-fun m!203871 () Bool)

(assert (=> b!134136 m!203871))

(declare-fun m!203873 () Bool)

(assert (=> bm!1732 m!203873))

(declare-fun m!203875 () Bool)

(assert (=> bm!1732 m!203875))

(declare-fun m!203877 () Bool)

(assert (=> bm!1732 m!203877))

(assert (=> bm!1732 m!203869))

(assert (=> bm!1732 m!203867))

(declare-fun m!203879 () Bool)

(assert (=> b!134139 m!203879))

(declare-fun m!203881 () Bool)

(assert (=> b!134142 m!203881))

(assert (=> b!133946 d!43163))

(assert (=> d!42997 d!42962))

(declare-fun d!43165 () Bool)

(assert (=> d!43165 (isPrefixOf!0 thiss!1634 (_2!6102 lt!206855))))

(assert (=> d!43165 true))

(declare-fun _$15!207 () Unit!8283)

(assert (=> d!43165 (= (choose!30 thiss!1634 (_2!6102 lt!206848) (_2!6102 lt!206855)) _$15!207)))

(declare-fun bs!10524 () Bool)

(assert (= bs!10524 d!43165))

(assert (=> bs!10524 m!202777))

(assert (=> d!42997 d!43165))

(assert (=> d!42997 d!43025))

(assert (=> d!43009 d!43153))

(declare-fun d!43167 () Bool)

(declare-fun res!111465 () Bool)

(declare-fun e!88970 () Bool)

(assert (=> d!43167 (=> (not res!111465) (not e!88970))))

(assert (=> d!43167 (= res!111465 (= (size!2774 (buf!3157 (_2!6101 lt!207531))) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(assert (=> d!43167 (= (isPrefixOf!0 (_2!6101 lt!207531) (_2!6102 lt!206855)) e!88970)))

(declare-fun b!134143 () Bool)

(declare-fun res!111467 () Bool)

(assert (=> b!134143 (=> (not res!111467) (not e!88970))))

(assert (=> b!134143 (= res!111467 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207531))) (currentByte!5948 (_2!6101 lt!207531)) (currentBit!5943 (_2!6101 lt!207531))) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855)))))))

(declare-fun b!134144 () Bool)

(declare-fun e!88969 () Bool)

(assert (=> b!134144 (= e!88970 e!88969)))

(declare-fun res!111466 () Bool)

(assert (=> b!134144 (=> res!111466 e!88969)))

(assert (=> b!134144 (= res!111466 (= (size!2774 (buf!3157 (_2!6101 lt!207531))) #b00000000000000000000000000000000))))

(declare-fun b!134145 () Bool)

(assert (=> b!134145 (= e!88969 (arrayBitRangesEq!0 (buf!3157 (_2!6101 lt!207531)) (buf!3157 (_2!6102 lt!206855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207531))) (currentByte!5948 (_2!6101 lt!207531)) (currentBit!5943 (_2!6101 lt!207531)))))))

(assert (= (and d!43167 res!111465) b!134143))

(assert (= (and b!134143 res!111467) b!134144))

(assert (= (and b!134144 (not res!111466)) b!134145))

(assert (=> b!134143 m!203627))

(assert (=> b!134143 m!202825))

(assert (=> b!134145 m!203627))

(assert (=> b!134145 m!203627))

(declare-fun m!203883 () Bool)

(assert (=> b!134145 m!203883))

(assert (=> b!133948 d!43167))

(declare-fun lt!207954 () tuple3!512)

(declare-fun b!134146 () Bool)

(declare-fun e!88971 () Bool)

(assert (=> b!134146 (= e!88971 (= (select (arr!3424 (_3!313 lt!207954)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6100 (readBytePure!0 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001)))))))

(assert (=> b!134146 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2774 (_3!313 lt!207954))))))

(declare-fun b!134147 () Bool)

(declare-fun e!88973 () Bool)

(assert (=> b!134147 (= e!88973 (arrayRangesEq!177 lt!206847 (_3!313 lt!207954) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!134148 () Bool)

(declare-fun e!88972 () tuple3!512)

(declare-fun lt!207958 () Unit!8283)

(declare-fun lt!207955 () tuple3!512)

(assert (=> b!134148 (= e!88972 (tuple3!513 lt!207958 (_2!6113 lt!207955) (_3!313 lt!207955)))))

(declare-fun lt!207929 () tuple2!11598)

(assert (=> b!134148 (= lt!207929 (readByte!0 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001)))))

(declare-fun lt!207935 () array!6129)

(assert (=> b!134148 (= lt!207935 (array!6130 (store (arr!3424 lt!206847) (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207929)) (size!2774 lt!206847)))))

(declare-fun lt!207956 () (_ BitVec 64))

(assert (=> b!134148 (= lt!207956 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!207952 () (_ BitVec 32))

(assert (=> b!134148 (= lt!207952 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!207950 () Unit!8283)

(assert (=> b!134148 (= lt!207950 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001) (_2!6112 lt!207929) lt!207956 lt!207952))))

(assert (=> b!134148 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6112 lt!207929)))) ((_ sign_extend 32) (currentByte!5948 (_2!6112 lt!207929))) ((_ sign_extend 32) (currentBit!5943 (_2!6112 lt!207929))) (bvsub lt!207952 ((_ extract 31 0) (bvsdiv (bvadd lt!207956 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!207940 () Unit!8283)

(assert (=> b!134148 (= lt!207940 lt!207950)))

(assert (=> b!134148 (= lt!207955 (readByteArrayLoop!0 (_2!6112 lt!207929) lt!207935 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1737 () (_ BitVec 64))

(assert (=> b!134148 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207929))) (currentByte!5948 (_2!6112 lt!207929)) (currentBit!5943 (_2!6112 lt!207929))) (bvadd call!1737 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!207945 () Unit!8283)

(declare-fun Unit!8328 () Unit!8283)

(assert (=> b!134148 (= lt!207945 Unit!8328)))

(assert (=> b!134148 (= (bvadd (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!207929))) (currentByte!5948 (_2!6112 lt!207929)) (currentBit!5943 (_2!6112 lt!207929))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!207955))) (currentByte!5948 (_2!6113 lt!207955)) (currentBit!5943 (_2!6113 lt!207955))))))

(declare-fun lt!207926 () Unit!8283)

(declare-fun Unit!8329 () Unit!8283)

(assert (=> b!134148 (= lt!207926 Unit!8329)))

(assert (=> b!134148 (= (bvadd call!1737 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!207955))) (currentByte!5948 (_2!6113 lt!207955)) (currentBit!5943 (_2!6113 lt!207955))))))

(declare-fun lt!207939 () Unit!8283)

(declare-fun Unit!8330 () Unit!8283)

(assert (=> b!134148 (= lt!207939 Unit!8330)))

(assert (=> b!134148 (and (= (buf!3157 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001)) (buf!3157 (_2!6113 lt!207955))) (= (size!2774 lt!206847) (size!2774 (_3!313 lt!207955))))))

(declare-fun lt!207936 () Unit!8283)

(declare-fun Unit!8331 () Unit!8283)

(assert (=> b!134148 (= lt!207936 Unit!8331)))

(declare-fun lt!207957 () Unit!8283)

(assert (=> b!134148 (= lt!207957 (arrayUpdatedAtPrefixLemma!3 lt!206847 (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207929)))))

(assert (=> b!134148 (arrayRangesEq!177 lt!206847 (array!6130 (store (arr!3424 lt!206847) (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207929)) (size!2774 lt!206847)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!207938 () Unit!8283)

(assert (=> b!134148 (= lt!207938 lt!207957)))

(declare-fun lt!207942 () (_ BitVec 32))

(assert (=> b!134148 (= lt!207942 #b00000000000000000000000000000000)))

(declare-fun lt!207927 () Unit!8283)

(assert (=> b!134148 (= lt!207927 (arrayRangesEqTransitive!3 lt!206847 lt!207935 (_3!313 lt!207955) lt!207942 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(declare-fun call!1736 () Bool)

(assert (=> b!134148 call!1736))

(declare-fun lt!207941 () Unit!8283)

(assert (=> b!134148 (= lt!207941 lt!207927)))

(declare-fun call!1738 () Bool)

(assert (=> b!134148 call!1738))

(declare-fun lt!207930 () Unit!8283)

(declare-fun Unit!8332 () Unit!8283)

(assert (=> b!134148 (= lt!207930 Unit!8332)))

(declare-fun lt!207934 () Unit!8283)

(assert (=> b!134148 (= lt!207934 (arrayRangesEqImpliesEq!3 lt!207935 (_3!313 lt!207955) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134148 (= (select (store (arr!3424 lt!206847) (bvadd #b00000000000000000000000000000001 from!447) (_1!6112 lt!207929)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3424 (_3!313 lt!207955)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!207946 () Unit!8283)

(assert (=> b!134148 (= lt!207946 lt!207934)))

(declare-fun lt!207943 () Bool)

(assert (=> b!134148 (= lt!207943 (= (select (arr!3424 (_3!313 lt!207955)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6112 lt!207929)))))

(declare-fun Unit!8333 () Unit!8283)

(assert (=> b!134148 (= lt!207958 Unit!8333)))

(assert (=> b!134148 lt!207943))

(declare-fun bm!1733 () Bool)

(assert (=> bm!1733 (= call!1737 (bitIndex!0 (size!2774 (buf!3157 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001))) (currentByte!5948 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001)) (currentBit!5943 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001))))))

(declare-fun c!7660 () Bool)

(declare-fun bm!1734 () Bool)

(assert (=> bm!1734 (= call!1738 (arrayRangesEq!177 lt!206847 (ite c!7660 (_3!313 lt!207955) lt!206847) #b00000000000000000000000000000000 (ite c!7660 (bvadd #b00000000000000000000000000000001 from!447) (size!2774 lt!206847))))))

(declare-fun lt!207924 () array!6129)

(declare-fun lt!207933 () array!6129)

(declare-fun bm!1735 () Bool)

(declare-fun lt!207928 () (_ BitVec 32))

(declare-fun lt!207944 () (_ BitVec 32))

(assert (=> bm!1735 (= call!1736 (arrayRangesEq!177 (ite c!7660 lt!206847 lt!207924) (ite c!7660 (_3!313 lt!207955) lt!207933) (ite c!7660 lt!207942 lt!207928) (ite c!7660 (bvadd #b00000000000000000000000000000001 from!447) lt!207944)))))

(declare-fun b!134150 () Bool)

(declare-fun res!111470 () Bool)

(assert (=> b!134150 (=> (not res!111470) (not e!88973))))

(assert (=> b!134150 (= res!111470 (and (= (buf!3157 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001)) (buf!3157 (_2!6113 lt!207954))) (= (size!2774 lt!206847) (size!2774 (_3!313 lt!207954)))))))

(declare-fun lt!207951 () Unit!8283)

(declare-fun b!134149 () Bool)

(assert (=> b!134149 (= e!88972 (tuple3!513 lt!207951 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001) lt!206847))))

(assert (=> b!134149 (= call!1737 call!1737)))

(declare-fun lt!207953 () Unit!8283)

(declare-fun Unit!8334 () Unit!8283)

(assert (=> b!134149 (= lt!207953 Unit!8334)))

(declare-fun lt!207947 () Unit!8283)

(assert (=> b!134149 (= lt!207947 (arrayRangesEqReflexiveLemma!3 lt!206847))))

(assert (=> b!134149 call!1738))

(declare-fun lt!207931 () Unit!8283)

(assert (=> b!134149 (= lt!207931 lt!207947)))

(assert (=> b!134149 (= lt!207924 lt!206847)))

(assert (=> b!134149 (= lt!207933 lt!206847)))

(declare-fun lt!207925 () (_ BitVec 32))

(assert (=> b!134149 (= lt!207925 #b00000000000000000000000000000000)))

(declare-fun lt!207923 () (_ BitVec 32))

(assert (=> b!134149 (= lt!207923 (size!2774 lt!206847))))

(assert (=> b!134149 (= lt!207928 #b00000000000000000000000000000000)))

(assert (=> b!134149 (= lt!207944 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!134149 (= lt!207951 (arrayRangesEqSlicedLemma!3 lt!207924 lt!207933 lt!207925 lt!207923 lt!207928 lt!207944))))

(assert (=> b!134149 call!1736))

(declare-fun d!43169 () Bool)

(assert (=> d!43169 e!88971))

(declare-fun res!111469 () Bool)

(assert (=> d!43169 (=> res!111469 e!88971)))

(assert (=> d!43169 (= res!111469 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!207937 () Bool)

(assert (=> d!43169 (= lt!207937 e!88973)))

(declare-fun res!111468 () Bool)

(assert (=> d!43169 (=> (not res!111468) (not e!88973))))

(declare-fun lt!207949 () (_ BitVec 64))

(declare-fun lt!207932 () (_ BitVec 64))

(assert (=> d!43169 (= res!111468 (= (bvadd lt!207949 lt!207932) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!207954))) (currentByte!5948 (_2!6113 lt!207954)) (currentBit!5943 (_2!6113 lt!207954)))))))

(assert (=> d!43169 (or (not (= (bvand lt!207949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207932 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207949 lt!207932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!207948 () (_ BitVec 64))

(assert (=> d!43169 (= lt!207932 (bvmul lt!207948 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43169 (or (= lt!207948 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207948 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207948)))))

(assert (=> d!43169 (= lt!207948 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43169 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43169 (= lt!207949 (bitIndex!0 (size!2774 (buf!3157 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001))) (currentByte!5948 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001)) (currentBit!5943 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001))))))

(assert (=> d!43169 (= lt!207954 e!88972)))

(assert (=> d!43169 (= c!7660 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43169 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2774 lt!206847)))))

(assert (=> d!43169 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6101 lt!206843) #b00000000000000000000000000000001) lt!206847 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!207954)))

(assert (= (and d!43169 c!7660) b!134148))

(assert (= (and d!43169 (not c!7660)) b!134149))

(assert (= (or b!134148 b!134149) bm!1735))

(assert (= (or b!134148 b!134149) bm!1734))

(assert (= (or b!134148 b!134149) bm!1733))

(assert (= (and d!43169 res!111468) b!134150))

(assert (= (and b!134150 res!111470) b!134147))

(assert (= (and d!43169 (not res!111469)) b!134146))

(declare-fun m!203885 () Bool)

(assert (=> bm!1735 m!203885))

(assert (=> b!134149 m!203527))

(declare-fun m!203887 () Bool)

(assert (=> b!134149 m!203887))

(declare-fun m!203889 () Bool)

(assert (=> b!134147 m!203889))

(declare-fun m!203891 () Bool)

(assert (=> b!134148 m!203891))

(assert (=> b!134148 m!202787))

(declare-fun m!203893 () Bool)

(assert (=> b!134148 m!203893))

(declare-fun m!203895 () Bool)

(assert (=> b!134148 m!203895))

(declare-fun m!203897 () Bool)

(assert (=> b!134148 m!203897))

(declare-fun m!203899 () Bool)

(assert (=> b!134148 m!203899))

(declare-fun m!203901 () Bool)

(assert (=> b!134148 m!203901))

(assert (=> b!134148 m!202787))

(declare-fun m!203903 () Bool)

(assert (=> b!134148 m!203903))

(declare-fun m!203905 () Bool)

(assert (=> b!134148 m!203905))

(declare-fun m!203907 () Bool)

(assert (=> b!134148 m!203907))

(declare-fun m!203909 () Bool)

(assert (=> b!134148 m!203909))

(declare-fun m!203911 () Bool)

(assert (=> b!134148 m!203911))

(declare-fun m!203913 () Bool)

(assert (=> b!134148 m!203913))

(declare-fun m!203915 () Bool)

(assert (=> b!134148 m!203915))

(declare-fun m!203917 () Bool)

(assert (=> bm!1733 m!203917))

(declare-fun m!203919 () Bool)

(assert (=> bm!1734 m!203919))

(declare-fun m!203921 () Bool)

(assert (=> d!43169 m!203921))

(assert (=> d!43169 m!203917))

(declare-fun m!203923 () Bool)

(assert (=> b!134146 m!203923))

(assert (=> b!134146 m!202787))

(declare-fun m!203925 () Bool)

(assert (=> b!134146 m!203925))

(assert (=> d!42980 d!43169))

(declare-fun d!43171 () Bool)

(declare-fun res!111471 () Bool)

(declare-fun e!88975 () Bool)

(assert (=> d!43171 (=> (not res!111471) (not e!88975))))

(assert (=> d!43171 (= res!111471 (= (size!2774 (buf!3157 (_1!6101 lt!207571))) (size!2774 (buf!3157 (_2!6102 lt!206848)))))))

(assert (=> d!43171 (= (isPrefixOf!0 (_1!6101 lt!207571) (_2!6102 lt!206848)) e!88975)))

(declare-fun b!134151 () Bool)

(declare-fun res!111473 () Bool)

(assert (=> b!134151 (=> (not res!111473) (not e!88975))))

(assert (=> b!134151 (= res!111473 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207571))) (currentByte!5948 (_1!6101 lt!207571)) (currentBit!5943 (_1!6101 lt!207571))) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))))))

(declare-fun b!134152 () Bool)

(declare-fun e!88974 () Bool)

(assert (=> b!134152 (= e!88975 e!88974)))

(declare-fun res!111472 () Bool)

(assert (=> b!134152 (=> res!111472 e!88974)))

(assert (=> b!134152 (= res!111472 (= (size!2774 (buf!3157 (_1!6101 lt!207571))) #b00000000000000000000000000000000))))

(declare-fun b!134153 () Bool)

(assert (=> b!134153 (= e!88974 (arrayBitRangesEq!0 (buf!3157 (_1!6101 lt!207571)) (buf!3157 (_2!6102 lt!206848)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207571))) (currentByte!5948 (_1!6101 lt!207571)) (currentBit!5943 (_1!6101 lt!207571)))))))

(assert (= (and d!43171 res!111471) b!134151))

(assert (= (and b!134151 res!111473) b!134152))

(assert (= (and b!134152 (not res!111472)) b!134153))

(assert (=> b!134151 m!203609))

(assert (=> b!134151 m!202827))

(assert (=> b!134153 m!203609))

(assert (=> b!134153 m!203609))

(declare-fun m!203927 () Bool)

(assert (=> b!134153 m!203927))

(assert (=> b!133957 d!43171))

(assert (=> d!42982 d!42986))

(declare-fun d!43173 () Bool)

(assert (=> d!43173 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!206850)))

(assert (=> d!43173 true))

(declare-fun _$5!36 () Unit!8283)

(assert (=> d!43173 (= (choose!26 (_2!6102 lt!206848) (buf!3157 (_2!6102 lt!206855)) lt!206850 (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848)))) _$5!36)))

(declare-fun bs!10525 () Bool)

(assert (= bs!10525 d!43173))

(assert (=> bs!10525 m!202811))

(assert (=> d!42982 d!43173))

(declare-fun d!43175 () Bool)

(declare-fun e!88976 () Bool)

(assert (=> d!43175 e!88976))

(declare-fun res!111474 () Bool)

(assert (=> d!43175 (=> (not res!111474) (not e!88976))))

(declare-fun lt!207959 () BitStream!4812)

(declare-fun lt!207960 () (_ BitVec 64))

(assert (=> d!43175 (= res!111474 (= (bvadd lt!207960 (bvsub lt!207582 lt!207579)) (bitIndex!0 (size!2774 (buf!3157 lt!207959)) (currentByte!5948 lt!207959) (currentBit!5943 lt!207959))))))

(assert (=> d!43175 (or (not (= (bvand lt!207960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207582 lt!207579) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207960 (bvsub lt!207582 lt!207579)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43175 (= lt!207960 (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207571))) (currentByte!5948 (_2!6101 lt!207571)) (currentBit!5943 (_2!6101 lt!207571))))))

(assert (=> d!43175 (= lt!207959 (_2!6102 (moveBitIndex!0 (_2!6101 lt!207571) (bvsub lt!207582 lt!207579))))))

(assert (=> d!43175 (moveBitIndexPrecond!0 (_2!6101 lt!207571) (bvsub lt!207582 lt!207579))))

(assert (=> d!43175 (= (withMovedBitIndex!0 (_2!6101 lt!207571) (bvsub lt!207582 lt!207579)) lt!207959)))

(declare-fun b!134154 () Bool)

(assert (=> b!134154 (= e!88976 (= (size!2774 (buf!3157 (_2!6101 lt!207571))) (size!2774 (buf!3157 lt!207959))))))

(assert (= (and d!43175 res!111474) b!134154))

(declare-fun m!203929 () Bool)

(assert (=> d!43175 m!203929))

(assert (=> d!43175 m!203611))

(declare-fun m!203931 () Bool)

(assert (=> d!43175 m!203931))

(declare-fun m!203933 () Bool)

(assert (=> d!43175 m!203933))

(assert (=> b!133959 d!43175))

(assert (=> b!133959 d!43017))

(assert (=> b!133959 d!43013))

(declare-fun b!134165 () Bool)

(declare-fun e!88987 () Bool)

(declare-fun e!88986 () Bool)

(assert (=> b!134165 (= e!88987 e!88986)))

(declare-fun res!111484 () Bool)

(assert (=> b!134165 (=> (not res!111484) (not e!88986))))

(declare-fun lt!207974 () tuple2!11584)

(declare-fun lt!207975 () tuple2!11580)

(assert (=> b!134165 (= res!111484 (and (= (size!2774 (_2!6103 lt!207974)) (size!2774 arr!237)) (= (_1!6103 lt!207974) (_2!6101 lt!207975))))))

(assert (=> b!134165 (= lt!207974 (readByteArrayLoopPure!0 (_1!6101 lt!207975) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!207972 () Unit!8283)

(declare-fun lt!207973 () Unit!8283)

(assert (=> b!134165 (= lt!207972 lt!207973)))

(declare-fun _$39!21 () tuple2!11582)

(declare-fun lt!207971 () (_ BitVec 64))

(assert (=> b!134165 (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 _$39!21)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!207971)))

(assert (=> b!134165 (= lt!207973 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6102 lt!206848) (buf!3157 (_2!6102 _$39!21)) lt!207971))))

(assert (=> b!134165 (= lt!207971 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!134165 (= lt!207975 (reader!0 (_2!6102 lt!206848) (_2!6102 _$39!21)))))

(declare-fun b!134166 () Bool)

(declare-fun res!111486 () Bool)

(assert (=> b!134166 (=> (not res!111486) (not e!88987))))

(assert (=> b!134166 (= res!111486 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 _$39!21))) (currentByte!5948 (_2!6102 _$39!21)) (currentBit!5943 (_2!6102 _$39!21))) (bvadd (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206848))) (currentByte!5948 (_2!6102 lt!206848)) (currentBit!5943 (_2!6102 lt!206848))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!134167 () Bool)

(declare-fun res!111483 () Bool)

(assert (=> b!134167 (=> (not res!111483) (not e!88987))))

(assert (=> b!134167 (= res!111483 (isPrefixOf!0 (_2!6102 lt!206848) (_2!6102 _$39!21)))))

(declare-fun d!43177 () Bool)

(assert (=> d!43177 e!88987))

(declare-fun res!111485 () Bool)

(assert (=> d!43177 (=> (not res!111485) (not e!88987))))

(assert (=> d!43177 (= res!111485 (= (size!2774 (buf!3157 (_2!6102 lt!206848))) (size!2774 (buf!3157 (_2!6102 _$39!21)))))))

(declare-fun e!88985 () Bool)

(assert (=> d!43177 (and (inv!12 (_2!6102 _$39!21)) e!88985)))

(assert (=> d!43177 (= (choose!64 (_2!6102 lt!206848) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!21)))

(declare-fun b!134168 () Bool)

(assert (=> b!134168 (= e!88985 (array_inv!2563 (buf!3157 (_2!6102 _$39!21))))))

(declare-fun b!134169 () Bool)

(assert (=> b!134169 (= e!88986 (arrayRangesEq!177 arr!237 (_2!6103 lt!207974) #b00000000000000000000000000000000 to!404))))

(assert (= d!43177 b!134168))

(assert (= (and d!43177 res!111485) b!134166))

(assert (= (and b!134166 res!111486) b!134167))

(assert (= (and b!134167 res!111483) b!134165))

(assert (= (and b!134165 res!111484) b!134169))

(declare-fun m!203935 () Bool)

(assert (=> b!134166 m!203935))

(assert (=> b!134166 m!202827))

(declare-fun m!203937 () Bool)

(assert (=> d!43177 m!203937))

(declare-fun m!203939 () Bool)

(assert (=> b!134167 m!203939))

(declare-fun m!203941 () Bool)

(assert (=> b!134168 m!203941))

(declare-fun m!203943 () Bool)

(assert (=> b!134169 m!203943))

(declare-fun m!203945 () Bool)

(assert (=> b!134165 m!203945))

(declare-fun m!203947 () Bool)

(assert (=> b!134165 m!203947))

(declare-fun m!203949 () Bool)

(assert (=> b!134165 m!203949))

(declare-fun m!203951 () Bool)

(assert (=> b!134165 m!203951))

(assert (=> d!42958 d!43177))

(declare-fun d!43179 () Bool)

(declare-fun e!88989 () Bool)

(assert (=> d!43179 e!88989))

(declare-fun res!111488 () Bool)

(assert (=> d!43179 (=> (not res!111488) (not e!88989))))

(declare-fun lt!207981 () (_ BitVec 64))

(declare-fun lt!207980 () (_ BitVec 64))

(declare-fun lt!207978 () (_ BitVec 64))

(assert (=> d!43179 (= res!111488 (= lt!207980 (bvsub lt!207978 lt!207981)))))

(assert (=> d!43179 (or (= (bvand lt!207978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207978 lt!207981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43179 (= lt!207981 (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207603)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!207603))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!207603)))))))

(declare-fun lt!207979 () (_ BitVec 64))

(declare-fun lt!207976 () (_ BitVec 64))

(assert (=> d!43179 (= lt!207978 (bvmul lt!207979 lt!207976))))

(assert (=> d!43179 (or (= lt!207979 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207976 (bvsdiv (bvmul lt!207979 lt!207976) lt!207979)))))

(assert (=> d!43179 (= lt!207976 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43179 (= lt!207979 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207603)))))))

(assert (=> d!43179 (= lt!207980 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!207603))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!207603)))))))

(assert (=> d!43179 (invariant!0 (currentBit!5943 (_2!6102 lt!207603)) (currentByte!5948 (_2!6102 lt!207603)) (size!2774 (buf!3157 (_2!6102 lt!207603))))))

(assert (=> d!43179 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!207603))) (currentByte!5948 (_2!6102 lt!207603)) (currentBit!5943 (_2!6102 lt!207603))) lt!207980)))

(declare-fun b!134170 () Bool)

(declare-fun res!111487 () Bool)

(assert (=> b!134170 (=> (not res!111487) (not e!88989))))

(assert (=> b!134170 (= res!111487 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207980))))

(declare-fun b!134171 () Bool)

(declare-fun lt!207977 () (_ BitVec 64))

(assert (=> b!134171 (= e!88989 (bvsle lt!207980 (bvmul lt!207977 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134171 (or (= lt!207977 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207977 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207977)))))

(assert (=> b!134171 (= lt!207977 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207603)))))))

(assert (= (and d!43179 res!111488) b!134170))

(assert (= (and b!134170 res!111487) b!134171))

(declare-fun m!203953 () Bool)

(assert (=> d!43179 m!203953))

(declare-fun m!203955 () Bool)

(assert (=> d!43179 m!203955))

(assert (=> b!133967 d!43179))

(assert (=> b!133967 d!43015))

(assert (=> d!42954 d!43023))

(declare-fun d!43181 () Bool)

(declare-fun lt!207982 () tuple2!11598)

(assert (=> d!43181 (= lt!207982 (readByte!0 (_1!6101 lt!207604)))))

(assert (=> d!43181 (= (readBytePure!0 (_1!6101 lt!207604)) (tuple2!11579 (_2!6112 lt!207982) (_1!6112 lt!207982)))))

(declare-fun bs!10526 () Bool)

(assert (= bs!10526 d!43181))

(declare-fun m!203957 () Bool)

(assert (=> bs!10526 m!203957))

(assert (=> b!133969 d!43181))

(declare-fun d!43183 () Bool)

(declare-fun e!88990 () Bool)

(assert (=> d!43183 e!88990))

(declare-fun res!111489 () Bool)

(assert (=> d!43183 (=> (not res!111489) (not e!88990))))

(declare-fun lt!207983 () tuple2!11580)

(assert (=> d!43183 (= res!111489 (isPrefixOf!0 (_1!6101 lt!207983) (_2!6101 lt!207983)))))

(declare-fun lt!207985 () BitStream!4812)

(assert (=> d!43183 (= lt!207983 (tuple2!11581 lt!207985 (_2!6102 lt!207603)))))

(declare-fun lt!208001 () Unit!8283)

(declare-fun lt!207990 () Unit!8283)

(assert (=> d!43183 (= lt!208001 lt!207990)))

(assert (=> d!43183 (isPrefixOf!0 lt!207985 (_2!6102 lt!207603))))

(assert (=> d!43183 (= lt!207990 (lemmaIsPrefixTransitive!0 lt!207985 (_2!6102 lt!207603) (_2!6102 lt!207603)))))

(declare-fun lt!207992 () Unit!8283)

(declare-fun lt!207987 () Unit!8283)

(assert (=> d!43183 (= lt!207992 lt!207987)))

(assert (=> d!43183 (isPrefixOf!0 lt!207985 (_2!6102 lt!207603))))

(assert (=> d!43183 (= lt!207987 (lemmaIsPrefixTransitive!0 lt!207985 thiss!1634 (_2!6102 lt!207603)))))

(declare-fun lt!208000 () Unit!8283)

(declare-fun e!88991 () Unit!8283)

(assert (=> d!43183 (= lt!208000 e!88991)))

(declare-fun c!7661 () Bool)

(assert (=> d!43183 (= c!7661 (not (= (size!2774 (buf!3157 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!207998 () Unit!8283)

(declare-fun lt!207988 () Unit!8283)

(assert (=> d!43183 (= lt!207998 lt!207988)))

(assert (=> d!43183 (isPrefixOf!0 (_2!6102 lt!207603) (_2!6102 lt!207603))))

(assert (=> d!43183 (= lt!207988 (lemmaIsPrefixRefl!0 (_2!6102 lt!207603)))))

(declare-fun lt!208002 () Unit!8283)

(declare-fun lt!207997 () Unit!8283)

(assert (=> d!43183 (= lt!208002 lt!207997)))

(assert (=> d!43183 (= lt!207997 (lemmaIsPrefixRefl!0 (_2!6102 lt!207603)))))

(declare-fun lt!207989 () Unit!8283)

(declare-fun lt!207999 () Unit!8283)

(assert (=> d!43183 (= lt!207989 lt!207999)))

(assert (=> d!43183 (isPrefixOf!0 lt!207985 lt!207985)))

(assert (=> d!43183 (= lt!207999 (lemmaIsPrefixRefl!0 lt!207985))))

(declare-fun lt!207993 () Unit!8283)

(declare-fun lt!207984 () Unit!8283)

(assert (=> d!43183 (= lt!207993 lt!207984)))

(assert (=> d!43183 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43183 (= lt!207984 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43183 (= lt!207985 (BitStream!4813 (buf!3157 (_2!6102 lt!207603)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(assert (=> d!43183 (isPrefixOf!0 thiss!1634 (_2!6102 lt!207603))))

(assert (=> d!43183 (= (reader!0 thiss!1634 (_2!6102 lt!207603)) lt!207983)))

(declare-fun b!134172 () Bool)

(declare-fun lt!207996 () Unit!8283)

(assert (=> b!134172 (= e!88991 lt!207996)))

(declare-fun lt!207986 () (_ BitVec 64))

(assert (=> b!134172 (= lt!207986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207995 () (_ BitVec 64))

(assert (=> b!134172 (= lt!207995 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(assert (=> b!134172 (= lt!207996 (arrayBitRangesEqSymmetric!0 (buf!3157 thiss!1634) (buf!3157 (_2!6102 lt!207603)) lt!207986 lt!207995))))

(assert (=> b!134172 (arrayBitRangesEq!0 (buf!3157 (_2!6102 lt!207603)) (buf!3157 thiss!1634) lt!207986 lt!207995)))

(declare-fun b!134173 () Bool)

(declare-fun res!111490 () Bool)

(assert (=> b!134173 (=> (not res!111490) (not e!88990))))

(assert (=> b!134173 (= res!111490 (isPrefixOf!0 (_1!6101 lt!207983) thiss!1634))))

(declare-fun b!134174 () Bool)

(declare-fun res!111491 () Bool)

(assert (=> b!134174 (=> (not res!111491) (not e!88990))))

(assert (=> b!134174 (= res!111491 (isPrefixOf!0 (_2!6101 lt!207983) (_2!6102 lt!207603)))))

(declare-fun b!134175 () Bool)

(declare-fun lt!207994 () (_ BitVec 64))

(declare-fun lt!207991 () (_ BitVec 64))

(assert (=> b!134175 (= e!88990 (= (_1!6101 lt!207983) (withMovedBitIndex!0 (_2!6101 lt!207983) (bvsub lt!207994 lt!207991))))))

(assert (=> b!134175 (or (= (bvand lt!207994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207991 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207994 lt!207991) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134175 (= lt!207991 (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!207603))) (currentByte!5948 (_2!6102 lt!207603)) (currentBit!5943 (_2!6102 lt!207603))))))

(assert (=> b!134175 (= lt!207994 (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)))))

(declare-fun b!134176 () Bool)

(declare-fun Unit!8335 () Unit!8283)

(assert (=> b!134176 (= e!88991 Unit!8335)))

(assert (= (and d!43183 c!7661) b!134172))

(assert (= (and d!43183 (not c!7661)) b!134176))

(assert (= (and d!43183 res!111489) b!134173))

(assert (= (and b!134173 res!111490) b!134174))

(assert (= (and b!134174 res!111491) b!134175))

(assert (=> d!43183 m!203377))

(declare-fun m!203959 () Bool)

(assert (=> d!43183 m!203959))

(declare-fun m!203961 () Bool)

(assert (=> d!43183 m!203961))

(declare-fun m!203963 () Bool)

(assert (=> d!43183 m!203963))

(declare-fun m!203965 () Bool)

(assert (=> d!43183 m!203965))

(declare-fun m!203967 () Bool)

(assert (=> d!43183 m!203967))

(assert (=> d!43183 m!203389))

(declare-fun m!203969 () Bool)

(assert (=> d!43183 m!203969))

(assert (=> d!43183 m!203457))

(declare-fun m!203971 () Bool)

(assert (=> d!43183 m!203971))

(declare-fun m!203973 () Bool)

(assert (=> d!43183 m!203973))

(declare-fun m!203975 () Bool)

(assert (=> b!134173 m!203975))

(declare-fun m!203977 () Bool)

(assert (=> b!134175 m!203977))

(assert (=> b!134175 m!203455))

(assert (=> b!134175 m!202839))

(declare-fun m!203979 () Bool)

(assert (=> b!134174 m!203979))

(assert (=> b!134172 m!202839))

(declare-fun m!203981 () Bool)

(assert (=> b!134172 m!203981))

(declare-fun m!203983 () Bool)

(assert (=> b!134172 m!203983))

(assert (=> b!133969 d!43183))

(declare-fun d!43185 () Bool)

(declare-fun res!111492 () Bool)

(declare-fun e!88992 () Bool)

(assert (=> d!43185 (=> res!111492 e!88992)))

(assert (=> d!43185 (= res!111492 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43185 (= (arrayRangesEq!177 arr!237 (_2!6103 lt!206832) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!88992)))

(declare-fun b!134177 () Bool)

(declare-fun e!88993 () Bool)

(assert (=> b!134177 (= e!88992 e!88993)))

(declare-fun res!111493 () Bool)

(assert (=> b!134177 (=> (not res!111493) (not e!88993))))

(assert (=> b!134177 (= res!111493 (= (select (arr!3424 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3424 (_2!6103 lt!206832)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!134178 () Bool)

(assert (=> b!134178 (= e!88993 (arrayRangesEq!177 arr!237 (_2!6103 lt!206832) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43185 (not res!111492)) b!134177))

(assert (= (and b!134177 res!111493) b!134178))

(declare-fun m!203985 () Bool)

(assert (=> b!134177 m!203985))

(declare-fun m!203987 () Bool)

(assert (=> b!134177 m!203987))

(declare-fun m!203989 () Bool)

(assert (=> b!134178 m!203989))

(assert (=> b!133980 d!43185))

(declare-fun d!43187 () Bool)

(assert (=> d!43187 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848))) lt!207434) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206848)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206848))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206848)))) lt!207434))))

(declare-fun bs!10527 () Bool)

(assert (= bs!10527 d!43187))

(assert (=> bs!10527 m!203359))

(assert (=> b!133914 d!43187))

(declare-fun d!43189 () Bool)

(declare-fun res!111494 () Bool)

(declare-fun e!88995 () Bool)

(assert (=> d!43189 (=> (not res!111494) (not e!88995))))

(assert (=> d!43189 (= res!111494 (= (size!2774 (buf!3157 (_1!6101 lt!207531))) (size!2774 (buf!3157 (_2!6101 lt!207531)))))))

(assert (=> d!43189 (= (isPrefixOf!0 (_1!6101 lt!207531) (_2!6101 lt!207531)) e!88995)))

(declare-fun b!134179 () Bool)

(declare-fun res!111496 () Bool)

(assert (=> b!134179 (=> (not res!111496) (not e!88995))))

(assert (=> b!134179 (= res!111496 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207531))) (currentByte!5948 (_1!6101 lt!207531)) (currentBit!5943 (_1!6101 lt!207531))) (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207531))) (currentByte!5948 (_2!6101 lt!207531)) (currentBit!5943 (_2!6101 lt!207531)))))))

(declare-fun b!134180 () Bool)

(declare-fun e!88994 () Bool)

(assert (=> b!134180 (= e!88995 e!88994)))

(declare-fun res!111495 () Bool)

(assert (=> b!134180 (=> res!111495 e!88994)))

(assert (=> b!134180 (= res!111495 (= (size!2774 (buf!3157 (_1!6101 lt!207531))) #b00000000000000000000000000000000))))

(declare-fun b!134181 () Bool)

(assert (=> b!134181 (= e!88994 (arrayBitRangesEq!0 (buf!3157 (_1!6101 lt!207531)) (buf!3157 (_2!6101 lt!207531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207531))) (currentByte!5948 (_1!6101 lt!207531)) (currentBit!5943 (_1!6101 lt!207531)))))))

(assert (= (and d!43189 res!111494) b!134179))

(assert (= (and b!134179 res!111496) b!134180))

(assert (= (and b!134180 (not res!111495)) b!134181))

(assert (=> b!134179 m!203633))

(assert (=> b!134179 m!203627))

(assert (=> b!134181 m!203633))

(assert (=> b!134181 m!203633))

(declare-fun m!203991 () Bool)

(assert (=> b!134181 m!203991))

(assert (=> d!42984 d!43189))

(assert (=> d!42984 d!42962))

(declare-fun d!43191 () Bool)

(declare-fun res!111497 () Bool)

(declare-fun e!88997 () Bool)

(assert (=> d!43191 (=> (not res!111497) (not e!88997))))

(assert (=> d!43191 (= res!111497 (= (size!2774 (buf!3157 lt!207533)) (size!2774 (buf!3157 lt!207533))))))

(assert (=> d!43191 (= (isPrefixOf!0 lt!207533 lt!207533) e!88997)))

(declare-fun b!134182 () Bool)

(declare-fun res!111499 () Bool)

(assert (=> b!134182 (=> (not res!111499) (not e!88997))))

(assert (=> b!134182 (= res!111499 (bvsle (bitIndex!0 (size!2774 (buf!3157 lt!207533)) (currentByte!5948 lt!207533) (currentBit!5943 lt!207533)) (bitIndex!0 (size!2774 (buf!3157 lt!207533)) (currentByte!5948 lt!207533) (currentBit!5943 lt!207533))))))

(declare-fun b!134183 () Bool)

(declare-fun e!88996 () Bool)

(assert (=> b!134183 (= e!88997 e!88996)))

(declare-fun res!111498 () Bool)

(assert (=> b!134183 (=> res!111498 e!88996)))

(assert (=> b!134183 (= res!111498 (= (size!2774 (buf!3157 lt!207533)) #b00000000000000000000000000000000))))

(declare-fun b!134184 () Bool)

(assert (=> b!134184 (= e!88996 (arrayBitRangesEq!0 (buf!3157 lt!207533) (buf!3157 lt!207533) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 lt!207533)) (currentByte!5948 lt!207533) (currentBit!5943 lt!207533))))))

(assert (= (and d!43191 res!111497) b!134182))

(assert (= (and b!134182 res!111499) b!134183))

(assert (= (and b!134183 (not res!111498)) b!134184))

(declare-fun m!203993 () Bool)

(assert (=> b!134182 m!203993))

(assert (=> b!134182 m!203993))

(assert (=> b!134184 m!203993))

(assert (=> b!134184 m!203993))

(declare-fun m!203995 () Bool)

(assert (=> b!134184 m!203995))

(assert (=> d!42984 d!43191))

(assert (=> d!42984 d!43065))

(declare-fun d!43193 () Bool)

(declare-fun res!111500 () Bool)

(declare-fun e!88999 () Bool)

(assert (=> d!43193 (=> (not res!111500) (not e!88999))))

(assert (=> d!43193 (= res!111500 (= (size!2774 (buf!3157 lt!207533)) (size!2774 (buf!3157 (_2!6102 lt!206855)))))))

(assert (=> d!43193 (= (isPrefixOf!0 lt!207533 (_2!6102 lt!206855)) e!88999)))

(declare-fun b!134185 () Bool)

(declare-fun res!111502 () Bool)

(assert (=> b!134185 (=> (not res!111502) (not e!88999))))

(assert (=> b!134185 (= res!111502 (bvsle (bitIndex!0 (size!2774 (buf!3157 lt!207533)) (currentByte!5948 lt!207533) (currentBit!5943 lt!207533)) (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!206855))) (currentByte!5948 (_2!6102 lt!206855)) (currentBit!5943 (_2!6102 lt!206855)))))))

(declare-fun b!134186 () Bool)

(declare-fun e!88998 () Bool)

(assert (=> b!134186 (= e!88999 e!88998)))

(declare-fun res!111501 () Bool)

(assert (=> b!134186 (=> res!111501 e!88998)))

(assert (=> b!134186 (= res!111501 (= (size!2774 (buf!3157 lt!207533)) #b00000000000000000000000000000000))))

(declare-fun b!134187 () Bool)

(assert (=> b!134187 (= e!88998 (arrayBitRangesEq!0 (buf!3157 lt!207533) (buf!3157 (_2!6102 lt!206855)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 lt!207533)) (currentByte!5948 lt!207533) (currentBit!5943 lt!207533))))))

(assert (= (and d!43193 res!111500) b!134185))

(assert (= (and b!134185 res!111502) b!134186))

(assert (= (and b!134186 (not res!111501)) b!134187))

(assert (=> b!134185 m!203993))

(assert (=> b!134185 m!202825))

(assert (=> b!134187 m!203993))

(assert (=> b!134187 m!203993))

(declare-fun m!203997 () Bool)

(assert (=> b!134187 m!203997))

(assert (=> d!42984 d!43193))

(assert (=> d!42984 d!43103))

(assert (=> d!42984 d!43073))

(declare-fun d!43195 () Bool)

(assert (=> d!43195 (isPrefixOf!0 lt!207533 (_2!6102 lt!206855))))

(declare-fun lt!208003 () Unit!8283)

(assert (=> d!43195 (= lt!208003 (choose!30 lt!207533 thiss!1634 (_2!6102 lt!206855)))))

(assert (=> d!43195 (isPrefixOf!0 lt!207533 thiss!1634)))

(assert (=> d!43195 (= (lemmaIsPrefixTransitive!0 lt!207533 thiss!1634 (_2!6102 lt!206855)) lt!208003)))

(declare-fun bs!10528 () Bool)

(assert (= bs!10528 d!43195))

(assert (=> bs!10528 m!203393))

(declare-fun m!203999 () Bool)

(assert (=> bs!10528 m!203999))

(declare-fun m!204001 () Bool)

(assert (=> bs!10528 m!204001))

(assert (=> d!42984 d!43195))

(assert (=> d!42984 d!43105))

(declare-fun d!43197 () Bool)

(assert (=> d!43197 (isPrefixOf!0 lt!207533 lt!207533)))

(declare-fun lt!208004 () Unit!8283)

(assert (=> d!43197 (= lt!208004 (choose!11 lt!207533))))

(assert (=> d!43197 (= (lemmaIsPrefixRefl!0 lt!207533) lt!208004)))

(declare-fun bs!10529 () Bool)

(assert (= bs!10529 d!43197))

(assert (=> bs!10529 m!203391))

(declare-fun m!204003 () Bool)

(assert (=> bs!10529 m!204003))

(assert (=> d!42984 d!43197))

(declare-fun d!43199 () Bool)

(assert (=> d!43199 (isPrefixOf!0 lt!207533 (_2!6102 lt!206855))))

(declare-fun lt!208005 () Unit!8283)

(assert (=> d!43199 (= lt!208005 (choose!30 lt!207533 (_2!6102 lt!206855) (_2!6102 lt!206855)))))

(assert (=> d!43199 (isPrefixOf!0 lt!207533 (_2!6102 lt!206855))))

(assert (=> d!43199 (= (lemmaIsPrefixTransitive!0 lt!207533 (_2!6102 lt!206855) (_2!6102 lt!206855)) lt!208005)))

(declare-fun bs!10530 () Bool)

(assert (= bs!10530 d!43199))

(assert (=> bs!10530 m!203393))

(declare-fun m!204005 () Bool)

(assert (=> bs!10530 m!204005))

(assert (=> bs!10530 m!203393))

(assert (=> d!42984 d!43199))

(declare-fun d!43201 () Bool)

(assert (=> d!43201 (= (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206855))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206855)))) (bvsub (bvmul ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!206855))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!206855))))))))

(assert (=> d!43017 d!43201))

(declare-fun d!43203 () Bool)

(assert (=> d!43203 (= (invariant!0 (currentBit!5943 (_2!6102 lt!206855)) (currentByte!5948 (_2!6102 lt!206855)) (size!2774 (buf!3157 (_2!6102 lt!206855)))) (and (bvsge (currentBit!5943 (_2!6102 lt!206855)) #b00000000000000000000000000000000) (bvslt (currentBit!5943 (_2!6102 lt!206855)) #b00000000000000000000000000001000) (bvsge (currentByte!5948 (_2!6102 lt!206855)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5948 (_2!6102 lt!206855)) (size!2774 (buf!3157 (_2!6102 lt!206855)))) (and (= (currentBit!5943 (_2!6102 lt!206855)) #b00000000000000000000000000000000) (= (currentByte!5948 (_2!6102 lt!206855)) (size!2774 (buf!3157 (_2!6102 lt!206855))))))))))

(assert (=> d!43017 d!43203))

(declare-fun d!43205 () Bool)

(declare-fun res!111503 () Bool)

(declare-fun e!89001 () Bool)

(assert (=> d!43205 (=> (not res!111503) (not e!89001))))

(assert (=> d!43205 (= res!111503 (= (size!2774 (buf!3157 (_1!6101 lt!207629))) (size!2774 (buf!3157 thiss!1634))))))

(assert (=> d!43205 (= (isPrefixOf!0 (_1!6101 lt!207629) thiss!1634) e!89001)))

(declare-fun b!134188 () Bool)

(declare-fun res!111505 () Bool)

(assert (=> b!134188 (=> (not res!111505) (not e!89001))))

(assert (=> b!134188 (= res!111505 (bvsle (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207629))) (currentByte!5948 (_1!6101 lt!207629)) (currentBit!5943 (_1!6101 lt!207629))) (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))))))

(declare-fun b!134189 () Bool)

(declare-fun e!89000 () Bool)

(assert (=> b!134189 (= e!89001 e!89000)))

(declare-fun res!111504 () Bool)

(assert (=> b!134189 (=> res!111504 e!89000)))

(assert (=> b!134189 (= res!111504 (= (size!2774 (buf!3157 (_1!6101 lt!207629))) #b00000000000000000000000000000000))))

(declare-fun b!134190 () Bool)

(assert (=> b!134190 (= e!89000 (arrayBitRangesEq!0 (buf!3157 (_1!6101 lt!207629)) (buf!3157 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!207629))) (currentByte!5948 (_1!6101 lt!207629)) (currentBit!5943 (_1!6101 lt!207629)))))))

(assert (= (and d!43205 res!111503) b!134188))

(assert (= (and b!134188 res!111505) b!134189))

(assert (= (and b!134189 (not res!111504)) b!134190))

(assert (=> b!134188 m!203655))

(assert (=> b!134188 m!202839))

(assert (=> b!134190 m!203655))

(assert (=> b!134190 m!203655))

(declare-fun m!204007 () Bool)

(assert (=> b!134190 m!204007))

(assert (=> b!133985 d!43205))

(declare-fun d!43207 () Bool)

(declare-fun e!89008 () Bool)

(assert (=> d!43207 e!89008))

(declare-fun res!111512 () Bool)

(assert (=> d!43207 (=> (not res!111512) (not e!89008))))

(declare-fun _$37!17 () tuple2!11582)

(assert (=> d!43207 (= res!111512 (= (size!2774 (buf!3157 thiss!1634)) (size!2774 (buf!3157 (_2!6102 _$37!17)))))))

(declare-fun e!89009 () Bool)

(assert (=> d!43207 (and (inv!12 (_2!6102 _$37!17)) e!89009)))

(assert (=> d!43207 (= (choose!6 thiss!1634 (select (arr!3424 arr!237) from!447)) _$37!17)))

(declare-fun b!134201 () Bool)

(declare-fun res!111514 () Bool)

(assert (=> b!134201 (=> (not res!111514) (not e!89008))))

(assert (=> b!134201 (= res!111514 (isPrefixOf!0 thiss!1634 (_2!6102 _$37!17)))))

(declare-fun lt!208010 () tuple2!11580)

(declare-fun lt!208011 () tuple2!11578)

(declare-fun b!134202 () Bool)

(assert (=> b!134202 (= e!89008 (and (= (_2!6100 lt!208011) (select (arr!3424 arr!237) from!447)) (= (_1!6100 lt!208011) (_2!6101 lt!208010))))))

(assert (=> b!134202 (= lt!208011 (readBytePure!0 (_1!6101 lt!208010)))))

(assert (=> b!134202 (= lt!208010 (reader!0 thiss!1634 (_2!6102 _$37!17)))))

(declare-fun b!134200 () Bool)

(declare-fun res!111513 () Bool)

(assert (=> b!134200 (=> (not res!111513) (not e!89008))))

(assert (=> b!134200 (= res!111513 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 _$37!17))) (currentByte!5948 (_2!6102 _$37!17)) (currentBit!5943 (_2!6102 _$37!17))) (bvadd (bitIndex!0 (size!2774 (buf!3157 thiss!1634)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!134199 () Bool)

(assert (=> b!134199 (= e!89009 (array_inv!2563 (buf!3157 (_2!6102 _$37!17))))))

(assert (= d!43207 b!134199))

(assert (= (and d!43207 res!111512) b!134200))

(assert (= (and b!134200 res!111513) b!134201))

(assert (= (and b!134201 res!111514) b!134202))

(declare-fun m!204009 () Bool)

(assert (=> b!134200 m!204009))

(assert (=> b!134200 m!202839))

(declare-fun m!204011 () Bool)

(assert (=> b!134199 m!204011))

(declare-fun m!204013 () Bool)

(assert (=> b!134201 m!204013))

(declare-fun m!204015 () Bool)

(assert (=> d!43207 m!204015))

(declare-fun m!204017 () Bool)

(assert (=> b!134202 m!204017))

(declare-fun m!204019 () Bool)

(assert (=> b!134202 m!204019))

(assert (=> d!43003 d!43207))

(declare-fun d!43209 () Bool)

(assert (=> d!43209 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 thiss!1634))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!10531 () Bool)

(assert (= bs!10531 d!43209))

(assert (=> bs!10531 m!203471))

(assert (=> d!43003 d!43209))

(declare-fun e!89011 () Bool)

(declare-fun b!134203 () Bool)

(declare-fun lt!208043 () tuple3!512)

(assert (=> b!134203 (= e!89011 (= (select (arr!3424 (_3!313 lt!208043)) from!447) (_2!6100 (readBytePure!0 (_1!6101 lt!206843)))))))

(assert (=> b!134203 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!2774 (_3!313 lt!208043))))))

(declare-fun b!134204 () Bool)

(declare-fun e!89013 () Bool)

(assert (=> b!134204 (= e!89013 (arrayRangesEq!177 arr!237 (_3!313 lt!208043) #b00000000000000000000000000000000 from!447))))

(declare-fun b!134205 () Bool)

(declare-fun e!89012 () tuple3!512)

(declare-fun lt!208047 () Unit!8283)

(declare-fun lt!208044 () tuple3!512)

(assert (=> b!134205 (= e!89012 (tuple3!513 lt!208047 (_2!6113 lt!208044) (_3!313 lt!208044)))))

(declare-fun lt!208018 () tuple2!11598)

(assert (=> b!134205 (= lt!208018 (readByte!0 (_1!6101 lt!206843)))))

(declare-fun lt!208024 () array!6129)

(assert (=> b!134205 (= lt!208024 (array!6130 (store (arr!3424 arr!237) from!447 (_1!6112 lt!208018)) (size!2774 arr!237)))))

(declare-fun lt!208045 () (_ BitVec 64))

(assert (=> b!134205 (= lt!208045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!208041 () (_ BitVec 32))

(assert (=> b!134205 (= lt!208041 (bvsub to!404 from!447))))

(declare-fun lt!208039 () Unit!8283)

(assert (=> b!134205 (= lt!208039 (validateOffsetBytesFromBitIndexLemma!0 (_1!6101 lt!206843) (_2!6112 lt!208018) lt!208045 lt!208041))))

(assert (=> b!134205 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6112 lt!208018)))) ((_ sign_extend 32) (currentByte!5948 (_2!6112 lt!208018))) ((_ sign_extend 32) (currentBit!5943 (_2!6112 lt!208018))) (bvsub lt!208041 ((_ extract 31 0) (bvsdiv (bvadd lt!208045 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!208029 () Unit!8283)

(assert (=> b!134205 (= lt!208029 lt!208039)))

(assert (=> b!134205 (= lt!208044 (readByteArrayLoop!0 (_2!6112 lt!208018) lt!208024 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1740 () (_ BitVec 64))

(assert (=> b!134205 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!208018))) (currentByte!5948 (_2!6112 lt!208018)) (currentBit!5943 (_2!6112 lt!208018))) (bvadd call!1740 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!208034 () Unit!8283)

(declare-fun Unit!8336 () Unit!8283)

(assert (=> b!134205 (= lt!208034 Unit!8336)))

(assert (=> b!134205 (= (bvadd (bitIndex!0 (size!2774 (buf!3157 (_2!6112 lt!208018))) (currentByte!5948 (_2!6112 lt!208018)) (currentBit!5943 (_2!6112 lt!208018))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!208044))) (currentByte!5948 (_2!6113 lt!208044)) (currentBit!5943 (_2!6113 lt!208044))))))

(declare-fun lt!208015 () Unit!8283)

(declare-fun Unit!8337 () Unit!8283)

(assert (=> b!134205 (= lt!208015 Unit!8337)))

(assert (=> b!134205 (= (bvadd call!1740 (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!208044))) (currentByte!5948 (_2!6113 lt!208044)) (currentBit!5943 (_2!6113 lt!208044))))))

(declare-fun lt!208028 () Unit!8283)

(declare-fun Unit!8338 () Unit!8283)

(assert (=> b!134205 (= lt!208028 Unit!8338)))

(assert (=> b!134205 (and (= (buf!3157 (_1!6101 lt!206843)) (buf!3157 (_2!6113 lt!208044))) (= (size!2774 arr!237) (size!2774 (_3!313 lt!208044))))))

(declare-fun lt!208025 () Unit!8283)

(declare-fun Unit!8339 () Unit!8283)

(assert (=> b!134205 (= lt!208025 Unit!8339)))

(declare-fun lt!208046 () Unit!8283)

(assert (=> b!134205 (= lt!208046 (arrayUpdatedAtPrefixLemma!3 arr!237 from!447 (_1!6112 lt!208018)))))

(assert (=> b!134205 (arrayRangesEq!177 arr!237 (array!6130 (store (arr!3424 arr!237) from!447 (_1!6112 lt!208018)) (size!2774 arr!237)) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!208027 () Unit!8283)

(assert (=> b!134205 (= lt!208027 lt!208046)))

(declare-fun lt!208031 () (_ BitVec 32))

(assert (=> b!134205 (= lt!208031 #b00000000000000000000000000000000)))

(declare-fun lt!208016 () Unit!8283)

(assert (=> b!134205 (= lt!208016 (arrayRangesEqTransitive!3 arr!237 lt!208024 (_3!313 lt!208044) lt!208031 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(declare-fun call!1739 () Bool)

(assert (=> b!134205 call!1739))

(declare-fun lt!208030 () Unit!8283)

(assert (=> b!134205 (= lt!208030 lt!208016)))

(declare-fun call!1741 () Bool)

(assert (=> b!134205 call!1741))

(declare-fun lt!208019 () Unit!8283)

(declare-fun Unit!8340 () Unit!8283)

(assert (=> b!134205 (= lt!208019 Unit!8340)))

(declare-fun lt!208023 () Unit!8283)

(assert (=> b!134205 (= lt!208023 (arrayRangesEqImpliesEq!3 lt!208024 (_3!313 lt!208044) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134205 (= (select (store (arr!3424 arr!237) from!447 (_1!6112 lt!208018)) from!447) (select (arr!3424 (_3!313 lt!208044)) from!447))))

(declare-fun lt!208035 () Unit!8283)

(assert (=> b!134205 (= lt!208035 lt!208023)))

(declare-fun lt!208032 () Bool)

(assert (=> b!134205 (= lt!208032 (= (select (arr!3424 (_3!313 lt!208044)) from!447) (_1!6112 lt!208018)))))

(declare-fun Unit!8341 () Unit!8283)

(assert (=> b!134205 (= lt!208047 Unit!8341)))

(assert (=> b!134205 lt!208032))

(declare-fun bm!1736 () Bool)

(assert (=> bm!1736 (= call!1740 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!206843))) (currentByte!5948 (_1!6101 lt!206843)) (currentBit!5943 (_1!6101 lt!206843))))))

(declare-fun bm!1737 () Bool)

(declare-fun c!7662 () Bool)

(assert (=> bm!1737 (= call!1741 (arrayRangesEq!177 arr!237 (ite c!7662 (_3!313 lt!208044) arr!237) #b00000000000000000000000000000000 (ite c!7662 from!447 (size!2774 arr!237))))))

(declare-fun bm!1738 () Bool)

(declare-fun lt!208013 () array!6129)

(declare-fun lt!208033 () (_ BitVec 32))

(declare-fun lt!208022 () array!6129)

(declare-fun lt!208017 () (_ BitVec 32))

(assert (=> bm!1738 (= call!1739 (arrayRangesEq!177 (ite c!7662 arr!237 lt!208013) (ite c!7662 (_3!313 lt!208044) lt!208022) (ite c!7662 lt!208031 lt!208017) (ite c!7662 from!447 lt!208033)))))

(declare-fun b!134207 () Bool)

(declare-fun res!111517 () Bool)

(assert (=> b!134207 (=> (not res!111517) (not e!89013))))

(assert (=> b!134207 (= res!111517 (and (= (buf!3157 (_1!6101 lt!206843)) (buf!3157 (_2!6113 lt!208043))) (= (size!2774 arr!237) (size!2774 (_3!313 lt!208043)))))))

(declare-fun lt!208040 () Unit!8283)

(declare-fun b!134206 () Bool)

(assert (=> b!134206 (= e!89012 (tuple3!513 lt!208040 (_1!6101 lt!206843) arr!237))))

(assert (=> b!134206 (= call!1740 call!1740)))

(declare-fun lt!208042 () Unit!8283)

(declare-fun Unit!8342 () Unit!8283)

(assert (=> b!134206 (= lt!208042 Unit!8342)))

(declare-fun lt!208036 () Unit!8283)

(assert (=> b!134206 (= lt!208036 (arrayRangesEqReflexiveLemma!3 arr!237))))

(assert (=> b!134206 call!1741))

(declare-fun lt!208020 () Unit!8283)

(assert (=> b!134206 (= lt!208020 lt!208036)))

(assert (=> b!134206 (= lt!208013 arr!237)))

(assert (=> b!134206 (= lt!208022 arr!237)))

(declare-fun lt!208014 () (_ BitVec 32))

(assert (=> b!134206 (= lt!208014 #b00000000000000000000000000000000)))

(declare-fun lt!208012 () (_ BitVec 32))

(assert (=> b!134206 (= lt!208012 (size!2774 arr!237))))

(assert (=> b!134206 (= lt!208017 #b00000000000000000000000000000000)))

(assert (=> b!134206 (= lt!208033 from!447)))

(assert (=> b!134206 (= lt!208040 (arrayRangesEqSlicedLemma!3 lt!208013 lt!208022 lt!208014 lt!208012 lt!208017 lt!208033))))

(assert (=> b!134206 call!1739))

(declare-fun d!43211 () Bool)

(assert (=> d!43211 e!89011))

(declare-fun res!111516 () Bool)

(assert (=> d!43211 (=> res!111516 e!89011)))

(assert (=> d!43211 (= res!111516 (bvsge from!447 to!404))))

(declare-fun lt!208026 () Bool)

(assert (=> d!43211 (= lt!208026 e!89013)))

(declare-fun res!111515 () Bool)

(assert (=> d!43211 (=> (not res!111515) (not e!89013))))

(declare-fun lt!208021 () (_ BitVec 64))

(declare-fun lt!208038 () (_ BitVec 64))

(assert (=> d!43211 (= res!111515 (= (bvadd lt!208038 lt!208021) (bitIndex!0 (size!2774 (buf!3157 (_2!6113 lt!208043))) (currentByte!5948 (_2!6113 lt!208043)) (currentBit!5943 (_2!6113 lt!208043)))))))

(assert (=> d!43211 (or (not (= (bvand lt!208038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208021 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208038 lt!208021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!208037 () (_ BitVec 64))

(assert (=> d!43211 (= lt!208021 (bvmul lt!208037 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43211 (or (= lt!208037 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208037 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208037)))))

(assert (=> d!43211 (= lt!208037 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!43211 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!43211 (= lt!208038 (bitIndex!0 (size!2774 (buf!3157 (_1!6101 lt!206843))) (currentByte!5948 (_1!6101 lt!206843)) (currentBit!5943 (_1!6101 lt!206843))))))

(assert (=> d!43211 (= lt!208043 e!89012)))

(assert (=> d!43211 (= c!7662 (bvslt from!447 to!404))))

(assert (=> d!43211 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2774 arr!237)))))

(assert (=> d!43211 (= (readByteArrayLoop!0 (_1!6101 lt!206843) arr!237 from!447 to!404) lt!208043)))

(assert (= (and d!43211 c!7662) b!134205))

(assert (= (and d!43211 (not c!7662)) b!134206))

(assert (= (or b!134205 b!134206) bm!1738))

(assert (= (or b!134205 b!134206) bm!1737))

(assert (= (or b!134205 b!134206) bm!1736))

(assert (= (and d!43211 res!111515) b!134207))

(assert (= (and b!134207 res!111517) b!134204))

(assert (= (and d!43211 (not res!111516)) b!134203))

(declare-fun m!204021 () Bool)

(assert (=> bm!1738 m!204021))

(assert (=> b!134206 m!203807))

(declare-fun m!204023 () Bool)

(assert (=> b!134206 m!204023))

(declare-fun m!204025 () Bool)

(assert (=> b!134204 m!204025))

(declare-fun m!204027 () Bool)

(assert (=> b!134205 m!204027))

(declare-fun m!204029 () Bool)

(assert (=> b!134205 m!204029))

(declare-fun m!204031 () Bool)

(assert (=> b!134205 m!204031))

(declare-fun m!204033 () Bool)

(assert (=> b!134205 m!204033))

(declare-fun m!204035 () Bool)

(assert (=> b!134205 m!204035))

(declare-fun m!204037 () Bool)

(assert (=> b!134205 m!204037))

(assert (=> b!134205 m!203419))

(declare-fun m!204039 () Bool)

(assert (=> b!134205 m!204039))

(declare-fun m!204041 () Bool)

(assert (=> b!134205 m!204041))

(declare-fun m!204043 () Bool)

(assert (=> b!134205 m!204043))

(declare-fun m!204045 () Bool)

(assert (=> b!134205 m!204045))

(declare-fun m!204047 () Bool)

(assert (=> b!134205 m!204047))

(declare-fun m!204049 () Bool)

(assert (=> b!134205 m!204049))

(assert (=> bm!1736 m!203749))

(declare-fun m!204051 () Bool)

(assert (=> bm!1737 m!204051))

(declare-fun m!204053 () Bool)

(assert (=> d!43211 m!204053))

(assert (=> d!43211 m!203749))

(declare-fun m!204055 () Bool)

(assert (=> b!134203 m!204055))

(assert (=> b!134203 m!202785))

(assert (=> d!42990 d!43211))

(declare-fun d!43213 () Bool)

(declare-fun e!89014 () Bool)

(assert (=> d!43213 e!89014))

(declare-fun res!111519 () Bool)

(assert (=> d!43213 (=> (not res!111519) (not e!89014))))

(declare-fun lt!208052 () (_ BitVec 64))

(declare-fun lt!208050 () (_ BitVec 64))

(declare-fun lt!208053 () (_ BitVec 64))

(assert (=> d!43213 (= res!111519 (= lt!208052 (bvsub lt!208050 lt!208053)))))

(assert (=> d!43213 (or (= (bvand lt!208050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!208050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!208050 lt!208053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43213 (= lt!208053 (remainingBits!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207428)))) ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!207428))) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!207428)))))))

(declare-fun lt!208051 () (_ BitVec 64))

(declare-fun lt!208048 () (_ BitVec 64))

(assert (=> d!43213 (= lt!208050 (bvmul lt!208051 lt!208048))))

(assert (=> d!43213 (or (= lt!208051 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!208048 (bvsdiv (bvmul lt!208051 lt!208048) lt!208051)))))

(assert (=> d!43213 (= lt!208048 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43213 (= lt!208051 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207428)))))))

(assert (=> d!43213 (= lt!208052 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5948 (_2!6102 lt!207428))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5943 (_2!6102 lt!207428)))))))

(assert (=> d!43213 (invariant!0 (currentBit!5943 (_2!6102 lt!207428)) (currentByte!5948 (_2!6102 lt!207428)) (size!2774 (buf!3157 (_2!6102 lt!207428))))))

(assert (=> d!43213 (= (bitIndex!0 (size!2774 (buf!3157 (_2!6102 lt!207428))) (currentByte!5948 (_2!6102 lt!207428)) (currentBit!5943 (_2!6102 lt!207428))) lt!208052)))

(declare-fun b!134208 () Bool)

(declare-fun res!111518 () Bool)

(assert (=> b!134208 (=> (not res!111518) (not e!89014))))

(assert (=> b!134208 (= res!111518 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!208052))))

(declare-fun b!134209 () Bool)

(declare-fun lt!208049 () (_ BitVec 64))

(assert (=> b!134209 (= e!89014 (bvsle lt!208052 (bvmul lt!208049 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134209 (or (= lt!208049 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208049 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208049)))))

(assert (=> b!134209 (= lt!208049 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!207428)))))))

(assert (= (and d!43213 res!111519) b!134208))

(assert (= (and b!134208 res!111518) b!134209))

(declare-fun m!204057 () Bool)

(assert (=> d!43213 m!204057))

(declare-fun m!204059 () Bool)

(assert (=> d!43213 m!204059))

(assert (=> b!133916 d!43213))

(assert (=> b!133916 d!43013))

(declare-fun d!43215 () Bool)

(declare-fun e!89015 () Bool)

(assert (=> d!43215 e!89015))

(declare-fun res!111520 () Bool)

(assert (=> d!43215 (=> (not res!111520) (not e!89015))))

(declare-fun lt!208055 () (_ BitVec 64))

(declare-fun lt!208054 () BitStream!4812)

(assert (=> d!43215 (= res!111520 (= (bvadd lt!208055 (bvsub lt!207640 lt!207637)) (bitIndex!0 (size!2774 (buf!3157 lt!208054)) (currentByte!5948 lt!208054) (currentBit!5943 lt!208054))))))

(assert (=> d!43215 (or (not (= (bvand lt!208055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207640 lt!207637) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208055 (bvsub lt!207640 lt!207637)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43215 (= lt!208055 (bitIndex!0 (size!2774 (buf!3157 (_2!6101 lt!207629))) (currentByte!5948 (_2!6101 lt!207629)) (currentBit!5943 (_2!6101 lt!207629))))))

(assert (=> d!43215 (= lt!208054 (_2!6102 (moveBitIndex!0 (_2!6101 lt!207629) (bvsub lt!207640 lt!207637))))))

(assert (=> d!43215 (moveBitIndexPrecond!0 (_2!6101 lt!207629) (bvsub lt!207640 lt!207637))))

(assert (=> d!43215 (= (withMovedBitIndex!0 (_2!6101 lt!207629) (bvsub lt!207640 lt!207637)) lt!208054)))

(declare-fun b!134210 () Bool)

(assert (=> b!134210 (= e!89015 (= (size!2774 (buf!3157 (_2!6101 lt!207629))) (size!2774 (buf!3157 lt!208054))))))

(assert (= (and d!43215 res!111520) b!134210))

(declare-fun m!204061 () Bool)

(assert (=> d!43215 m!204061))

(assert (=> d!43215 m!203657))

(declare-fun m!204063 () Bool)

(assert (=> d!43215 m!204063))

(declare-fun m!204065 () Bool)

(assert (=> d!43215 m!204065))

(assert (=> b!133987 d!43215))

(assert (=> b!133987 d!43013))

(assert (=> b!133987 d!43015))

(assert (=> d!42960 d!42966))

(declare-fun d!43217 () Bool)

(assert (=> d!43217 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2774 (buf!3157 (_2!6102 lt!206855)))) ((_ sign_extend 32) (currentByte!5948 thiss!1634)) ((_ sign_extend 32) (currentBit!5943 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!43217 true))

(declare-fun _$5!37 () Unit!8283)

(assert (=> d!43217 (= (choose!26 thiss!1634 (buf!3157 (_2!6102 lt!206855)) (bvsub to!404 from!447) (BitStream!4813 (buf!3157 (_2!6102 lt!206855)) (currentByte!5948 thiss!1634) (currentBit!5943 thiss!1634))) _$5!37)))

(declare-fun bs!10532 () Bool)

(assert (= bs!10532 d!43217))

(assert (=> bs!10532 m!202799))

(assert (=> d!42960 d!43217))

(assert (=> b!133981 d!43015))

(assert (=> b!133981 d!43013))

(check-sat (not bm!1738) (not b!134124) (not bm!1735) (not d!43115) (not b!134142) (not d!43047) (not d!43165) (not b!134099) (not b!134003) (not b!134058) (not b!134187) (not d!43161) (not bm!1722) (not b!134173) (not d!43053) (not b!134114) (not b!134087) (not b!134139) (not b!134123) (not d!43187) (not b!134006) (not b!134202) (not b!134165) (not b!134200) (not b!134065) (not d!43055) (not b!134169) (not d!43085) (not d!43099) (not b!134118) (not b!134121) (not d!43181) (not b!134062) (not b!134089) (not d!43183) (not b!134021) (not d!43157) (not d!43105) (not b!134108) (not b!134205) (not b!134047) (not bm!1715) (not b!134181) (not b!134069) (not d!43177) (not b!134179) (not b!134174) (not b!134184) (not b!134204) (not d!43179) (not b!134203) (not d!43101) (not b!134052) (not b!134040) (not b!134022) (not b!134172) (not bm!1736) (not d!43141) (not b!134127) (not b!134199) (not d!43209) (not d!43131) (not b!134077) (not b!134182) (not b!134126) (not d!43089) (not bm!1723) (not b!134106) (not d!43139) (not b!134081) (not b!134043) (not b!134068) (not b!134188) (not bm!1725) (not b!134100) (not b!134206) (not b!134201) (not b!134135) (not b!134090) (not d!43217) (not b!134166) (not b!134092) (not d!43077) (not b!134078) (not b!134071) (not b!134103) (not b!134041) (not d!43045) (not b!134167) (not bm!1733) (not b!134072) (not d!43147) (not d!43041) (not d!43213) (not d!43195) (not b!134050) (not bm!1728) (not b!134009) (not d!43199) (not bm!1731) (not b!134038) (not b!134096) (not b!134093) (not b!134116) (not bm!1737) (not b!134049) (not d!43067) (not d!43175) (not d!43137) (not d!43121) (not bm!1726) (not d!43051) (not d!43173) (not b!134178) (not d!43143) (not b!134190) (not d!43207) (not b!134153) (not d!43215) (not bm!1732) (not b!134133) (not d!43109) (not d!43075) (not bm!1734) (not b!134112) (not b!134080) (not b!134146) (not b!134075) (not b!134147) (not d!43135) (not b!134066) (not b!134168) (not b!134023) (not d!43069) (not b!134084) (not b!134117) (not bm!1729) (not d!43211) (not b!134044) (not bm!1730) (not b!134046) (not d!43129) (not b!134130) (not d!43155) (not b!134151) (not b!134056) (not b!134128) (not b!134136) (not b!134149) (not b!134145) (not b!134059) (not b!134030) (not b!134143) (not d!43065) (not b!134074) (not bm!1724) (not b!134148) (not bm!1727) (not b!134175) (not b!134185) (not d!43119) (not b!134129) (not d!43095) (not b!134115) (not d!43169) (not d!43197) (not d!43049) (not b!134020))
(check-sat)
