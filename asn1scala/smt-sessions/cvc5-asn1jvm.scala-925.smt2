; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25948 () Bool)

(assert start!25948)

(declare-fun b!132769 () Bool)

(declare-fun res!110268 () Bool)

(declare-fun e!88040 () Bool)

(assert (=> b!132769 (=> (not res!110268) (not e!88040))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6118 0))(
  ( (array!6119 (arr!3405 (Array (_ BitVec 32) (_ BitVec 8))) (size!2770 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4804 0))(
  ( (BitStream!4805 (buf!3143 array!6118) (currentByte!5928 (_ BitVec 32)) (currentBit!5923 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4804)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132769 (= res!110268 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 thiss!1634))) ((_ sign_extend 32) (currentByte!5928 thiss!1634)) ((_ sign_extend 32) (currentBit!5923 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132770 () Bool)

(declare-fun res!110272 () Bool)

(declare-fun e!88048 () Bool)

(assert (=> b!132770 (=> (not res!110272) (not e!88048))))

(declare-datatypes ((Unit!8172 0))(
  ( (Unit!8173) )
))
(declare-datatypes ((tuple2!11536 0))(
  ( (tuple2!11537 (_1!6074 Unit!8172) (_2!6074 BitStream!4804)) )
))
(declare-fun lt!205021 () tuple2!11536)

(declare-fun isPrefixOf!0 (BitStream!4804 BitStream!4804) Bool)

(assert (=> b!132770 (= res!110272 (isPrefixOf!0 thiss!1634 (_2!6074 lt!205021)))))

(declare-fun b!132771 () Bool)

(declare-fun e!88047 () Bool)

(declare-fun e!88045 () Bool)

(assert (=> b!132771 (= e!88047 (not e!88045))))

(declare-fun res!110277 () Bool)

(assert (=> b!132771 (=> res!110277 e!88045)))

(declare-datatypes ((tuple2!11538 0))(
  ( (tuple2!11539 (_1!6075 BitStream!4804) (_2!6075 array!6118)) )
))
(declare-fun lt!205002 () tuple2!11538)

(declare-fun arr!237 () array!6118)

(declare-datatypes ((tuple2!11540 0))(
  ( (tuple2!11541 (_1!6076 BitStream!4804) (_2!6076 BitStream!4804)) )
))
(declare-fun lt!205010 () tuple2!11540)

(assert (=> b!132771 (= res!110277 (or (not (= (size!2770 (_2!6075 lt!205002)) (size!2770 arr!237))) (not (= (_1!6075 lt!205002) (_2!6076 lt!205010)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4804 array!6118 (_ BitVec 32) (_ BitVec 32)) tuple2!11538)

(assert (=> b!132771 (= lt!205002 (readByteArrayLoopPure!0 (_1!6076 lt!205010) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205015 () tuple2!11536)

(declare-fun lt!205024 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132771 (validate_offset_bits!1 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205024)))

(declare-fun lt!205008 () Unit!8172)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4804 array!6118 (_ BitVec 64)) Unit!8172)

(assert (=> b!132771 (= lt!205008 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6074 lt!205021) (buf!3143 (_2!6074 lt!205015)) lt!205024))))

(declare-fun reader!0 (BitStream!4804 BitStream!4804) tuple2!11540)

(assert (=> b!132771 (= lt!205010 (reader!0 (_2!6074 lt!205021) (_2!6074 lt!205015)))))

(declare-fun b!132772 () Bool)

(declare-fun e!88044 () Bool)

(assert (=> b!132772 (= e!88044 e!88047)))

(declare-fun res!110270 () Bool)

(assert (=> b!132772 (=> (not res!110270) (not e!88047))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132772 (= res!110270 (= (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205015))) (currentByte!5928 (_2!6074 lt!205015)) (currentBit!5923 (_2!6074 lt!205015))) (bvadd (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!205024))))))

(assert (=> b!132772 (= lt!205024 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!110267 () Bool)

(assert (=> start!25948 (=> (not res!110267) (not e!88040))))

(assert (=> start!25948 (= res!110267 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2770 arr!237))))))

(assert (=> start!25948 e!88040))

(assert (=> start!25948 true))

(declare-fun array_inv!2559 (array!6118) Bool)

(assert (=> start!25948 (array_inv!2559 arr!237)))

(declare-fun e!88041 () Bool)

(declare-fun inv!12 (BitStream!4804) Bool)

(assert (=> start!25948 (and (inv!12 thiss!1634) e!88041)))

(declare-fun b!132773 () Bool)

(declare-fun e!88049 () Bool)

(declare-datatypes ((tuple2!11542 0))(
  ( (tuple2!11543 (_1!6077 BitStream!4804) (_2!6077 (_ BitVec 8))) )
))
(declare-fun lt!205017 () tuple2!11542)

(declare-fun lt!205012 () tuple2!11542)

(assert (=> b!132773 (= e!88049 (= (_2!6077 lt!205017) (_2!6077 lt!205012)))))

(declare-fun lt!205009 () tuple2!11540)

(declare-fun lt!205016 () tuple2!11542)

(declare-fun b!132774 () Bool)

(assert (=> b!132774 (= e!88048 (and (= (_2!6077 lt!205016) (select (arr!3405 arr!237) from!447)) (= (_1!6077 lt!205016) (_2!6076 lt!205009))))))

(declare-fun readBytePure!0 (BitStream!4804) tuple2!11542)

(assert (=> b!132774 (= lt!205016 (readBytePure!0 (_1!6076 lt!205009)))))

(assert (=> b!132774 (= lt!205009 (reader!0 thiss!1634 (_2!6074 lt!205021)))))

(declare-fun lt!205018 () tuple2!11538)

(declare-fun b!132775 () Bool)

(declare-fun lt!205011 () tuple2!11538)

(assert (=> b!132775 (= e!88040 (not (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsle (size!2770 (_2!6075 lt!205011)) (size!2770 (_2!6075 lt!205018))))))))

(declare-fun lt!205004 () tuple2!11538)

(declare-fun arrayRangesEq!173 (array!6118 array!6118 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132775 (arrayRangesEq!173 (_2!6075 lt!205011) (_2!6075 lt!205004) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!205019 () Unit!8172)

(declare-fun lt!205006 () tuple2!11540)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4804 array!6118 (_ BitVec 32) (_ BitVec 32)) Unit!8172)

(assert (=> b!132775 (= lt!205019 (readByteArrayLoopArrayPrefixLemma!0 (_1!6076 lt!205006) arr!237 from!447 to!404))))

(declare-fun lt!205013 () array!6118)

(declare-fun withMovedByteIndex!0 (BitStream!4804 (_ BitVec 32)) BitStream!4804)

(assert (=> b!132775 (= lt!205004 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6076 lt!205006) #b00000000000000000000000000000001) lt!205013 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205025 () tuple2!11540)

(assert (=> b!132775 (= lt!205018 (readByteArrayLoopPure!0 (_1!6076 lt!205025) lt!205013 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205003 () tuple2!11542)

(assert (=> b!132775 (= lt!205013 (array!6119 (store (arr!3405 arr!237) from!447 (_2!6077 lt!205003)) (size!2770 arr!237)))))

(declare-fun lt!205001 () (_ BitVec 32))

(assert (=> b!132775 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205001)))

(declare-fun lt!205020 () Unit!8172)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4804 array!6118 (_ BitVec 32)) Unit!8172)

(assert (=> b!132775 (= lt!205020 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6074 lt!205021) (buf!3143 (_2!6074 lt!205015)) lt!205001))))

(assert (=> b!132775 (= (_1!6075 lt!205011) (_2!6076 lt!205006))))

(assert (=> b!132775 (= lt!205011 (readByteArrayLoopPure!0 (_1!6076 lt!205006) arr!237 from!447 to!404))))

(assert (=> b!132775 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 thiss!1634)) ((_ sign_extend 32) (currentBit!5923 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!205014 () Unit!8172)

(assert (=> b!132775 (= lt!205014 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3143 (_2!6074 lt!205015)) (bvsub to!404 from!447)))))

(assert (=> b!132775 (= (_2!6077 lt!205003) (select (arr!3405 arr!237) from!447))))

(assert (=> b!132775 (= lt!205003 (readBytePure!0 (_1!6076 lt!205006)))))

(assert (=> b!132775 (= lt!205025 (reader!0 (_2!6074 lt!205021) (_2!6074 lt!205015)))))

(assert (=> b!132775 (= lt!205006 (reader!0 thiss!1634 (_2!6074 lt!205015)))))

(assert (=> b!132775 e!88049))

(declare-fun res!110271 () Bool)

(assert (=> b!132775 (=> (not res!110271) (not e!88049))))

(assert (=> b!132775 (= res!110271 (= (bitIndex!0 (size!2770 (buf!3143 (_1!6077 lt!205017))) (currentByte!5928 (_1!6077 lt!205017)) (currentBit!5923 (_1!6077 lt!205017))) (bitIndex!0 (size!2770 (buf!3143 (_1!6077 lt!205012))) (currentByte!5928 (_1!6077 lt!205012)) (currentBit!5923 (_1!6077 lt!205012)))))))

(declare-fun lt!205022 () Unit!8172)

(declare-fun lt!205023 () BitStream!4804)

(declare-fun readBytePrefixLemma!0 (BitStream!4804 BitStream!4804) Unit!8172)

(assert (=> b!132775 (= lt!205022 (readBytePrefixLemma!0 lt!205023 (_2!6074 lt!205015)))))

(assert (=> b!132775 (= lt!205012 (readBytePure!0 (BitStream!4805 (buf!3143 (_2!6074 lt!205015)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634))))))

(assert (=> b!132775 (= lt!205017 (readBytePure!0 lt!205023))))

(assert (=> b!132775 (= lt!205023 (BitStream!4805 (buf!3143 (_2!6074 lt!205021)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)))))

(declare-fun e!88042 () Bool)

(assert (=> b!132775 e!88042))

(declare-fun res!110278 () Bool)

(assert (=> b!132775 (=> (not res!110278) (not e!88042))))

(assert (=> b!132775 (= res!110278 (isPrefixOf!0 thiss!1634 (_2!6074 lt!205015)))))

(declare-fun lt!205007 () Unit!8172)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4804 BitStream!4804 BitStream!4804) Unit!8172)

(assert (=> b!132775 (= lt!205007 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6074 lt!205021) (_2!6074 lt!205015)))))

(assert (=> b!132775 e!88044))

(declare-fun res!110274 () Bool)

(assert (=> b!132775 (=> (not res!110274) (not e!88044))))

