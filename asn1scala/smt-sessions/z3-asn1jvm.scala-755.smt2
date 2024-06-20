; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21618 () Bool)

(assert start!21618)

(declare-fun b!109212 () Bool)

(declare-datatypes ((array!4981 0))(
  ( (array!4982 (arr!2860 (Array (_ BitVec 32) (_ BitVec 8))) (size!2267 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4008 0))(
  ( (BitStream!4009 (buf!2658 array!4981) (currentByte!5194 (_ BitVec 32)) (currentBit!5189 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9068 0))(
  ( (tuple2!9069 (_1!4791 BitStream!4008) (_2!4791 BitStream!4008)) )
))
(declare-fun lt!165007 () tuple2!9068)

(declare-fun e!71562 () Bool)

(declare-fun lt!165003 () BitStream!4008)

(declare-datatypes ((tuple2!9070 0))(
  ( (tuple2!9071 (_1!4792 BitStream!4008) (_2!4792 (_ BitVec 64))) )
))
(declare-fun lt!165009 () tuple2!9070)

(declare-fun lt!165016 () (_ BitVec 64))

(declare-fun lt!165010 () (_ BitVec 64))

(declare-fun lt!165006 () tuple2!9068)

(declare-fun lt!164992 () tuple2!9070)

(assert (=> b!109212 (= e!71562 (and (= lt!165010 (bvsub lt!165016 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4791 lt!165006) lt!165003)) (and (= (_2!4792 lt!165009) (_2!4792 lt!164992)) (= (_1!4792 lt!165009) (_2!4791 lt!165007))))))))

(declare-fun b!109213 () Bool)

(declare-fun e!71563 () Bool)

(declare-fun e!71555 () Bool)

(assert (=> b!109213 (= e!71563 e!71555)))

(declare-fun res!90100 () Bool)

(assert (=> b!109213 (=> (not res!90100) (not e!71555))))

(declare-datatypes ((Unit!6675 0))(
  ( (Unit!6676) )
))
(declare-datatypes ((tuple2!9072 0))(
  ( (tuple2!9073 (_1!4793 Unit!6675) (_2!4793 BitStream!4008)) )
))
(declare-fun lt!165018 () tuple2!9072)

(declare-fun lt!165020 () Bool)

(declare-datatypes ((tuple2!9074 0))(
  ( (tuple2!9075 (_1!4794 BitStream!4008) (_2!4794 Bool)) )
))
(declare-fun lt!165015 () tuple2!9074)

(assert (=> b!109213 (= res!90100 (and (= (_2!4794 lt!165015) lt!165020) (= (_1!4794 lt!165015) (_2!4793 lt!165018))))))

(declare-fun thiss!1305 () BitStream!4008)

(declare-fun readBitPure!0 (BitStream!4008) tuple2!9074)

(declare-fun readerFrom!0 (BitStream!4008 (_ BitVec 32) (_ BitVec 32)) BitStream!4008)

(assert (=> b!109213 (= lt!165015 (readBitPure!0 (readerFrom!0 (_2!4793 lt!165018) (currentBit!5189 thiss!1305) (currentByte!5194 thiss!1305))))))

(declare-fun b!109214 () Bool)

(declare-fun e!71564 () Bool)

(declare-fun array_inv!2069 (array!4981) Bool)

(assert (=> b!109214 (= e!71564 (array_inv!2069 (buf!2658 thiss!1305)))))

(declare-fun b!109215 () Bool)

(declare-fun e!71560 () Bool)

(declare-fun e!71561 () Bool)

(assert (=> b!109215 (= e!71560 e!71561)))

(declare-fun res!90098 () Bool)

(assert (=> b!109215 (=> (not res!90098) (not e!71561))))

(declare-fun lt!165001 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109215 (= res!90098 (validate_offset_bits!1 ((_ sign_extend 32) (size!2267 (buf!2658 thiss!1305))) ((_ sign_extend 32) (currentByte!5194 thiss!1305)) ((_ sign_extend 32) (currentBit!5189 thiss!1305)) lt!165001))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!109215 (= lt!165001 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109216 () Bool)

(declare-fun e!71558 () Bool)

(assert (=> b!109216 (= e!71558 e!71563)))

(declare-fun res!90099 () Bool)

(assert (=> b!109216 (=> (not res!90099) (not e!71563))))

(declare-fun lt!165004 () (_ BitVec 64))

(declare-fun lt!164995 () (_ BitVec 64))

(assert (=> b!109216 (= res!90099 (= lt!165004 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164995)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109216 (= lt!165004 (bitIndex!0 (size!2267 (buf!2658 (_2!4793 lt!165018))) (currentByte!5194 (_2!4793 lt!165018)) (currentBit!5189 (_2!4793 lt!165018))))))

(assert (=> b!109216 (= lt!164995 (bitIndex!0 (size!2267 (buf!2658 thiss!1305)) (currentByte!5194 thiss!1305) (currentBit!5189 thiss!1305)))))

(declare-fun b!109217 () Bool)

(declare-fun e!71559 () Bool)

(assert (=> b!109217 (= e!71561 (not e!71559))))

(declare-fun res!90103 () Bool)

(assert (=> b!109217 (=> res!90103 e!71559)))

(assert (=> b!109217 (= res!90103 (not (= (_1!4792 lt!164992) (_2!4791 lt!165006))))))

(declare-fun lt!164999 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9070)

(assert (=> b!109217 (= lt!164992 (readNLeastSignificantBitsLoopPure!0 (_1!4791 lt!165006) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164999))))

(declare-fun lt!164997 () tuple2!9072)

(declare-fun lt!165008 () (_ BitVec 64))

(assert (=> b!109217 (validate_offset_bits!1 ((_ sign_extend 32) (size!2267 (buf!2658 (_2!4793 lt!164997)))) ((_ sign_extend 32) (currentByte!5194 (_2!4793 lt!165018))) ((_ sign_extend 32) (currentBit!5189 (_2!4793 lt!165018))) lt!165008)))

(declare-fun lt!164994 () Unit!6675)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4008 array!4981 (_ BitVec 64)) Unit!6675)

(assert (=> b!109217 (= lt!164994 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4793 lt!165018) (buf!2658 (_2!4793 lt!164997)) lt!165008))))

