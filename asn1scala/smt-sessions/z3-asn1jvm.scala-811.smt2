; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23914 () Bool)

(assert start!23914)

(declare-fun b!120984 () Bool)

(declare-fun e!79242 () Bool)

(declare-datatypes ((array!5374 0))(
  ( (array!5375 (arr!3025 (Array (_ BitVec 32) (_ BitVec 8))) (size!2432 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4338 0))(
  ( (BitStream!4339 (buf!2866 array!5374) (currentByte!5551 (_ BitVec 32)) (currentBit!5546 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10152 0))(
  ( (tuple2!10153 (_1!5341 BitStream!4338) (_2!5341 (_ BitVec 64))) )
))
(declare-fun lt!188968 () tuple2!10152)

(declare-datatypes ((tuple2!10154 0))(
  ( (tuple2!10155 (_1!5342 BitStream!4338) (_2!5342 BitStream!4338)) )
))
(declare-fun lt!188952 () tuple2!10154)

(declare-fun lt!188967 () tuple2!10152)

(declare-fun lt!188970 () BitStream!4338)

(assert (=> b!120984 (= e!79242 (or (not (= (_1!5342 lt!188952) lt!188970)) (= (_2!5341 lt!188967) (_2!5341 lt!188968))))))

(declare-fun e!79234 () Bool)

(assert (=> b!120984 e!79234))

(declare-fun res!100191 () Bool)

(assert (=> b!120984 (=> (not res!100191) (not e!79234))))

(declare-fun lt!188951 () (_ BitVec 64))

(declare-fun lt!188961 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4338 (_ BitVec 64)) BitStream!4338)

(assert (=> b!120984 (= res!100191 (= (_1!5342 lt!188952) (withMovedBitIndex!0 (_2!5342 lt!188952) (bvsub lt!188961 lt!188951))))))

(declare-datatypes ((Unit!7455 0))(
  ( (Unit!7456) )
))
(declare-datatypes ((tuple2!10156 0))(
  ( (tuple2!10157 (_1!5343 Unit!7455) (_2!5343 BitStream!4338)) )
))
(declare-fun lt!188949 () tuple2!10156)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120984 (= lt!188961 (bitIndex!0 (size!2432 (buf!2866 (_2!5343 lt!188949))) (currentByte!5551 (_2!5343 lt!188949)) (currentBit!5546 (_2!5343 lt!188949))))))

(declare-fun lt!188972 () tuple2!10154)

(declare-fun lt!188969 () (_ BitVec 64))

(assert (=> b!120984 (= (_1!5342 lt!188972) (withMovedBitIndex!0 (_2!5342 lt!188972) (bvsub lt!188969 lt!188951)))))

(declare-fun lt!188965 () tuple2!10156)

(assert (=> b!120984 (= lt!188951 (bitIndex!0 (size!2432 (buf!2866 (_2!5343 lt!188965))) (currentByte!5551 (_2!5343 lt!188965)) (currentBit!5546 (_2!5343 lt!188965))))))

(declare-fun thiss!1305 () BitStream!4338)

(assert (=> b!120984 (= lt!188969 (bitIndex!0 (size!2432 (buf!2866 thiss!1305)) (currentByte!5551 thiss!1305) (currentBit!5546 thiss!1305)))))

(declare-fun lt!188960 () tuple2!10152)

(assert (=> b!120984 (and (= (_2!5341 lt!188967) (_2!5341 lt!188960)) (= (_1!5341 lt!188967) (_1!5341 lt!188960)))))

(declare-fun lt!188956 () Unit!7455)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!188971 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7455)

(assert (=> b!120984 (= lt!188956 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5342 lt!188972) nBits!396 i!615 lt!188971))))

(declare-fun lt!188953 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10152)

(assert (=> b!120984 (= lt!188960 (readNLeastSignificantBitsLoopPure!0 lt!188970 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188953))))