(assert (=> b!132775 (= res!110274 (= (size!2770 (buf!3143 (_2!6074 lt!205021))) (size!2770 (buf!3143 (_2!6074 lt!205015)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4804 array!6118 (_ BitVec 32) (_ BitVec 32)) tuple2!11536)

(assert (=> b!132775 (= lt!205015 (appendByteArrayLoop!0 (_2!6074 lt!205021) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132775 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205021)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205001)))

(assert (=> b!132775 (= lt!205001 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!205005 () Unit!8172)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4804 BitStream!4804 (_ BitVec 64) (_ BitVec 32)) Unit!8172)

(assert (=> b!132775 (= lt!205005 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6074 lt!205021) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132775 e!88048))

(declare-fun res!110273 () Bool)

(assert (=> b!132775 (=> (not res!110273) (not e!88048))))

(assert (=> b!132775 (= res!110273 (= (size!2770 (buf!3143 thiss!1634)) (size!2770 (buf!3143 (_2!6074 lt!205021)))))))

(declare-fun appendByte!0 (BitStream!4804 (_ BitVec 8)) tuple2!11536)

(assert (=> b!132775 (= lt!205021 (appendByte!0 thiss!1634 (select (arr!3405 arr!237) from!447)))))

(declare-fun b!132776 () Bool)

(declare-fun res!110276 () Bool)

(assert (=> b!132776 (=> (not res!110276) (not e!88040))))

(assert (=> b!132776 (= res!110276 (bvslt from!447 to!404))))

(declare-fun b!132777 () Bool)

(declare-fun res!110266 () Bool)

(assert (=> b!132777 (=> (not res!110266) (not e!88040))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132777 (= res!110266 (invariant!0 (currentBit!5923 thiss!1634) (currentByte!5928 thiss!1634) (size!2770 (buf!3143 thiss!1634))))))

(declare-fun b!132778 () Bool)

(declare-fun res!110275 () Bool)

(assert (=> b!132778 (=> (not res!110275) (not e!88047))))

(assert (=> b!132778 (= res!110275 (isPrefixOf!0 (_2!6074 lt!205021) (_2!6074 lt!205015)))))

(declare-fun b!132779 () Bool)

(assert (=> b!132779 (= e!88041 (array_inv!2559 (buf!3143 thiss!1634)))))

(declare-fun b!132780 () Bool)

(declare-fun res!110269 () Bool)

(assert (=> b!132780 (=> (not res!110269) (not e!88048))))

(assert (=> b!132780 (= res!110269 (= (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)))))))

(declare-fun b!132781 () Bool)

(assert (=> b!132781 (= e!88045 (not (arrayRangesEq!173 arr!237 (_2!6075 lt!205002) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132782 () Bool)

(assert (=> b!132782 (= e!88042 (invariant!0 (currentBit!5923 thiss!1634) (currentByte!5928 thiss!1634) (size!2770 (buf!3143 (_2!6074 lt!205021)))))))

(assert (= (and start!25948 res!110267) b!132769))

(assert (= (and b!132769 res!110268) b!132776))

(assert (= (and b!132776 res!110276) b!132777))

(assert (= (and b!132777 res!110266) b!132775))

(assert (= (and b!132775 res!110273) b!132780))

(assert (= (and b!132780 res!110269) b!132770))

(assert (= (and b!132770 res!110272) b!132774))

(assert (= (and b!132775 res!110274) b!132772))

(assert (= (and b!132772 res!110270) b!132778))

(assert (= (and b!132778 res!110275) b!132771))

(assert (= (and b!132771 (not res!110277)) b!132781))

(assert (= (and b!132775 res!110278) b!132782))

(assert (= (and b!132775 res!110271) b!132773))

(assert (= start!25948 b!132779))

(declare-fun m!200713 () Bool)

(assert (=> b!132782 m!200713))

(declare-fun m!200715 () Bool)

(assert (=> b!132777 m!200715))

(declare-fun m!200717 () Bool)

(assert (=> b!132779 m!200717))

(declare-fun m!200719 () Bool)

(assert (=> b!132770 m!200719))

(declare-fun m!200721 () Bool)

(assert (=> start!25948 m!200721))

(declare-fun m!200723 () Bool)

(assert (=> start!25948 m!200723))

(declare-fun m!200725 () Bool)

(assert (=> b!132772 m!200725))

(declare-fun m!200727 () Bool)

(assert (=> b!132772 m!200727))

(declare-fun m!200729 () Bool)

(assert (=> b!132775 m!200729))

(declare-fun m!200731 () Bool)

(assert (=> b!132775 m!200731))

(declare-fun m!200733 () Bool)

(assert (=> b!132775 m!200733))

(declare-fun m!200735 () Bool)

(assert (=> b!132775 m!200735))

(declare-fun m!200737 () Bool)

(assert (=> b!132775 m!200737))

(declare-fun m!200739 () Bool)

(assert (=> b!132775 m!200739))

(declare-fun m!200741 () Bool)

(assert (=> b!132775 m!200741))

(declare-fun m!200743 () Bool)

(assert (=> b!132775 m!200743))

(declare-fun m!200745 () Bool)

(assert (=> b!132775 m!200745))

(declare-fun m!200747 () Bool)

(assert (=> b!132775 m!200747))

(declare-fun m!200749 () Bool)

(assert (=> b!132775 m!200749))

(declare-fun m!200751 () Bool)

(assert (=> b!132775 m!200751))

(declare-fun m!200753 () Bool)

(assert (=> b!132775 m!200753))

(declare-fun m!200755 () Bool)

(assert (=> b!132775 m!200755))

(declare-fun m!200757 () Bool)

(assert (=> b!132775 m!200757))

(declare-fun m!200759 () Bool)

(assert (=> b!132775 m!200759))

(declare-fun m!200761 () Bool)

(assert (=> b!132775 m!200761))

(declare-fun m!200763 () Bool)

(assert (=> b!132775 m!200763))

(declare-fun m!200765 () Bool)

(assert (=> b!132775 m!200765))

(declare-fun m!200767 () Bool)

(assert (=> b!132775 m!200767))

(declare-fun m!200769 () Bool)

(assert (=> b!132775 m!200769))

(declare-fun m!200771 () Bool)

(assert (=> b!132775 m!200771))

(declare-fun m!200773 () Bool)

(assert (=> b!132775 m!200773))

(assert (=> b!132775 m!200753))

(declare-fun m!200775 () Bool)

(assert (=> b!132775 m!200775))

(assert (=> b!132775 m!200729))

(declare-fun m!200777 () Bool)

(assert (=> b!132775 m!200777))

(declare-fun m!200779 () Bool)

(assert (=> b!132775 m!200779))

(declare-fun m!200781 () Bool)

(assert (=> b!132769 m!200781))

(declare-fun m!200783 () Bool)

(assert (=> b!132778 m!200783))

(assert (=> b!132774 m!200753))

(declare-fun m!200785 () Bool)

(assert (=> b!132774 m!200785))

(declare-fun m!200787 () Bool)

(assert (=> b!132774 m!200787))

(assert (=> b!132780 m!200727))

(declare-fun m!200789 () Bool)

(assert (=> b!132780 m!200789))

(declare-fun m!200791 () Bool)

(assert (=> b!132771 m!200791))

(declare-fun m!200793 () Bool)

(assert (=> b!132771 m!200793))

(declare-fun m!200795 () Bool)

(assert (=> b!132771 m!200795))

(assert (=> b!132771 m!200777))

(declare-fun m!200797 () Bool)

(assert (=> b!132781 m!200797))

(push 1)

(assert (not b!132770))

(assert (not b!132782))

(assert (not b!132779))

(assert (not b!132772))

(assert (not b!132771))

(assert (not b!132780))

(assert (not b!132775))

(assert (not b!132777))

(assert (not b!132769))

(assert (not start!25948))

(assert (not b!132781))

(assert (not b!132778))

(assert (not b!132774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!42167 () Bool)

(declare-fun e!88112 () Bool)

(assert (=> d!42167 e!88112))

(declare-fun res!110361 () Bool)

(assert (=> d!42167 (=> (not res!110361) (not e!88112))))

(declare-fun lt!205190 () (_ BitVec 64))

(declare-fun lt!205191 () (_ BitVec 64))

(declare-fun lt!205189 () (_ BitVec 64))

(assert (=> d!42167 (= res!110361 (= lt!205191 (bvsub lt!205189 lt!205190)))))

(assert (=> d!42167 (or (= (bvand lt!205189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205190 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205189 lt!205190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!42167 (= lt!205190 (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205015))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205015)))))))

(declare-fun lt!205192 () (_ BitVec 64))

(declare-fun lt!205188 () (_ BitVec 64))

(assert (=> d!42167 (= lt!205189 (bvmul lt!205192 lt!205188))))

(assert (=> d!42167 (or (= lt!205192 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205188 (bvsdiv (bvmul lt!205192 lt!205188) lt!205192)))))

(assert (=> d!42167 (= lt!205188 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42167 (= lt!205192 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))))))

(assert (=> d!42167 (= lt!205191 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205015))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205015)))))))

(assert (=> d!42167 (invariant!0 (currentBit!5923 (_2!6074 lt!205015)) (currentByte!5928 (_2!6074 lt!205015)) (size!2770 (buf!3143 (_2!6074 lt!205015))))))

(assert (=> d!42167 (= (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205015))) (currentByte!5928 (_2!6074 lt!205015)) (currentBit!5923 (_2!6074 lt!205015))) lt!205191)))

(declare-fun b!132871 () Bool)

(declare-fun res!110362 () Bool)

(assert (=> b!132871 (=> (not res!110362) (not e!88112))))

(assert (=> b!132871 (= res!110362 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205191))))

(declare-fun b!132872 () Bool)

(declare-fun lt!205193 () (_ BitVec 64))

(assert (=> b!132872 (= e!88112 (bvsle lt!205191 (bvmul lt!205193 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132872 (or (= lt!205193 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205193 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205193)))))

(assert (=> b!132872 (= lt!205193 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))))))

(assert (= (and d!42167 res!110361) b!132871))

(assert (= (and b!132871 res!110362) b!132872))

(declare-fun m!200971 () Bool)

(assert (=> d!42167 m!200971))

(declare-fun m!200973 () Bool)

(assert (=> d!42167 m!200973))

(assert (=> b!132772 d!42167))

(declare-fun d!42169 () Bool)

(declare-fun e!88113 () Bool)

(assert (=> d!42169 e!88113))

(declare-fun res!110363 () Bool)

(assert (=> d!42169 (=> (not res!110363) (not e!88113))))

(declare-fun lt!205195 () (_ BitVec 64))

(declare-fun lt!205197 () (_ BitVec 64))

(declare-fun lt!205196 () (_ BitVec 64))

(assert (=> d!42169 (= res!110363 (= lt!205197 (bvsub lt!205195 lt!205196)))))

(assert (=> d!42169 (or (= (bvand lt!205195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205196 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205195 lt!205196) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42169 (= lt!205196 (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205021)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021)))))))

(declare-fun lt!205198 () (_ BitVec 64))

(declare-fun lt!205194 () (_ BitVec 64))

(assert (=> d!42169 (= lt!205195 (bvmul lt!205198 lt!205194))))

(assert (=> d!42169 (or (= lt!205198 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205194 (bvsdiv (bvmul lt!205198 lt!205194) lt!205198)))))

(assert (=> d!42169 (= lt!205194 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42169 (= lt!205198 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205021)))))))

(assert (=> d!42169 (= lt!205197 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021)))))))

(assert (=> d!42169 (invariant!0 (currentBit!5923 (_2!6074 lt!205021)) (currentByte!5928 (_2!6074 lt!205021)) (size!2770 (buf!3143 (_2!6074 lt!205021))))))

(assert (=> d!42169 (= (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021))) lt!205197)))

(declare-fun b!132873 () Bool)

(declare-fun res!110364 () Bool)

(assert (=> b!132873 (=> (not res!110364) (not e!88113))))

(assert (=> b!132873 (= res!110364 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205197))))

(declare-fun b!132874 () Bool)

(declare-fun lt!205199 () (_ BitVec 64))

(assert (=> b!132874 (= e!88113 (bvsle lt!205197 (bvmul lt!205199 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132874 (or (= lt!205199 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205199 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205199)))))

(assert (=> b!132874 (= lt!205199 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205021)))))))

(assert (= (and d!42169 res!110363) b!132873))

(assert (= (and b!132873 res!110364) b!132874))

(declare-fun m!200975 () Bool)

(assert (=> d!42169 m!200975))

(declare-fun m!200977 () Bool)

(assert (=> d!42169 m!200977))

(assert (=> b!132772 d!42169))

(declare-fun d!42171 () Bool)

