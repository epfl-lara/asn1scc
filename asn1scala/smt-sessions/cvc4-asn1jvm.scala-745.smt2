; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21236 () Bool)

(assert start!21236)

(declare-fun b!106978 () Bool)

(declare-datatypes ((array!4914 0))(
  ( (array!4915 (arr!2831 (Array (_ BitVec 32) (_ BitVec 8))) (size!2238 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3950 0))(
  ( (BitStream!3951 (buf!2620 array!4914) (currentByte!5138 (_ BitVec 32)) (currentBit!5133 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8804 0))(
  ( (tuple2!8805 (_1!4659 BitStream!3950) (_2!4659 BitStream!3950)) )
))
(declare-fun lt!159547 () tuple2!8804)

(declare-datatypes ((Unit!6554 0))(
  ( (Unit!6555) )
))
(declare-datatypes ((tuple2!8806 0))(
  ( (tuple2!8807 (_1!4660 Unit!6554) (_2!4660 BitStream!3950)) )
))
(declare-fun lt!159560 () tuple2!8806)

(declare-fun lt!159563 () (_ BitVec 64))

(declare-fun e!70028 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!3950 (_ BitVec 64)) BitStream!3950)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106978 (= e!70028 (= (_1!4659 lt!159547) (withMovedBitIndex!0 (_2!4659 lt!159547) (bvsub (bitIndex!0 (size!2238 (buf!2620 (_2!4660 lt!159560))) (currentByte!5138 (_2!4660 lt!159560)) (currentBit!5133 (_2!4660 lt!159560))) lt!159563))))))

(declare-fun b!106979 () Bool)

(declare-fun res!88142 () Bool)

(declare-fun e!70026 () Bool)

(assert (=> b!106979 (=> (not res!88142) (not e!70026))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106979 (= res!88142 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!106980 () Bool)

(declare-fun e!70032 () Bool)

(assert (=> b!106980 (= e!70032 e!70026)))

(declare-fun res!88135 () Bool)

(assert (=> b!106980 (=> (not res!88135) (not e!70026))))

(declare-fun thiss!1305 () BitStream!3950)

(declare-fun lt!159539 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106980 (= res!88135 (validate_offset_bits!1 ((_ sign_extend 32) (size!2238 (buf!2620 thiss!1305))) ((_ sign_extend 32) (currentByte!5138 thiss!1305)) ((_ sign_extend 32) (currentBit!5133 thiss!1305)) lt!159539))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!106980 (= lt!159539 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!106981 () Bool)

(declare-fun e!70030 () Bool)

(declare-datatypes ((tuple2!8808 0))(
  ( (tuple2!8809 (_1!4661 BitStream!3950) (_2!4661 Bool)) )
))
(declare-fun lt!159556 () tuple2!8808)

(declare-fun lt!159559 () (_ BitVec 64))

(assert (=> b!106981 (= e!70030 (= (bitIndex!0 (size!2238 (buf!2620 (_1!4661 lt!159556))) (currentByte!5138 (_1!4661 lt!159556)) (currentBit!5133 (_1!4661 lt!159556))) lt!159559))))

(declare-fun res!88144 () Bool)

(assert (=> start!21236 (=> (not res!88144) (not e!70032))))

(assert (=> start!21236 (= res!88144 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21236 e!70032))

(assert (=> start!21236 true))

(declare-fun e!70027 () Bool)

(declare-fun inv!12 (BitStream!3950) Bool)

(assert (=> start!21236 (and (inv!12 thiss!1305) e!70027)))

(declare-fun b!106982 () Bool)

(declare-fun e!70023 () Bool)

(assert (=> b!106982 (= e!70026 (not e!70023))))

(declare-fun res!88143 () Bool)

(assert (=> b!106982 (=> res!88143 e!70023)))

(declare-fun lt!159544 () (_ BitVec 64))

(declare-datatypes ((tuple2!8810 0))(
  ( (tuple2!8811 (_1!4662 BitStream!3950) (_2!4662 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8810)

(assert (=> b!106982 (= res!88143 (not (= (_1!4662 (readNLeastSignificantBitsLoopPure!0 (_1!4659 lt!159547) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159544)) (_2!4659 lt!159547))))))

(declare-fun lt!159558 () tuple2!8806)

(declare-fun lt!159550 () (_ BitVec 64))

(assert (=> b!106982 (validate_offset_bits!1 ((_ sign_extend 32) (size!2238 (buf!2620 (_2!4660 lt!159558)))) ((_ sign_extend 32) (currentByte!5138 (_2!4660 lt!159560))) ((_ sign_extend 32) (currentBit!5133 (_2!4660 lt!159560))) lt!159550)))

(declare-fun lt!159548 () Unit!6554)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3950 array!4914 (_ BitVec 64)) Unit!6554)

(assert (=> b!106982 (= lt!159548 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4660 lt!159560) (buf!2620 (_2!4660 lt!159558)) lt!159550))))

(assert (=> b!106982 (= lt!159550 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!159552 () (_ BitVec 64))

(declare-fun lt!159554 () tuple2!8808)

(declare-fun lt!159545 () (_ BitVec 64))

(assert (=> b!106982 (= lt!159544 (bvor lt!159552 (ite (_2!4661 lt!159554) lt!159545 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!159540 () tuple2!8810)

(declare-fun lt!159564 () tuple2!8804)

(assert (=> b!106982 (= lt!159540 (readNLeastSignificantBitsLoopPure!0 (_1!4659 lt!159564) nBits!396 i!615 lt!159552))))

(assert (=> b!106982 (validate_offset_bits!1 ((_ sign_extend 32) (size!2238 (buf!2620 (_2!4660 lt!159558)))) ((_ sign_extend 32) (currentByte!5138 thiss!1305)) ((_ sign_extend 32) (currentBit!5133 thiss!1305)) lt!159539)))

(declare-fun lt!159553 () Unit!6554)

(assert (=> b!106982 (= lt!159553 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2620 (_2!4660 lt!159558)) lt!159539))))

(assert (=> b!106982 (= lt!159552 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!159562 () Bool)

(assert (=> b!106982 (= (_2!4661 lt!159554) lt!159562)))

(declare-fun readBitPure!0 (BitStream!3950) tuple2!8808)

(assert (=> b!106982 (= lt!159554 (readBitPure!0 (_1!4659 lt!159564)))))

(declare-fun reader!0 (BitStream!3950 BitStream!3950) tuple2!8804)

(assert (=> b!106982 (= lt!159547 (reader!0 (_2!4660 lt!159560) (_2!4660 lt!159558)))))

(assert (=> b!106982 (= lt!159564 (reader!0 thiss!1305 (_2!4660 lt!159558)))))

(declare-fun e!70025 () Bool)

(assert (=> b!106982 e!70025))

(declare-fun res!88141 () Bool)

(assert (=> b!106982 (=> (not res!88141) (not e!70025))))

(declare-fun lt!159542 () tuple2!8808)

(declare-fun lt!159546 () tuple2!8808)

(assert (=> b!106982 (= res!88141 (= (bitIndex!0 (size!2238 (buf!2620 (_1!4661 lt!159542))) (currentByte!5138 (_1!4661 lt!159542)) (currentBit!5133 (_1!4661 lt!159542))) (bitIndex!0 (size!2238 (buf!2620 (_1!4661 lt!159546))) (currentByte!5138 (_1!4661 lt!159546)) (currentBit!5133 (_1!4661 lt!159546)))))))

(declare-fun lt!159561 () Unit!6554)

(declare-fun lt!159543 () BitStream!3950)

(declare-fun readBitPrefixLemma!0 (BitStream!3950 BitStream!3950) Unit!6554)

(assert (=> b!106982 (= lt!159561 (readBitPrefixLemma!0 lt!159543 (_2!4660 lt!159558)))))

(assert (=> b!106982 (= lt!159546 (readBitPure!0 (BitStream!3951 (buf!2620 (_2!4660 lt!159558)) (currentByte!5138 thiss!1305) (currentBit!5133 thiss!1305))))))

(assert (=> b!106982 (= lt!159542 (readBitPure!0 lt!159543))))

(assert (=> b!106982 (= lt!159543 (BitStream!3951 (buf!2620 (_2!4660 lt!159560)) (currentByte!5138 thiss!1305) (currentBit!5133 thiss!1305)))))

(declare-fun e!70024 () Bool)

(assert (=> b!106982 e!70024))

(declare-fun res!88136 () Bool)

(assert (=> b!106982 (=> (not res!88136) (not e!70024))))

(declare-fun isPrefixOf!0 (BitStream!3950 BitStream!3950) Bool)

(assert (=> b!106982 (= res!88136 (isPrefixOf!0 thiss!1305 (_2!4660 lt!159558)))))

(declare-fun lt!159557 () Unit!6554)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3950 BitStream!3950 BitStream!3950) Unit!6554)

(assert (=> b!106982 (= lt!159557 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4660 lt!159560) (_2!4660 lt!159558)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3950 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8806)

(assert (=> b!106982 (= lt!159558 (appendNLeastSignificantBitsLoop!0 (_2!4660 lt!159560) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!70029 () Bool)

(assert (=> b!106982 e!70029))

(declare-fun res!88134 () Bool)

(assert (=> b!106982 (=> (not res!88134) (not e!70029))))

(assert (=> b!106982 (= res!88134 (= (size!2238 (buf!2620 thiss!1305)) (size!2238 (buf!2620 (_2!4660 lt!159560)))))))

(declare-fun appendBit!0 (BitStream!3950 Bool) tuple2!8806)

(assert (=> b!106982 (= lt!159560 (appendBit!0 thiss!1305 lt!159562))))

(assert (=> b!106982 (= lt!159562 (not (= (bvand v!199 lt!159545) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106982 (= lt!159545 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!106983 () Bool)

(assert (=> b!106983 (= e!70025 (= (_2!4661 lt!159542) (_2!4661 lt!159546)))))

(declare-fun b!106984 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!106984 (= e!70023 (invariant!0 (currentBit!5133 thiss!1305) (currentByte!5138 thiss!1305) (size!2238 (buf!2620 thiss!1305))))))

(assert (=> b!106984 e!70028))

(declare-fun res!88138 () Bool)

(assert (=> b!106984 (=> (not res!88138) (not e!70028))))

(declare-fun lt!159551 () (_ BitVec 64))

(assert (=> b!106984 (= res!88138 (= (_1!4659 lt!159564) (withMovedBitIndex!0 (_2!4659 lt!159564) (bvsub lt!159551 lt!159563))))))

(assert (=> b!106984 (= lt!159563 (bitIndex!0 (size!2238 (buf!2620 (_2!4660 lt!159558))) (currentByte!5138 (_2!4660 lt!159558)) (currentBit!5133 (_2!4660 lt!159558))))))

(assert (=> b!106984 (= lt!159551 (bitIndex!0 (size!2238 (buf!2620 thiss!1305)) (currentByte!5138 thiss!1305) (currentBit!5133 thiss!1305)))))

(declare-fun lt!159541 () tuple2!8810)

(assert (=> b!106984 (and (= (_2!4662 lt!159540) (_2!4662 lt!159541)) (= (_1!4662 lt!159540) (_1!4662 lt!159541)))))

(declare-fun lt!159549 () Unit!6554)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6554)

(assert (=> b!106984 (= lt!159549 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4659 lt!159564) nBits!396 i!615 lt!159552))))

(assert (=> b!106984 (= lt!159541 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4659 lt!159564) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159544))))

(declare-fun b!106985 () Bool)

(declare-fun e!70022 () Bool)

(assert (=> b!106985 (= e!70029 e!70022)))

(declare-fun res!88139 () Bool)

(assert (=> b!106985 (=> (not res!88139) (not e!70022))))

(declare-fun lt!159555 () (_ BitVec 64))

(assert (=> b!106985 (= res!88139 (= lt!159559 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!159555)))))

(assert (=> b!106985 (= lt!159559 (bitIndex!0 (size!2238 (buf!2620 (_2!4660 lt!159560))) (currentByte!5138 (_2!4660 lt!159560)) (currentBit!5133 (_2!4660 lt!159560))))))

(assert (=> b!106985 (= lt!159555 (bitIndex!0 (size!2238 (buf!2620 thiss!1305)) (currentByte!5138 thiss!1305) (currentBit!5133 thiss!1305)))))

(declare-fun b!106986 () Bool)

(declare-fun res!88146 () Bool)

(assert (=> b!106986 (=> (not res!88146) (not e!70022))))

(assert (=> b!106986 (= res!88146 (isPrefixOf!0 thiss!1305 (_2!4660 lt!159560)))))

(declare-fun b!106987 () Bool)

(declare-fun array_inv!2040 (array!4914) Bool)

(assert (=> b!106987 (= e!70027 (array_inv!2040 (buf!2620 thiss!1305)))))

(declare-fun b!106988 () Bool)

(declare-fun res!88145 () Bool)

(assert (=> b!106988 (=> (not res!88145) (not e!70024))))

(assert (=> b!106988 (= res!88145 (invariant!0 (currentBit!5133 thiss!1305) (currentByte!5138 thiss!1305) (size!2238 (buf!2620 (_2!4660 lt!159560)))))))

(declare-fun b!106989 () Bool)

(declare-fun res!88140 () Bool)

(assert (=> b!106989 (=> (not res!88140) (not e!70026))))

(assert (=> b!106989 (= res!88140 (bvslt i!615 nBits!396))))

(declare-fun b!106990 () Bool)

(assert (=> b!106990 (= e!70024 (invariant!0 (currentBit!5133 thiss!1305) (currentByte!5138 thiss!1305) (size!2238 (buf!2620 (_2!4660 lt!159558)))))))

(declare-fun b!106991 () Bool)

(assert (=> b!106991 (= e!70022 e!70030)))

(declare-fun res!88137 () Bool)

(assert (=> b!106991 (=> (not res!88137) (not e!70030))))

(assert (=> b!106991 (= res!88137 (and (= (_2!4661 lt!159556) lt!159562) (= (_1!4661 lt!159556) (_2!4660 lt!159560))))))

(declare-fun readerFrom!0 (BitStream!3950 (_ BitVec 32) (_ BitVec 32)) BitStream!3950)

(assert (=> b!106991 (= lt!159556 (readBitPure!0 (readerFrom!0 (_2!4660 lt!159560) (currentBit!5133 thiss!1305) (currentByte!5138 thiss!1305))))))

(assert (= (and start!21236 res!88144) b!106980))

(assert (= (and b!106980 res!88135) b!106979))

(assert (= (and b!106979 res!88142) b!106989))

(assert (= (and b!106989 res!88140) b!106982))

(assert (= (and b!106982 res!88134) b!106985))

(assert (= (and b!106985 res!88139) b!106986))

(assert (= (and b!106986 res!88146) b!106991))

(assert (= (and b!106991 res!88137) b!106981))

(assert (= (and b!106982 res!88136) b!106988))

(assert (= (and b!106988 res!88145) b!106990))

(assert (= (and b!106982 res!88141) b!106983))

(assert (= (and b!106982 (not res!88143)) b!106984))

(assert (= (and b!106984 res!88138) b!106978))

(assert (= start!21236 b!106987))

(declare-fun m!157823 () Bool)

(assert (=> b!106991 m!157823))

(assert (=> b!106991 m!157823))

(declare-fun m!157825 () Bool)

(assert (=> b!106991 m!157825))

(declare-fun m!157827 () Bool)

(assert (=> b!106985 m!157827))

(declare-fun m!157829 () Bool)

(assert (=> b!106985 m!157829))

(declare-fun m!157831 () Bool)

(assert (=> b!106990 m!157831))

(declare-fun m!157833 () Bool)

(assert (=> b!106984 m!157833))

(declare-fun m!157835 () Bool)

(assert (=> b!106984 m!157835))

(assert (=> b!106984 m!157829))

(declare-fun m!157837 () Bool)

(assert (=> b!106984 m!157837))

(declare-fun m!157839 () Bool)

(assert (=> b!106984 m!157839))

(declare-fun m!157841 () Bool)

(assert (=> b!106984 m!157841))

(declare-fun m!157843 () Bool)

(assert (=> b!106984 m!157843))

(assert (=> b!106984 m!157841))

(declare-fun m!157845 () Bool)

(assert (=> b!106979 m!157845))

(assert (=> b!106978 m!157827))

(declare-fun m!157847 () Bool)

(assert (=> b!106978 m!157847))

(declare-fun m!157849 () Bool)

(assert (=> b!106988 m!157849))

(declare-fun m!157851 () Bool)

(assert (=> b!106980 m!157851))

(declare-fun m!157853 () Bool)

(assert (=> b!106986 m!157853))

(declare-fun m!157855 () Bool)

(assert (=> b!106981 m!157855))

(declare-fun m!157857 () Bool)

(assert (=> b!106982 m!157857))

(declare-fun m!157859 () Bool)

(assert (=> b!106982 m!157859))

(declare-fun m!157861 () Bool)

(assert (=> b!106982 m!157861))

(declare-fun m!157863 () Bool)

(assert (=> b!106982 m!157863))

(declare-fun m!157865 () Bool)

(assert (=> b!106982 m!157865))

(declare-fun m!157867 () Bool)

(assert (=> b!106982 m!157867))

(declare-fun m!157869 () Bool)

(assert (=> b!106982 m!157869))

(declare-fun m!157871 () Bool)

(assert (=> b!106982 m!157871))

(declare-fun m!157873 () Bool)

(assert (=> b!106982 m!157873))

(declare-fun m!157875 () Bool)

(assert (=> b!106982 m!157875))

(declare-fun m!157877 () Bool)

(assert (=> b!106982 m!157877))

(declare-fun m!157879 () Bool)

(assert (=> b!106982 m!157879))

(declare-fun m!157881 () Bool)

(assert (=> b!106982 m!157881))

(declare-fun m!157883 () Bool)

(assert (=> b!106982 m!157883))

(declare-fun m!157885 () Bool)

(assert (=> b!106982 m!157885))

(declare-fun m!157887 () Bool)

(assert (=> b!106982 m!157887))

(declare-fun m!157889 () Bool)

(assert (=> b!106982 m!157889))

(declare-fun m!157891 () Bool)

(assert (=> b!106982 m!157891))

(declare-fun m!157893 () Bool)

(assert (=> b!106982 m!157893))

(declare-fun m!157895 () Bool)

(assert (=> start!21236 m!157895))

(declare-fun m!157897 () Bool)

(assert (=> b!106987 m!157897))

(push 1)

(assert (not b!106982))

(assert (not b!106980))

(assert (not b!106990))

(assert (not b!106979))

(assert (not b!106981))

(assert (not start!21236))

(assert (not b!106991))

(assert (not b!106987))

(assert (not b!106986))

(assert (not b!106985))

(assert (not b!106978))

(assert (not b!106988))

(assert (not b!106984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