(assert (=> b!120984 (= lt!188970 (withMovedBitIndex!0 (_1!5342 lt!188972) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!120985 () Bool)

(declare-fun e!79236 () Bool)

(declare-fun e!79233 () Bool)

(assert (=> b!120985 (= e!79236 e!79233)))

(declare-fun res!100190 () Bool)

(assert (=> b!120985 (=> (not res!100190) (not e!79233))))

(declare-fun lt!188948 () (_ BitVec 64))

(declare-fun lt!188950 () (_ BitVec 64))

(assert (=> b!120985 (= res!100190 (= lt!188948 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!188950)))))

(assert (=> b!120985 (= lt!188948 (bitIndex!0 (size!2432 (buf!2866 (_2!5343 lt!188949))) (currentByte!5551 (_2!5343 lt!188949)) (currentBit!5546 (_2!5343 lt!188949))))))

(assert (=> b!120985 (= lt!188950 (bitIndex!0 (size!2432 (buf!2866 thiss!1305)) (currentByte!5551 thiss!1305) (currentBit!5546 thiss!1305)))))

(declare-fun b!120986 () Bool)

(declare-fun e!79232 () Bool)

(assert (=> b!120986 (= e!79233 e!79232)))

(declare-fun res!100192 () Bool)

(assert (=> b!120986 (=> (not res!100192) (not e!79232))))

(declare-datatypes ((tuple2!10158 0))(
  ( (tuple2!10159 (_1!5344 BitStream!4338) (_2!5344 Bool)) )
))
(declare-fun lt!188975 () tuple2!10158)

(declare-fun lt!188963 () Bool)

(assert (=> b!120986 (= res!100192 (and (= (_2!5344 lt!188975) lt!188963) (= (_1!5344 lt!188975) (_2!5343 lt!188949))))))

(declare-fun readBitPure!0 (BitStream!4338) tuple2!10158)

(declare-fun readerFrom!0 (BitStream!4338 (_ BitVec 32) (_ BitVec 32)) BitStream!4338)

(assert (=> b!120986 (= lt!188975 (readBitPure!0 (readerFrom!0 (_2!5343 lt!188949) (currentBit!5546 thiss!1305) (currentByte!5551 thiss!1305))))))

(declare-fun b!120987 () Bool)

(declare-fun res!100185 () Bool)

(declare-fun e!79235 () Bool)

(assert (=> b!120987 (=> (not res!100185) (not e!79235))))

(assert (=> b!120987 (= res!100185 (bvslt i!615 nBits!396))))

(declare-fun b!120988 () Bool)

(declare-fun res!100182 () Bool)

(assert (=> b!120988 (=> (not res!100182) (not e!79235))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120988 (= res!100182 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!120989 () Bool)

(declare-fun res!100184 () Bool)

(declare-fun e!79238 () Bool)

(assert (=> b!120989 (=> (not res!100184) (not e!79238))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!120989 (= res!100184 (invariant!0 (currentBit!5546 thiss!1305) (currentByte!5551 thiss!1305) (size!2432 (buf!2866 (_2!5343 lt!188949)))))))

(declare-fun b!120990 () Bool)

(assert (=> b!120990 (= e!79234 (= lt!188969 (bvsub lt!188961 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!120991 () Bool)

(assert (=> b!120991 (= e!79238 (invariant!0 (currentBit!5546 thiss!1305) (currentByte!5551 thiss!1305) (size!2432 (buf!2866 (_2!5343 lt!188965)))))))

(declare-fun b!120992 () Bool)

(declare-fun e!79240 () Bool)

(assert (=> b!120992 (= e!79240 e!79235)))

(declare-fun res!100193 () Bool)

(assert (=> b!120992 (=> (not res!100193) (not e!79235))))

(declare-fun lt!188974 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120992 (= res!100193 (validate_offset_bits!1 ((_ sign_extend 32) (size!2432 (buf!2866 thiss!1305))) ((_ sign_extend 32) (currentByte!5551 thiss!1305)) ((_ sign_extend 32) (currentBit!5546 thiss!1305)) lt!188974))))

(assert (=> b!120992 (= lt!188974 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!120993 () Bool)

(declare-fun res!100183 () Bool)

(assert (=> b!120993 (=> (not res!100183) (not e!79233))))

(declare-fun isPrefixOf!0 (BitStream!4338 BitStream!4338) Bool)

(assert (=> b!120993 (= res!100183 (isPrefixOf!0 thiss!1305 (_2!5343 lt!188949)))))

(declare-fun b!120994 () Bool)

(declare-fun e!79239 () Bool)

(declare-fun array_inv!2234 (array!5374) Bool)

(assert (=> b!120994 (= e!79239 (array_inv!2234 (buf!2866 thiss!1305)))))

(declare-fun b!120996 () Bool)

(assert (=> b!120996 (= e!79235 (not e!79242))))

(declare-fun res!100186 () Bool)

(assert (=> b!120996 (=> res!100186 e!79242)))

(assert (=> b!120996 (= res!100186 (not (= (_1!5341 lt!188968) (_2!5342 lt!188952))))))

(assert (=> b!120996 (= lt!188968 (readNLeastSignificantBitsLoopPure!0 (_1!5342 lt!188952) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188953))))

(declare-fun lt!188976 () (_ BitVec 64))

(assert (=> b!120996 (validate_offset_bits!1 ((_ sign_extend 32) (size!2432 (buf!2866 (_2!5343 lt!188965)))) ((_ sign_extend 32) (currentByte!5551 (_2!5343 lt!188949))) ((_ sign_extend 32) (currentBit!5546 (_2!5343 lt!188949))) lt!188976)))

(declare-fun lt!188957 () Unit!7455)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4338 array!5374 (_ BitVec 64)) Unit!7455)

(assert (=> b!120996 (= lt!188957 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5343 lt!188949) (buf!2866 (_2!5343 lt!188965)) lt!188976))))

(assert (=> b!120996 (= lt!188976 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!188966 () (_ BitVec 64))

(declare-fun lt!188954 () tuple2!10158)

(assert (=> b!120996 (= lt!188953 (bvor lt!188971 (ite (_2!5344 lt!188954) lt!188966 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120996 (= lt!188967 (readNLeastSignificantBitsLoopPure!0 (_1!5342 lt!188972) nBits!396 i!615 lt!188971))))

(assert (=> b!120996 (validate_offset_bits!1 ((_ sign_extend 32) (size!2432 (buf!2866 (_2!5343 lt!188965)))) ((_ sign_extend 32) (currentByte!5551 thiss!1305)) ((_ sign_extend 32) (currentBit!5546 thiss!1305)) lt!188974)))

(declare-fun lt!188958 () Unit!7455)

(assert (=> b!120996 (= lt!188958 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2866 (_2!5343 lt!188965)) lt!188974))))

(assert (=> b!120996 (= lt!188971 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!120996 (= (_2!5344 lt!188954) lt!188963)))

(assert (=> b!120996 (= lt!188954 (readBitPure!0 (_1!5342 lt!188972)))))

(declare-fun reader!0 (BitStream!4338 BitStream!4338) tuple2!10154)

(assert (=> b!120996 (= lt!188952 (reader!0 (_2!5343 lt!188949) (_2!5343 lt!188965)))))

(assert (=> b!120996 (= lt!188972 (reader!0 thiss!1305 (_2!5343 lt!188965)))))

(declare-fun e!79237 () Bool)

(assert (=> b!120996 e!79237))

(declare-fun res!100188 () Bool)

(assert (=> b!120996 (=> (not res!100188) (not e!79237))))

(declare-fun lt!188962 () tuple2!10158)

(declare-fun lt!188959 () tuple2!10158)

(assert (=> b!120996 (= res!100188 (= (bitIndex!0 (size!2432 (buf!2866 (_1!5344 lt!188962))) (currentByte!5551 (_1!5344 lt!188962)) (currentBit!5546 (_1!5344 lt!188962))) (bitIndex!0 (size!2432 (buf!2866 (_1!5344 lt!188959))) (currentByte!5551 (_1!5344 lt!188959)) (currentBit!5546 (_1!5344 lt!188959)))))))

(declare-fun lt!188955 () Unit!7455)

(declare-fun lt!188973 () BitStream!4338)

(declare-fun readBitPrefixLemma!0 (BitStream!4338 BitStream!4338) Unit!7455)

(assert (=> b!120996 (= lt!188955 (readBitPrefixLemma!0 lt!188973 (_2!5343 lt!188965)))))

(assert (=> b!120996 (= lt!188959 (readBitPure!0 (BitStream!4339 (buf!2866 (_2!5343 lt!188965)) (currentByte!5551 thiss!1305) (currentBit!5546 thiss!1305))))))

(assert (=> b!120996 (= lt!188962 (readBitPure!0 lt!188973))))

(assert (=> b!120996 (= lt!188973 (BitStream!4339 (buf!2866 (_2!5343 lt!188949)) (currentByte!5551 thiss!1305) (currentBit!5546 thiss!1305)))))

(assert (=> b!120996 e!79238))

(declare-fun res!100194 () Bool)

(assert (=> b!120996 (=> (not res!100194) (not e!79238))))

(assert (=> b!120996 (= res!100194 (isPrefixOf!0 thiss!1305 (_2!5343 lt!188965)))))

(declare-fun lt!188964 () Unit!7455)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4338 BitStream!4338 BitStream!4338) Unit!7455)

(assert (=> b!120996 (= lt!188964 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5343 lt!188949) (_2!5343 lt!188965)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4338 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10156)

(assert (=> b!120996 (= lt!188965 (appendNLeastSignificantBitsLoop!0 (_2!5343 lt!188949) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!120996 e!79236))

(declare-fun res!100187 () Bool)

(assert (=> b!120996 (=> (not res!100187) (not e!79236))))

(assert (=> b!120996 (= res!100187 (= (size!2432 (buf!2866 thiss!1305)) (size!2432 (buf!2866 (_2!5343 lt!188949)))))))

(declare-fun appendBit!0 (BitStream!4338 Bool) tuple2!10156)

(assert (=> b!120996 (= lt!188949 (appendBit!0 thiss!1305 lt!188963))))

(assert (=> b!120996 (= lt!188963 (not (= (bvand v!199 lt!188966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120996 (= lt!188966 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!120997 () Bool)

(assert (=> b!120997 (= e!79237 (= (_2!5344 lt!188962) (_2!5344 lt!188959)))))

(declare-fun b!120995 () Bool)

(assert (=> b!120995 (= e!79232 (= (bitIndex!0 (size!2432 (buf!2866 (_1!5344 lt!188975))) (currentByte!5551 (_1!5344 lt!188975)) (currentBit!5546 (_1!5344 lt!188975))) lt!188948))))

(declare-fun res!100189 () Bool)

(assert (=> start!23914 (=> (not res!100189) (not e!79240))))

(assert (=> start!23914 (= res!100189 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23914 e!79240))

(assert (=> start!23914 true))

(declare-fun inv!12 (BitStream!4338) Bool)

(assert (=> start!23914 (and (inv!12 thiss!1305) e!79239)))

(assert (= (and start!23914 res!100189) b!120992))

(assert (= (and b!120992 res!100193) b!120988))

(assert (= (and b!120988 res!100182) b!120987))

(assert (= (and b!120987 res!100185) b!120996))

(assert (= (and b!120996 res!100187) b!120985))

(assert (= (and b!120985 res!100190) b!120993))

(assert (= (and b!120993 res!100183) b!120986))

(assert (= (and b!120986 res!100192) b!120995))

(assert (= (and b!120996 res!100194) b!120989))

(assert (= (and b!120989 res!100184) b!120991))

(assert (= (and b!120996 res!100188) b!120997))

(assert (= (and b!120996 (not res!100186)) b!120984))

(assert (= (and b!120984 res!100191) b!120990))

(assert (= start!23914 b!120994))

(declare-fun m!183103 () Bool)

(assert (=> b!120986 m!183103))

(assert (=> b!120986 m!183103))

(declare-fun m!183105 () Bool)

(assert (=> b!120986 m!183105))

(declare-fun m!183107 () Bool)

(assert (=> b!120988 m!183107))

(declare-fun m!183109 () Bool)

(assert (=> b!120994 m!183109))

(declare-fun m!183111 () Bool)

(assert (=> b!120985 m!183111))

(declare-fun m!183113 () Bool)

(assert (=> b!120985 m!183113))

(declare-fun m!183115 () Bool)

(assert (=> start!23914 m!183115))

(declare-fun m!183117 () Bool)

(assert (=> b!120992 m!183117))

(declare-fun m!183119 () Bool)

(assert (=> b!120991 m!183119))

(declare-fun m!183121 () Bool)

(assert (=> b!120995 m!183121))

(declare-fun m!183123 () Bool)

(assert (=> b!120996 m!183123))

(declare-fun m!183125 () Bool)

(assert (=> b!120996 m!183125))

(declare-fun m!183127 () Bool)

(assert (=> b!120996 m!183127))

(declare-fun m!183129 () Bool)

(assert (=> b!120996 m!183129))

(declare-fun m!183131 () Bool)

(assert (=> b!120996 m!183131))

(declare-fun m!183133 () Bool)

(assert (=> b!120996 m!183133))

(declare-fun m!183135 () Bool)

(assert (=> b!120996 m!183135))

(declare-fun m!183137 () Bool)

(assert (=> b!120996 m!183137))

(declare-fun m!183139 () Bool)

(assert (=> b!120996 m!183139))

(declare-fun m!183141 () Bool)

(assert (=> b!120996 m!183141))

(declare-fun m!183143 () Bool)

(assert (=> b!120996 m!183143))

(declare-fun m!183145 () Bool)

(assert (=> b!120996 m!183145))

(declare-fun m!183147 () Bool)

(assert (=> b!120996 m!183147))

(declare-fun m!183149 () Bool)

(assert (=> b!120996 m!183149))

(declare-fun m!183151 () Bool)

(assert (=> b!120996 m!183151))

(declare-fun m!183153 () Bool)

(assert (=> b!120996 m!183153))

(declare-fun m!183155 () Bool)

(assert (=> b!120996 m!183155))

(declare-fun m!183157 () Bool)

(assert (=> b!120996 m!183157))

(declare-fun m!183159 () Bool)

(assert (=> b!120996 m!183159))

(declare-fun m!183161 () Bool)

(assert (=> b!120984 m!183161))

(declare-fun m!183163 () Bool)

(assert (=> b!120984 m!183163))

(declare-fun m!183165 () Bool)

(assert (=> b!120984 m!183165))

(assert (=> b!120984 m!183113))

(declare-fun m!183167 () Bool)

(assert (=> b!120984 m!183167))

(declare-fun m!183169 () Bool)

(assert (=> b!120984 m!183169))

(assert (=> b!120984 m!183111))

(declare-fun m!183171 () Bool)

(assert (=> b!120984 m!183171))

(declare-fun m!183173 () Bool)

(assert (=> b!120993 m!183173))

(declare-fun m!183175 () Bool)

(assert (=> b!120989 m!183175))

(check-sat (not b!120985) (not b!120993) (not b!120991) (not b!120989) (not b!120996) (not b!120995) (not b!120984) (not b!120992) (not start!23914) (not b!120988) (not b!120986) (not b!120994))