(assert (=> d!42171 (= (invariant!0 (currentBit!5923 thiss!1634) (currentByte!5928 thiss!1634) (size!2770 (buf!3143 (_2!6074 lt!205021)))) (and (bvsge (currentBit!5923 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5923 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5928 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5928 thiss!1634) (size!2770 (buf!3143 (_2!6074 lt!205021)))) (and (= (currentBit!5923 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5928 thiss!1634) (size!2770 (buf!3143 (_2!6074 lt!205021))))))))))

(assert (=> b!132782 d!42171))

(declare-fun d!42173 () Bool)

(declare-datatypes ((tuple3!502 0))(
  ( (tuple3!503 (_1!6086 Unit!8172) (_2!6086 BitStream!4804) (_3!306 array!6118)) )
))
(declare-fun lt!205202 () tuple3!502)

(declare-fun readByteArrayLoop!0 (BitStream!4804 array!6118 (_ BitVec 32) (_ BitVec 32)) tuple3!502)

(assert (=> d!42173 (= lt!205202 (readByteArrayLoop!0 (_1!6076 lt!205010) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42173 (= (readByteArrayLoopPure!0 (_1!6076 lt!205010) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11539 (_2!6086 lt!205202) (_3!306 lt!205202)))))

(declare-fun bs!10308 () Bool)

(assert (= bs!10308 d!42173))

(declare-fun m!200979 () Bool)

(assert (=> bs!10308 m!200979))

(assert (=> b!132771 d!42173))

(declare-fun d!42175 () Bool)

(assert (=> d!42175 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205024) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021)))) lt!205024))))

(declare-fun bs!10309 () Bool)

(assert (= bs!10309 d!42175))

(declare-fun m!200981 () Bool)

(assert (=> bs!10309 m!200981))

(assert (=> b!132771 d!42175))

(declare-fun d!42177 () Bool)

(assert (=> d!42177 (validate_offset_bits!1 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205024)))

(declare-fun lt!205205 () Unit!8172)

(declare-fun choose!9 (BitStream!4804 array!6118 (_ BitVec 64) BitStream!4804) Unit!8172)

(assert (=> d!42177 (= lt!205205 (choose!9 (_2!6074 lt!205021) (buf!3143 (_2!6074 lt!205015)) lt!205024 (BitStream!4805 (buf!3143 (_2!6074 lt!205015)) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021)))))))

(assert (=> d!42177 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6074 lt!205021) (buf!3143 (_2!6074 lt!205015)) lt!205024) lt!205205)))

(declare-fun bs!10310 () Bool)

(assert (= bs!10310 d!42177))

(assert (=> bs!10310 m!200793))

(declare-fun m!200983 () Bool)

(assert (=> bs!10310 m!200983))

(assert (=> b!132771 d!42177))

(declare-fun d!42179 () Bool)

(declare-fun e!88118 () Bool)

(assert (=> d!42179 e!88118))

(declare-fun res!110373 () Bool)

(assert (=> d!42179 (=> (not res!110373) (not e!88118))))

(declare-fun lt!205251 () tuple2!11540)

(assert (=> d!42179 (= res!110373 (isPrefixOf!0 (_1!6076 lt!205251) (_2!6076 lt!205251)))))

(declare-fun lt!205253 () BitStream!4804)

(assert (=> d!42179 (= lt!205251 (tuple2!11541 lt!205253 (_2!6074 lt!205015)))))

(declare-fun lt!205262 () Unit!8172)

(declare-fun lt!205254 () Unit!8172)

(assert (=> d!42179 (= lt!205262 lt!205254)))

(assert (=> d!42179 (isPrefixOf!0 lt!205253 (_2!6074 lt!205015))))

(assert (=> d!42179 (= lt!205254 (lemmaIsPrefixTransitive!0 lt!205253 (_2!6074 lt!205015) (_2!6074 lt!205015)))))

(declare-fun lt!205250 () Unit!8172)

(declare-fun lt!205246 () Unit!8172)

(assert (=> d!42179 (= lt!205250 lt!205246)))

(assert (=> d!42179 (isPrefixOf!0 lt!205253 (_2!6074 lt!205015))))

(assert (=> d!42179 (= lt!205246 (lemmaIsPrefixTransitive!0 lt!205253 (_2!6074 lt!205021) (_2!6074 lt!205015)))))

(declare-fun lt!205264 () Unit!8172)

(declare-fun e!88119 () Unit!8172)

(assert (=> d!42179 (= lt!205264 e!88119)))

(declare-fun c!7587 () Bool)

(assert (=> d!42179 (= c!7587 (not (= (size!2770 (buf!3143 (_2!6074 lt!205021))) #b00000000000000000000000000000000)))))

(declare-fun lt!205261 () Unit!8172)

(declare-fun lt!205249 () Unit!8172)

(assert (=> d!42179 (= lt!205261 lt!205249)))

(assert (=> d!42179 (isPrefixOf!0 (_2!6074 lt!205015) (_2!6074 lt!205015))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4804) Unit!8172)

(assert (=> d!42179 (= lt!205249 (lemmaIsPrefixRefl!0 (_2!6074 lt!205015)))))

(declare-fun lt!205257 () Unit!8172)

(declare-fun lt!205260 () Unit!8172)

(assert (=> d!42179 (= lt!205257 lt!205260)))

(assert (=> d!42179 (= lt!205260 (lemmaIsPrefixRefl!0 (_2!6074 lt!205015)))))

(declare-fun lt!205247 () Unit!8172)

(declare-fun lt!205259 () Unit!8172)

(assert (=> d!42179 (= lt!205247 lt!205259)))

(assert (=> d!42179 (isPrefixOf!0 lt!205253 lt!205253)))

(assert (=> d!42179 (= lt!205259 (lemmaIsPrefixRefl!0 lt!205253))))

(declare-fun lt!205255 () Unit!8172)

(declare-fun lt!205256 () Unit!8172)

(assert (=> d!42179 (= lt!205255 lt!205256)))

(assert (=> d!42179 (isPrefixOf!0 (_2!6074 lt!205021) (_2!6074 lt!205021))))

(assert (=> d!42179 (= lt!205256 (lemmaIsPrefixRefl!0 (_2!6074 lt!205021)))))

(assert (=> d!42179 (= lt!205253 (BitStream!4805 (buf!3143 (_2!6074 lt!205015)) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021))))))

(assert (=> d!42179 (isPrefixOf!0 (_2!6074 lt!205021) (_2!6074 lt!205015))))

(assert (=> d!42179 (= (reader!0 (_2!6074 lt!205021) (_2!6074 lt!205015)) lt!205251)))

(declare-fun lt!205258 () (_ BitVec 64))

(declare-fun b!132885 () Bool)

(declare-fun lt!205263 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4804 (_ BitVec 64)) BitStream!4804)

(assert (=> b!132885 (= e!88118 (= (_1!6076 lt!205251) (withMovedBitIndex!0 (_2!6076 lt!205251) (bvsub lt!205258 lt!205263))))))

(assert (=> b!132885 (or (= (bvand lt!205258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205258 lt!205263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132885 (= lt!205263 (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205015))) (currentByte!5928 (_2!6074 lt!205015)) (currentBit!5923 (_2!6074 lt!205015))))))

(assert (=> b!132885 (= lt!205258 (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021))))))

(declare-fun b!132886 () Bool)

(declare-fun Unit!8178 () Unit!8172)

(assert (=> b!132886 (= e!88119 Unit!8178)))

(declare-fun b!132887 () Bool)

(declare-fun lt!205265 () Unit!8172)

(assert (=> b!132887 (= e!88119 lt!205265)))

(declare-fun lt!205252 () (_ BitVec 64))