(assert (=> b!109217 (= lt!165008 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!165019 () (_ BitVec 64))

(declare-fun lt!165011 () tuple2!9074)

(declare-fun lt!165014 () (_ BitVec 64))

(assert (=> b!109217 (= lt!164999 (bvor lt!165019 (ite (_2!4794 lt!165011) lt!165014 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109217 (= lt!165009 (readNLeastSignificantBitsLoopPure!0 (_1!4791 lt!165007) nBits!396 i!615 lt!165019))))

(assert (=> b!109217 (validate_offset_bits!1 ((_ sign_extend 32) (size!2267 (buf!2658 (_2!4793 lt!164997)))) ((_ sign_extend 32) (currentByte!5194 thiss!1305)) ((_ sign_extend 32) (currentBit!5189 thiss!1305)) lt!165001)))

(declare-fun lt!165005 () Unit!6675)

(assert (=> b!109217 (= lt!165005 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2658 (_2!4793 lt!164997)) lt!165001))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109217 (= lt!165019 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!109217 (= (_2!4794 lt!165011) lt!165020)))

(assert (=> b!109217 (= lt!165011 (readBitPure!0 (_1!4791 lt!165007)))))

(declare-fun reader!0 (BitStream!4008 BitStream!4008) tuple2!9068)

(assert (=> b!109217 (= lt!165006 (reader!0 (_2!4793 lt!165018) (_2!4793 lt!164997)))))

(assert (=> b!109217 (= lt!165007 (reader!0 thiss!1305 (_2!4793 lt!164997)))))

(declare-fun e!71554 () Bool)

(assert (=> b!109217 e!71554))

(declare-fun res!90107 () Bool)

(assert (=> b!109217 (=> (not res!90107) (not e!71554))))

(declare-fun lt!164993 () tuple2!9074)

(declare-fun lt!164998 () tuple2!9074)

(assert (=> b!109217 (= res!90107 (= (bitIndex!0 (size!2267 (buf!2658 (_1!4794 lt!164993))) (currentByte!5194 (_1!4794 lt!164993)) (currentBit!5189 (_1!4794 lt!164993))) (bitIndex!0 (size!2267 (buf!2658 (_1!4794 lt!164998))) (currentByte!5194 (_1!4794 lt!164998)) (currentBit!5189 (_1!4794 lt!164998)))))))

(declare-fun lt!165000 () Unit!6675)

(declare-fun lt!165012 () BitStream!4008)

(declare-fun readBitPrefixLemma!0 (BitStream!4008 BitStream!4008) Unit!6675)

(assert (=> b!109217 (= lt!165000 (readBitPrefixLemma!0 lt!165012 (_2!4793 lt!164997)))))

(assert (=> b!109217 (= lt!164998 (readBitPure!0 (BitStream!4009 (buf!2658 (_2!4793 lt!164997)) (currentByte!5194 thiss!1305) (currentBit!5189 thiss!1305))))))

(assert (=> b!109217 (= lt!164993 (readBitPure!0 lt!165012))))

(assert (=> b!109217 (= lt!165012 (BitStream!4009 (buf!2658 (_2!4793 lt!165018)) (currentByte!5194 thiss!1305) (currentBit!5189 thiss!1305)))))

(declare-fun e!71556 () Bool)

(assert (=> b!109217 e!71556))

(declare-fun res!90101 () Bool)

(assert (=> b!109217 (=> (not res!90101) (not e!71556))))

(declare-fun isPrefixOf!0 (BitStream!4008 BitStream!4008) Bool)

(assert (=> b!109217 (= res!90101 (isPrefixOf!0 thiss!1305 (_2!4793 lt!164997)))))

(declare-fun lt!165013 () Unit!6675)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4008 BitStream!4008 BitStream!4008) Unit!6675)

(assert (=> b!109217 (= lt!165013 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4793 lt!165018) (_2!4793 lt!164997)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4008 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9072)

(assert (=> b!109217 (= lt!164997 (appendNLeastSignificantBitsLoop!0 (_2!4793 lt!165018) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!109217 e!71558))

(declare-fun res!90104 () Bool)

(assert (=> b!109217 (=> (not res!90104) (not e!71558))))

(assert (=> b!109217 (= res!90104 (= (size!2267 (buf!2658 thiss!1305)) (size!2267 (buf!2658 (_2!4793 lt!165018)))))))

(declare-fun appendBit!0 (BitStream!4008 Bool) tuple2!9072)

(assert (=> b!109217 (= lt!165018 (appendBit!0 thiss!1305 lt!165020))))

(assert (=> b!109217 (= lt!165020 (not (= (bvand v!199 lt!165014) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109217 (= lt!165014 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109218 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109218 (= e!71556 (invariant!0 (currentBit!5189 thiss!1305) (currentByte!5194 thiss!1305) (size!2267 (buf!2658 (_2!4793 lt!164997)))))))

(declare-fun b!109219 () Bool)

(declare-fun res!90109 () Bool)

(assert (=> b!109219 (=> (not res!90109) (not e!71561))))

(assert (=> b!109219 (= res!90109 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109220 () Bool)

(assert (=> b!109220 (= e!71554 (= (_2!4794 lt!164993) (_2!4794 lt!164998)))))

(declare-fun res!90097 () Bool)

(assert (=> start!21618 (=> (not res!90097) (not e!71560))))

(assert (=> start!21618 (= res!90097 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21618 e!71560))

(assert (=> start!21618 true))

(declare-fun inv!12 (BitStream!4008) Bool)

(assert (=> start!21618 (and (inv!12 thiss!1305) e!71564)))

(declare-fun b!109221 () Bool)

(assert (=> b!109221 (= e!71559 true)))

(assert (=> b!109221 e!71562))

(declare-fun res!90105 () Bool)

(assert (=> b!109221 (=> (not res!90105) (not e!71562))))

(declare-fun lt!164996 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4008 (_ BitVec 64)) BitStream!4008)

(assert (=> b!109221 (= res!90105 (= (_1!4791 lt!165006) (withMovedBitIndex!0 (_2!4791 lt!165006) (bvsub lt!165016 lt!164996))))))

(assert (=> b!109221 (= lt!165016 (bitIndex!0 (size!2267 (buf!2658 (_2!4793 lt!165018))) (currentByte!5194 (_2!4793 lt!165018)) (currentBit!5189 (_2!4793 lt!165018))))))

(assert (=> b!109221 (= (_1!4791 lt!165007) (withMovedBitIndex!0 (_2!4791 lt!165007) (bvsub lt!165010 lt!164996)))))

(assert (=> b!109221 (= lt!164996 (bitIndex!0 (size!2267 (buf!2658 (_2!4793 lt!164997))) (currentByte!5194 (_2!4793 lt!164997)) (currentBit!5189 (_2!4793 lt!164997))))))

(assert (=> b!109221 (= lt!165010 (bitIndex!0 (size!2267 (buf!2658 thiss!1305)) (currentByte!5194 thiss!1305) (currentBit!5189 thiss!1305)))))

(declare-fun lt!165017 () tuple2!9070)

(assert (=> b!109221 (and (= (_2!4792 lt!165009) (_2!4792 lt!165017)) (= (_1!4792 lt!165009) (_1!4792 lt!165017)))))

(declare-fun lt!165002 () Unit!6675)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6675)

(assert (=> b!109221 (= lt!165002 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4791 lt!165007) nBits!396 i!615 lt!165019))))

(assert (=> b!109221 (= lt!165017 (readNLeastSignificantBitsLoopPure!0 lt!165003 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164999))))

(assert (=> b!109221 (= lt!165003 (withMovedBitIndex!0 (_1!4791 lt!165007) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109222 () Bool)

(declare-fun res!90106 () Bool)

(assert (=> b!109222 (=> (not res!90106) (not e!71561))))

(assert (=> b!109222 (= res!90106 (bvslt i!615 nBits!396))))

(declare-fun b!109223 () Bool)

(assert (=> b!109223 (= e!71555 (= (bitIndex!0 (size!2267 (buf!2658 (_1!4794 lt!165015))) (currentByte!5194 (_1!4794 lt!165015)) (currentBit!5189 (_1!4794 lt!165015))) lt!165004))))

(declare-fun b!109224 () Bool)

(declare-fun res!90102 () Bool)

(assert (=> b!109224 (=> (not res!90102) (not e!71556))))

(assert (=> b!109224 (= res!90102 (invariant!0 (currentBit!5189 thiss!1305) (currentByte!5194 thiss!1305) (size!2267 (buf!2658 (_2!4793 lt!165018)))))))

(declare-fun b!109225 () Bool)

(declare-fun res!90108 () Bool)

(assert (=> b!109225 (=> (not res!90108) (not e!71563))))

(assert (=> b!109225 (= res!90108 (isPrefixOf!0 thiss!1305 (_2!4793 lt!165018)))))

(assert (= (and start!21618 res!90097) b!109215))

(assert (= (and b!109215 res!90098) b!109219))

(assert (= (and b!109219 res!90109) b!109222))

(assert (= (and b!109222 res!90106) b!109217))

(assert (= (and b!109217 res!90104) b!109216))

(assert (= (and b!109216 res!90099) b!109225))

(assert (= (and b!109225 res!90108) b!109213))

(assert (= (and b!109213 res!90100) b!109223))

(assert (= (and b!109217 res!90101) b!109224))

(assert (= (and b!109224 res!90102) b!109218))

(assert (= (and b!109217 res!90107) b!109220))

(assert (= (and b!109217 (not res!90103)) b!109221))

(assert (= (and b!109221 res!90105) b!109212))

(assert (= start!21618 b!109214))

(declare-fun m!162061 () Bool)

(assert (=> b!109215 m!162061))

(declare-fun m!162063 () Bool)

(assert (=> b!109214 m!162063))

(declare-fun m!162065 () Bool)

(assert (=> b!109218 m!162065))

(declare-fun m!162067 () Bool)

(assert (=> b!109221 m!162067))

(declare-fun m!162069 () Bool)

(assert (=> b!109221 m!162069))

(declare-fun m!162071 () Bool)

(assert (=> b!109221 m!162071))

(declare-fun m!162073 () Bool)

(assert (=> b!109221 m!162073))

(declare-fun m!162075 () Bool)

(assert (=> b!109221 m!162075))

(declare-fun m!162077 () Bool)

(assert (=> b!109221 m!162077))

(declare-fun m!162079 () Bool)

(assert (=> b!109221 m!162079))

(declare-fun m!162081 () Bool)

(assert (=> b!109221 m!162081))

(declare-fun m!162083 () Bool)

(assert (=> b!109223 m!162083))

(declare-fun m!162085 () Bool)

(assert (=> b!109217 m!162085))

(declare-fun m!162087 () Bool)

(assert (=> b!109217 m!162087))

(declare-fun m!162089 () Bool)

(assert (=> b!109217 m!162089))

(declare-fun m!162091 () Bool)

(assert (=> b!109217 m!162091))

(declare-fun m!162093 () Bool)

(assert (=> b!109217 m!162093))

(declare-fun m!162095 () Bool)

(assert (=> b!109217 m!162095))

(declare-fun m!162097 () Bool)

(assert (=> b!109217 m!162097))

(declare-fun m!162099 () Bool)

(assert (=> b!109217 m!162099))

(declare-fun m!162101 () Bool)

(assert (=> b!109217 m!162101))

(declare-fun m!162103 () Bool)

(assert (=> b!109217 m!162103))

(declare-fun m!162105 () Bool)

(assert (=> b!109217 m!162105))

(declare-fun m!162107 () Bool)

(assert (=> b!109217 m!162107))

(declare-fun m!162109 () Bool)

(assert (=> b!109217 m!162109))

(declare-fun m!162111 () Bool)

(assert (=> b!109217 m!162111))

(declare-fun m!162113 () Bool)

(assert (=> b!109217 m!162113))

(declare-fun m!162115 () Bool)

(assert (=> b!109217 m!162115))

(declare-fun m!162117 () Bool)

(assert (=> b!109217 m!162117))

(declare-fun m!162119 () Bool)

(assert (=> b!109217 m!162119))

(declare-fun m!162121 () Bool)

(assert (=> b!109217 m!162121))

(assert (=> b!109216 m!162071))

(assert (=> b!109216 m!162073))

(declare-fun m!162123 () Bool)

(assert (=> b!109213 m!162123))

(assert (=> b!109213 m!162123))

(declare-fun m!162125 () Bool)

(assert (=> b!109213 m!162125))

(declare-fun m!162127 () Bool)

(assert (=> b!109219 m!162127))

(declare-fun m!162129 () Bool)

(assert (=> start!21618 m!162129))

(declare-fun m!162131 () Bool)

(assert (=> b!109224 m!162131))

(declare-fun m!162133 () Bool)

(assert (=> b!109225 m!162133))

(check-sat (not b!109221) (not b!109225) (not start!21618) (not b!109215) (not b!109224) (not b!109218) (not b!109217) (not b!109219) (not b!109214) (not b!109223) (not b!109216) (not b!109213))
