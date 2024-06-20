; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43750 () Bool)

(assert start!43750)

(declare-fun b!208028 () Bool)

(declare-fun res!174558 () Bool)

(declare-fun e!142144 () Bool)

(assert (=> b!208028 (=> (not res!174558) (not e!142144))))

(declare-datatypes ((array!10440 0))(
  ( (array!10441 (arr!5520 (Array (_ BitVec 32) (_ BitVec 8))) (size!4590 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8288 0))(
  ( (BitStream!8289 (buf!5098 array!10440) (currentByte!9622 (_ BitVec 32)) (currentBit!9617 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8288)

(declare-datatypes ((Unit!14813 0))(
  ( (Unit!14814) )
))
(declare-datatypes ((tuple2!17838 0))(
  ( (tuple2!17839 (_1!9574 Unit!14813) (_2!9574 BitStream!8288)) )
))
(declare-fun lt!325009 () tuple2!17838)

(declare-fun isPrefixOf!0 (BitStream!8288 BitStream!8288) Bool)

(assert (=> b!208028 (= res!174558 (isPrefixOf!0 thiss!1204 (_2!9574 lt!325009)))))

(declare-fun res!174560 () Bool)

(declare-fun e!142148 () Bool)

(assert (=> start!43750 (=> (not res!174560) (not e!142148))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43750 (= res!174560 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43750 e!142148))

(assert (=> start!43750 true))

(declare-fun e!142147 () Bool)

(declare-fun inv!12 (BitStream!8288) Bool)

(assert (=> start!43750 (and (inv!12 thiss!1204) e!142147)))

(declare-fun b!208029 () Bool)

(declare-fun e!142142 () Bool)

(declare-fun e!142150 () Bool)

(assert (=> b!208029 (= e!142142 (not e!142150))))

(declare-fun res!174554 () Bool)

(assert (=> b!208029 (=> res!174554 e!142150)))

(declare-fun lt!325025 () (_ BitVec 64))

(declare-fun lt!325013 () (_ BitVec 64))

(assert (=> b!208029 (= res!174554 (not (= lt!325025 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325013))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208029 (= lt!325025 (bitIndex!0 (size!4590 (buf!5098 (_2!9574 lt!325009))) (currentByte!9622 (_2!9574 lt!325009)) (currentBit!9617 (_2!9574 lt!325009))))))

(assert (=> b!208029 (= lt!325013 (bitIndex!0 (size!4590 (buf!5098 thiss!1204)) (currentByte!9622 thiss!1204) (currentBit!9617 thiss!1204)))))

(declare-fun e!142146 () Bool)

(assert (=> b!208029 e!142146))

(declare-fun res!174555 () Bool)

(assert (=> b!208029 (=> (not res!174555) (not e!142146))))

(assert (=> b!208029 (= res!174555 (= (size!4590 (buf!5098 thiss!1204)) (size!4590 (buf!5098 (_2!9574 lt!325009)))))))

(declare-fun lt!325016 () Bool)

(declare-fun appendBit!0 (BitStream!8288 Bool) tuple2!17838)

(assert (=> b!208029 (= lt!325009 (appendBit!0 thiss!1204 lt!325016))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!208029 (= lt!325016 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!208030 () Bool)

(declare-fun array_inv!4331 (array!10440) Bool)

(assert (=> b!208030 (= e!142147 (array_inv!4331 (buf!5098 thiss!1204)))))

(declare-fun b!208031 () Bool)

(declare-fun res!174559 () Bool)

(declare-fun e!142152 () Bool)

(assert (=> b!208031 (=> res!174559 e!142152)))

(declare-fun lt!325028 () tuple2!17838)

(assert (=> b!208031 (= res!174559 (not (isPrefixOf!0 (_2!9574 lt!325009) (_2!9574 lt!325028))))))

(declare-fun b!208032 () Bool)

(assert (=> b!208032 (= e!142152 (or (not (= (bvand i!590 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!590 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000))))))

(declare-fun lt!325015 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208032 (validate_offset_bits!1 ((_ sign_extend 32) (size!4590 (buf!5098 (_2!9574 lt!325028)))) ((_ sign_extend 32) (currentByte!9622 (_2!9574 lt!325009))) ((_ sign_extend 32) (currentBit!9617 (_2!9574 lt!325009))) lt!325015)))

(declare-fun lt!325010 () Unit!14813)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8288 array!10440 (_ BitVec 64)) Unit!14813)

(assert (=> b!208032 (= lt!325010 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9574 lt!325009) (buf!5098 (_2!9574 lt!325028)) lt!325015))))

(assert (=> b!208032 (= lt!325015 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!17840 0))(
  ( (tuple2!17841 (_1!9575 BitStream!8288) (_2!9575 BitStream!8288)) )
))
(declare-fun lt!325022 () tuple2!17840)

(declare-datatypes ((tuple2!17842 0))(
  ( (tuple2!17843 (_1!9576 BitStream!8288) (_2!9576 (_ BitVec 64))) )
))
(declare-fun lt!325014 () tuple2!17842)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17842)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208032 (= lt!325014 (readNBitsLSBFirstsLoopPure!0 (_1!9575 lt!325022) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!325012 () (_ BitVec 64))

(assert (=> b!208032 (validate_offset_bits!1 ((_ sign_extend 32) (size!4590 (buf!5098 (_2!9574 lt!325028)))) ((_ sign_extend 32) (currentByte!9622 thiss!1204)) ((_ sign_extend 32) (currentBit!9617 thiss!1204)) lt!325012)))

(declare-fun lt!325020 () Unit!14813)

(assert (=> b!208032 (= lt!325020 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5098 (_2!9574 lt!325028)) lt!325012))))

(declare-datatypes ((tuple2!17844 0))(
  ( (tuple2!17845 (_1!9577 BitStream!8288) (_2!9577 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8288) tuple2!17844)

(assert (=> b!208032 (= (_2!9577 (readBitPure!0 (_1!9575 lt!325022))) lt!325016)))

(declare-fun lt!325019 () tuple2!17840)

(declare-fun reader!0 (BitStream!8288 BitStream!8288) tuple2!17840)

(assert (=> b!208032 (= lt!325019 (reader!0 (_2!9574 lt!325009) (_2!9574 lt!325028)))))

(assert (=> b!208032 (= lt!325022 (reader!0 thiss!1204 (_2!9574 lt!325028)))))

(declare-fun e!142143 () Bool)

(assert (=> b!208032 e!142143))

(declare-fun res!174557 () Bool)

(assert (=> b!208032 (=> (not res!174557) (not e!142143))))

(declare-fun lt!325011 () tuple2!17844)

(declare-fun lt!325023 () tuple2!17844)

(assert (=> b!208032 (= res!174557 (= (bitIndex!0 (size!4590 (buf!5098 (_1!9577 lt!325011))) (currentByte!9622 (_1!9577 lt!325011)) (currentBit!9617 (_1!9577 lt!325011))) (bitIndex!0 (size!4590 (buf!5098 (_1!9577 lt!325023))) (currentByte!9622 (_1!9577 lt!325023)) (currentBit!9617 (_1!9577 lt!325023)))))))

(declare-fun lt!325026 () Unit!14813)

(declare-fun lt!325027 () BitStream!8288)

(declare-fun readBitPrefixLemma!0 (BitStream!8288 BitStream!8288) Unit!14813)

(assert (=> b!208032 (= lt!325026 (readBitPrefixLemma!0 lt!325027 (_2!9574 lt!325028)))))

(assert (=> b!208032 (= lt!325023 (readBitPure!0 (BitStream!8289 (buf!5098 (_2!9574 lt!325028)) (currentByte!9622 thiss!1204) (currentBit!9617 thiss!1204))))))

(assert (=> b!208032 (= lt!325011 (readBitPure!0 lt!325027))))

(declare-fun e!142149 () Bool)

(assert (=> b!208032 e!142149))

(declare-fun res!174567 () Bool)

(assert (=> b!208032 (=> (not res!174567) (not e!142149))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208032 (= res!174567 (invariant!0 (currentBit!9617 thiss!1204) (currentByte!9622 thiss!1204) (size!4590 (buf!5098 (_2!9574 lt!325009)))))))

(assert (=> b!208032 (= lt!325027 (BitStream!8289 (buf!5098 (_2!9574 lt!325009)) (currentByte!9622 thiss!1204) (currentBit!9617 thiss!1204)))))

(declare-fun b!208033 () Bool)

(assert (=> b!208033 (= e!142148 e!142142)))

(declare-fun res!174562 () Bool)

(assert (=> b!208033 (=> (not res!174562) (not e!142142))))

(assert (=> b!208033 (= res!174562 (validate_offset_bits!1 ((_ sign_extend 32) (size!4590 (buf!5098 thiss!1204))) ((_ sign_extend 32) (currentByte!9622 thiss!1204)) ((_ sign_extend 32) (currentBit!9617 thiss!1204)) lt!325012))))

(assert (=> b!208033 (= lt!325012 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208034 () Bool)

(declare-fun res!174565 () Bool)

(assert (=> b!208034 (=> res!174565 e!142152)))

(declare-fun lt!325021 () (_ BitVec 64))

(assert (=> b!208034 (= res!174565 (or (not (= (size!4590 (buf!5098 (_2!9574 lt!325028))) (size!4590 (buf!5098 thiss!1204)))) (not (= lt!325021 (bvsub (bvadd lt!325013 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!208035 () Bool)

(declare-fun e!142151 () Bool)

(declare-fun lt!325017 () tuple2!17844)

(declare-fun lt!325008 () (_ BitVec 64))

(assert (=> b!208035 (= e!142151 (= (bitIndex!0 (size!4590 (buf!5098 (_1!9577 lt!325017))) (currentByte!9622 (_1!9577 lt!325017)) (currentBit!9617 (_1!9577 lt!325017))) lt!325008))))

(declare-fun b!208036 () Bool)

(assert (=> b!208036 (= e!142149 (invariant!0 (currentBit!9617 thiss!1204) (currentByte!9622 thiss!1204) (size!4590 (buf!5098 (_2!9574 lt!325028)))))))

(declare-fun b!208037 () Bool)

(assert (=> b!208037 (= e!142146 e!142144)))

(declare-fun res!174566 () Bool)

(assert (=> b!208037 (=> (not res!174566) (not e!142144))))

(declare-fun lt!325018 () (_ BitVec 64))

(assert (=> b!208037 (= res!174566 (= lt!325008 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325018)))))

(assert (=> b!208037 (= lt!325008 (bitIndex!0 (size!4590 (buf!5098 (_2!9574 lt!325009))) (currentByte!9622 (_2!9574 lt!325009)) (currentBit!9617 (_2!9574 lt!325009))))))

(assert (=> b!208037 (= lt!325018 (bitIndex!0 (size!4590 (buf!5098 thiss!1204)) (currentByte!9622 thiss!1204) (currentBit!9617 thiss!1204)))))

(declare-fun b!208038 () Bool)

(assert (=> b!208038 (= e!142150 e!142152)))

(declare-fun res!174569 () Bool)

(assert (=> b!208038 (=> res!174569 e!142152)))

(assert (=> b!208038 (= res!174569 (not (= lt!325021 (bvsub (bvsub (bvadd lt!325025 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!208038 (= lt!325021 (bitIndex!0 (size!4590 (buf!5098 (_2!9574 lt!325028))) (currentByte!9622 (_2!9574 lt!325028)) (currentBit!9617 (_2!9574 lt!325028))))))

(assert (=> b!208038 (isPrefixOf!0 thiss!1204 (_2!9574 lt!325028))))

(declare-fun lt!325024 () Unit!14813)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8288 BitStream!8288 BitStream!8288) Unit!14813)

(assert (=> b!208038 (= lt!325024 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9574 lt!325009) (_2!9574 lt!325028)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8288 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17838)

(assert (=> b!208038 (= lt!325028 (appendBitsLSBFirstLoopTR!0 (_2!9574 lt!325009) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!208039 () Bool)

(assert (=> b!208039 (= e!142144 e!142151)))

(declare-fun res!174568 () Bool)

(assert (=> b!208039 (=> (not res!174568) (not e!142151))))

(assert (=> b!208039 (= res!174568 (and (= (_2!9577 lt!325017) lt!325016) (= (_1!9577 lt!325017) (_2!9574 lt!325009))))))

(declare-fun readerFrom!0 (BitStream!8288 (_ BitVec 32) (_ BitVec 32)) BitStream!8288)

(assert (=> b!208039 (= lt!325017 (readBitPure!0 (readerFrom!0 (_2!9574 lt!325009) (currentBit!9617 thiss!1204) (currentByte!9622 thiss!1204))))))

(declare-fun b!208040 () Bool)

(declare-fun res!174556 () Bool)

(assert (=> b!208040 (=> (not res!174556) (not e!142142))))

(assert (=> b!208040 (= res!174556 (not (= i!590 nBits!348)))))

(declare-fun b!208041 () Bool)

(declare-fun res!174563 () Bool)

(assert (=> b!208041 (=> res!174563 e!142152)))

(assert (=> b!208041 (= res!174563 (not (isPrefixOf!0 thiss!1204 (_2!9574 lt!325009))))))

(declare-fun b!208042 () Bool)

(declare-fun res!174564 () Bool)

(assert (=> b!208042 (=> (not res!174564) (not e!142142))))

(assert (=> b!208042 (= res!174564 (invariant!0 (currentBit!9617 thiss!1204) (currentByte!9622 thiss!1204) (size!4590 (buf!5098 thiss!1204))))))

(declare-fun b!208043 () Bool)

(assert (=> b!208043 (= e!142143 (= (_2!9577 lt!325011) (_2!9577 lt!325023)))))

(declare-fun b!208044 () Bool)

(declare-fun res!174561 () Bool)

(assert (=> b!208044 (=> res!174561 e!142152)))

(assert (=> b!208044 (= res!174561 (not (invariant!0 (currentBit!9617 (_2!9574 lt!325028)) (currentByte!9622 (_2!9574 lt!325028)) (size!4590 (buf!5098 (_2!9574 lt!325028))))))))

(assert (= (and start!43750 res!174560) b!208033))

(assert (= (and b!208033 res!174562) b!208042))

(assert (= (and b!208042 res!174564) b!208040))

(assert (= (and b!208040 res!174556) b!208029))

(assert (= (and b!208029 res!174555) b!208037))

(assert (= (and b!208037 res!174566) b!208028))

(assert (= (and b!208028 res!174558) b!208039))

(assert (= (and b!208039 res!174568) b!208035))

(assert (= (and b!208029 (not res!174554)) b!208038))

(assert (= (and b!208038 (not res!174569)) b!208044))

(assert (= (and b!208044 (not res!174561)) b!208034))

(assert (= (and b!208034 (not res!174565)) b!208031))

(assert (= (and b!208031 (not res!174559)) b!208041))

(assert (= (and b!208041 (not res!174563)) b!208032))

(assert (= (and b!208032 res!174567) b!208036))

(assert (= (and b!208032 res!174557) b!208043))

(assert (= start!43750 b!208030))

(declare-fun m!320115 () Bool)

(assert (=> b!208033 m!320115))

(declare-fun m!320117 () Bool)

(assert (=> b!208028 m!320117))

(declare-fun m!320119 () Bool)

(assert (=> b!208038 m!320119))

(declare-fun m!320121 () Bool)

(assert (=> b!208038 m!320121))

(declare-fun m!320123 () Bool)

(assert (=> b!208038 m!320123))

(declare-fun m!320125 () Bool)

(assert (=> b!208038 m!320125))

(declare-fun m!320127 () Bool)

(assert (=> b!208035 m!320127))

(declare-fun m!320129 () Bool)

(assert (=> b!208030 m!320129))

(declare-fun m!320131 () Bool)

(assert (=> b!208044 m!320131))

(declare-fun m!320133 () Bool)

(assert (=> start!43750 m!320133))

(declare-fun m!320135 () Bool)

(assert (=> b!208029 m!320135))

(declare-fun m!320137 () Bool)

(assert (=> b!208029 m!320137))

(declare-fun m!320139 () Bool)

(assert (=> b!208029 m!320139))

(declare-fun m!320141 () Bool)

(assert (=> b!208042 m!320141))

(assert (=> b!208041 m!320117))

(declare-fun m!320143 () Bool)

(assert (=> b!208032 m!320143))

(declare-fun m!320145 () Bool)

(assert (=> b!208032 m!320145))

(declare-fun m!320147 () Bool)

(assert (=> b!208032 m!320147))

(declare-fun m!320149 () Bool)

(assert (=> b!208032 m!320149))

(declare-fun m!320151 () Bool)

(assert (=> b!208032 m!320151))

(declare-fun m!320153 () Bool)

(assert (=> b!208032 m!320153))

(declare-fun m!320155 () Bool)

(assert (=> b!208032 m!320155))

(declare-fun m!320157 () Bool)

(assert (=> b!208032 m!320157))

(declare-fun m!320159 () Bool)

(assert (=> b!208032 m!320159))

(declare-fun m!320161 () Bool)

(assert (=> b!208032 m!320161))

(declare-fun m!320163 () Bool)

(assert (=> b!208032 m!320163))

(declare-fun m!320165 () Bool)

(assert (=> b!208032 m!320165))

(declare-fun m!320167 () Bool)

(assert (=> b!208032 m!320167))

(declare-fun m!320169 () Bool)

(assert (=> b!208032 m!320169))

(declare-fun m!320171 () Bool)

(assert (=> b!208032 m!320171))

(assert (=> b!208037 m!320135))

(assert (=> b!208037 m!320137))

(declare-fun m!320173 () Bool)

(assert (=> b!208039 m!320173))

(assert (=> b!208039 m!320173))

(declare-fun m!320175 () Bool)

(assert (=> b!208039 m!320175))

(declare-fun m!320177 () Bool)

(assert (=> b!208031 m!320177))

(declare-fun m!320179 () Bool)

(assert (=> b!208036 m!320179))

(push 1)

(assert (not b!208036))

(assert (not b!208035))

(assert (not b!208030))

(assert (not b!208032))

(assert (not b!208029))

(assert (not b!208042))

(assert (not b!208033))

(assert (not b!208044))

(assert (not b!208028))

(assert (not b!208031))

(assert (not b!208041))

(assert (not b!208038))

(assert (not b!208039))

(assert (not b!208037))

(assert (not start!43750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