(assert (=> b!132887 (= lt!205252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205248 () (_ BitVec 64))

(assert (=> b!132887 (= lt!205248 (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6118 array!6118 (_ BitVec 64) (_ BitVec 64)) Unit!8172)

(assert (=> b!132887 (= lt!205265 (arrayBitRangesEqSymmetric!0 (buf!3143 (_2!6074 lt!205021)) (buf!3143 (_2!6074 lt!205015)) lt!205252 lt!205248))))

(declare-fun arrayBitRangesEq!0 (array!6118 array!6118 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132887 (arrayBitRangesEq!0 (buf!3143 (_2!6074 lt!205015)) (buf!3143 (_2!6074 lt!205021)) lt!205252 lt!205248)))

(declare-fun b!132888 () Bool)

(declare-fun res!110372 () Bool)

(assert (=> b!132888 (=> (not res!110372) (not e!88118))))

(assert (=> b!132888 (= res!110372 (isPrefixOf!0 (_1!6076 lt!205251) (_2!6074 lt!205021)))))

(declare-fun b!132889 () Bool)

(declare-fun res!110371 () Bool)

(assert (=> b!132889 (=> (not res!110371) (not e!88118))))

(assert (=> b!132889 (= res!110371 (isPrefixOf!0 (_2!6076 lt!205251) (_2!6074 lt!205015)))))

(assert (= (and d!42179 c!7587) b!132887))

(assert (= (and d!42179 (not c!7587)) b!132886))

(assert (= (and d!42179 res!110373) b!132888))

(assert (= (and b!132888 res!110372) b!132889))

(assert (= (and b!132889 res!110371) b!132885))

(assert (=> b!132887 m!200727))

(declare-fun m!200985 () Bool)

(assert (=> b!132887 m!200985))

(declare-fun m!200987 () Bool)

(assert (=> b!132887 m!200987))

(declare-fun m!200989 () Bool)

(assert (=> b!132888 m!200989))

(declare-fun m!200991 () Bool)

(assert (=> d!42179 m!200991))

(declare-fun m!200993 () Bool)

(assert (=> d!42179 m!200993))

(declare-fun m!200995 () Bool)

(assert (=> d!42179 m!200995))

(declare-fun m!200997 () Bool)

(assert (=> d!42179 m!200997))

(declare-fun m!200999 () Bool)

(assert (=> d!42179 m!200999))

(assert (=> d!42179 m!200783))

(declare-fun m!201001 () Bool)

(assert (=> d!42179 m!201001))

(declare-fun m!201003 () Bool)

(assert (=> d!42179 m!201003))

(declare-fun m!201005 () Bool)

(assert (=> d!42179 m!201005))

(declare-fun m!201007 () Bool)

(assert (=> d!42179 m!201007))

(declare-fun m!201009 () Bool)

(assert (=> d!42179 m!201009))

(declare-fun m!201011 () Bool)

(assert (=> b!132885 m!201011))

(assert (=> b!132885 m!200725))

(assert (=> b!132885 m!200727))

(declare-fun m!201013 () Bool)

(assert (=> b!132889 m!201013))

(assert (=> b!132771 d!42179))

(declare-fun d!42181 () Bool)

(declare-fun res!110381 () Bool)

(declare-fun e!88125 () Bool)

(assert (=> d!42181 (=> (not res!110381) (not e!88125))))

(assert (=> d!42181 (= res!110381 (= (size!2770 (buf!3143 thiss!1634)) (size!2770 (buf!3143 (_2!6074 lt!205021)))))))

(assert (=> d!42181 (= (isPrefixOf!0 thiss!1634 (_2!6074 lt!205021)) e!88125)))

(declare-fun b!132896 () Bool)

(declare-fun res!110382 () Bool)

(assert (=> b!132896 (=> (not res!110382) (not e!88125))))

(assert (=> b!132896 (= res!110382 (bvsle (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)) (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021)))))))

(declare-fun b!132897 () Bool)

(declare-fun e!88124 () Bool)

(assert (=> b!132897 (= e!88125 e!88124)))

(declare-fun res!110380 () Bool)

(assert (=> b!132897 (=> res!110380 e!88124)))

(assert (=> b!132897 (= res!110380 (= (size!2770 (buf!3143 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!132898 () Bool)

(assert (=> b!132898 (= e!88124 (arrayBitRangesEq!0 (buf!3143 thiss!1634) (buf!3143 (_2!6074 lt!205021)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634))))))

(assert (= (and d!42181 res!110381) b!132896))

(assert (= (and b!132896 res!110382) b!132897))

(assert (= (and b!132897 (not res!110380)) b!132898))

(assert (=> b!132896 m!200789))

(assert (=> b!132896 m!200727))

(assert (=> b!132898 m!200789))

(assert (=> b!132898 m!200789))

(declare-fun m!201015 () Bool)

(assert (=> b!132898 m!201015))

(assert (=> b!132770 d!42181))

(declare-fun d!42183 () Bool)

(declare-fun res!110387 () Bool)

(declare-fun e!88130 () Bool)

(assert (=> d!42183 (=> res!110387 e!88130)))

(assert (=> d!42183 (= res!110387 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42183 (= (arrayRangesEq!173 arr!237 (_2!6075 lt!205002) #b00000000000000000000000000000000 to!404) e!88130)))

(declare-fun b!132903 () Bool)

(declare-fun e!88131 () Bool)

(assert (=> b!132903 (= e!88130 e!88131)))

(declare-fun res!110388 () Bool)

(assert (=> b!132903 (=> (not res!110388) (not e!88131))))

(assert (=> b!132903 (= res!110388 (= (select (arr!3405 arr!237) #b00000000000000000000000000000000) (select (arr!3405 (_2!6075 lt!205002)) #b00000000000000000000000000000000)))))

(declare-fun b!132904 () Bool)

(assert (=> b!132904 (= e!88131 (arrayRangesEq!173 arr!237 (_2!6075 lt!205002) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42183 (not res!110387)) b!132903))

(assert (= (and b!132903 res!110388) b!132904))

(declare-fun m!201017 () Bool)

(assert (=> b!132903 m!201017))

(declare-fun m!201019 () Bool)

(assert (=> b!132903 m!201019))

(declare-fun m!201021 () Bool)

(assert (=> b!132904 m!201021))

(assert (=> b!132781 d!42183))

(assert (=> b!132780 d!42169))

(declare-fun d!42185 () Bool)

(declare-fun e!88132 () Bool)

(assert (=> d!42185 e!88132))

(declare-fun res!110389 () Bool)

(assert (=> d!42185 (=> (not res!110389) (not e!88132))))

(declare-fun lt!205269 () (_ BitVec 64))

(declare-fun lt!205267 () (_ BitVec 64))

(declare-fun lt!205268 () (_ BitVec 64))

(assert (=> d!42185 (= res!110389 (= lt!205269 (bvsub lt!205267 lt!205268)))))

(assert (=> d!42185 (or (= (bvand lt!205267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205268 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205267 lt!205268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42185 (= lt!205268 (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 thiss!1634))) ((_ sign_extend 32) (currentByte!5928 thiss!1634)) ((_ sign_extend 32) (currentBit!5923 thiss!1634))))))

(declare-fun lt!205270 () (_ BitVec 64))

(declare-fun lt!205266 () (_ BitVec 64))

(assert (=> d!42185 (= lt!205267 (bvmul lt!205270 lt!205266))))

(assert (=> d!42185 (or (= lt!205270 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205266 (bvsdiv (bvmul lt!205270 lt!205266) lt!205270)))))

(assert (=> d!42185 (= lt!205266 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42185 (= lt!205270 ((_ sign_extend 32) (size!2770 (buf!3143 thiss!1634))))))

(assert (=> d!42185 (= lt!205269 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5928 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5923 thiss!1634))))))

(assert (=> d!42185 (invariant!0 (currentBit!5923 thiss!1634) (currentByte!5928 thiss!1634) (size!2770 (buf!3143 thiss!1634)))))

(assert (=> d!42185 (= (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)) lt!205269)))

(declare-fun b!132905 () Bool)

(declare-fun res!110390 () Bool)

(assert (=> b!132905 (=> (not res!110390) (not e!88132))))

(assert (=> b!132905 (= res!110390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205269))))

(declare-fun b!132906 () Bool)

(declare-fun lt!205271 () (_ BitVec 64))

(assert (=> b!132906 (= e!88132 (bvsle lt!205269 (bvmul lt!205271 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132906 (or (= lt!205271 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205271 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205271)))))

(assert (=> b!132906 (= lt!205271 ((_ sign_extend 32) (size!2770 (buf!3143 thiss!1634))))))

(assert (= (and d!42185 res!110389) b!132905))

(assert (= (and b!132905 res!110390) b!132906))

(declare-fun m!201023 () Bool)

(assert (=> d!42185 m!201023))

(assert (=> d!42185 m!200715))

(assert (=> b!132780 d!42185))

(declare-fun d!42187 () Bool)

(assert (=> d!42187 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 thiss!1634))) ((_ sign_extend 32) (currentByte!5928 thiss!1634)) ((_ sign_extend 32) (currentBit!5923 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 thiss!1634))) ((_ sign_extend 32) (currentByte!5928 thiss!1634)) ((_ sign_extend 32) (currentBit!5923 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10311 () Bool)

(assert (= bs!10311 d!42187))

(assert (=> bs!10311 m!201023))

(assert (=> b!132769 d!42187))

(declare-fun d!42189 () Bool)

(assert (=> d!42189 (= (array_inv!2559 (buf!3143 thiss!1634)) (bvsge (size!2770 (buf!3143 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!132779 d!42189))

(declare-fun d!42191 () Bool)

(declare-fun res!110392 () Bool)

(declare-fun e!88134 () Bool)

(assert (=> d!42191 (=> (not res!110392) (not e!88134))))

(assert (=> d!42191 (= res!110392 (= (size!2770 (buf!3143 (_2!6074 lt!205021))) (size!2770 (buf!3143 (_2!6074 lt!205015)))))))

(assert (=> d!42191 (= (isPrefixOf!0 (_2!6074 lt!205021) (_2!6074 lt!205015)) e!88134)))

(declare-fun b!132907 () Bool)

(declare-fun res!110393 () Bool)

(assert (=> b!132907 (=> (not res!110393) (not e!88134))))

(assert (=> b!132907 (= res!110393 (bvsle (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021))) (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205015))) (currentByte!5928 (_2!6074 lt!205015)) (currentBit!5923 (_2!6074 lt!205015)))))))

(declare-fun b!132908 () Bool)

(declare-fun e!88133 () Bool)

(assert (=> b!132908 (= e!88134 e!88133)))

(declare-fun res!110391 () Bool)

(assert (=> b!132908 (=> res!110391 e!88133)))

(assert (=> b!132908 (= res!110391 (= (size!2770 (buf!3143 (_2!6074 lt!205021))) #b00000000000000000000000000000000))))

(declare-fun b!132909 () Bool)

(assert (=> b!132909 (= e!88133 (arrayBitRangesEq!0 (buf!3143 (_2!6074 lt!205021)) (buf!3143 (_2!6074 lt!205015)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021)))))))

(assert (= (and d!42191 res!110392) b!132907))

(assert (= (and b!132907 res!110393) b!132908))

(assert (= (and b!132908 (not res!110391)) b!132909))

(assert (=> b!132907 m!200727))

(assert (=> b!132907 m!200725))

(assert (=> b!132909 m!200727))

(assert (=> b!132909 m!200727))

(declare-fun m!201025 () Bool)

(assert (=> b!132909 m!201025))

(assert (=> b!132778 d!42191))

(declare-fun d!42193 () Bool)

(assert (=> d!42193 (= (invariant!0 (currentBit!5923 thiss!1634) (currentByte!5928 thiss!1634) (size!2770 (buf!3143 thiss!1634))) (and (bvsge (currentBit!5923 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5923 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5928 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5928 thiss!1634) (size!2770 (buf!3143 thiss!1634))) (and (= (currentBit!5923 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5928 thiss!1634) (size!2770 (buf!3143 thiss!1634)))))))))

(assert (=> b!132777 d!42193))

(declare-fun d!42195 () Bool)

(assert (=> d!42195 (= (array_inv!2559 arr!237) (bvsge (size!2770 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25948 d!42195))

(declare-fun d!42197 () Bool)

(assert (=> d!42197 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5923 thiss!1634) (currentByte!5928 thiss!1634) (size!2770 (buf!3143 thiss!1634))))))

(declare-fun bs!10312 () Bool)

(assert (= bs!10312 d!42197))

(assert (=> bs!10312 m!200715))

(assert (=> start!25948 d!42197))

(declare-fun d!42199 () Bool)

(assert (=> d!42199 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 thiss!1634)) ((_ sign_extend 32) (currentBit!5923 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 thiss!1634)) ((_ sign_extend 32) (currentBit!5923 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10313 () Bool)

(assert (= bs!10313 d!42199))

(declare-fun m!201027 () Bool)

(assert (=> bs!10313 m!201027))

(assert (=> b!132775 d!42199))

(declare-fun d!42201 () Bool)

(declare-fun lt!205272 () tuple3!502)

(assert (=> d!42201 (= lt!205272 (readByteArrayLoop!0 (_1!6076 lt!205006) arr!237 from!447 to!404))))

(assert (=> d!42201 (= (readByteArrayLoopPure!0 (_1!6076 lt!205006) arr!237 from!447 to!404) (tuple2!11539 (_2!6086 lt!205272) (_3!306 lt!205272)))))

(declare-fun bs!10314 () Bool)

(assert (= bs!10314 d!42201))

(declare-fun m!201029 () Bool)

(assert (=> bs!10314 m!201029))

(assert (=> b!132775 d!42201))

(declare-fun d!42203 () Bool)

(declare-datatypes ((tuple2!11560 0))(
  ( (tuple2!11561 (_1!6087 (_ BitVec 8)) (_2!6087 BitStream!4804)) )
))
(declare-fun lt!205275 () tuple2!11560)

(declare-fun readByte!0 (BitStream!4804) tuple2!11560)

(assert (=> d!42203 (= lt!205275 (readByte!0 lt!205023))))

(assert (=> d!42203 (= (readBytePure!0 lt!205023) (tuple2!11543 (_2!6087 lt!205275) (_1!6087 lt!205275)))))

(declare-fun bs!10315 () Bool)

(assert (= bs!10315 d!42203))

(declare-fun m!201031 () Bool)

(assert (=> bs!10315 m!201031))

(assert (=> b!132775 d!42203))

(declare-fun d!42205 () Bool)

(assert (=> d!42205 (isPrefixOf!0 thiss!1634 (_2!6074 lt!205015))))

(declare-fun lt!205278 () Unit!8172)

(declare-fun choose!30 (BitStream!4804 BitStream!4804 BitStream!4804) Unit!8172)

(assert (=> d!42205 (= lt!205278 (choose!30 thiss!1634 (_2!6074 lt!205021) (_2!6074 lt!205015)))))

(assert (=> d!42205 (isPrefixOf!0 thiss!1634 (_2!6074 lt!205021))))

(assert (=> d!42205 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6074 lt!205021) (_2!6074 lt!205015)) lt!205278)))

(declare-fun bs!10316 () Bool)

(assert (= bs!10316 d!42205))

(assert (=> bs!10316 m!200739))

(declare-fun m!201033 () Bool)

(assert (=> bs!10316 m!201033))

(assert (=> bs!10316 m!200719))

(assert (=> b!132775 d!42205))

(declare-fun d!42207 () Bool)

(declare-fun lt!205279 () tuple2!11560)

(assert (=> d!42207 (= lt!205279 (readByte!0 (BitStream!4805 (buf!3143 (_2!6074 lt!205015)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634))))))

(assert (=> d!42207 (= (readBytePure!0 (BitStream!4805 (buf!3143 (_2!6074 lt!205015)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634))) (tuple2!11543 (_2!6087 lt!205279) (_1!6087 lt!205279)))))

(declare-fun bs!10317 () Bool)

(assert (= bs!10317 d!42207))

(declare-fun m!201035 () Bool)

(assert (=> bs!10317 m!201035))

(assert (=> b!132775 d!42207))

(assert (=> b!132775 d!42179))

(declare-fun b!132922 () Bool)

(declare-fun res!110408 () Bool)

(declare-fun e!88145 () Bool)

(assert (=> b!132922 (=> (not res!110408) (not e!88145))))

(declare-fun lt!205306 () tuple2!11536)

(assert (=> b!132922 (= res!110408 (isPrefixOf!0 (_2!6074 lt!205021) (_2!6074 lt!205306)))))

(declare-fun b!132924 () Bool)

(declare-fun e!88143 () Bool)

(assert (=> b!132924 (= e!88145 e!88143)))

(declare-fun res!110407 () Bool)

(assert (=> b!132924 (=> (not res!110407) (not e!88143))))

(declare-fun lt!205312 () tuple2!11538)

(declare-fun lt!205310 () tuple2!11540)

(assert (=> b!132924 (= res!110407 (and (= (size!2770 (_2!6075 lt!205312)) (size!2770 arr!237)) (= (_1!6075 lt!205312) (_2!6076 lt!205310))))))

(assert (=> b!132924 (= lt!205312 (readByteArrayLoopPure!0 (_1!6076 lt!205310) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205304 () Unit!8172)

(declare-fun lt!205308 () Unit!8172)

(assert (=> b!132924 (= lt!205304 lt!205308)))

(declare-fun lt!205311 () (_ BitVec 64))

(assert (=> b!132924 (validate_offset_bits!1 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205306)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205311)))

(assert (=> b!132924 (= lt!205308 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6074 lt!205021) (buf!3143 (_2!6074 lt!205306)) lt!205311))))

(declare-fun e!88144 () Bool)

(assert (=> b!132924 e!88144))

(declare-fun res!110406 () Bool)

(assert (=> b!132924 (=> (not res!110406) (not e!88144))))

(assert (=> b!132924 (= res!110406 (and (= (size!2770 (buf!3143 (_2!6074 lt!205021))) (size!2770 (buf!3143 (_2!6074 lt!205306)))) (bvsge lt!205311 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132924 (= lt!205311 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!132924 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!132924 (= lt!205310 (reader!0 (_2!6074 lt!205021) (_2!6074 lt!205306)))))

(declare-fun b!132925 () Bool)

(assert (=> b!132925 (= e!88144 (validate_offset_bits!1 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205021)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205311))))

(declare-fun b!132926 () Bool)

(declare-fun res!110409 () Bool)

(assert (=> b!132926 (=> (not res!110409) (not e!88145))))

(declare-fun lt!205309 () (_ BitVec 64))

(declare-fun lt!205307 () (_ BitVec 64))

(assert (=> b!132926 (= res!110409 (= (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205306))) (currentByte!5928 (_2!6074 lt!205306)) (currentBit!5923 (_2!6074 lt!205306))) (bvadd lt!205309 lt!205307)))))

(assert (=> b!132926 (or (not (= (bvand lt!205309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205307 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!205309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!205309 lt!205307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!205305 () (_ BitVec 64))

(assert (=> b!132926 (= lt!205307 (bvmul lt!205305 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!132926 (or (= lt!205305 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205305 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205305)))))

(assert (=> b!132926 (= lt!205305 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!132926 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!132926 (= lt!205309 (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021))))))

(declare-fun b!132923 () Bool)

(assert (=> b!132923 (= e!88143 (arrayRangesEq!173 arr!237 (_2!6075 lt!205312) #b00000000000000000000000000000000 to!404))))

(declare-fun d!42209 () Bool)

(assert (=> d!42209 e!88145))

(declare-fun res!110410 () Bool)

(assert (=> d!42209 (=> (not res!110410) (not e!88145))))

(assert (=> d!42209 (= res!110410 (= (size!2770 (buf!3143 (_2!6074 lt!205021))) (size!2770 (buf!3143 (_2!6074 lt!205306)))))))

(declare-fun choose!64 (BitStream!4804 array!6118 (_ BitVec 32) (_ BitVec 32)) tuple2!11536)

(assert (=> d!42209 (= lt!205306 (choose!64 (_2!6074 lt!205021) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42209 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2770 arr!237)))))

(assert (=> d!42209 (= (appendByteArrayLoop!0 (_2!6074 lt!205021) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!205306)))

(assert (= (and d!42209 res!110410) b!132926))

(assert (= (and b!132926 res!110409) b!132922))

(assert (= (and b!132922 res!110408) b!132924))

(assert (= (and b!132924 res!110406) b!132925))

(assert (= (and b!132924 res!110407) b!132923))

(declare-fun m!201043 () Bool)

(assert (=> b!132923 m!201043))

(declare-fun m!201045 () Bool)

(assert (=> b!132924 m!201045))

(declare-fun m!201047 () Bool)

(assert (=> b!132924 m!201047))

(declare-fun m!201049 () Bool)

(assert (=> b!132924 m!201049))

(declare-fun m!201051 () Bool)

(assert (=> b!132924 m!201051))

(declare-fun m!201053 () Bool)

(assert (=> b!132926 m!201053))

(assert (=> b!132926 m!200727))

(declare-fun m!201055 () Bool)

(assert (=> d!42209 m!201055))

(declare-fun m!201057 () Bool)

(assert (=> b!132925 m!201057))

(declare-fun m!201059 () Bool)

(assert (=> b!132922 m!201059))

(assert (=> b!132775 d!42209))

(declare-fun d!42220 () Bool)

(declare-fun e!88149 () Bool)

(assert (=> d!42220 e!88149))

(declare-fun res!110414 () Bool)

(assert (=> d!42220 (=> (not res!110414) (not e!88149))))

(assert (=> d!42220 (= res!110414 (and (or (let ((rhs!3100 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3100 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3100) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!42221 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!42221 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!42221 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3099 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3099 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3099) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205326 () Unit!8172)

(declare-fun choose!57 (BitStream!4804 BitStream!4804 (_ BitVec 64) (_ BitVec 32)) Unit!8172)

(assert (=> d!42220 (= lt!205326 (choose!57 thiss!1634 (_2!6074 lt!205021) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!42220 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6074 lt!205021) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!205326)))

(declare-fun b!132930 () Bool)

(declare-fun lt!205325 () (_ BitVec 32))

(assert (=> b!132930 (= e!88149 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205021)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) (bvsub (bvsub to!404 from!447) lt!205325)))))

(assert (=> b!132930 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!205325 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!205325) #b10000000000000000000000000000000)))))

(declare-fun lt!205327 () (_ BitVec 64))

(assert (=> b!132930 (= lt!205325 ((_ extract 31 0) lt!205327))))

(assert (=> b!132930 (and (bvslt lt!205327 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!205327 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!132930 (= lt!205327 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!42220 res!110414) b!132930))

(declare-fun m!201063 () Bool)

(assert (=> d!42220 m!201063))

(declare-fun m!201065 () Bool)

(assert (=> b!132930 m!201065))

(assert (=> b!132775 d!42220))

(declare-fun d!42225 () Bool)

(declare-fun res!110415 () Bool)

(declare-fun e!88150 () Bool)

(assert (=> d!42225 (=> res!110415 e!88150)))

(assert (=> d!42225 (= res!110415 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42225 (= (arrayRangesEq!173 (_2!6075 lt!205011) (_2!6075 lt!205004) #b00000000000000000000000000000000 to!404) e!88150)))

(declare-fun b!132931 () Bool)

(declare-fun e!88151 () Bool)

(assert (=> b!132931 (= e!88150 e!88151)))

(declare-fun res!110416 () Bool)

(assert (=> b!132931 (=> (not res!110416) (not e!88151))))

(assert (=> b!132931 (= res!110416 (= (select (arr!3405 (_2!6075 lt!205011)) #b00000000000000000000000000000000) (select (arr!3405 (_2!6075 lt!205004)) #b00000000000000000000000000000000)))))

(declare-fun b!132932 () Bool)

(assert (=> b!132932 (= e!88151 (arrayRangesEq!173 (_2!6075 lt!205011) (_2!6075 lt!205004) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42225 (not res!110415)) b!132931))

(assert (= (and b!132931 res!110416) b!132932))

(declare-fun m!201067 () Bool)

(assert (=> b!132931 m!201067))

(declare-fun m!201069 () Bool)

(assert (=> b!132931 m!201069))

(declare-fun m!201071 () Bool)

(assert (=> b!132932 m!201071))

(assert (=> b!132775 d!42225))

(declare-fun d!42227 () Bool)

(declare-fun res!110418 () Bool)

(declare-fun e!88153 () Bool)

(assert (=> d!42227 (=> (not res!110418) (not e!88153))))

(assert (=> d!42227 (= res!110418 (= (size!2770 (buf!3143 thiss!1634)) (size!2770 (buf!3143 (_2!6074 lt!205015)))))))

(assert (=> d!42227 (= (isPrefixOf!0 thiss!1634 (_2!6074 lt!205015)) e!88153)))

(declare-fun b!132933 () Bool)

(declare-fun res!110419 () Bool)

(assert (=> b!132933 (=> (not res!110419) (not e!88153))))

(assert (=> b!132933 (= res!110419 (bvsle (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)) (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205015))) (currentByte!5928 (_2!6074 lt!205015)) (currentBit!5923 (_2!6074 lt!205015)))))))

(declare-fun b!132934 () Bool)

(declare-fun e!88152 () Bool)

(assert (=> b!132934 (= e!88153 e!88152)))

(declare-fun res!110417 () Bool)

(assert (=> b!132934 (=> res!110417 e!88152)))

(assert (=> b!132934 (= res!110417 (= (size!2770 (buf!3143 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!132935 () Bool)

(assert (=> b!132935 (= e!88152 (arrayBitRangesEq!0 (buf!3143 thiss!1634) (buf!3143 (_2!6074 lt!205015)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634))))))

(assert (= (and d!42227 res!110418) b!132933))

(assert (= (and b!132933 res!110419) b!132934))

(assert (= (and b!132934 (not res!110417)) b!132935))

(assert (=> b!132933 m!200789))

(assert (=> b!132933 m!200725))

(assert (=> b!132935 m!200789))

(assert (=> b!132935 m!200789))

(declare-fun m!201073 () Bool)

(assert (=> b!132935 m!201073))

(assert (=> b!132775 d!42227))

(declare-fun d!42229 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4804 (_ BitVec 32)) tuple2!11536)

(assert (=> d!42229 (= (withMovedByteIndex!0 (_1!6076 lt!205006) #b00000000000000000000000000000001) (_2!6074 (moveByteIndex!0 (_1!6076 lt!205006) #b00000000000000000000000000000001)))))

(declare-fun bs!10320 () Bool)

(assert (= bs!10320 d!42229))

(declare-fun m!201075 () Bool)

(assert (=> bs!10320 m!201075))

(assert (=> b!132775 d!42229))

(declare-fun d!42231 () Bool)

(assert (=> d!42231 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205001)))

(declare-fun lt!205330 () Unit!8172)

(declare-fun choose!26 (BitStream!4804 array!6118 (_ BitVec 32) BitStream!4804) Unit!8172)

(assert (=> d!42231 (= lt!205330 (choose!26 (_2!6074 lt!205021) (buf!3143 (_2!6074 lt!205015)) lt!205001 (BitStream!4805 (buf!3143 (_2!6074 lt!205015)) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021)))))))

(assert (=> d!42231 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6074 lt!205021) (buf!3143 (_2!6074 lt!205015)) lt!205001) lt!205330)))

(declare-fun bs!10321 () Bool)

(assert (= bs!10321 d!42231))

(assert (=> bs!10321 m!200761))

(declare-fun m!201077 () Bool)

(assert (=> bs!10321 m!201077))

(assert (=> b!132775 d!42231))

(declare-fun d!42233 () Bool)

(declare-fun e!88162 () Bool)

(assert (=> d!42233 e!88162))

(declare-fun res!110436 () Bool)

(assert (=> d!42233 (=> (not res!110436) (not e!88162))))

(declare-fun lt!205402 () tuple2!11536)

(assert (=> d!42233 (= res!110436 (= (size!2770 (buf!3143 thiss!1634)) (size!2770 (buf!3143 (_2!6074 lt!205402)))))))

(declare-fun choose!6 (BitStream!4804 (_ BitVec 8)) tuple2!11536)

(assert (=> d!42233 (= lt!205402 (choose!6 thiss!1634 (select (arr!3405 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!42233 (validate_offset_byte!0 ((_ sign_extend 32) (size!2770 (buf!3143 thiss!1634))) ((_ sign_extend 32) (currentByte!5928 thiss!1634)) ((_ sign_extend 32) (currentBit!5923 thiss!1634)))))

(assert (=> d!42233 (= (appendByte!0 thiss!1634 (select (arr!3405 arr!237) from!447)) lt!205402)))

(declare-fun b!132957 () Bool)

(declare-fun res!110435 () Bool)

(assert (=> b!132957 (=> (not res!110435) (not e!88162))))

(declare-fun lt!205403 () (_ BitVec 64))

(declare-fun lt!205401 () (_ BitVec 64))

(assert (=> b!132957 (= res!110435 (= (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205402))) (currentByte!5928 (_2!6074 lt!205402)) (currentBit!5923 (_2!6074 lt!205402))) (bvadd lt!205401 lt!205403)))))

(assert (=> b!132957 (or (not (= (bvand lt!205401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205403 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!205401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!205401 lt!205403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132957 (= lt!205403 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!132957 (= lt!205401 (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)))))

(declare-fun b!132958 () Bool)

(declare-fun res!110437 () Bool)

(assert (=> b!132958 (=> (not res!110437) (not e!88162))))

(assert (=> b!132958 (= res!110437 (isPrefixOf!0 thiss!1634 (_2!6074 lt!205402)))))

(declare-fun b!132959 () Bool)

(declare-fun lt!205404 () tuple2!11540)

(declare-fun lt!205405 () tuple2!11542)

(assert (=> b!132959 (= e!88162 (and (= (_2!6077 lt!205405) (select (arr!3405 arr!237) from!447)) (= (_1!6077 lt!205405) (_2!6076 lt!205404))))))

(assert (=> b!132959 (= lt!205405 (readBytePure!0 (_1!6076 lt!205404)))))

(assert (=> b!132959 (= lt!205404 (reader!0 thiss!1634 (_2!6074 lt!205402)))))

(assert (= (and d!42233 res!110436) b!132957))

(assert (= (and b!132957 res!110435) b!132958))

(assert (= (and b!132958 res!110437) b!132959))

(assert (=> d!42233 m!200753))

(declare-fun m!201079 () Bool)

(assert (=> d!42233 m!201079))

(declare-fun m!201081 () Bool)

(assert (=> d!42233 m!201081))

(declare-fun m!201083 () Bool)

(assert (=> b!132957 m!201083))

(assert (=> b!132957 m!200789))

(declare-fun m!201087 () Bool)

(assert (=> b!132958 m!201087))

(declare-fun m!201089 () Bool)

(assert (=> b!132959 m!201089))

(declare-fun m!201093 () Bool)

(assert (=> b!132959 m!201093))

(assert (=> b!132775 d!42233))

(declare-fun d!42235 () Bool)

(declare-fun e!88163 () Bool)

(assert (=> d!42235 e!88163))

(declare-fun res!110438 () Bool)

(assert (=> d!42235 (=> (not res!110438) (not e!88163))))

(declare-fun lt!205407 () (_ BitVec 64))

(declare-fun lt!205409 () (_ BitVec 64))

(declare-fun lt!205408 () (_ BitVec 64))

(assert (=> d!42235 (= res!110438 (= lt!205409 (bvsub lt!205407 lt!205408)))))

(assert (=> d!42235 (or (= (bvand lt!205407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205407 lt!205408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42235 (= lt!205408 (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_1!6077 lt!205012)))) ((_ sign_extend 32) (currentByte!5928 (_1!6077 lt!205012))) ((_ sign_extend 32) (currentBit!5923 (_1!6077 lt!205012)))))))

(declare-fun lt!205410 () (_ BitVec 64))

(declare-fun lt!205406 () (_ BitVec 64))

(assert (=> d!42235 (= lt!205407 (bvmul lt!205410 lt!205406))))

(assert (=> d!42235 (or (= lt!205410 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205406 (bvsdiv (bvmul lt!205410 lt!205406) lt!205410)))))

(assert (=> d!42235 (= lt!205406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42235 (= lt!205410 ((_ sign_extend 32) (size!2770 (buf!3143 (_1!6077 lt!205012)))))))

(assert (=> d!42235 (= lt!205409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5928 (_1!6077 lt!205012))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5923 (_1!6077 lt!205012)))))))

(assert (=> d!42235 (invariant!0 (currentBit!5923 (_1!6077 lt!205012)) (currentByte!5928 (_1!6077 lt!205012)) (size!2770 (buf!3143 (_1!6077 lt!205012))))))

(assert (=> d!42235 (= (bitIndex!0 (size!2770 (buf!3143 (_1!6077 lt!205012))) (currentByte!5928 (_1!6077 lt!205012)) (currentBit!5923 (_1!6077 lt!205012))) lt!205409)))

(declare-fun b!132960 () Bool)

(declare-fun res!110439 () Bool)

(assert (=> b!132960 (=> (not res!110439) (not e!88163))))

(assert (=> b!132960 (= res!110439 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205409))))

(declare-fun b!132961 () Bool)

(declare-fun lt!205411 () (_ BitVec 64))

(assert (=> b!132961 (= e!88163 (bvsle lt!205409 (bvmul lt!205411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132961 (or (= lt!205411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205411)))))

(assert (=> b!132961 (= lt!205411 ((_ sign_extend 32) (size!2770 (buf!3143 (_1!6077 lt!205012)))))))

(assert (= (and d!42235 res!110438) b!132960))

(assert (= (and b!132960 res!110439) b!132961))

(declare-fun m!201121 () Bool)

(assert (=> d!42235 m!201121))

(declare-fun m!201123 () Bool)

(assert (=> d!42235 m!201123))

(assert (=> b!132775 d!42235))

(declare-fun d!42239 () Bool)

(declare-fun lt!205412 () tuple2!11560)

(assert (=> d!42239 (= lt!205412 (readByte!0 (_1!6076 lt!205006)))))

(assert (=> d!42239 (= (readBytePure!0 (_1!6076 lt!205006)) (tuple2!11543 (_2!6087 lt!205412) (_1!6087 lt!205412)))))

(declare-fun bs!10322 () Bool)

(assert (= bs!10322 d!42239))

(declare-fun m!201125 () Bool)

(assert (=> bs!10322 m!201125))

(assert (=> b!132775 d!42239))

(declare-fun d!42241 () Bool)

(declare-fun lt!205413 () tuple3!502)

(assert (=> d!42241 (= lt!205413 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6076 lt!205006) #b00000000000000000000000000000001) lt!205013 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42241 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6076 lt!205006) #b00000000000000000000000000000001) lt!205013 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11539 (_2!6086 lt!205413) (_3!306 lt!205413)))))

(declare-fun bs!10323 () Bool)

(assert (= bs!10323 d!42241))

(assert (=> bs!10323 m!200729))

(declare-fun m!201127 () Bool)

(assert (=> bs!10323 m!201127))

(assert (=> b!132775 d!42241))

(declare-fun d!42243 () Bool)

(assert (=> d!42243 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205001) (bvsle ((_ sign_extend 32) lt!205001) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10324 () Bool)

(assert (= bs!10324 d!42243))

(assert (=> bs!10324 m!200981))

(assert (=> b!132775 d!42243))

(declare-fun d!42245 () Bool)

(declare-fun e!88164 () Bool)

(assert (=> d!42245 e!88164))

(declare-fun res!110442 () Bool)

(assert (=> d!42245 (=> (not res!110442) (not e!88164))))

(declare-fun lt!205419 () tuple2!11540)

(assert (=> d!42245 (= res!110442 (isPrefixOf!0 (_1!6076 lt!205419) (_2!6076 lt!205419)))))

(declare-fun lt!205421 () BitStream!4804)

(assert (=> d!42245 (= lt!205419 (tuple2!11541 lt!205421 (_2!6074 lt!205015)))))

(declare-fun lt!205430 () Unit!8172)

(declare-fun lt!205422 () Unit!8172)

(assert (=> d!42245 (= lt!205430 lt!205422)))

(assert (=> d!42245 (isPrefixOf!0 lt!205421 (_2!6074 lt!205015))))

(assert (=> d!42245 (= lt!205422 (lemmaIsPrefixTransitive!0 lt!205421 (_2!6074 lt!205015) (_2!6074 lt!205015)))))

(declare-fun lt!205418 () Unit!8172)

(declare-fun lt!205414 () Unit!8172)

(assert (=> d!42245 (= lt!205418 lt!205414)))

(assert (=> d!42245 (isPrefixOf!0 lt!205421 (_2!6074 lt!205015))))

(assert (=> d!42245 (= lt!205414 (lemmaIsPrefixTransitive!0 lt!205421 thiss!1634 (_2!6074 lt!205015)))))

(declare-fun lt!205432 () Unit!8172)

(declare-fun e!88165 () Unit!8172)

(assert (=> d!42245 (= lt!205432 e!88165)))

(declare-fun c!7591 () Bool)

(assert (=> d!42245 (= c!7591 (not (= (size!2770 (buf!3143 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!205429 () Unit!8172)

(declare-fun lt!205417 () Unit!8172)

(assert (=> d!42245 (= lt!205429 lt!205417)))

(assert (=> d!42245 (isPrefixOf!0 (_2!6074 lt!205015) (_2!6074 lt!205015))))

(assert (=> d!42245 (= lt!205417 (lemmaIsPrefixRefl!0 (_2!6074 lt!205015)))))

(declare-fun lt!205425 () Unit!8172)

(declare-fun lt!205428 () Unit!8172)

(assert (=> d!42245 (= lt!205425 lt!205428)))

(assert (=> d!42245 (= lt!205428 (lemmaIsPrefixRefl!0 (_2!6074 lt!205015)))))

(declare-fun lt!205415 () Unit!8172)

(declare-fun lt!205427 () Unit!8172)

(assert (=> d!42245 (= lt!205415 lt!205427)))

(assert (=> d!42245 (isPrefixOf!0 lt!205421 lt!205421)))

(assert (=> d!42245 (= lt!205427 (lemmaIsPrefixRefl!0 lt!205421))))

(declare-fun lt!205423 () Unit!8172)

(declare-fun lt!205424 () Unit!8172)

(assert (=> d!42245 (= lt!205423 lt!205424)))

(assert (=> d!42245 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42245 (= lt!205424 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42245 (= lt!205421 (BitStream!4805 (buf!3143 (_2!6074 lt!205015)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)))))

(assert (=> d!42245 (isPrefixOf!0 thiss!1634 (_2!6074 lt!205015))))

(assert (=> d!42245 (= (reader!0 thiss!1634 (_2!6074 lt!205015)) lt!205419)))

(declare-fun lt!205431 () (_ BitVec 64))

(declare-fun b!132962 () Bool)

(declare-fun lt!205426 () (_ BitVec 64))

(assert (=> b!132962 (= e!88164 (= (_1!6076 lt!205419) (withMovedBitIndex!0 (_2!6076 lt!205419) (bvsub lt!205426 lt!205431))))))

(assert (=> b!132962 (or (= (bvand lt!205426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205431 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205426 lt!205431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132962 (= lt!205431 (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205015))) (currentByte!5928 (_2!6074 lt!205015)) (currentBit!5923 (_2!6074 lt!205015))))))

(assert (=> b!132962 (= lt!205426 (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)))))

(declare-fun b!132963 () Bool)

(declare-fun Unit!8179 () Unit!8172)

(assert (=> b!132963 (= e!88165 Unit!8179)))

(declare-fun b!132964 () Bool)

(declare-fun lt!205433 () Unit!8172)

(assert (=> b!132964 (= e!88165 lt!205433)))

(declare-fun lt!205420 () (_ BitVec 64))

(assert (=> b!132964 (= lt!205420 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205416 () (_ BitVec 64))

(assert (=> b!132964 (= lt!205416 (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)))))

(assert (=> b!132964 (= lt!205433 (arrayBitRangesEqSymmetric!0 (buf!3143 thiss!1634) (buf!3143 (_2!6074 lt!205015)) lt!205420 lt!205416))))

(assert (=> b!132964 (arrayBitRangesEq!0 (buf!3143 (_2!6074 lt!205015)) (buf!3143 thiss!1634) lt!205420 lt!205416)))

(declare-fun b!132965 () Bool)

(declare-fun res!110441 () Bool)

(assert (=> b!132965 (=> (not res!110441) (not e!88164))))

(assert (=> b!132965 (= res!110441 (isPrefixOf!0 (_1!6076 lt!205419) thiss!1634))))

(declare-fun b!132966 () Bool)

(declare-fun res!110440 () Bool)

(assert (=> b!132966 (=> (not res!110440) (not e!88164))))

(assert (=> b!132966 (= res!110440 (isPrefixOf!0 (_2!6076 lt!205419) (_2!6074 lt!205015)))))

(assert (= (and d!42245 c!7591) b!132964))

(assert (= (and d!42245 (not c!7591)) b!132963))

(assert (= (and d!42245 res!110442) b!132965))

(assert (= (and b!132965 res!110441) b!132966))

(assert (= (and b!132966 res!110440) b!132962))

(assert (=> b!132964 m!200789))

(declare-fun m!201129 () Bool)

(assert (=> b!132964 m!201129))

(declare-fun m!201131 () Bool)

(assert (=> b!132964 m!201131))

(declare-fun m!201133 () Bool)

(assert (=> b!132965 m!201133))

(declare-fun m!201135 () Bool)

(assert (=> d!42245 m!201135))

(declare-fun m!201137 () Bool)

(assert (=> d!42245 m!201137))

(declare-fun m!201139 () Bool)

(assert (=> d!42245 m!201139))

(declare-fun m!201141 () Bool)

(assert (=> d!42245 m!201141))

(declare-fun m!201143 () Bool)

(assert (=> d!42245 m!201143))

(assert (=> d!42245 m!200739))

(declare-fun m!201145 () Bool)

(assert (=> d!42245 m!201145))

(assert (=> d!42245 m!201003))

(declare-fun m!201149 () Bool)

(assert (=> d!42245 m!201149))

(assert (=> d!42245 m!201007))

(declare-fun m!201151 () Bool)

(assert (=> d!42245 m!201151))

(declare-fun m!201153 () Bool)

(assert (=> b!132962 m!201153))

(assert (=> b!132962 m!200725))

(assert (=> b!132962 m!200789))

(declare-fun m!201155 () Bool)

(assert (=> b!132966 m!201155))

(assert (=> b!132775 d!42245))

(declare-fun d!42249 () Bool)

(declare-fun e!88166 () Bool)

(assert (=> d!42249 e!88166))

(declare-fun res!110443 () Bool)

(assert (=> d!42249 (=> (not res!110443) (not e!88166))))

(declare-fun lt!205440 () (_ BitVec 64))

(declare-fun lt!205438 () (_ BitVec 64))

(declare-fun lt!205439 () (_ BitVec 64))

(assert (=> d!42249 (= res!110443 (= lt!205440 (bvsub lt!205438 lt!205439)))))

(assert (=> d!42249 (or (= (bvand lt!205438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205439 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205438 lt!205439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42249 (= lt!205439 (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_1!6077 lt!205017)))) ((_ sign_extend 32) (currentByte!5928 (_1!6077 lt!205017))) ((_ sign_extend 32) (currentBit!5923 (_1!6077 lt!205017)))))))

(declare-fun lt!205441 () (_ BitVec 64))

(declare-fun lt!205437 () (_ BitVec 64))

(assert (=> d!42249 (= lt!205438 (bvmul lt!205441 lt!205437))))

(assert (=> d!42249 (or (= lt!205441 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205437 (bvsdiv (bvmul lt!205441 lt!205437) lt!205441)))))

(assert (=> d!42249 (= lt!205437 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42249 (= lt!205441 ((_ sign_extend 32) (size!2770 (buf!3143 (_1!6077 lt!205017)))))))

(assert (=> d!42249 (= lt!205440 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5928 (_1!6077 lt!205017))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5923 (_1!6077 lt!205017)))))))

(assert (=> d!42249 (invariant!0 (currentBit!5923 (_1!6077 lt!205017)) (currentByte!5928 (_1!6077 lt!205017)) (size!2770 (buf!3143 (_1!6077 lt!205017))))))

(assert (=> d!42249 (= (bitIndex!0 (size!2770 (buf!3143 (_1!6077 lt!205017))) (currentByte!5928 (_1!6077 lt!205017)) (currentBit!5923 (_1!6077 lt!205017))) lt!205440)))

(declare-fun b!132967 () Bool)

(declare-fun res!110444 () Bool)

(assert (=> b!132967 (=> (not res!110444) (not e!88166))))

(assert (=> b!132967 (= res!110444 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205440))))

(declare-fun b!132968 () Bool)

(declare-fun lt!205442 () (_ BitVec 64))

(assert (=> b!132968 (= e!88166 (bvsle lt!205440 (bvmul lt!205442 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132968 (or (= lt!205442 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205442 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205442)))))

(assert (=> b!132968 (= lt!205442 ((_ sign_extend 32) (size!2770 (buf!3143 (_1!6077 lt!205017)))))))

(assert (= (and d!42249 res!110443) b!132967))

(assert (= (and b!132967 res!110444) b!132968))

(declare-fun m!201157 () Bool)

(assert (=> d!42249 m!201157))

(declare-fun m!201159 () Bool)

(assert (=> d!42249 m!201159))

(assert (=> b!132775 d!42249))

(declare-fun d!42251 () Bool)

(declare-fun e!88169 () Bool)

(assert (=> d!42251 e!88169))

(declare-fun res!110447 () Bool)

(assert (=> d!42251 (=> (not res!110447) (not e!88169))))

(declare-fun lt!205458 () tuple2!11542)

(declare-fun lt!205457 () tuple2!11542)

(assert (=> d!42251 (= res!110447 (= (bitIndex!0 (size!2770 (buf!3143 (_1!6077 lt!205458))) (currentByte!5928 (_1!6077 lt!205458)) (currentBit!5923 (_1!6077 lt!205458))) (bitIndex!0 (size!2770 (buf!3143 (_1!6077 lt!205457))) (currentByte!5928 (_1!6077 lt!205457)) (currentBit!5923 (_1!6077 lt!205457)))))))

(declare-fun lt!205456 () Unit!8172)

(declare-fun lt!205455 () BitStream!4804)

(declare-fun choose!14 (BitStream!4804 BitStream!4804 BitStream!4804 tuple2!11542 tuple2!11542 BitStream!4804 (_ BitVec 8) tuple2!11542 tuple2!11542 BitStream!4804 (_ BitVec 8)) Unit!8172)

(assert (=> d!42251 (= lt!205456 (choose!14 lt!205023 (_2!6074 lt!205015) lt!205455 lt!205458 (tuple2!11543 (_1!6077 lt!205458) (_2!6077 lt!205458)) (_1!6077 lt!205458) (_2!6077 lt!205458) lt!205457 (tuple2!11543 (_1!6077 lt!205457) (_2!6077 lt!205457)) (_1!6077 lt!205457) (_2!6077 lt!205457)))))

(assert (=> d!42251 (= lt!205457 (readBytePure!0 lt!205455))))

(assert (=> d!42251 (= lt!205458 (readBytePure!0 lt!205023))))

(assert (=> d!42251 (= lt!205455 (BitStream!4805 (buf!3143 (_2!6074 lt!205015)) (currentByte!5928 lt!205023) (currentBit!5923 lt!205023)))))

(assert (=> d!42251 (= (readBytePrefixLemma!0 lt!205023 (_2!6074 lt!205015)) lt!205456)))

(declare-fun b!132971 () Bool)

(assert (=> b!132971 (= e!88169 (= (_2!6077 lt!205458) (_2!6077 lt!205457)))))

(assert (= (and d!42251 res!110447) b!132971))

(declare-fun m!201167 () Bool)

(assert (=> d!42251 m!201167))

(declare-fun m!201169 () Bool)

(assert (=> d!42251 m!201169))

(declare-fun m!201171 () Bool)

(assert (=> d!42251 m!201171))

(assert (=> d!42251 m!200779))

(declare-fun m!201173 () Bool)

(assert (=> d!42251 m!201173))

(assert (=> b!132775 d!42251))

(declare-fun d!42259 () Bool)

(assert (=> d!42259 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205021)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021))) lt!205001) (bvsle ((_ sign_extend 32) lt!205001) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205021)))) ((_ sign_extend 32) (currentByte!5928 (_2!6074 lt!205021))) ((_ sign_extend 32) (currentBit!5923 (_2!6074 lt!205021)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10329 () Bool)

(assert (= bs!10329 d!42259))

(assert (=> bs!10329 m!200975))

(assert (=> b!132775 d!42259))

(declare-fun d!42261 () Bool)

(declare-fun lt!205495 () tuple2!11538)

(declare-fun lt!205497 () tuple2!11538)

(assert (=> d!42261 (arrayRangesEq!173 (_2!6075 lt!205495) (_2!6075 lt!205497) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!205498 () Unit!8172)

(declare-fun lt!205496 () BitStream!4804)

(declare-fun choose!35 (BitStream!4804 array!6118 (_ BitVec 32) (_ BitVec 32) tuple2!11538 array!6118 BitStream!4804 tuple2!11538 array!6118) Unit!8172)

(assert (=> d!42261 (= lt!205498 (choose!35 (_1!6076 lt!205006) arr!237 from!447 to!404 lt!205495 (_2!6075 lt!205495) lt!205496 lt!205497 (_2!6075 lt!205497)))))

(assert (=> d!42261 (= lt!205497 (readByteArrayLoopPure!0 lt!205496 (array!6119 (store (arr!3405 arr!237) from!447 (_2!6077 (readBytePure!0 (_1!6076 lt!205006)))) (size!2770 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42261 (= lt!205496 (withMovedByteIndex!0 (_1!6076 lt!205006) #b00000000000000000000000000000001))))

(assert (=> d!42261 (= lt!205495 (readByteArrayLoopPure!0 (_1!6076 lt!205006) arr!237 from!447 to!404))))

(assert (=> d!42261 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6076 lt!205006) arr!237 from!447 to!404) lt!205498)))

(declare-fun bs!10333 () Bool)

(assert (= bs!10333 d!42261))

(assert (=> bs!10333 m!200741))

(assert (=> bs!10333 m!200729))

(assert (=> bs!10333 m!200763))

(declare-fun m!201187 () Bool)

(assert (=> bs!10333 m!201187))

(declare-fun m!201189 () Bool)

(assert (=> bs!10333 m!201189))

(declare-fun m!201191 () Bool)

(assert (=> bs!10333 m!201191))

(declare-fun m!201193 () Bool)

(assert (=> bs!10333 m!201193))

(assert (=> b!132775 d!42261))

(declare-fun d!42271 () Bool)

(declare-fun lt!205499 () tuple3!502)

(assert (=> d!42271 (= lt!205499 (readByteArrayLoop!0 (_1!6076 lt!205025) lt!205013 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42271 (= (readByteArrayLoopPure!0 (_1!6076 lt!205025) lt!205013 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11539 (_2!6086 lt!205499) (_3!306 lt!205499)))))

(declare-fun bs!10334 () Bool)

(assert (= bs!10334 d!42271))

(declare-fun m!201195 () Bool)

(assert (=> bs!10334 m!201195))

(assert (=> b!132775 d!42271))

(declare-fun d!42273 () Bool)

(assert (=> d!42273 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2770 (buf!3143 (_2!6074 lt!205015)))) ((_ sign_extend 32) (currentByte!5928 thiss!1634)) ((_ sign_extend 32) (currentBit!5923 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!205500 () Unit!8172)

(assert (=> d!42273 (= lt!205500 (choose!26 thiss!1634 (buf!3143 (_2!6074 lt!205015)) (bvsub to!404 from!447) (BitStream!4805 (buf!3143 (_2!6074 lt!205015)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634))))))

(assert (=> d!42273 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3143 (_2!6074 lt!205015)) (bvsub to!404 from!447)) lt!205500)))

(declare-fun bs!10335 () Bool)

(assert (= bs!10335 d!42273))

(assert (=> bs!10335 m!200737))

(declare-fun m!201197 () Bool)

(assert (=> bs!10335 m!201197))

(assert (=> b!132775 d!42273))

(declare-fun d!42275 () Bool)

(declare-fun lt!205501 () tuple2!11560)

(assert (=> d!42275 (= lt!205501 (readByte!0 (_1!6076 lt!205009)))))

(assert (=> d!42275 (= (readBytePure!0 (_1!6076 lt!205009)) (tuple2!11543 (_2!6087 lt!205501) (_1!6087 lt!205501)))))

(declare-fun bs!10336 () Bool)

(assert (= bs!10336 d!42275))

(declare-fun m!201199 () Bool)

(assert (=> bs!10336 m!201199))

(assert (=> b!132774 d!42275))

(declare-fun d!42277 () Bool)

(declare-fun e!88174 () Bool)

(assert (=> d!42277 e!88174))

(declare-fun res!110458 () Bool)

(assert (=> d!42277 (=> (not res!110458) (not e!88174))))

(declare-fun lt!205507 () tuple2!11540)

(assert (=> d!42277 (= res!110458 (isPrefixOf!0 (_1!6076 lt!205507) (_2!6076 lt!205507)))))

(declare-fun lt!205509 () BitStream!4804)

(assert (=> d!42277 (= lt!205507 (tuple2!11541 lt!205509 (_2!6074 lt!205021)))))

(declare-fun lt!205518 () Unit!8172)

(declare-fun lt!205510 () Unit!8172)

(assert (=> d!42277 (= lt!205518 lt!205510)))

(assert (=> d!42277 (isPrefixOf!0 lt!205509 (_2!6074 lt!205021))))

(assert (=> d!42277 (= lt!205510 (lemmaIsPrefixTransitive!0 lt!205509 (_2!6074 lt!205021) (_2!6074 lt!205021)))))

(declare-fun lt!205506 () Unit!8172)

(declare-fun lt!205502 () Unit!8172)

(assert (=> d!42277 (= lt!205506 lt!205502)))

(assert (=> d!42277 (isPrefixOf!0 lt!205509 (_2!6074 lt!205021))))

(assert (=> d!42277 (= lt!205502 (lemmaIsPrefixTransitive!0 lt!205509 thiss!1634 (_2!6074 lt!205021)))))

(declare-fun lt!205520 () Unit!8172)

(declare-fun e!88175 () Unit!8172)

(assert (=> d!42277 (= lt!205520 e!88175)))

(declare-fun c!7592 () Bool)

(assert (=> d!42277 (= c!7592 (not (= (size!2770 (buf!3143 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!205517 () Unit!8172)

(declare-fun lt!205505 () Unit!8172)

(assert (=> d!42277 (= lt!205517 lt!205505)))

(assert (=> d!42277 (isPrefixOf!0 (_2!6074 lt!205021) (_2!6074 lt!205021))))

(assert (=> d!42277 (= lt!205505 (lemmaIsPrefixRefl!0 (_2!6074 lt!205021)))))

(declare-fun lt!205513 () Unit!8172)

(declare-fun lt!205516 () Unit!8172)

(assert (=> d!42277 (= lt!205513 lt!205516)))

(assert (=> d!42277 (= lt!205516 (lemmaIsPrefixRefl!0 (_2!6074 lt!205021)))))

(declare-fun lt!205503 () Unit!8172)

(declare-fun lt!205515 () Unit!8172)

(assert (=> d!42277 (= lt!205503 lt!205515)))

(assert (=> d!42277 (isPrefixOf!0 lt!205509 lt!205509)))

(assert (=> d!42277 (= lt!205515 (lemmaIsPrefixRefl!0 lt!205509))))

(declare-fun lt!205511 () Unit!8172)

(declare-fun lt!205512 () Unit!8172)

(assert (=> d!42277 (= lt!205511 lt!205512)))

(assert (=> d!42277 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42277 (= lt!205512 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42277 (= lt!205509 (BitStream!4805 (buf!3143 (_2!6074 lt!205021)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)))))

(assert (=> d!42277 (isPrefixOf!0 thiss!1634 (_2!6074 lt!205021))))

(assert (=> d!42277 (= (reader!0 thiss!1634 (_2!6074 lt!205021)) lt!205507)))

(declare-fun b!132980 () Bool)

(declare-fun lt!205519 () (_ BitVec 64))

(declare-fun lt!205514 () (_ BitVec 64))

(assert (=> b!132980 (= e!88174 (= (_1!6076 lt!205507) (withMovedBitIndex!0 (_2!6076 lt!205507) (bvsub lt!205514 lt!205519))))))

(assert (=> b!132980 (or (= (bvand lt!205514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205514 lt!205519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132980 (= lt!205519 (bitIndex!0 (size!2770 (buf!3143 (_2!6074 lt!205021))) (currentByte!5928 (_2!6074 lt!205021)) (currentBit!5923 (_2!6074 lt!205021))))))

(assert (=> b!132980 (= lt!205514 (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)))))

(declare-fun b!132981 () Bool)

(declare-fun Unit!8180 () Unit!8172)

(assert (=> b!132981 (= e!88175 Unit!8180)))

(declare-fun b!132982 () Bool)

(declare-fun lt!205521 () Unit!8172)

(assert (=> b!132982 (= e!88175 lt!205521)))

(declare-fun lt!205508 () (_ BitVec 64))

(assert (=> b!132982 (= lt!205508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205504 () (_ BitVec 64))

(assert (=> b!132982 (= lt!205504 (bitIndex!0 (size!2770 (buf!3143 thiss!1634)) (currentByte!5928 thiss!1634) (currentBit!5923 thiss!1634)))))

(assert (=> b!132982 (= lt!205521 (arrayBitRangesEqSymmetric!0 (buf!3143 thiss!1634) (buf!3143 (_2!6074 lt!205021)) lt!205508 lt!205504))))

(assert (=> b!132982 (arrayBitRangesEq!0 (buf!3143 (_2!6074 lt!205021)) (buf!3143 thiss!1634) lt!205508 lt!205504)))

(declare-fun b!132983 () Bool)

(declare-fun res!110457 () Bool)

(assert (=> b!132983 (=> (not res!110457) (not e!88174))))

(assert (=> b!132983 (= res!110457 (isPrefixOf!0 (_1!6076 lt!205507) thiss!1634))))

(declare-fun b!132984 () Bool)

(declare-fun res!110456 () Bool)

(assert (=> b!132984 (=> (not res!110456) (not e!88174))))

(assert (=> b!132984 (= res!110456 (isPrefixOf!0 (_2!6076 lt!205507) (_2!6074 lt!205021)))))

(assert (= (and d!42277 c!7592) b!132982))

(assert (= (and d!42277 (not c!7592)) b!132981))

(assert (= (and d!42277 res!110458) b!132983))

(assert (= (and b!132983 res!110457) b!132984))

(assert (= (and b!132984 res!110456) b!132980))

(assert (=> b!132982 m!200789))

(declare-fun m!201201 () Bool)

(assert (=> b!132982 m!201201))

(declare-fun m!201203 () Bool)

(assert (=> b!132982 m!201203))

(declare-fun m!201205 () Bool)

(assert (=> b!132983 m!201205))

(assert (=> d!42277 m!201135))

(declare-fun m!201207 () Bool)

(assert (=> d!42277 m!201207))

(declare-fun m!201209 () Bool)

(assert (=> d!42277 m!201209))

(declare-fun m!201211 () Bool)

(assert (=> d!42277 m!201211))

(assert (=> d!42277 m!201143))

(assert (=> d!42277 m!200719))

(declare-fun m!201213 () Bool)

(assert (=> d!42277 m!201213))

(assert (=> d!42277 m!200999))

(declare-fun m!201215 () Bool)

(assert (=> d!42277 m!201215))

(assert (=> d!42277 m!200991))

(declare-fun m!201217 () Bool)

(assert (=> d!42277 m!201217))

(declare-fun m!201219 () Bool)

(assert (=> b!132980 m!201219))

(assert (=> b!132980 m!200727))

(assert (=> b!132980 m!200789))

(declare-fun m!201221 () Bool)

(assert (=> b!132984 m!201221))

(assert (=> b!132774 d!42277))

(push 1)

(assert (not d!42233))

(assert (not b!132958))

(assert (not d!42229))

(assert (not d!42220))

(assert (not d!42177))

(assert (not d!42207))

(assert (not b!132980))

(assert (not b!132896))

(assert (not b!132965))

(assert (not b!132984))

(assert (not b!132966))

(assert (not b!132964))

(assert (not b!132930))

(assert (not d!42201))

(assert (not d!42231))

(assert (not d!42205))

(assert (not b!132982))

(assert (not b!132962))

(assert (not d!42239))

(assert (not b!132904))

(assert (not d!42277))

(assert (not d!42235))

(assert (not b!132923))

(assert (not d!42209))

(assert (not b!132907))

(assert (not d!42175))

(assert (not b!132959))

(assert (not d!42241))

(assert (not d!42185))

(assert (not b!132924))

(assert (not d!42245))

(assert (not b!132926))

(assert (not b!132889))

(assert (not d!42173))

(assert (not d!42273))

(assert (not d!42259))

(assert (not d!42203))

(assert (not b!132922))

(assert (not b!132898))

(assert (not b!132925))

(assert (not d!42243))

(assert (not d!42169))

(assert (not b!132957))

(assert (not b!132935))

(assert (not d!42275))

(assert (not d!42251))

(assert (not b!132909))

(assert (not d!42167))

(assert (not b!132983))

(assert (not d!42197))

(assert (not d!42179))

(assert (not d!42271))

(assert (not d!42187))

(assert (not b!132933))

(assert (not b!132932))

(assert (not d!42261))

(assert (not b!132888))

(assert (not d!42249))

(assert (not d!42199))

(assert (not b!132885))

(assert (not b!132887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

